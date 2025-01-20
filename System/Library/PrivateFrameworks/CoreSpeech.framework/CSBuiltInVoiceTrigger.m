@interface CSBuiltInVoiceTrigger
- (BOOL)_hasHFPDuringPhoneCall;
- (BOOL)_hasHearstRoutedAndNotInSplitter;
- (BOOL)_hasPhoneCallOnNonBargeInDevice;
- (BOOL)_isBuiltInAOPVoiceTriggerEvent:(id)a3;
- (BOOL)_isVoiceTriggerStateTransitionEvent:(id)a3;
- (BOOL)_shouldCancelSecondPassResultWithVoiceTriggerInfo:(id)a3;
- (BOOL)_shouldCheckHearstStatus;
- (BOOL)_shouldEnableAOPVoiceTrigger;
- (BOOL)_shouldEnableAPVoiceTrigger;
- (BOOL)_shouldHandleAOPVoiceTrigger;
- (BOOL)_shouldReuseBuiltInAudioProvider;
- (BOOL)_shouldSecondPassKeepAlive;
- (BOOL)_shouldSkipAudioChunkHandling;
- (BOOL)firstTimeAssetConfigured;
- (BOOL)hasTriggerPending;
- (BOOL)isFirstExclaveAudioBuffer;
- (BOOL)isJarvisConnected;
- (BOOL)isListenPollingStarting;
- (BOOL)isPhraseSpotterBypassed;
- (BOOL)isSecondPassRunning;
- (BOOL)isSiriClientListening;
- (BOOL)shouldDisableOnSpeakerVerificationInSplitterMode;
- (BOOL)voiceTriggerEnabled;
- (CSAsset)currentAsset;
- (CSAudioProvider)audioProvider;
- (CSAudioRouteChangeMonitor)audioRouteChangeMonitor;
- (CSAudioStream)audioStream;
- (CSBuiltInVoiceTrigger)initWithTargetQueue:(id)a3 withSpeechManager:(id)a4;
- (CSBuiltInVoiceTrigger)initWithTargetQueue:(id)a3 withSpeechManager:(id)a4 withAudioRouteChangeMonitor:(id)a5;
- (CSExclaveAssetsControlling)exclaveAssetsController;
- (CSExclaveFirstPassVoiceTriggerAnalyzing)exclaveClient;
- (CSKeywordAnalyzerNDAPIResult)lastTriggeredOnsetResult;
- (CSKeywordAnalyzerNDAPIResult)onsetResult;
- (CSOSTransaction)secondPassTransaction;
- (CSPolicy)voiceTriggerAPModeSuspendPolicy;
- (CSPolicy)voiceTriggerStartPolicy;
- (CSSecondPassProgressDelegate)secondPassProgressDelegate;
- (CSSpeechManager)speechManager;
- (CSStateCapture)stateCapture;
- (CSStateMachine)stateMachine;
- (CSVoiceTriggerAlwaysOnProcessor)alwaysOnProcessorController;
- (CSVoiceTriggerDelegate)delegate;
- (CSVoiceTriggerFirstPassConfig)firstPassConfig;
- (CSVoiceTriggerSecondChanceContext)secondChanceContext;
- (CSVoiceTriggerSecondPass)voiceTriggerSecondPass;
- (CSVoiceTriggerUserSelectedPhrase)multiPhraseSelectedStatus;
- (NSDictionary)channelSelectionScores;
- (NSMutableArray)assetConfigWaitingBuffer;
- (NSMutableArray)audioStreamHoldings;
- (NSMutableArray)keywordAnalyzersNDAPI;
- (NSNumber)firstPassMyriadGoodness;
- (NSString)name;
- (OS_dispatch_group)recordingWillStartGroup;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)validationTimer;
- (OpaqueFigEndpoint)carPlayEndpoint;
- (float)bestScore;
- (id)_eventName:(unint64_t)a3;
- (id)_firstPassVoiceTriggerSignalEstimate;
- (id)_stateName:(unint64_t)a3;
- (id)_voiceTriggerFirstPassInfoFromAP;
- (int64_t)_currentJarvisTriggerMode;
- (int64_t)hearstRouteStatus;
- (unint64_t)_currentState;
- (unint64_t)attSiriState;
- (unint64_t)bestChannel;
- (unint64_t)channelSelectionDelay;
- (unint64_t)currentSplitterState;
- (unint64_t)delayInSamplesRequiredForChannelSelection;
- (unint64_t)heartbeatFactor;
- (unint64_t)lastSelfTriggerDetectedStartMachTime;
- (unint64_t)lastTriggeredBestChannel;
- (unint64_t)onsetChannel;
- (unint64_t)phoneCallState;
- (unint64_t)processingChunkSamples;
- (unsigned)jarvisTriggerModeLogHeartbeat;
- (void)CSAudioRouteChangeMonitor:(id)a3 didReceiveAudioRouteChangeEvent:(int64_t)a4;
- (void)CSAudioServerCrashMonitorDidReceiveServerCrash:(id)a3;
- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3;
- (void)CSBluetoothWirelessSplitterMonitor:(id)a3 didReceiveSplitterStateChange:(unint64_t)a4 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a5;
- (void)CSPhoneCallStateMonitor:(id)a3 didRecievePhoneCallStateChange:(unint64_t)a4;
- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4;
- (void)CSVoiceTriggerXPCServiceProxy:(id)a3 bypassPhraseSpotter:(BOOL)a4;
- (void)_APModeValidationTimerFired;
- (void)_addAudioStreamHold:(id)a3;
- (void)_cancelAllAudioStreamHold;
- (void)_cancelLastAudioStreamHold;
- (void)_createSecondPassIfNeededWithFirstPassSource:(unint64_t)a3;
- (void)_forceUpdateCarPlayEndpointWithJarvisConnected:(BOOL)a3;
- (void)_handleAudioChunk:(id)a3;
- (void)_handleSecondPassResult:(id)a3 deviceId:(id)a4 error:(id)a5;
- (void)_handleVoiceTriggerSecondPassWithSource:(unint64_t)a3 deviceId:(id)a4 event:(id)a5 audioProviderUUID:(id)a6 firstPassInfo:(id)a7;
- (void)_keywordAnalyzerNDAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5;
- (void)_notifyEvent:(unint64_t)a3;
- (void)_receivedHearstRoutedEvent:(int64_t)a3;
- (void)_receivedJarvisConnectionEvent:(BOOL)a3;
- (void)_reportVoiceTriggerFirstPassFireFromAPWithSource:(unint64_t)a3 voiceTriggerFirstPassInfo:(id)a4;
- (void)_requestStartAudioStreamWithSource:(unint64_t)a3 context:(id)a4 completion:(id)a5;
- (void)_reset;
- (void)_resetFirstExclaveAudioBufferMarkerIfNeeded;
- (void)_setAsset:(id)a3 forceExclaveToUsePreInstalledAsset:(BOOL)a4;
- (void)_setIsSecondPassRunning:(BOOL)a3;
- (void)_setupStateMachine;
- (void)_startAOPVoiceTrigger;
- (void)_startAPVoiceTriggerWithCompletion:(id)a3;
- (void)_startListenPollingWithInterval:(double)a3 completion:(id)a4;
- (void)_startListenWithCompletion:(id)a3;
- (void)_startVoiceTriggerWithCompletion:(id)a3;
- (void)_stopAOPVoiceTrigger;
- (void)_stopAPVoiceTrigger;
- (void)_stopListening;
- (void)_teardownSecondPassIfNeeded;
- (void)_transitAOPModeIfNeeded:(BOOL)a3;
- (void)_transitAOPModeIfNeededAsync:(BOOL)a3;
- (void)_transitAOPModeIfNeededSync:(BOOL)a3;
- (void)_transitVoiceTriggerStatus:(BOOL)a3 force:(BOOL)a4;
- (void)_updateCurrentSplitterState:(unint64_t)a3 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a4;
- (void)activationEventNotificationHandler:(id)a3 event:(id)a4 completion:(id)a5;
- (void)attSiriStateMonitor:(id)a3 didRecieveAttSiriStateChange:(unint64_t)a4;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)audioStreamProvider:(id)a3 numSamplesAvailableInExclave:(unint64_t)a4 hostTime:(unint64_t)a5 arrivalHostTimeToAudioRecorder:(unint64_t)a6 exclaveSampleCount:(unint64_t)a7;
- (void)cancelSecondPassRunning;
- (void)didIgnoreEvent:(int64_t)a3 from:(int64_t)a4;
- (void)didTransitFrom:(int64_t)a3 to:(int64_t)a4 by:(int64_t)a5;
- (void)pendingSecondPassTriggerWasClearedForClient:(unint64_t)a3 deviceId:(id)a4;
- (void)reset;
- (void)selfTriggerDetector:(id)a3 didDetectSelfTrigger:(id)a4;
- (void)setAlwaysOnProcessorController:(id)a3;
- (void)setAsset:(id)a3;
- (void)setAsset:(id)a3 forceExclaveToUsePreInstalledAsset:(BOOL)a4;
- (void)setAssetConfigWaitingBuffer:(id)a3;
- (void)setAttSiriState:(unint64_t)a3;
- (void)setAudioProvider:(id)a3;
- (void)setAudioRouteChangeMonitor:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setAudioStreamHoldings:(id)a3;
- (void)setBestChannel:(unint64_t)a3;
- (void)setBestScore:(float)a3;
- (void)setCarPlayEndpoint:(OpaqueFigEndpoint *)a3;
- (void)setChannelSelectionDelay:(unint64_t)a3;
- (void)setChannelSelectionScores:(id)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setCurrentSplitterState:(unint64_t)a3;
- (void)setDelayInSamplesRequiredForChannelSelection:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setExclaveAssetsController:(id)a3;
- (void)setExclaveClient:(id)a3;
- (void)setFirstPassConfig:(id)a3;
- (void)setFirstPassMyriadGoodness:(id)a3;
- (void)setFirstTimeAssetConfigured:(BOOL)a3;
- (void)setHasTriggerPending:(BOOL)a3;
- (void)setHearstRouteStatus:(int64_t)a3;
- (void)setHeartbeatFactor:(unint64_t)a3;
- (void)setIsFirstExclaveAudioBuffer:(BOOL)a3;
- (void)setIsJarvisConnected:(BOOL)a3;
- (void)setIsListenPollingStarting:(BOOL)a3;
- (void)setIsPhraseSpotterBypassed:(BOOL)a3;
- (void)setIsSecondPassRunning:(BOOL)a3;
- (void)setIsSiriClientListening:(BOOL)a3;
- (void)setJarvisTriggerModeLogHeartbeat:(unsigned __int8)a3;
- (void)setKeywordAnalyzersNDAPI:(id)a3;
- (void)setLastSelfTriggerDetectedStartMachTime:(unint64_t)a3;
- (void)setLastTriggeredBestChannel:(unint64_t)a3;
- (void)setLastTriggeredOnsetResult:(id)a3;
- (void)setMultiPhraseSelectedStatus:(id)a3;
- (void)setName:(id)a3;
- (void)setOnsetChannel:(unint64_t)a3;
- (void)setOnsetResult:(id)a3;
- (void)setPhoneCallState:(unint64_t)a3;
- (void)setProcessingChunkSamples:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)setRecordingWillStartGroup:(id)a3;
- (void)setSecondChanceContext:(id)a3;
- (void)setSecondPassProgressDelegate:(id)a3;
- (void)setSecondPassTransaction:(id)a3;
- (void)setShouldDisableOnSpeakerVerificationInSplitterMode:(BOOL)a3;
- (void)setSpeechManager:(id)a3;
- (void)setStateCapture:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setValidationTimer:(id)a3;
- (void)setVoiceTriggerAPModeSuspendPolicy:(id)a3;
- (void)setVoiceTriggerEnabled:(BOOL)a3;
- (void)setVoiceTriggerSecondPass:(id)a3;
- (void)setVoiceTriggerStartPolicy:(id)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5;
- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5;
- (void)start;
@end

@implementation CSBuiltInVoiceTrigger

- (void)_transitAOPModeIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    int v7 = 136315650;
    v8 = "-[CSBuiltInVoiceTrigger _transitAOPModeIfNeeded:]";
    __int16 v9 = 1024;
    unsigned int v10 = [(CSBuiltInVoiceTrigger *)self voiceTriggerEnabled];
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s voiceTriggerEnabled : %d, enable AOP mode : %d", (uint8_t *)&v7, 0x18u);
  }
  if ([(CSBuiltInVoiceTrigger *)self voiceTriggerEnabled]) {
    [(CSBuiltInVoiceTrigger *)self _notifyEvent:v3];
  }
}

- (BOOL)voiceTriggerEnabled
{
  return self->_voiceTriggerEnabled;
}

