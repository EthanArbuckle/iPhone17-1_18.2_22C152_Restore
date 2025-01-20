@interface CSAudioProvider
- (BOOL)_activateAudioSessionWithReason:(unint64_t)a3 error:(id *)a4;
- (BOOL)_canSetContext;
- (BOOL)_clearListeningMicIndicatorProperty;
- (BOOL)_deactivateAudioSession:(unint64_t)a3 error:(id *)a4;
- (BOOL)_didPlayStartAlertSoundForSiri:(id)a3 audioStream:(id)a4;
- (BOOL)_isDuckingOnSpeakerOutputSupportedWithCurrentRoute;
- (BOOL)_prepareAudioStreamSync:(id)a3 request:(id)a4 error:(id *)a5;
- (BOOL)_setListeningMicIndicatorProperty;
- (BOOL)_shouldDuckOnBuiltInSpeaker;
- (BOOL)_shouldHandleStartPendingOnStopping:(unint64_t)a3 withStopReason:(int64_t)a4;
- (BOOL)_shouldStopRecording;
- (BOOL)activateAudioSessionWithReason:(unint64_t)a3 dynamicAttribute:(unint64_t)a4 bundleID:(id)a5 error:(id *)a6;
- (BOOL)audioSystemRecovering;
- (BOOL)currentSessionShouldDuckOnBuiltInSpeaker;
- (BOOL)deactivateAudioSession:(unint64_t)a3 error:(id *)a4;
- (BOOL)isNarrowBand;
- (BOOL)isRecording;
- (BOOL)isTransferringExclaveAudioSample;
- (BOOL)playAlertSoundForType:(int64_t)a3;
- (BOOL)playRecordStartingAlertAndResetEndpointerWithAlertOverride:(int64_t)a3;
- (BOOL)prepareAudioStreamSync:(id)a3 request:(id)a4 error:(id *)a5;
- (BOOL)prewarmAudioSessionWithError:(id *)a3;
- (BOOL)setAlertSoundFromURL:(id)a3 forType:(int64_t)a4 force:(BOOL)a5;
- (BOOL)setCurrentContext:(id)a3 error:(id *)a4;
- (BOOL)supportsDuckingOnCurrentRouteWithError:(id *)a3;
- (BOOL)waitingForAlertFinish;
- (CSADPPreventStandbyAssertion)adpAssertion;
- (CSAudioAlertProvidingDelegate)alertDelegate;
- (CSAudioCircularBuffer)circularBuffer;
- (CSAudioPreprocessor)audioPreprocessor;
- (CSAudioProvider)initWithAudioStreamHandleId:(unint64_t)a3 audioStreamType:(int64_t)a4 audioRecordContext:(id)a5 audioRecorder:(id)a6;
- (CSAudioProvider)initWithAudioStreamHandleId:(unint64_t)a3 audioStreamType:(int64_t)a4 audioRecordContext:(id)a5 audioRecorder:(id)a6 phoneCallStateMonitor:(id)a7;
- (CSAudioProviderDelegate)providerDelegate;
- (CSAudioRecordContext)lastAudioRecorderContext;
- (CSAudioRecordDeviceIndicator)recordDeviceIndicator;
- (CSAudioRecorder)audioRecorder;
- (CSAudioSessionProvidingDelegate)sessionDelegate;
- (CSAudioTimeConverter)audioTimeConverter;
- (CSAudioTimeConverter)exclaveAudioTimeConverter;
- (CSMicUsageReporter)micUsageReporter;
- (CSOSTransaction)recordingTransaction;
- (CSPhoneCallStateMonitor)phoneCallStateMonitor;
- (CSStateCapture)stateCapture;
- (NSHashTable)alertPlaybackFinishWaitingStreams;
- (NSHashTable)historicalBufferRequestStreams;
- (NSHashTable)startPendingOnStoppingStreams;
- (NSHashTable)startPendingStreams;
- (NSHashTable)stopPendingStreams;
- (NSHashTable)streams;
- (NSMutableArray)alertPlaybackFinishWaitingCompletions;
- (NSMutableArray)pendingStartCompletions;
- (NSMutableArray)pendingStopCompletions;
- (NSMutableArray)streamHolders;
- (NSMutableDictionary)listeningMicIndicatorLocks;
- (NSMutableDictionary)recordModeLocks;
- (NSMutableDictionary)startPendingOnStoppingStreamToCompletionDict;
- (NSString)UUID;
- (NSUUID)alertPlaybackFinishTimeoutToken;
- (NSUUID)startRecordingWatchDogToken;
- (NSUUID)stopRecordingWatchDogToken;
- (OS_dispatch_group)recordingWillStartGroup;
- (OS_dispatch_queue)loggingQueue;
- (OS_dispatch_queue)recordQueue;
- (OS_dispatch_queue)streamHandleQueue;
- (OS_dispatch_source)audioPacketWatchdog;
- (float)averagePowerForChannel:(unint64_t)a3;
- (float)circularBufferInputRecordingDuration;
- (float)peakPowerForChannel:(unint64_t)a3;
- (id)_acquireListeningMicIndicatorLockFrom:(unint64_t)a3;
- (id)_acquireRecordModeLockFrom:(unint64_t)a3;
- (id)_audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4;
- (id)_audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4 channelIdx:(unint64_t)a5;
- (id)_audioStreamWithRequest:(id)a3 streamName:(id)a4 error:(id *)a5;
- (id)_streamStateName:(unint64_t)a3;
- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4;
- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4 channelIdx:(unint64_t)a5;
- (id)audioChunkToEndFrom:(unint64_t)a3;
- (id)audioChunkToEndFrom:(unint64_t)a3 channelIdx:(unint64_t)a4;
- (id)audioDeviceInfo;
- (id)audioMetric;
- (id)audioStreamWithRequest:(id)a3 streamName:(id)a4 error:(id *)a5;
- (id)holdAudioStreamWithDescription:(id)a3 option:(id)a4;
- (id)playbackRoute;
- (id)recordDeviceInfo;
- (id)recordRoute;
- (id)recordSettings;
- (int)circularBufferNumInputChannel;
- (int64_t)audioStreamType;
- (unint64_t)alertStartTime;
- (unint64_t)audioPacketDeliveryCount;
- (unint64_t)audioStreamHandleId;
- (unint64_t)audioStreamId;
- (unint64_t)circularBufferStartHostTime;
- (unint64_t)circularBufferStartSampleCount;
- (unint64_t)currentExclaveAudioSampleCount;
- (unint64_t)estimatedStartHostTime;
- (unint64_t)lastFetchedExclaveAudioSampleCount;
- (unint64_t)phoneCallState;
- (unint64_t)streamState;
- (void)CSAudioServerCrashMonitorDidReceiveServerCrash:(id)a3;
- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3;
- (void)CSPhoneCallStateMonitor:(id)a3 didRecievePhoneCallStateChange:(unint64_t)a4;
- (void)_cancelAudioPacketWatchDog;
- (void)_cancelAudioStreamHold:(id)a3;
- (void)_clearDidStartRecordingDelegateWatchDog;
- (void)_clearDidStopRecordingDelegateWatchDog;
- (void)_clearListeningMicIndicatorPropertyIfNeeded;
- (void)_createCircularBufferIfNeededWithNumChannel:(unint64_t)a3 playbackRoute:(id)a4;
- (void)_deliverHistoricalAudioToStreamsWithRemoteVAD:(id)a3;
- (void)_deliverPostprocessAudioChunk:(id)a3 toStream:(id)a4 lastForwardedSampleCount:(unint64_t)a5;
- (void)_didFireStreamHolderTimeout:(id)a3;
- (void)_didReceiveFinishStartAlertPlaybackAt:(unint64_t)a3;
- (void)_fetchHistoricalAudioAndForwardToStream:(id)a3 remoteVAD:(id)a4;
- (void)_forceReleaseAllListeningMicIndicatorLocks;
- (void)_forceReleaseAllRecordModeLocks;
- (void)_forceReleaseListeningMicIndicatorLockFrom:(unint64_t)a3;
- (void)_forceReleaseRecordModeLockFrom:(unint64_t)a3;
- (void)_forwardAudioChunk:(id)a3 toStream:(id)a4;
- (void)_forwardAudioChunkForTV:(id)a3 toStream:(id)a4;
- (void)_handleAudioRecorderStreamHandleIdInvalidated:(unint64_t)a3;
- (void)_handleAudioSystemFailure;
- (void)_handleDidStartAudioStreamWithResult:(BOOL)a3 error:(id)a4;
- (void)_handleDidStopAudioStreamWithReason:(int64_t)a3;
- (void)_holdAudioStreamWithHolder:(id)a3 option:(id)a4;
- (void)_holdRecordingExceptionIfNeeded:(BOOL)a3;
- (void)_holdRecordingTransactionIfNeeded;
- (void)_onAudioPacketWatchdogFire;
- (void)_postEpilogueAudioStream;
- (void)_preEpilogueAudioStream;
- (void)_prepareAudioStream:(id)a3 request:(id)a4 completion:(id)a5;
- (void)_processAudioBuffer:(id)a3 remoteVAD:(id)a4 atTime:(unint64_t)a5 arrivalTimestampToAudioRecorder:(unint64_t)a6 numberOfChannels:(int)a7;
- (void)_releaseListeningMicIndicatorLock:(id)a3;
- (void)_releaseListeningMicIndicatorLockFrom:(unint64_t)a3;
- (void)_releaseRecordModeLock:(id)a3;
- (void)_releaseRecordingTransactionIfNeeded;
- (void)_resetCircularBufferStartTime;
- (void)_saveRecordingBufferFrom:(unint64_t)a3 to:(unint64_t)a4 toURL:(id)a5;
- (void)_schduleDidStartRecordingDelegateWatchDogWithToken:(id)a3;
- (void)_scheduleAlertFinishTimeout:(double)a3;
- (void)_scheduleAudioPacketWatchDog;
- (void)_scheduleDidStartRecordingDelegateWatchDog;
- (void)_scheduleDidStopRecordingDelegateWatchDog;
- (void)_scheduleDidStopRecordingDelegateWatchDog:(id)a3;
- (void)_setLatestRecordContext:(id)a3;
- (void)_setListeningMicIndicatorPropertyIfNeeded;
- (void)_startAudioStream:(id)a3 option:(id)a4 completion:(id)a5;
- (void)_stopAudioStream:(id)a3 option:(id)a4 completion:(id)a5;
- (void)_switchToListeningMode;
- (void)_switchToRecordingMode;
- (void)_updateRemoteDeviceIdFromAVVCIfNeeded;
- (void)attachTandemStream:(id)a3 toPrimaryStream:(id)a4 completion:(id)a5;
- (void)audioPreprocessor:(id)a3 hasAvailableBuffer:(id)a4 atTime:(unint64_t)a5 arrivalTimestampToAudioRecorder:(unint64_t)a6 numberOfChannels:(int)a7;
- (void)audioRecorder:(id)a3 didSetAudioSessionActive:(BOOL)a4;
- (void)audioRecorder:(id)a3 willSetAudioSessionActive:(BOOL)a4;
- (void)audioRecorderBeginRecordInterruption:(id)a3;
- (void)audioRecorderBeginRecordInterruption:(id)a3 withContext:(id)a4;
- (void)audioRecorderBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5;
- (void)audioRecorderBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 atTime:(unint64_t)a7 arrivalTimestampToAudioRecorder:(unint64_t)a8 numberOfChannels:(int)a9;
- (void)audioRecorderBuiltInAudioStreamInvalidated:(id)a3 error:(id)a4;
- (void)audioRecorderDidFinishAlertPlayback:(id)a3 ofType:(int64_t)a4 error:(id)a5;
- (void)audioRecorderDidStartRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6;
- (void)audioRecorderDidStopRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 reason:(int64_t)a5;
- (void)audioRecorderDisconnected:(id)a3;
- (void)audioRecorderEndRecordInterruption:(id)a3;
- (void)audioRecorderExclaveBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 hostTime:(unint64_t)a5 arrivalTimestampToAudioRecorder:(unint64_t)a6;
- (void)audioRecorderRecordHardwareConfigurationDidChange:(id)a3 toConfiguration:(int64_t)a4;
- (void)audioRecorderStreamHandleIdInvalidated:(unint64_t)a3;
- (void)audioRecorderWillBeDestroyed:(id)a3;
- (void)audioStreamWithRequest:(id)a3 streamName:(id)a4 completion:(id)a5;
- (void)cancelAudioStreamHold:(id)a3;
- (void)configureAlertBehavior:(id)a3;
- (void)dealloc;
- (void)enableMiniDucking:(BOOL)a3;
- (void)enableSmartRoutingConsideration:(BOOL)a3;
- (void)notifyProviderContextChanged;
- (void)prepareAudioStream:(id)a3 request:(id)a4 completion:(id)a5;
- (void)saveRecordingBufferFrom:(unint64_t)a3 to:(unint64_t)a4 toURL:(id)a5;
- (void)saveRecordingBufferToEndFrom:(unint64_t)a3 toURL:(id)a4;
- (void)setAdpAssertion:(id)a3;
- (void)setAlertDelegate:(id)a3;
- (void)setAlertPlaybackFinishTimeoutToken:(id)a3;
- (void)setAlertPlaybackFinishWaitingCompletions:(id)a3;
- (void)setAlertPlaybackFinishWaitingStreams:(id)a3;
- (void)setAnnounceCallsEnabled:(BOOL)a3 withStreamHandleID:(unint64_t)a4;
- (void)setAudioAlertDelegate:(id)a3;
- (void)setAudioPacketDeliveryCount:(unint64_t)a3;
- (void)setAudioPacketWatchdog:(id)a3;
- (void)setAudioPreprocessor:(id)a3;
- (void)setAudioProviderDelegate:(id)a3;
- (void)setAudioRecorder:(id)a3;
- (void)setAudioSessionDelegate:(id)a3;
- (void)setAudioStreamHandleId:(unint64_t)a3;
- (void)setAudioStreamType:(int64_t)a3;
- (void)setAudioSystemRecovering:(BOOL)a3;
- (void)setAudioTimeConverter:(id)a3;
- (void)setCircularBuffer:(id)a3;
- (void)setCircularBufferStartHostTime:(unint64_t)a3;
- (void)setCircularBufferStartSampleCount:(unint64_t)a3;
- (void)setCurrentExclaveAudioSampleCount:(unint64_t)a3;
- (void)setCurrentSessionShouldDuckOnBuiltInSpeaker:(BOOL)a3;
- (void)setDuckOthersOption:(BOOL)a3;
- (void)setEstimatedStartHostTime:(unint64_t)a3;
- (void)setExclaveAudioTimeConverter:(id)a3;
- (void)setHistoricalBufferRequestStreams:(id)a3;
- (void)setIsTransferringExclaveAudioSample:(BOOL)a3;
- (void)setLastAudioRecorderContext:(id)a3;
- (void)setLastFetchedExclaveAudioSampleCount:(unint64_t)a3;
- (void)setLatestRecordContext:(id)a3 streamType:(int64_t)a4;
- (void)setListeningMicIndicatorLocks:(id)a3;
- (void)setLoggingQueue:(id)a3;
- (void)setMeteringEnabled:(BOOL)a3;
- (void)setMicUsageReporter:(id)a3;
- (void)setPendingStartCompletions:(id)a3;
- (void)setPendingStopCompletions:(id)a3;
- (void)setPhoneCallState:(unint64_t)a3;
- (void)setPhoneCallStateMonitor:(id)a3;
- (void)setProviderDelegate:(id)a3;
- (void)setRecordDeviceIndicator:(id)a3;
- (void)setRecordModeLocks:(id)a3;
- (void)setRecordQueue:(id)a3;
- (void)setRecordingTransaction:(id)a3;
- (void)setRecordingWillStartGroup:(id)a3;
- (void)setSessionDelegate:(id)a3;
- (void)setStartPendingOnStoppingStreamToCompletionDict:(id)a3;
- (void)setStartPendingOnStoppingStreams:(id)a3;
- (void)setStartPendingStreams:(id)a3;
- (void)setStartRecordingWatchDogToken:(id)a3;
- (void)setStateCapture:(id)a3;
- (void)setStopPendingStreams:(id)a3;
- (void)setStopRecordingWatchDogToken:(id)a3;
- (void)setStreamHandleQueue:(id)a3;
- (void)setStreamHolders:(id)a3;
- (void)setStreamState:(unint64_t)a3;
- (void)setStreams:(id)a3;
- (void)setWaitingForAlertFinish:(BOOL)a3;
- (void)start;
- (void)startAudioStream:(id)a3 option:(id)a4 completion:(id)a5;
- (void)stopAudioStream:(id)a3 option:(id)a4 completion:(id)a5;
- (void)triggerInfoForContext:(id)a3 completion:(id)a4;
- (void)updateMeters;
@end

@implementation CSAudioProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCapture, 0);
  objc_storeStrong((id *)&self->_listeningMicIndicatorLocks, 0);
  objc_storeStrong((id *)&self->_recordModeLocks, 0);
  objc_storeStrong((id *)&self->_phoneCallStateMonitor, 0);
  objc_storeStrong((id *)&self->_adpAssertion, 0);
  objc_storeStrong((id *)&self->_micUsageReporter, 0);
  objc_storeStrong((id *)&self->_recordDeviceIndicator, 0);
  objc_storeStrong((id *)&self->_audioTimeConverter, 0);
  objc_storeStrong((id *)&self->_exclaveAudioTimeConverter, 0);
  objc_storeStrong((id *)&self->_audioPacketWatchdog, 0);
  objc_storeStrong((id *)&self->_stopRecordingWatchDogToken, 0);
  objc_storeStrong((id *)&self->_startRecordingWatchDogToken, 0);
  objc_storeStrong((id *)&self->_alertPlaybackFinishTimeoutToken, 0);
  objc_storeStrong((id *)&self->_recordingWillStartGroup, 0);
  objc_storeStrong((id *)&self->_recordingTransaction, 0);
  objc_storeStrong((id *)&self->_audioPreprocessor, 0);
  objc_storeStrong((id *)&self->_lastAudioRecorderContext, 0);
  objc_destroyWeak((id *)&self->_alertDelegate);
  objc_storeStrong((id *)&self->_circularBuffer, 0);
  objc_storeStrong((id *)&self->_historicalBufferRequestStreams, 0);
  objc_storeStrong((id *)&self->_streamHolders, 0);
  objc_destroyWeak((id *)&self->_sessionDelegate);
  objc_destroyWeak((id *)&self->_providerDelegate);
  objc_storeStrong((id *)&self->_startPendingOnStoppingStreamToCompletionDict, 0);
  objc_storeStrong((id *)&self->_pendingStopCompletions, 0);
  objc_storeStrong((id *)&self->_alertPlaybackFinishWaitingCompletions, 0);
  objc_storeStrong((id *)&self->_pendingStartCompletions, 0);
  objc_storeStrong((id *)&self->_stopPendingStreams, 0);
  objc_storeStrong((id *)&self->_streams, 0);
  objc_storeStrong((id *)&self->_alertPlaybackFinishWaitingStreams, 0);
  objc_storeStrong((id *)&self->_startPendingOnStoppingStreams, 0);
  objc_storeStrong((id *)&self->_startPendingStreams, 0);
  objc_storeStrong((id *)&self->_audioRecorder, 0);
  objc_storeStrong((id *)&self->_streamHandleQueue, 0);
  objc_storeStrong((id *)&self->_loggingQueue, 0);
  objc_storeStrong((id *)&self->_recordQueue, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)setStateCapture:(id)a3
{
}

- (CSStateCapture)stateCapture
{
  return self->_stateCapture;
}

- (void)setListeningMicIndicatorLocks:(id)a3
{
}

- (NSMutableDictionary)listeningMicIndicatorLocks
{
  return self->_listeningMicIndicatorLocks;
}

- (void)setRecordModeLocks:(id)a3
{
}

- (NSMutableDictionary)recordModeLocks
{
  return self->_recordModeLocks;
}

- (void)setCurrentSessionShouldDuckOnBuiltInSpeaker:(BOOL)a3
{
  self->_currentSessionShouldDuckOnBuiltInSpeaker = a3;
}

- (BOOL)currentSessionShouldDuckOnBuiltInSpeaker
{
  return self->_currentSessionShouldDuckOnBuiltInSpeaker;
}

- (void)setPhoneCallState:(unint64_t)a3
{
  self->_phoneCallState = a3;
}

- (unint64_t)phoneCallState
{
  return self->_phoneCallState;
}

- (void)setPhoneCallStateMonitor:(id)a3
{
}

- (CSPhoneCallStateMonitor)phoneCallStateMonitor
{
  return self->_phoneCallStateMonitor;
}

- (void)setAdpAssertion:(id)a3
{
}

- (CSADPPreventStandbyAssertion)adpAssertion
{
  return self->_adpAssertion;
}

- (void)setAudioPacketDeliveryCount:(unint64_t)a3
{
  self->_audioPacketDeliveryCount = a3;
}

- (unint64_t)audioPacketDeliveryCount
{
  return self->_audioPacketDeliveryCount;
}

- (void)setMicUsageReporter:(id)a3
{
}

- (CSMicUsageReporter)micUsageReporter
{
  return self->_micUsageReporter;
}

- (void)setRecordDeviceIndicator:(id)a3
{
}

- (CSAudioRecordDeviceIndicator)recordDeviceIndicator
{
  return self->_recordDeviceIndicator;
}

- (void)setAudioStreamType:(int64_t)a3
{
  self->_audioStreamType = a3;
}

- (int64_t)audioStreamType
{
  return self->_audioStreamType;
}

- (void)setEstimatedStartHostTime:(unint64_t)a3
{
  self->_estimatedStartHostTime = a3;
}

- (unint64_t)estimatedStartHostTime
{
  return self->_estimatedStartHostTime;
}

- (void)setAudioTimeConverter:(id)a3
{
}

- (CSAudioTimeConverter)audioTimeConverter
{
  return self->_audioTimeConverter;
}

- (void)setExclaveAudioTimeConverter:(id)a3
{
}

- (CSAudioTimeConverter)exclaveAudioTimeConverter
{
  return self->_exclaveAudioTimeConverter;
}

- (void)setIsTransferringExclaveAudioSample:(BOOL)a3
{
  self->_isTransferringExclaveAudioSample = a3;
}

- (BOOL)isTransferringExclaveAudioSample
{
  return self->_isTransferringExclaveAudioSample;
}

- (void)setLastFetchedExclaveAudioSampleCount:(unint64_t)a3
{
  self->_lastFetchedExclaveAudioSampleCount = a3;
}

- (unint64_t)lastFetchedExclaveAudioSampleCount
{
  return self->_lastFetchedExclaveAudioSampleCount;
}

- (void)setCurrentExclaveAudioSampleCount:(unint64_t)a3
{
  self->_currentExclaveAudioSampleCount = a3;
}

- (unint64_t)currentExclaveAudioSampleCount
{
  return self->_currentExclaveAudioSampleCount;
}

- (void)setCircularBufferStartSampleCount:(unint64_t)a3
{
  self->_circularBufferStartSampleCount = a3;
}

- (unint64_t)circularBufferStartSampleCount
{
  return self->_circularBufferStartSampleCount;
}

- (void)setCircularBufferStartHostTime:(unint64_t)a3
{
  self->_circularBufferStartHostTime = a3;
}

- (unint64_t)circularBufferStartHostTime
{
  return self->_circularBufferStartHostTime;
}

- (void)setAudioPacketWatchdog:(id)a3
{
}

- (OS_dispatch_source)audioPacketWatchdog
{
  return self->_audioPacketWatchdog;
}

- (void)setStopRecordingWatchDogToken:(id)a3
{
}

- (NSUUID)stopRecordingWatchDogToken
{
  return self->_stopRecordingWatchDogToken;
}

- (void)setStartRecordingWatchDogToken:(id)a3
{
}

- (NSUUID)startRecordingWatchDogToken
{
  return self->_startRecordingWatchDogToken;
}

- (void)setAlertPlaybackFinishTimeoutToken:(id)a3
{
}

- (NSUUID)alertPlaybackFinishTimeoutToken
{
  return self->_alertPlaybackFinishTimeoutToken;
}

- (void)setAudioStreamHandleId:(unint64_t)a3
{
  self->_audioStreamHandleId = a3;
}

- (unint64_t)audioStreamHandleId
{
  return self->_audioStreamHandleId;
}

- (void)setWaitingForAlertFinish:(BOOL)a3
{
  self->_waitingForAlertFinish = a3;
}

- (BOOL)waitingForAlertFinish
{
  return self->_waitingForAlertFinish;
}

- (void)setRecordingWillStartGroup:(id)a3
{
}

- (OS_dispatch_group)recordingWillStartGroup
{
  return self->_recordingWillStartGroup;
}

- (void)setRecordingTransaction:(id)a3
{
}

- (CSOSTransaction)recordingTransaction
{
  return self->_recordingTransaction;
}

- (void)setAudioPreprocessor:(id)a3
{
}

- (CSAudioPreprocessor)audioPreprocessor
{
  return self->_audioPreprocessor;
}

- (void)setAudioSystemRecovering:(BOOL)a3
{
  self->_audioSystemRecovering = a3;
}

- (BOOL)audioSystemRecovering
{
  return self->_audioSystemRecovering;
}

- (void)setLastAudioRecorderContext:(id)a3
{
}

- (CSAudioRecordContext)lastAudioRecorderContext
{
  return self->_lastAudioRecorderContext;
}

- (void)setAlertDelegate:(id)a3
{
}

- (CSAudioAlertProvidingDelegate)alertDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertDelegate);
  return (CSAudioAlertProvidingDelegate *)WeakRetained;
}

- (void)setCircularBuffer:(id)a3
{
}

- (CSAudioCircularBuffer)circularBuffer
{
  return self->_circularBuffer;
}

- (void)setHistoricalBufferRequestStreams:(id)a3
{
}

- (NSHashTable)historicalBufferRequestStreams
{
  return self->_historicalBufferRequestStreams;
}

- (void)setStreamHolders:(id)a3
{
}

- (NSMutableArray)streamHolders
{
  return self->_streamHolders;
}

- (void)setSessionDelegate:(id)a3
{
}

- (CSAudioSessionProvidingDelegate)sessionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionDelegate);
  return (CSAudioSessionProvidingDelegate *)WeakRetained;
}

- (void)setProviderDelegate:(id)a3
{
}

- (CSAudioProviderDelegate)providerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_providerDelegate);
  return (CSAudioProviderDelegate *)WeakRetained;
}

- (void)setStartPendingOnStoppingStreamToCompletionDict:(id)a3
{
}

- (NSMutableDictionary)startPendingOnStoppingStreamToCompletionDict
{
  return self->_startPendingOnStoppingStreamToCompletionDict;
}

- (void)setPendingStopCompletions:(id)a3
{
}

- (NSMutableArray)pendingStopCompletions
{
  return self->_pendingStopCompletions;
}

- (void)setAlertPlaybackFinishWaitingCompletions:(id)a3
{
}

- (NSMutableArray)alertPlaybackFinishWaitingCompletions
{
  return self->_alertPlaybackFinishWaitingCompletions;
}

- (void)setPendingStartCompletions:(id)a3
{
}

- (NSMutableArray)pendingStartCompletions
{
  return self->_pendingStartCompletions;
}

- (void)setStopPendingStreams:(id)a3
{
}

- (NSHashTable)stopPendingStreams
{
  return self->_stopPendingStreams;
}

- (void)setStreams:(id)a3
{
}

- (NSHashTable)streams
{
  return self->_streams;
}

- (void)setAlertPlaybackFinishWaitingStreams:(id)a3
{
}

- (NSHashTable)alertPlaybackFinishWaitingStreams
{
  return self->_alertPlaybackFinishWaitingStreams;
}

- (void)setStartPendingOnStoppingStreams:(id)a3
{
}

- (NSHashTable)startPendingOnStoppingStreams
{
  return self->_startPendingOnStoppingStreams;
}

- (void)setStartPendingStreams:(id)a3
{
}

- (NSHashTable)startPendingStreams
{
  return self->_startPendingStreams;
}

- (unint64_t)streamState
{
  return self->_streamState;
}

- (CSAudioRecorder)audioRecorder
{
  return self->_audioRecorder;
}

- (void)setStreamHandleQueue:(id)a3
{
}

- (OS_dispatch_queue)streamHandleQueue
{
  return self->_streamHandleQueue;
}

- (void)setLoggingQueue:(id)a3
{
}

- (OS_dispatch_queue)loggingQueue
{
  return self->_loggingQueue;
}

- (void)setRecordQueue:(id)a3
{
}

- (OS_dispatch_queue)recordQueue
{
  return self->_recordQueue;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (float)circularBufferInputRecordingDuration
{
  uint64_t v6 = 0;
  v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  streamHandleQueue = self->_streamHandleQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__CSAudioProvider_circularBufferInputRecordingDuration__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(streamHandleQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__CSAudioProvider_circularBufferInputRecordingDuration__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 168) inputRecordingDuration];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (int)circularBufferNumInputChannel
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  streamHandleQueue = self->_streamHandleQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__CSAudioProvider_circularBufferNumInputChannel__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(streamHandleQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__CSAudioProvider_circularBufferNumInputChannel__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 168) numInputChannels];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)CSPhoneCallStateMonitor:(id)a3 didRecievePhoneCallStateChange:(unint64_t)a4
{
  streamHandleQueue = self->_streamHandleQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__CSAudioProvider_CSPhoneCallStateMonitor_didRecievePhoneCallStateChange___block_invoke;
  v5[3] = &unk_1E6201378;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(streamHandleQueue, v5);
}

uint64_t __74__CSAudioProvider_CSPhoneCallStateMonitor_didRecievePhoneCallStateChange___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 360) = *(void *)(result + 40);
  return result;
}

- (void)_updateRemoteDeviceIdFromAVVCIfNeeded
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (+[CSUtils supportRemoteDarwinVoiceTrigger])
  {
    id v10 = +[CSRemoteDarwinDeviceInfo sharedInstance];
    if ([v10 hasDarwinDeviceConnected]
      && [(CSAudioRecordDeviceIndicator *)self->_recordDeviceIndicator shouldUseRemoteRecorder])
    {
      int v3 = [(CSAudioRecordDeviceIndicator *)self->_recordDeviceIndicator deviceId];

      if (!v3)
      {
        v4 = [(CSAudioProvider *)self audioRecorder];
        unint64_t audioStreamHandleId = self->_audioStreamHandleId;
        uint64_t v6 = [(CSAudioProvider *)self recordDeviceIndicator];
        v7 = [v4 recordDeviceInfoWithStreamHandleId:audioStreamHandleId recordDeviceIndicator:v6];

        uint64_t v8 = [v7 remoteDeviceUIDString];
        int v9 = CSLogCategoryAudio;
        if (v8)
        {
          if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v12 = "-[CSAudioProvider _updateRemoteDeviceIdFromAVVCIfNeeded]";
            __int16 v13 = 2114;
            v14 = v8;
            _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Update remote deviceUId fetched from AVVC : %{public}@ (this must be deviceUID of Darwin device only)", buf, 0x16u);
          }
          [(CSAudioRecordDeviceIndicator *)self->_recordDeviceIndicator updateDeviceId:v8];
        }
        else if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v12 = "-[CSAudioProvider _updateRemoteDeviceIdFromAVVCIfNeeded]";
          _os_log_error_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_ERROR, "%s Failed to fetch remote deviceUId from AVVC", buf, 0xCu);
        }
      }
    }
    else
    {
    }
  }
}

- (BOOL)_shouldHandleStartPendingOnStopping:(unint64_t)a3 withStopReason:(int64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_streamHandleQueue);
  if (a4)
  {
    v7 = [(CSAudioProvider *)self startPendingOnStoppingStreams];
    [v7 removeAllObjects];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v8 = [(CSAudioProvider *)self startPendingOnStoppingStreamToCompletionDict];
    int v9 = [v8 objectEnumerator];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:958 userInfo:0];
          (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    v16 = [(CSAudioProvider *)self startPendingOnStoppingStreamToCompletionDict];
    [v16 removeAllObjects];

    goto LABEL_12;
  }
  if (a3 != 5)
  {
LABEL_12:
    LOBYTE(v18) = 0;
    return v18;
  }
  v17 = [(CSAudioProvider *)self startPendingOnStoppingStreams];
  int v18 = objc_msgSend(v17, "_cs_isHashTableEmpty") ^ 1;

  return v18;
}

- (void)_clearDidStopRecordingDelegateWatchDog
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v3 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    stopRecordingWatchDogToken = self->_stopRecordingWatchDogToken;
    int v6 = 136315394;
    v7 = "-[CSAudioProvider _clearDidStopRecordingDelegateWatchDog]";
    __int16 v8 = 2114;
    int v9 = stopRecordingWatchDogToken;
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Clearing didStopRecordingDelegate WatchDogTimer : %{public}@", (uint8_t *)&v6, 0x16u);
  }
  v5 = self->_stopRecordingWatchDogToken;
  self->_stopRecordingWatchDogToken = 0;
}

- (void)_scheduleDidStopRecordingDelegateWatchDog:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    stopRecordingWatchDogToken = self->_stopRecordingWatchDogToken;
    int v9 = 136315650;
    uint64_t v10 = "-[CSAudioProvider _scheduleDidStopRecordingDelegateWatchDog:]";
    __int16 v11 = 2114;
    id v12 = v4;
    __int16 v13 = 2114;
    uint64_t v14 = stopRecordingWatchDogToken;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s stopRecordingWatchDogDidFire : %{public}@, currentToken : %{public}@", (uint8_t *)&v9, 0x20u);
  }
  if ([v4 isEqual:self->_stopRecordingWatchDogToken])
  {
    [(CSAudioProvider *)self _handleDidStopAudioStreamWithReason:5];
    [(CSAudioProvider *)self _handleAudioSystemFailure];
    v7 = +[CSDiagnosticReporter sharedInstance];
    [v7 submitAudioIssueReport:@"didStopWatchDogFire"];
  }
  else
  {
    __int16 v8 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[CSAudioProvider _scheduleDidStopRecordingDelegateWatchDog:]";
      _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s stopRecordingWatchDogToken doesn't match. Ignore this WDT fire", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_scheduleDidStopRecordingDelegateWatchDog
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init(MEMORY[0x1E4F29128]);
  objc_storeStrong((id *)&self->_stopRecordingWatchDogToken, v3);
  id v4 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    stopRecordingWatchDogToken = self->_stopRecordingWatchDogToken;
    *(_DWORD *)buf = 136315650;
    uint64_t v14 = "-[CSAudioProvider _scheduleDidStopRecordingDelegateWatchDog]";
    __int16 v15 = 2114;
    v16 = stopRecordingWatchDogToken;
    __int16 v17 = 2050;
    uint64_t v18 = 0x4020000000000000;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Schedule didStop WDT %{public}@ for %{public}lf seconds", buf, 0x20u);
  }
  dispatch_time_t v6 = dispatch_time(0, 8000000000);
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CSAudioProvider__scheduleDidStopRecordingDelegateWatchDog__block_invoke;
  block[3] = &unk_1E61FFF18;
  objc_copyWeak(&v11, &location);
  id v10 = v3;
  id v8 = v3;
  dispatch_after(v6, recordQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __60__CSAudioProvider__scheduleDidStopRecordingDelegateWatchDog__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _scheduleDidStopRecordingDelegateWatchDog:*(void *)(a1 + 32)];
}

- (void)_clearDidStartRecordingDelegateWatchDog
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    startRecordingWatchDogToken = self->_startRecordingWatchDogToken;
    int v6 = 136315394;
    v7 = "-[CSAudioProvider _clearDidStartRecordingDelegateWatchDog]";
    __int16 v8 = 2114;
    int v9 = startRecordingWatchDogToken;
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Clearing didStartRecordingDelegate WatchDogTimer : %{public}@", (uint8_t *)&v6, 0x16u);
  }
  v5 = self->_startRecordingWatchDogToken;
  self->_startRecordingWatchDogToken = 0;
}

- (void)_schduleDidStartRecordingDelegateWatchDogWithToken:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    startRecordingWatchDogToken = self->_startRecordingWatchDogToken;
    int v10 = 136315650;
    id v11 = "-[CSAudioProvider _schduleDidStartRecordingDelegateWatchDogWithToken:]";
    __int16 v12 = 2114;
    id v13 = v4;
    __int16 v14 = 2114;
    __int16 v15 = startRecordingWatchDogToken;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s startRecordingWatchDogDidFire : %{public}@, currentToken : %{public}@", (uint8_t *)&v10, 0x20u);
  }
  if ([v4 isEqual:self->_startRecordingWatchDogToken])
  {
    v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:962 userInfo:0];
    [(CSAudioProvider *)self _handleDidStartAudioStreamWithResult:0 error:v7];

    [(CSAudioProvider *)self _handleAudioSystemFailure];
    __int16 v8 = +[CSDiagnosticReporter sharedInstance];
    [v8 submitAudioIssueReport:@"didStartWatchDogFire"];
  }
  else
  {
    int v9 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      id v11 = "-[CSAudioProvider _schduleDidStartRecordingDelegateWatchDogWithToken:]";
      _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s startRecordingWatchDogToken doesn't match. Ignore this WDT fire", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_scheduleDidStartRecordingDelegateWatchDog
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init(MEMORY[0x1E4F29128]);
  objc_storeStrong((id *)&self->_startRecordingWatchDogToken, v3);
  id v4 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    startRecordingWatchDogToken = self->_startRecordingWatchDogToken;
    *(_DWORD *)buf = 136315650;
    __int16 v14 = "-[CSAudioProvider _scheduleDidStartRecordingDelegateWatchDog]";
    __int16 v15 = 2114;
    uint64_t v16 = startRecordingWatchDogToken;
    __int16 v17 = 2050;
    uint64_t v18 = 0x4020000000000000;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Schedule didStart WDT %{public}@ for %{public}lf seconds", buf, 0x20u);
  }
  dispatch_time_t v6 = dispatch_time(0, 8000000000);
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__CSAudioProvider__scheduleDidStartRecordingDelegateWatchDog__block_invoke;
  block[3] = &unk_1E61FFF18;
  objc_copyWeak(&v11, &location);
  id v10 = v3;
  id v8 = v3;
  dispatch_after(v6, recordQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __61__CSAudioProvider__scheduleDidStartRecordingDelegateWatchDog__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _schduleDidStartRecordingDelegateWatchDogWithToken:*(void *)(a1 + 32)];
}

- (void)_onAudioPacketWatchdogFire
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_audioPacketDeliveryCount)
  {
    self->_audioPacketDeliveryCount = 0;
  }
  else
  {
    id v3 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_FAULT))
    {
      int v5 = 136315138;
      dispatch_time_t v6 = "-[CSAudioProvider _onAudioPacketWatchdogFire]";
      _os_log_fault_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_FAULT, "%s Audio Packet Delivery WatchDog fired, trying to recover", (uint8_t *)&v5, 0xCu);
    }
    [(CSAudioProvider *)self _cancelAudioPacketWatchDog];
    [(CSAudioProvider *)self _handleDidStopAudioStreamWithReason:6];
    [(CSAudioProvider *)self _handleAudioSystemFailure];
    id v4 = +[CSDiagnosticReporter sharedInstance];
    [v4 submitAudioIssueReport:@"audioDeliveryWatchDogFire"];
  }
}

- (void)_cancelAudioPacketWatchDog
{
  audioPacketWatchdog = self->_audioPacketWatchdog;
  if (audioPacketWatchdog)
  {
    dispatch_source_cancel(audioPacketWatchdog);
    id v4 = self->_audioPacketWatchdog;
    self->_audioPacketWatchdog = 0;
  }
}

- (void)_scheduleAudioPacketWatchDog
{
  [(CSAudioProvider *)self _cancelAudioPacketWatchDog];
  self->_audioPacketDeliveryCount = 0;
  id v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_recordQueue);
  audioPacketWatchdog = self->_audioPacketWatchdog;
  self->_audioPacketWatchdog = v3;

  dispatch_time_t v5 = dispatch_time(0, 0x6FC23B000);
  dispatch_source_set_timer((dispatch_source_t)self->_audioPacketWatchdog, v5, 0x6FC23B000uLL, 0x3B9ACA00uLL);
  objc_initWeak(&location, self);
  dispatch_time_t v6 = self->_audioPacketWatchdog;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__CSAudioProvider__scheduleAudioPacketWatchDog__block_invoke;
  v7[3] = &unk_1E6201160;
  objc_copyWeak(&v8, &location);
  dispatch_source_set_event_handler(v6, v7);
  dispatch_resume((dispatch_object_t)self->_audioPacketWatchdog);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __47__CSAudioProvider__scheduleAudioPacketWatchDog__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _onAudioPacketWatchdogFire];
}

- (void)_holdRecordingExceptionIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CSAudioProvider *)self audioStreamHandleId] >= 2)
  {
    dispatch_time_t v5 = NSString;
    dispatch_time_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    id v8 = [(CSAudioProvider *)self UUID];
    id v11 = [v5 stringWithFormat:@"%@-%@", v7, v8];

    int v9 = +[CSMSNExceptionManager sharedInstance];
    id v10 = v9;
    if (v3) {
      [v9 beginAnnounceMessageException:@"announcemessage" reason:v11];
    }
    else {
      [v9 endAnnounceMessageException:@"announcemessage" reason:v11];
    }
  }
}

- (void)_releaseRecordingTransactionIfNeeded
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  adpAssertion = self->_adpAssertion;
  if (adpAssertion)
  {
    self->_adpAssertion = 0;
  }
  if (self->_recordingTransaction)
  {
    if (self->_streamState != 3
      && ![(CSAudioRecorder *)self->_audioRecorder isSessionCurrentlyActivated])
    {
      id v4 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_time_t v5 = v4;
        dispatch_time_t v6 = [(CSAudioProvider *)self UUID];
        uint64_t v7 = [(CSAudioProvider *)self _streamStateName:self->_streamState];
        int v12 = 136315650;
        id v13 = "-[CSAudioProvider _releaseRecordingTransactionIfNeeded]";
        __int16 v14 = 2114;
        __int16 v15 = v6;
        __int16 v16 = 2114;
        __int16 v17 = v7;
        _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Release recording transaction at streamState : %{public}@", (uint8_t *)&v12, 0x20u);
      }
      recordingTransaction = self->_recordingTransaction;
      self->_recordingTransaction = 0;

      [(CSAudioProvider *)self _holdRecordingExceptionIfNeeded:0];
    }
  }
  else
  {
    int v9 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      id v11 = [(CSAudioProvider *)self UUID];
      int v12 = 136315394;
      id v13 = "-[CSAudioProvider _releaseRecordingTransactionIfNeeded]";
      __int16 v14 = 2114;
      __int16 v15 = v11;
      _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:recordingTransaction already released", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)_holdRecordingTransactionIfNeeded
{
  BOOL v3 = [[CSADPPreventStandbyAssertion alloc] initWithName:@"com.apple.corespeech.recording" clientQueue:self->_recordQueue];
  adpAssertion = self->_adpAssertion;
  self->_adpAssertion = v3;

  if (!self->_recordingTransaction)
  {
    dispatch_time_t v5 = [[CSOSTransaction alloc] initWithDescription:@"Recording transaction"];
    recordingTransaction = self->_recordingTransaction;
    self->_recordingTransaction = v5;

    [(CSAudioProvider *)self _holdRecordingExceptionIfNeeded:1];
  }
}

- (id)_streamStateName:(unint64_t)a3
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v10[0] = &unk_1F13B8368;
  v10[1] = &unk_1F13B8380;
  v11[0] = @"StreamInit";
  v11[1] = @"StreamPrepared";
  v10[2] = &unk_1F13B8398;
  v10[3] = &unk_1F13B83B0;
  v11[2] = @"StreamStarting";
  v11[3] = @"StreamStreaming";
  v10[4] = &unk_1F13B83C8;
  v10[5] = &unk_1F13B83E0;
  v11[4] = @"StreamStopping";
  v11[5] = @"StreamStoppingWithScheduledStart";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];
  dispatch_time_t v5 = [NSNumber numberWithUnsignedInteger:a3];
  dispatch_time_t v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:a3];
    id v8 = [v4 objectForKeyedSubscript:v7];
  }
  else
  {
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"unknown(%tu)", a3);
  }

  return v8;
}

- (void)_handleAudioSystemFailure
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(CSAudioProvider *)self setStreamState:0];
  streamHandleQueue = self->_streamHandleQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CSAudioProvider__handleAudioSystemFailure__block_invoke;
  block[3] = &unk_1E6201288;
  void block[4] = self;
  dispatch_async_and_wait(streamHandleQueue, block);
  [(CSAudioProvider *)self _releaseRecordingTransactionIfNeeded];
  id v4 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_time_t v5 = v4;
    dispatch_time_t v6 = [(CSAudioProvider *)self UUID];
    *(_DWORD *)buf = 136315394;
    int v12 = "-[CSAudioProvider _handleAudioSystemFailure]";
    __int16 v13 = 2114;
    __int16 v14 = v6;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:AudioRecorder will be destroyed", buf, 0x16u);
  }
  [(CSAudioRecorder *)self->_audioRecorder unregisterObserver:self];
  uint64_t v7 = (void *)MEMORY[0x1BA9E7330]([(CSAudioRecorder *)self->_audioRecorder willDestroy]);
  audioRecorder = self->_audioRecorder;
  self->_audioRecorder = 0;

  circularBuffer = self->_circularBuffer;
  if (circularBuffer) {
    [(CSAudioCircularBuffer *)circularBuffer reset];
  }
}

void __44__CSAudioProvider__handleAudioSystemFailure__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1BA9E7330]();
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 192);
  *(void *)(v3 + 192) = 0;
}

- (void)CSAudioServerCrashMonitorDidReceiveServerRestart:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_time_t v5 = v4;
    dispatch_time_t v6 = [(CSAudioProvider *)self UUID];
    *(_DWORD *)buf = 136315394;
    id v10 = "-[CSAudioProvider CSAudioServerCrashMonitorDidReceiveServerRestart:]";
    __int16 v11 = 2114;
    int v12 = v6;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:audiomxd/bridgeaudiod recovered from crash", buf, 0x16u);
  }
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__CSAudioProvider_CSAudioServerCrashMonitorDidReceiveServerRestart___block_invoke;
  block[3] = &unk_1E6201288;
  void block[4] = self;
  dispatch_async(recordQueue, block);
}

uint64_t __68__CSAudioProvider_CSAudioServerCrashMonitorDidReceiveServerRestart___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = 0;
  return result;
}

- (void)CSAudioServerCrashMonitorDidReceiveServerCrash:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    dispatch_time_t v6 = v4;
    uint64_t v7 = [(CSAudioProvider *)self UUID];
    *(_DWORD *)buf = 136315394;
    id v10 = "-[CSAudioProvider CSAudioServerCrashMonitorDidReceiveServerCrash:]";
    __int16 v11 = 2114;
    int v12 = v7;
    _os_log_error_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_ERROR, "%s CSAudioProvider[%{public}@]:audiomxd/bridgeaudiod crashed", buf, 0x16u);
  }
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CSAudioProvider_CSAudioServerCrashMonitorDidReceiveServerCrash___block_invoke;
  block[3] = &unk_1E6201288;
  void block[4] = self;
  dispatch_async(recordQueue, block);
}

uint64_t __66__CSAudioProvider_CSAudioServerCrashMonitorDidReceiveServerCrash___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  [*(id *)(a1 + 32) _handleAudioRecorderStreamHandleIdInvalidated:1];
  [*(id *)(a1 + 32) _handleDidStopAudioStreamWithReason:-11785];
  v2 = *(void **)(a1 + 32);
  return [v2 _handleAudioSystemFailure];
}

- (void)audioRecorderDisconnected:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    dispatch_time_t v6 = v4;
    uint64_t v7 = [(CSAudioProvider *)self UUID];
    *(_DWORD *)buf = 136315394;
    id v10 = "-[CSAudioProvider audioRecorderDisconnected:]";
    __int16 v11 = 2114;
    int v12 = v7;
    _os_log_error_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_ERROR, "%s CSAudioProvider[%{public}@]:Audio Recorder Disconnected", buf, 0x16u);
  }
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CSAudioProvider_audioRecorderDisconnected___block_invoke;
  block[3] = &unk_1E6201288;
  void block[4] = self;
  dispatch_async(recordQueue, block);
}

uint64_t __45__CSAudioProvider_audioRecorderDisconnected___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _handleDidStopAudioStreamWithReason:-11792];
  v2 = *(void **)(a1 + 32);
  return [v2 _handleAudioSystemFailure];
}

- (void)audioRecorder:(id)a3 didSetAudioSessionActive:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_time_t v6 = [(CSAudioProvider *)self sessionDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CSAudioProvider *)self sessionDelegate];
    [v8 audioSessionProvider:self didSetAudioSessionActive:v4];
  }
}

- (void)audioRecorder:(id)a3 willSetAudioSessionActive:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_time_t v6 = [(CSAudioProvider *)self sessionDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CSAudioProvider *)self sessionDelegate];
    [v8 audioSessionProvider:self willSetAudioSessionActive:v4];
  }
}

- (void)audioRecorderEndRecordInterruption:(id)a3
{
  BOOL v4 = [(CSAudioProvider *)self sessionDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CSAudioProvider *)self sessionDelegate];
    [v6 audioSessionProviderEndInterruption:self];
  }
}

- (void)audioRecorderBeginRecordInterruption:(id)a3 withContext:(id)a4
{
  id v8 = a4;
  char v5 = [(CSAudioProvider *)self sessionDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(CSAudioProvider *)self sessionDelegate];
    [v7 audioSessionProviderBeginInterruption:self withContext:v8];
  }
}

- (void)audioRecorderBeginRecordInterruption:(id)a3
{
  BOOL v4 = [(CSAudioProvider *)self sessionDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CSAudioProvider *)self sessionDelegate];
    [v6 audioSessionProviderBeginInterruption:self];
  }
}

- (void)audioRecorderBuiltInAudioStreamInvalidated:(id)a3 error:(id)a4
{
  id v5 = a4;
  recordQueue = self->_recordQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__CSAudioProvider_audioRecorderBuiltInAudioStreamInvalidated_error___block_invoke;
  v8[3] = &unk_1E6201030;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(recordQueue, v8);
}

void __68__CSAudioProvider_audioRecorderBuiltInAudioStreamInvalidated_error___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) audioStreamHandleId] == 1)
  {
    v2 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void **)(a1 + 40);
      BOOL v4 = v2;
      id v5 = [v3 localizedDescription];
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "-[CSAudioProvider audioRecorderBuiltInAudioStreamInvalidated:error:]_block_invoke";
      __int16 v16 = 2114;
      __int16 v17 = v5;
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Will invalidate current builtIn audio stream : %{public}@", buf, 0x16u);
    }
    id v6 = [*(id *)(a1 + 32) audioRecorder];
    id v7 = [*(id *)(a1 + 32) recordDeviceIndicator];
    id v13 = 0;
    char v8 = [v6 stopAudioStreamWithRecordDeviceIndicator:v7 error:&v13];
    id v9 = v13;

    if ((v8 & 1) == 0)
    {
      id v10 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        __int16 v11 = v10;
        int v12 = [v9 localizedDescription];
        *(_DWORD *)buf = 136315394;
        uint64_t v15 = "-[CSAudioProvider audioRecorderBuiltInAudioStreamInvalidated:error:]_block_invoke";
        __int16 v16 = 2114;
        __int16 v17 = v12;
        _os_log_error_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_ERROR, "%s failed to stopAudioStream : %{public}@", buf, 0x16u);
      }
    }
  }
}

- (void)notifyProviderContextChanged
{
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CSAudioProvider_notifyProviderContextChanged__block_invoke;
  block[3] = &unk_1E6201288;
  void block[4] = self;
  dispatch_async(recordQueue, block);
}

void __47__CSAudioProvider_notifyProviderContextChanged__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sessionDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) sessionDelegate];
    [v4 audioSessionProvider:*(void *)(a1 + 32) didChangeContext:1];
  }
}

- (void)audioRecorderDidFinishAlertPlayback:(id)a3 ofType:(int64_t)a4 error:(id)a5
{
  id v7 = a5;
  uint64_t v8 = mach_absolute_time();
  recordQueue = self->_recordQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__CSAudioProvider_audioRecorderDidFinishAlertPlayback_ofType_error___block_invoke;
  v11[3] = &unk_1E6200320;
  int64_t v13 = a4;
  uint64_t v14 = v8;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(recordQueue, v11);
}

void __68__CSAudioProvider_audioRecorderDidFinishAlertPlayback_ofType_error___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48) == 1) {
    [*(id *)(a1 + 32) _didReceiveFinishStartAlertPlaybackAt:*(void *)(a1 + 56)];
  }
  id v2 = [*(id *)(a1 + 32) alertDelegate];
  [v2 audioAlertProvidingDidFinishAlertPlayback:*(void *)(a1 + 32) ofType:*(void *)(a1 + 48) error:*(void *)(a1 + 40)];
}

- (void)_didReceiveFinishStartAlertPlaybackAt:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t streamState = self->_streamState;
    id v7 = v5;
    uint64_t v8 = [(CSAudioProvider *)self _streamStateName:streamState];
    *(_DWORD *)buf = 136315650;
    long long v21 = "-[CSAudioProvider _didReceiveFinishStartAlertPlaybackAt:]";
    __int16 v22 = 2050;
    unint64_t v23 = a3;
    __int16 v24 = 2114;
    uint64_t v25 = v8;
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Received finishStartAlertPlaybackAt:%{public}llu streamState : %{public}@", buf, 0x20u);
  }
  alertPlaybackFinishTimeoutToken = self->_alertPlaybackFinishTimeoutToken;
  self->_alertPlaybackFinishTimeoutToken = 0;

  if (self->_waitingForAlertFinish)
  {
    self->_waitingForAlertFinish = 0;
    id v10 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = v10;
      id v12 = [(CSAudioProvider *)self UUID];
      *(_DWORD *)buf = 136315394;
      long long v21 = "-[CSAudioProvider _didReceiveFinishStartAlertPlaybackAt:]";
      __int16 v22 = 2114;
      unint64_t v23 = (unint64_t)v12;
      _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Leaving dispatch group for recordingWillStartGroup", buf, 0x16u);
    }
    dispatch_group_leave((dispatch_group_t)self->_recordingWillStartGroup);
  }
  unint64_t v13 = self->_streamState;
  if (v13 == 3)
  {
    streamHandleQueue = self->_streamHandleQueue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __57__CSAudioProvider__didReceiveFinishStartAlertPlaybackAt___block_invoke_2;
    v18[3] = &unk_1E6201378;
    v18[4] = self;
    v18[5] = a3;
    uint64_t v15 = v18;
  }
  else if (v13 == 2)
  {
    streamHandleQueue = self->_streamHandleQueue;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __57__CSAudioProvider__didReceiveFinishStartAlertPlaybackAt___block_invoke;
    v19[3] = &unk_1E6201288;
    v19[4] = self;
    uint64_t v15 = v19;
  }
  else
  {
    __int16 v16 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      long long v21 = "-[CSAudioProvider _didReceiveFinishStartAlertPlaybackAt:]";
      _os_log_error_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_ERROR, "%s Audio Streaming already stopped", buf, 0xCu);
    }
    streamHandleQueue = self->_streamHandleQueue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __57__CSAudioProvider__didReceiveFinishStartAlertPlaybackAt___block_invoke_137;
    v17[3] = &unk_1E6201288;
    v17[4] = self;
    uint64_t v15 = v17;
  }
  dispatch_async_and_wait(streamHandleQueue, v15);
}

void __57__CSAudioProvider__didReceiveFinishStartAlertPlaybackAt___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v2 = [*(id *)(a1 + 32) alertPlaybackFinishWaitingStreams];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v34 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v8 = [v7 streamRequest];
        int v9 = [v8 requestRecordModeLock];

        if (v9)
        {
          id v10 = *(void **)(a1 + 32);
          __int16 v11 = [v7 streamRequest];
          id v12 = (id)objc_msgSend(v10, "_acquireRecordModeLockFrom:", objc_msgSend(v11, "clientIdentity"));
        }
        unint64_t v13 = [v7 streamRequest];
        int v14 = [v13 requestListeningMicIndicatorLock];

        if (v14)
        {
          uint64_t v15 = *(void **)(a1 + 32);
          __int16 v16 = [v7 streamRequest];
          id v17 = (id)objc_msgSend(v15, "_acquireListeningMicIndicatorLockFrom:", objc_msgSend(v16, "clientIdentity"));
        }
        uint64_t v18 = [*(id *)(a1 + 32) startPendingStreams];
        [v18 addObject:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v4);
  }

  uint64_t v19 = [*(id *)(a1 + 32) alertPlaybackFinishWaitingStreams];
  [v19 removeAllObjects];

  [*(id *)(a1 + 32) _setListeningMicIndicatorPropertyIfNeeded];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v20 = objc_msgSend(*(id *)(a1 + 32), "alertPlaybackFinishWaitingCompletions", 0);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v29 + 1) + 8 * j);
        uint64_t v26 = [*(id *)(a1 + 32) pendingStartCompletions];
        v27 = (void *)MEMORY[0x1BA9E7570](v25);
        [v26 addObject:v27];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v22);
  }

  v28 = [*(id *)(a1 + 32) alertPlaybackFinishWaitingCompletions];
  [v28 removeAllObjects];
}

void __57__CSAudioProvider__didReceiveFinishStartAlertPlaybackAt___block_invoke_2(uint64_t a1)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obuint64_t j = [*(id *)(a1 + 32) alertPlaybackFinishWaitingStreams];
  uint64_t v2 = [obj countByEnumeratingWithState:&v53 objects:v68 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v54;
    uint64_t v47 = *MEMORY[0x1E4F152C8];
    *(void *)&long long v3 = 136315394;
    long long v46 = v3;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v54 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        if (+[CSUtils isExclaveHardware])
        {
          if ([*(id *)(a1 + 32) audioStreamId] == v47)
          {
            uint64_t v8 = [v7 streamRequest];
            char v9 = [v8 requestExclaveAudio];

            if ((v9 & 1) == 0)
            {
              *(void *)(*(void *)(a1 + 32) + 280) = *(void *)(*(void *)(a1 + 32) + 272);
              id v10 = CSLogCategoryAudio;
              if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v11 = *(void **)(*(void *)(a1 + 32) + 280);
                *(_DWORD *)buf = v46;
                v59 = "-[CSAudioProvider _didReceiveFinishStartAlertPlaybackAt:]_block_invoke_2";
                __int16 v60 = 2048;
                v61 = v11;
                _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Set LastFetchedExclaveAudioSampleCount = %llu", buf, 0x16u);
              }
            }
          }
        }
        id v12 = [v7 streamRequest];
        int v13 = [v12 requestListeningMicIndicatorLock];

        if (v13)
        {
          int v14 = *(void **)(a1 + 32);
          uint64_t v15 = [v7 streamRequest];
          id v16 = (id)objc_msgSend(v14, "_acquireListeningMicIndicatorLockFrom:", objc_msgSend(v15, "clientIdentity"));
        }
        id v17 = [v7 streamRequest];
        int v18 = [v17 requestRecordModeLock];

        if (v18)
        {
          uint64_t v19 = *(void **)(a1 + 32);
          long long v20 = [v7 streamRequest];
          id v21 = (id)objc_msgSend(v19, "_acquireRecordModeLockFrom:", objc_msgSend(v20, "clientIdentity"));
        }
        unint64_t v22 = [*(id *)(*(void *)(a1 + 32) + 168) sampleCount];
        [v7 updateAudioStreamStartTimeInSampleCount:v22];
        uint64_t v23 = *(void *)(a1 + 40);
        uint64_t v24 = mach_absolute_time();
        +[CSConfig inputRecordingSampleRate];
        unint64_t v25 = +[CSFTimeUtils sampleCountFromHostTime:anchorHostTime:anchorSampleCount:sampleRate:](CSFTimeUtils, "sampleCountFromHostTime:anchorHostTime:anchorSampleCount:sampleRate:", v23, v24, v22);
        uint64_t v26 = (void *)CSLogCategoryAudio;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
        {
          v27 = *(void **)(a1 + 32);
          v28 = v26;
          long long v29 = [v27 UUID];
          unint64_t v30 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 136316162;
          v59 = "-[CSAudioProvider _didReceiveFinishStartAlertPlaybackAt:]_block_invoke";
          __int16 v60 = 2114;
          v61 = v29;
          __int16 v62 = 2050;
          unint64_t v63 = v30;
          __int16 v64 = 2050;
          unint64_t v65 = v25;
          __int16 v66 = 2050;
          unint64_t v67 = v22;
          _os_log_impl(&dword_1BA1A5000, v28, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Requested alertFinishHostTime = %{public}llu, _clientStartSampleCount = %{public}tu, circularBufferSampleCount = %{public}tu", buf, 0x34u);
        }
        if (v25 <= v22)
        {
          [v7 updateAudioStreamStartTimeInSampleCount:v25];
        }
        else
        {
          long long v31 = (void *)CSLogCategoryAudio;
          if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
          {
            long long v32 = *(void **)(a1 + 32);
            long long v33 = v31;
            long long v34 = [v32 UUID];
            *(_DWORD *)buf = 136315650;
            v59 = "-[CSAudioProvider _didReceiveFinishStartAlertPlaybackAt:]_block_invoke";
            __int16 v60 = 2114;
            v61 = v34;
            __int16 v62 = 2050;
            unint64_t v63 = v22;
            _os_log_impl(&dword_1BA1A5000, v33, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Failed to fetch historical audio since _clientStartSampleCount is newer than audioBuffer sample count(%{public}llu)", buf, 0x20u);
          }
        }
        long long v35 = [*(id *)(a1 + 32) streams];
        [v35 addObject:v7];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v53 objects:v68 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 32) _setListeningMicIndicatorPropertyIfNeeded];
  long long v36 = +[CSAudioStreamActivityMonitor sharedInstance];
  v37 = [*(id *)(a1 + 32) streams];
  v38 = [*(id *)(a1 + 32) streamHolders];
  [v36 notifyActiveStreamsChanged:v37 streamHolders:v38 streamId:*(void *)(*(void *)(a1 + 32) + 216)];

  uint64_t v39 = [*(id *)(a1 + 32) alertPlaybackFinishWaitingStreams];
  [v39 removeAllObjects];

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v40 = [*(id *)(a1 + 32) alertPlaybackFinishWaitingCompletions];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v50 != v43) {
          objc_enumerationMutation(v40);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v49 + 1) + 8 * j) + 16))();
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v42);
  }

  v45 = [*(id *)(a1 + 32) alertPlaybackFinishWaitingCompletions];
  [v45 removeAllObjects];
}