- (void)_transitAOPModeIfNeededAsync:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004AE4;
  v4[3] = &unk_100253AB8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclaveAssetsController, 0);
  objc_storeStrong((id *)&self->_exclaveClient, 0);
  objc_storeStrong((id *)&self->_multiPhraseSelectedStatus, 0);
  objc_storeStrong((id *)&self->_stateCapture, 0);
  objc_storeStrong((id *)&self->_speechManager, 0);
  objc_storeStrong((id *)&self->_audioRouteChangeMonitor, 0);
  objc_storeStrong((id *)&self->_secondChanceContext, 0);
  objc_storeStrong((id *)&self->_firstPassMyriadGoodness, 0);
  objc_storeStrong((id *)&self->_validationTimer, 0);
  objc_storeStrong((id *)&self->_assetConfigWaitingBuffer, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_recordingWillStartGroup, 0);
  objc_storeStrong((id *)&self->_alwaysOnProcessorController, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_voiceTriggerAPModeSuspendPolicy, 0);
  objc_storeStrong((id *)&self->_secondPassTransaction, 0);
  objc_storeStrong((id *)&self->_audioStreamHoldings, 0);
  objc_storeStrong((id *)&self->_audioProvider, 0);
  objc_storeStrong((id *)&self->_voiceTriggerSecondPass, 0);
  objc_storeStrong((id *)&self->_channelSelectionScores, 0);
  objc_storeStrong((id *)&self->_lastTriggeredOnsetResult, 0);
  objc_storeStrong((id *)&self->_onsetResult, 0);
  objc_storeStrong((id *)&self->_firstPassConfig, 0);
  objc_storeStrong((id *)&self->_keywordAnalyzersNDAPI, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_voiceTriggerStartPolicy, 0);
  objc_destroyWeak((id *)&self->_secondPassProgressDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setExclaveAssetsController:(id)a3
{
}

- (CSExclaveAssetsControlling)exclaveAssetsController
{
  return self->_exclaveAssetsController;
}

- (void)setExclaveClient:(id)a3
{
}

- (CSExclaveFirstPassVoiceTriggerAnalyzing)exclaveClient
{
  return self->_exclaveClient;
}

- (void)setMultiPhraseSelectedStatus:(id)a3
{
}

- (CSVoiceTriggerUserSelectedPhrase)multiPhraseSelectedStatus
{
  return self->_multiPhraseSelectedStatus;
}

- (void)setCarPlayEndpoint:(OpaqueFigEndpoint *)a3
{
  self->_carPlayEndpoint = a3;
}

- (OpaqueFigEndpoint)carPlayEndpoint
{
  return self->_carPlayEndpoint;
}

- (void)setIsFirstExclaveAudioBuffer:(BOOL)a3
{
  self->_isFirstExclaveAudioBuffer = a3;
}

- (BOOL)isFirstExclaveAudioBuffer
{
  return self->_isFirstExclaveAudioBuffer;
}

- (void)setJarvisTriggerModeLogHeartbeat:(unsigned __int8)a3
{
  self->_jarvisTriggerModeLogHeartbeat = a3;
}

- (unsigned)jarvisTriggerModeLogHeartbeat
{
  return self->_jarvisTriggerModeLogHeartbeat;
}

- (void)setStateCapture:(id)a3
{
}

- (CSStateCapture)stateCapture
{
  return self->_stateCapture;
}

- (void)setHeartbeatFactor:(unint64_t)a3
{
  self->_heartbeatFactor = a3;
}

- (unint64_t)heartbeatFactor
{
  return self->_heartbeatFactor;
}

- (void)setLastSelfTriggerDetectedStartMachTime:(unint64_t)a3
{
  self->_lastSelfTriggerDetectedStartMachTime = a3;
}

- (unint64_t)lastSelfTriggerDetectedStartMachTime
{
  return self->_lastSelfTriggerDetectedStartMachTime;
}

- (void)setSpeechManager:(id)a3
{
}

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setAudioRouteChangeMonitor:(id)a3
{
}

- (CSAudioRouteChangeMonitor)audioRouteChangeMonitor
{
  return self->_audioRouteChangeMonitor;
}

- (void)setSecondChanceContext:(id)a3
{
}

- (CSVoiceTriggerSecondChanceContext)secondChanceContext
{
  return self->_secondChanceContext;
}

- (void)setIsJarvisConnected:(BOOL)a3
{
  self->_isJarvisConnected = a3;
}

- (BOOL)isJarvisConnected
{
  return self->_isJarvisConnected;
}

- (void)setAttSiriState:(unint64_t)a3
{
  self->_attSiriState = a3;
}

- (unint64_t)attSiriState
{
  return self->_attSiriState;
}

- (void)setPhoneCallState:(unint64_t)a3
{
  self->_phoneCallState = a3;
}

- (unint64_t)phoneCallState
{
  return self->_phoneCallState;
}

- (void)setFirstPassMyriadGoodness:(id)a3
{
}

- (NSNumber)firstPassMyriadGoodness
{
  return self->_firstPassMyriadGoodness;
}

- (void)setValidationTimer:(id)a3
{
}

- (OS_dispatch_source)validationTimer
{
  return self->_validationTimer;
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

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setShouldDisableOnSpeakerVerificationInSplitterMode:(BOOL)a3
{
  self->_shouldDisableOnSpeakerVerificationInSplitterMode = a3;
}

- (BOOL)shouldDisableOnSpeakerVerificationInSplitterMode
{
  return self->_shouldDisableOnSpeakerVerificationInSplitterMode;
}

- (void)setCurrentSplitterState:(unint64_t)a3
{
  self->_currentSplitterState = a3;
}

- (unint64_t)currentSplitterState
{
  return self->_currentSplitterState;
}

- (void)setRecordingWillStartGroup:(id)a3
{
}

- (OS_dispatch_group)recordingWillStartGroup
{
  return self->_recordingWillStartGroup;
}

- (void)setAlwaysOnProcessorController:(id)a3
{
}

- (CSVoiceTriggerAlwaysOnProcessor)alwaysOnProcessorController
{
  return self->_alwaysOnProcessorController;
}

- (void)setStateMachine:(id)a3
{
}

- (CSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setVoiceTriggerAPModeSuspendPolicy:(id)a3
{
}

- (CSPolicy)voiceTriggerAPModeSuspendPolicy
{
  return self->_voiceTriggerAPModeSuspendPolicy;
}

- (void)setHearstRouteStatus:(int64_t)a3
{
  self->_hearstRouteStatus = a3;
}

- (int64_t)hearstRouteStatus
{
  return self->_hearstRouteStatus;
}

- (void)setIsPhraseSpotterBypassed:(BOOL)a3
{
  self->_isPhraseSpotterBypassed = a3;
}

- (BOOL)isPhraseSpotterBypassed
{
  return self->_isPhraseSpotterBypassed;
}

- (void)setSecondPassTransaction:(id)a3
{
}

- (CSOSTransaction)secondPassTransaction
{
  return self->_secondPassTransaction;
}

- (void)setAudioStreamHoldings:(id)a3
{
}

- (NSMutableArray)audioStreamHoldings
{
  return self->_audioStreamHoldings;
}

- (void)setAudioProvider:(id)a3
{
}

- (CSAudioProvider)audioProvider
{
  return self->_audioProvider;
}

- (void)setIsListenPollingStarting:(BOOL)a3
{
  self->_isListenPollingStarting = a3;
}

- (BOOL)isListenPollingStarting
{
  return self->_isListenPollingStarting;
}

- (void)setIsSiriClientListening:(BOOL)a3
{
  self->_isSiriClientListening = a3;
}

- (BOOL)isSiriClientListening
{
  return self->_isSiriClientListening;
}

- (void)setIsSecondPassRunning:(BOOL)a3
{
  self->_isSecondPassRunning = a3;
}

- (BOOL)isSecondPassRunning
{
  return self->_isSecondPassRunning;
}

- (void)setVoiceTriggerSecondPass:(id)a3
{
}

- (CSVoiceTriggerSecondPass)voiceTriggerSecondPass
{
  return self->_voiceTriggerSecondPass;
}

- (void)setProcessingChunkSamples:(unint64_t)a3
{
  self->_processingChunkSamples = a3;
}

- (unint64_t)processingChunkSamples
{
  return self->_processingChunkSamples;
}

- (void)setChannelSelectionScores:(id)a3
{
}

- (NSDictionary)channelSelectionScores
{
  return self->_channelSelectionScores;
}

- (void)setDelayInSamplesRequiredForChannelSelection:(unint64_t)a3
{
  self->_delayInSamplesRequiredForChannelSelection = a3;
}

- (unint64_t)delayInSamplesRequiredForChannelSelection
{
  return self->_delayInSamplesRequiredForChannelSelection;
}

- (void)setChannelSelectionDelay:(unint64_t)a3
{
  self->_channelSelectionDelay = a3;
}

- (unint64_t)channelSelectionDelay
{
  return self->_channelSelectionDelay;
}

- (void)setOnsetChannel:(unint64_t)a3
{
  self->_onsetChannel = a3;
}

- (unint64_t)onsetChannel
{
  return self->_onsetChannel;
}

- (void)setLastTriggeredBestChannel:(unint64_t)a3
{
  self->_lastTriggeredBestChannel = a3;
}

- (unint64_t)lastTriggeredBestChannel
{
  return self->_lastTriggeredBestChannel;
}

- (void)setLastTriggeredOnsetResult:(id)a3
{
}

- (CSKeywordAnalyzerNDAPIResult)lastTriggeredOnsetResult
{
  return self->_lastTriggeredOnsetResult;
}

- (void)setOnsetResult:(id)a3
{
}

- (CSKeywordAnalyzerNDAPIResult)onsetResult
{
  return self->_onsetResult;
}

- (void)setBestChannel:(unint64_t)a3
{
  self->_bestChannel = a3;
}

- (unint64_t)bestChannel
{
  return self->_bestChannel;
}

- (void)setBestScore:(float)a3
{
  self->_bestScore = a3;
}

- (float)bestScore
{
  return self->_bestScore;
}

- (void)setHasTriggerPending:(BOOL)a3
{
  self->_hasTriggerPending = a3;
}

- (BOOL)hasTriggerPending
{
  return self->_hasTriggerPending;
}

- (void)setFirstPassConfig:(id)a3
{
}

- (CSVoiceTriggerFirstPassConfig)firstPassConfig
{
  return self->_firstPassConfig;
}

- (void)setKeywordAnalyzersNDAPI:(id)a3
{
}

- (NSMutableArray)keywordAnalyzersNDAPI
{
  return self->_keywordAnalyzersNDAPI;
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

- (void)setVoiceTriggerEnabled:(BOOL)a3
{
  self->_voiceTriggerEnabled = a3;
}

- (void)setAudioStream:(id)a3
{
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setVoiceTriggerStartPolicy:(id)a3
{
}

- (CSPolicy)voiceTriggerStartPolicy
{
  return self->_voiceTriggerStartPolicy;
}

- (CSSecondPassProgressDelegate)secondPassProgressDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secondPassProgressDelegate);
  return (CSSecondPassProgressDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CSVoiceTriggerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSVoiceTriggerDelegate *)WeakRetained;
}

- (id)_firstPassVoiceTriggerSignalEstimate
{
  if (CSIsHorseman())
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001587AC;
    v10[3] = &unk_100253060;
    v10[4] = self;
    +[CSMyriadPHash signalEstimateWithBuilder:v10];
    double v4 = v3;
    BOOL v5 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315395;
      BOOL v12 = "-[CSBuiltInVoiceTrigger _firstPassVoiceTriggerSignalEstimate]";
      __int16 v13 = 2049;
      unint64_t v14 = *(void *)&v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s signal estimate: %{private}f", buf, 0x16u);
    }
    double v6 = v4;
  }
  else
  {
    int v7 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315395;
      BOOL v12 = "-[CSBuiltInVoiceTrigger _firstPassVoiceTriggerSignalEstimate]";
      __int16 v13 = 2049;
      unint64_t v14 = 0xBFF0000000000000;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s signal estimate: %{private}f", buf, 0x16u);
    }
    double v6 = -1.0;
  }
  v8 = +[NSNumber numberWithDouble:v6];
  return v8;
}

- (id)_eventName:(unint64_t)a3
{
  v10[0] = &off_10025E338;
  v10[1] = &off_10025E320;
  v11[0] = @"kCSFirstPassEventBargeInOn";
  v11[1] = @"kCSFirstPassEventBargeInOff";
  v10[2] = &off_10025E350;
  v10[3] = &off_10025E368;
  v11[2] = @"kCSFirstPassEventStartAPFailed";
  v11[3] = @"kCSFirstPassEventStartAPSucceed";
  v10[4] = &off_10025E380;
  v11[4] = @"kCSFirstPassEventStopped";
  double v4 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:5];
  BOOL v5 = +[NSNumber numberWithUnsignedInteger:a3];
  double v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    int v7 = +[NSNumber numberWithUnsignedInteger:a3];
    v8 = [v4 objectForKeyedSubscript:v7];
  }
  else
  {
    v8 = +[NSString stringWithFormat:@"unknown(%tu)", a3];
  }

  return v8;
}

- (id)_stateName:(unint64_t)a3
{
  v10[0] = &off_10025E320;
  v10[1] = &off_10025E338;
  v11[0] = @"FirstPassRunning";
  v11[1] = @"FirstPassRunningAOPOnly";
  v10[2] = &off_10025E350;
  v10[3] = &off_10025E368;
  v11[2] = @"FirstPassStateAOPtoAPTransition";
  v11[3] = @"FirstPassStateStop";
  double v4 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  BOOL v5 = +[NSNumber numberWithUnsignedInteger:a3];
  double v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    int v7 = +[NSNumber numberWithUnsignedInteger:a3];
    v8 = [v4 objectForKeyedSubscript:v7];
  }
  else
  {
    v8 = +[NSString stringWithFormat:@"unknown(%tu)", a3];
  }

  return v8;
}

- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = +[CSPowerLogger sharedPowerLogger];
  double v6 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
  int v7 = [(CSAsset *)self->_currentAsset configVersion];
  [v8 powerLogSiriConfigWithVoiceTriggerEnabled:v4 withLanguage:v6 withModelVersion:v7];
}

- (void)didIgnoreEvent:(int64_t)a3 from:(int64_t)a4
{
  int v7 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    __int16 v9 = [(CSBuiltInVoiceTrigger *)self _eventName:a3];
    unsigned int v10 = [(CSBuiltInVoiceTrigger *)self _stateName:a4];
    int v11 = 136315650;
    BOOL v12 = "-[CSBuiltInVoiceTrigger didIgnoreEvent:from:]";
    __int16 v13 = 2114;
    unint64_t v14 = v9;
    __int16 v15 = 2114;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Ignore event(%{public}@) from(%{public}@) since we don't have transition", (uint8_t *)&v11, 0x20u);
  }
}

- (void)didTransitFrom:(int64_t)a3 to:(int64_t)a4 by:(int64_t)a5
{
  __int16 v9 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = v9;
    int v11 = [(CSBuiltInVoiceTrigger *)self _stateName:a3];
    BOOL v12 = [(CSBuiltInVoiceTrigger *)self _stateName:a4];
    __int16 v13 = [(CSBuiltInVoiceTrigger *)self _eventName:a5];
    *(_DWORD *)buf = 136315906;
    v20 = "-[CSBuiltInVoiceTrigger didTransitFrom:to:by:]";
    __int16 v21 = 2114;
    v22 = v11;
    __int16 v23 = 2114;
    v24 = v12;
    __int16 v25 = 2114;
    v26 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s from:%{public}@ to:%{public}@ by:%{public}@", buf, 0x2Au);
  }
  if (a3 == 3)
  {
    [(CSBuiltInVoiceTrigger *)self _startAOPVoiceTrigger];
    switch(a4)
    {
      case 0:
        goto LABEL_11;
      case 1:
        queue = self->_queue;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100159068;
        v18[3] = &unk_100253AE0;
        v18[4] = self;
        __int16 v15 = v18;
        goto LABEL_10;
      case 2:
        goto LABEL_9;
      case 3:
        goto LABEL_13;
      default:
        return;
    }
  }
  else if (a4)
  {
    if (a4 == 3)
    {
LABEL_13:
      [(CSBuiltInVoiceTrigger *)self _stopAPVoiceTrigger];
      [(CSBuiltInVoiceTrigger *)self _stopAOPVoiceTrigger];
    }
    else if (a4 == 2)
    {
LABEL_9:
      queue = self->_queue;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100159074;
      v17[3] = &unk_100253AE0;
      v17[4] = self;
      __int16 v15 = v17;
LABEL_10:
      dispatch_async(queue, v15);
    }
  }
  else
  {
LABEL_11:
    v16 = +[CSVoiceTriggerInfo sharedInstance];
    [v16 setFirstPassRunningMode:0];

    if (a3 != 3) {
      [(CSBuiltInVoiceTrigger *)self _stopAPVoiceTrigger];
    }
  }
}

- (void)attSiriStateMonitor:(id)a3 didRecieveAttSiriStateChange:(unint64_t)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001590F4;
  v5[3] = &unk_100253B58;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)CSPhoneCallStateMonitor:(id)a3 didRecievePhoneCallStateChange:(unint64_t)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10015922C;
  v5[3] = &unk_100253B58;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (int64_t)_currentJarvisTriggerMode
{
  if (self->_carPlayEndpoint)
  {
    CFTypeRef cf = 0;
    uint64_t CMBaseObject = FigEndpointGetCMBaseObject();
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    id v8 = *(uint64_t (**)(uint64_t, void, const CFAllocatorRef, CFTypeRef *))(v5 + 48);
    if (v8)
    {
      int v9 = v8(CMBaseObject, kFigEndpointProperty_VoiceActivationType, kCFAllocatorDefault, &cf);
      if (!v9)
      {
LABEL_14:
        int valuePtr = -1;
        if (cf && (CFTypeID v11 = CFGetTypeID(cf), v11 == CFNumberGetTypeID()))
        {
          CFNumberGetValue((CFNumberRef)cf, kCFNumberIntType, &valuePtr);
        }
        else
        {
          BOOL v12 = CSLogCategoryVT;
          if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            __int16 v21 = "-[CSBuiltInVoiceTrigger _currentJarvisTriggerMode]";
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Failed to fetch trigger mode value", buf, 0xCu);
          }
        }
        if (cf) {
          CFRelease(cf);
        }
        int v13 = valuePtr;
        if (!valuePtr || (valuePtr - 3) <= 0xFFFFFFFB)
        {
          int v13 = -1;
          int valuePtr = -1;
        }
        int jarvisTriggerModeLogHeartbeat = self->_jarvisTriggerModeLogHeartbeat;
        if (!self->_jarvisTriggerModeLogHeartbeat)
        {
          __int16 v15 = (void *)CSLogCategoryVT;
          if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
          {
            v16 = v15;
            v17 = +[CSJarvisTriggerModeMonitor triggerModeStringDescription:v13];
            *(_DWORD *)buf = 136315394;
            __int16 v21 = "-[CSBuiltInVoiceTrigger _currentJarvisTriggerMode]";
            __int16 v22 = 2112;
            __int16 v23 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s CSJarvisTriggerMode : %@", buf, 0x16u);

            int jarvisTriggerModeLogHeartbeat = self->_jarvisTriggerModeLogHeartbeat;
            int v13 = valuePtr;
          }
          else
          {
            int jarvisTriggerModeLogHeartbeat = 0;
          }
        }
        self->_int jarvisTriggerModeLogHeartbeat = jarvisTriggerModeLogHeartbeat
                                             + 1
                                             - 20 * ((3277 * (jarvisTriggerModeLogHeartbeat + 1)) >> 16);
        return v13;
      }
    }
    else
    {
      int v9 = -12782;
    }
    unsigned int v10 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v21 = "-[CSBuiltInVoiceTrigger _currentJarvisTriggerMode]";
      __int16 v22 = 2050;
      __int16 v23 = (void *)v9;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s failed to get endpoint value for Jarvis, error : %{public}ld", buf, 0x16u);
    }
    goto LABEL_14;
  }
  double v6 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v21 = "-[CSBuiltInVoiceTrigger _currentJarvisTriggerMode]";
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s carPlayEndpoint is NULL", buf, 0xCu);
  }
  return -1;
}

- (void)_forceUpdateCarPlayEndpointWithJarvisConnected:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = +[NSDate date];
    FigEndpointCopyActiveCarPlayEndpoint();
    uint64_t v5 = +[NSDate date];
    double v6 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = v6;
      [v5 timeIntervalSinceDate:v4];
      *(_DWORD *)buf = 136315394;
      unsigned int v10 = "-[CSBuiltInVoiceTrigger _forceUpdateCarPlayEndpointWithJarvisConnected:]";
      __int16 v11 = 2050;
      uint64_t v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s FigEndpointCopyActiveCarPlayEndpoint elapsed time = %{public}lf", buf, 0x16u);
    }
    self->_carPlayEndpoint = 0;
  }
  else
  {
    self->_carPlayEndpoint = 0;
  }
  self->_int jarvisTriggerModeLogHeartbeat = 0;
}

- (void)_receivedHearstRoutedEvent:(int64_t)a3
{
  uint64_t v5 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[CSBuiltInVoiceTrigger _receivedHearstRoutedEvent:]";
    __int16 v8 = 2050;
    int64_t v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Received Hearst event: %{public}ld", (uint8_t *)&v6, 0x16u);
  }
  self->_hearstRouteStatus = a3;
}

- (void)_receivedJarvisConnectionEvent:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"Diconnect";
    if (v3) {
      CFStringRef v6 = @"Connect";
    }
    int v7 = 136315394;
    __int16 v8 = "-[CSBuiltInVoiceTrigger _receivedJarvisConnectionEvent:]";
    __int16 v9 = 2114;
    CFStringRef v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Received Jarvis %{public}@ event", (uint8_t *)&v7, 0x16u);
  }
  self->_isJarvisConnected = v3;
  [(CSBuiltInVoiceTrigger *)self _forceUpdateCarPlayEndpointWithJarvisConnected:v3];
}

- (void)CSAudioRouteChangeMonitor:(id)a3 didReceiveAudioRouteChangeEvent:(int64_t)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10015995C;
  v5[3] = &unk_100253B58;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)_updateCurrentSplitterState:(unint64_t)a3 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a4
{
  BOOL v4 = a4;
  int v7 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t currentSplitterState = self->_currentSplitterState;
    BOOL shouldDisableOnSpeakerVerificationInSplitterMode = self->_shouldDisableOnSpeakerVerificationInSplitterMode;
    int v10 = 136316162;
    __int16 v11 = "-[CSBuiltInVoiceTrigger _updateCurrentSplitterState:shouldDisableSpeakerVerificationInSplitterMode:]";
    __int16 v12 = 1026;
    int v13 = currentSplitterState;
    __int16 v14 = 1026;
    int v15 = a3;
    __int16 v16 = 1026;
    BOOL v17 = shouldDisableOnSpeakerVerificationInSplitterMode;
    __int16 v18 = 1026;
    BOOL v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Received Wireless Splitter State Change : %{public}d -> %{public}d, shouldDisableSpeakerVerification : %{public}d -> %{public}d", (uint8_t *)&v10, 0x24u);
  }
  self->_unint64_t currentSplitterState = a3;
  self->_BOOL shouldDisableOnSpeakerVerificationInSplitterMode = v4;
}

- (void)CSBluetoothWirelessSplitterMonitor:(id)a3 didReceiveSplitterStateChange:(unint64_t)a4 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100159C20;
  block[3] = &unk_100252F08;
  block[4] = self;
  block[5] = a4;
  BOOL v7 = a5;
  dispatch_async(queue, block);
}

- (void)pendingSecondPassTriggerWasClearedForClient:(unint64_t)a3 deviceId:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100159CD8;
  block[3] = &unk_1002532A8;
  __int16 v11 = self;
  unint64_t v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)cancelSecondPassRunning
{
  if (CSIsHorseman())
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100159D7C;
    block[3] = &unk_100253AE0;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

- (unint64_t)_currentState
{
  return (unint64_t)[(CSStateMachine *)self->_stateMachine currentState];
}

- (void)_setupStateMachine
{
  BOOL v3 = (CSStateMachine *)[objc_alloc((Class)CSStateMachine) initWithInitialState:3];
  stateMachine = self->_stateMachine;
  self->_stateMachine = v3;

  [(CSStateMachine *)self->_stateMachine setDelegate:self];
  [(CSStateMachine *)self->_stateMachine addTransitionFrom:1 to:0 for:1];
  [(CSStateMachine *)self->_stateMachine addTransitionFrom:1 to:3 for:4];
  [(CSStateMachine *)self->_stateMachine addTransitionFrom:0 to:2 for:0];
  [(CSStateMachine *)self->_stateMachine addTransitionFrom:0 to:3 for:4];
  [(CSStateMachine *)self->_stateMachine addTransitionFrom:2 to:2 for:2];
  [(CSStateMachine *)self->_stateMachine addTransitionFrom:2 to:0 for:1];
  [(CSStateMachine *)self->_stateMachine addTransitionFrom:2 to:1 for:3];
  [(CSStateMachine *)self->_stateMachine addTransitionFrom:2 to:3 for:4];
  [(CSStateMachine *)self->_stateMachine addTransitionFrom:3 to:1 for:0];
  uint64_t v5 = self->_stateMachine;
  [(CSStateMachine *)v5 addTransitionFrom:3 to:0 for:1];
}

- (void)_notifyEvent:(unint64_t)a3
{
  uint64_t v5 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    BOOL v7 = [(CSBuiltInVoiceTrigger *)self _eventName:a3];
    int v8 = 136315394;
    __int16 v9 = "-[CSBuiltInVoiceTrigger _notifyEvent:]";
    __int16 v10 = 2114;
    __int16 v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s event : %{public}@", (uint8_t *)&v8, 0x16u);
  }
  [(CSStateMachine *)self->_stateMachine performTransitionForEvent:a3];
}

- (void)_teardownSecondPassIfNeeded
{
  if (![(CSBuiltInVoiceTrigger *)self _shouldSecondPassKeepAlive])
  {
    voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
    self->_voiceTriggerSecondPass = 0;

    secondPassTransaction = self->_secondPassTransaction;
    self->_secondPassTransaction = 0;
  }
}