void __57__CSAudioProvider__didReceiveFinishStartAlertPlaybackAt___block_invoke_137(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) alertPlaybackFinishWaitingStreams];
  [v2 removeAllObjects];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v3 = objc_msgSend(*(id *)(a1 + 32), "alertPlaybackFinishWaitingCompletions", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        char v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:959 userInfo:0];
        (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  id v10 = [*(id *)(a1 + 32) alertPlaybackFinishWaitingCompletions];
  [v10 removeAllObjects];
}

- (void)_scheduleAlertFinishTimeout:(double)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
  objc_storeStrong((id *)&self->_alertPlaybackFinishTimeoutToken, v5);
  uint64_t v6 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v14 = "-[CSAudioProvider _scheduleAlertFinishTimeout:]";
    __int16 v15 = 2114;
    uint64_t v16 = v5;
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s ScheduleAlertFinishTimeout : %{public}@", buf, 0x16u);
  }
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  recordQueue = self->_recordQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__CSAudioProvider__scheduleAlertFinishTimeout___block_invoke;
  v10[3] = &unk_1E6201030;
  id v11 = v5;
  long long v12 = self;
  id v9 = v5;
  dispatch_after(v7, recordQueue, v10);
}

void __47__CSAudioProvider__scheduleAlertFinishTimeout___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isEqual:*(void *)(*(void *)(a1 + 40) + 224)])
  {
    uint64_t v2 = *(void **)(a1 + 40);
    uint64_t v3 = mach_absolute_time();
    [v2 _didReceiveFinishStartAlertPlaybackAt:v3];
  }
  else
  {
    uint64_t v4 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 224);
      int v7 = 136315650;
      uint64_t v8 = "-[CSAudioProvider _scheduleAlertFinishTimeout:]_block_invoke";
      __int16 v9 = 2114;
      uint64_t v10 = v5;
      __int16 v11 = 2114;
      uint64_t v12 = v6;
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s ScheduleAlertFinishTimeout will be ignored : %{public}@, %{public}@", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)audioRecorderRecordHardwareConfigurationDidChange:(id)a3 toConfiguration:(int64_t)a4
{
  recordQueue = self->_recordQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __85__CSAudioProvider_audioRecorderRecordHardwareConfigurationDidChange_toConfiguration___block_invoke;
  v5[3] = &unk_1E6201378;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(recordQueue, v5);
}

void __85__CSAudioProvider_audioRecorderRecordHardwareConfigurationDidChange_toConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __85__CSAudioProvider_audioRecorderRecordHardwareConfigurationDidChange_toConfiguration___block_invoke_2;
  v4[3] = &unk_1E6201378;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = v1;
  v4[5] = v3;
  dispatch_async_and_wait(v2, v4);
}

void __85__CSAudioProvider_audioRecorderRecordHardwareConfigurationDidChange_toConfiguration___block_invoke_2(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) startPendingStreams];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v29;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v28 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 audioStreamProvider:*(void *)(a1 + 32) didHardwareConfigurationChange:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v4);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = [*(id *)(a1 + 32) stopPendingStreams];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 audioStreamProvider:*(void *)(a1 + 32) didHardwareConfigurationChange:*(void *)(a1 + 40)];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v10);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v14 = objc_msgSend(*(id *)(a1 + 32), "streams", 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v20 + 1) + 8 * v18);
        if (objc_opt_respondsToSelector()) {
          [v19 audioStreamProvider:*(void *)(a1 + 32) didHardwareConfigurationChange:*(void *)(a1 + 40)];
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v16);
  }
}

- (BOOL)isNarrowBand
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  recordQueue = self->_recordQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__CSAudioProvider_isNarrowBand__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(recordQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __31__CSAudioProvider_isNarrowBand__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) audioRecorder];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isNarrowBandWithStreamHandleId:", objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId"));
}

- (BOOL)isRecording
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  recordQueue = self->_recordQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__CSAudioProvider_isRecording__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(recordQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __30__CSAudioProvider_isRecording__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) audioRecorder];
  id v2 = [*(id *)(a1 + 32) recordDeviceIndicator];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 isRecordingWithRecordDeviceIndicator:v2];
}

- (void)audioRecorderBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5
{
  id v7 = a5;
  uint64_t v8 = v7;
  if (self->_audioStreamHandleId == a4)
  {
    recordQueue = self->_recordQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __75__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer___block_invoke;
    v10[3] = &unk_1E6201030;
    void v10[4] = self;
    id v11 = v7;
    dispatch_async(recordQueue, v10);
  }
}

void __75__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer___block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 336);
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __75__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer___block_invoke_2;
  v3[3] = &unk_1E6201030;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async_and_wait(v2, v3);
}

void __75__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer___block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v2 = [*(id *)(a1 + 32) startPendingStreams];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v26;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 32) _forwardAudioChunkForTV:*(void *)(a1 + 40) toStream:*(void *)(*((void *)&v25 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v4);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = [*(id *)(a1 + 32) streams];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(a1 + 32) _forwardAudioChunkForTV:*(void *)(a1 + 40) toStream:*(void *)(*((void *)&v21 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v30 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v12 = objc_msgSend(*(id *)(a1 + 32), "stopPendingStreams", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(a1 + 32) _forwardAudioChunkForTV:*(void *)(a1 + 40) toStream:*(void *)(*((void *)&v17 + 1) + 8 * v16++)];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v29 count:16];
    }
    while (v14);
  }
}

- (void)audioRecorderExclaveBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 hostTime:(unint64_t)a5 arrivalTimestampToAudioRecorder:(unint64_t)a6
{
  if (self->_audioStreamHandleId == a4)
  {
    streamHandleQueue = self->_streamHandleQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __116__CSAudioProvider_audioRecorderExclaveBufferAvailable_audioStreamHandleId_hostTime_arrivalTimestampToAudioRecorder___block_invoke;
    block[3] = &unk_1E61FFE78;
    void block[4] = self;
    void block[5] = a5;
    block[6] = a6;
    dispatch_async_and_wait(streamHandleQueue, block);
  }
}

unint64_t __116__CSAudioProvider_audioRecorderExclaveBufferAvailable_audioStreamHandleId_hostTime_arrivalTimestampToAudioRecorder___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 288) processSampleCount:*(void *)(*(void *)(a1 + 32) + 272) hostTime:*(void *)(a1 + 40)];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v2 = [*(id *)(a1 + 32) startPendingStreams];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    char v5 = 0;
    uint64_t v6 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v40 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v9 = [v8 streamRequest];
        int v10 = [v9 requestExclaveAudio];

        if (v10) {
          objc_msgSend(v8, "audioStreamProvider:numSamplesAvailableInExclave:hostTime:arrivalHostTimeToAudioRecorder:exclaveSampleCount:", *(void *)(a1 + 32), +[CSConfig exclaveRecordingNumSamples](CSConfig, "exclaveRecordingNumSamples"), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(*(void *)(a1 + 32) + 272));
        }
        else {
          char v5 = 1;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v4);
  }
  else
  {
    char v5 = 0;
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v11 = [*(id *)(a1 + 32) streams];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        long long v17 = [v16 streamRequest];
        int v18 = [v17 requestExclaveAudio];

        if (v18) {
          objc_msgSend(v16, "audioStreamProvider:numSamplesAvailableInExclave:hostTime:arrivalHostTimeToAudioRecorder:exclaveSampleCount:", *(void *)(a1 + 32), +[CSConfig exclaveRecordingNumSamples](CSConfig, "exclaveRecordingNumSamples"), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(*(void *)(a1 + 32) + 272));
        }
        else {
          char v5 = 1;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v13);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v19 = objc_msgSend(*(id *)(a1 + 32), "stopPendingStreams", 0);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v32 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = *(void **)(*((void *)&v31 + 1) + 8 * k);
        long long v25 = [v24 streamRequest];
        int v26 = [v25 requestExclaveAudio];

        if (v26) {
          objc_msgSend(v24, "audioStreamProvider:numSamplesAvailableInExclave:hostTime:arrivalHostTimeToAudioRecorder:exclaveSampleCount:", *(void *)(a1 + 32), +[CSConfig exclaveRecordingNumSamples](CSConfig, "exclaveRecordingNumSamples"), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(*(void *)(a1 + 32) + 272));
        }
        else {
          char v5 = 1;
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v21);
  }

  if (v5)
  {
    while (1)
    {
      long long v27 = *(void **)(a1 + 32);
      if (v27[35] >= v27[34]) {
        break;
      }
      long long v28 = [v27 audioRecorder];
      long long v29 = [*(id *)(a1 + 32) recordDeviceIndicator];
      objc_msgSend(v28, "fetchSecureAudioStreamWithRecordDeviceIndicator:from:numSamples:hostTime:error:", v29, *(void *)(*(void *)(a1 + 32) + 280), +[CSConfig exclaveRecordingNumSamples](CSConfig, "exclaveRecordingNumSamples"), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 288), "hostTimeFromSampleCount:", *(void *)(*(void *)(a1 + 32) + 280)), 0);

      *(void *)(*(void *)(a1 + 32) + 280) += +[CSConfig exclaveRecordingNumSamples];
    }
  }
  unint64_t result = +[CSConfig exclaveRecordingNumSamples];
  *(void *)(*(void *)(a1 + 32) + 272) += result;
  return result;
}

- (void)_forwardAudioChunkForTV:(id)a3 toStream:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_streamHandleQueue);
  [v7 audioStreamProvider:self audioChunkForTVAvailable:v6];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v8 = objc_msgSend(v7, "tandemStreams", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [(CSAudioProvider *)self _forwardAudioChunkForTV:v6 toStream:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)audioRecorderBufferAvailable:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 atTime:(unint64_t)a7 arrivalTimestampToAudioRecorder:(unint64_t)a8 numberOfChannels:(int)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  if (self->_audioStreamHandleId == a4)
  {
    unint64_t estimatedStartHostTime = self->_estimatedStartHostTime;
    if (estimatedStartHostTime)
    {
      unint64_t v19 = [v16 length] / (unint64_t)a9;
      float v20 = (float)(v19
                  / +[CSConfig inputRecordingSampleByteDepth]);
      +[CSConfig inputRecordingSampleRate];
      *(float *)&double v22 = v20 / v21;
      self->_estimatedStartHostTime += +[CSFTimeUtils secondsToHostTime:v22];
      a7 = estimatedStartHostTime;
    }
    recordQueue = self->_recordQueue;
    if (v17)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __141__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke;
      block[3] = &unk_1E6201288;
      void block[4] = self;
      dispatch_async(recordQueue, block);
      streamHandleQueue = self->_streamHandleQueue;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __141__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke_2;
      v37[3] = &unk_1E6200030;
      v37[4] = self;
      long long v25 = &v38;
      id v38 = v16;
      id v39 = v17;
      unint64_t v40 = a7;
      unint64_t v41 = a8;
      int v42 = a9;
      dispatch_async(streamHandleQueue, v37);

LABEL_11:
      goto LABEL_12;
    }
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __141__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke_3;
    v36[3] = &unk_1E6201288;
    v36[4] = self;
    dispatch_async(recordQueue, v36);
    long long v29 = self->_streamHandleQueue;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __141__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke_4;
    v34[3] = &unk_1E6200320;
    v34[4] = self;
    long long v25 = (id *)v35;
    v35[0] = v16;
    v35[1] = a7;
    v35[2] = a8;
    long long v30 = v34;
LABEL_10:
    dispatch_async(v29, v30);
    goto LABEL_11;
  }
  if (!a4)
  {
    int v26 = +[CSFPreferences sharedPreferences];
    int v27 = [v26 audioInjectionEnabled];

    if (v27)
    {
      long long v28 = self->_recordQueue;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __141__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke_5;
      v33[3] = &unk_1E6201288;
      v33[4] = self;
      dispatch_async(v28, v33);
      long long v29 = self->_streamHandleQueue;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __141__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke_6;
      v31[3] = &unk_1E6200320;
      v31[4] = self;
      long long v25 = (id *)v32;
      v32[0] = v16;
      v32[1] = a7;
      v32[2] = a8;
      long long v30 = v31;
      goto LABEL_10;
    }
  }
LABEL_12:
}

uint64_t __141__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke(uint64_t result)
{
  return result;
}

uint64_t __141__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processAudioBuffer:*(void *)(a1 + 40) remoteVAD:*(void *)(a1 + 48) atTime:*(void *)(a1 + 56) arrivalTimestampToAudioRecorder:*(void *)(a1 + 64) numberOfChannels:*(unsigned int *)(a1 + 72)];
}

uint64_t __141__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke_3(uint64_t result)
{
  return result;
}

uint64_t __141__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke_4(void *a1)
{
  return [*(id *)(a1[4] + 192) processBuffer:a1[5] atTime:a1[6] arrivalTimestampToAudioRecorder:a1[7]];
}

uint64_t __141__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke_5(uint64_t result)
{
  return result;
}

uint64_t __141__CSAudioProvider_audioRecorderBufferAvailable_audioStreamHandleId_buffer_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke_6(void *a1)
{
  return [*(id *)(a1[4] + 192) processBuffer:a1[5] atTime:a1[6] arrivalTimestampToAudioRecorder:a1[7]];
}

- (void)_deliverPostprocessAudioChunk:(id)a3 toStream:(id)a4 lastForwardedSampleCount:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_streamHandleQueue);
  id v13 = v8;
  uint64_t v10 = v13;
  if ([v9 needsBoost12dB])
  {
    uint64_t v10 = [v13 gainCompensatedChunk];
  }
  uint64_t v11 = [v9 streamRequest];
  char v12 = [v11 requestExclaveAudio];

  if ((v12 & 1) == 0) {
    [v9 audioStreamProvider:self audioBufferAvailable:v10 lastForwardedSampleCount:a5];
  }
}

- (void)_forwardAudioChunk:(id)a3 toStream:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_streamHandleQueue);
  id v8 = [v7 startStreamOption];
  int v9 = [v8 requireSingleChannelLookup];

  if (v9)
  {
    uint64_t v10 = [v7 startStreamOption];
    uint64_t v11 = objc_msgSend(v6, "chunkForChannel:", objc_msgSend(v10, "selectedChannel"));
    [(CSAudioProvider *)self _deliverPostprocessAudioChunk:v11 toStream:v7 lastForwardedSampleCount:[(CSAudioCircularBuffer *)self->_circularBuffer sampleCount]];
  }
  else
  {
    [(CSAudioProvider *)self _deliverPostprocessAudioChunk:v6 toStream:v7 lastForwardedSampleCount:[(CSAudioCircularBuffer *)self->_circularBuffer sampleCount]];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  char v12 = objc_msgSend(v7, "tandemStreams", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [(CSAudioProvider *)self _forwardAudioChunk:v6 toStream:*(void *)(*((void *)&v17 + 1) + 8 * v16++)];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (void)_processAudioBuffer:(id)a3 remoteVAD:(id)a4 atTime:(unint64_t)a5 arrivalTimestampToAudioRecorder:(unint64_t)a6 numberOfChannels:(int)a7
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_streamHandleQueue);
  [(CSAudioProvider *)self _deliverHistoricalAudioToStreamsWithRemoteVAD:v13];
  if (v12)
  {
    unint64_t v14 = (unint64_t)[v12 length] >> 1;
    circularBuffer = self->_circularBuffer;
    unint64_t v16 = v14 / a7;
    if (circularBuffer)
    {
      uint64_t v17 = [(CSAudioCircularBuffer *)circularBuffer sampleCount];
      -[CSAudioCircularBuffer addSamples:numSamples:atHostTime:](self->_circularBuffer, "addSamples:numSamples:atHostTime:", [v12 bytes], v16, a5);
      [(CSAudioTimeConverter *)self->_audioTimeConverter processSampleCount:v17 hostTime:a5];
    }
    else
    {
      uint64_t v17 = 0;
    }
    long long v18 = [CSAudioChunk alloc];
    uint64_t v19 = +[CSConfig inputRecordingSampleByteDepth];
    LOBYTE(v37) = +[CSConfig inputRecordingIsFloat];
    LOBYTE(v36) = 0;
    long long v20 = [(CSAudioChunk *)v18 initWithData:v12 numChannels:a7 numSamples:v16 sampleByteDepth:v19 startSampleCount:v17 hostTime:a5 arrivalHostTimeToAudioRecorder:a6 wasBuffered:v36 remoteVAD:v13 isFloat:v37];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    float v21 = [(CSAudioProvider *)self startPendingStreams];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v47 != v24) {
            objc_enumerationMutation(v21);
          }
          [(CSAudioProvider *)self _forwardAudioChunk:v20 toStream:*(void *)(*((void *)&v46 + 1) + 8 * i)];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v46 objects:v52 count:16];
      }
      while (v23);
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    int v26 = [(CSAudioProvider *)self streams];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v51 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v43 != v29) {
            objc_enumerationMutation(v26);
          }
          [(CSAudioProvider *)self _forwardAudioChunk:v20 toStream:*(void *)(*((void *)&v42 + 1) + 8 * j)];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v51 count:16];
      }
      while (v28);
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v31 = [(CSAudioProvider *)self stopPendingStreams];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v38 objects:v50 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v39;
      do
      {
        for (uint64_t k = 0; k != v33; ++k)
        {
          if (*(void *)v39 != v34) {
            objc_enumerationMutation(v31);
          }
          [(CSAudioProvider *)self _forwardAudioChunk:v20 toStream:*(void *)(*((void *)&v38 + 1) + 8 * k)];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v38 objects:v50 count:16];
      }
      while (v33);
    }
  }
}

- (void)_deliverHistoricalAudioToStreamsWithRemoteVAD:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_streamHandleQueue);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  char v5 = [(CSAudioProvider *)self startPendingStreams];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v11 = [v10 streamRequest];
        char v12 = [v11 requestExclaveAudio];

        if ((v12 & 1) == 0) {
          [(CSAudioProvider *)self _fetchHistoricalAudioAndForwardToStream:v10 remoteVAD:v4];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v13 = [(CSAudioProvider *)self streams];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v34 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        uint64_t v19 = [v18 streamRequest];
        char v20 = [v19 requestExclaveAudio];

        if ((v20 & 1) == 0) {
          [(CSAudioProvider *)self _fetchHistoricalAudioAndForwardToStream:v18 remoteVAD:v4];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v15);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  float v21 = [(CSAudioProvider *)self stopPendingStreams];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v21);
        }
        int v26 = *(void **)(*((void *)&v29 + 1) + 8 * k);
        uint64_t v27 = [v26 streamRequest];
        char v28 = [v27 requestExclaveAudio];

        if ((v28 & 1) == 0) {
          [(CSAudioProvider *)self _fetchHistoricalAudioAndForwardToStream:v26 remoteVAD:v4];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v23);
  }
}

- (void)_fetchHistoricalAudioAndForwardToStream:(id)a3 remoteVAD:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_streamHandleQueue);
  circularBuffer = self->_circularBuffer;
  if (!circularBuffer)
  {
LABEL_25:
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v36 = objc_msgSend(v6, "tandemStreams", 0);
    uint64_t v37 = [v36 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v50 != v39) {
            objc_enumerationMutation(v36);
          }
          [(CSAudioProvider *)self _fetchHistoricalAudioAndForwardToStream:*(void *)(*((void *)&v49 + 1) + 8 * i) remoteVAD:v7];
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v38);
    }
    goto LABEL_43;
  }
  unint64_t v9 = [(CSAudioCircularBuffer *)circularBuffer sampleCount];
  unint64_t v10 = [(CSAudioCircularBuffer *)self->_circularBuffer sampleCount];
  unint64_t v11 = [(CSAudioCircularBuffer *)self->_circularBuffer bufferLength];
  char v12 = self->_circularBuffer;
  if (v10 >= v11) {
    uint64_t v13 = [(CSAudioCircularBuffer *)v12 bufferLength];
  }
  else {
    uint64_t v13 = [(CSAudioCircularBuffer *)v12 sampleCount];
  }
  unint64_t v14 = [(CSAudioCircularBuffer *)self->_circularBuffer sampleCount] - v13;
  unint64_t v15 = [v6 lastForwardedSampleCount];
  unint64_t v16 = v15;
  if (v15 >= v14)
  {
    unint64_t v14 = v15;
  }
  else
  {
    uint64_t v17 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      long long v18 = v17;
      uint64_t v19 = [(CSAudioProvider *)self UUID];
      char v20 = [v6 name];
      *(_DWORD *)buf = 136316162;
      __int16 v60 = "-[CSAudioProvider _fetchHistoricalAudioAndForwardToStream:remoteVAD:]";
      __int16 v61 = 2114;
      *(void *)__int16 v62 = v19;
      *(_WORD *)&v62[8] = 2050;
      *(void *)&v62[10] = v16;
      __int16 v63 = 2050;
      unint64_t v64 = v14;
      __int16 v65 = 2114;
      unint64_t v66 = (unint64_t)v20;
      _os_log_impl(&dword_1BA1A5000, v18, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Buffer underrun!!!!, lastForwardedSampleTime:%{public}lu, oldestSampleTimeInBuffer:%{public}lu, stream:%{public}@", buf, 0x34u);
    }
  }
  if (v14 < v9)
  {
    float v21 = [v6 startStreamOption];
    int v22 = [v21 requireSingleChannelLookup];

    uint64_t v23 = self->_circularBuffer;
    if (v22)
    {
      uint64_t v24 = [v6 startStreamOption];
      id v25 = -[CSAudioCircularBuffer copySamplesFrom:to:channelIdx:](v23, "copySamplesFrom:to:channelIdx:", v14, v9, [v24 selectedChannel]);
    }
    else
    {
      id v25 = [(CSAudioCircularBuffer *)self->_circularBuffer copySamplesFrom:v14 to:v9];
    }
    [v25 setRemoteVAD:v7];
    long long v32 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      long long v33 = v32;
      int v34 = [v25 numSamples];
      long long v35 = [v6 name];
      *(_DWORD *)buf = 136315650;
      __int16 v60 = "-[CSAudioProvider _fetchHistoricalAudioAndForwardToStream:remoteVAD:]";
      __int16 v61 = 1024;
      *(_DWORD *)__int16 v62 = v34;
      *(_WORD *)&v62[4] = 2112;
      *(void *)&v62[6] = v35;
      _os_log_impl(&dword_1BA1A5000, v33, OS_LOG_TYPE_DEFAULT, "%s Forward %d samples from historical audio buffer from streamName:%@", buf, 0x1Cu);
    }
    [(CSAudioProvider *)self _deliverPostprocessAudioChunk:v25 toStream:v6 lastForwardedSampleCount:v9];

    goto LABEL_25;
  }
  if ([v6 scheduledFutureSample])
  {
    uint64_t v26 = _fetchHistoricalAudioAndForwardToStream_remoteVAD__overrunHeartBeat;
    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * _fetchHistoricalAudioAndForwardToStream_remoteVAD__overrunHeartBeat, 1) <= 0x1999999999999999uLL
      && v14 > v9)
    {
      char v28 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        long long v29 = v28;
        long long v30 = [(CSAudioProvider *)self UUID];
        long long v31 = [v6 name];
        *(_DWORD *)buf = 136316162;
        __int16 v60 = "-[CSAudioProvider _fetchHistoricalAudioAndForwardToStream:remoteVAD:]";
        __int16 v61 = 2114;
        *(void *)__int16 v62 = v30;
        *(_WORD *)&v62[8] = 2114;
        *(void *)&v62[10] = v31;
        __int16 v63 = 2050;
        unint64_t v64 = v14;
        __int16 v65 = 2050;
        unint64_t v66 = v9;
        _os_log_impl(&dword_1BA1A5000, v29, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Ignore forwarding stream %{public}@                                        the audio packets until sampleCount == %{public}lu (theMostRecentSampleCount:%{public}lu)", buf, 0x34u);

        uint64_t v26 = _fetchHistoricalAudioAndForwardToStream_remoteVAD__overrunHeartBeat;
      }
    }
    _fetchHistoricalAudioAndForwardToStream_remoteVAD__overrunHeartBeat = v26 + 1;
  }
  else if (v14 > v9)
  {
    long long v41 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      long long v42 = v41;
      long long v43 = [(CSAudioProvider *)self UUID];
      uint64_t v44 = [v6 name];
      *(_DWORD *)buf = 136316162;
      __int16 v60 = "-[CSAudioProvider _fetchHistoricalAudioAndForwardToStream:remoteVAD:]";
      __int16 v61 = 2114;
      *(void *)__int16 v62 = v43;
      *(_WORD *)&v62[8] = 2050;
      *(void *)&v62[10] = v14;
      __int16 v63 = 2050;
      unint64_t v64 = v9;
      __int16 v65 = 2114;
      unint64_t v66 = (unint64_t)v44;
      _os_log_impl(&dword_1BA1A5000, v42, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Buffer overrun!!! lastForwardedSampleTime:%{public}lu,                                    theMostRecentSampleCount:%{public}lu, stream:%{public}@", buf, 0x34u);
    }
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v36 = [v6 tandemStreams];
  uint64_t v45 = [v36 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v46; ++j)
      {
        if (*(void *)v54 != v47) {
          objc_enumerationMutation(v36);
        }
        [(CSAudioProvider *)self _fetchHistoricalAudioAndForwardToStream:*(void *)(*((void *)&v53 + 1) + 8 * j) remoteVAD:v7];
      }
      uint64_t v46 = [v36 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v46);
  }
LABEL_43:
}

- (void)audioRecorderWillBeDestroyed:(id)a3
{
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CSAudioProvider_audioRecorderWillBeDestroyed___block_invoke;
  block[3] = &unk_1E6201288;
  void block[4] = self;
  dispatch_async(recordQueue, block);
}

void __48__CSAudioProvider_audioRecorderWillBeDestroyed___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = v2;
    char v5 = [v3 UUID];
    int v9 = 136315394;
    unint64_t v10 = "-[CSAudioProvider audioRecorderWillBeDestroyed:]_block_invoke";
    __int16 v11 = 2114;
    char v12 = v5;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 32) _handleDidStopAudioStreamWithReason:3];
  [*(id *)(a1 + 32) setStreamState:0];
  id v6 = (void *)MEMORY[0x1BA9E7330](objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "unregisterObserver:"));
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 48);
  *(void *)(v7 + 48) = 0;
}

- (void)_handleAudioRecorderStreamHandleIdInvalidated:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v5 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[CSAudioProvider _handleAudioRecorderStreamHandleIdInvalidated:]";
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v12, 0xCu);
  }
  if (self->_audioStreamHandleId == a3)
  {
    [(CSAudioProvider *)self _handleDidStopAudioStreamWithReason:-11787];
    id v6 = [(CSAudioProvider *)self sessionDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      uint64_t v8 = [(CSAudioProvider *)self sessionDelegate];
      [v8 audioSessionProvider:self providerInvalidated:1];
    }
    int v9 = [(CSAudioProvider *)self providerDelegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      __int16 v11 = [(CSAudioProvider *)self providerDelegate];
      [v11 audioProviderInvalidated:self streamHandleId:a3];
    }
  }
}

- (void)audioRecorderStreamHandleIdInvalidated:(unint64_t)a3
{
  recordQueue = self->_recordQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__CSAudioProvider_audioRecorderStreamHandleIdInvalidated___block_invoke;
  v4[3] = &unk_1E6201378;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(recordQueue, v4);
}

uint64_t __58__CSAudioProvider_audioRecorderStreamHandleIdInvalidated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleAudioRecorderStreamHandleIdInvalidated:*(void *)(a1 + 40)];
}

- (void)audioRecorderDidStopRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 reason:(int64_t)a5
{
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__CSAudioProvider_audioRecorderDidStopRecord_audioStreamHandleId_reason___block_invoke;
  block[3] = &unk_1E61FFE78;
  void block[4] = self;
  void block[5] = a4;
  block[6] = a5;
  dispatch_async(recordQueue, block);
}

uint64_t __73__CSAudioProvider_audioRecorderDidStopRecord_audioStreamHandleId_reason___block_invoke(uint64_t result)
{
  if (*(void *)(result + 40) == *(void *)(*(void *)(result + 32) + 216)) {
    return [*(id *)(result + 32) _handleDidStopAudioStreamWithReason:*(void *)(result + 48)];
  }
  return result;
}

- (void)audioRecorderDidStartRecord:(id)a3 audioStreamHandleId:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6
{
  id v9 = a6;
  recordQueue = self->_recordQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__CSAudioProvider_audioRecorderDidStartRecord_audioStreamHandleId_successfully_error___block_invoke;
  v12[3] = &unk_1E6200008;
  BOOL v16 = a5;
  id v13 = v9;
  uint64_t v14 = self;
  unint64_t v15 = a4;
  id v11 = v9;
  dispatch_async(recordQueue, v12);
}

void *__86__CSAudioProvider_audioRecorderDidStartRecord_audioStreamHandleId_successfully_error___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56) || [*(id *)(a1 + 32) code] != 205)
  {
    unint64_t result = *(void **)(a1 + 40);
    if (*(void *)(a1 + 48) != result[27]) {
      return result;
    }
    uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v3 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    unint64_t result = *(void **)(a1 + 40);
    uint64_t v4 = 0;
  }
  return (void *)[result _handleDidStartAudioStreamWithResult:v4 error:v3];
}

- (void)audioPreprocessor:(id)a3 hasAvailableBuffer:(id)a4 atTime:(unint64_t)a5 arrivalTimestampToAudioRecorder:(unint64_t)a6 numberOfChannels:(int)a7
{
  id v11 = a4;
  streamHandleQueue = self->_streamHandleQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __112__CSAudioProvider_audioPreprocessor_hasAvailableBuffer_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke;
  block[3] = &unk_1E61FFFE0;
  void block[4] = self;
  id v15 = v11;
  unint64_t v16 = a5;
  unint64_t v17 = a6;
  int v18 = a7;
  id v13 = v11;
  dispatch_async(streamHandleQueue, block);
}

uint64_t __112__CSAudioProvider_audioPreprocessor_hasAvailableBuffer_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processAudioBuffer:*(void *)(a1 + 40) remoteVAD:0 atTime:*(void *)(a1 + 48) arrivalTimestampToAudioRecorder:*(void *)(a1 + 56) numberOfChannels:*(unsigned int *)(a1 + 64)];
}

- (BOOL)_shouldStopRecording
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  streamHandleQueue = self->_streamHandleQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __39__CSAudioProvider__shouldStopRecording__block_invoke;
  v12[3] = &unk_1E6200F40;
  void v12[4] = self;
  v12[5] = &v13;
  dispatch_async_and_wait(streamHandleQueue, v12);
  if (v14[3])
  {
    uint64_t v4 = (id)CSLogCategoryAudio;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      char v5 = [(CSAudioProvider *)self UUID];
      uint64_t v6 = v14[3];
      *(_DWORD *)buf = 136315650;
      int v18 = "-[CSAudioProvider _shouldStopRecording]";
      __int16 v19 = 2114;
      char v20 = v5;
      __int16 v21 = 2050;
      uint64_t v22 = v6;
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Shouldn't stop AVVC recording as there are %{public}tu streams", buf, 0x20u);
    }
  }
  else
  {
    char v7 = [(CSAudioProvider *)self streamHolders];
    uint64_t v8 = [v7 count];

    if (!v8)
    {
      BOOL v10 = 1;
      goto LABEL_8;
    }
    uint64_t v4 = (id)CSLogCategoryAudio;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(CSAudioProvider *)self UUID];
      *(_DWORD *)buf = 136315650;
      int v18 = "-[CSAudioProvider _shouldStopRecording]";
      __int16 v19 = 2114;
      char v20 = v9;
      __int16 v21 = 2050;
      uint64_t v22 = v8;
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Cannot stopRecording as there are %{public}tu streamHolders", buf, 0x20u);
    }
  }

  BOOL v10 = 0;
LABEL_8:
  _Block_object_dispose(&v13, 8);
  return v10;
}

void __39__CSAudioProvider__shouldStopRecording__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "streams", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        char v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (v7 && ([v7 isWeakStream] & 1) == 0) {
          ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)triggerInfoForContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CSAudioProvider_triggerInfoForContext_completion___block_invoke;
  block[3] = &unk_1E61FFFB8;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(recordQueue, block);
}

void __52__CSAudioProvider_triggerInfoForContext_completion___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[CSVoiceTriggerEventInfoProvider isVoiceTriggerInfoAvailableLocally:a1[4]];
  uint64_t v3 = CSLogCategoryAudio;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      long long v11 = "-[CSAudioProvider triggerInfoForContext:completion:]_block_invoke";
      _os_log_error_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_ERROR, "%s Not handled by this function", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v4 = a1[6];
    if (v4) {
      (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, 0, 0);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      long long v11 = "-[CSAudioProvider triggerInfoForContext:completion:]_block_invoke";
      _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Fetching voiceTriggerInfo from audioRecorder", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v5 = a1[6];
    if (v5)
    {
      id v6 = (void *)a1[5];
      id v7 = (void *)v6[6];
      long long v8 = [v6 recordDeviceIndicator];
      id v9 = [v7 fetchGibraltarVoiceTriggerInfoWithRecordDeviceIndicator:v8];
      (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v9, 0);
    }
  }
}

- (float)averagePowerForChannel:(unint64_t)a3
{
  uint64_t v4 = [(CSAudioProvider *)self audioRecorder];
  [v4 averagePowerForChannel:a3];
  float v6 = v5;

  return v6;
}

- (float)peakPowerForChannel:(unint64_t)a3
{
  uint64_t v4 = [(CSAudioProvider *)self audioRecorder];
  [v4 peakPowerForChannel:a3];
  float v6 = v5;

  return v6;
}

- (void)updateMeters
{
  id v2 = [(CSAudioProvider *)self audioRecorder];
  [v2 updateMeters];
}

- (void)setMeteringEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CSAudioProvider *)self audioRecorder];
  [v4 setMeteringEnabled:v3];
}

- (id)audioMetric
{
  id v2 = [(CSAudioProvider *)self audioRecorder];
  BOOL v3 = [v2 metrics];

  return v3;
}

- (void)configureAlertBehavior:(id)a3
{
  id v4 = a3;
  recordQueue = self->_recordQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__CSAudioProvider_configureAlertBehavior___block_invoke;
  v7[3] = &unk_1E6201030;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(recordQueue, v7);
}

void __42__CSAudioProvider_configureAlertBehavior___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) audioRecorder];
  [v2 configureAlertBehavior:*(void *)(a1 + 40) audioStreamHandleId:*(void *)(*(void *)(a1 + 32) + 216)];
}

- (unint64_t)alertStartTime
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  int v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  recordQueue = self->_recordQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__CSAudioProvider_alertStartTime__block_invoke;
  v8[3] = &unk_1E6200F40;
  v8[4] = self;
  void v8[5] = &v9;
  dispatch_async_and_wait(recordQueue, v8);
  if (*((unsigned char *)v10 + 24))
  {
    id v4 = (id)CSLogCategoryAudio;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v7 = [(CSAudioProvider *)self UUID];
      *(_DWORD *)buf = 136315394;
      id v14 = "-[CSAudioProvider alertStartTime]";
      __int16 v15 = 2114;
      uint64_t v16 = v7;
      _os_log_error_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_ERROR, "%s CSAudioProvider[%{public}@]:AVVC is recovering, ignore command...", buf, 0x16u);
    }
    unint64_t v5 = 0;
  }
  else
  {
    id v4 = [(CSAudioProvider *)self audioRecorder];
    unint64_t v5 = [v4 alertStartTime];
  }

  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __33__CSAudioProvider_alertStartTime__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (BOOL)playRecordStartingAlertAndResetEndpointerWithAlertOverride:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  __int16 v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__CSAudioProvider_playRecordStartingAlertAndResetEndpointerWithAlertOverride___block_invoke;
  block[3] = &unk_1E6200F40;
  void block[4] = self;
  void block[5] = &v14;
  dispatch_async_and_wait(recordQueue, block);
  if (*((unsigned char *)v15 + 24))
  {
    id v6 = (id)CSLogCategoryAudio;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [(CSAudioProvider *)self UUID];
      *(_DWORD *)buf = 136315394;
      __int16 v19 = "-[CSAudioProvider playRecordStartingAlertAndResetEndpointerWithAlertOverride:]";
      __int16 v20 = 2114;
      __int16 v21 = v11;
      _os_log_error_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_ERROR, "%s CSAudioProvider[%{public}@]:AVVC is recovering, ignore command...", buf, 0x16u);
    }
    char v7 = 0;
  }
  else
  {
    id v8 = [(CSAudioProvider *)self audioRecorder];
    char v7 = [v8 playRecordStartingAlertAndResetEndpointerFromStream:self->_audioStreamHandleId withAlertOverride:a3];

    uint64_t v9 = self->_recordQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __78__CSAudioProvider_playRecordStartingAlertAndResetEndpointerWithAlertOverride___block_invoke_127;
    v12[3] = &unk_1E6201288;
    void v12[4] = self;
    dispatch_async(v9, v12);
  }
  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __78__CSAudioProvider_playRecordStartingAlertAndResetEndpointerWithAlertOverride___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

void __78__CSAudioProvider_playRecordStartingAlertAndResetEndpointerWithAlertOverride___block_invoke_127(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) audioRecorder];
  BOOL v3 = objc_msgSend(v2, "getPlaybackRouteForStreamID:", objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId"));

  id v4 = [*(id *)(a1 + 32) audioRecorder];
  unint64_t v5 = [*(id *)(a1 + 32) recordDeviceIndicator];
  id v6 = [v4 recordRouteWithRecordDeviceIndicator:v5];

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__CSAudioProvider_playRecordStartingAlertAndResetEndpointerWithAlertOverride___block_invoke_2;
  block[3] = &unk_1E6200E38;
  void block[4] = v7;
  id v12 = v6;
  id v13 = v3;
  id v9 = v3;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __78__CSAudioProvider_playRecordStartingAlertAndResetEndpointerWithAlertOverride___block_invoke_2(void *a1)
{
  return [*(id *)(a1[4] + 192) willBeepWithRecordRoute:a1[5] playbackRoute:a1[6]];
}

- (BOOL)_didPlayStartAlertSoundForSiri:(id)a3 audioStream:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordQueue);
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (!CSIsHorseman_isHorseman)
  {
    if (self->_waitingForAlertFinish) {
      goto LABEL_11;
    }
    id v12 = [v7 streamRequest];
    uint64_t v13 = [v12 clientIdentity];

    if (v13 != 1) {
      goto LABEL_11;
    }
    if (self->_audioSystemRecovering)
    {
      uint64_t v14 = (void *)CSLogCategoryAudio;
      if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      id v10 = v14;
      uint64_t v11 = [(CSAudioProvider *)self UUID];
      *(_DWORD *)buf = 136315394;
      long long v52 = "-[CSAudioProvider _didPlayStartAlertSoundForSiri:audioStream:]";
      __int16 v53 = 2114;
      long long v54 = v11;
      _os_log_error_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_ERROR, "%s CSAudioProvider[%{public}@]:AVVC is recovering, ignore command...", buf, 0x16u);
LABEL_6:

LABEL_11:
      BOOL v9 = 0;
      goto LABEL_12;
    }
    uint64_t v16 = [v6 avvcAlertBehavior];
    if (v16)
    {
      char v17 = [(CSAudioProvider *)self audioRecorder];
      [v17 configureAlertBehavior:v16 audioStreamHandleId:self->_audioStreamHandleId];
    }
    int v18 = [v7 streamRequest];
    __int16 v19 = [v18 recordContext];
    if ([v19 type] == 11) {
      goto LABEL_26;
    }
    __int16 v20 = [v7 streamRequest];
    __int16 v21 = [v20 recordContext];
    if ([v21 type] == 6)
    {
LABEL_25:

LABEL_26:
      goto LABEL_27;
    }
    uint64_t v22 = [v7 streamRequest];
    uint64_t v23 = [v22 recordContext];
    if ([v23 type] == 20)
    {

      goto LABEL_25;
    }
    long long v49 = v23;
    long long v50 = v22;
    uint64_t v24 = [v7 streamRequest];
    id v25 = [v24 recordContext];
    if ([v25 type] == 22)
    {

LABEL_24:
      goto LABEL_25;
    }
    uint64_t v47 = v25;
    long long v48 = v24;
    uint64_t v46 = [v7 streamRequest];
    uint64_t v26 = [v46 recordContext];
    if ([v26 type] == 23)
    {

      goto LABEL_24;
    }
    uint64_t v44 = [v7 streamRequest];
    uint64_t v27 = [v44 recordContext];
    uint64_t v45 = [v27 type];

    if (v45 == 27) {
      goto LABEL_27;
    }
    uint64_t v28 = [v6 startAlertBehavior];
    long long v29 = [v7 streamRequest];
    long long v30 = [v29 recordContext];
    int v31 = [v30 isServerInvoked];

    if (v31)
    {
      long long v32 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        long long v52 = "-[CSAudioProvider _didPlayStartAlertSoundForSiri:audioStream:]";
        _os_log_impl(&dword_1BA1A5000, v32, OS_LOG_TYPE_DEFAULT, "%s Skip predictStartAlertBehavior for serverInvoke here", buf, 0xCu);
      }
    }
    else
    {
      if ((unint64_t)(v28 - 5) > 0xFFFFFFFFFFFFFFFBLL)
      {
LABEL_36:
        long long v40 = [(CSAudioProvider *)self audioRecorder];
        int v41 = [v40 playAlertSoundForType:1 recordDevideIndicator:self->_recordDeviceIndicator];

        BOOL v9 = 0;
        if ((v28 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
          goto LABEL_28;
        }
        if (!v41) {
          goto LABEL_28;
        }
        int v42 = [v6 allowRecordWhileBeep];
        BOOL v9 = 1;
        if (v28 != 2) {
          goto LABEL_28;
        }
        if (!v42) {
          goto LABEL_28;
        }
        long long v43 = CSLogCategoryAudio;
        BOOL v9 = 0;
        if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_28;
        }
        *(_DWORD *)buf = 136315138;
        long long v52 = "-[CSAudioProvider _didPlayStartAlertSoundForSiri:audioStream:]";
        _os_log_impl(&dword_1BA1A5000, v43, OS_LOG_TYPE_DEFAULT, "%s Skip waiting for alert playing as we are allowing record during beep playing", buf, 0xCu);
LABEL_27:
        BOOL v9 = 0;
LABEL_28:

        goto LABEL_12;
      }
      long long v33 = [(CSAudioProvider *)self audioRecorder];
      int v34 = [(CSAudioProvider *)self recordDeviceIndicator];
      long long v35 = [v33 recordRouteWithRecordDeviceIndicator:v34];

      long long v36 = [(CSAudioProvider *)self audioRecorder];
      uint64_t v37 = objc_msgSend(v36, "getPlaybackRouteForStreamID:", -[CSAudioProvider audioStreamHandleId](self, "audioStreamHandleId"));

      uint64_t v38 = [v7 streamRequest];
      uint64_t v39 = [v38 recordContext];
      uint64_t v28 = +[CSAlertBehaviorPredictor predictStartAlertBehaviorFor:recordRoute:playbackRoute:](CSAlertBehaviorPredictor, "predictStartAlertBehaviorFor:recordRoute:playbackRoute:", [v39 type], v35, v37);
    }
    if (!v28) {
      goto LABEL_27;
    }
    goto LABEL_36;
  }
  id v8 = (void *)CSLogCategoryAudio;
  BOOL v9 = 0;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v8;
    uint64_t v11 = [(CSAudioProvider *)self UUID];
    *(_DWORD *)buf = 136315394;
    long long v52 = "-[CSAudioProvider _didPlayStartAlertSoundForSiri:audioStream:]";
    __int16 v53 = 2114;
    long long v54 = v11;
    _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Skip running alert logic for ATV/HomePod", buf, 0x16u);
    goto LABEL_6;
  }
LABEL_12:

  return v9;
}

- (BOOL)playAlertSoundForType:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  recordQueue = self->_recordQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__CSAudioProvider_playAlertSoundForType___block_invoke;
  v10[3] = &unk_1E6200F40;
  void v10[4] = self;
  void v10[5] = &v11;
  dispatch_async_and_wait(recordQueue, v10);
  if (*((unsigned char *)v12 + 24))
  {
    id v6 = (id)CSLogCategoryAudio;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v9 = [(CSAudioProvider *)self UUID];
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "-[CSAudioProvider playAlertSoundForType:]";
      __int16 v17 = 2114;
      int v18 = v9;
      _os_log_error_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_ERROR, "%s CSAudioProvider[%{public}@]:AVVC is recovering, ignore command...", buf, 0x16u);
    }
    char v7 = 0;
  }
  else
  {
    id v6 = [(CSAudioProvider *)self audioRecorder];
    char v7 = [v6 playAlertSoundForType:a3 recordDevideIndicator:self->_recordDeviceIndicator];
  }

  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __41__CSAudioProvider_playAlertSoundForType___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (BOOL)setAlertSoundFromURL:(id)a3 forType:(int64_t)a4 force:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  recordQueue = self->_recordQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__CSAudioProvider_setAlertSoundFromURL_forType_force___block_invoke;
  v14[3] = &unk_1E6200F40;
  v14[4] = self;
  v14[5] = &v15;
  dispatch_async_and_wait(recordQueue, v14);
  if (*((unsigned char *)v16 + 24))
  {
    id v10 = (id)CSLogCategoryAudio;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [(CSAudioProvider *)self UUID];
      *(_DWORD *)buf = 136315394;
      __int16 v20 = "-[CSAudioProvider setAlertSoundFromURL:forType:force:]";
      __int16 v21 = 2114;
      uint64_t v22 = v13;
      _os_log_error_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_ERROR, "%s CSAudioProvider[%{public}@]:AVVC is recovering, ignore command...", buf, 0x16u);
    }
    char v11 = 0;
  }
  else
  {
    id v10 = [(CSAudioProvider *)self audioRecorder];
    char v11 = [v10 setAlertSoundFromURL:v8 forType:a4 force:v5];
  }

  _Block_object_dispose(&v15, 8);
  return v11;
}

uint64_t __54__CSAudioProvider_setAlertSoundFromURL_forType_force___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (void)setAudioAlertDelegate:(id)a3
{
  id v4 = a3;
  recordQueue = self->_recordQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__CSAudioProvider_setAudioAlertDelegate___block_invoke;
  v7[3] = &unk_1E6201030;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(recordQueue, v7);
}

uint64_t __41__CSAudioProvider_setAudioAlertDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlertDelegate:*(void *)(a1 + 40)];
}

- (void)setAnnounceCallsEnabled:(BOOL)a3 withStreamHandleID:(unint64_t)a4
{
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__CSAudioProvider_setAnnounceCallsEnabled_withStreamHandleID___block_invoke;
  block[3] = &unk_1E61FFF90;
  BOOL v6 = a3;
  void block[4] = self;
  void block[5] = a4;
  dispatch_async(recordQueue, block);
}

void __62__CSAudioProvider_setAnnounceCallsEnabled_withStreamHandleID___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) audioRecorder];
  [v2 setAnnounceCallsEnabled:*(unsigned __int8 *)(a1 + 48) withStreamHandleID:*(void *)(a1 + 40)];
}

- (void)enableMiniDucking:(BOOL)a3
{
  recordQueue = self->_recordQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__CSAudioProvider_enableMiniDucking___block_invoke;
  v4[3] = &unk_1E61FFE00;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(recordQueue, v4);
}

void __37__CSAudioProvider_enableMiniDucking___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) audioRecorder];
  [v2 enableMiniDucking:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setDuckOthersOption:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3) {
    goto LABEL_7;
  }
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (!CSIsHorseman_isHorseman)
  {
LABEL_7:
    recordQueue = self->_recordQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__CSAudioProvider_setDuckOthersOption___block_invoke;
    v7[3] = &unk_1E61FFE00;
    void v7[4] = self;
    BOOL v8 = a3;
    dispatch_async(recordQueue, v7);
  }
  else
  {
    BOOL v5 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v10 = "-[CSAudioProvider setDuckOthersOption:]";
      _os_log_error_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_ERROR, "%s Unable to disable duckOthers in HomePod", buf, 0xCu);
    }
  }
}

void __39__CSAudioProvider_setDuckOthersOption___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) audioRecorder];
  objc_msgSend(v2, "setDuckMixWithOthersForStream:duckOthers:duckToLevelInDB:mixWithOthers:", objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId"), *(unsigned __int8 *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 40));
}

- (void)enableSmartRoutingConsideration:(BOOL)a3
{
  recordQueue = self->_recordQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__CSAudioProvider_enableSmartRoutingConsideration___block_invoke;
  v4[3] = &unk_1E61FFE00;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(recordQueue, v4);
}

void __51__CSAudioProvider_enableSmartRoutingConsideration___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) audioRecorder];
  objc_msgSend(v2, "enableSmartRoutingConsiderationForStream:enable:", objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId"), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_deactivateAudioSession:(unint64_t)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordQueue);
  char v7 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = v7;
    BOOL v9 = [(CSAudioProvider *)self UUID];
    id v10 = [(CSAudioProvider *)self _streamStateName:self->_streamState];
    *(_DWORD *)buf = 136315650;
    id v25 = "-[CSAudioProvider _deactivateAudioSession:error:]";
    __int16 v26 = 2114;
    uint64_t v27 = v9;
    __int16 v28 = 2114;
    long long v29 = v10;
    _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Deactivating Audio Session under : %{public}@", buf, 0x20u);
  }
  [(CSAudioProvider *)self _switchToListeningMode];
  uint64_t v11 = [(CSAudioProvider *)self audioRecorder];

  if (v11)
  {
    if (CSIsHorseman_onceToken != -1) {
      dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
    }
    int v12 = CSIsHorseman_isHorseman;
    uint64_t v13 = [(CSAudioProvider *)self audioRecorder];
    char v14 = v13;
    if (v12)
    {
      uint64_t v23 = 0;
      int v15 = objc_msgSend(v13, "deactivateAudioSession:streamHandleId:error:", a3, -[CSAudioProvider audioStreamHandleId](self, "audioStreamHandleId"), &v23);
      uint64_t v16 = v23;
    }
    else
    {
      uint64_t v22 = 0;
      int v15 = [v13 deactivateAudioSession:a3 error:&v22];
      uint64_t v16 = v22;
    }
    id v17 = v16;
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:951 userInfo:0];
    int v15 = 0;
  }
  if (self->_currentSessionShouldDuckOnBuiltInSpeaker)
  {
    +[CSAudioRecorder resetDuckSettings];
    self->_currentSessionShouldDuckOnBuiltInSpeaker = 0;
  }
  if (v15)
  {
    [(CSAudioProvider *)self _releaseRecordingTransactionIfNeeded];
    if (!a4) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  char v18 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    __int16 v20 = v18;
    __int16 v21 = [v17 localizedDescription];
    *(_DWORD *)buf = 136315394;
    id v25 = "-[CSAudioProvider _deactivateAudioSession:error:]";
    __int16 v26 = 2114;
    uint64_t v27 = v21;
    _os_log_error_impl(&dword_1BA1A5000, v20, OS_LOG_TYPE_ERROR, "%s Failed to deactivateAudioSession : %{public}@", buf, 0x16u);

    if (!a4) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (a4) {
LABEL_18:
  }
    *a4 = v17;
LABEL_19:

  return v15;
}

- (BOOL)deactivateAudioSession:(unint64_t)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  char v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  char v14 = __Block_byref_object_copy__7237;
  int v15 = __Block_byref_object_dispose__7238;
  id v16 = 0;
  recordQueue = self->_recordQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__CSAudioProvider_deactivateAudioSession_error___block_invoke;
  v10[3] = &unk_1E61FFF68;
  void v10[4] = self;
  void v10[5] = &v17;
  void v10[6] = &v11;
  v10[7] = a3;
  dispatch_async_and_wait(recordQueue, v10);
  if (!*((unsigned char *)v18 + 24))
  {
    BOOL v6 = (id)CSLogCategoryAudio;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v9 = [(id)v12[5] localizedDescription];
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "-[CSAudioProvider deactivateAudioSession:error:]";
      __int16 v23 = 2114;
      uint64_t v24 = v9;
      _os_log_error_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_ERROR, "%s Failed to deactivate audio session : %{public}@", buf, 0x16u);
    }
  }
  if (a4) {
    *a4 = (id) v12[5];
  }
  BOOL v7 = *((unsigned char *)v18 + 24) != 0;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __48__CSAudioProvider_deactivateAudioSession_error___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[7];
  uint64_t v4 = *(void *)(a1[6] + 8);
  obuint64_t j = *(id *)(v4 + 40);
  char v5 = [v2 _deactivateAudioSession:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v5;
}

- (BOOL)_isDuckingOnSpeakerOutputSupportedWithCurrentRoute
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![MEMORY[0x1E4F15508] supportsDuckingOnSpeakerOutput]) {
    return 0;
  }
  uint64_t v3 = [(CSAudioProvider *)self audioRecorder];
  id v10 = 0;
  char v4 = objc_msgSend(v3, "isDuckingSupportedOnCurrentRouteWithStreamHandleID:error:", -[CSAudioProvider audioStreamHandleId](self, "audioStreamHandleId"), &v10);
  id v5 = v10;

  if (v5)
  {
    BOOL v6 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = v6;
      BOOL v9 = [v5 localizedDescription];
      *(_DWORD *)buf = 136315394;
      int v12 = "-[CSAudioProvider _isDuckingOnSpeakerOutputSupportedWithCurrentRoute]";
      __int16 v13 = 2114;
      char v14 = v9;
      _os_log_error_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_ERROR, "%s Failed to fetch duckingSupported result : %{public}@", buf, 0x16u);
    }
  }

  return v4;
}

- (BOOL)_shouldDuckOnBuiltInSpeaker
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CSAudioProvider *)self audioRecorder];

  if (v3)
  {
    BOOL v4 = [(CSAudioProvider *)self _isDuckingOnSpeakerOutputSupportedWithCurrentRoute];
    id v5 = [(CSAudioProvider *)self audioRecorder];
    BOOL v6 = objc_msgSend(v5, "getPlaybackRouteForStreamID:", -[CSAudioProvider audioStreamHandleId](self, "audioStreamHandleId"));

    int v7 = [v6 isEqualToString:*MEMORY[0x1E4F15110]];
    int v8 = v7;
    if (self->_audioStreamType == 2) {
      int v9 = v7;
    }
    else {
      int v9 = 0;
    }
    int v10 = v9 & v4;
    uint64_t v11 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEBUG))
    {
      __int16 v13 = v11;
      uint64_t v14 = [(CSAudioProvider *)self UUID];
      uint64_t v15 = (void *)v14;
      int64_t audioStreamType = self->_audioStreamType;
      uint64_t v17 = @"NO";
      int v20 = 136316418;
      __int16 v21 = "-[CSAudioProvider _shouldDuckOnBuiltInSpeaker]";
      if (v10) {
        char v18 = @"YES";
      }
      else {
        char v18 = @"NO";
      }
      if (v8) {
        uint64_t v19 = @"YES";
      }
      else {
        uint64_t v19 = @"NO";
      }
      __int16 v22 = 2114;
      uint64_t v23 = v14;
      __int16 v24 = 2114;
      if (v4) {
        uint64_t v17 = @"YES";
      }
      uint64_t v25 = v18;
      __int16 v26 = 2050;
      int64_t v27 = audioStreamType;
      __int16 v28 = 2114;
      long long v29 = v19;
      __int16 v30 = 2114;
      int v31 = v17;
      _os_log_debug_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_DEBUG, "%s CSAudioProvider[%{public}@]:shouldDuckOnBuiltInSpeaker: %{public}@ (audioStreamType: %{public}lu, isPlaybackRouteBuiltInSpeaker: %{public}@, isDuckingOnSpeakerOutputSupported: %{public}@)", (uint8_t *)&v20, 0x3Eu);
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (BOOL)_activateAudioSessionWithReason:(unint64_t)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordQueue);
  int v7 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = v7;
    int v9 = [(CSAudioProvider *)self UUID];
    int v10 = [(CSAudioProvider *)self _streamStateName:self->_streamState];
    *(_DWORD *)buf = 136315650;
    __int16 v26 = "-[CSAudioProvider _activateAudioSessionWithReason:error:]";
    __int16 v27 = 2114;
    __int16 v28 = v9;
    __int16 v29 = 2114;
    __int16 v30 = v10;
    _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Activating Audio Session under : %{public}@", buf, 0x20u);
  }
  self->_currentSessionShouldDuckOnBuiltInSpeaker = 0;
  uint64_t v11 = AFDeviceSupportsSystemAssistantExperience();
  int v12 = [(CSAudioProvider *)self audioRecorder];
  objc_msgSend(v12, "setEnableInterruptionByRecordingClientsForStream:enable:", -[CSAudioProvider audioStreamId](self, "audioStreamId"), v11);

  __int16 v13 = [(CSAudioProvider *)self audioRecorder];

  if (v13)
  {
    BOOL v14 = [(CSAudioProvider *)self _shouldDuckOnBuiltInSpeaker];
    self->_currentSessionShouldDuckOnBuiltInSpeaker = v14;
    if (v14)
    {
      uint64_t v15 = [(CSAudioProvider *)self audioRecorder];
      objc_msgSend(v15, "setDuckMixWithOthersForStream:duckOthers:duckToLevelInDB:mixWithOthers:", -[CSAudioProvider audioStreamHandleId](self, "audioStreamHandleId"), 1, &unk_1F13B85B8, 1);
    }
    id v16 = [(CSAudioProvider *)self audioRecorder];
    id v24 = 0;
    LODWORD(v13) = objc_msgSend(v16, "activateAudioSessionWithReason:streamHandleId:error:", a3, -[CSAudioProvider audioStreamHandleId](self, "audioStreamHandleId"), &v24);
    id v17 = v24;
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:958 userInfo:0];
  }
  if (+[CSUtils supportNonInterruptibleSiri]
    && self->_audioStreamType == 2)
  {
    if (self->_currentSessionShouldDuckOnBuiltInSpeaker) {
      int v18 = 0;
    }
    else {
      int v18 = (int)v13;
    }
    if (a3 - 2 <= 2 && v18)
    {
      uint64_t v19 = [(CSAudioProvider *)self audioRecorder];
      objc_msgSend(v19, "setDuckMixWithOthersForStream:duckOthers:duckToLevelInDB:mixWithOthers:", -[CSAudioProvider audioStreamHandleId](self, "audioStreamHandleId"), 1, 0, 1);
    }
  }
  if (v13)
  {
    [(CSAudioProvider *)self _holdRecordingTransactionIfNeeded];
    if (!a4) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  int v20 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    __int16 v22 = v20;
    uint64_t v23 = [v17 localizedDescription];
    *(_DWORD *)buf = 136315394;
    __int16 v26 = "-[CSAudioProvider _activateAudioSessionWithReason:error:]";
    __int16 v27 = 2114;
    __int16 v28 = v23;
    _os_log_error_impl(&dword_1BA1A5000, v22, OS_LOG_TYPE_ERROR, "%s Failed to activateAudioSession : %{public}@", buf, 0x16u);

    if (!a4) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (a4) {
LABEL_21:
  }
    *a4 = v17;
LABEL_22:

  return (char)v13;
}

- (BOOL)activateAudioSessionWithReason:(unint64_t)a3 dynamicAttribute:(unint64_t)a4 bundleID:(id)a5 error:(id *)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__7237;
  int v20 = __Block_byref_object_dispose__7238;
  id v21 = 0;
  recordQueue = self->_recordQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__CSAudioProvider_activateAudioSessionWithReason_dynamicAttribute_bundleID_error___block_invoke;
  v15[3] = &unk_1E61FFF68;
  v15[4] = self;
  v15[5] = &v22;
  v15[6] = &v16;
  v15[7] = a3;
  dispatch_async_and_wait(recordQueue, v15);
  if (!*((unsigned char *)v23 + 24))
  {
    uint64_t v11 = (id)CSLogCategoryAudio;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BOOL v14 = [(id)v17[5] localizedDescription];
      *(_DWORD *)buf = 136315394;
      __int16 v27 = "-[CSAudioProvider activateAudioSessionWithReason:dynamicAttribute:bundleID:error:]";
      __int16 v28 = 2114;
      __int16 v29 = v14;
      _os_log_error_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_ERROR, "%s Failed to activateAudioSessionWithReason: %{public}@", buf, 0x16u);
    }
  }
  if (a6) {
    *a6 = (id) v17[5];
  }
  BOOL v12 = *((unsigned char *)v23 + 24) != 0;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __82__CSAudioProvider_activateAudioSessionWithReason_dynamicAttribute_bundleID_error___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[7];
  uint64_t v4 = *(void *)(a1[6] + 8);
  obuint64_t j = *(id *)(v4 + 40);
  char v5 = [v2 _activateAudioSessionWithReason:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v5;
}

- (BOOL)prewarmAudioSessionWithError:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  __int16 v13 = __Block_byref_object_copy__7237;
  BOOL v14 = __Block_byref_object_dispose__7238;
  id v15 = 0;
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CSAudioProvider_prewarmAudioSessionWithError___block_invoke;
  block[3] = &unk_1E61FFF40;
  void block[4] = self;
  void block[5] = &v16;
  void block[6] = &v10;
  dispatch_async_and_wait(recordQueue, block);
  if (!*((unsigned char *)v17 + 24))
  {
    char v5 = (id)CSLogCategoryAudio;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = [(id)v11[5] localizedDescription];
      *(_DWORD *)buf = 136315394;
      id v21 = "-[CSAudioProvider prewarmAudioSessionWithError:]";
      __int16 v22 = 2114;
      uint64_t v23 = v8;
      _os_log_error_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_ERROR, "%s Failed to prewarmAudioSessionWithError : %{public}@", buf, 0x16u);
    }
  }
  if (a3) {
    *a3 = (id) v11[5];
  }
  BOOL v6 = *((unsigned char *)v17 + 24) != 0;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v6;
}

void __48__CSAudioProvider_prewarmAudioSessionWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) audioRecorder];
  uint64_t v3 = [*(id *)(a1 + 32) audioStreamHandleId];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  obuint64_t j = *(id *)(v4 + 40);
  char v5 = [v2 prewarmAudioSessionWithStreamHandleId:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
}

- (void)setAudioSessionDelegate:(id)a3
{
  id v4 = a3;
  recordQueue = self->_recordQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__CSAudioProvider_setAudioSessionDelegate___block_invoke;
  v7[3] = &unk_1E6201030;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(recordQueue, v7);
}