- (void)_createSecondPassIfNeededWithFirstPassSource:(unint64_t)a3
{
  if (!self->_voiceTriggerSecondPass)
  {
    if ([(CSBuiltInVoiceTrigger *)self _shouldSecondPassKeepAlive])
    {
      uint64_t v5 = CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136315138;
        BOOL v17 = "-[CSBuiltInVoiceTrigger _createSecondPassIfNeededWithFirstPassSource:]";
        _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s SecondPass shouldn't be created here", (uint8_t *)&v16, 0xCu);
      }
    }
    else
    {
      id v6 = (CSOSTransaction *)[objc_alloc((Class)CSOSTransaction) initWithDescription:@"VoiceTrigger SecondPass"];
      secondPassTransaction = self->_secondPassTransaction;
      self->_secondPassTransaction = v6;

      BOOL v8 = !self->_shouldDisableOnSpeakerVerificationInSplitterMode;
      if (self->_shouldDisableOnSpeakerVerificationInSplitterMode)
      {
        __int16 v9 = CSLogCategoryVT;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136315138;
          BOOL v17 = "-[CSBuiltInVoiceTrigger _createSecondPassIfNeededWithFirstPassSource:]";
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Disable PHS since wireless splitter includes non-DoAP device, and non-DoAP device is in contacts", (uint8_t *)&v16, 0xCu);
        }
      }
      __int16 v10 = +[CSFPreferences sharedPreferences];
      unsigned int v11 = [v10 bypassPersonalizedHeySiri];

      if (v11)
      {
        unint64_t v12 = CSLogCategoryVT;
        BOOL v8 = 0;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136315138;
          BOOL v17 = "-[CSBuiltInVoiceTrigger _createSecondPassIfNeededWithFirstPassSource:]";
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Disable PHS since bypass personalized HeySiri is enabled in internal settings", (uint8_t *)&v16, 0xCu);
          BOOL v8 = 0;
        }
      }
      int v13 = [[CSVoiceTriggerSecondPass alloc] initWithPHSEnabled:v8];
      voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
      self->_voiceTriggerSecondPass = v13;

      [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass setFirstPassSource:a3];
      [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass setSecondPassClient:1];
      [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass setAsset:self->_currentAsset];
      int v15 = [(CSBuiltInVoiceTrigger *)self delegate];
      [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass setDelegate:v15];

      [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass start];
    }
  }
}

- (BOOL)_shouldSecondPassKeepAlive
{
  if (CSIsHorseman()) {
    return 1;
  }
  return CSIsBridgeOS();
}

- (void)_cancelAllAudioStreamHold
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = self->_audioStreamHoldings;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      BOOL v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v7);
        __int16 v9 = [(CSBuiltInVoiceTrigger *)self audioProvider];
        [v9 cancelAudioStreamHold:v8];

        BOOL v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_audioStreamHoldings removeAllObjects];
}

- (void)_cancelLastAudioStreamHold
{
  if ([(NSMutableArray *)self->_audioStreamHoldings count])
  {
    id v4 = [(NSMutableArray *)self->_audioStreamHoldings lastObject];
    BOOL v3 = [(CSBuiltInVoiceTrigger *)self audioProvider];
    [v3 cancelAudioStreamHold:v4];

    [(NSMutableArray *)self->_audioStreamHoldings removeLastObject];
  }
}

- (void)_addAudioStreamHold:(id)a3
{
  id v4 = a3;
  id v6 = [objc_alloc((Class)CSAudioStreamHoldRequestOption) initWithTimeout:2 clientIdentity:0 requireRecordModeLock:0 requireListeningMicIndicatorLock:5.0];
  id v5 = [(CSAudioProvider *)self->_audioProvider holdAudioStreamWithDescription:v4 option:v6];

  [(NSMutableArray *)self->_audioStreamHoldings addObject:v5];
}

- (void)activationEventNotificationHandler:(id)a3 event:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015A64C;
  block[3] = &unk_100253280;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (void)CSVoiceTriggerXPCServiceProxy:(id)a3 bypassPhraseSpotter:(BOOL)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10015AC24;
  v5[3] = &unk_100253AB8;
  v5[4] = self;
  BOOL v6 = a4;
  dispatch_async(queue, v5);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  id v4 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[CSBuiltInVoiceTrigger CSAudioServerCrashMonitorDidReceiveServerRestart:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s audiomxd/bridgeaudiod recovered from crash", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015AD34;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)CSAudioServerCrashMonitorDidReceiveServerCrash:(id)a3
{
  id v4 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[CSBuiltInVoiceTrigger CSAudioServerCrashMonitorDidReceiveServerCrash:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s audiomxd/bridgeaudiod crashed", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015AE98;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)selfTriggerDetector:(id)a3 didDetectSelfTrigger:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10015AFA4;
  v8[3] = &unk_100253B08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015B0EC;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015B218;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  if (a5)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10015B350;
    block[3] = &unk_100253AE0;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

- (BOOL)_shouldCancelSecondPassResultWithVoiceTriggerInfo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && (uint64_t v6 = kVTEItriggerStartMachTime,
        [v4 objectForKeyedSubscript:kVTEItriggerStartMachTime],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    id v8 = [v5 objectForKeyedSubscript:v6];
    id v9 = (char *)[v8 unsignedLongLongValue];

    id v10 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t lastSelfTriggerDetectedStartMachTime = self->_lastSelfTriggerDetectedStartMachTime;
      int v18 = 136315650;
      BOOL v19 = "-[CSBuiltInVoiceTrigger _shouldCancelSecondPassResultWithVoiceTriggerInfo:]";
      __int16 v20 = 2048;
      __int16 v21 = v9;
      __int16 v22 = 2048;
      unint64_t v23 = lastSelfTriggerDetectedStartMachTime;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s secondPassTriggerStartHostTime = %llu, _unint64_t lastSelfTriggerDetectedStartMachTime = %llu", (uint8_t *)&v18, 0x20u);
    }
    unint64_t v13 = self->_lastSelfTriggerDetectedStartMachTime;
    LODWORD(v11) = 0.5;
    id v14 = (char *)+[CSFTimeUtils secondsToHostTime:v11];
    int v15 = &v9[-v13];
    if ((unint64_t)v9 <= v13) {
      int v15 = (char *)(v13 - (void)v9);
    }
    BOOL v16 = v15 <= v14;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)_handleSecondPassResult:(id)a3 deviceId:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [v8 voiceTriggerEventInfo];
  uint64_t v12 = (uint64_t)[v8 result];
  unsigned int v13 = [(CSBuiltInVoiceTrigger *)self _shouldCancelSecondPassResultWithVoiceTriggerInfo:v11];
  id v14 = CSLogCategoryVT;
  if (v13)
  {
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v52 = "-[CSBuiltInVoiceTrigger _handleSecondPassResult:deviceId:error:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Cancel second pass since self-trigger was detected within short time window", buf, 0xCu);
      id v14 = CSLogCategoryVT;
    }
    uint64_t v12 = 6;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = v14;
    BOOL v16 = [v10 localizedDescription];
    *(_DWORD *)buf = 136315906;
    v52 = "-[CSBuiltInVoiceTrigger _handleSecondPassResult:deviceId:error:]";
    __int16 v53 = 1024;
    *(_DWORD *)v54 = v12;
    *(_WORD *)&v54[4] = 2114;
    *(void *)&v54[6] = v11;
    __int16 v55 = 2114;
    v56 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s Second Pass Result, %d, %{public}@, %{public}@", buf, 0x26u);
  }
  id v17 = [v11 mutableCopy];
  if ([(CSBuiltInVoiceTrigger *)self _hasHFPDuringPhoneCall])
  {
    int v18 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v52 = "-[CSBuiltInVoiceTrigger _handleSecondPassResult:deviceId:error:]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s HFP during phone call. We will set value to ignore pocket detection.", buf, 0xCu);
    }
    [v17 setValue:&__kCFBooleanTrue forKey:kVTEIHFPDuringCall];
  }
  if (+[CSUtils isVoiceTriggerFromExclaveWithVTEI:v17])BOOL v19 = &__kCFBooleanTrue; {
  else
  }
    BOOL v19 = &__kCFBooleanFalse;
  [v17 setValue:v19 forKey:kVTEIExclaveVoiceTrigger];
  switch(v12)
  {
    case 1:
      __int16 v20 = v10;
      id v21 = v9;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v23 = objc_opt_respondsToSelector();

      id v24 = objc_loadWeakRetained((id *)&self->_delegate);
      id v25 = v24;
      if (v23)
      {
        [v24 voiceTriggerDidDetectKeyword:v17 deviceId:v21 completion:0];
      }
      else
      {
        char v46 = objc_opt_respondsToSelector();

        v29 = v21;
        if ((v46 & 1) == 0) {
          goto LABEL_41;
        }
        id v25 = objc_loadWeakRetained((id *)&self->_delegate);
        [v25 voiceTriggerDidDetectKeyword:v17 deviceId:v21];
      }

      v29 = v21;
      goto LABEL_41;
    case 2:
      __int16 v20 = v10;
      id v26 = v9;
      id v27 = objc_loadWeakRetained((id *)&self->_delegate);
      char v28 = objc_opt_respondsToSelector();

      v29 = v26;
      if ((v28 & 1) == 0) {
        goto LABEL_31;
      }
      id v30 = objc_loadWeakRetained((id *)&self->_delegate);
      [v30 voiceTriggerDidRejected:v17 deviceId:v26];
      goto LABEL_30;
    case 3:
      __int16 v20 = v10;
      id v31 = v9;
      id v32 = objc_loadWeakRetained((id *)&self->_delegate);
      char v33 = objc_opt_respondsToSelector();

      v29 = v31;
      if ((v33 & 1) == 0) {
        goto LABEL_31;
      }
      id v30 = objc_loadWeakRetained((id *)&self->_delegate);
      [v30 voiceTriggerDidDetectNearMiss:v17 deviceId:v31];
      goto LABEL_30;
    case 9:
      __int16 v20 = v10;
      id v39 = v9;
      id v40 = objc_loadWeakRetained((id *)&self->_delegate);
      char v41 = objc_opt_respondsToSelector();

      v29 = v39;
      if ((v41 & 1) == 0) {
        goto LABEL_31;
      }
      id v30 = objc_loadWeakRetained((id *)&self->_delegate);
      [v30 voiceTriggerDidDetectSpeakerReject:v17];
LABEL_30:

LABEL_31:
      v42 = CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v52 = "-[CSBuiltInVoiceTrigger _handleSecondPassResult:deviceId:error:]";
        __int16 v53 = 1026;
        *(_DWORD *)v54 = v12;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%s Notifying audioProviderInvalidation due to VoiceTrigger result(%{public}d) so Siri client needs to setContext again", buf, 0x12u);
      }
      [(CSAudioProvider *)self->_audioProvider notifyProviderContextChanged];
      break;
    default:
      id v34 = v9;
      v35 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
      {
        v48 = v35;
        v49 = [v10 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v52 = "-[CSBuiltInVoiceTrigger _handleSecondPassResult:deviceId:error:]";
        __int16 v53 = 2114;
        *(void *)v54 = v49;
        _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%s VoiceTrigger Second Pass has failed : %{public}@", buf, 0x16u);
      }
      __int16 v20 = v10;
      id v36 = objc_loadWeakRetained((id *)&self->_delegate);
      char v37 = objc_opt_respondsToSelector();

      v29 = v34;
      if (v37)
      {
        id v38 = objc_loadWeakRetained((id *)&self->_delegate);
        [v38 voiceTriggerDidRejected:v17 deviceId:v34];
      }
      if (v12 != 1 && v12 != 8) {
        goto LABEL_31;
      }
LABEL_41:
      v47 = CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v52 = "-[CSBuiltInVoiceTrigger _handleSecondPassResult:deviceId:error:]";
        __int16 v53 = 1026;
        *(_DWORD *)v54 = v12;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%s Not notifying audioProviderInvalidation since VoiceTrigger result is %{public}d", buf, 0x12u);
      }
      break;
  }
  if ([v8 isSecondChanceCandidate])
  {
    v43 = [[CSVoiceTriggerSecondChanceContext alloc] initWithWindowStartTime:mach_absolute_time()];
    secondChanceContext = self->_secondChanceContext;
    self->_secondChanceContext = v43;
  }
  else
  {
    secondChanceContext = self->_secondChanceContext;
    self->_secondChanceContext = 0;
  }

  queue = self->_queue;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_10015BC08;
  v50[3] = &unk_100253B58;
  v50[4] = self;
  v50[5] = v12;
  dispatch_async(queue, v50);
}

- (void)_handleVoiceTriggerSecondPassWithSource:(unint64_t)a3 deviceId:(id)a4 event:(id)a5 audioProviderUUID:(id)a6 firstPassInfo:(id)a7
{
  id v12 = a4;
  id v30 = a5;
  id v28 = a6;
  id v13 = a7;
  id v14 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    char v37 = "-[CSBuiltInVoiceTrigger _handleVoiceTriggerSecondPassWithSource:deviceId:event:audioProviderUUID:firstPassInfo:]";
    __int16 v38 = 2114;
    id v39 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }
  uint64_t v15 = mach_absolute_time();
  if (v30)
  {
    v29 = +[CSVoiceTriggerFirstPassMetrics CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:firstPassInfoProcessedTime:](CSVoiceTriggerFirstPassMetrics, "CSVoiceTriggerFirstPassMetricsWithFirstPassInfoGeneratedTime:firstPassInfoProcessedTime:", [v30 hosttime], v15);
  }
  else
  {
    v29 = 0;
  }
  id v16 = [v13 mutableCopy];
  id v17 = +[NSNumber numberWithUnsignedLongLong:v15];
  [v16 setObject:v17 forKeyedSubscript:kVTEIFirstPassFireHostTime];

  if (+[CSUtils isDarwinOS])
  {
    int v18 = +[CSHostLauncherDarwin sharedInstance];
    [v18 wakeHostForVoiceTrigger];
  }
  [(CSBuiltInVoiceTrigger *)self _setIsSecondPassRunning:1];
  objc_initWeak((id *)buf, self);
  [(CSBuiltInVoiceTrigger *)self _createSecondPassIfNeededWithFirstPassSource:a3];
  BOOL v19 = +[NSUUID UUID];
  __int16 v20 = [CSVoiceTriggerSecondPassRequestOption alloc];
  id v21 = [(CSBuiltInVoiceTrigger *)self audioProvider];
  __int16 v22 = [v21 UUID];
  id v23 = [v16 copy];
  id v24 = [(CSVoiceTriggerSecondPassRequestOption *)v20 initWithFirstPassSource:a3 deviceId:v12 audioProviderUUID:v22 firstPassInfo:v23 rejectionMHUUID:v19 isSecondChanceRun:[(CSVoiceTriggerSecondChanceContext *)self->_secondChanceContext shouldRunAsSecondChance] firstpassMetrics:v29 rtModelRequestOptions:0];

  [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass setSupportsMultiPhraseDetection:[(CSVoiceTriggerUserSelectedPhrase *)self->_multiPhraseSelectedStatus multiPhraseSelected]];
  voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10015C010;
  v31[3] = &unk_100253230;
  v35[1] = (id)a3;
  id v26 = v13;
  id v32 = v26;
  objc_copyWeak(v35, (id *)buf);
  id v27 = v12;
  id v33 = v27;
  id v34 = self;
  [(CSVoiceTriggerSecondPass *)voiceTriggerSecondPass handleVoiceTriggerSecondPassFrom:v24 completion:v31];
  kdebug_trace();

  objc_destroyWeak(v35);
  objc_destroyWeak((id *)buf);
}