uint64_t __43__CSAudioProvider_setAudioSessionDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSessionDelegate:*(void *)(a1 + 40)];
}

- (id)playbackRoute
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__7237;
  uint64_t v10 = __Block_byref_object_dispose__7238;
  id v11 = 0;
  recordQueue = self->_recordQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__CSAudioProvider_playbackRoute__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(recordQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __32__CSAudioProvider_playbackRoute__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) audioRecorder];
  id v2 = objc_msgSend(v6, "getPlaybackRouteForStreamID:", objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId"));
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)recordSettings
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__7237;
  uint64_t v10 = __Block_byref_object_dispose__7238;
  id v11 = 0;
  recordQueue = self->_recordQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__CSAudioProvider_recordSettings__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(recordQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __33__CSAudioProvider_recordSettings__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) audioRecorder];
  id v2 = objc_msgSend(v6, "recordSettingsWithStreamHandleId:", objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId"));
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)audioDeviceInfo
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__7237;
  uint64_t v10 = __Block_byref_object_dispose__7238;
  id v11 = 0;
  recordQueue = self->_recordQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__CSAudioProvider_audioDeviceInfo__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(recordQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__CSAudioProvider_audioDeviceInfo__block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) audioRecorder];
  uint64_t v2 = [*(id *)(a1 + 32) audioStreamHandleId];
  id v3 = [*(id *)(a1 + 32) recordDeviceIndicator];
  uint64_t v4 = [v7 audioDeviceInfoWithStreamHandleId:v2 recordDeviceIndicator:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)recordDeviceInfo
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__7237;
  uint64_t v10 = __Block_byref_object_dispose__7238;
  id v11 = 0;
  recordQueue = self->_recordQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__CSAudioProvider_recordDeviceInfo__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(recordQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __35__CSAudioProvider_recordDeviceInfo__block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) audioRecorder];
  uint64_t v2 = [*(id *)(a1 + 32) audioStreamHandleId];
  id v3 = [*(id *)(a1 + 32) recordDeviceIndicator];
  uint64_t v4 = [v7 recordDeviceInfoWithStreamHandleId:v2 recordDeviceIndicator:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)recordRoute
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__7237;
  uint64_t v10 = __Block_byref_object_dispose__7238;
  id v11 = 0;
  recordQueue = self->_recordQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__CSAudioProvider_recordRoute__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(recordQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __30__CSAudioProvider_recordRoute__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) audioRecorder];
  uint64_t v2 = [*(id *)(a1 + 32) recordDeviceIndicator];
  uint64_t v3 = [v6 recordRouteWithRecordDeviceIndicator:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)cancelAudioStreamHold:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      id v7 = [(CSAudioProvider *)self UUID];
      uint64_t v8 = [v4 name];
      *(_DWORD *)buf = 136315650;
      __int16 v13 = "-[CSAudioProvider cancelAudioStreamHold:]";
      __int16 v14 = 2114;
      id v15 = v7;
      __int16 v16 = 2114;
      id v17 = v8;
      _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:%{public}@ ask for cancel hold stream", buf, 0x20u);
    }
    recordQueue = self->_recordQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__CSAudioProvider_cancelAudioStreamHold___block_invoke;
    v10[3] = &unk_1E6201030;
    void v10[4] = self;
    id v11 = v4;
    dispatch_async(recordQueue, v10);
  }
}

uint64_t __41__CSAudioProvider_cancelAudioStreamHold___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelAudioStreamHold:*(void *)(a1 + 40)];
}

- (void)_cancelAudioStreamHold:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CSAudioProvider *)self streamHolders];
  int v6 = [v5 containsObject:v4];

  id v7 = (void *)CSLogCategoryAudio;
  BOOL v8 = os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      id v9 = v7;
      uint64_t v10 = [(CSAudioProvider *)self UUID];
      id v11 = [v4 name];
      int v22 = 136315650;
      uint64_t v23 = "-[CSAudioProvider _cancelAudioStreamHold:]";
      __int16 v24 = 2114;
      char v25 = v10;
      __int16 v26 = 2114;
      __int16 v27 = v11;
      _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Removing %{public}@ from stream holders", (uint8_t *)&v22, 0x20u);
    }
    uint64_t v12 = [(CSAudioProvider *)self streamHolders];
    [v12 removeObject:v4];

    __int16 v13 = [v4 listeningMicIndicatorLockUUIDString];

    if (v13)
    {
      __int16 v14 = [v4 listeningMicIndicatorLockUUIDString];
      [(CSAudioProvider *)self _releaseListeningMicIndicatorLock:v14];
    }
    id v15 = [v4 recordModeLockUUIDString];

    if (v15)
    {
      __int16 v16 = [v4 recordModeLockUUIDString];
      [(CSAudioProvider *)self _releaseRecordModeLock:v16];
    }
    [(CSAudioProvider *)self _stopAudioStream:0 option:0 completion:0];
    id v17 = +[CSAudioStreamActivityMonitor sharedInstance];
    uint64_t v18 = [(CSAudioProvider *)self streams];
    char v19 = [(CSAudioProvider *)self streamHolders];
    [v17 notifyActiveStreamsChanged:v18 streamHolders:v19 streamId:self->_audioStreamHandleId];

    goto LABEL_11;
  }
  if (v8)
  {
    id v17 = v7;
    int v20 = [(CSAudioProvider *)self UUID];
    id v21 = [v4 name];
    int v22 = 136315650;
    uint64_t v23 = "-[CSAudioProvider _cancelAudioStreamHold:]";
    __int16 v24 = 2114;
    char v25 = v20;
    __int16 v26 = 2114;
    __int16 v27 = v21;
    _os_log_impl(&dword_1BA1A5000, v17, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:%{public}@ stream holder was already removed from stream holders", (uint8_t *)&v22, 0x20u);

LABEL_11:
  }
}

- (void)_didFireStreamHolderTimeout:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = v5;
    id v7 = [(CSAudioProvider *)self UUID];
    BOOL v8 = [v4 name];
    int v9 = 136315650;
    uint64_t v10 = "-[CSAudioProvider _didFireStreamHolderTimeout:]";
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    __int16 v14 = v8;
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Timeout for %{public}@ has fired", (uint8_t *)&v9, 0x20u);
  }
  [(CSAudioProvider *)self _cancelAudioStreamHold:v4];
}

- (void)_holdAudioStreamWithHolder:(id)a3 option:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 timeout];
  if (v8 > 0.0)
  {
    if ([v7 requireListeningMicIndicatorLock])
    {
      int v9 = -[CSAudioProvider _acquireListeningMicIndicatorLockFrom:](self, "_acquireListeningMicIndicatorLockFrom:", [v7 clientIdentity]);
      uint64_t v10 = [v9 UUIDString];
      [v6 setListeningMicIndicatorLockUUIDString:v10];
    }
    if ([v7 requireRecordModeLock])
    {
      __int16 v11 = -[CSAudioProvider _acquireRecordModeLockFrom:](self, "_acquireRecordModeLockFrom:", [v7 clientIdentity]);
      uint64_t v12 = [v11 UUIDString];
      [v6 setRecordModeLockUUIDString:v12];
    }
    __int16 v13 = [(CSAudioProvider *)self streamHolders];
    [v13 addObject:v6];

    __int16 v14 = +[CSAudioStreamActivityMonitor sharedInstance];
    uint64_t v15 = [(CSAudioProvider *)self streams];
    __int16 v16 = [(CSAudioProvider *)self streamHolders];
    [v14 notifyActiveStreamsChanged:v15 streamHolders:v16 streamId:self->_audioStreamHandleId];

    objc_initWeak(&location, self);
    [v7 timeout];
    dispatch_time_t v18 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
    recordQueue = self->_recordQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__CSAudioProvider__holdAudioStreamWithHolder_option___block_invoke;
    block[3] = &unk_1E61FFF18;
    objc_copyWeak(&v22, &location);
    id v21 = v6;
    dispatch_after(v18, recordQueue, block);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

void __53__CSAudioProvider__holdAudioStreamWithHolder_option___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didFireStreamHolderTimeout:*(void *)(a1 + 32)];
}

- (id)holdAudioStreamWithDescription:(id)a3 option:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  double v8 = -[CSAudioStreamHolding initWithName:clientIdentity:]([CSAudioStreamHolding alloc], "initWithName:clientIdentity:", v7, [v6 clientIdentity]);

  int v9 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v9;
    __int16 v11 = [(CSAudioProvider *)self UUID];
    uint64_t v12 = [(CSAudioStreamHolding *)v8 name];
    *(_DWORD *)buf = 136315906;
    uint64_t v23 = "-[CSAudioProvider holdAudioStreamWithDescription:option:]";
    __int16 v24 = 2114;
    char v25 = v11;
    __int16 v26 = 2114;
    __int16 v27 = v12;
    __int16 v28 = 2050;
    double v29 = (float)(unint64_t)[v6 clientIdentity];
    _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:%{public}@ ask for audio hold stream for %{public}f", buf, 0x2Au);
  }
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CSAudioProvider_holdAudioStreamWithDescription_option___block_invoke;
  block[3] = &unk_1E6200E38;
  void block[4] = self;
  __int16 v14 = v8;
  int v20 = v14;
  id v21 = v6;
  id v15 = v6;
  dispatch_async(recordQueue, block);
  __int16 v16 = v21;
  double v17 = v14;

  return v17;
}

uint64_t __57__CSAudioProvider_holdAudioStreamWithDescription_option___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _holdAudioStreamWithHolder:*(void *)(a1 + 40) option:*(void *)(a1 + 48)];
}

- (void)_saveRecordingBufferFrom:(unint64_t)a3 to:(unint64_t)a4 toURL:(id)a5
{
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_streamHandleQueue);
  id v9 = [(CSAudioCircularBuffer *)self->_circularBuffer copySamplesFrom:a3 to:a4];
  uint64_t v10 = v9;
  if (v9)
  {
    loggingQueue = self->_loggingQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__CSAudioProvider__saveRecordingBufferFrom_to_toURL___block_invoke;
    v12[3] = &unk_1E6200320;
    unint64_t v15 = a3;
    unint64_t v16 = a4;
    id v13 = v9;
    id v14 = v8;
    dispatch_async(loggingQueue, v12);
  }
}

uint64_t __53__CSAudioProvider__saveRecordingBufferFrom_to_toURL___block_invoke(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[6];
    uint64_t v4 = a1[7];
    int v6 = 136315650;
    id v7 = "-[CSAudioProvider _saveRecordingBufferFrom:to:toURL:]_block_invoke";
    __int16 v8 = 2050;
    uint64_t v9 = v3;
    __int16 v10 = 2050;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Saving circular buffer from %{public}lu to %{public}lu", (uint8_t *)&v6, 0x20u);
  }
  return +[CSPlainAudioFileWriter saveAudioChunck:a1[4] toURL:a1[5]];
}

- (void)saveRecordingBufferFrom:(unint64_t)a3 to:(unint64_t)a4 toURL:(id)a5
{
  id v8 = a5;
  streamHandleQueue = self->_streamHandleQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__CSAudioProvider_saveRecordingBufferFrom_to_toURL___block_invoke;
  v11[3] = &unk_1E6200320;
  unint64_t v13 = a3;
  unint64_t v14 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(streamHandleQueue, v11);
}

uint64_t __52__CSAudioProvider_saveRecordingBufferFrom_to_toURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveRecordingBufferFrom:*(void *)(a1 + 48) to:*(void *)(a1 + 56) toURL:*(void *)(a1 + 40)];
}

- (void)saveRecordingBufferToEndFrom:(unint64_t)a3 toURL:(id)a4
{
  id v6 = a4;
  streamHandleQueue = self->_streamHandleQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CSAudioProvider_saveRecordingBufferToEndFrom_toURL___block_invoke;
  block[3] = &unk_1E6200148;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(streamHandleQueue, block);
}

void *__54__CSAudioProvider_saveRecordingBufferToEndFrom_toURL___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  unint64_t result = (void *)v2[21];
  if (result)
  {
    uint64_t v4 = a1[6];
    uint64_t v5 = [result sampleCount];
    uint64_t v6 = a1[5];
    return (void *)[v2 _saveRecordingBufferFrom:v4 to:v5 toURL:v6];
  }
  return result;
}

- (id)_audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4 channelIdx:(unint64_t)a5
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_streamHandleQueue);
  if (a3 >= a4) {
    id v9 = 0;
  }
  else {
    id v9 = [(CSAudioCircularBuffer *)self->_circularBuffer copySamplesFrom:a3 to:a4 channelIdx:a5];
  }
  return v9;
}

- (id)_audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_streamHandleQueue);
  if (a3 >= a4) {
    id v7 = 0;
  }
  else {
    id v7 = [(CSAudioCircularBuffer *)self->_circularBuffer copySamplesFrom:a3 to:a4];
  }
  return v7;
}

- (id)audioChunkToEndFrom:(unint64_t)a3 channelIdx:(unint64_t)a4
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  unint64_t v11 = __Block_byref_object_copy__7237;
  id v12 = __Block_byref_object_dispose__7238;
  id v13 = 0;
  streamHandleQueue = self->_streamHandleQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__CSAudioProvider_audioChunkToEndFrom_channelIdx___block_invoke;
  v7[3] = &unk_1E61FFEF0;
  void v7[4] = self;
  void v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  dispatch_async_and_wait(streamHandleQueue, v7);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void *__50__CSAudioProvider_audioChunkToEndFrom_channelIdx___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  unint64_t result = (void *)v2[21];
  if (result)
  {
    *(void *)(*(void *)(a1[5] + 8) + 40) = objc_msgSend(v2, "_audioChunkFrom:to:channelIdx:", a1[6], objc_msgSend(result, "sampleCount"), a1[7]);
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (id)audioChunkToEndFrom:(unint64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__7237;
  unint64_t v11 = __Block_byref_object_dispose__7238;
  id v12 = 0;
  streamHandleQueue = self->_streamHandleQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CSAudioProvider_audioChunkToEndFrom___block_invoke;
  block[3] = &unk_1E6200FE0;
  void block[4] = self;
  void block[5] = &v7;
  void block[6] = a3;
  dispatch_async_and_wait(streamHandleQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void *__39__CSAudioProvider_audioChunkToEndFrom___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  unint64_t result = (void *)v2[21];
  if (result)
  {
    *(void *)(*(void *)(a1[5] + 8) + 40) = objc_msgSend(v2, "_audioChunkFrom:to:", a1[6], objc_msgSend(result, "sampleCount"));
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4 channelIdx:(unint64_t)a5
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__7237;
  id v13 = __Block_byref_object_dispose__7238;
  id v14 = 0;
  streamHandleQueue = self->_streamHandleQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CSAudioProvider_audioChunkFrom_to_channelIdx___block_invoke;
  block[3] = &unk_1E61FFEC8;
  void block[4] = self;
  void block[5] = &v9;
  void block[6] = a3;
  void block[7] = a4;
  block[8] = a5;
  dispatch_async_and_wait(streamHandleQueue, block);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void *__48__CSAudioProvider_audioChunkFrom_to_channelIdx___block_invoke(void *a1)
{
  unint64_t result = (void *)a1[4];
  if (result[21])
  {
    *(void *)(*(void *)(a1[5] + 8) + 40) = [result _audioChunkFrom:a1[6] to:a1[7] channelIdx:a1[8]];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (id)audioChunkFrom:(unint64_t)a3 to:(unint64_t)a4
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__7237;
  id v12 = __Block_byref_object_dispose__7238;
  id v13 = 0;
  recordQueue = self->_recordQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__CSAudioProvider_audioChunkFrom_to___block_invoke;
  v7[3] = &unk_1E61FFEF0;
  void v7[4] = self;
  void v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  dispatch_async_and_wait(recordQueue, v7);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __37__CSAudioProvider_audioChunkFrom_to___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _audioChunkFrom:*(void *)(a1 + 48) to:*(void *)(a1 + 56)];
  return MEMORY[0x1F41817F8]();
}

- (void)_stopAudioStream:(id)a3 option:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordQueue);
  uint64_t v11 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    id v13 = [(CSAudioProvider *)self UUID];
    *(_DWORD *)buf = 136315394;
    __int16 v24 = "-[CSAudioProvider _stopAudioStream:option:completion:]";
    __int16 v25 = 2114;
    __int16 v26 = v13;
    _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Waiting for recordingWillStartGroup before scheduling stopAudioStream", buf, 0x16u);
  }
  recordingWillStartGroup = self->_recordingWillStartGroup;
  recordQueue = self->_recordQueue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke;
  v19[3] = &unk_1E61FFEA0;
  v19[4] = self;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  dispatch_group_notify(recordingWillStartGroup, recordQueue, v19);
}

void __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke(id *a1)
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    id v4 = v2;
    id v5 = [v3 UUID];
    id v6 = [a1[5] name];
    uint64_t v7 = [a1[4] _streamStateName:*((void *)a1[4] + 7)];
    *(_DWORD *)buf = 136315906;
    v104 = "-[CSAudioProvider _stopAudioStream:option:completion:]_block_invoke";
    __int16 v105 = 2114;
    id v106 = v5;
    __int16 v107 = 2114;
    id v108 = v6;
    __int16 v109 = 2114;
    v110 = v7;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Scheduled stopAudioStream after waiting for recordingWillStartGroup - stopAudioStream %{public}@ with streamState : %{public}@", buf, 0x2Au);
  }
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_101;
  v101[3] = &unk_1E62011D8;
  id v102 = a1[7];
  id v8 = (void (**)(void, void, void))MEMORY[0x1BA9E7570](v101);
  id v9 = [a1[6] holdRequest];

  if (v9)
  {
    id v10 = [CSAudioStreamHolding alloc];
    uint64_t v11 = [a1[6] holdRequest];
    id v12 = -[CSAudioStreamHolding initWithName:clientIdentity:](v10, "initWithName:clientIdentity:", @"Requested at stop", [v11 clientIdentity]);

    id v13 = a1[4];
    id v14 = [a1[6] holdRequest];
    [v13 _holdAudioStreamWithHolder:v12 option:v14];
  }
  unint64_t v15 = [a1[5] streamRequest];
  BOOL v16 = [v15 clientIdentity] == 1;

  if (v16)
  {
    id v17 = a1[4];
    id v18 = *((void *)v17 + 5);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_2;
    block[3] = &unk_1E6201030;
    void block[4] = v17;
    id v100 = a1[5];
    dispatch_async(v18, block);
  }
  uint64_t v95 = 0;
  v96 = &v95;
  uint64_t v97 = 0x2020000000;
  char v98 = 0;
  id v19 = a1[4];
  id v20 = *((void *)v19 + 5);
  v92[0] = MEMORY[0x1E4F143A8];
  v92[1] = 3221225472;
  v92[2] = __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_3;
  v92[3] = &unk_1E6201328;
  v94 = &v95;
  v92[4] = v19;
  id v93 = a1[5];
  dispatch_async_and_wait(v20, v92);
  id v21 = a1[4];
  if (*((void *)v21 + 7) == 5 && *((unsigned char *)v96 + 24))
  {
    id v22 = (id)CSLogCategoryAudio;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = [a1[4] UUID];
      *(_DWORD *)buf = 136315394;
      v104 = "-[CSAudioProvider _stopAudioStream:option:completion:]_block_invoke_4";
      __int16 v105 = 2114;
      id v106 = v23;
      _os_log_impl(&dword_1BA1A5000, v22, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:requested stop audio stream while stoppingWithScheduledStart, take out audio stream from schedule", buf, 0x16u);
    }
    id v24 = a1[4];
    __int16 v25 = *((void *)v24 + 5);
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_107;
    v90[3] = &unk_1E6201030;
    v90[4] = v24;
    id v91 = a1[5];
    dispatch_async_and_wait(v25, v90);
    v8[2](v8, 1, 0);
  }
  else
  {
    uint64_t v86 = 0;
    v87 = &v86;
    uint64_t v88 = 0x2020000000;
    char v89 = 0;
    __int16 v26 = *((void *)v21 + 5);
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_2_108;
    v83[3] = &unk_1E6201328;
    v85 = &v86;
    v83[4] = v21;
    id v84 = a1[5];
    dispatch_async_and_wait(v26, v83);
    id v27 = a1[5];
    if (!v27 || *((unsigned char *)v87 + 24) || ([v27 isStreaming] & 1) != 0)
    {
      id v28 = a1[4];
      switch(*((void *)v28 + 7))
      {
        case 0:
          long long v43 = (id)CSLogCategoryAudio;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
          {
            id v67 = [a1[4] UUID];
            v68 = [a1[4] _streamStateName:*((void *)a1[4] + 7)];
            *(_DWORD *)buf = 136315650;
            v104 = "-[CSAudioProvider _stopAudioStream:option:completion:]_block_invoke";
            __int16 v105 = 2114;
            id v106 = v67;
            __int16 v107 = 2114;
            id v108 = v68;
            _os_log_fault_impl(&dword_1BA1A5000, v43, OS_LOG_TYPE_FAULT, "%s CSAudioProvider[%{public}@]:Cannot handle stop audio stream on : %{public}@", buf, 0x20u);
          }
          uint64_t v44 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:952 userInfo:0];
          ((void (**)(void, void, void *))v8)[2](v8, 0, v44);

          break;
        case 1:
          goto LABEL_20;
        case 2:
          if (a1[5])
          {
            __int16 v61 = (id)CSLogCategoryAudio;
            if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
            {
              id v62 = [a1[4] UUID];
              __int16 v63 = [a1[4] _streamStateName:*((void *)a1[4] + 7)];
              *(_DWORD *)buf = 136315650;
              v104 = "-[CSAudioProvider _stopAudioStream:option:completion:]_block_invoke";
              __int16 v105 = 2114;
              id v106 = v62;
              __int16 v107 = 2114;
              id v108 = v63;
              _os_log_fault_impl(&dword_1BA1A5000, v61, OS_LOG_TYPE_FAULT, "%s CSAudioProvider[%{public}@]:Cannot handle stop audio stream on : %{public}@", buf, 0x20u);
            }
            unint64_t v64 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:953 userInfo:0];
            ((void (**)(void, void, void *))v8)[2](v8, 0, v64);
            int v65 = 1440;
            unint64_t v66 = "-[CSAudioProvider _stopAudioStream:option:completion:]_block_invoke";
LABEL_47:

            __assert_rtn(v66, "CSAudioProvider.m", v65, "NO");
          }
LABEL_20:
          v8[2](v8, 1, 0);
          break;
        case 3:
          long long v33 = *((void *)v28 + 5);
          v78[0] = MEMORY[0x1E4F143A8];
          v78[1] = 3221225472;
          v78[2] = __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_2_113;
          v78[3] = &unk_1E6201030;
          v78[4] = v28;
          id v79 = a1[5];
          dispatch_async_and_wait(v33, v78);
          if ([a1[4] _shouldStopRecording])
          {
            id v34 = a1[4];
            long long v35 = *((void *)v34 + 5);
            v75[0] = MEMORY[0x1E4F143A8];
            v75[1] = 3221225472;
            v75[2] = __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_3_114;
            v75[3] = &unk_1E61FFFB8;
            v75[4] = v34;
            id v76 = a1[5];
            id v77 = a1[7];
            dispatch_async_and_wait(v35, v75);
            [a1[4] _scheduleDidStopRecordingDelegateWatchDog];
            long long v36 = [a1[4] audioRecorder];
            uint64_t v37 = [a1[4] recordDeviceIndicator];
            id v74 = 0;
            int v38 = [v36 stopAudioStreamWithRecordDeviceIndicator:v37 error:&v74];
            id v39 = v74;

            if (v38)
            {
              [a1[4] setStreamState:4];
              long long v40 = (id)CSLogCategoryAudio;
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                id v41 = [a1[4] UUID];
                int v42 = [a1[4] _streamStateName:*((void *)a1[4] + 7)];
                *(_DWORD *)buf = 136315650;
                v104 = "-[CSAudioProvider _stopAudioStream:option:completion:]_block_invoke_4";
                __int16 v105 = 2114;
                id v106 = v41;
                __int16 v107 = 2114;
                id v108 = v42;
                _os_log_impl(&dword_1BA1A5000, v40, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Stop all recordings, moving stream state to %{public}@", buf, 0x20u);
              }
            }
            else
            {
              v58 = (id)CSLogCategoryAudio;
              if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
              {
                id v69 = [a1[4] UUID];
                v70 = [v39 localizedDescription];
                *(_DWORD *)buf = 136315650;
                v104 = "-[CSAudioProvider _stopAudioStream:option:completion:]_block_invoke";
                __int16 v105 = 2114;
                id v106 = v69;
                __int16 v107 = 2114;
                id v108 = v70;
                _os_log_fault_impl(&dword_1BA1A5000, v58, OS_LOG_TYPE_FAULT, "%s CSAudioProvider[%{public}@]:Failed to stop audioStream : %{public}@", buf, 0x20u);
              }
              [a1[4] _preEpilogueAudioStream];
              [a1[4] setStreamState:1];
              id v59 = a1[4];
              __int16 v60 = *((void *)v59 + 5);
              v71[0] = MEMORY[0x1E4F143A8];
              v71[1] = 3221225472;
              v71[2] = __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_115;
              v71[3] = &unk_1E6200E38;
              v71[4] = v59;
              id v72 = a1[5];
              id v73 = v39;
              dispatch_async_and_wait(v60, v71);
              [a1[4] _postEpilogueAudioStream];
            }
          }
          else
          {
            long long v50 = [a1[5] streamRequest];
            int v51 = [v50 requestListeningMicIndicatorLock];

            if (v51)
            {
              id v52 = a1[4];
              __int16 v53 = [a1[5] streamRequest];
              objc_msgSend(v52, "_forceReleaseListeningMicIndicatorLockFrom:", objc_msgSend(v53, "clientIdentity"));
            }
            long long v54 = [a1[5] streamRequest];
            int v55 = [v54 requestRecordModeLock];

            if (v55)
            {
              id v56 = a1[4];
              v57 = [a1[5] streamRequest];
              objc_msgSend(v56, "_forceReleaseRecordModeLockFrom:", objc_msgSend(v57, "clientIdentity"));
            }
            v8[2](v8, 1, 0);
          }

          break;
        case 4:
        case 5:
          double v29 = (id)CSLogCategoryAudio;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v30 = [a1[4] UUID];
            *(_DWORD *)buf = 136315394;
            v104 = "-[CSAudioProvider _stopAudioStream:option:completion:]_block_invoke";
            __int16 v105 = 2114;
            id v106 = v30;
            _os_log_impl(&dword_1BA1A5000, v29, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:requested stop audio stream while stopping, adding audio stream into stop pending", buf, 0x16u);
          }
          id v31 = a1[4];
          uint64_t v32 = *((void *)v31 + 5);
          v80[0] = MEMORY[0x1E4F143A8];
          v80[1] = 3221225472;
          v80[2] = __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_112;
          v80[3] = &unk_1E61FFFB8;
          v80[4] = v31;
          id v81 = a1[5];
          id v82 = a1[7];
          dispatch_async_and_wait(v32, v80);

          break;
        default:
          unint64_t v64 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:951 userInfo:0];
          ((void (**)(void, void, void *))v8)[2](v8, 0, v64);
          int v65 = 1546;
          unint64_t v66 = "-[CSAudioProvider _stopAudioStream:option:completion:]_block_invoke_2";
          goto LABEL_47;
      }
    }
    else
    {
      uint64_t v45 = (id)CSLogCategoryAudio;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        id v46 = [a1[4] UUID];
        id v47 = [a1[5] name];
        long long v48 = [a1[4] _streamStateName:*((void *)a1[4] + 7)];
        *(_DWORD *)buf = 136315906;
        v104 = "-[CSAudioProvider _stopAudioStream:option:completion:]_block_invoke_3";
        __int16 v105 = 2114;
        id v106 = v46;
        __int16 v107 = 2114;
        id v108 = v47;
        __int16 v109 = 2114;
        v110 = v48;
        _os_log_impl(&dword_1BA1A5000, v45, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Stream %{public}@ is not streaming on stream state : %{public}@, ignore the stopAudioStream request", buf, 0x2Au);
      }
      long long v49 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:961 userInfo:0];
      ((void (**)(void, uint64_t, void *))v8)[2](v8, 1, v49);
    }
    _Block_object_dispose(&v86, 8);
  }

  _Block_object_dispose(&v95, 8);
}

uint64_t __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_101(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) audioPreprocessor];
  uint64_t v2 = [*(id *)(a1 + 40) startStreamOption];
  id v3 = [v2 requestMHUUID];
  [v4 reportMetricsForSiriRequestWithUUID:v3];
}

void __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) startPendingOnStoppingStreams];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

void __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_107(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) startPendingOnStoppingStreamToCompletionDict];
  id v3 = [*(id *)(a1 + 40) name];
  id v10 = [v2 objectForKey:v3];

  if (v10)
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:961 userInfo:0];
    v10[2](v10, 0, v4);

    id v5 = [*(id *)(a1 + 32) startPendingOnStoppingStreamToCompletionDict];
    id v6 = [*(id *)(a1 + 40) name];
    [v5 removeObjectForKey:v6];
  }
  uint64_t v7 = [*(id *)(a1 + 32) startPendingOnStoppingStreams];
  [v7 removeObject:*(void *)(a1 + 40)];

  id v8 = [*(id *)(a1 + 32) startPendingOnStoppingStreams];
  int v9 = objc_msgSend(v8, "_cs_isHashTableEmpty");

  if (v9) {
    [*(id *)(a1 + 32) setStreamState:4];
  }
}

void __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_2_108(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) streams];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

void __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_112(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) streams];
  [v2 removeObject:*(void *)(a1 + 40)];

  id v3 = +[CSAudioStreamActivityMonitor sharedInstance];
  id v4 = [*(id *)(a1 + 32) streams];
  id v5 = [*(id *)(a1 + 32) streamHolders];
  [v3 notifyActiveStreamsChanged:v4 streamHolders:v5 streamId:*(void *)(*(void *)(a1 + 32) + 216)];

  id v6 = [*(id *)(a1 + 32) stopPendingStreams];
  [v6 addObject:*(void *)(a1 + 40)];

  if (*(void *)(a1 + 48))
  {
    id v8 = [*(id *)(a1 + 32) pendingStopCompletions];
    uint64_t v7 = (void *)MEMORY[0x1BA9E7570](*(void *)(a1 + 48));
    [v8 addObject:v7];
  }
}

void __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_2_113(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) streams];
  [v2 removeObject:*(void *)(a1 + 40)];

  id v5 = +[CSAudioStreamActivityMonitor sharedInstance];
  id v3 = [*(id *)(a1 + 32) streams];
  id v4 = [*(id *)(a1 + 32) streamHolders];
  [v5 notifyActiveStreamsChanged:v3 streamHolders:v4 streamId:*(void *)(*(void *)(a1 + 32) + 216)];
}