- (void)_reportVoiceTriggerFirstPassFireFromAPWithSource:(unint64_t)a3 voiceTriggerFirstPassInfo:(id)a4
{
  id v6 = a4;
  if (a3 == 1 || a3 == 11)
  {
    [(CSBuiltInVoiceTrigger *)self _addAudioStreamHold:@"APVoiceTriggerDetected"];
    objc_storeStrong((id *)&self->_lastTriggeredOnsetResult, self->_onsetResult);
    self->_lastTriggeredBestChannel = self->_onsetChannel;
    if (self->_phoneCallState - 2 < 3
      || (+[CSMXRingtoneMonitor sharedInstance],
          id v7 = objc_claimAutoreleasedReturnValue(),
          unsigned int v8 = [v7 isAnyRingtoneCurrentlyPlaying],
          v7,
          v8))
    {
      if ([(CSBuiltInVoiceTrigger *)self _hasHFPDuringPhoneCall]) {
        +[CSMyriadNotifier notifyInEarMyriadTrigger];
      }
      unsigned int v9 = [(CSBuiltInVoiceTrigger *)self _hasHFPDuringPhoneCall];
      unint64_t phoneCallState = self->_phoneCallState;
      if (a3 == 11 && v9)
      {
        if (phoneCallState == 3) {
          a3 = 9;
        }
        else {
          a3 = 8;
        }
      }
      else
      {
        BOOL v12 = phoneCallState == 3;
        unint64_t v13 = 8;
        if (v12) {
          unint64_t v13 = 9;
        }
        unint64_t v14 = 13;
        if (v12) {
          unint64_t v14 = 14;
        }
        if (a3 == 11) {
          a3 = v14;
        }
        else {
          a3 = v13;
        }
      }
    }
    uint64_t v15 = [(CSBuiltInVoiceTrigger *)self audioProvider];
    id v16 = [v15 UUID];
    [(CSBuiltInVoiceTrigger *)self _handleVoiceTriggerSecondPassWithSource:a3 deviceId:0 event:0 audioProviderUUID:v16 firstPassInfo:v6];
  }
  else
  {
    double v11 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      int v18 = "-[CSBuiltInVoiceTrigger _reportVoiceTriggerFirstPassFireFromAPWithSource:voiceTriggerFirstPassInfo:]";
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s The first pass source is not from AP, skip handling!", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (id)_voiceTriggerFirstPassInfoFromAP
{
  v18[0] = kVTEIfirstPassDetectedChannel;
  int v17 = +[NSNumber numberWithUnsignedInteger:self->_bestChannel];
  v19[0] = v17;
  v18[1] = kVTEIfirstPassScore;
  *(float *)&double v3 = self->_bestScore;
  id v16 = +[NSNumber numberWithFloat:v3];
  v19[1] = v16;
  v18[2] = kVTEIfirstPassStartSampleCount;
  id v4 = +[NSNumber numberWithUnsignedInteger:[(CSKeywordAnalyzerNDAPIResult *)self->_onsetResult bestStart]];
  v19[2] = v4;
  v18[3] = kVTEIfirstPassEndSampleCount;
  id v5 = +[NSNumber numberWithUnsignedInteger:[(CSKeywordAnalyzerNDAPIResult *)self->_onsetResult bestEnd]];
  v19[3] = v5;
  v18[4] = kVTEIfirstPassFireSampleCount;
  id v6 = +[NSNumber numberWithUnsignedInteger:[(CSKeywordAnalyzerNDAPIResult *)self->_onsetResult samplesAtFire]];
  channelSelectionScores = self->_channelSelectionScores;
  v19[4] = v6;
  v19[5] = channelSelectionScores;
  void v18[5] = kVTEIfirstPassChannelSelectionScores;
  v18[6] = kVTEIfirstPassChannelSelectionDelaySeconds;
  unsigned int v8 = [(CSBuiltInVoiceTrigger *)self firstPassConfig];
  [v8 delaySecondsForChannelSelection];
  unsigned int v9 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v19[6] = v9;
  v18[7] = kVTEIfirstPassMasterChannelScoreBoost;
  id v10 = [(CSBuiltInVoiceTrigger *)self firstPassConfig];
  [v10 masterChannelScoreBoost];
  double v11 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v19[7] = v11;
  v18[8] = kVTEIfirstPassOnsetChannel;
  BOOL v12 = +[NSNumber numberWithUnsignedInteger:self->_onsetChannel];
  v19[8] = v12;
  v18[9] = kVTEIfirstPassOnsetScore;
  [(CSKeywordAnalyzerNDAPIResult *)self->_onsetResult bestScore];
  unint64_t v13 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v19[9] = v13;
  unint64_t v14 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:10];

  return v14;
}

- (BOOL)_hasHFPDuringPhoneCall
{
  BOOL result = (self->_phoneCallState - 2 < 3
         || (+[CSMXRingtoneMonitor sharedInstance],
             double v3 = objc_claimAutoreleasedReturnValue(),
             unsigned int v4 = [v3 isAnyRingtoneCurrentlyPlaying],
             v3,
             v4))
        && self->_hearstRouteStatus == 2;
  return result;
}

- (void)_keywordAnalyzerNDAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5
{
  id v8 = a3;
  double v9 = COERCE_DOUBLE(a4);
  [*(id *)&v9 bestScore];
  float v11 = v10;
  if (v9 != 0.0)
  {
    BOOL v12 = +[CSFPreferences sharedPreferences];
    unsigned int v13 = [v12 firstPassDebuggingEnabled];

    if (v13)
    {
      unint64_t v14 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = v14;
        [*(id *)&v9 bestScore];
        *(_DWORD *)buf = 136316162;
        v51 = "-[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v52 = 2048;
        double v53 = v16;
        __int16 v54 = 2048;
        double v55 = COERCE_DOUBLE([*(id *)&v9 bestStart]);
        __int16 v56 = 2048;
        id v57 = [*(id *)&v9 bestEnd];
        __int16 v58 = 1024;
        LODWORD(v59) = a5;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s First Pass Score : %lf, First Pass Best Start : %llu, First Pass Best End : %llu, CHANNEL : %d", buf, 0x30u);
      }
    }
  }
  int v17 = +[CSFPreferences sharedPreferences];
  if ([v17 firstPassDebuggingEnabled])
  {
  }
  else
  {
    unint64_t v18 = qword_1002A3C38 % self->_heartbeatFactor;

    if (!v18)
    {
      BOOL v19 = CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v51 = "-[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v52 = 2050;
        double v53 = v11;
        __int16 v54 = 2050;
        double v55 = *(double *)&a5;
        __int16 v56 = 2050;
        id v57 = (id)qword_1002A3C38;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s NDAPI first pass best score = %{public}.3f for channel = %{public}tu, heartbeat = %{public}lld", buf, 0x2Au);
      }
    }
  }
  if (*(double *)&a5 == 0.0) {
    ++qword_1002A3C38;
  }
  if (!self->_hasTriggerPending)
  {
    __int16 v20 = [(CSBuiltInVoiceTrigger *)self firstPassConfig];
    [v20 threshold];
    float v22 = v21;

    if (v11 >= v22)
    {
      id v23 = CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = v23;
        id v25 = [*(id *)&v9 samplesAtFire];
        id v26 = [*(id *)&v9 phId];
        unint64_t delayInSamplesRequiredForChannelSelection = self->_delayInSamplesRequiredForChannelSelection;
        *(_DWORD *)buf = 136316418;
        v51 = "-[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v52 = 2050;
        double v53 = *(double *)&a5;
        __int16 v54 = 2050;
        double v55 = v11;
        __int16 v56 = 2050;
        id v57 = v25;
        __int16 v58 = 2048;
        id v59 = v26;
        __int16 v60 = 2050;
        unint64_t v61 = delayInSamplesRequiredForChannelSelection;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s NDAPI in channel: %{public}tu passed threshold with score %{public}.3f at sample %{public}tu, best = %tu, setting up decision delay in samples: %{public}tu", buf, 0x3Eu);

        id v23 = CSLogCategoryVT;
      }
      self->_hasTriggerPending = 1;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v51 = "-[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v52 = 2050;
        double v53 = *(double *)&a5;
        __int16 v54 = 2114;
        double v55 = v9;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s Set to use the alignment of channel %{public}tu that first crossed the threshold: %{public}@", buf, 0x20u);
      }
      objc_storeStrong((id *)&self->_onsetResult, a4);
      self->_bestScore = -INFINITY;
      self->_bestChannel = 0;
      self->_onsetChannel = a5;
      self->_channelSelectionDelay = 0;
      if ((unint64_t)[(NSMutableArray *)self->_keywordAnalyzersNDAPI count] >= 2) {
        [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass prewarm];
      }
    }
    if (!self->_hasTriggerPending) {
      goto LABEL_39;
    }
  }
  if (!self->_channelSelectionDelay)
  {
    [(CSKeywordAnalyzerNDAPIResult *)self->_onsetResult bestScore];
    if (v11 > v28)
    {
      v29 = CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v51 = "-[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v52 = 2050;
        double v53 = *(double *)&a5;
        __int16 v54 = 2114;
        double v55 = v9;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s Update to use the alignment of channel %{public}tu: %{public}@", buf, 0x20u);
      }
      objc_storeStrong((id *)&self->_onsetResult, a4);
      self->_onsetChannel = a5;
    }
  }
  if (self->_channelSelectionDelay >= self->_delayInSamplesRequiredForChannelSelection)
  {
    id v30 = (void *)CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      id v31 = v30;
      id v32 = [*(id *)&v9 samplesAtFire];
      *(_DWORD *)buf = 136315906;
      v51 = "-[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
      __int16 v52 = 2050;
      double v53 = v11;
      __int16 v54 = 2050;
      double v55 = *(double *)&a5;
      __int16 v56 = 2050;
      id v57 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s NDAPI first pass best score for channel selection = %{public}.3f for channel = %{public}tu at sample %{public}tu", buf, 0x2Au);
    }
    if ([(CSVoiceTriggerFirstPassConfig *)self->_firstPassConfig masterChannel] == a5)
    {
      id v33 = [(CSBuiltInVoiceTrigger *)self firstPassConfig];
      [v33 masterChannelScoreBoost];
      float v11 = v11 + v34;

      v35 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        id v36 = v35;
        char v37 = [(CSBuiltInVoiceTrigger *)self firstPassConfig];
        [v37 masterChannelScoreBoost];
        *(_DWORD *)buf = 136315650;
        v51 = "-[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v52 = 2050;
        double v53 = v11;
        __int16 v54 = 2050;
        double v55 = v38;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%s Boosting master channel (ch0) score to %{public}.3f by %{public}.3f for stream selection", buf, 0x20u);
      }
    }
    if ([(CSVoiceTriggerFirstPassConfig *)self->_firstPassConfig voiceIsolationChannel] == a5)
    {
      id v39 = [(CSBuiltInVoiceTrigger *)self firstPassConfig];
      [v39 voiceIsolationChannelScoreBoost];
      float v11 = v11 + v40;

      char v41 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        v42 = v41;
        v43 = [(CSBuiltInVoiceTrigger *)self firstPassConfig];
        [v43 masterChannelScoreBoost];
        *(_DWORD *)buf = 136315650;
        v51 = "-[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v52 = 2050;
        double v53 = v11;
        __int16 v54 = 2050;
        double v55 = v44;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%s Boosting voice isolation channel (ch0) score to %{public}.3f by %{public}.3f for stream selection", buf, 0x20u);
      }
    }
    v45 = (NSDictionary *)[(NSDictionary *)self->_channelSelectionScores mutableCopy];
    char v46 = +[NSString stringWithFormat:@"ch%tu", a5];
    *(float *)&double v47 = v11;
    v48 = +[NSNumber numberWithFloat:v47];
    [(NSDictionary *)v45 setObject:v48 forKey:v46];

    channelSelectionScores = self->_channelSelectionScores;
    self->_channelSelectionScores = v45;

    if (v11 > self->_bestScore)
    {
      self->_bestScore = v11;
      self->_bestChannel = a5;
    }
  }
  if (!self->_hasTriggerPending) {
LABEL_39:
  }
    [v8 resetBest];
}

- (void)_handleAudioChunk:(id)a3
{
  id v20 = a3;
  uint64_t v4 = qword_1002A3C30;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * qword_1002A3C30, 1) <= 0x888888888888888uLL)
  {
    kdebug_trace();
    uint64_t v4 = qword_1002A3C30;
  }
  qword_1002A3C30 = v4 + 1;
  if (![(CSBuiltInVoiceTrigger *)self _shouldSkipAudioChunkHandling])
  {
    id v5 = [v20 numSamples];
    if (v5)
    {
      unint64_t v6 = (unint64_t)v5;
      uint64_t v7 = 0;
      do
      {
        if (v6 >= self->_processingChunkSamples) {
          unint64_t processingChunkSamples = self->_processingChunkSamples;
        }
        else {
          unint64_t processingChunkSamples = v6;
        }
        unint64_t v21 = processingChunkSamples;
        double v9 = objc_msgSend(v20, "subChunkFrom:numSamples:", v7);
        id v23 = [v9 numSamples];
        id v22 = [v9 numSamples];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        float v10 = self->_keywordAnalyzersNDAPI;
        id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v25;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v25 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              float v16 = [v15 getBestAnalyzedResultsFromAudioChunk:v9];
              -[CSBuiltInVoiceTrigger _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:](self, "_keywordAnalyzerNDAPI:hasResultAvailable:forChannel:", v15, v16, [v15 activeChannel]);
            }
            id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v12);
        }

        unint64_t channelSelectionDelay = self->_channelSelectionDelay;
        if (self->_hasTriggerPending && channelSelectionDelay >= self->_delayInSamplesRequiredForChannelSelection)
        {
          unint64_t v18 = [(CSBuiltInVoiceTrigger *)self _voiceTriggerFirstPassInfoFromAP];
          [(CSBuiltInVoiceTrigger *)self _reportVoiceTriggerFirstPassFireFromAPWithSource:1 voiceTriggerFirstPassInfo:v18];

          [(CSBuiltInVoiceTrigger *)self _reset];
        }
        else
        {
          self->_unint64_t channelSelectionDelay = channelSelectionDelay + v21;
        }
        v6 -= (unint64_t)v23;
        v7 += (uint64_t)v22;
      }
      while (v6);
    }
  }
}

- (BOOL)_shouldSkipAudioChunkHandling
{
  if (!self->_currentAsset)
  {
    id v5 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      float v16 = "-[CSBuiltInVoiceTrigger _shouldSkipAudioChunkHandling]";
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Could not find Assets. Cannot process Audio", (uint8_t *)&v15, 0xCu);
    }
    return 1;
  }
  if (self->_isSecondPassRunning || self->_isSiriClientListening || self->_attSiriState == 2) {
    return 1;
  }
  unsigned int v3 = [(CSBuiltInVoiceTrigger *)self _hasHearstRoutedAndNotInSplitter];
  if (CSIsHorseman()) {
    unsigned int v4 = 0;
  }
  else {
    unsigned int v4 = [(CSBuiltInVoiceTrigger *)self _hasHFPDuringPhoneCall];
  }
  if (!self->_voiceTriggerEnabled
    || self->_isPhraseSpotterBypassed
    || ([(CSBuiltInVoiceTrigger *)self _shouldCheckHearstStatus] & v3 ^ 1 | v4) != 1
    || (+[CSAVVCRecordingClientMonitor sharedInstance],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 numOfAVVCRecordingClients],
        v7,
        (unint64_t)v8 >= 2))
  {
    uint64_t v9 = qword_1002A3C28;
    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * qword_1002A3C28, 1) <= 0x1999999999999999uLL)
    {
      float v10 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        BOOL voiceTriggerEnabled = self->_voiceTriggerEnabled;
        BOOL isPhraseSpotterBypassed = self->_isPhraseSpotterBypassed;
        uint64_t v13 = v10;
        unint64_t v14 = +[CSAVVCRecordingClientMonitor sharedInstance];
        int v15 = 136316674;
        float v16 = "-[CSBuiltInVoiceTrigger _shouldSkipAudioChunkHandling]";
        __int16 v17 = 1026;
        BOOL v18 = voiceTriggerEnabled;
        __int16 v19 = 1026;
        BOOL v20 = isPhraseSpotterBypassed;
        __int16 v21 = 1026;
        unsigned int v22 = v3;
        __int16 v23 = 1026;
        unsigned int v24 = v4;
        __int16 v25 = 2050;
        id v26 = [v14 numOfAVVCRecordingClients];
        __int16 v27 = 2050;
        uint64_t v28 = qword_1002A3C28;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Bypass audio here because ::                   1> VoiceTrigger enabled = %{public}d;                   2> p"
          "hrase spotter bypassed = %{public}d;                   3> should ignore due to hearst routed and not in splitt"
          "er = %{public}d;                   4> has HFP during call = %{public}d;                   5> AVVC recording cl"
          "ient # = %{public}lu                   heartbeat = %{public}lld",
          (uint8_t *)&v15,
          0x38u);

        uint64_t v9 = qword_1002A3C28;
      }
    }
    qword_1002A3C28 = v9 + 1;
    return 1;
  }
  return 0;
}

- (void)_resetFirstExclaveAudioBufferMarkerIfNeeded
{
  if (!self->_isFirstExclaveAudioBuffer)
  {
    unsigned int v3 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      id v5 = "-[CSBuiltInVoiceTrigger _resetFirstExclaveAudioBufferMarkerIfNeeded]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
    }
    [(CSBuiltInVoiceTrigger *)self setIsFirstExclaveAudioBuffer:1];
  }
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10015D570;
  v8[3] = &unk_100253B08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)audioStreamProvider:(id)a3 numSamplesAvailableInExclave:(unint64_t)a4 hostTime:(unint64_t)a5 arrivalHostTimeToAudioRecorder:(unint64_t)a6 exclaveSampleCount:(unint64_t)a7
{
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10015D75C;
  v8[3] = &unk_100253B58;
  v8[4] = self;
  void v8[5] = a7;
  dispatch_async(queue, v8);
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  unint64_t v6 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    float v10 = "-[CSBuiltInVoiceTrigger audioStreamProvider:didStopStreamUnexpectedly:]";
    __int16 v11 = 2050;
    int64_t v12 = a4;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s stream stopped unexpectedly : %{public}ld", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10015DCDC;
  v8[3] = &unk_100253B58;
  v8[4] = self;
  void v8[5] = a4;
  dispatch_async(queue, v8);
}

- (void)_stopAOPVoiceTrigger
{
  if (CSHasAOP())
  {
    unsigned int v3 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      id v5 = "-[CSBuiltInVoiceTrigger _stopAOPVoiceTrigger]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
    }
    [(CSVoiceTriggerAlwaysOnProcessor *)self->_alwaysOnProcessorController disableVoiceTriggerOnAlwaysOnProcessorWithCompletion:0];
  }
}

- (void)_stopAPVoiceTrigger
{
  if (+[CSUtils isExclaveHardware])
  {
    unsigned int v3 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "-[CSBuiltInVoiceTrigger _stopAPVoiceTrigger]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ExclaveClient BargeIn stop", buf, 0xCu);
    }
    [(CSExclaveFirstPassVoiceTriggerAnalyzing *)self->_exclaveClient stopBargeInVoiceTrigger];
  }
  int v4 = [(CSBuiltInVoiceTrigger *)self audioStream];

  if (v4)
  {
    validationTimer = self->_validationTimer;
    if (validationTimer)
    {
      dispatch_source_cancel(validationTimer);
      unint64_t v6 = self->_validationTimer;
      self->_validationTimer = 0;
    }
    id v7 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "-[CSBuiltInVoiceTrigger _stopAPVoiceTrigger]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Waiting for recordingWillStartGroup before scheduling stopAudioStream", buf, 0xCu);
    }
    recordingWillStartGroup = self->_recordingWillStartGroup;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10015E000;
    block[3] = &unk_100253AE0;
    void block[4] = self;
    dispatch_group_notify(recordingWillStartGroup, queue, block);
  }
  else
  {
    float v10 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v13 = "-[CSBuiltInVoiceTrigger _stopAPVoiceTrigger]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s skip stopAPVoiceTrigger as audioStream not existing", buf, 0xCu);
    }
  }
}

- (BOOL)_isVoiceTriggerStateTransitionEvent:(id)a3
{
  id v3 = a3;
  if ([v3 type] == (id)1)
  {
    int v4 = [v3 activationInfo];
    id v5 = [v4 objectForKeyedSubscript:@"VoiceTriggerEnabledKey"];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_isBuiltInAOPVoiceTriggerEvent:(id)a3
{
  id v3 = a3;
  if ([v3 type] == (id)1)
  {
    int v4 = [v3 activationInfo];
    id v5 = [v4 objectForKeyedSubscript:@"VoiceTriggerEnabledKey"];
    BOOL v6 = v5 == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_shouldCheckHearstStatus
{
  v2 = +[CSSiriEnabledMonitor sharedInstance];
  unsigned __int8 v3 = [v2 isEnabled];

  return v3;
}

- (BOOL)_hasHearstRoutedAndNotInSplitter
{
  unint64_t currentSplitterState = self->_currentSplitterState;
  int64_t hearstRouteStatus = self->_hearstRouteStatus;
  BOOL isJarvisConnected = self->_isJarvisConnected;
  if (isJarvisConnected) {
    BOOL isJarvisConnected = [(CSBuiltInVoiceTrigger *)self _currentJarvisTriggerMode] != -1;
  }
  return currentSplitterState - 5 < 0xFFFFFFFFFFFFFFFDLL && (unint64_t)(hearstRouteStatus - 1) < 2
      || isJarvisConnected;
}

- (BOOL)_hasPhoneCallOnNonBargeInDevice
{
  if (self->_phoneCallState - 2 < 3) {
    return +[CSUtils isIOSDeviceSupportingBargeIn] ^ 1;
  }
  v2 = +[CSMXRingtoneMonitor sharedInstance];
  unsigned int v3 = [v2 isAnyRingtoneCurrentlyPlaying];

  if (v3) {
    return +[CSUtils isIOSDeviceSupportingBargeIn] ^ 1;
  }
  else {
    return 0;
  }
}

- (BOOL)_shouldHandleAOPVoiceTrigger
{
  unsigned int v3 = +[CSUserSessionActiveMonitor sharedInstance];
  unsigned __int8 v4 = [v3 isUserActive];

  if ((v4 & 1) == 0)
  {
    id v5 = CSLogCategoryVT;
    BOOL v9 = os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v9) {
      return result;
    }
    int v19 = 136315138;
    BOOL v20 = "-[CSBuiltInVoiceTrigger _shouldHandleAOPVoiceTrigger]";
    id v8 = "%s User doesn't have ownership of AOP. ignore AOP trigger notification";
    goto LABEL_7;
  }
  if (self->_isPhraseSpotterBypassed)
  {
    id v5 = CSLogCategoryVT;
    BOOL v6 = os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v6) {
      return result;
    }
    int v19 = 136315138;
    BOOL v20 = "-[CSBuiltInVoiceTrigger _shouldHandleAOPVoiceTrigger]";
    id v8 = "%s phraseSpotter bypassed, ignore AOP trigger notification";
    goto LABEL_7;
  }
  if ([(CSBuiltInVoiceTrigger *)self _shouldCheckHearstStatus]
    && [(CSBuiltInVoiceTrigger *)self _hasHearstRoutedAndNotInSplitter])
  {
    id v5 = CSLogCategoryVT;
    BOOL v10 = os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v10)
    {
      int v19 = 136315138;
      BOOL v20 = "-[CSBuiltInVoiceTrigger _shouldHandleAOPVoiceTrigger]";
      id v8 = "%s Has hearst routed and not in splitter ignore AOP trigger notification";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v19, 0xCu);
      return 0;
    }
  }
  else if ([(CSBuiltInVoiceTrigger *)self _hasPhoneCallOnNonBargeInDevice])
  {
    id v5 = CSLogCategoryVT;
    BOOL v11 = os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v11)
    {
      int v19 = 136315138;
      BOOL v20 = "-[CSBuiltInVoiceTrigger _shouldHandleAOPVoiceTrigger]";
      id v8 = "%s Is in phone call state but we are a non barge in device";
      goto LABEL_7;
    }
  }
  else
  {
    int64_t v12 = +[CSSiriClientBehaviorMonitor sharedInstance];
    unsigned int v13 = [v12 isStreaming];

    if (v13)
    {
      id v5 = CSLogCategoryVT;
      BOOL v14 = os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (v14)
      {
        int v19 = 136315138;
        BOOL v20 = "-[CSBuiltInVoiceTrigger _shouldHandleAOPVoiceTrigger]";
        id v8 = "%s Siri Client is already streaming, ignore AOP trigger notification";
        goto LABEL_7;
      }
    }
    else if ([(CSBuiltInVoiceTrigger *)self _shouldCheckHearstStatus] {
           && self->_currentSplitterState == 4)
    }
    {
      id v5 = CSLogCategoryVT;
      BOOL v15 = os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (v15)
      {
        int v19 = 136315138;
        BOOL v20 = "-[CSBuiltInVoiceTrigger _shouldHandleAOPVoiceTrigger]";
        id v8 = "%s Device has wireless splitter mode with two hearst, ignore AOP trigger notification";
        goto LABEL_7;
      }
    }
    else
    {
      float v16 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v17 = v16;
        BOOL v18 = [(CSBuiltInVoiceTrigger *)self _stateName:[(CSBuiltInVoiceTrigger *)self _currentState]];
        int v19 = 136315394;
        BOOL v20 = "-[CSBuiltInVoiceTrigger _shouldHandleAOPVoiceTrigger]";
        __int16 v21 = 2114;
        unsigned int v22 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger current state : %{public}@", (uint8_t *)&v19, 0x16u);
      }
      return ![(CSBuiltInVoiceTrigger *)self _currentState]
          || (id)[(CSBuiltInVoiceTrigger *)self _currentState] == (id)2;
    }
  }
  return result;
}