void __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_3_114(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "streams", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 8 * v6);
        if (v7 && [*(id *)(*((void *)&v16 + 1) + 8 * v6) isWeakStream])
        {
          id v8 = [*(id *)(a1 + 32) stopPendingStreams];
          [v8 addObject:v7];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  int v9 = [*(id *)(a1 + 32) streams];
  [v9 removeAllObjects];

  id v10 = +[CSAudioStreamActivityMonitor sharedInstance];
  uint64_t v11 = [*(id *)(a1 + 32) streams];
  id v12 = [*(id *)(a1 + 32) streamHolders];
  [v10 notifyActiveStreamsChanged:v11 streamHolders:v12 streamId:*(void *)(*(void *)(a1 + 32) + 216)];

  id v13 = [*(id *)(a1 + 32) stopPendingStreams];
  [v13 addObject:*(void *)(a1 + 40)];

  if (*(void *)(a1 + 48))
  {
    id v14 = [*(id *)(a1 + 32) pendingStopCompletions];
    unint64_t v15 = (void *)MEMORY[0x1BA9E7570](*(void *)(a1 + 48));
    [v14 addObject:v15];
  }
}

void __54__CSAudioProvider__stopAudioStream_option_completion___block_invoke_115(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = [*(id *)(a1 + 32) stopPendingStreams];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v19 + 1) + 8 * v6);
        if (v7 && [v7 isWeakStream]) {
          [*(id *)(a1 + 40) audioStreamProvider:*(void *)(a1 + 32) didStopStreamUnexpectedly:4];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v4);
  }

  id v8 = [*(id *)(a1 + 32) stopPendingStreams];
  [v8 removeAllObjects];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v9 = objc_msgSend(*(id *)(a1 + 32), "pendingStopCompletions", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * v13++) + 16))();
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v11);
  }

  id v14 = [*(id *)(a1 + 32) pendingStopCompletions];
  [v14 removeAllObjects];
}

- (void)stopAudioStream:(id)a3 option:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  recordQueue = self->_recordQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__CSAudioProvider_stopAudioStream_option_completion___block_invoke;
  v15[3] = &unk_1E61FFEA0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(recordQueue, v15);
}

uint64_t __53__CSAudioProvider_stopAudioStream_option_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopAudioStream:*(void *)(a1 + 40) option:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)_handleDidStopAudioStreamWithReason:(int64_t)a3
{
  v31[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(CSAudioProvider *)self UUID];
    id v8 = [(CSAudioProvider *)self _streamStateName:self->_streamState];
    *(_DWORD *)buf = 136315906;
    id v27 = "-[CSAudioProvider _handleDidStopAudioStreamWithReason:]";
    __int16 v28 = 2114;
    double v29 = v7;
    __int16 v30 = 1026;
    LODWORD(v31[0]) = a3;
    WORD2(v31[0]) = 2114;
    *(void *)((char *)v31 + 6) = v8;
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Received didStopRecording reason : %{public}d, streamState : %{public}@", buf, 0x26u);
  }
  [(CSAudioProvider *)self _forceReleaseAllListeningMicIndicatorLocks];
  [(CSAudioProvider *)self _forceReleaseAllRecordModeLocks];
  [(CSAudioProvider *)self _cancelAudioPacketWatchDog];
  [(CSAudioProvider *)self _clearDidStopRecordingDelegateWatchDog];
  [(CSAudioProvider *)self _preEpilogueAudioStream];
  unint64_t streamState = self->_streamState;
  if (streamState - 4 < 2)
  {
    id v12 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v27 = "-[CSAudioProvider _handleDidStopAudioStreamWithReason:]";
      _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Calling unexpected didStop for all weak streams", buf, 0xCu);
    }
    streamHandleQueue = self->_streamHandleQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__CSAudioProvider__handleDidStopAudioStreamWithReason___block_invoke;
    block[3] = &unk_1E6201288;
    void block[4] = self;
    uint64_t v11 = block;
    goto LABEL_10;
  }
  if (streamState == 2)
  {
    [(CSAudioProvider *)self _clearDidStartRecordingDelegateWatchDog];
    id v13 = self->_streamHandleQueue;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __55__CSAudioProvider__handleDidStopAudioStreamWithReason___block_invoke_99;
    v24[3] = &unk_1E6201288;
    v24[4] = self;
    dispatch_async_and_wait(v13, v24);
    id v14 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      long long v15 = v14;
      id v16 = [(CSAudioProvider *)self UUID];
      *(_DWORD *)buf = 136315394;
      id v27 = "-[CSAudioProvider _handleDidStopAudioStreamWithReason:]";
      __int16 v28 = 2114;
      double v29 = v16;
      _os_log_impl(&dword_1BA1A5000, v15, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Leaving dispatch group for recordingWillStartGroup", buf, 0x16u);
    }
    dispatch_group_leave((dispatch_group_t)self->_recordingWillStartGroup);
    id v17 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_FAULT))
    {
      long long v19 = v17;
      long long v20 = [(CSAudioProvider *)self UUID];
      long long v21 = [(CSAudioProvider *)self _streamStateName:self->_streamState];
      *(_DWORD *)buf = 136315650;
      id v27 = "-[CSAudioProvider _handleDidStopAudioStreamWithReason:]";
      __int16 v28 = 2114;
      double v29 = v20;
      __int16 v30 = 2114;
      v31[0] = v21;
      _os_log_fault_impl(&dword_1BA1A5000, v19, OS_LOG_TYPE_FAULT, "%s CSAudioProvider[%{public}@]:Received didStopRecording while %{public}@", buf, 0x20u);
    }
  }
  else if (streamState == 3)
  {
    streamHandleQueue = self->_streamHandleQueue;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __55__CSAudioProvider__handleDidStopAudioStreamWithReason___block_invoke_100;
    v23[3] = &unk_1E6201378;
    v23[4] = self;
    v23[5] = a3;
    uint64_t v11 = v23;
LABEL_10:
    dispatch_async_and_wait(streamHandleQueue, v11);
  }
  [(CSAudioProvider *)self setStreamState:1];
  [(CSAudioProvider *)self _postEpilogueAudioStream];
  id v18 = self->_streamHandleQueue;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __55__CSAudioProvider__handleDidStopAudioStreamWithReason___block_invoke_2;
  v22[3] = &unk_1E61FFE78;
  v22[4] = self;
  v22[5] = streamState;
  v22[6] = a3;
  dispatch_async_and_wait(v18, v22);
}

void __55__CSAudioProvider__handleDidStopAudioStreamWithReason___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = [*(id *)(a1 + 32) stopPendingStreams];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v19 + 1) + 8 * v6);
        if (v7 && [*(id *)(*((void *)&v19 + 1) + 8 * v6) isWeakStream]) {
          [v7 audioStreamProvider:*(void *)(a1 + 32) didStopStreamUnexpectedly:4];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v4);
  }

  id v8 = [*(id *)(a1 + 32) stopPendingStreams];
  [v8 removeAllObjects];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = objc_msgSend(*(id *)(a1 + 32), "pendingStopCompletions", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * v13++) + 16))();
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v11);
  }

  id v14 = [*(id *)(a1 + 32) pendingStopCompletions];
  [v14 removeAllObjects];
}

void __55__CSAudioProvider__handleDidStopAudioStreamWithReason___block_invoke_99(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) startPendingStreams];
  [v2 removeAllObjects];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "pendingStartCompletions", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:956 userInfo:0];
        (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  uint64_t v10 = [*(id *)(a1 + 32) pendingStartCompletions];
  [v10 removeAllObjects];
}

void __55__CSAudioProvider__handleDidStopAudioStreamWithReason___block_invoke_100(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "streams", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v6++) audioStreamProvider:*(void *)(a1 + 32) didStopStreamUnexpectedly:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  uint64_t v7 = [*(id *)(a1 + 32) streams];
  [v7 removeAllObjects];

  uint64_t v8 = +[CSAudioStreamActivityMonitor sharedInstance];
  id v9 = [*(id *)(a1 + 32) streams];
  uint64_t v10 = [*(id *)(a1 + 32) streamHolders];
  [v8 notifyActiveStreamsChanged:v9 streamHolders:v10 streamId:*(void *)(*(void *)(a1 + 32) + 216)];
}

void __55__CSAudioProvider__handleDidStopAudioStreamWithReason___block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _shouldHandleStartPendingOnStopping:*(void *)(a1 + 40) withStopReason:*(void *)(a1 + 48)])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v2 = [*(id *)(a1 + 32) startPendingOnStoppingStreams];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v27;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v27 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v26 + 1) + 8 * v6);
          if (v7)
          {
            uint64_t v8 = *(void *)(a1 + 32);
            id v9 = *(NSObject **)(v8 + 24);
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __55__CSAudioProvider__handleDidStopAudioStreamWithReason___block_invoke_3;
            block[3] = &unk_1E6201030;
            void block[4] = v8;
            void block[5] = v7;
            dispatch_async(v9, block);
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v4);
    }

    uint64_t v10 = [*(id *)(a1 + 32) startPendingOnStoppingStreams];
    [v10 removeAllObjects];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v11 = objc_msgSend(*(id *)(a1 + 32), "startPendingOnStoppingStreamToCompletionDict", 0);
    long long v12 = [v11 objectEnumerator];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * v16);
          long long v18 = [*(id *)(a1 + 32) pendingStartCompletions];
          long long v19 = (void *)MEMORY[0x1BA9E7570](v17);
          [v18 addObject:v19];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v30 count:16];
      }
      while (v14);
    }

    long long v20 = [*(id *)(a1 + 32) startPendingOnStoppingStreamToCompletionDict];
    [v20 removeAllObjects];
  }
}

void __55__CSAudioProvider__handleDidStopAudioStreamWithReason___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  id v3 = [v2 startStreamOption];
  [v1 _startAudioStream:v2 option:v3 completion:0];
}

- (void)_postEpilogueAudioStream
{
  streamHandleQueue = self->_streamHandleQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CSAudioProvider__postEpilogueAudioStream__block_invoke;
  block[3] = &unk_1E6201288;
  void block[4] = self;
  dispatch_async_and_wait(streamHandleQueue, block);
  [(CSAudioProvider *)self _releaseRecordingTransactionIfNeeded];
}

void __43__CSAudioProvider__postEpilogueAudioStream__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 168);
  if (v2) {
    id v2 = (void *)[v2 reset];
  }
  id v3 = (void *)MEMORY[0x1BA9E7330](v2);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 192);
  *(void *)(v4 + 192) = 0;
}

- (void)_preEpilogueAudioStream
{
  streamHandleQueue = self->_streamHandleQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CSAudioProvider__preEpilogueAudioStream__block_invoke;
  block[3] = &unk_1E6201288;
  void block[4] = self;
  dispatch_async(streamHandleQueue, block);
}

void __42__CSAudioProvider__preEpilogueAudioStream__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) audioPreprocessor];
  [v1 flush];
}

- (void)_handleDidStartAudioStreamWithResult:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (!v4)
  {
    [(CSAudioProvider *)self _cancelAudioPacketWatchDog];
    [(CSAudioProvider *)self _forceReleaseAllListeningMicIndicatorLocks];
    [(CSAudioProvider *)self _forceReleaseAllRecordModeLocks];
  }
  [(CSAudioProvider *)self _clearDidStartRecordingDelegateWatchDog];
  if (self->_streamState == 2)
  {
    streamHandleQueue = self->_streamHandleQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__CSAudioProvider__handleDidStartAudioStreamWithResult_error___block_invoke;
    block[3] = &unk_1E62006B0;
    BOOL v19 = v4;
    void block[4] = self;
    id v18 = v6;
    dispatch_async_and_wait(streamHandleQueue, block);
    if (v4)
    {
      [(CSAudioProvider *)self setStreamState:3];
    }
    else
    {
      [(CSAudioProvider *)self setStreamState:1];
      long long v12 = self->_streamHandleQueue;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __62__CSAudioProvider__handleDidStartAudioStreamWithResult_error___block_invoke_2;
      v16[3] = &unk_1E6201288;
      v16[4] = self;
      dispatch_async(v12, v16);
      [(CSAudioProvider *)self _releaseRecordingTransactionIfNeeded];
    }
    uint64_t v13 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = v13;
      uint64_t v15 = [(CSAudioProvider *)self UUID];
      *(_DWORD *)buf = 136315394;
      long long v21 = "-[CSAudioProvider _handleDidStartAudioStreamWithResult:error:]";
      __int16 v22 = 2114;
      long long v23 = v15;
      _os_log_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Leaving dispatch group for recordingWillStartGroup", buf, 0x16u);
    }
    dispatch_group_leave((dispatch_group_t)self->_recordingWillStartGroup);
  }
  else
  {
    uint64_t v8 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_FAULT))
    {
      id v9 = v8;
      uint64_t v10 = [(CSAudioProvider *)self UUID];
      long long v11 = [(CSAudioProvider *)self _streamStateName:self->_streamState];
      *(_DWORD *)buf = 136315650;
      long long v21 = "-[CSAudioProvider _handleDidStartAudioStreamWithResult:error:]";
      __int16 v22 = 2114;
      long long v23 = v10;
      __int16 v24 = 2114;
      uint64_t v25 = v11;
      _os_log_fault_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_FAULT, "%s CSAudioProvider[%{public}@]:Received didStartRecording while %{public}@", buf, 0x20u);
    }
  }
}

void __62__CSAudioProvider__handleDidStartAudioStreamWithResult_error___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v2 = [*(id *)(a1 + 32) startPendingStreams];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v24 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v8 = [*(id *)(a1 + 32) streams];
          [v8 addObject:v7];
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v4);
    }

    id v9 = +[CSAudioStreamActivityMonitor sharedInstance];
    uint64_t v10 = [*(id *)(a1 + 32) streams];
    long long v11 = [*(id *)(a1 + 32) streamHolders];
    [v9 notifyActiveStreamsChanged:v10 streamHolders:v11 streamId:*(void *)(*(void *)(a1 + 32) + 216)];
  }
  long long v12 = [*(id *)(a1 + 32) startPendingStreams];
  [v12 removeAllObjects];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "pendingStartCompletions", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v19 + 1) + 8 * j) + 16))();
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v15);
  }

  id v18 = [*(id *)(a1 + 32) pendingStartCompletions];
  [v18 removeAllObjects];
}

void __62__CSAudioProvider__handleDidStartAudioStreamWithResult_error___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1BA9E7330]();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 192);
  *(void *)(v3 + 192) = 0;
}

- (void)_resetCircularBufferStartTime
{
  [(CSAudioProvider *)self setCircularBufferStartSampleCount:0];
  [(CSAudioProvider *)self setCircularBufferStartHostTime:0];
}

- (void)_switchToListeningMode
{
  uint64_t v3 = [(CSAudioProvider *)self audioRecorder];
  uint64_t v4 = 0;
  objc_msgSend(v3, "setRecordMode:streamHandleId:error:", 2, -[CSAudioProvider audioStreamHandleId](self, "audioStreamHandleId"), &v4);

  [(CSAudioProvider *)self _setListeningMicIndicatorPropertyIfNeeded];
}

- (void)_switchToRecordingMode
{
  uint64_t v3 = [(CSAudioProvider *)self audioRecorder];
  uint64_t v4 = 0;
  objc_msgSend(v3, "setRecordMode:streamHandleId:error:", 1, -[CSAudioProvider audioStreamHandleId](self, "audioStreamHandleId"), &v4);
}

- (void)_forceReleaseAllRecordModeLocks
{
  uint64_t v3 = [(CSAudioProvider *)self recordModeLocks];
  [v3 removeAllObjects];

  [(CSAudioProvider *)self _switchToListeningMode];
}

- (void)_forceReleaseRecordModeLockFrom:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v27 = "-[CSAudioProvider _forceReleaseRecordModeLockFrom:]";
    __int16 v28 = 1024;
    LODWORD(v29) = a3;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Releasing recordModeLock from : %d", buf, 0x12u);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = [(CSAudioProvider *)self recordModeLocks];
  uint64_t v7 = [v6 allKeys];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v23;
    *(void *)&long long v9 = 136315394;
    long long v21 = v9;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * v12);
        uint64_t v14 = [(CSAudioProvider *)self recordModeLocks];
        uint64_t v15 = [v14 objectForKey:v13];
        uint64_t v16 = [v15 clientIdentity];

        if (v16 == a3)
        {
          uint64_t v17 = CSLogCategoryAudio;
          if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v21;
            long long v27 = "-[CSAudioProvider _forceReleaseRecordModeLockFrom:]";
            __int16 v28 = 2112;
            uint64_t v29 = v13;
            _os_log_impl(&dword_1BA1A5000, v17, OS_LOG_TYPE_DEFAULT, "%s Releasing recordModeLock lock %@", buf, 0x16u);
          }
          id v18 = [(CSAudioProvider *)self recordModeLocks];
          [v18 removeObjectForKey:v13];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v10);
  }

  long long v19 = [(CSAudioProvider *)self recordModeLocks];
  uint64_t v20 = [v19 count];

  if (!v20) {
    [(CSAudioProvider *)self _switchToListeningMode];
  }
}

- (void)_releaseRecordModeLock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    uint64_t v12 = "-[CSAudioProvider _releaseRecordModeLock:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Releasing recordModeLock lock UUID = %@", (uint8_t *)&v11, 0x16u);
  }
  if (v4)
  {
    id v6 = [(CSAudioProvider *)self recordModeLocks];
    uint64_t v7 = [v6 objectForKey:v4];

    if (v7)
    {
      uint64_t v8 = [(CSAudioProvider *)self recordModeLocks];
      [v8 removeObjectForKey:v4];
    }
  }
  long long v9 = [(CSAudioProvider *)self recordModeLocks];
  uint64_t v10 = [v9 count];

  if (!v10) {
    [(CSAudioProvider *)self _switchToListeningMode];
  }
}

- (id)_acquireRecordModeLockFrom:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    int v11 = "-[CSAudioProvider _acquireRecordModeLockFrom:]";
    __int16 v12 = 1024;
    int v13 = a3;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Acquiring recordModeLock from : %d", (uint8_t *)&v10, 0x12u);
  }
  id v6 = [(CSAudioProviderRequestLock *)[CSAudioProviderRecordModeLock alloc] initWithClientIdentity:a3];
  uint64_t v7 = [(CSAudioProvider *)self recordModeLocks];
  uint64_t v8 = [(CSAudioProviderRequestLock *)v6 UUIDString];
  [v7 setObject:v6 forKey:v8];

  [(CSAudioProvider *)self _switchToRecordingMode];
  return v6;
}

- (BOOL)_clearListeningMicIndicatorProperty
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[CSAudioProvider _clearListeningMicIndicatorProperty]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Clearing listening mic indicator lock property", (uint8_t *)&v7, 0xCu);
  }
  id v4 = [(CSAudioProvider *)self audioRecorder];
  char v5 = [v4 clearListeningMicIndicatorProperty];

  return v5;
}

- (BOOL)_setListeningMicIndicatorProperty
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[CSAudioProvider _setListeningMicIndicatorProperty]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Setting listening mic indicator lock property", (uint8_t *)&v7, 0xCu);
  }
  id v4 = [(CSAudioProvider *)self audioRecorder];
  char v5 = [v4 setListeningMicIndicatorProperty];

  return v5;
}

- (void)_clearListeningMicIndicatorPropertyIfNeeded
{
  uint64_t v3 = [(CSAudioProvider *)self listeningMicIndicatorLocks];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    [(CSAudioProvider *)self _clearListeningMicIndicatorProperty];
  }
}

- (void)_setListeningMicIndicatorPropertyIfNeeded
{
  uint64_t v3 = [(CSAudioProvider *)self listeningMicIndicatorLocks];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    [(CSAudioProvider *)self _setListeningMicIndicatorProperty];
  }
}

- (void)_forceReleaseAllListeningMicIndicatorLocks
{
  uint64_t v3 = [(CSAudioProvider *)self listeningMicIndicatorLocks];
  [v3 removeAllObjects];

  [(CSAudioProvider *)self _clearListeningMicIndicatorPropertyIfNeeded];
}

- (void)_forceReleaseListeningMicIndicatorLockFrom:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  char v5 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v25 = "-[CSAudioProvider _forceReleaseListeningMicIndicatorLockFrom:]";
    __int16 v26 = 1024;
    LODWORD(v27) = a3;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Releasing listening mic indicator lock from : %d", buf, 0x12u);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [(CSAudioProvider *)self listeningMicIndicatorLocks];
  int v7 = [v6 allKeys];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v21;
    *(void *)&long long v9 = 136315394;
    long long v19 = v9;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
        uint64_t v14 = [(CSAudioProvider *)self listeningMicIndicatorLocks];
        uint64_t v15 = [v14 objectForKey:v13];
        uint64_t v16 = [v15 clientIdentity];

        if (v16 == a3)
        {
          uint64_t v17 = CSLogCategoryAudio;
          if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v19;
            long long v25 = "-[CSAudioProvider _forceReleaseListeningMicIndicatorLockFrom:]";
            __int16 v26 = 2112;
            uint64_t v27 = v13;
            _os_log_impl(&dword_1BA1A5000, v17, OS_LOG_TYPE_DEFAULT, "%s Releasing listening mic indicator lock %@", buf, 0x16u);
          }
          id v18 = [(CSAudioProvider *)self listeningMicIndicatorLocks];
          [v18 removeObjectForKey:v13];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v10);
  }

  [(CSAudioProvider *)self _clearListeningMicIndicatorPropertyIfNeeded];
}

- (void)_releaseListeningMicIndicatorLockFrom:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v5 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSAudioProvider _releaseListeningMicIndicatorLockFrom:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a3;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Releasing listening mic indicator lock from = %d", buf, 0x12u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__7237;
  uint64_t v11 = __Block_byref_object_dispose__7238;
  id v12 = 0;
  id v6 = [(CSAudioProvider *)self listeningMicIndicatorLocks];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__CSAudioProvider__releaseListeningMicIndicatorLockFrom___block_invoke;
  v8[3] = &unk_1E61FFE50;
  v8[4] = buf;
  void v8[5] = a3;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];

  if (*(void *)(*(void *)&buf[8] + 40))
  {
    int v7 = [(CSAudioProvider *)self listeningMicIndicatorLocks];
    [v7 removeObjectForKey:*(void *)(*(void *)&buf[8] + 40)];
  }
  [(CSAudioProvider *)self _clearListeningMicIndicatorPropertyIfNeeded];
  _Block_object_dispose(buf, 8);
}

void __57__CSAudioProvider__releaseListeningMicIndicatorLockFrom___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 clientIdentity] == *(void *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_releaseListeningMicIndicatorLock:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[CSAudioProvider _releaseListeningMicIndicatorLock:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Releasing listening mic indicator lock UUID = %@", (uint8_t *)&v9, 0x16u);
  }
  if (v4)
  {
    id v6 = [(CSAudioProvider *)self listeningMicIndicatorLocks];
    int v7 = [v6 objectForKey:v4];

    if (v7)
    {
      id v8 = [(CSAudioProvider *)self listeningMicIndicatorLocks];
      [v8 removeObjectForKey:v4];
    }
  }
  [(CSAudioProvider *)self _clearListeningMicIndicatorPropertyIfNeeded];
}

- (id)_acquireListeningMicIndicatorLockFrom:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  char v5 = [(CSAudioProviderRequestLock *)[CSAudioProviderListeningMicIndicatorLock alloc] initWithClientIdentity:a3];
  id v6 = [(CSAudioProvider *)self listeningMicIndicatorLocks];
  int v7 = [(CSAudioProviderRequestLock *)v5 UUIDString];
  [v6 setObject:v5 forKey:v7];

  id v8 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = v8;
    uint64_t v10 = [(CSAudioProviderRequestLock *)v5 UUIDString];
    int v12 = 136315650;
    uint64_t v13 = "-[CSAudioProvider _acquireListeningMicIndicatorLockFrom:]";
    __int16 v14 = 1024;
    int v15 = v3;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Acquiring listening mic indicator lock from : %d %@", (uint8_t *)&v12, 0x1Cu);
  }
  return v5;
}