- (BOOL)_shouldEnableAPVoiceTrigger
{
  unint64_t v3 = [(CSBuiltInVoiceTrigger *)self _currentState];
  if (v3 != 1) {
    LOBYTE(v3) = (id)[(CSBuiltInVoiceTrigger *)self _currentState] == (id)2;
  }
  return v3;
}

- (BOOL)_shouldEnableAOPVoiceTrigger
{
  return (CSIsHorseman() & 1) == 0 && (id)[(CSBuiltInVoiceTrigger *)self _currentState] != (id)3;
}

- (void)_startAOPVoiceTrigger
{
  if (self->_currentAsset && CSHasAOP())
  {
    unint64_t v3 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v8 = "-[CSBuiltInVoiceTrigger _startAOPVoiceTrigger]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
    if (+[CSUtils isExclaveHardware])
    {
      objc_initWeak((id *)buf, self);
      alwaysOnProcessorController = self->_alwaysOnProcessorController;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_10015E9E8;
      v5[3] = &unk_1002531B8;
      objc_copyWeak(&v6, (id *)buf);
      [(CSVoiceTriggerAlwaysOnProcessor *)alwaysOnProcessorController disableVoiceTriggerOnAlwaysOnProcessorWithCompletion:v5];
      objc_destroyWeak(&v6);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(CSVoiceTriggerAlwaysOnProcessor *)self->_alwaysOnProcessorController enableVoiceTriggerOnAlwaysOnProcessorWithAsset:self->_currentAsset completion:0];
    }
  }
}

- (void)_APModeValidationTimerFired
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10015EBE4;
  v4[3] = &unk_1002533D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_startAPVoiceTriggerWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    float v16 = "-[CSBuiltInVoiceTrigger _startAPVoiceTriggerWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (+[CSUtils isExclaveHardware])
  {
    id v6 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      float v16 = "-[CSBuiltInVoiceTrigger _startAPVoiceTriggerWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s ExclaveClient BargeIn start", buf, 0xCu);
    }
    [(CSExclaveFirstPassVoiceTriggerAnalyzing *)self->_exclaveClient startBargeInVoiceTrigger];
  }
  validationTimer = self->_validationTimer;
  if (validationTimer)
  {
    dispatch_source_cancel(validationTimer);
    id v8 = self->_validationTimer;
    self->_validationTimer = 0;
  }
  BOOL v9 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  BOOL v10 = self->_validationTimer;
  self->_validationTimer = v9;

  dispatch_time_t v11 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer((dispatch_source_t)self->_validationTimer, v11, 0x1A3185C5000uLL, 0x3B9ACA00uLL);
  objc_initWeak((id *)buf, self);
  int64_t v12 = self->_validationTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10015EFB8;
  handler[3] = &unk_1002533D0;
  objc_copyWeak(&v14, (id *)buf);
  dispatch_source_set_event_handler(v12, handler);
  dispatch_resume((dispatch_object_t)self->_validationTimer);
  [(CSBuiltInVoiceTrigger *)self _startVoiceTriggerWithCompletion:v4];
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)_startVoiceTriggerWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v10 = "-[CSBuiltInVoiceTrigger _startVoiceTriggerWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (self->_isListenPollingStarting)
  {
    id v6 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v10 = "-[CSBuiltInVoiceTrigger _startVoiceTriggerWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Already started listen polling, skip", buf, 0xCu);
    }
    if (v4) {
      v4[2](v4, 0);
    }
  }
  else
  {
    self->_isListenPollingStarting = 1;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10015F19C;
    v7[3] = &unk_100253150;
    v7[4] = self;
    id v8 = v4;
    [(CSBuiltInVoiceTrigger *)self _startListenPollingWithInterval:v7 completion:1.0];
  }
}

- (void)_stopListening
{
  unint64_t v3 = [(CSBuiltInVoiceTrigger *)self audioStream];

  if (v3)
  {
    id v4 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v9 = "-[CSBuiltInVoiceTrigger _stopListening]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Waiting for recordingWillStartGroup before scheduling stopAudioStream", buf, 0xCu);
    }
    recordingWillStartGroup = self->_recordingWillStartGroup;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10015F3D4;
    block[3] = &unk_100253AE0;
    void block[4] = self;
    dispatch_group_notify(recordingWillStartGroup, queue, block);
  }
}

- (BOOL)_shouldReuseBuiltInAudioProvider
{
  if (CSIsIOS()
    && (+[CSUtils isExclaveHardware] & 1) != 0)
  {
    return 0;
  }
  else
  {
    return CSIsOSX() ^ 1;
  }
}

- (void)_requestStartAudioStreamWithSource:(unint64_t)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10015FA0C;
  v32[3] = &unk_100253100;
  id v9 = a5;
  id v33 = v9;
  BOOL v10 = objc_retainBlock(v32);
  unsigned int v11 = [(CSBuiltInVoiceTrigger *)self _shouldReuseBuiltInAudioProvider];
  if (a3 == 1)
  {
    if (v11)
    {
      uint64_t v12 = [(CSSpeechManager *)self->_speechManager audioProviderWithStreamID:1];
      if (v12)
      {
        unsigned int v13 = (void *)v12;
        [(CSBuiltInVoiceTrigger *)self setAudioProvider:v12];
        id v14 = objc_alloc_init((Class)CSAudioStreamRequest);
        id v15 = 0;
LABEL_8:
        __int16 v17 = +[CSAudioRecordContext contextForBuiltInVoiceTrigger];
        uint64_t v18 = +[CSAudioStreamRequest defaultRequestWithContext:v17];

        id v14 = (id)v18;
LABEL_9:
        [v14 setRequiresHistoricalBuffer:1];
        [v14 setClientIdentity:2];
        if (+[CSUtils isExclaveHardware])
        {
          if ((+[CSUtils isHypotheticalAudioRouteBluetoothFromAudioSessinoId:0] & 1) == 0)
          {
            [v14 setRequestExclaveAudio:1];
            int v19 = CSLogCategoryVT;
            if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v35 = "-[CSBuiltInVoiceTrigger _requestStartAudioStreamWithSource:context:completion:]";
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s Asking Exclave Audio", buf, 0xCu);
            }
          }
        }
        BOOL v20 = (objc_class *)objc_opt_class();
        __int16 v21 = NSStringFromClass(v20);
        id v30 = 0;
        unsigned int v22 = [v13 audioStreamWithRequest:v14 streamName:v21 error:&v30];
        id v23 = v30;

        if (v22)
        {
          [(CSBuiltInVoiceTrigger *)self setAudioStream:v22];
          [v22 setDelegate:self];
        }
        else
        {
          unsigned int v24 = (void *)CSLogCategoryVT;
          if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
          {
            id v26 = v24;
            __int16 v27 = [v23 localizedDescription];
            *(_DWORD *)buf = 136315394;
            v35 = "-[CSBuiltInVoiceTrigger _requestStartAudioStreamWithSource:context:completion:]";
            __int16 v36 = 2114;
            char v37 = v27;
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s Failed to get audio stream : %{public}@", buf, 0x16u);
          }
        }
        ((void (*)(void *, BOOL, id))v10[2])(v10, v22 != 0, v23);

        goto LABEL_21;
      }
    }
  }
  speechManager = self->_speechManager;
  id v31 = 0;
  unsigned int v13 = [(CSSpeechManager *)speechManager audioProviderWithContext:v8 error:&v31];
  id v15 = v31;
  if (v13)
  {
    [(CSBuiltInVoiceTrigger *)self setAudioProvider:v13];
    id v14 = objc_alloc_init((Class)CSAudioStreamRequest);
    if (a3 > 0xC || ((1 << a3) & 0x1306) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  __int16 v25 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
  {
    uint64_t v28 = v25;
    v29 = [v15 localizedDescription];
    *(_DWORD *)buf = 136315394;
    v35 = "-[CSBuiltInVoiceTrigger _requestStartAudioStreamWithSource:context:completion:]";
    __int16 v36 = 2114;
    char v37 = v29;
    _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s Getting audio stream provider has failed : %{public}@", buf, 0x16u);
  }
  ((void (*)(void *, void, id))v10[2])(v10, 0, v15);
LABEL_21:
}

- (void)_startListenWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v19 = "-[CSBuiltInVoiceTrigger _startListenWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10015FC40;
  v16[3] = &unk_100253100;
  id v6 = v4;
  id v17 = v6;
  id v7 = objc_retainBlock(v16);
  id v8 = +[CSAudioRecordContext contextForBuiltInVoiceTrigger];
  unint64_t phoneCallState = self->_phoneCallState;
  uint64_t v10 = 8;
  if (phoneCallState != 2 && phoneCallState != 4)
  {
    unsigned int v11 = +[CSMXRingtoneMonitor sharedInstance];
    unsigned __int8 v12 = [v11 isAnyRingtoneCurrentlyPlaying];

    if (v12)
    {
      uint64_t v10 = 8;
    }
    else
    {
      if (self->_phoneCallState != 3)
      {
        uint64_t v10 = 1;
        goto LABEL_10;
      }
      uint64_t v10 = 9;
    }
  }
  [v8 setIsRequestDuringActiveCall:1];
LABEL_10:
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10015FC58;
  v14[3] = &unk_100253150;
  v14[4] = self;
  id v15 = v7;
  unsigned int v13 = v7;
  [(CSBuiltInVoiceTrigger *)self _requestStartAudioStreamWithSource:v10 context:v8 completion:v14];
}

- (void)_startListenPollingWithInterval:(double)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    float v16 = "-[CSBuiltInVoiceTrigger _startListenPollingWithInterval:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if ([(CSPolicy *)self->_voiceTriggerAPModeSuspendPolicy isEnabled])
  {
    id v8 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      float v16 = "-[CSBuiltInVoiceTrigger _startListenPollingWithInterval:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Skip listen polling since VoiceTrigger AP mode is disabled", buf, 0xCu);
    }
    [(CSBuiltInVoiceTrigger *)self _notifyEvent:1];
  }
  else
  {
    id v9 = [(CSBuiltInVoiceTrigger *)self audioStream];
    if ([v9 isStreaming])
    {
    }
    else
    {
      BOOL voiceTriggerEnabled = self->_voiceTriggerEnabled;

      if (voiceTriggerEnabled)
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_1001602EC;
        v12[3] = &unk_1002530D8;
        v12[4] = self;
        double v14 = a3;
        id v13 = v6;
        [(CSBuiltInVoiceTrigger *)self _startListenWithCompletion:v12];

        goto LABEL_15;
      }
    }
    unsigned int v11 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      float v16 = "-[CSBuiltInVoiceTrigger _startListenPollingWithInterval:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Skip listen polling since audio is streaming / VoiceTrigger disabled", buf, 0xCu);
    }
  }
  if (v6) {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
LABEL_15:
}

- (void)_transitAOPModeIfNeededSync:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10016059C;
  v4[3] = &unk_100253AB8;
  void v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

- (void)_transitVoiceTriggerStatus:(BOOL)a3 force:(BOOL)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100160628;
  v5[3] = &unk_100253088;
  BOOL v6 = a3;
  void v5[4] = self;
  BOOL v7 = a4;
  dispatch_async(queue, v5);
}

- (void)_setIsSecondPassRunning:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isSecondPassRunning = a3;
  p_secondPassProgressDelegate = &self->_secondPassProgressDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secondPassProgressDelegate);
  if (WeakRetained)
  {
    BOOL v7 = WeakRetained;
    int v8 = CSIsHorseman();

    if (v8)
    {
      if (v3)
      {
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10016097C;
        v13[3] = &unk_100253060;
        v13[4] = self;
        +[CSMyriadPHash signalEstimateWithBuilder:v13];
        double v10 = v9;
        id v11 = objc_loadWeakRetained((id *)p_secondPassProgressDelegate);
        [v11 secondPassDidStartForClient:1 deviceId:0 withFirstPassEstimate:v10];
      }
      else
      {
        id v12 = objc_loadWeakRetained((id *)p_secondPassProgressDelegate);
        [v12 secondPassDidStopForClient:1 deviceId:0];
      }
    }
  }
}