- (void)_startAudioStream:(id)a3 option:(id)a4 completion:(id)a5
{
  uint64_t v181 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_recordQueue);
  v169[0] = MEMORY[0x1E4F143A8];
  v169[1] = 3221225472;
  v169[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke;
  v169[3] = &unk_1E61FFDB0;
  id v11 = v8;
  id v170 = v11;
  v171 = self;
  id v12 = v10;
  id v172 = v12;
  uint64_t v13 = (void (**)(void, void, void))MEMORY[0x1BA9E7570](v169);
  if (self->_streamState)
  {
    if (([v9 disableBoostForDoAP] & 1) != 0
      || [(CSAudioProvider *)self audioStreamType] != 1)
    {
      uint64_t v17 = 0;
    }
    else
    {
      __int16 v14 = [(CSAudioProvider *)self audioRecorder];
      int v15 = [(CSAudioProvider *)self recordDeviceIndicator];
      __int16 v16 = [v14 recordRouteWithRecordDeviceIndicator:v15];

      uint64_t v17 = [v16 isEqualToString:*MEMORY[0x1E4F15300]];
    }
    [v11 setNeedsBoost12dB:v17];
    streamHandleQueue = self->_streamHandleQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_80;
    block[3] = &unk_1E61FFE00;
    id v19 = v11;
    id v167 = v19;
    char v168 = v17;
    dispatch_async(streamHandleQueue, block);
    if (self->_streamState == 4)
    {
      [(CSAudioProvider *)self setStreamState:5];
      long long v20 = self->_streamHandleQueue;
      v163[0] = MEMORY[0x1E4F143A8];
      v163[1] = 3221225472;
      v163[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_2;
      v163[3] = &unk_1E61FFFB8;
      v163[4] = self;
      id v164 = v19;
      id v165 = v12;
      dispatch_async_and_wait(v20, v163);

      long long v21 = v164;
LABEL_95:

LABEL_96:
      long long v23 = v167;
      goto LABEL_97;
    }
    if (self->_audioSystemRecovering)
    {
      long long v24 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        id v79 = v24;
        v80 = [(CSAudioProvider *)self UUID];
        *(_DWORD *)buf = 136315394;
        v174 = "-[CSAudioProvider _startAudioStream:option:completion:]";
        __int16 v175 = 2114;
        v176 = v80;
        _os_log_error_impl(&dword_1BA1A5000, v79, OS_LOG_TYPE_ERROR, "%s CSAudioProvider[%{public}@]:Cannot startAudioStream, audio system is recovering", buf, 0x16u);
      }
      long long v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:957 userInfo:0];
      ((void (**)(void, void, void *))v13)[2](v13, 0, v25);

      goto LABEL_96;
    }
    if (([v9 requestHistoricalAudioDataWithHostTime] & 1) != 0
      || [v9 requestHistoricalAudioDataSampleCount])
    {
      __int16 v26 = [(CSAudioProvider *)self historicalBufferRequestStreams];
      char v27 = [v26 containsObject:v19];

      if ((v27 & 1) == 0)
      {
        __int16 v28 = [(CSAudioProvider *)self historicalBufferRequestStreams];
        [v28 addObject:v19];
      }
    }
    uint64_t v29 = self->_streamHandleQueue;
    v161[0] = MEMORY[0x1E4F143A8];
    v161[1] = 3221225472;
    v161[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_81;
    v161[3] = &unk_1E6201030;
    v161[4] = self;
    id v30 = v19;
    id v162 = v30;
    dispatch_async_and_wait(v29, v161);
    unint64_t streamState = self->_streamState;
    if (streamState == 1)
    {
      uint64_t v37 = [v30 streamRequest];
      int v38 = [v37 requestListeningMicIndicatorLock];

      if (v38)
      {
        id v39 = [v30 streamRequest];
        id v40 = -[CSAudioProvider _acquireListeningMicIndicatorLockFrom:](self, "_acquireListeningMicIndicatorLockFrom:", [v39 clientIdentity]);
      }
      id v41 = [v30 streamRequest];
      int v42 = [v41 requestRecordModeLock];

      if (v42)
      {
        long long v43 = [v30 streamRequest];
        id v44 = -[CSAudioProvider _acquireRecordModeLockFrom:](self, "_acquireRecordModeLockFrom:", [v43 clientIdentity]);
      }
      [(CSAudioProvider *)self _setListeningMicIndicatorPropertyIfNeeded];
      int64_t v45 = [(CSAudioRecordContext *)self->_lastAudioRecorderContext type];
      BOOL v124 = v45 == 6;
      if (v45 == 6 && !+[CSUtils isLocalVoiceTriggerAvailable])
      {
        audioRecorder = self->_audioRecorder;
        id v82 = [(CSAudioProvider *)self recordDeviceIndicator];
        id v46 = [(CSAudioRecorder *)audioRecorder fetchGibraltarVoiceTriggerInfoWithRecordDeviceIndicator:v82];
      }
      else
      {
        id v46 = 0;
      }
      [(CSAudioProvider *)self _holdRecordingTransactionIfNeeded];
      unsigned int v83 = +[CSConfig inputRecordingNumberOfChannels];
      if (self->_audioStreamType == 1)
      {
        if (CSIsHorseman_onceToken != -1) {
          dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
        }
        if (CSIsHorseman_isHorseman) {
          unsigned int v83 = 1;
        }
      }
      id v84 = [(CSAudioProvider *)self audioRecorder];
      v85 = objc_msgSend(v84, "getPlaybackRouteForStreamID:", -[CSAudioProvider audioStreamHandleId](self, "audioStreamHandleId"));

      uint64_t v86 = self->_streamHandleQueue;
      v149[0] = MEMORY[0x1E4F143A8];
      v149[1] = 3221225472;
      v149[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_2_85;
      v149[3] = &unk_1E61FFE28;
      v149[4] = self;
      unsigned int v153 = v83;
      id v126 = v85;
      id v150 = v126;
      id v122 = v30;
      id v151 = v122;
      BOOL v154 = v124;
      id v125 = v46;
      id v152 = v125;
      dispatch_async_and_wait(v86, v149);
      unint64_t v87 = [v9 estimatedStartHostTime];
      if (v87) {
        unint64_t v87 = objc_msgSend(v9, "estimatedStartHostTime", v122);
      }
      self->_unint64_t estimatedStartHostTime = v87;
      if (objc_msgSend(v9, "allowRecordWhileBeep", v122) && objc_msgSend(v9, "startAlertBehavior") == 2)
      {
        uint64_t v88 = (void *)CSLogCategoryAudio;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
        {
          char v89 = v88;
          v90 = [(CSAudioProvider *)self UUID];
          *(_DWORD *)buf = 136315394;
          v174 = "-[CSAudioProvider _startAudioStream:option:completion:]";
          __int16 v175 = 2114;
          v176 = v90;
          _os_log_impl(&dword_1BA1A5000, v89, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Skipping start alert to start recording", buf, 0x16u);
        }
        [v9 setStartAlertBehavior:0];
        int v91 = 1;
      }
      else
      {
        int v91 = 0;
      }
      v92 = [(CSAudioProvider *)self audioRecorder];
      id v93 = [(CSAudioProvider *)self recordDeviceIndicator];
      id v148 = 0;
      int v94 = [v92 startAudioStreamWithOption:v9 recordDeviceIndicator:v93 error:&v148];
      id v95 = v148;

      if (v94)
      {
        if (v91)
        {
          v96 = [(CSAudioProvider *)self audioRecorder];
          [v96 playAlertSoundForType:1 overrideMode:2];
        }
        if (!+[CSUtils isExclaveHardware]
          || (unint64_t v97 = [(CSAudioProvider *)self audioStreamId], v97 != *MEMORY[0x1E4F152C8]))
        {
          [(CSAudioProvider *)self _scheduleAudioPacketWatchDog];
        }
        [(CSAudioProvider *)self _scheduleDidStartRecordingDelegateWatchDog];
        [(CSAudioProvider *)self setStreamState:2];
        [(CSAudioProvider *)self _resetCircularBufferStartTime];
        char v98 = self->_streamHandleQueue;
        v146[0] = MEMORY[0x1E4F143A8];
        v146[1] = 3221225472;
        v146[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_87;
        v146[3] = &unk_1E6201030;
        v146[4] = self;
        id v147 = v9;
        dispatch_async_and_wait(v98, v146);
        v99 = (void *)CSLogCategoryAudio;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
        {
          id v100 = v99;
          v101 = [(CSAudioProvider *)self UUID];
          *(_DWORD *)buf = 136315394;
          v174 = "-[CSAudioProvider _startAudioStream:option:completion:]";
          __int16 v175 = 2114;
          v176 = v101;
          _os_log_impl(&dword_1BA1A5000, v100, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Entering dispatch group for recordingWillStartGroup", buf, 0x16u);
        }
        dispatch_group_enter((dispatch_group_t)self->_recordingWillStartGroup);
        id v102 = self->_streamHandleQueue;
        v143[0] = MEMORY[0x1E4F143A8];
        v143[1] = 3221225472;
        v143[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_88;
        v143[3] = &unk_1E61FFFB8;
        v143[4] = self;
        id v144 = v123;
        id v145 = v12;
        dispatch_async_and_wait(v102, v143);
      }
      else
      {
        ((void (**)(void, void, id))v13)[2](v13, 0, v95);
      }

      long long v36 = v125;
      goto LABEL_93;
    }
    if (streamState != 3)
    {
      if (streamState != 2)
      {
        int v55 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:955 userInfo:0];
        ((void (**)(void, void, void *))v13)[2](v13, 0, v55);

LABEL_94:
        long long v21 = v162;
        goto LABEL_95;
      }
      if ([(CSAudioProvider *)self _didPlayStartAlertSoundForSiri:v9 audioStream:v30])
      {
        uint64_t v32 = self->_streamHandleQueue;
        v158[0] = MEMORY[0x1E4F143A8];
        v158[1] = 3221225472;
        v158[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_2_82;
        v158[3] = &unk_1E61FFFB8;
        v158[4] = self;
        id v159 = v30;
        id v160 = v12;
        dispatch_async_and_wait(v32, v158);
        self->_waitingForAlertFinish = 1;
        long long v33 = (void *)CSLogCategoryAudio;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
        {
          id v34 = v33;
          long long v35 = [(CSAudioProvider *)self UUID];
          *(_DWORD *)buf = 136315394;
          v174 = "-[CSAudioProvider _startAudioStream:option:completion:]";
          __int16 v175 = 2114;
          v176 = v35;
          _os_log_impl(&dword_1BA1A5000, v34, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Entering dispatch group for recordingWillStartGroup", buf, 0x16u);
        }
        dispatch_group_enter((dispatch_group_t)self->_recordingWillStartGroup);
        [(CSAudioProvider *)self _scheduleAlertFinishTimeout:0.400000006];

        long long v36 = v159;
      }
      else
      {
        v70 = [v30 streamRequest];
        int v71 = [v70 requestListeningMicIndicatorLock];

        if (v71)
        {
          id v72 = [v30 streamRequest];
          id v73 = -[CSAudioProvider _acquireListeningMicIndicatorLockFrom:](self, "_acquireListeningMicIndicatorLockFrom:", [v72 clientIdentity]);
        }
        id v74 = [v30 streamRequest];
        int v75 = [v74 requestRecordModeLock];

        if (v75)
        {
          id v76 = [v30 streamRequest];
          id v77 = -[CSAudioProvider _acquireRecordModeLockFrom:](self, "_acquireRecordModeLockFrom:", [v76 clientIdentity]);
        }
        [(CSAudioProvider *)self _setListeningMicIndicatorPropertyIfNeeded];
        if ([(CSAudioProvider *)self circularBufferStartHostTime])
        {
          if ([v9 requestHistoricalAudioDataWithHostTime]) {
            uint64_t v78 = [v9 startRecordingHostTime];
          }
          else {
            uint64_t v78 = mach_absolute_time();
          }
          uint64_t v108 = v78;
          if (v78 >= [(CSAudioProvider *)self circularBufferStartHostTime])
          {
            unint64_t v113 = [(CSAudioProvider *)self circularBufferStartHostTime];
            unint64_t v114 = [(CSAudioProvider *)self circularBufferStartSampleCount];
            +[CSConfig inputRecordingSampleRate];
            unint64_t v115 = +[CSFTimeUtils sampleCountFromHostTime:anchorHostTime:anchorSampleCount:sampleRate:](CSFTimeUtils, "sampleCountFromHostTime:anchorHostTime:anchorSampleCount:sampleRate:", v108, v113, v114);
            [v30 updateAudioStreamStartTimeInSampleCount:v115];
            [v30 setScheduledFutureSample:1];
            v116 = (void *)CSLogCategoryAudio;
            if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
            {
              v117 = v116;
              v118 = [(CSAudioProvider *)self UUID];
              *(_DWORD *)buf = 136315906;
              v174 = "-[CSAudioProvider _startAudioStream:option:completion:]";
              __int16 v175 = 2114;
              v176 = v118;
              __int16 v177 = 2050;
              uint64_t v178 = v108;
              __int16 v179 = 2050;
              unint64_t v180 = v115;
              _os_log_impl(&dword_1BA1A5000, v117, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Requested startHostTime = %{public}llu, _clientStartSampleCount = %{public}tu", buf, 0x2Au);
            }
          }
          else
          {
            __int16 v109 = (void *)CSLogCategoryAudio;
            if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
            {
              v110 = v109;
              uint64_t v111 = [(CSAudioProvider *)self UUID];
              v112 = [v30 name];
              *(_DWORD *)buf = 136315650;
              v174 = "-[CSAudioProvider _startAudioStream:option:completion:]";
              __int16 v175 = 2114;
              v176 = v111;
              __int16 v177 = 2114;
              uint64_t v178 = (uint64_t)v112;
              _os_log_impl(&dword_1BA1A5000, v110, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:%{public}@ is requesting earlier audio than asked, we can't deliver earlier audio", buf, 0x20u);
            }
          }
        }
        v119 = self->_streamHandleQueue;
        v155[0] = MEMORY[0x1E4F143A8];
        v155[1] = 3221225472;
        v155[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_84;
        v155[3] = &unk_1E61FFFB8;
        v155[4] = self;
        id v156 = v30;
        id v157 = v12;
        dispatch_async_and_wait(v119, v155);

        long long v36 = v156;
      }
LABEL_93:

      goto LABEL_94;
    }
    BOOL v47 = [(CSAudioProvider *)self _didPlayStartAlertSoundForSiri:v9 audioStream:v30];
    long long v48 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      long long v49 = v48;
      long long v50 = [(CSAudioProvider *)self UUID];
      *(_DWORD *)buf = 136315650;
      v174 = "-[CSAudioProvider _startAudioStream:option:completion:]";
      __int16 v175 = 2114;
      v176 = v50;
      __int16 v177 = 1024;
      LODWORD(v178) = v47;
      _os_log_impl(&dword_1BA1A5000, v49, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:shouldWaitForAlertFinish:%u", buf, 0x1Cu);
    }
    if (v47)
    {
      int v51 = self->_streamHandleQueue;
      v140[0] = MEMORY[0x1E4F143A8];
      v140[1] = 3221225472;
      v140[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_89;
      v140[3] = &unk_1E61FFFB8;
      v140[4] = self;
      id v141 = v30;
      v142 = v13;
      dispatch_async_and_wait(v51, v140);
      self->_waitingForAlertFinish = 1;
      id v52 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v53 = v52;
        long long v54 = [(CSAudioProvider *)self UUID];
        *(_DWORD *)buf = 136315394;
        v174 = "-[CSAudioProvider _startAudioStream:option:completion:]";
        __int16 v175 = 2114;
        v176 = v54;
        _os_log_impl(&dword_1BA1A5000, v53, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Entering dispatch group for recordingWillStartGroup", buf, 0x16u);
      }
      dispatch_group_enter((dispatch_group_t)self->_recordingWillStartGroup);
      [(CSAudioProvider *)self _scheduleAlertFinishTimeout:0.400000006];

      long long v36 = v141;
      goto LABEL_93;
    }
    id v59 = [v30 streamRequest];
    int v60 = [v59 requestListeningMicIndicatorLock];

    if (v60)
    {
      __int16 v61 = [v30 streamRequest];
      id v62 = -[CSAudioProvider _acquireListeningMicIndicatorLockFrom:](self, "_acquireListeningMicIndicatorLockFrom:", [v61 clientIdentity]);
    }
    __int16 v63 = [v30 streamRequest];
    int v64 = [v63 requestRecordModeLock];

    if (v64)
    {
      int v65 = [v30 streamRequest];
      id v66 = -[CSAudioProvider _acquireRecordModeLockFrom:](self, "_acquireRecordModeLockFrom:", [v65 clientIdentity]);
    }
    [(CSAudioProvider *)self _setListeningMicIndicatorPropertyIfNeeded];
    if (+[CSUtils isExclaveHardware]
      && (unint64_t v67 = [(CSAudioProvider *)self audioStreamId], v67 == *MEMORY[0x1E4F152C8])
      && ([v30 streamRequest],
          v68 = objc_claimAutoreleasedReturnValue(),
          char v69 = [v68 requestExclaveAudio],
          v68,
          (v69 & 1) == 0))
    {
      int v120 = [v9 requestHistoricalAudioDataSampleCount];
      v121 = self->_streamHandleQueue;
      if (v120)
      {
        v137[0] = MEMORY[0x1E4F143A8];
        v137[1] = 3221225472;
        v137[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_90;
        v137[3] = &unk_1E6200E38;
        v137[4] = self;
        id v138 = v9;
        id v139 = v30;
        dispatch_async_and_wait(v121, v137);

        v104 = v138;
      }
      else
      {
        v135[0] = MEMORY[0x1E4F143A8];
        v135[1] = 3221225472;
        v135[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_91;
        v135[3] = &unk_1E6201030;
        v135[4] = self;
        id v136 = v30;
        dispatch_async_and_wait(v121, v135);
        v104 = v136;
      }
    }
    else
    {
      if ([v9 requestHistoricalAudioDataSampleCount])
      {
        objc_msgSend(v30, "updateAudioStreamStartTimeInSampleCount:", objc_msgSend(v9, "startRecordingSampleCount"));
LABEL_83:
        __int16 v105 = self->_streamHandleQueue;
        v128[0] = MEMORY[0x1E4F143A8];
        v128[1] = 3221225472;
        v128[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_2_93;
        v128[3] = &unk_1E6200E38;
        id v129 = v9;
        id v130 = v30;
        v131 = self;
        dispatch_async_and_wait(v105, v128);
        v13[2](v13, 1, 0);
        id v106 = CSLogCategoryAudio;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v174 = "-[CSAudioProvider _startAudioStream:option:completion:]";
          _os_log_impl(&dword_1BA1A5000, v106, OS_LOG_TYPE_DEFAULT, "%s Start deliver historical audio buffer immediately", buf, 0xCu);
        }
        __int16 v107 = self->_streamHandleQueue;
        v127[0] = MEMORY[0x1E4F143A8];
        v127[1] = 3221225472;
        v127[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_95;
        v127[3] = &unk_1E6201288;
        v127[4] = self;
        dispatch_async_and_wait(v107, v127);

        long long v36 = v129;
        goto LABEL_93;
      }
      v103 = self->_streamHandleQueue;
      v132[0] = MEMORY[0x1E4F143A8];
      v132[1] = 3221225472;
      v132[2] = __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_92;
      v132[3] = &unk_1E6201030;
      id v133 = v30;
      v134 = self;
      dispatch_async_and_wait(v103, v132);
      v104 = v133;
    }

    goto LABEL_83;
  }
  long long v22 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    id v56 = v22;
    v57 = [(CSAudioProvider *)self UUID];
    v58 = [(CSAudioProvider *)self _streamStateName:self->_streamState];
    *(_DWORD *)buf = 136315650;
    v174 = "-[CSAudioProvider _startAudioStream:option:completion:]";
    __int16 v175 = 2114;
    v176 = v57;
    __int16 v177 = 2114;
    uint64_t v178 = (uint64_t)v58;
    _os_log_error_impl(&dword_1BA1A5000, v56, OS_LOG_TYPE_ERROR, "%s CSAudioProvider[%{public}@]:Cannot handle start audio stream on : %{public}@", buf, 0x20u);
  }
  long long v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:952 userInfo:0];
  ((void (**)(void, void, void *))v13)[2](v13, 0, v23);
LABEL_97:
}

uint64_t __55__CSAudioProvider__startAudioStream_option_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v16 = v5;
  if ((a2 & 1) == 0)
  {
    id v6 = objc_msgSend(*(id *)(a1 + 32), "streamRequest", v5);
    int v7 = [v6 requestListeningMicIndicatorLock];

    if (v7)
    {
      id v8 = *(void **)(a1 + 40);
      id v9 = [*(id *)(a1 + 32) streamRequest];
      objc_msgSend(v8, "_releaseListeningMicIndicatorLockFrom:", objc_msgSend(v9, "clientIdentity"));
    }
    id v10 = [*(id *)(a1 + 32) streamRequest];
    int v11 = [v10 requestRecordModeLock];

    if (v11)
    {
      id v12 = *(void **)(a1 + 40);
      uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "streamRequest", v16);
      objc_msgSend(v12, "_forceReleaseRecordModeLockFrom:", objc_msgSend(v13, "clientIdentity"));
    }
  }
  uint64_t v14 = *(void *)(a1 + 48);
  if (v14) {
    (*(void (**)(uint64_t, uint64_t, id))(v14 + 16))(v14, a2, v16);
  }
  return MEMORY[0x1F4181820]();
}

void __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_80(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "tandemStreams", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setNeedsBoost12dB:*(unsigned __int8 *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) startPendingOnStoppingStreams];
  [v2 addObject:*(void *)(a1 + 40)];

  if (*(void *)(a1 + 48))
  {
    id v5 = [*(id *)(a1 + 32) startPendingOnStoppingStreamToCompletionDict];
    uint64_t v3 = (void *)MEMORY[0x1BA9E7570](*(void *)(a1 + 48));
    uint64_t v4 = [*(id *)(a1 + 40) name];
    [v5 setObject:v3 forKey:v4];
  }
}

void *__55__CSAudioProvider__startAudioStream_option_completion___block_invoke_81(uint64_t a1)
{
  uint64_t result = *(void **)(*(void *)(a1 + 32) + 168);
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    uint64_t v4 = [result sampleCount];
    return (void *)[v3 updateAudioStreamStartTimeInSampleCount:v4];
  }
  return result;
}

void __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_2_82(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) alertPlaybackFinishWaitingStreams];
  [v2 addObject:*(void *)(a1 + 40)];

  if (*(void *)(a1 + 48))
  {
    id v4 = [*(id *)(a1 + 32) alertPlaybackFinishWaitingCompletions];
    uint64_t v3 = (void *)MEMORY[0x1BA9E7570](*(void *)(a1 + 48));
    [v4 addObject:v3];
  }
}

void __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_84(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) startPendingStreams];
  [v2 addObject:*(void *)(a1 + 40)];

  if (*(void *)(a1 + 48))
  {
    id v4 = [*(id *)(a1 + 32) pendingStartCompletions];
    uint64_t v3 = (void *)MEMORY[0x1BA9E7570](*(void *)(a1 + 48));
    [v4 addObject:v3];
  }
}

void __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_2_85(uint64_t a1)
{
  [*(id *)(a1 + 32) _createCircularBufferIfNeededWithNumChannel:*(int *)(a1 + 64) playbackRoute:*(void *)(a1 + 40)];
  id v2 = [CSAudioPreprocessor alloc];
  +[CSConfig inputRecordingSampleRate];
  int v4 = v3;
  uint64_t v5 = *(unsigned int *)(a1 + 64);
  uint64_t v6 = [*(id *)(a1 + 48) streamRequest];
  long long v7 = [v6 recordContext];
  uint64_t v8 = [v7 type];
  LODWORD(v9) = v4;
  uint64_t v10 = [(CSAudioPreprocessor *)v2 initWithSampleRate:v5 withNumberOfChannels:v8 recordType:v9];
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(v11 + 192);
  *(void *)(v11 + 192) = v10;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 192), "setDelegate:");
  uint64_t v13 = *(void **)(a1 + 32);
  uint64_t v14 = (void *)v13[24];
  int v15 = [v13 audioRecorder];
  objc_msgSend(v15, "recordingSampleRateWithStreamHandleId:", objc_msgSend(*(id *)(a1 + 32), "audioStreamHandleId"));
  objc_msgSend(v14, "resetWithSampleRate:containsVoiceTrigger:voiceTriggerInfo:", *(unsigned __int8 *)(a1 + 68), *(void *)(a1 + 56));

  *(void *)(*(void *)(a1 + 32) + 272) = 0;
  *(void *)(*(void *)(a1 + 32) + 280) = 0;
}

void __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_87(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 168)
    && [*(id *)(a1 + 40) requestHistoricalAudioDataWithHostTime])
  {
    objc_msgSend(*(id *)(a1 + 32), "setCircularBufferStartHostTime:", objc_msgSend(*(id *)(a1 + 40), "startRecordingHostTime"));
    objc_msgSend(*(id *)(a1 + 32), "setCircularBufferStartSampleCount:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "sampleCount"));
    id v2 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = *(void **)(a1 + 32);
      int v4 = v2;
      uint64_t v5 = [v3 UUID];
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(v6 + 256);
      uint64_t v7 = *(void *)(v6 + 264);
      int v9 = 136315906;
      uint64_t v10 = "-[CSAudioProvider _startAudioStream:option:completion:]_block_invoke";
      __int16 v11 = 2114;
      uint64_t v12 = v5;
      __int16 v13 = 2050;
      uint64_t v14 = v8;
      __int16 v15 = 2050;
      uint64_t v16 = v7;
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Set circularBufferStartHostTime = %{public}llu, circularBufferStartSampleCount = %{public}lu", (uint8_t *)&v9, 0x2Au);
    }
  }
}

void __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_88(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) startPendingStreams];
  [v2 addObject:*(void *)(a1 + 40)];

  if (*(void *)(a1 + 48))
  {
    id v4 = [*(id *)(a1 + 32) pendingStartCompletions];
    int v3 = (void *)MEMORY[0x1BA9E7570](*(void *)(a1 + 48));
    [v4 addObject:v3];
  }
}

void __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_89(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) alertPlaybackFinishWaitingStreams];
  [v2 addObject:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) alertPlaybackFinishWaitingCompletions];
  int v3 = (void *)MEMORY[0x1BA9E7570](*(void *)(a1 + 48));
  [v4 addObject:v3];
}

uint64_t __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_90(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(a1 + 32) + 280) = [*(id *)(a1 + 40) startRecordingSampleCount];
  id v2 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 280);
    int v5 = 136315394;
    uint64_t v6 = "-[CSAudioProvider _startAudioStream:option:completion:]_block_invoke";
    __int16 v7 = 2048;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Set LastFetchedExclaveAudioSampleCount = %llu", (uint8_t *)&v5, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 48), "updateAudioStreamStartTimeInSampleCount:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "sampleCount"));
}

uint64_t __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_91(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(a1 + 32) + 280) = *(void *)(*(void *)(a1 + 32) + 272);
  id v2 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 280);
    int v5 = 136315394;
    uint64_t v6 = "-[CSAudioProvider _startAudioStream:option:completion:]_block_invoke";
    __int16 v7 = 2048;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Set LastFetchedExclaveAudioSampleCount = %llu", (uint8_t *)&v5, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 40), "updateAudioStreamStartTimeInSampleCount:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "sampleCount"));
}

uint64_t __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_92(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 168) sampleCount];
  return [v1 updateAudioStreamStartTimeInSampleCount:v2];
}

void __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_2_93(id *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (([a1[4] requestHistoricalAudioDataWithHostTime] & 1) == 0)
  {
    uint64_t v10 = [a1[5] streamRequest];
    __int16 v11 = [v10 recordContext];
    if ([v11 type] == 11 && !objc_msgSend(a1[4], "startRecordingSampleCount"))
    {
    }
    else
    {
      if (([a1[4] useOpportunisticZLL] & 1) == 0) {
        goto LABEL_12;
      }
      BOOL v13 = +[CSUtils supportOpportunisticZLL];

      if (!v13) {
        goto LABEL_14;
      }
    }
  }
  uint64_t v2 = [a1[4] startRecordingHostTime];
  unint64_t v3 = [*((id *)a1[6] + 37) sampleCountFromHostTime:v2];
  id v4 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = a1[6];
    uint64_t v6 = v4;
    __int16 v7 = [v5 UUID];
    int v18 = 136315906;
    id v19 = "-[CSAudioProvider _startAudioStream:option:completion:]_block_invoke_2";
    __int16 v20 = 2114;
    long long v21 = v7;
    __int16 v22 = 2050;
    uint64_t v23 = v2;
    __int16 v24 = 2050;
    unint64_t v25 = v3;
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Requested startHostTime = %{public}llu, _clientStartSampleCount = %{public}tu", (uint8_t *)&v18, 0x2Au);
  }
  if (v3 <= [*((id *)a1[6] + 21) sampleCount])
  {
    [a1[5] updateAudioStreamStartTimeInSampleCount:v3];
    goto LABEL_14;
  }
  uint64_t v8 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = a1[6];
    uint64_t v10 = v8;
    __int16 v11 = [v9 UUID];
    uint64_t v12 = [*((id *)a1[6] + 21) sampleCount];
    int v18 = 136315650;
    id v19 = "-[CSAudioProvider _startAudioStream:option:completion:]_block_invoke";
    __int16 v20 = 2114;
    long long v21 = v11;
    __int16 v22 = 2050;
    uint64_t v23 = v12;
    _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Failed to fetch historical audio since _clientStartSampleCount is newer than audioBuffer sample count(%{public}llu)", (uint8_t *)&v18, 0x20u);
LABEL_12:
  }
LABEL_14:
  uint64_t v14 = [a1[6] streams];
  [v14 addObject:a1[5]];

  __int16 v15 = +[CSAudioStreamActivityMonitor sharedInstance];
  uint64_t v16 = [a1[6] streams];
  uint64_t v17 = [a1[6] streamHolders];
  [v15 notifyActiveStreamsChanged:v16 streamHolders:v17 streamId:*((void *)a1[6] + 27)];
}

uint64_t __55__CSAudioProvider__startAudioStream_option_completion___block_invoke_95(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deliverHistoricalAudioToStreamsWithRemoteVAD:0];
}

- (void)prepareAudioStream:(id)a3 request:(id)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    BOOL v13 = [(CSAudioProvider *)self UUID];
    uint64_t v14 = [v8 name];
    __int16 v15 = [(CSAudioProvider *)self _streamStateName:self->_streamState];
    *(_DWORD *)buf = 136315906;
    unint64_t v25 = "-[CSAudioProvider prepareAudioStream:request:completion:]";
    __int16 v26 = 2114;
    char v27 = v13;
    __int16 v28 = 2114;
    uint64_t v29 = v14;
    __int16 v30 = 2114;
    uint64_t v31 = v15;
    _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:prepareAudioStream with stream : %{public}@ with stream state : %{public}@", buf, 0x2Au);
  }
  recordQueue = self->_recordQueue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __57__CSAudioProvider_prepareAudioStream_request_completion___block_invoke;
  v20[3] = &unk_1E61FFEA0;
  v20[4] = self;
  id v21 = v8;
  id v22 = v9;
  id v23 = v10;
  id v17 = v10;
  id v18 = v9;
  id v19 = v8;
  dispatch_async(recordQueue, v20);
}

void __57__CSAudioProvider_prepareAudioStream_request_completion___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__CSAudioProvider_prepareAudioStream_request_completion___block_invoke_2;
  v4[3] = &unk_1E62011D8;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 _prepareAudioStream:v2 request:v3 completion:v4];
}

uint64_t __57__CSAudioProvider_prepareAudioStream_request_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)prepareAudioStreamSync:(id)a3 request:(id)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = v10;
    uint64_t v12 = [(CSAudioProvider *)self UUID];
    BOOL v13 = [v8 name];
    uint64_t v14 = [(CSAudioProvider *)self _streamStateName:self->_streamState];
    __int16 v15 = [v9 description];
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "-[CSAudioProvider prepareAudioStreamSync:request:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v31 = v13;
    *(_WORD *)uint64_t v32 = 2114;
    *(void *)&v32[2] = v14;
    *(_WORD *)&v32[10] = 2114;
    *(void *)&v32[12] = v15;
    _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:prepareAudioStreamSync with stream : %{public}@ with stream state : %{public}@, request : %{public}@", buf, 0x34u);
  }
  uint64_t v26 = 0;
  char v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__7237;
  *(void *)uint64_t v32 = __Block_byref_object_dispose__7238;
  *(void *)&v32[8] = 0;
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CSAudioProvider_prepareAudioStreamSync_request_error___block_invoke;
  block[3] = &unk_1E61FFD60;
  __int16 v24 = &v26;
  void block[4] = self;
  id v17 = v8;
  id v22 = v17;
  id v18 = v9;
  id v23 = v18;
  unint64_t v25 = buf;
  dispatch_async_and_wait(recordQueue, block);
  if (a5) {
    *a5 = *(id *)(*(void *)&buf[8] + 40);
  }
  char v19 = *((unsigned char *)v27 + 24);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v26, 8);

  return v19;
}

void __56__CSAudioProvider_prepareAudioStreamSync_request_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  obuint64_t j = *(id *)(v5 + 40);
  char v6 = [v2 _prepareAudioStreamSync:v3 request:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v6;
}

- (void)startAudioStream:(id)a3 option:(id)a4 completion:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    BOOL v13 = [(CSAudioProvider *)self UUID];
    uint64_t v14 = [v8 name];
    __int16 v15 = [(CSAudioProvider *)self _streamStateName:self->_streamState];
    uint64_t v16 = [v9 localizedDescription];
    unint64_t audioStreamHandleId = self->_audioStreamHandleId;
    *(_DWORD *)buf = 136316418;
    char v27 = "-[CSAudioProvider startAudioStream:option:completion:]";
    __int16 v28 = 2114;
    char v29 = v13;
    __int16 v30 = 2114;
    uint64_t v31 = v14;
    __int16 v32 = 2114;
    uint64_t v33 = v15;
    __int16 v34 = 2114;
    long long v35 = v16;
    __int16 v36 = 2050;
    unint64_t v37 = audioStreamHandleId;
    _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:startAudioStream with stream : %{public}@ with stream state : %{public}@, option : %{public}@, streamId : %{public}llu", buf, 0x3Eu);
  }
  recordQueue = self->_recordQueue;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __54__CSAudioProvider_startAudioStream_option_completion___block_invoke;
  v22[3] = &unk_1E61FFEA0;
  v22[4] = self;
  id v23 = v8;
  id v24 = v9;
  id v25 = v10;
  id v19 = v10;
  id v20 = v9;
  id v21 = v8;
  dispatch_async(recordQueue, v22);
}

void __54__CSAudioProvider_startAudioStream_option_completion___block_invoke(id *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *((void *)a1[4] + 5);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CSAudioProvider_startAudioStream_option_completion___block_invoke_2;
  block[3] = &unk_1E6201030;
  id v18 = a1[5];
  id v19 = a1[6];
  dispatch_async(v2, block);
  uint64_t v3 = a1[4];
  if (v3[7])
  {
    [a1[4] _startAudioStream:a1[5] option:a1[6] completion:a1[7]];
  }
  else
  {
    uint64_t v4 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = v4;
      char v6 = [v3 UUID];
      __int16 v7 = [a1[4] _streamStateName:*((void *)a1[4] + 7)];
      *(_DWORD *)buf = 136315650;
      id v21 = "-[CSAudioProvider startAudioStream:option:completion:]_block_invoke";
      __int16 v22 = 2114;
      id v23 = v6;
      __int16 v24 = 2114;
      id v25 = v7;
      _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:state was %{public}@, prepareAudioStream first", buf, 0x20u);

      uint64_t v3 = a1[4];
    }
    id v8 = a1[5];
    id v9 = [v8 streamRequest];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__CSAudioProvider_startAudioStream_option_completion___block_invoke_79;
    v13[3] = &unk_1E61FFDD8;
    id v10 = a1[7];
    id v11 = a1[4];
    id v12 = a1[5];
    id v16 = v10;
    v13[4] = v11;
    id v14 = v12;
    id v15 = a1[6];
    [v3 _prepareAudioStream:v8 request:v9 completion:v13];
  }
}

uint64_t __54__CSAudioProvider_startAudioStream_option_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setStartStreamOption:*(void *)(a1 + 40)];
}

uint64_t __54__CSAudioProvider_startAudioStream_option_completion___block_invoke_79(uint64_t a1, char a2, void *a3)
{
  a3;
  if (a2)
  {
    [*(id *)(a1 + 32) _startAudioStream:*(void *)(a1 + 40) option:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 56);
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }
  return MEMORY[0x1F4181820]();
}

- (void)_createCircularBufferIfNeededWithNumChannel:(unint64_t)a3 playbackRoute:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (+[CSUtils allowExtendedRingBufferSize]
    && self->_audioStreamType == 2
    && v6
    && self->_phoneCallState != 3)
  {
    char v7 = [v6 isEqualToString:*MEMORY[0x1E4F15110]];
    +[CSConfig inputRecordingDurationInSecs];
    if ((v7 & 1) == 0) {
      +[CSConfig inputRecordingDurationInSecsExtended];
    }
  }
  else
  {
    +[CSConfig inputRecordingDurationInSecs];
  }
  float v9 = v8;
  circularBuffer = self->_circularBuffer;
  if (!circularBuffer
    || ([(CSAudioCircularBuffer *)circularBuffer inputRecordingDuration], v11 != v9)
    || (id v21 = self->_circularBuffer) != 0 && [(CSAudioCircularBuffer *)v21 numInputChannels] != a3)
  {
    id v12 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = v12;
      id v14 = [(CSAudioProvider *)self UUID];
      int v22 = 136315906;
      id v23 = "-[CSAudioProvider _createCircularBufferIfNeededWithNumChannel:playbackRoute:]";
      __int16 v24 = 2114;
      id v25 = v14;
      __int16 v26 = 1024;
      int v27 = a3;
      __int16 v28 = 2048;
      double v29 = v9;
      _os_log_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Create circular buffer : numChannels(%d), duration(%f)", (uint8_t *)&v22, 0x26u);
    }
    id v15 = [CSAudioCircularBuffer alloc];
    +[CSConfig inputRecordingSampleRate];
    LODWORD(v17) = v16;
    *(float *)&double v18 = v9;
    id v19 = [(CSAudioCircularBuffer *)v15 initWithNumChannels:a3 recordingDuration:self->_audioTimeConverter samplingRate:v18 audioTimeConverter:v17];
    id v20 = self->_circularBuffer;
    self->_circularBuffer = v19;
  }
}

- (void)_prepareAudioStream:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8 = a5;
  recordQueue = self->_recordQueue;
  id v10 = a4;
  id v11 = a3;
  dispatch_assert_queue_V2(recordQueue);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__CSAudioProvider__prepareAudioStream_request_completion___block_invoke;
  v17[3] = &unk_1E62011D8;
  id v18 = v8;
  id v12 = v8;
  BOOL v13 = (void (**)(void, void, void))MEMORY[0x1BA9E7570](v17);
  id v16 = 0;
  BOOL v14 = [(CSAudioProvider *)self _prepareAudioStreamSync:v11 request:v10 error:&v16];

  id v15 = v16;
  ((void (**)(void, BOOL, id))v13)[2](v13, v14, v15);
}

uint64_t __58__CSAudioProvider__prepareAudioStream_request_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)_prepareAudioStreamSync:(id)a3 request:(id)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  recordQueue = self->_recordQueue;
  id v10 = a3;
  dispatch_assert_queue_V2(recordQueue);
  [v10 setStreamRequest:v8];

  if (self->_streamState < 2)
  {
    if (self->_audioSystemRecovering)
    {
      id v11 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = v11;
        __int16 v32 = [(CSAudioProvider *)self UUID];
        *(_DWORD *)buf = 136315394;
        id v39 = "-[CSAudioProvider _prepareAudioStreamSync:request:error:]";
        __int16 v40 = 2114;
        id v41 = v32;
        _os_log_error_impl(&dword_1BA1A5000, v31, OS_LOG_TYPE_ERROR, "%s CSAudioProvider[%{public}@]:Cannot prepare, audio system is recovering", buf, 0x16u);

        if (!a5) {
          goto LABEL_6;
        }
      }
      else if (!a5)
      {
LABEL_6:
        [(CSAudioProvider *)self _handleAudioSystemFailure];
LABEL_7:
        LOBYTE(v12) = 0;
        goto LABEL_11;
      }
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:957 userInfo:0];
      goto LABEL_6;
    }
    id v18 = [(CSAudioProvider *)self audioRecorder];

    if (!v18)
    {
      if (a5)
      {
        [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:958 userInfo:0];
        LOBYTE(v12) = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      goto LABEL_7;
    }
    id v19 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = v19;
      id v21 = [(CSAudioProvider *)self UUID];
      *(_DWORD *)buf = 136315394;
      id v39 = "-[CSAudioProvider _prepareAudioStreamSync:request:error:]";
      __int16 v40 = 2114;
      id v41 = v21;
      _os_log_impl(&dword_1BA1A5000, v20, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Asking AudioRecorder prepareAudioStreamRecord", buf, 0x16u);
    }
    int v22 = [(CSAudioProvider *)self audioRecorder];
    id v23 = [(CSAudioProvider *)self recordDeviceIndicator];
    id v37 = 0;
    int v12 = [v22 prepareAudioStreamRecord:v8 recordDeviceIndicator:v23 error:&v37];
    id v24 = v37;

    if (v12)
    {
      [(CSAudioProvider *)self setStreamState:1];
      if ([(CSAudioRecordContext *)self->_lastAudioRecorderContext type] == 6
        && !+[CSUtils isLocalVoiceTriggerAvailable])
      {
        id v25 = +[CSVoiceTriggerEventInfoProvider sharedInstance];
        __int16 v36 = [(CSAudioProvider *)self audioRecorder];
        __int16 v26 = [(CSAudioProvider *)self recordDeviceIndicator];
        int v27 = [v36 fetchGibraltarVoiceTriggerInfoWithRecordDeviceIndicator:v26];
        __int16 v28 = [(CSAudioProvider *)self recordDeviceIndicator];
        double v29 = [v28 deviceId];
        [v25 setVoiceTriggerInfo:v27 deviceId:v29];

        if (!a5) {
          goto LABEL_25;
        }
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v30 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = v30;
        __int16 v34 = [(CSAudioProvider *)self UUID];
        long long v35 = [v24 localizedDescription];
        *(_DWORD *)buf = 136315650;
        id v39 = "-[CSAudioProvider _prepareAudioStreamSync:request:error:]";
        __int16 v40 = 2114;
        id v41 = v34;
        __int16 v42 = 2114;
        long long v43 = v35;
        _os_log_error_impl(&dword_1BA1A5000, v33, OS_LOG_TYPE_ERROR, "%s CSAudioProvider[%{public}@]:prepareAudioStreamRecord failed : %{public}@", buf, 0x20u);

        if (!a5) {
          goto LABEL_25;
        }
        goto LABEL_24;
      }
    }
    if (!a5)
    {
LABEL_25:
      if ((v12 & 1) == 0) {
        [(CSAudioProvider *)self _handleAudioSystemFailure];
      }

      goto LABEL_11;
    }
LABEL_24:
    *a5 = v24;
    goto LABEL_25;
  }
  BOOL v13 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v14 = v13;
    id v15 = [(CSAudioProvider *)self UUID];
    id v16 = [(CSAudioProvider *)self _streamStateName:self->_streamState];
    *(_DWORD *)buf = 136315650;
    id v39 = "-[CSAudioProvider _prepareAudioStreamSync:request:error:]";
    __int16 v40 = 2114;
    id v41 = v15;
    __int16 v42 = 2114;
    long long v43 = v16;
    _os_log_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Prepare audio stream reuqested while state is %{public}@", buf, 0x20u);
  }
  LOBYTE(v12) = 1;
LABEL_11:

  return v12;
}

- (void)attachTandemStream:(id)a3 toPrimaryStream:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  streamHandleQueue = self->_streamHandleQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CSAudioProvider_attachTandemStream_toPrimaryStream_completion___block_invoke;
  block[3] = &unk_1E61FFFB8;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(streamHandleQueue, block);
}

void __65__CSAudioProvider_attachTandemStream_toPrimaryStream_completion___block_invoke(id *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__CSAudioProvider_attachTandemStream_toPrimaryStream_completion___block_invoke_2;
  v17[3] = &unk_1E61FFDB0;
  id v18 = a1[4];
  id v19 = a1[5];
  id v20 = a1[6];
  uint64_t v2 = (void (**)(void, void, void))MEMORY[0x1BA9E7570](v17);
  id v3 = a1[4];
  if (v3 && a1[5])
  {
    uint64_t v4 = [v3 tandemStreams];
    int v5 = [v4 containsObject:a1[5]];

    if (!v5)
    {
      objc_msgSend(a1[4], "setNeedsBoost12dB:", objc_msgSend(a1[5], "needsBoost12dB"));
      objc_msgSend(a1[4], "updateAudioStreamStartTimeInSampleCount:", objc_msgSend(a1[5], "startSampleCount"));
      objc_msgSend(a1[4], "setScheduledFutureSample:", objc_msgSend(a1[5], "scheduledFutureSample"));
      id v12 = a1[4];
      id v13 = [CSAudioStartStreamOption alloc];
      id v14 = [a1[5] startStreamOption];
      id v15 = [(CSAudioStartStreamOption *)v13 initTandemWithOption:v14];
      [v12 setStartStreamOption:v15];

      id v16 = [a1[5] tandemStreams];
      [v16 addObject:a1[4]];

      v2[2](v2, 1, 0);
      goto LABEL_9;
    }
    id v6 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      id v7 = a1[4];
      id v8 = v6;
      id v9 = [v7 name];
      *(_DWORD *)buf = 136315394;
      int v22 = "-[CSAudioProvider attachTandemStream:toPrimaryStream:completion:]_block_invoke";
      __int16 v23 = 2114;
      id v24 = v9;
      _os_log_error_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_ERROR, "%s PrimaryStream is already tandem of stream %{public}@, can't add mutual tandem relation here!", buf, 0x16u);
    }
  }
  else
  {
    id v10 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      int v22 = "-[CSAudioProvider attachTandemStream:toPrimaryStream:completion:]_block_invoke";
      _os_log_error_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_ERROR, "%s Invalid input streams", buf, 0xCu);
    }
  }
  id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:114 userInfo:0];
  ((void (**)(void, void, void *))v2)[2](v2, 0, v11);

LABEL_9:
}

void __65__CSAudioProvider_attachTandemStream_toPrimaryStream_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = v6;
    id v9 = [v7 name];
    id v10 = [*(id *)(a1 + 40) name];
    if (v5) {
      id v11 = @"failed";
    }
    else {
      id v11 = @"successfully";
    }
    id v12 = [v5 localizedDescription];
    int v14 = 136316162;
    id v15 = "-[CSAudioProvider attachTandemStream:toPrimaryStream:completion:]_block_invoke_2";
    __int16 v16 = 2114;
    id v17 = v9;
    __int16 v18 = 2114;
    id v19 = v10;
    __int16 v20 = 2114;
    id v21 = v11;
    __int16 v22 = 2114;
    __int16 v23 = v12;
    _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Attached stream %{public}@ as tandem to master stream %{public}@ %{public}@, error : %{public}@", (uint8_t *)&v14, 0x34u);
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, a2, v5);
  }
}

- (void)audioStreamWithRequest:(id)a3 streamName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __64__CSAudioProvider_audioStreamWithRequest_streamName_completion___block_invoke;
  v21[3] = &unk_1E61FFD88;
  id v22 = v10;
  id v11 = v10;
  id v12 = (void *)MEMORY[0x1BA9E7570](v21);
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__CSAudioProvider_audioStreamWithRequest_streamName_completion___block_invoke_2;
  block[3] = &unk_1E61FFEA0;
  void block[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v12;
  id v14 = v12;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(recordQueue, block);
}

uint64_t __64__CSAudioProvider_audioStreamWithRequest_streamName_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __64__CSAudioProvider_audioStreamWithRequest_streamName_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v7 = 0;
  id v5 = [v2 _audioStreamWithRequest:v3 streamName:v4 error:&v7];
  id v6 = v7;
  (*(void (**)(void))(a1[7] + 16))();
}

- (id)audioStreamWithRequest:(id)a3 streamName:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v26 = 0;
  int v27 = &v26;
  uint64_t v28 = 0x3032000000;
  double v29 = __Block_byref_object_copy__7237;
  uint64_t v30 = __Block_byref_object_dispose__7238;
  id v31 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  __int16 v23 = __Block_byref_object_copy__7237;
  uint64_t v24 = __Block_byref_object_dispose__7238;
  id v25 = 0;
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CSAudioProvider_audioStreamWithRequest_streamName_error___block_invoke;
  block[3] = &unk_1E61FFD60;
  id v18 = &v26;
  void block[4] = self;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  id v19 = &v20;
  dispatch_async_and_wait(recordQueue, block);
  if (a5) {
    *a5 = (id) v21[5];
  }
  id v13 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

void __59__CSAudioProvider_audioStreamWithRequest_streamName_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  obuint64_t j = *(id *)(v5 + 40);
  uint64_t v6 = [v2 _audioStreamWithRequest:v3 streamName:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(a1[7] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)_audioStreamWithRequest:(id)a3 streamName:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  recordQueue = self->_recordQueue;
  id v10 = a4;
  dispatch_assert_queue_V2(recordQueue);
  id v11 = [[CSAudioStream alloc] initWithAudioStreamProvider:self streamName:v10 streamRequest:v8];

  id v12 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    id v14 = [(CSAudioProvider *)self UUID];
    id v15 = [(CSAudioStream *)v11 name];
    *(_DWORD *)buf = 136315650;
    int v27 = "-[CSAudioProvider _audioStreamWithRequest:streamName:error:]";
    __int16 v28 = 2114;
    double v29 = v14;
    __int16 v30 = 2114;
    id v31 = v15;
    _os_log_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:audioStreamWithRequest for stream <%{public}@>", buf, 0x20u);
  }
  id v25 = 0;
  BOOL v16 = [(CSAudioProvider *)self _prepareAudioStreamSync:v11 request:v8 error:&v25];
  id v17 = v25;
  id v18 = v17;
  if (a5) {
    *a5 = v17;
  }
  if (v16)
  {
    if ([v8 requiresHistoricalBuffer])
    {
      id v19 = [(CSAudioProvider *)self historicalBufferRequestStreams];
      [v19 addObject:v11];
    }
    uint64_t v20 = v11;
  }
  else
  {
    id v21 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = v21;
      uint64_t v24 = [v18 localizedDescription];
      *(_DWORD *)buf = 136315394;
      int v27 = "-[CSAudioProvider _audioStreamWithRequest:streamName:error:]";
      __int16 v28 = 2114;
      double v29 = v24;
      _os_log_error_impl(&dword_1BA1A5000, v23, OS_LOG_TYPE_ERROR, "%s Failed to _prepareAudioStreamSync : %{public}@", buf, 0x16u);
    }
    uint64_t v20 = 0;
  }

  return v20;
}

- (BOOL)setCurrentContext:(id)a3 error:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = [(CSAudioProvider *)self UUID];
    id v10 = [v6 description];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[CSAudioProvider setCurrentContext:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v24 = v10;
    _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:setCurrentContext : %{public}@", buf, 0x20u);
  }
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__7237;
  id v25 = __Block_byref_object_dispose__7238;
  id v26 = 0;
  recordQueue = self->_recordQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __43__CSAudioProvider_setCurrentContext_error___block_invoke;
  v15[3] = &unk_1E6200EC8;
  v15[4] = self;
  id v17 = &v19;
  id v12 = v6;
  id v16 = v12;
  id v18 = buf;
  dispatch_async_and_wait(recordQueue, v15);
  if (a4) {
    *a4 = *(id *)(*(void *)&buf[8] + 40);
  }
  char v13 = *((unsigned char *)v20 + 24);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v19, 8);

  return v13;
}

void __43__CSAudioProvider_setCurrentContext_error___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _canSetContext])
  {
    [*(id *)(a1 + 32) _setLatestRecordContext:*(void *)(a1 + 40)];
    uint64_t v2 = [*(id *)(a1 + 32) audioRecorder];

    if (v2)
    {
      uint64_t v3 = [*(id *)(a1 + 32) audioRecorder];
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = [*(id *)(a1 + 32) audioStreamHandleId];
      uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
      obuint64_t j = *(id *)(v6 + 40);
      LOBYTE(v4) = [v3 setCurrentContext:v4 streamHandleId:v5 error:&obj];
      objc_storeStrong((id *)(v6 + 40), obj);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:958 userInfo:0];
      MEMORY[0x1F41817F8]();
    }
  }
  else
  {
    uint64_t v7 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *(void **)(a1 + 32);
      id v9 = v7;
      id v10 = [v8 UUID];
      *(_DWORD *)buf = 136315394;
      char v13 = "-[CSAudioProvider setCurrentContext:error:]_block_invoke";
      __int16 v14 = 2114;
      id v15 = v10;
      _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Cannot change context since audio recorder is currently recording", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)supportsDuckingOnCurrentRouteWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(CSAudioProvider *)self UUID];
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSAudioProvider supportsDuckingOnCurrentRouteWithError:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:", buf, 0x16u);
  }
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v17 = __Block_byref_object_copy__7237;
  id v18 = __Block_byref_object_dispose__7238;
  id v19 = 0;
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CSAudioProvider_supportsDuckingOnCurrentRouteWithError___block_invoke;
  block[3] = &unk_1E61FFF40;
  void block[4] = self;
  void block[5] = &v12;
  void block[6] = buf;
  dispatch_async_and_wait(recordQueue, block);
  if (a3) {
    *a3 = *(id *)(*(void *)&buf[8] + 40);
  }
  char v9 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v12, 8);
  return v9;
}

void __58__CSAudioProvider_supportsDuckingOnCurrentRouteWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) audioRecorder];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) audioRecorder];
    uint64_t v4 = [*(id *)(a1 + 32) audioStreamHandleId];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    obuint64_t j = *(id *)(v5 + 40);
    char v6 = [v3 isDuckingSupportedOnCurrentRouteWithStreamHandleID:v4 error:&obj];
    objc_storeStrong((id *)(v5 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:958 userInfo:0];
    MEMORY[0x1F41817F8]();
  }
}

- (BOOL)_canSetContext
{
  uint64_t v3 = [(CSAudioProvider *)self audioRecorder];
  uint64_t v4 = [(CSAudioProvider *)self recordDeviceIndicator];
  int v5 = [v3 isRecordingWithRecordDeviceIndicator:v4];

  if (!v5) {
    return 1;
  }
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  return CSIsHorseman_isHorseman == 0;
}

- (unint64_t)audioStreamId
{
  return self->_audioStreamHandleId;
}

- (void)_setLatestRecordContext:(id)a3
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_lastAudioRecorderContext, a3);
  recordDeviceIndicator = self->_recordDeviceIndicator;
  if (recordDeviceIndicator)
  {
    [(CSAudioRecordDeviceIndicator *)recordDeviceIndicator updateWithLatestRecordContext:v10];
  }
  else
  {
    char v6 = [CSAudioRecordDeviceIndicator alloc];
    uint64_t v7 = [v10 deviceId];
    id v8 = [(CSAudioRecordDeviceIndicator *)v6 initWithRecordContext:v10 deviceId:v7 shouldUseRemoteRecorder:self->_audioStreamType == 3 streamHandleId:self->_audioStreamHandleId];
    char v9 = self->_recordDeviceIndicator;
    self->_recordDeviceIndicator = v8;
  }
  [(CSAudioProvider *)self _updateRemoteDeviceIdFromAVVCIfNeeded];
}

- (void)setLatestRecordContext:(id)a3 streamType:(int64_t)a4
{
  id v6 = a3;
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CSAudioProvider_setLatestRecordContext_streamType___block_invoke;
  block[3] = &unk_1E6200148;
  id v10 = v6;
  int64_t v11 = a4;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(recordQueue, block);
}

uint64_t __53__CSAudioProvider_setLatestRecordContext_streamType___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 312) = *(void *)(a1 + 48);
  return [*(id *)(a1 + 32) _setLatestRecordContext:*(void *)(a1 + 40)];
}

- (void)setAudioProviderDelegate:(id)a3
{
  id v4 = a3;
  recordQueue = self->_recordQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__CSAudioProvider_setAudioProviderDelegate___block_invoke;
  v7[3] = &unk_1E6201030;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(recordQueue, v7);
}

uint64_t __44__CSAudioProvider_setAudioProviderDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setProviderDelegate:*(void *)(a1 + 40)];
}

- (void)setAudioRecorder:(id)a3
{
  id v4 = a3;
  recordQueue = self->_recordQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__CSAudioProvider_setAudioRecorder___block_invoke;
  v7[3] = &unk_1E6201030;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(recordQueue, v7);
}

void __36__CSAudioProvider_setAudioRecorder___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = v2;
    int v5 = [v3 UUID];
    uint64_t v6 = *(void *)(a1 + 40);
    int v10 = 136315650;
    int64_t v11 = "-[CSAudioProvider setAudioRecorder:]_block_invoke";
    __int16 v12 = 2114;
    char v13 = v5;
    __int16 v14 = 2050;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:Setting audioRecorder : %{public}p", (uint8_t *)&v10, 0x20u);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "registerObserver:");
  uint64_t v7 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    int64_t v11 = "-[CSAudioProvider setAudioRecorder:]_block_invoke";
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Reset recordDeviceIndicator as we have new audioRecorder", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  char v9 = *(void **)(v8 + 320);
  *(void *)(v8 + 320) = 0;
}

- (void)setStreamState:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v5 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(CSAudioProvider *)self UUID];
    uint64_t v8 = [(CSAudioProvider *)self _streamStateName:self->_streamState];
    char v9 = [(CSAudioProvider *)self _streamStateName:a3];
    int v10 = 136315906;
    int64_t v11 = "-[CSAudioProvider setStreamState:]";
    __int16 v12 = 2114;
    char v13 = v7;
    __int16 v14 = 2114;
    uint64_t v15 = v8;
    __int16 v16 = 2114;
    id v17 = v9;
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider[%{public}@]:StreamState changed from : %{public}@ to : %{public}@", (uint8_t *)&v10, 0x2Au);
  }
  self->_unint64_t streamState = a3;
}

- (void)start
{
  uint64_t v3 = +[CSAudioServerCrashMonitor sharedInstance];
  [v3 addObserver:self];

  if (+[CSUtils allowExtendedRingBufferSize])
  {
    [(CSEventMonitor *)self->_phoneCallStateMonitor addObserver:self];
    self->_phoneCallState = [(CSPhoneCallStateMonitor *)self->_phoneCallStateMonitor phoneCallState];
  }
  recordQueue = self->_recordQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__CSAudioProvider_start__block_invoke;
  block[3] = &unk_1E6201288;
  void block[4] = self;
  dispatch_async(recordQueue, block);
  objc_initWeak(&location, self);
  [(CSStateCapture *)self->_stateCapture start];
  stateCapture = self->_stateCapture;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24__CSAudioProvider_start__block_invoke_2;
  v6[3] = &unk_1E61FFD38;
  objc_copyWeak(&v7, &location);
  [(CSStateCapture *)stateCapture setStateCaptureBlock:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

uint64_t __24__CSAudioProvider_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateRemoteDeviceIdFromAVVCIfNeeded];
}

CSStateCaptureOptions *__24__CSAudioProvider_start__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [CSStateCaptureOptions alloc];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__CSAudioProvider_start__block_invoke_3;
  v5[3] = &unk_1E61FFD10;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  uint64_t v3 = [(CSStateCaptureOptions *)v2 initWithMutableBuilder:v5];
  objc_destroyWeak(&v6);
  return v3;
}

void __24__CSAudioProvider_start__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v42 = 0;
  long long v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  int v5 = [WeakRetained recordQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__CSAudioProvider_start__block_invoke_4;
  block[3] = &unk_1E6200F40;
  id v41 = &v42;
  id v6 = WeakRetained;
  id v40 = v6;
  dispatch_sync(v5, block);

  uint64_t v33 = 0;
  __int16 v34 = &v33;
  uint64_t v35 = 0x3032000000;
  __int16 v36 = __Block_byref_object_copy__7237;
  id v37 = __Block_byref_object_dispose__7238;
  id v38 = 0;
  id v7 = [v6 streamHandleQueue];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __24__CSAudioProvider_start__block_invoke_52;
  v30[3] = &unk_1E6200F40;
  uint64_t v32 = &v33;
  id v8 = v6;
  id v31 = v8;
  dispatch_sync(v7, v30);

  char v9 = [MEMORY[0x1E4F1CA60] dictionary];
  int v10 = [NSNumber numberWithUnsignedInteger:v43[3]];
  int64_t v11 = NSString;
  __int16 v12 = [v8 UUID];
  char v13 = [v11 stringWithFormat:@"StreamState[CSAudioProvider-%@]", v12];
  [v9 setValue:v10 forKey:v13];

  __int16 v14 = [MEMORY[0x1E4F1CA48] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = (id)v34[5];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v46 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v27;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v15);
        }
        id v19 = [*(id *)(*((void *)&v26 + 1) + 8 * v18) name];
        [v14 addObject:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v46 count:16];
    }
    while (v16);
  }

  if ([v14 count])
  {
    uint64_t v20 = NSString;
    uint64_t v21 = [v8 UUID];
    char v22 = [v20 stringWithFormat:@"activeStreams[CSAudioProvider-%@]", v21];
    [v9 setValue:v14 forKey:v22];
  }
  [v3 setStateData:v9];
  __int16 v23 = NSString;
  uint64_t v24 = [v8 UUID];
  id v25 = [v23 stringWithFormat:@"CoreSpeech-AudioStates[CSAudioProvider-%@]", v24];
  [v3 setStateDataTitle:v25];

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v42, 8);
}

uint64_t __24__CSAudioProvider_start__block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) streamState];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __24__CSAudioProvider_start__block_invoke_52(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) streams];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [(CSAudioProvider *)self _holdRecordingExceptionIfNeeded:0];
  uint64_t v3 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[CSAudioProvider dealloc]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s CSAudioProvider is deallocated", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSAudioProvider;
  [(CSAudioProvider *)&v4 dealloc];
}

- (CSAudioProvider)initWithAudioStreamHandleId:(unint64_t)a3 audioStreamType:(int64_t)a4 audioRecordContext:(id)a5 audioRecorder:(id)a6
{
  return [(CSAudioProvider *)self initWithAudioStreamHandleId:a3 audioStreamType:a4 audioRecordContext:a5 audioRecorder:a6 phoneCallStateMonitor:0];
}

- (CSAudioProvider)initWithAudioStreamHandleId:(unint64_t)a3 audioStreamType:(int64_t)a4 audioRecordContext:(id)a5 audioRecorder:(id)a6 phoneCallStateMonitor:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v78.receiver = self;
  v78.super_class = (Class)CSAudioProvider;
  id v15 = [(CSAudioProvider *)&v78 init];
  uint64_t v16 = v15;
  if (v15)
  {
    v15->_unint64_t audioStreamHandleId = a3;
    if (CSIsHorseman_onceToken != -1) {
      dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
    }
    if (a4 == 1 && CSIsHorseman_isHorseman)
    {
      uint64_t v17 = +[CSUtils getSerialQueueWithQOS:33 name:@"CSAudioProvider" fixedPriority:60];
      recordQueue = v16->_recordQueue;
      v16->_recordQueue = (OS_dispatch_queue *)v17;

      uint64_t v19 = +[CSUtils getSerialQueueWithQOS:33 name:@"CSAudioProvider Stream Handle Queue" fixedPriority:60];
      streamHandleQueue = v16->_streamHandleQueue;
      v16->_streamHandleQueue = (OS_dispatch_queue *)v19;
    }
    else
    {
      uint64_t v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v22 = dispatch_queue_create("CSAudioProvider", v21);
      __int16 v23 = v16->_recordQueue;
      v16->_recordQueue = (OS_dispatch_queue *)v22;

      streamHandleQueue = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v24 = dispatch_queue_create("CSAudioProvider Stream Handle Queue", streamHandleQueue);
      id v25 = v16->_streamHandleQueue;
      v16->_streamHandleQueue = (OS_dispatch_queue *)v24;
    }
    long long v26 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -2);
    dispatch_queue_t v27 = dispatch_queue_create("CSAudioProvider logging", v26);
    loggingQueue = v16->_loggingQueue;
    v16->_loggingQueue = (OS_dispatch_queue *)v27;

    uint64_t v29 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    startPendingStreams = v16->_startPendingStreams;
    v16->_startPendingStreams = (NSHashTable *)v29;

    uint64_t v31 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    startPendingOnStoppingStreams = v16->_startPendingOnStoppingStreams;
    v16->_startPendingOnStoppingStreams = (NSHashTable *)v31;

    uint64_t v33 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    alertPlaybackFinishWaitingStreams = v16->_alertPlaybackFinishWaitingStreams;
    v16->_alertPlaybackFinishWaitingStreams = (NSHashTable *)v33;

    uint64_t v35 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    streams = v16->_streams;
    v16->_streams = (NSHashTable *)v35;

    uint64_t v37 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    stopPendingStreams = v16->_stopPendingStreams;
    v16->_stopPendingStreams = (NSHashTable *)v37;

    uint64_t v39 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    historicalBufferRequestStreams = v16->_historicalBufferRequestStreams;
    v16->_historicalBufferRequestStreams = (NSHashTable *)v39;

    uint64_t v41 = [MEMORY[0x1E4F1CA48] array];
    pendingStartCompletions = v16->_pendingStartCompletions;
    v16->_pendingStartCompletions = (NSMutableArray *)v41;

    uint64_t v43 = [MEMORY[0x1E4F1CA60] dictionary];
    startPendingOnStoppingStreamToCompletionDict = v16->_startPendingOnStoppingStreamToCompletionDict;
    v16->_startPendingOnStoppingStreamToCompletionDict = (NSMutableDictionary *)v43;

    uint64_t v45 = [MEMORY[0x1E4F1CA48] array];
    alertPlaybackFinishWaitingCompletions = v16->_alertPlaybackFinishWaitingCompletions;
    v16->_alertPlaybackFinishWaitingCompletions = (NSMutableArray *)v45;

    uint64_t v47 = [MEMORY[0x1E4F1CA48] array];
    pendingStopCompletions = v16->_pendingStopCompletions;
    v16->_pendingStopCompletions = (NSMutableArray *)v47;

    uint64_t v49 = [MEMORY[0x1E4F1CA48] array];
    streamHolders = v16->_streamHolders;
    v16->_streamHolders = (NSMutableArray *)v49;

    uint64_t v51 = [MEMORY[0x1E4F1CA60] dictionary];
    recordModeLocks = v16->_recordModeLocks;
    v16->_recordModeLocks = (NSMutableDictionary *)v51;

    uint64_t v53 = [MEMORY[0x1E4F1CA60] dictionary];
    listeningMicIndicatorLocks = v16->_listeningMicIndicatorLocks;
    v16->_listeningMicIndicatorLocks = (NSMutableDictionary *)v53;

    [(CSAudioProvider *)v16 setStreamState:0];
    objc_storeStrong((id *)&v16->_audioRecorder, a6);
    [(CSAudioRecorder *)v16->_audioRecorder registerObserver:v16];
    int v55 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v56 = [v55 UUIDString];
    UUID = v16->_UUID;
    v16->_UUID = (NSString *)v56;

    v16->_audioSystemRecovering = 0;
    dispatch_group_t v58 = dispatch_group_create();
    recordingWillStartGroup = v16->_recordingWillStartGroup;
    v16->_recordingWillStartGroup = (OS_dispatch_group *)v58;

    v16->_int64_t audioStreamType = a4;
    int v60 = [CSAudioRecordDeviceIndicator alloc];
    __int16 v61 = [v12 deviceId];
    uint64_t v62 = [(CSAudioRecordDeviceIndicator *)v60 initWithRecordContext:v12 deviceId:v61 shouldUseRemoteRecorder:a4 == 3 streamHandleId:a3];
    recordDeviceIndicator = v16->_recordDeviceIndicator;
    v16->_recordDeviceIndicator = (CSAudioRecordDeviceIndicator *)v62;

    int v64 = +[CSAudioTimeConverterPool sharedInstance];
    uint64_t v65 = [v64 converterForAudioStreamId:a3];
    audioTimeConverter = v16->_audioTimeConverter;
    v16->_audioTimeConverter = (CSAudioTimeConverter *)v65;

    if (+[CSUtils isExclaveHardware])
    {
      unint64_t v67 = +[CSAudioTimeConverterPool sharedInstance];
      uint64_t v68 = [v67 defaultExclaveConverter];
      exclaveAudioTimeConverter = v16->_exclaveAudioTimeConverter;
      v16->_exclaveAudioTimeConverter = (CSAudioTimeConverter *)v68;
    }
    v70 = objc_alloc_init(CSMicUsageReporter);
    micUsageReporter = v16->_micUsageReporter;
    v16->_micUsageReporter = v70;

    v16->_currentSessionShouldDuckOnBuiltInSpeaker = 0;
    signed int v72 = +[CSConfig inputRecordingNumberOfChannels];
    if (a4 == 1)
    {
      if (CSIsHorseman_onceToken != -1) {
        dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
      }
      if (CSIsHorseman_isHorseman) {
        signed int v72 = 1;
      }
    }
    if (+[CSUtils allowExtendedRingBufferSize])
    {
      if (v14)
      {
        id v73 = (CSPhoneCallStateMonitor *)v14;
      }
      else
      {
        id v73 = +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor];
      }
      phoneCallStateMonitor = v16->_phoneCallStateMonitor;
      v16->_phoneCallStateMonitor = v73;
    }
    v16->_phoneCallState = 0;
    [(CSAudioProvider *)v16 _createCircularBufferIfNeededWithNumChannel:v72 playbackRoute:0];
    int v75 = objc_alloc_init(CSStateCapture);
    stateCapture = v16->_stateCapture;
    v16->_stateCapture = v75;
  }
  return v16;
}

@end