- (void)_setAsset:(id)a3 forceExclaveToUsePreInstalledAsset:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (v7)
  {
    if (+[CSUtils isExclaveHardware])
    {
      BOOL v8 = [v7 assetVariant] == (id)2;
      if (v4)
      {
        double v9 = CSLogCategoryVT;
        BOOL v8 = 0;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          char v41 = "-[CSBuiltInVoiceTrigger _setAsset:forceExclaveToUsePreInstalledAsset:]";
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Falling back to preinstalled assets for EK", buf, 0xCu);
          BOOL v8 = 0;
        }
      }
      double v10 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
      [(CSExclaveAssetsControlling *)self->_exclaveAssetsController setAssetForLocale:v10 isOTA:v8 completion:&stru_100253010];
    }
    objc_storeStrong((id *)&self->_currentAsset, a3);
    id v11 = +[CSVoiceTriggerFirstPassConfigDecoder decodeConfigFrom:self->_currentAsset];
    [(CSBuiltInVoiceTrigger *)self setFirstPassConfig:v11];
    id v12 = [(CSBuiltInVoiceTrigger *)self firstPassConfig];
    [v12 delaySecondsForChannelSelection];
    float v14 = v13;
    +[CSConfig inputRecordingSampleRate];
    self->_unint64_t delayInSamplesRequiredForChannelSelection = (unint64_t)(float)(v14 * v15);

    float v16 = [(CSBuiltInVoiceTrigger *)self firstPassConfig];
    [v16 processingChunkSeconds];
    float v18 = v17;
    +[CSConfig inputRecordingSampleRate];
    self->_unint64_t processingChunkSamples = (unint64_t)(float)(v18 * v19);

    keywordAnalyzersNDAPI = self->_keywordAnalyzersNDAPI;
    if (keywordAnalyzersNDAPI)
    {
      [(NSMutableArray *)keywordAnalyzersNDAPI removeAllObjects];
    }
    else
    {
      unsigned int v22 = +[NSMutableArray array];
      id v23 = self->_keywordAnalyzersNDAPI;
      self->_keywordAnalyzersNDAPI = v22;
    }
    unsigned int v24 = +[CSPowerLogger sharedPowerLogger];
    __int16 v25 = +[CSVoiceTriggerEnabledMonitor sharedInstance];
    id v26 = [v25 isEnabled];
    __int16 v27 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
    uint64_t v28 = [(CSAsset *)self->_currentAsset configVersion];
    [v24 powerLogSiriConfigWithVoiceTriggerEnabled:v26 withLanguage:v27 withModelVersion:v28];

    v29 = [(CSBuiltInVoiceTrigger *)self firstPassConfig];
    id v30 = [v29 configPathNDAPI];

    id v31 = [(CSAsset *)self->_currentAsset resourcePath];
    id v32 = [(CSBuiltInVoiceTrigger *)self firstPassConfig];
    id v33 = [v32 processingChannelsBitset];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100160EF8;
    v36[3] = &unk_100253038;
    id v34 = v30;
    id v37 = v34;
    float v38 = self;
    id v35 = v31;
    id v39 = v35;
    +[CSUtils iterateBitset:v33 block:v36];

    [(CSBuiltInVoiceTrigger *)self _reset];
    if ([(CSBuiltInVoiceTrigger *)self _shouldEnableAOPVoiceTrigger]) {
      [(CSBuiltInVoiceTrigger *)self _startAOPVoiceTrigger];
    }
    [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass setAsset:v7];
    if (!self->_firstTimeAssetConfigured) {
      self->_firstTimeAssetConfigured = 1;
    }
  }
  else
  {
    __int16 v21 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      char v41 = "-[CSBuiltInVoiceTrigger _setAsset:forceExclaveToUsePreInstalledAsset:]";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s asset is nil, stop initialization", buf, 0xCu);
    }
  }
}

- (void)setAsset:(id)a3 forceExclaveToUsePreInstalledAsset:(BOOL)a4
{
  id v6 = a3;
  id v7 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    float v14 = "-[CSBuiltInVoiceTrigger setAsset:forceExclaveToUsePreInstalledAsset:]";
    __int16 v15 = 2114;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }
  [v6 logAssetVersionForInsight];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001613E0;
  block[3] = &unk_1002537C0;
  void block[4] = self;
  id v11 = v6;
  BOOL v12 = a4;
  id v9 = v6;
  dispatch_async(queue, block);
}

- (void)setAsset:(id)a3
{
}

- (void)setSecondPassProgressDelegate:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001614C8;
  block[3] = &unk_100253798;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_reset
{
  self->_hasTriggerPending = 0;
  self->_bestScore = -INFINITY;
  onsetResult = self->_onsetResult;
  self->_bestChannel = 0;
  self->_onsetResult = 0;

  self->_onsetChannel = 0;
  self->_unint64_t channelSelectionDelay = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_keywordAnalyzersNDAPI;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v8), "reset", (void)v11);
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  id v9 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
  channelSelectionScores = self->_channelSelectionScores;
  self->_channelSelectionScores = v9;
}

- (void)reset
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001616B8;
  block[3] = &unk_100253AE0;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)start
{
  BOOL v3 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v34 = "-[CSBuiltInVoiceTrigger start]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass start];
  voiceTriggerStartPolicy = self->_voiceTriggerStartPolicy;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100161C78;
  v31[3] = &unk_100252EE0;
  objc_copyWeak(&v32, (id *)buf);
  [(CSPolicy *)voiceTriggerStartPolicy setCallback:v31];
  if ([(CSPolicy *)self->_voiceTriggerStartPolicy isEnabled])
  {
    [(CSBuiltInVoiceTrigger *)self _transitVoiceTriggerStatus:1 force:0];
  }
  else
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100161D78;
    block[3] = &unk_100253AE0;
    void block[4] = self;
    dispatch_async(queue, block);
  }
  voiceTriggerAPModeSuspendPolicy = self->_voiceTriggerAPModeSuspendPolicy;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100003AC4;
  v28[3] = &unk_100252EE0;
  objc_copyWeak(&v29, (id *)buf);
  [(CSPolicy *)voiceTriggerAPModeSuspendPolicy setCallback:v28];
  if (CSHasAOP())
  {
    uint64_t v7 = +[CSDeviceActivationEventNotificationHandler sharedInstance];
    [v7 setDelegate:self forType:1];
    [v7 start];
  }
  id v8 = +[CSSiriClientBehaviorMonitor sharedInstance];
  [v8 registerObserver:self];

  id v9 = +[CSAudioServerCrashMonitor sharedInstance];
  [v9 addObserver:self];

  double v10 = +[CSAVVCRecordingClientMonitor sharedInstance];
  [v10 addObserver:self];

  long long v11 = +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor];
  [v11 addObserver:self];

  long long v12 = +[CSAttSiriStateMonitor sharedInstance];
  [v12 addObserver:self];

  long long v13 = self->_queue;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100161D80;
  v27[3] = &unk_100253AE0;
  v27[4] = self;
  dispatch_async(v13, v27);
  long long v14 = +[CSVoiceTriggerEnabledMonitor sharedInstance];
  [v14 addObserver:self];

  [(CSAudioRouteChangeMonitor *)self->_audioRouteChangeMonitor addObserver:self];
  __int16 v15 = +[CSBluetoothWirelessSplitterMonitor sharedInstance];
  [v15 addObserver:self];

  id v16 = +[CSBluetoothWirelessSplitterMonitor sharedInstance];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100161E00;
  v26[3] = &unk_100252F30;
  v26[4] = self;
  [v16 splitterState:v26];

  if (CSIsASMacWithAOP()
    && +[CSUtils supportHearstVoiceTrigger])
  {
    [(CSAudioRouteChangeMonitor *)self->_audioRouteChangeMonitor addObserver:self];
    audioRouteChangeMonitor = self->_audioRouteChangeMonitor;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100161E78;
    v25[3] = &unk_100252F58;
    v25[4] = self;
    [(CSAudioRouteChangeMonitor *)audioRouteChangeMonitor getHearstRouteStatus:v25];
  }
  float v18 = self->_audioRouteChangeMonitor;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100161EEC;
  v24[3] = &unk_100252F58;
  v24[4] = self;
  [(CSAudioRouteChangeMonitor *)v18 getHearstRouteStatus:v24];
  float v19 = self->_audioRouteChangeMonitor;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100161F60;
  v23[3] = &unk_100252F80;
  v23[4] = self;
  [(CSAudioRouteChangeMonitor *)v19 getJarvisConnected:v23];
  [(CSStateCapture *)self->_stateCapture start];
  stateCapture = self->_stateCapture;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100161FD8;
  v21[3] = &unk_100252FD0;
  objc_copyWeak(&v22, (id *)buf);
  [(CSStateCapture *)stateCapture setStateCaptureBlock:v21];
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v32);
  objc_destroyWeak((id *)buf);
}

- (CSBuiltInVoiceTrigger)initWithTargetQueue:(id)a3 withSpeechManager:(id)a4
{
  return [(CSBuiltInVoiceTrigger *)self initWithTargetQueue:a3 withSpeechManager:a4 withAudioRouteChangeMonitor:0];
}

- (CSBuiltInVoiceTrigger)initWithTargetQueue:(id)a3 withSpeechManager:(id)a4 withAudioRouteChangeMonitor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v48.receiver = self;
  v48.super_class = (Class)CSBuiltInVoiceTrigger;
  long long v11 = [(CSBuiltInVoiceTrigger *)&v48 init];
  if (v11)
  {
    dispatch_queue_t v12 = dispatch_queue_create("VoiceTrigger First Pass Queue", 0);
    long long v13 = (void *)*((void *)v11 + 7);
    *((void *)v11 + 7) = v12;

    if (v8) {
      dispatch_set_target_queue(*((dispatch_object_t *)v11 + 7), v8);
    }
    long long v14 = +[NSUUID UUID];
    __int16 v15 = [v14 UUIDString];

    id v16 = +[NSString stringWithFormat:@"builtInVoiceTrigger-%@", v15];
    [v11 setName:v16];

    [v11 _setupStateMachine];
    if (CSHasAOP())
    {
      id v17 = objc_alloc_init((Class)CSVoiceTriggerAlwaysOnProcessor);
      float v18 = (void *)*((void *)v11 + 27);
      *((void *)v11 + 27) = v17;
    }
    uint64_t v19 = +[CSVoiceTriggerAPModeSuspendPolicyFactory policy];
    BOOL v20 = (void *)*((void *)v11 + 25);
    *((void *)v11 + 25) = v19;

    if (+[CSUtils isExclaveHardware])
    {
      uint64_t v21 = +[CSExclaveMessageHandlingFactory exclaveFirstPassVoiceTriggerAnalyzer];
      id v22 = (void *)*((void *)v11 + 44);
      *((void *)v11 + 44) = v21;

      uint64_t v23 = +[CSExclaveMessageHandlingFactory exclaveAssetsController];
      unsigned int v24 = (void *)*((void *)v11 + 45);
      *((void *)v11 + 45) = v23;

      [v11 _resetFirstExclaveAudioBufferMarkerIfNeeded];
    }
    if ([v11 _shouldSecondPassKeepAlive])
    {
      __int16 v25 = [[CSVoiceTriggerSecondPass alloc] initWithPHSEnabled:1];
      id v26 = (void *)*((void *)v11 + 20);
      *((void *)v11 + 20) = v25;

      [*((id *)v11 + 20) setSecondPassClient:1];
      __int16 v27 = [v11 delegate];
      [*((id *)v11 + 20) setDelegate:v27];
    }
    uint64_t v28 = (void **)(v11 + 304);
    objc_storeStrong((id *)v11 + 38, a4);
    if (!*((void *)v11 + 38))
    {
      uint64_t v29 = +[CSSpeechManager sharedManagerForCoreSpeechDaemon];
      id v30 = *v28;
      *uint64_t v28 = (void *)v29;
    }
    id v31 = (void **)(v11 + 296);
    objc_storeStrong((id *)v11 + 37, a5);
    if (!*((void *)v11 + 37))
    {
      uint64_t v32 = +[CSAudioRouteChangeMonitor sharedInstance];
      id v33 = *v31;
      *id v31 = (void *)v32;
    }
    uint64_t v34 = +[CSBuiltInVoiceTriggerEnabledPolicy builtInVoiceTriggerEnabledPolicy];
    id v35 = (void *)*((void *)v11 + 5);
    *((void *)v11 + 5) = v34;

    dispatch_group_t v36 = dispatch_group_create();
    id v37 = (void *)*((void *)v11 + 28);
    *((void *)v11 + 28) = v36;

    uint64_t v38 = +[NSMutableArray array];
    id v39 = (void *)*((void *)v11 + 22);
    *((void *)v11 + 22) = v38;

    v11[13] = 0;
    *((void *)v11 + 29) = 0;
    v11[15] = 0;
    uint64_t v40 = +[NSMutableArray array];
    char v41 = (void *)*((void *)v11 + 31);
    *((void *)v11 + 31) = v40;

    *((void *)v11 + 39) = 0;
    +[CSConfig inputRecordingBufferDuration];
    *((void *)v11 + 40) = (unint64_t)(2.0 / v42);
    v11[17] = 0;
    v43 = [[CSVoiceTriggerUserSelectedPhrase alloc] initWithEndpointId:0];
    float v44 = (void *)*((void *)v11 + 43);
    *((void *)v11 + 43) = v43;

    id v45 = objc_alloc_init((Class)CSStateCapture);
    char v46 = (void *)*((void *)v11 + 41);
    *((void *)v11 + 41) = v45;
  }
  return (CSBuiltInVoiceTrigger *)v11;
}

@end