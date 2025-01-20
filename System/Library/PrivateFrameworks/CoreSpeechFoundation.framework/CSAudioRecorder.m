@interface CSAudioRecorder
+ (unint64_t)_convertDeactivateOption:(unint64_t)a3;
+ (void)createSharedAudioSession;
+ (void)resetDuckSettings;
- (BOOL)_audioIsFromRemoteAccessory:(unint64_t)a3;
- (BOOL)_hasLocalPendingTwoShot;
- (BOOL)_isDarwinDeviceId:(id)a3;
- (BOOL)_needResetAudioInjectionIndex:(id)a3;
- (BOOL)_shouldInjectAudio;
- (BOOL)_shouldLogResourceNotAvailableError;
- (BOOL)_shouldUseRemoteBuiltInMic:(id)a3;
- (BOOL)_startAudioStreamForAudioInjectionWithAVVCContext:(id)a3;
- (BOOL)activateAudioSessionWithReason:(unint64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5;
- (BOOL)clearListeningMicIndicatorProperty;
- (BOOL)deactivateAudioSession:(unint64_t)a3 error:(id *)a4;
- (BOOL)deactivateAudioSession:(unint64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5;
- (BOOL)fetchSecureAudioStreamWithRecordDeviceIndicator:(id)a3 from:(unint64_t)a4 numSamples:(unint64_t)a5 hostTime:(unint64_t)a6 error:(id *)a7;
- (BOOL)isDuckingSupportedOnCurrentRouteWithStreamHandleID:(unint64_t)a3 error:(id *)a4;
- (BOOL)isNarrowBandWithStreamHandleId:(unint64_t)a3;
- (BOOL)isRecordingWithRecordDeviceIndicator:(id)a3;
- (BOOL)isSessionCurrentlyActivated;
- (BOOL)playAlertSoundForType:(int64_t)a3 overrideMode:(int64_t)a4;
- (BOOL)playAlertSoundForType:(int64_t)a3 recordDevideIndicator:(id)a4;
- (BOOL)playRecordStartingAlertAndResetEndpointerFromStream:(unint64_t)a3 withAlertOverride:(int64_t)a4;
- (BOOL)prepareAudioStreamRecord:(id)a3 recordDeviceIndicator:(id)a4 error:(id *)a5;
- (BOOL)prewarmAudioSessionWithStreamHandleId:(unint64_t)a3 error:(id *)a4;
- (BOOL)setAlertSoundFromURL:(id)a3 forType:(int64_t)a4 force:(BOOL)a5;
- (BOOL)setCurrentContext:(id)a3 streamHandleId:(unint64_t)a4 error:(id *)a5;
- (BOOL)setEnableInterruptionByRecordingClientsForStream:(unint64_t)a3 enable:(BOOL)a4;
- (BOOL)setListeningMicIndicatorProperty;
- (BOOL)setRecordMode:(int64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5;
- (BOOL)startAudioStreamWithOption:(id)a3 recordDeviceIndicator:(id)a4 error:(id *)a5;
- (BOOL)stopAudioStreamWithRecordDeviceIndicator:(id)a3 error:(id *)a4;
- (BOOL)stopDeliverSecureAudioStreamWithRecordDeviceIndicator:(id)a3 from:(unint64_t)a4 error:(id *)a5;
- (CSAudioRecorder)init;
- (CSAudioRecorder)initWithQueue:(id)a3 error:(id *)a4;
- (CSAudioSessionEventProvidingDelegate)sessionEventDelegate;
- (NSHashTable)observers;
- (NSMutableSet)remoteAccessoryStreamIdSet;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)voiceControllerCreationQueue;
- (float)averagePowerForChannel:(unint64_t)a3;
- (float)peakPowerForChannel:(unint64_t)a3;
- (float)recordingSampleRateWithStreamHandleId:(unint64_t)a3;
- (id)_compensateChannelDataIfNeeded:(id)a3 receivedNumChannels:(unsigned int)a4;
- (id)_createVoiceControllerWithError:(id *)a3;
- (id)_fetchRemoteRecordClientWithDeviceId:(id)a3 streamHandleId:(unint64_t)a4;
- (id)_getRecordSettingsWithRequest:(id)a3;
- (id)_getVoiceController;
- (id)_recordModeString:(int64_t)a3;
- (id)_updateLanguageCodeForRemoteVTEIResult:(id)a3;
- (id)audioDeviceInfoWithStreamHandleId:(unint64_t)a3 recordDeviceIndicator:(id)a4;
- (id)fetchGibraltarVoiceTriggerInfoWithRecordDeviceIndicator:(id)a3;
- (id)getPlaybackRouteForStreamID:(unint64_t)a3;
- (id)metrics;
- (id)recordDeviceInfoWithStreamHandleId:(unint64_t)a3 recordDeviceIndicator:(id)a4;
- (id)recordRouteWithRecordDeviceIndicator:(id)a3;
- (id)recordSettingsWithStreamHandleId:(unint64_t)a3;
- (unint64_t)alertStartTime;
- (unint64_t)exclaveSampleCountForStream;
- (unint64_t)sensorStart;
- (unint64_t)sensorStop;
- (void)_audioRecorderDidStartRecordingSuccessfully:(BOOL)a3 streamHandleID:(unint64_t)a4 error:(id)a5;
- (void)_audioRecorderDidStopRecordingForReason:(int64_t)a3 streamHandleID:(unint64_t)a4;
- (void)_destroyVoiceController;
- (void)_logResourceNotAvailableErrorIfNeeded:(id)a3;
- (void)_processAudioBuffer:(id)a3 audioStreamHandleId:(unint64_t)a4 arrivalTimestampToAudioRecorder:(unint64_t)a5;
- (void)_processAudioChain:(id)a3 audioStreamHandleId:(unint64_t)a4 remoteVAD:(id)a5 atTime:(unint64_t)a6 arrivalTimestampToAudioRecorder:(unint64_t)a7 numberOfChannels:(int)a8;
- (void)_processExclaveBufferCallbackFrom:(unint64_t)a3 hostTime:(unint64_t)a4;
- (void)_stopTrackingRemoteAccessoryStreamId:(unint64_t)a3;
- (void)_trackRemoteAccessoryStreamIdIfNeeded:(id)a3;
- (void)audioDecoderDidDecodePackets:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 timestamp:(unint64_t)a7 arrivalTimestampToAudioRecorder:(unint64_t)a8 wasBuffered:(BOOL)a9 receivedNumChannels:(unsigned int)a10;
- (void)audioFileReaderBufferAvailable:(id)a3 buffer:(id)a4 atTime:(unint64_t)a5;
- (void)audioFileReaderDidStartRecording:(id)a3 successfully:(BOOL)a4 error:(id)a5;
- (void)audioFileReaderDidStopRecording:(id)a3 forReason:(int64_t)a4;
- (void)configureAlertBehavior:(id)a3 audioStreamHandleId:(unint64_t)a4;
- (void)dealloc;
- (void)enableMiniDucking:(BOOL)a3;
- (void)enableSmartRoutingConsiderationForStream:(unint64_t)a3 enable:(BOOL)a4;
- (void)exclaveRecordClientAudioBuffer:(id)a3 audioStreamHandleId:(unint64_t)a4 audioBuffer:(id)a5 hostTime:(unint64_t)a6;
- (void)registerObserver:(id)a3;
- (void)remoteRecordConnectionDisconnected:(id)a3;
- (void)remoteRecordDidStartRecordingWithStreamHandleId:(unint64_t)a3 error:(id)a4;
- (void)remoteRecordDidStopRecordingWithWithStreamHandleId:(unint64_t)a3 error:(id)a4;
- (void)remoteRecordLPCMBufferAvailable:(id)a3 streamHandleId:(unint64_t)a4;
- (void)setAnnounceCallsEnabled:(BOOL)a3 withStreamHandleID:(unint64_t)a4;
- (void)setAudioSessionEventDelegate:(id)a3;
- (void)setContext:(id)a3 completion:(id)a4;
- (void)setDuckMixWithOthersForStream:(unint64_t)a3 duckOthers:(BOOL)a4 duckToLevelInDB:(id)a5 mixWithOthers:(BOOL)a6;
- (void)setExclaveSampleCountForStream:(unint64_t)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteAccessoryStreamIdSet:(id)a3;
- (void)setSessionEventDelegate:(id)a3;
- (void)setVoiceControllerCreationQueue:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)userSessionActivateMonitor:(id)a3 didReceivedUserSessionActiveHasChanged:(BOOL)a4;
- (void)voiceControllerAudioCallback:(id)a3 forStream:(unint64_t)a4 buffer:(id)a5;
- (void)voiceControllerBeginRecordInterruption:(id)a3;
- (void)voiceControllerBeginRecordInterruption:(id)a3 withContext:(id)a4;
- (void)voiceControllerDidFinishAlertPlayback:(id)a3 ofType:(int)a4 error:(id)a5;
- (void)voiceControllerDidSetAudioSessionActive:(id)a3 isActivated:(BOOL)a4;
- (void)voiceControllerDidStartRecording:(id)a3 forStream:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6;
- (void)voiceControllerDidStopRecording:(id)a3 forStream:(unint64_t)a4 forReason:(int64_t)a5;
- (void)voiceControllerEncoderErrorDidOccur:(id)a3 error:(id)a4;
- (void)voiceControllerEndRecordInterruption:(id)a3;
- (void)voiceControllerRecordHardwareConfigurationDidChange:(id)a3 toConfiguration:(int)a4;
- (void)voiceControllerStreamInvalidated:(id)a3 forStream:(unint64_t)a4;
- (void)voiceControllerWillSetAudioSessionActive:(id)a3 willActivate:(BOOL)a4;
- (void)willDestroy;
@end

@implementation CSAudioRecorder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAccessoryStreamIdSet, 0);
  objc_destroyWeak((id *)&self->_sessionEventDelegate);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_voiceControllerCreationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_exclaveAudioClient, 0);
  objc_storeStrong((id *)&self->_hasSetAlertDictionary, 0);
  objc_storeStrong((id *)&self->_audioBufferPool, 0);
  objc_storeStrong((id *)&self->_audioFileReader, 0);
  objc_storeStrong((id *)&self->_opusDecoders, 0);
  objc_storeStrong((id *)&self->_remoteRecordClient, 0);
  objc_storeStrong((id *)&self->_voiceController, 0);
}

- (void)setExclaveSampleCountForStream:(unint64_t)a3
{
  self->_exclaveSampleCountForStream = a3;
}

- (unint64_t)exclaveSampleCountForStream
{
  return self->_exclaveSampleCountForStream;
}

- (void)setRemoteAccessoryStreamIdSet:(id)a3
{
}

- (NSMutableSet)remoteAccessoryStreamIdSet
{
  return self->_remoteAccessoryStreamIdSet;
}

- (void)setSessionEventDelegate:(id)a3
{
}

- (CSAudioSessionEventProvidingDelegate)sessionEventDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionEventDelegate);
  return (CSAudioSessionEventProvidingDelegate *)WeakRetained;
}

- (void)setObservers:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setVoiceControllerCreationQueue:(id)a3
{
}

- (OS_dispatch_queue)voiceControllerCreationQueue
{
  return self->_voiceControllerCreationQueue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)_recordModeString:(int64_t)a3
{
  v3 = @"Unknown";
  if (a3 == 2) {
    v3 = @"Listening";
  }
  if (a3 == 1) {
    return @"Recording";
  }
  else {
    return v3;
  }
}

- (BOOL)_isDarwinDeviceId:(id)a3
{
  id v3 = a3;
  v4 = +[CSRemoteDarwinDeviceInfo sharedInstance];
  char v5 = [v4 isRemoteDarwinConnectedWithUUID:v3];

  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    v7 = +[CSRemoteDarwinDeviceInfo sharedInstance];
    v8 = [v7 fetchDeviceUUIDStringFromUID:v3];

    BOOL v6 = v8 != 0;
  }

  return v6;
}

- (id)_fetchRemoteRecordClientWithDeviceId:(id)a3 streamHandleId:(unint64_t)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (__CFString *)a3;
  if (+[CSUtils hasRemoteCoreSpeech]
    && (BOOL v7 = +[CSUtils hasRemoteBuiltInMic], a4 == 1)
    && v7)
  {
    v8 = @"BuiltInMicrophoneDevice";
    v9 = @"BuiltInMicrophoneDevice";
    v10 = v6;
  }
  else
  {
    v11 = +[CSRemoteDarwinDeviceInfo sharedInstance];
    int v12 = [v11 hasDarwinDeviceConnected];

    v8 = v6;
    if (!v12) {
      goto LABEL_10;
    }
    v13 = +[CSRemoteDarwinDeviceInfo sharedInstance];
    v14 = [v13 fetchDeviceUUIDStringFromUID:v6];

    if (v14)
    {
      v10 = v14;

      v8 = v10;
    }
    else
    {
      v10 = 0;
      v8 = v6;
    }
  }

LABEL_10:
  remoteRecordClient = self->_remoteRecordClient;
  if (!remoteRecordClient)
  {
LABEL_16:
    v23 = [[CSRemoteRecordClient alloc] initWithDeviceId:v8 audioStreamHandleId:a4];
    v24 = self->_remoteRecordClient;
    self->_remoteRecordClient = v23;

    [(CSRemoteRecordClient *)self->_remoteRecordClient setDelegate:self];
    goto LABEL_17;
  }
  v16 = [(CSRemoteRecordClient *)remoteRecordClient deviceId];
  char v17 = [v16 isEqualToString:v8];

  if ((v17 & 1) == 0)
  {
    v18 = self->_remoteRecordClient;
    if (v18)
    {
      v19 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v19;
        v21 = [(CSRemoteRecordClient *)v18 deviceId];
        int v31 = 136315650;
        v32 = "-[CSAudioRecorder _fetchRemoteRecordClientWithDeviceId:streamHandleId:]";
        __int16 v33 = 2112;
        unint64_t v34 = (unint64_t)v21;
        __int16 v35 = 2112;
        v36 = v6;
        _os_log_impl(&dword_1BA1A5000, v20, OS_LOG_TYPE_DEFAULT, "%s Existing remoteRecordClient (deviceId = %@) doesn't match required one (deviceId = %@), create new remoteRecordClient", (uint8_t *)&v31, 0x20u);

        v18 = self->_remoteRecordClient;
      }
      [(CSRemoteRecordClient *)v18 setDelegate:0];
      v22 = self->_remoteRecordClient;
      self->_remoteRecordClient = 0;
    }
    goto LABEL_16;
  }
LABEL_17:
  if ([(CSRemoteRecordClient *)self->_remoteRecordClient audioStreamHandleId] != a4)
  {
    v25 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_FAULT))
    {
      v28 = self->_remoteRecordClient;
      v29 = v25;
      uint64_t v30 = [(CSRemoteRecordClient *)v28 audioStreamHandleId];
      int v31 = 136315650;
      v32 = "-[CSAudioRecorder _fetchRemoteRecordClientWithDeviceId:streamHandleId:]";
      __int16 v33 = 2050;
      unint64_t v34 = a4;
      __int16 v35 = 2050;
      v36 = (__CFString *)v30;
      _os_log_fault_impl(&dword_1BA1A5000, v29, OS_LOG_TYPE_FAULT, "%s The input streamHandleId(%{public}lu) is not expected(%{public}lu)", (uint8_t *)&v31, 0x20u);
    }
  }
  v26 = self->_remoteRecordClient;

  return v26;
}

- (id)_getRecordSettingsWithRequest:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 useCustomizedRecordSettings])
  {
    id v4 = v3;
  }
  else
  {
    char v5 = [v3 recordContext];
    id v4 = +[CSAudioStreamRequest defaultRequestWithContext:v5];
  }
  unint64_t v6 = [v4 audioFormat];
  if (v6 >= 3)
  {
    v8 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[CSAudioRecorder _getRecordSettingsWithRequest:]";
      _os_log_error_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_ERROR, "%s Unsupported audio format!", buf, 0xCu);
    }
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = *(unsigned int *)&aMcplsupoxeps[4 * v6];
  }
  BOOL v9 = [v4 numberOfChannels] > 1;
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", v7, *MEMORY[0x1E4F151D8]);
  v24[0] = v10;
  v23[1] = *MEMORY[0x1E4F15268];
  v11 = NSNumber;
  [v4 sampleRate];
  int v12 = objc_msgSend(v11, "numberWithDouble:");
  v24[1] = v12;
  v23[2] = *MEMORY[0x1E4F151E8];
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "lpcmBitDepth"));
  v24[2] = v13;
  v23[3] = *MEMORY[0x1E4F15210];
  v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "lpcmIsFloat"));
  v24[3] = v14;
  v23[4] = *MEMORY[0x1E4F15230];
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "numberOfChannels"));
  v24[4] = v15;
  v23[5] = *MEMORY[0x1E4F151B8];
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "encoderBitRate"));
  uint64_t v17 = *MEMORY[0x1E4F15240];
  uint64_t v18 = *MEMORY[0x1E4F15250];
  v24[5] = v16;
  v24[6] = v18;
  uint64_t v19 = *MEMORY[0x1E4F15220];
  v23[6] = v17;
  v23[7] = v19;
  v20 = [NSNumber numberWithBool:v9];
  v24[7] = v20;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:8];

  return v21;
}

- (void)audioFileReaderDidStopRecording:(id)a3 forReason:(int64_t)a4
{
}

- (void)audioFileReaderDidStartRecording:(id)a3 successfully:(BOOL)a4 error:(id)a5
{
  id v6 = a5;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__CSAudioRecorder_audioFileReaderDidStartRecording_successfully_error___block_invoke;
  v9[3] = &unk_1E6201030;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

uint64_t __71__CSAudioRecorder_audioFileReaderDidStartRecording_successfully_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _audioRecorderDidStartRecordingSuccessfully:1 streamHandleID:1 error:*(void *)(a1 + 40)];
}

- (void)audioFileReaderBufferAvailable:(id)a3 buffer:(id)a4 atTime:(unint64_t)a5
{
  id v7 = a4;
  [(CSAudioRecorder *)self _processAudioChain:v7 audioStreamHandleId:0 remoteVAD:0 atTime:a5 arrivalTimestampToAudioRecorder:0 numberOfChannels:+[CSConfig inputRecordingNumberOfChannels]];
}

- (BOOL)_needResetAudioInjectionIndex:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3
    && (uint64_t v5 = *MEMORY[0x1E4F152E8],
        [v3 objectForKeyedSubscript:*MEMORY[0x1E4F152E8]],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v7 = [v4 objectForKeyedSubscript:v5];
    uint64_t v8 = [v7 unsignedIntegerValue];

    BOOL v10 = v8 != 1886352244 && v8 != 1635087471;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_hasLocalPendingTwoShot
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__CSAudioRecorder__hasLocalPendingTwoShot__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __42__CSAudioRecorder__hasLocalPendingTwoShot__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 88);
  if (v2)
  {
    char v3 = +[CSVoiceTriggerEventInfoProvider sharedInstance];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 == [v3 triggerNotifiedMachTime];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  id v4 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 88);
    int v7 = 136315650;
    uint64_t v8 = "-[CSAudioRecorder _hasLocalPendingTwoShot]_block_invoke";
    __int16 v9 = 1026;
    int v10 = v5;
    __int16 v11 = 2050;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s hasLocalPendingTwoShot = %{public}d, token : %{public}llu", (uint8_t *)&v7, 0x1Cu);
  }
  *(void *)(*(void *)(a1 + 32) + 88) = 0;
}

- (void)remoteRecordConnectionDisconnected:(id)a3
{
  uint64_t v4 = [a3 audioStreamHandleId];
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__CSAudioRecorder_remoteRecordConnectionDisconnected___block_invoke;
  v6[3] = &unk_1E6201378;
  v6[4] = self;
  v6[5] = v4;
  dispatch_async(queue, v6);
}

void __54__CSAudioRecorder_remoteRecordConnectionDisconnected___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 136);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "audioRecorderDisconnected:", *(void *)(a1 + 32), (void)v10);
        }
        if (objc_opt_respondsToSelector()) {
          [v7 audioRecorderStreamHandleIdInvalidated:*(void *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  __int16 v9 = *(void **)(v8 + 48);
  *(void *)(v8 + 48) = 0;
}

- (void)remoteRecordLPCMBufferAvailable:(id)a3 streamHandleId:(unint64_t)a4
{
  uint64_t v6 = [(CSAudioRecorder *)self _compensateChannelDataIfNeeded:a3 receivedNumChannels:1];
  int v7 = v6;
  if (v6 && [v6 length])
  {
    id v8 = v7;
    if (+[CSConfig inputRecordingIsFloat])
    {
      uint64_t v9 = +[CSFLPCMTypeConverter convertToFloatLPCMBufFromShortLPCMBuf:v8];

      id v8 = (id)v9;
    }
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__CSAudioRecorder_remoteRecordLPCMBufferAvailable_streamHandleId___block_invoke;
    block[3] = &unk_1E6200148;
    id v13 = v8;
    unint64_t v14 = a4;
    block[4] = self;
    id v11 = v8;
    dispatch_async(queue, block);
  }
}

void __66__CSAudioRecorder_remoteRecordLPCMBufferAvailable_streamHandleId___block_invoke(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = *(id *)(a1[4] + 136);
  uint64_t v2 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v15;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v14 + 1) + 8 * v5);
        uint64_t v8 = a1[5];
        uint64_t v7 = a1[6];
        uint64_t v9 = a1[4];
        uint64_t v10 = mach_absolute_time();
        uint64_t v11 = mach_absolute_time();
        LODWORD(v12) = +[CSConfig inputRecordingNumberOfChannels];
        [v6 audioRecorderBufferAvailable:v9 audioStreamHandleId:v7 buffer:v8 remoteVAD:0 atTime:v10 arrivalTimestampToAudioRecorder:v11 numberOfChannels:v12];
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v3);
  }
}

- (void)remoteRecordDidStopRecordingWithWithStreamHandleId:(unint64_t)a3 error:(id)a4
{
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__CSAudioRecorder_remoteRecordDidStopRecordingWithWithStreamHandleId_error___block_invoke;
  v5[3] = &unk_1E6201378;
  v5[4] = self;
  v5[5] = a3;
  dispatch_async(queue, v5);
}

uint64_t __76__CSAudioRecorder_remoteRecordDidStopRecordingWithWithStreamHandleId_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _audioRecorderDidStopRecordingForReason:2 streamHandleID:*(void *)(a1 + 40)];
}

- (void)remoteRecordDidStartRecordingWithStreamHandleId:(unint64_t)a3 error:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__CSAudioRecorder_remoteRecordDidStartRecordingWithStreamHandleId_error___block_invoke;
  block[3] = &unk_1E6200148;
  id v10 = v6;
  uint64_t v11 = self;
  unint64_t v12 = a3;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __73__CSAudioRecorder_remoteRecordDidStartRecordingWithStreamHandleId_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_audioRecorderDidStartRecordingSuccessfully:streamHandleID:error:", *(void *)(a1 + 32) == 0, *(void *)(a1 + 48));
}

- (void)voiceControllerDidSetAudioSessionActive:(id)a3 isActivated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[CSAudioRecorder voiceControllerDidSetAudioSessionActive:isActivated:]";
    __int16 v12 = 1026;
    BOOL v13 = v4;
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s activate : %{public}d", buf, 0x12u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__CSAudioRecorder_voiceControllerDidSetAudioSessionActive_isActivated___block_invoke;
  v8[3] = &unk_1E61FFE00;
  v8[4] = self;
  BOOL v9 = v4;
  dispatch_async(queue, v8);
}

void __71__CSAudioRecorder_voiceControllerDidSetAudioSessionActive_isActivated___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 136);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "audioRecorder:didSetAudioSessionActive:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), (void)v9);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  [WeakRetained audioSessionEventProvidingDidSetAudioSessionActive:*(unsigned __int8 *)(a1 + 40)];
}

- (void)voiceControllerWillSetAudioSessionActive:(id)a3 willActivate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v11 = "-[CSAudioRecorder voiceControllerWillSetAudioSessionActive:willActivate:]";
    __int16 v12 = 1026;
    BOOL v13 = v4;
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s activate : %{public}d", buf, 0x12u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__CSAudioRecorder_voiceControllerWillSetAudioSessionActive_willActivate___block_invoke;
  v8[3] = &unk_1E61FFE00;
  v8[4] = self;
  BOOL v9 = v4;
  dispatch_async(queue, v8);
}

void __73__CSAudioRecorder_voiceControllerWillSetAudioSessionActive_willActivate___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 136);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "audioRecorder:willSetAudioSessionActive:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), (void)v9);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  [WeakRetained audioSessionEventProvidingWillSetAudioSessionActive:*(unsigned __int8 *)(a1 + 40)];
}

- (void)voiceControllerEndRecordInterruption:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[CSAudioRecorder voiceControllerEndRecordInterruption:]";
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CSAudioRecorder_voiceControllerEndRecordInterruption___block_invoke;
  block[3] = &unk_1E6201288;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __56__CSAudioRecorder_voiceControllerEndRecordInterruption___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 136);
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
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "audioRecorderEndRecordInterruption:", *(void *)(a1 + 32), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)voiceControllerBeginRecordInterruption:(id)a3 withContext:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v12 = "-[CSAudioRecorder voiceControllerBeginRecordInterruption:withContext:]";
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s withContext : %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__CSAudioRecorder_voiceControllerBeginRecordInterruption_withContext___block_invoke;
  v9[3] = &unk_1E6201030;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

void __70__CSAudioRecorder_voiceControllerBeginRecordInterruption_withContext___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 136);
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
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "audioRecorderBeginRecordInterruption:withContext:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)voiceControllerBeginRecordInterruption:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v8 = "-[CSAudioRecorder voiceControllerBeginRecordInterruption:]";
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CSAudioRecorder_voiceControllerBeginRecordInterruption___block_invoke;
  block[3] = &unk_1E6201288;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __58__CSAudioRecorder_voiceControllerBeginRecordInterruption___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 136);
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
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "audioRecorderBeginRecordInterruption:", *(void *)(a1 + 32), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)voiceControllerEncoderErrorDidOccur:(id)a3 error:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    long long v8 = [v5 localizedDescription];
    *(_DWORD *)buf = 136315394;
    id v14 = "-[CSAudioRecorder voiceControllerEncoderErrorDidOccur:error:]";
    __int16 v15 = 2114;
    long long v16 = v8;
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Encoder error : %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__CSAudioRecorder_voiceControllerEncoderErrorDidOccur_error___block_invoke;
  v11[3] = &unk_1E6201030;
  v11[4] = self;
  id v12 = v5;
  id v10 = v5;
  dispatch_async(queue, v11);
}

void __61__CSAudioRecorder_voiceControllerEncoderErrorDidOccur_error___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 136);
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
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "audioRecorderBuiltInAudioStreamInvalidated:error:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)voiceControllerDidFinishAlertPlayback:(id)a3 ofType:(int)a4 error:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  long long v8 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v15 = "-[CSAudioRecorder voiceControllerDidFinishAlertPlayback:ofType:error:]";
    __int16 v16 = 1026;
    int v17 = a4;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s type : %{public}d, error : %{public}@", buf, 0x1Cu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__CSAudioRecorder_voiceControllerDidFinishAlertPlayback_ofType_error___block_invoke;
  block[3] = &unk_1E61FF598;
  int v13 = a4;
  void block[4] = self;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __70__CSAudioRecorder_voiceControllerDidFinishAlertPlayback_ofType_error___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 136);
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
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "audioRecorderDidFinishAlertPlayback:ofType:error:", *(void *)(a1 + 32), *(unsigned int *)(a1 + 48), *(void *)(a1 + 40), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)voiceControllerRecordHardwareConfigurationDidChange:(id)a3 toConfiguration:(int)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v11 = "-[CSAudioRecorder voiceControllerRecordHardwareConfigurationDidChange:toConfiguration:]";
    __int16 v12 = 1026;
    int v13 = a4;
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s toConfiguration : %{public}d", buf, 0x12u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__CSAudioRecorder_voiceControllerRecordHardwareConfigurationDidChange_toConfiguration___block_invoke;
  v8[3] = &unk_1E61FF570;
  v8[4] = self;
  int v9 = a4;
  dispatch_async(queue, v8);
}

void __87__CSAudioRecorder_voiceControllerRecordHardwareConfigurationDidChange_toConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 136);
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
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "audioRecorderRecordHardwareConfigurationDidChange:toConfiguration:", *(void *)(a1 + 32), *(unsigned int *)(a1 + 40), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)voiceControllerStreamInvalidated:(id)a3 forStream:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v10 = "-[CSAudioRecorder voiceControllerStreamInvalidated:forStream:]";
    __int16 v11 = 2050;
    unint64_t v12 = a4;
    _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Received Stream Invalidated : %{public}llu", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__CSAudioRecorder_voiceControllerStreamInvalidated_forStream___block_invoke;
  v8[3] = &unk_1E6201378;
  v8[4] = self;
  void v8[5] = a4;
  dispatch_async(queue, v8);
}

void __62__CSAudioRecorder_voiceControllerStreamInvalidated_forStream___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 136);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "audioRecorderStreamHandleIdInvalidated:", *(void *)(a1 + 40), (void)v14);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  long long v8 = *(void **)(*(void *)(a1 + 32) + 56);
  long long v9 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  long long v10 = [v8 objectForKeyedSubscript:v9];

  [v10 setDelegate:0];
  uint64_t v11 = *(void *)(a1 + 40);
  unint64_t v12 = *(void **)(*(void *)(a1 + 32) + 56);
  uint64_t v13 = [NSNumber numberWithUnsignedInteger:v11];
  [v12 removeObjectForKey:v13];
}

- (void)voiceControllerDidStopRecording:(id)a3 forStream:(unint64_t)a4 forReason:(int64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v9 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v13 = "-[CSAudioRecorder voiceControllerDidStopRecording:forStream:forReason:]";
    __int16 v14 = 2050;
    id v15 = v8;
    __int16 v16 = 2050;
    unint64_t v17 = a4;
    __int16 v18 = 2050;
    int64_t v19 = a5;
    _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Received didStopRecording : %{public}p forStream:%{public}llu forReason:%{public}ld", buf, 0x2Au);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__CSAudioRecorder_voiceControllerDidStopRecording_forStream_forReason___block_invoke;
  block[3] = &unk_1E61FFE78;
  void block[4] = self;
  void block[5] = a5;
  block[6] = a4;
  dispatch_async(queue, block);
}

uint64_t __71__CSAudioRecorder_voiceControllerDidStopRecording_forStream_forReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _audioRecorderDidStopRecordingForReason:*(void *)(a1 + 40) streamHandleID:*(void *)(a1 + 48)];
}

- (void)voiceControllerAudioCallback:(id)a3 forStream:(unint64_t)a4 buffer:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  unint64_t v8 = voiceControllerAudioCallback_forStream_buffer__heartbeat;
  if (!(v8 % +[CSUtils loggingHeartbeatRate]))
  {
    long long v9 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      long long v10 = v9;
      int v11 = 136315906;
      unint64_t v12 = "-[CSAudioRecorder voiceControllerAudioCallback:forStream:buffer:]";
      __int16 v13 = 1026;
      int v14 = [v7 bytesDataSize];
      __int16 v15 = 2050;
      uint64_t v16 = voiceControllerAudioCallback_forStream_buffer__heartbeat;
      __int16 v17 = 2050;
      unint64_t v18 = a4;
      _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Received audio buffer %{public}d, heartbeat = %{public}llu, streamID (%{public}lu)", (uint8_t *)&v11, 0x26u);
    }
  }
  ++voiceControllerAudioCallback_forStream_buffer__heartbeat;
  if (*MEMORY[0x1E4F152C8] == a4 && +[CSUtils isExclaveHardware]) {
    -[CSAudioRecorder _processExclaveBufferCallbackFrom:hostTime:](self, "_processExclaveBufferCallbackFrom:hostTime:", a4, [v7 timeStamp]);
  }
  else {
    [(CSAudioRecorder *)self _processAudioBuffer:v7 audioStreamHandleId:a4 arrivalTimestampToAudioRecorder:mach_absolute_time()];
  }
}

- (void)voiceControllerDidStartRecording:(id)a3 forStream:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  unint64_t v12 = (void *)CSLogCategoryAudio;
  if (!v7)
  {
    if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    __int16 v13 = v12;
    int v14 = [v11 localizedDescription];
    *(_DWORD *)buf = 136316162;
    v22 = "-[CSAudioRecorder voiceControllerDidStartRecording:forStream:successfully:error:]";
    __int16 v23 = 2050;
    id v24 = v10;
    __int16 v25 = 2050;
    unint64_t v26 = a4;
    __int16 v27 = 1026;
    int v28 = 0;
    __int16 v29 = 2114;
    uint64_t v30 = v14;
    _os_log_error_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_ERROR, "%s Fail - Received didStartRecording : %{public}p, forStream:%{public}llu, successfully:%{public}d, error:%{public}@", buf, 0x30u);
    goto LABEL_4;
  }
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = v12;
    int v14 = [v11 localizedDescription];
    *(_DWORD *)buf = 136316162;
    v22 = "-[CSAudioRecorder voiceControllerDidStartRecording:forStream:successfully:error:]";
    __int16 v23 = 2050;
    id v24 = v10;
    __int16 v25 = 2050;
    unint64_t v26 = a4;
    __int16 v27 = 1026;
    int v28 = 1;
    __int16 v29 = 2114;
    uint64_t v30 = v14;
    _os_log_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_DEFAULT, "%s Received didStartRecording : %{public}p, forStream:%{public}llu, successfully:%{public}d, error:%{public}@", buf, 0x30u);
LABEL_4:
  }
LABEL_6:
  queue = self->_queue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __81__CSAudioRecorder_voiceControllerDidStartRecording_forStream_successfully_error___block_invoke;
  v17[3] = &unk_1E6200008;
  BOOL v20 = v7;
  id v18 = v11;
  unint64_t v19 = a4;
  v17[4] = self;
  id v16 = v11;
  dispatch_async(queue, v17);
}

uint64_t __81__CSAudioRecorder_voiceControllerDidStartRecording_forStream_successfully_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _audioRecorderDidStartRecordingSuccessfully:*(unsigned __int8 *)(a1 + 56) streamHandleID:*(void *)(a1 + 48) error:*(void *)(a1 + 40)];
}

- (void)exclaveRecordClientAudioBuffer:(id)a3 audioStreamHandleId:(unint64_t)a4 audioBuffer:(id)a5 hostTime:(unint64_t)a6
{
  id v9 = a5;
  id v10 = [(CSAudioRecorder *)self _compensateChannelDataIfNeeded:v9 receivedNumChannels:+[CSConfig exclaveRecordingNumChannels]];

  [(CSAudioRecorder *)self _processAudioChain:v10 audioStreamHandleId:a4 remoteVAD:0 atTime:a6 arrivalTimestampToAudioRecorder:mach_absolute_time() numberOfChannels:+[CSConfig inputRecordingNumberOfChannels]];
}

- (void)_audioRecorderDidStopRecordingForReason:(int64_t)a3 streamHandleID:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(CSAudioRecorder *)self _stopTrackingRemoteAccessoryStreamId:a4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v7 = self->_observers;
  uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        unint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "audioRecorderDidStopRecord:audioStreamHandleId:reason:", self, a4, a3, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  self->_waitingForDidStart = 0;
}

- (void)_audioRecorderDidStartRecordingSuccessfully:(BOOL)a3 streamHandleID:(unint64_t)a4 error:(id)a5
{
  BOOL v6 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = self->_observers;
  uint64_t v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
        long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v14, "audioRecorderDidStartRecord:audioStreamHandleId:successfully:error:", self, a4, v6, v8, (void)v15);
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }

  self->_waitingForDidStart = 0;
}

- (id)metrics
{
  id v2 = [(CSAudioRecorder *)self _getVoiceController];
  uint64_t v3 = [v2 metrics];

  return v3;
}

- (float)averagePowerForChannel:(unint64_t)a3
{
  return 0.0;
}

- (float)peakPowerForChannel:(unint64_t)a3
{
  return 0.0;
}

- (unint64_t)alertStartTime
{
  id v2 = [(CSAudioRecorder *)self _getVoiceController];
  unint64_t v3 = [v2 alertStartTime];

  return v3;
}

- (BOOL)playAlertSoundForType:(int64_t)a3 recordDevideIndicator:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v6 = [a4 shouldUseRemoteRecorder];
  if (a3 == 2 && v6 && [(CSRemoteRecordClient *)self->_remoteRecordClient didPlayEndpointBeep])
  {
    BOOL v7 = CSLogCategoryAudio;
    char v8 = 0;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      uint64_t v13 = "-[CSAudioRecorder playAlertSoundForType:recordDevideIndicator:]";
      _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Ignore playing endpoint beep(record stopped beep) since it already played beep in gibraltar", (uint8_t *)&v12, 0xCu);
      return 0;
    }
  }
  else
  {
    uint64_t v9 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      uint64_t v13 = "-[CSAudioRecorder playAlertSoundForType:recordDevideIndicator:]";
      __int16 v14 = 2050;
      int64_t v15 = a3;
      _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC playAlertSoundsForType : %{public}ld", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v10 = [(CSAudioRecorder *)self _getVoiceController];
    char v8 = [v10 playAlertSoundForType:a3 overrideMode:-1];
  }
  return v8;
}

- (BOOL)playAlertSoundForType:(int64_t)a3 overrideMode:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v7 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    uint64_t v13 = "-[CSAudioRecorder playAlertSoundForType:overrideMode:]";
    __int16 v14 = 2048;
    int64_t v15 = a3;
    __int16 v16 = 2048;
    int64_t v17 = a4;
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC playAlertSoundForType to play %ld alert with override %ld", (uint8_t *)&v12, 0x20u);
  }
  int64_t v8 = +[CSAudioStartStreamOption avvcAlertOverrideType:a4];
  uint64_t v9 = [(CSAudioRecorder *)self _getVoiceController];
  char v10 = [v9 playAlertSoundForType:a3 overrideMode:v8];

  return v10;
}

- (BOOL)playRecordStartingAlertAndResetEndpointerFromStream:(unint64_t)a3 withAlertOverride:(int64_t)a4
{
  return [(CSAudioRecorder *)self playAlertSoundForType:1 overrideMode:a4];
}

- (BOOL)setAlertSoundFromURL:(id)a3 forType:(int64_t)a4 force:(BOOL)a5
{
  id v8 = a3;
  if (a5) {
    goto LABEL_4;
  }
  hasSetAlertDictionary = self->_hasSetAlertDictionary;
  char v10 = [NSNumber numberWithInteger:a4];
  uint64_t v11 = [(NSMutableDictionary *)hasSetAlertDictionary objectForKeyedSubscript:v10];
  char v12 = [v11 BOOLValue];

  if ((v12 & 1) == 0)
  {
LABEL_4:
    __int16 v14 = self->_hasSetAlertDictionary;
    int64_t v15 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v14 setObject:MEMORY[0x1E4F1CC38] forKey:v15];

    __int16 v16 = [(CSAudioRecorder *)self _getVoiceController];
    char v13 = [v16 setAlertSoundFromURL:v8 forType:a4];
  }
  else
  {
    char v13 = 1;
  }

  return v13;
}

- (BOOL)_audioIsFromRemoteAccessory:(unint64_t)a3
{
  remoteAccessoryStreamIdSet = self->_remoteAccessoryStreamIdSet;
  if (!remoteAccessoryStreamIdSet) {
    return 0;
  }
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  char v5 = [(NSMutableSet *)remoteAccessoryStreamIdSet containsObject:v4];

  return v5;
}

- (void)_stopTrackingRemoteAccessoryStreamId:(unint64_t)a3
{
  remoteAccessoryStreamIdSet = self->_remoteAccessoryStreamIdSet;
  if (remoteAccessoryStreamIdSet)
  {
    int v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    int v7 = [(NSMutableSet *)remoteAccessoryStreamIdSet containsObject:v6];

    if (v7)
    {
      id v8 = self->_remoteAccessoryStreamIdSet;
      id v9 = [NSNumber numberWithUnsignedInteger:a3];
      [(NSMutableSet *)v8 removeObject:v9];
    }
  }
}

- (void)_trackRemoteAccessoryStreamIdIfNeeded:(id)a3
{
  id v3 = a3;
}

- (void)audioDecoderDidDecodePackets:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 timestamp:(unint64_t)a7 arrivalTimestampToAudioRecorder:(unint64_t)a8 wasBuffered:(BOOL)a9 receivedNumChannels:(unsigned int)a10
{
  id v15 = a5;
  id v16 = a6;
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (CSIsHorseman_isHorseman)
  {
    id v17 = v15;
    unsigned int v18 = 1;
  }
  else
  {
    unsigned int v18 = +[CSConfig inputRecordingNumberOfChannels];
    id v17 = [(CSAudioRecorder *)self _compensateChannelDataIfNeeded:v15 receivedNumChannels:a10];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __159__CSAudioRecorder_audioDecoderDidDecodePackets_audioStreamHandleId_buffer_remoteVAD_timestamp_arrivalTimestampToAudioRecorder_wasBuffered_receivedNumChannels___block_invoke;
  block[3] = &unk_1E61FF548;
  void block[4] = self;
  id v23 = v17;
  id v24 = v16;
  unint64_t v25 = a4;
  unint64_t v26 = a7;
  unint64_t v27 = a8;
  unsigned int v28 = v18;
  id v20 = v16;
  id v21 = v17;
  dispatch_async(queue, block);
}

void __159__CSAudioRecorder_audioDecoderDidDecodePackets_audioStreamHandleId_buffer_remoteVAD_timestamp_arrivalTimestampToAudioRecorder_wasBuffered_receivedNumChannels___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 136);
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
        LODWORD(v7) = *(_DWORD *)(a1 + 80);
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) audioRecorderBufferAvailable:*(void *)(a1 + 32) audioStreamHandleId:*(void *)(a1 + 56) buffer:*(void *)(a1 + 40) remoteVAD:*(void *)(a1 + 48) atTime:*(void *)(a1 + 64) arrivalTimestampToAudioRecorder:*(void *)(a1 + 72) numberOfChannels:v7];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)_compensateChannelDataIfNeeded:(id)a3 receivedNumChannels:(unsigned int)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (+[CSConfig inputRecordingNumberOfChannels] <= a4)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithLength:", objc_msgSend(v5, "length")/ (unint64_t)a4* +[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels"));
    unsigned int v7 = +[CSConfig inputRecordingNumberOfChannels];
    unint64_t v8 = _compensateChannelDataIfNeeded_receivedNumChannels__heartbeat;
    if (!(v8 % +[CSUtils loggingHeartbeatRate]))
    {
      long long v9 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315650;
        char v12 = "-[CSAudioRecorder _compensateChannelDataIfNeeded:receivedNumChannels:]";
        __int16 v13 = 1026;
        unsigned int v14 = v7 - a4;
        __int16 v15 = 2050;
        uint64_t v16 = _compensateChannelDataIfNeeded_receivedNumChannels__heartbeat;
        _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Compensating %{public}u channel(s), heartbeat = %{public}lld", (uint8_t *)&v11, 0x1Cu);
      }
    }
    ++_compensateChannelDataIfNeeded_receivedNumChannels__heartbeat;
    objc_msgSend(v6, "replaceBytesInRange:withBytes:", 0, objc_msgSend(v5, "length"), objc_msgSend(v5, "bytes"));
  }

  return v6;
}

- (void)_processAudioBuffer:(id)a3 audioStreamHandleId:(unint64_t)a4 arrivalTimestampToAudioRecorder:(unint64_t)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v9 = (void *)MEMORY[0x1BA9E7330]();
  int v10 = *(_DWORD *)([v8 streamDescription] + 8);
  if (v10 == 1869641075)
  {
    int v13 = [v8 channels];
    int v14 = [v8 packetDescriptionCount];
    int v15 = [v8 bytesDataSize];
    unsigned int v16 = v15;
    if (v14 >= 1 && v15 >= 1 && v13 > 0)
    {
      unint64_t v42 = a4;
      unint64_t v43 = a5;
      uint64_t v17 = _processAudioBuffer_audioStreamHandleId_arrivalTimestampToAudioRecorder__heartbeat_135;
      v41 = self;
      if (__ROR8__(0xCCCCCCCCCCCCCCCDLL* _processAudioBuffer_audioStreamHandleId_arrivalTimestampToAudioRecorder__heartbeat_135, 2) <= 0xCCCCCCCCCCCCCCCuLL)
      {
        unsigned int v18 = CSLogCategoryAudio;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v47 = "-[CSAudioRecorder _processAudioBuffer:audioStreamHandleId:arrivalTimestampToAudioRecorder:]";
          __int16 v48 = 1026;
          int v49 = v14;
          _os_log_impl(&dword_1BA1A5000, v18, OS_LOG_TYPE_INFO, "%s packets count %{public}d", buf, 0x12u);
          uint64_t v17 = _processAudioBuffer_audioStreamHandleId_arrivalTimestampToAudioRecorder__heartbeat_135;
        }
      }
      _processAudioBuffer_audioStreamHandleId_arrivalTimestampToAudioRecorder__heartbeat_135 = v17 + 1;
      uint64_t v19 = v14;
      int v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v14];
      uint64_t v20 = [v8 data];
      uint64_t v21 = 0;
      while (1)
      {
        uint64_t v22 = [v8 packetDescriptions];
        unsigned int v23 = *(_DWORD *)(v22 + v21 + 12);
        if (v23 > v16) {
          break;
        }
        id v24 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v20 + *(void *)(v22 + v21) length:v23 / v13];
        [v11 addObject:v24];

        v21 += 16;
        if (!--v19) {
          goto LABEL_23;
        }
      }
      uint64_t v30 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v47 = "-[CSAudioRecorder _processAudioBuffer:audioStreamHandleId:arrivalTimestampToAudioRecorder:]";
        __int16 v48 = 1026;
        int v49 = v23;
        _os_log_error_impl(&dword_1BA1A5000, v30, OS_LOG_TYPE_ERROR, "%s Bad packet length %{public}d. Skipping rest of record buffer.", buf, 0x12u);
      }
LABEL_23:
      opusDecoders = v41->_opusDecoders;
      v32 = [NSNumber numberWithUnsignedInteger:a4];
      __int16 v33 = [(NSMutableDictionary *)opusDecoders objectForKeyedSubscript:v32];

      if (v33)
      {
        unint64_t v34 = v41->_opusDecoders;
        __int16 v35 = [NSNumber numberWithUnsignedInteger:a4];
        char v12 = [(NSMutableDictionary *)v34 objectForKeyedSubscript:v35];
      }
      else
      {
        v36 = [CSAudioDecoder alloc];
        +[CSFAudioStreamBasicDescriptionFactory opusASBD];
        +[CSFAudioStreamBasicDescriptionFactory lpcmInt16ASBD];
        char v12 = [(CSAudioDecoder *)v36 initWithInASBD:v45 outASBD:v44];
        [(CSAudioDecoder *)v12 setDelegate:v41];
        uint64_t v37 = v41->_opusDecoders;
        __int16 v35 = [NSNumber numberWithUnsignedInteger:a4];
        [(NSMutableDictionary *)v37 setObject:v12 forKey:v35];
      }

      uint64_t v38 = mach_absolute_time();
      v39 = [v8 remoteVoiceActivityVADBuffer];
      LODWORD(v40) = *(_DWORD *)([v8 streamDescription] + 28);
      [(CSAudioDecoder *)v12 addPackets:v11 audioStreamHandleId:v42 remoteVAD:v39 timestamp:v38 arrivalTimestampToAudioRecorder:v43 wasBuffered:0 receivedNumChannels:v40];

      goto LABEL_27;
    }
    uint64_t v29 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v47 = "-[CSAudioRecorder _processAudioBuffer:audioStreamHandleId:arrivalTimestampToAudioRecorder:]";
      __int16 v48 = 1026;
      int v49 = v14;
      __int16 v50 = 1026;
      unsigned int v51 = v16;
      __int16 v52 = 1026;
      int v53 = v13;
      unint64_t v26 = "%s AVVCAudioBuffer contains %{public}d packet descriptions, size %{public}d, channels %{public}d. Ignoring";
      unint64_t v27 = v29;
      uint32_t v28 = 30;
      goto LABEL_20;
    }
  }
  else
  {
    if (v10 == 1819304813)
    {
      int v11 = -[CSReusableBufferPool dataWithBytes:length:](self->_audioBufferPool, "dataWithBytes:length:", [v8 data], (int)objc_msgSend(v8, "bytesDataSize"));
      if (!v11) {
        int v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9B8]), "initWithBytes:length:", objc_msgSend(v8, "data"), (int)objc_msgSend(v8, "bytesDataSize"));
      }
      -[CSAudioRecorder _compensateChannelDataIfNeeded:receivedNumChannels:](self, "_compensateChannelDataIfNeeded:receivedNumChannels:", v11, *(unsigned int *)([v8 streamDescription] + 28));
      char v12 = (CSAudioDecoder *)objc_claimAutoreleasedReturnValue();
      -[CSAudioRecorder _processAudioChain:audioStreamHandleId:remoteVAD:atTime:arrivalTimestampToAudioRecorder:numberOfChannels:](self, "_processAudioChain:audioStreamHandleId:remoteVAD:atTime:arrivalTimestampToAudioRecorder:numberOfChannels:", v12, a4, 0, [v8 timeStamp], a5, +[CSConfig inputRecordingNumberOfChannels](CSConfig, "inputRecordingNumberOfChannels"));
LABEL_27:

      goto LABEL_28;
    }
    uint64_t v25 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v47 = "-[CSAudioRecorder _processAudioBuffer:audioStreamHandleId:arrivalTimestampToAudioRecorder:]";
      __int16 v48 = 1026;
      int v49 = v10;
      unint64_t v26 = "%s Cannot handle audio buffer : unexpected format(%{public}u)";
      unint64_t v27 = v25;
      uint32_t v28 = 18;
LABEL_20:
      _os_log_error_impl(&dword_1BA1A5000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
    }
  }
LABEL_28:
}

- (void)_processExclaveBufferCallbackFrom:(unint64_t)a3 hostTime:(unint64_t)a4
{
  if ([(CSExclaveAudioProviding *)self->_exclaveAudioClient fetchAndStoreAudioBuffer])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__CSAudioRecorder__processExclaveBufferCallbackFrom_hostTime___block_invoke;
    block[3] = &unk_1E61FFE78;
    void block[4] = self;
    void block[5] = a3;
    block[6] = a4;
    dispatch_async(queue, block);
  }
}

void __62__CSAudioRecorder__processExclaveBufferCallbackFrom_hostTime___block_invoke(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1[4] + 136);
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
        unsigned int v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "audioRecorderExclaveBufferAvailable:audioStreamHandleId:hostTime:arrivalTimestampToAudioRecorder:", a1[4], a1[5], a1[6], mach_absolute_time(), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_processAudioChain:(id)a3 audioStreamHandleId:(unint64_t)a4 remoteVAD:(id)a5 atTime:(unint64_t)a6 arrivalTimestampToAudioRecorder:(unint64_t)a7 numberOfChannels:(int)a8
{
  id v14 = a3;
  id v15 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __124__CSAudioRecorder__processAudioChain_audioStreamHandleId_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke;
  block[3] = &unk_1E61FF548;
  void block[4] = self;
  id v20 = v14;
  id v21 = v15;
  unint64_t v22 = a4;
  unint64_t v23 = a6;
  unint64_t v24 = a7;
  int v25 = a8;
  id v17 = v15;
  id v18 = v14;
  dispatch_async(queue, block);
}

void __124__CSAudioRecorder__processAudioChain_audioStreamHandleId_remoteVAD_atTime_arrivalTimestampToAudioRecorder_numberOfChannels___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 136);
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
        LODWORD(v7) = *(_DWORD *)(a1 + 80);
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) audioRecorderBufferAvailable:*(void *)(a1 + 32) audioStreamHandleId:*(void *)(a1 + 56) buffer:*(void *)(a1 + 40) remoteVAD:*(void *)(a1 + 48) atTime:*(void *)(a1 + 64) arrivalTimestampToAudioRecorder:*(void *)(a1 + 72) numberOfChannels:v7];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (unint64_t)sensorStop
{
  return [(CSExclaveAudioProviding *)self->_exclaveAudioClient stopSensor];
}

- (unint64_t)sensorStart
{
  return [(CSExclaveAudioProviding *)self->_exclaveAudioClient startSensor];
}

- (BOOL)clearListeningMicIndicatorProperty
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (+[CSUtils isExclaveHardware]) {
    [(CSAudioRecorder *)self sensorStop];
  }
  uint64_t v3 = [MEMORY[0x1E4F153D8] sharedInstance];
  id v10 = 0;
  char v4 = [v3 setMXSessionProperty:@"MicrophoneAttribution" value:MEMORY[0x1E4F1CC28] error:&v10];
  id v5 = v10;

  uint64_t v6 = CSLogCategoryAudio;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      char v12 = "-[CSAudioRecorder clearListeningMicIndicatorProperty]";
      _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s success", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    long long v8 = v6;
    long long v9 = [v5 localizedDescription];
    *(_DWORD *)buf = 136315394;
    char v12 = "-[CSAudioRecorder clearListeningMicIndicatorProperty]";
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_error_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_ERROR, "%s Failed to clear listening mic indicator lock property : %@", buf, 0x16u);
  }
  return v4;
}

- (BOOL)setListeningMicIndicatorProperty
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (+[CSUtils isExclaveHardware])
  {
    unint64_t v3 = [(CSAudioRecorder *)self sensorStart];
    char v4 = +[CSFSensorControlSelfLogger sharedLogger];
    [v4 logSensorControlStartWithStatus:v3 withMHUUID:0];
  }
  id v5 = [MEMORY[0x1E4F153D8] sharedInstance];
  id v12 = 0;
  char v6 = [v5 setMXSessionProperty:@"MicrophoneAttribution" value:MEMORY[0x1E4F1CC38] error:&v12];
  id v7 = v12;

  long long v8 = CSLogCategoryAudio;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[CSAudioRecorder setListeningMicIndicatorProperty]";
      _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s success", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    id v10 = v8;
    long long v11 = [v7 localizedDescription];
    *(_DWORD *)buf = 136315394;
    id v14 = "-[CSAudioRecorder setListeningMicIndicatorProperty]";
    __int16 v15 = 2112;
    unsigned int v16 = v11;
    _os_log_error_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_ERROR, "%s Failed to set listening mic indicator lock property : %@", buf, 0x16u);
  }
  return v6;
}

- (BOOL)_shouldUseRemoteBuiltInMic:(id)a3
{
  if (!a3) {
    return 0;
  }
  unint64_t v3 = [a3 objectForKeyedSubscript:@"useRemoteBuiltInMic"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)_updateLanguageCodeForRemoteVTEIResult:(id)a3
{
  unint64_t v3 = (void *)[a3 mutableCopy];
  return v3;
}

- (BOOL)isDuckingSupportedOnCurrentRouteWithStreamHandleID:(unint64_t)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  char v6 = [(CSAudioRecorder *)self _getVoiceController];
  id v7 = v6;
  if (v6)
  {
    id v14 = 0;
    int v8 = [v6 isDuckingSupportedOnPickedRouteForStream:a3 error:&v14];
    id v9 = v14;
    id v10 = v9;
    if (v9)
    {
      if (a4) {
        *a4 = v9;
      }
    }
    else
    {
      long long v11 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = @"is not";
        unsigned int v16 = "-[CSAudioRecorder isDuckingSupportedOnCurrentRouteWithStreamHandleID:error:]";
        *(_DWORD *)buf = 136315650;
        if (v8) {
          id v12 = @"is";
        }
        __int16 v17 = 2114;
        id v18 = v12;
        __int16 v19 = 2050;
        unint64_t v20 = a3;
        _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Ducking %{public}@ supported on current route with streamId: %{public}ld", buf, 0x20u);
      }
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)fetchGibraltarVoiceTriggerInfoWithRecordDeviceIndicator:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 shouldUseRemoteRecorder])
  {
    id v5 = [v4 deviceId];
    char v6 = -[CSAudioRecorder _fetchRemoteRecordClientWithDeviceId:streamHandleId:](self, "_fetchRemoteRecordClientWithDeviceId:streamHandleId:", v5, [v4 streamHandleId]);

    [v6 waitingForConnection:0 error:3.0];
    id v7 = [v6 voiceTriggerEventInfo];
    int v8 = [(CSAudioRecorder *)self _updateLanguageCodeForRemoteVTEIResult:v7];

    if (v8) {
      goto LABEL_9;
    }
  }
  else
  {
    id v9 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_FAULT))
    {
      int v12 = 136315138;
      __int16 v13 = "-[CSAudioRecorder fetchGibraltarVoiceTriggerInfoWithRecordDeviceIndicator:]";
      _os_log_fault_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_FAULT, "%s Not using remoteRecorder. Deprecated use of voiceTriggerInfo from AVVC", (uint8_t *)&v12, 0xCu);
    }
  }
  id v10 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    int v12 = 136315138;
    __int16 v13 = "-[CSAudioRecorder fetchGibraltarVoiceTriggerInfoWithRecordDeviceIndicator:]";
    _os_log_error_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_ERROR, "%s VoiceTriggerInfo is nil from AVVC", (uint8_t *)&v12, 0xCu);
  }
  int v8 = 0;
LABEL_9:

  return v8;
}

- (id)getPlaybackRouteForStreamID:(unint64_t)a3
{
  id v4 = [(CSAudioRecorder *)self _getVoiceController];
  id v5 = [v4 getPlaybackRouteForStream:a3 withError:0];

  return v5;
}

- (void)configureAlertBehavior:(id)a3 audioStreamHandleId:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  int v8 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint32_t v28 = "-[CSAudioRecorder configureAlertBehavior:audioStreamHandleId:]";
    __int16 v29 = 2114;
    id v30 = v6;
    _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F154A8]) initWithStreamID:a4];
  id v10 = [v6 objectForKeyedSubscript:&unk_1F13B8200];

  if (v10)
  {
    long long v11 = [v6 objectForKeyedSubscript:&unk_1F13B8200];
    objc_msgSend(v9, "setStartAlert:", objc_msgSend(v11, "integerValue"));
  }
  int v12 = [v6 objectForKeyedSubscript:&unk_1F13B8218];

  if (v12)
  {
    __int16 v13 = [v6 objectForKeyedSubscript:&unk_1F13B8218];
    objc_msgSend(v9, "setStopAlert:", objc_msgSend(v13, "integerValue"));
  }
  uint64_t v14 = [v6 objectForKeyedSubscript:&unk_1F13B8230];

  if (v14)
  {
    __int16 v15 = [v6 objectForKeyedSubscript:&unk_1F13B8230];
    objc_msgSend(v9, "setStopOnErrorAlert:", objc_msgSend(v15, "integerValue"));
  }
  unsigned int v16 = [(CSAudioRecorder *)self _getVoiceController];
  id v26 = 0;
  char v17 = [v16 configureAlertBehaviorForStream:v9 error:&v26];
  id v18 = v26;

  if ((v17 & 1) == 0)
  {
    __int16 v19 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      unint64_t v24 = v19;
      int v25 = [v18 localizedDescription];
      *(_DWORD *)buf = 136315394;
      uint32_t v28 = "-[CSAudioRecorder configureAlertBehavior:audioStreamHandleId:]";
      __int16 v29 = 2114;
      id v30 = v25;
      _os_log_error_impl(&dword_1BA1A5000, v24, OS_LOG_TYPE_ERROR, "%s Failed to configureAlertBehaviorForStream : %{public}@", buf, 0x16u);
    }
  }
  unint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v21 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v22 = v21;
    [v20 timeIntervalSinceDate:v7];
    *(_DWORD *)buf = 136315394;
    uint32_t v28 = "-[CSAudioRecorder configureAlertBehavior:audioStreamHandleId:]";
    __int16 v29 = 2050;
    id v30 = v23;
    _os_log_impl(&dword_1BA1A5000, v22, OS_LOG_TYPE_DEFAULT, "%s configureAlertBehavior elapsed time = %{public}lf", buf, 0x16u);
  }
}

- (void)enableMiniDucking:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  if (CSIsHorseman_onceToken != -1) {
    dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
  }
  if (!CSIsHorseman_isHorseman)
  {
    id v6 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = @"Disable";
      if (v3) {
        id v7 = @"Enable";
      }
      int v13 = 136315394;
      uint64_t v14 = "-[CSAudioRecorder enableMiniDucking:]";
      __int16 v15 = 2114;
      unsigned int v16 = v7;
      _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s %{public}@ miniDucking now", (uint8_t *)&v13, 0x16u);
    }
    int v8 = [(CSAudioRecorder *)self _getVoiceController];
    [v8 enableMiniDucking:v3];
  }
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  id v10 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    long long v11 = v10;
    [v9 timeIntervalSinceDate:v5];
    int v13 = 136315394;
    uint64_t v14 = "-[CSAudioRecorder enableMiniDucking:]";
    __int16 v15 = 2050;
    unsigned int v16 = v12;
    _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s enableMiniDucking elapsed time = %{public}lf", (uint8_t *)&v13, 0x16u);
  }
}

- (BOOL)setEnableInterruptionByRecordingClientsForStream:(unint64_t)a3 enable:(BOOL)a4
{
  BOOL v4 = a4;
  *(void *)&v24[5] = *MEMORY[0x1E4F143B8];
  id v7 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    unint64_t v22 = "-[CSAudioRecorder setEnableInterruptionByRecordingClientsForStream:enable:]";
    __int16 v23 = 1024;
    *(_DWORD *)unint64_t v24 = a3;
    v24[2] = 1024;
    *(_DWORD *)&v24[3] = v4;
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC setEnableInterruptionByRecordingClientsForStream(%d) for enable(%d)", buf, 0x18u);
  }
  int v8 = [MEMORY[0x1E4F1C9C8] date];
  id v9 = [(CSAudioRecorder *)self _getVoiceController];
  id v20 = 0;
  char v10 = [v9 setEnableInterruptionByRecordingClientsForStream:a3 enable:v4 error:&v20];
  id v11 = v20;
  if (v4 && (v10 & 1) == 0)
  {
    int v12 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      id v18 = v12;
      __int16 v19 = [v11 localizedDescription];
      *(_DWORD *)buf = 136315394;
      unint64_t v22 = "-[CSAudioRecorder setEnableInterruptionByRecordingClientsForStream:enable:]";
      __int16 v23 = 2114;
      *(void *)unint64_t v24 = v19;
      _os_log_error_impl(&dword_1BA1A5000, v18, OS_LOG_TYPE_ERROR, "%s Failed to setEnableInterruptionByRecordingClientsForStream : %{public}@", buf, 0x16u);
    }
  }
  int v13 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v14 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = v14;
    [v13 timeIntervalSinceDate:v8];
    *(_DWORD *)buf = 136315394;
    unint64_t v22 = "-[CSAudioRecorder setEnableInterruptionByRecordingClientsForStream:enable:]";
    __int16 v23 = 2050;
    *(void *)unint64_t v24 = v16;
    _os_log_impl(&dword_1BA1A5000, v15, OS_LOG_TYPE_DEFAULT, "%s setEnableInterruptionByRecordingClientsForStream elapsed time = %{public}lf", buf, 0x16u);
  }
  return v10;
}

- (void)setDuckMixWithOthersForStream:(unint64_t)a3 duckOthers:(BOOL)a4 duckToLevelInDB:(id)a5 mixWithOthers:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  char v10 = (objc_class *)MEMORY[0x1E4F154C8];
  id v11 = a5;
  id v12 = objc_alloc_init(v10);
  id v13 = objc_alloc(MEMORY[0x1E4F154C0]);
  uint64_t v14 = [NSNumber numberWithBool:v7];
  __int16 v15 = [NSNumber numberWithBool:v6];
  uint64_t v16 = (void *)[v13 initWithDuckOthers:v14 duckToLevel:v11 mixWithOthers:v15];

  if (v11) {
    [v16 setIsBlur:1];
  }
  [v12 setDuckOverride:v16];
  uint64_t v17 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v31 = "-[CSAudioRecorder setDuckMixWithOthersForStream:duckOthers:duckToLevelInDB:mixWithOthers:]";
    __int16 v32 = 1024;
    LODWORD(v33) = a3;
    _os_log_impl(&dword_1BA1A5000, v17, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC setDuckOthersForStream(%d) for DuckOthers/MixWithOthers", buf, 0x12u);
  }
  id v18 = [MEMORY[0x1E4F1C9C8] date];
  __int16 v19 = [(CSAudioRecorder *)self _getVoiceController];
  id v29 = 0;
  char v20 = [v19 setDuckOthersForStream:a3 withSettings:v12 error:&v29];
  id v21 = v29;

  if ((v20 & 1) == 0)
  {
    unint64_t v22 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      unint64_t v27 = v22;
      uint32_t v28 = [v21 localizedDescription];
      *(_DWORD *)buf = 136315394;
      uint64_t v31 = "-[CSAudioRecorder setDuckMixWithOthersForStream:duckOthers:duckToLevelInDB:mixWithOthers:]";
      __int16 v32 = 2114;
      __int16 v33 = v28;
      _os_log_error_impl(&dword_1BA1A5000, v27, OS_LOG_TYPE_ERROR, "%s Failed to setDuckOthersForStream : %{public}@", buf, 0x16u);
    }
  }
  __int16 v23 = [MEMORY[0x1E4F1C9C8] date];
  unint64_t v24 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = v24;
    [v23 timeIntervalSinceDate:v18];
    *(_DWORD *)buf = 136315394;
    uint64_t v31 = "-[CSAudioRecorder setDuckMixWithOthersForStream:duckOthers:duckToLevelInDB:mixWithOthers:]";
    __int16 v32 = 2050;
    __int16 v33 = v26;
    _os_log_impl(&dword_1BA1A5000, v25, OS_LOG_TYPE_DEFAULT, "%s setDuckOthersForStream elapsed time = %{public}lf", buf, 0x16u);
  }
}

- (void)enableSmartRoutingConsiderationForStream:(unint64_t)a3 enable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v7 = CSLogCategoryAudio;
  BOOL v8 = os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v8) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315138;
    __int16 v23 = "-[CSAudioRecorder enableSmartRoutingConsiderationForStream:enable:]";
    id v9 = "%s Calling AVVC : Enable Smart Routing Consideration";
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315138;
    __int16 v23 = "-[CSAudioRecorder enableSmartRoutingConsiderationForStream:enable:]";
    id v9 = "%s Calling AVVC : Disable Smart Routing Consideration";
  }
  _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
LABEL_7:
  char v10 = [MEMORY[0x1E4F1C9C8] date];
  id v11 = [(CSAudioRecorder *)self _getVoiceController];
  id v21 = 0;
  char v12 = [v11 enableSmartRoutingConsiderationForStream:a3 enable:v4 error:&v21];
  id v13 = v21;

  uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
  __int16 v15 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = v15;
    [v14 timeIntervalSinceDate:v10];
    *(_DWORD *)buf = 136315394;
    __int16 v23 = "-[CSAudioRecorder enableSmartRoutingConsiderationForStream:enable:]";
    __int16 v24 = 2050;
    int v25 = v17;
    _os_log_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_DEFAULT, "%s enableSmartRoutingConsiderationForStream elapsed time = %{public}lf", buf, 0x16u);
  }
  if ((v12 & 1) == 0)
  {
    id v18 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      __int16 v19 = v18;
      char v20 = [v13 localizedDescription];
      *(_DWORD *)buf = 136315394;
      __int16 v23 = "-[CSAudioRecorder enableSmartRoutingConsiderationForStream:enable:]";
      __int16 v24 = 2114;
      int v25 = v20;
      _os_log_error_impl(&dword_1BA1A5000, v19, OS_LOG_TYPE_ERROR, "%s Fail to setSmartRoutingConsideration : %{public}@", buf, 0x16u);
    }
  }
}

- (BOOL)deactivateAudioSession:(unint64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  *(void *)&v20[13] = *MEMORY[0x1E4F143B8];
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  char v10 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315650;
    id v18 = "-[CSAudioRecorder deactivateAudioSession:streamHandleId:error:]";
    __int16 v19 = 1024;
    *(_DWORD *)char v20 = a4;
    v20[2] = 2050;
    *(void *)&v20[3] = a3;
    _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC setSessionActivate for deactivation for stream %d: %{public}tu", (uint8_t *)&v17, 0x1Cu);
  }
  id v11 = [(CSAudioRecorder *)self _getVoiceController];
  objc_msgSend(v11, "deactivateAudioSessionForStream:withOptions:error:", a4, +[CSAudioRecorder _convertDeactivateOption:](CSAudioRecorder, "_convertDeactivateOption:", a3), a5);

  self->_waitingForDidStart = 0;
  char v12 = [MEMORY[0x1E4F1C9C8] date];
  id v13 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = v13;
    [v12 timeIntervalSinceDate:v9];
    int v17 = 136315394;
    id v18 = "-[CSAudioRecorder deactivateAudioSession:streamHandleId:error:]";
    __int16 v19 = 2050;
    *(void *)char v20 = v15;
    _os_log_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_DEFAULT, "%s setSessionActivate elapsed time = %{public}lf", (uint8_t *)&v17, 0x16u);
  }
  return 1;
}

- (BOOL)deactivateAudioSession:(unint64_t)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v6 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", a3, a4);
  BOOL v7 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    uint64_t v15 = "-[CSAudioRecorder deactivateAudioSession:error:]";
    __int16 v16 = 2050;
    unint64_t v17 = a3;
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC setSessionActivate for deactivation : %{public}tu", (uint8_t *)&v14, 0x16u);
  }
  BOOL v8 = [(CSAudioRecorder *)self _getVoiceController];
  objc_msgSend(v8, "deactivateAudioSessionWithOptions:", +[CSAudioRecorder _convertDeactivateOption:](CSAudioRecorder, "_convertDeactivateOption:", a3));

  self->_waitingForDidStart = 0;
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  char v10 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    [v9 timeIntervalSinceDate:v6];
    int v14 = 136315394;
    uint64_t v15 = "-[CSAudioRecorder deactivateAudioSession:error:]";
    __int16 v16 = 2050;
    unint64_t v17 = v12;
    _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s setSessionActivate elapsed time = %{public}lf", (uint8_t *)&v14, 0x16u);
  }
  return 1;
}

- (BOOL)activateAudioSessionWithReason:(unint64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  char v10 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v31 = "-[CSAudioRecorder activateAudioSessionWithReason:streamHandleId:error:]";
    __int16 v32 = 2050;
    unint64_t v33 = a4;
    _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC setSessionActivate for activation with streamId(%{public}lu)", buf, 0x16u);
  }
  id v11 = [(CSAudioRecorder *)self _getVoiceController];
  unint64_t v12 = v11;
  if (a3 == 2)
  {
    id v29 = 0;
    char v13 = [v11 activateAudioSessionForStream:a4 isPrewarm:0 recordMode:1 error:&v29];
    int v14 = v29;
  }
  else
  {
    uint32_t v28 = 0;
    char v13 = [v11 activateAudioSessionForStream:a4 isPrewarm:0 recordMode:0 error:&v28];
    int v14 = v28;
  }
  id v15 = v14;

  if (v13)
  {
    __int16 v16 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v31 = "-[CSAudioRecorder activateAudioSessionWithReason:streamHandleId:error:]";
      _os_log_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_DEFAULT, "%s AVVC successfully activated audioSession", buf, 0xCu);
    }
    BOOL v17 = 1;
    if (!a5) {
      goto LABEL_19;
    }
LABEL_18:
    *a5 = v15;
    goto LABEL_19;
  }
  uint64_t v18 = [v15 domain];
  if ([v18 isEqualToString:*MEMORY[0x1E4F28760]])
  {
    uint64_t v19 = [v15 code];

    if (v19 != 561017449) {
      goto LABEL_15;
    }
    uint64_t v18 = +[CSDiagnosticReporter sharedInstance];
    [v18 submitAudioIssueReport:@"InsufficientPriority"];
  }

LABEL_15:
  char v20 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    uint64_t v26 = v20;
    unint64_t v27 = [v15 localizedDescription];
    *(_DWORD *)buf = 136315394;
    uint64_t v31 = "-[CSAudioRecorder activateAudioSessionWithReason:streamHandleId:error:]";
    __int16 v32 = 2114;
    unint64_t v33 = (unint64_t)v27;
    _os_log_error_impl(&dword_1BA1A5000, v26, OS_LOG_TYPE_ERROR, "%s AVVC setSessionActivate has failed : %{public}@", buf, 0x16u);
  }
  BOOL v17 = 0;
  if (a5) {
    goto LABEL_18;
  }
LABEL_19:
  id v21 = [MEMORY[0x1E4F1C9C8] date];
  unint64_t v22 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v23 = v22;
    [v21 timeIntervalSinceDate:v9];
    *(_DWORD *)buf = 136315394;
    uint64_t v31 = "-[CSAudioRecorder activateAudioSessionWithReason:streamHandleId:error:]";
    __int16 v32 = 2050;
    unint64_t v33 = v24;
    _os_log_impl(&dword_1BA1A5000, v23, OS_LOG_TYPE_DEFAULT, "%s setSessionActivate elapsed time = %{public}lf", buf, 0x16u);
  }
  [(CSAudioRecorder *)self _logResourceNotAvailableErrorIfNeeded:v15];

  return v17;
}

- (BOOL)setRecordMode:(int64_t)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  char v10 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    unint64_t v12 = [(CSAudioRecorder *)self _recordModeString:a3];
    *(_DWORD *)buf = 136315394;
    id v29 = "-[CSAudioRecorder setRecordMode:streamHandleId:error:]";
    __int16 v30 = 2114;
    uint64_t v31 = v12;
    _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC setRecordMode to mode : %{public}@", buf, 0x16u);
  }
  char v13 = [(CSAudioRecorder *)self _getVoiceController];
  id v27 = 0;
  char v14 = [v13 setRecordModeForStream:a4 recordMode:a3 error:&v27];
  id v15 = v27;

  if (v14)
  {
    __int16 v16 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v29 = "-[CSAudioRecorder setRecordMode:streamHandleId:error:]";
      _os_log_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_DEFAULT, "%s AVVC successfully setRecordMode", buf, 0xCu);
      if (!a5) {
        goto LABEL_14;
      }
LABEL_13:
      *a5 = v15;
      goto LABEL_14;
    }
LABEL_12:
    if (!a5) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  BOOL v17 = [v15 domain];
  if ([v17 isEqualToString:*MEMORY[0x1E4F28760]])
  {
    uint64_t v18 = [v15 code];

    if (v18 == -11780) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v19 = (void *)CSLogCategoryAudio;
  if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR)) {
    goto LABEL_12;
  }
  int v25 = v19;
  uint64_t v26 = [v15 localizedDescription];
  *(_DWORD *)buf = 136315394;
  id v29 = "-[CSAudioRecorder setRecordMode:streamHandleId:error:]";
  __int16 v30 = 2114;
  uint64_t v31 = v26;
  _os_log_error_impl(&dword_1BA1A5000, v25, OS_LOG_TYPE_ERROR, "%s AVVC setRecordMode has failed : %{public}@", buf, 0x16u);

  if (a5) {
    goto LABEL_13;
  }
LABEL_14:
  char v20 = [MEMORY[0x1E4F1C9C8] date];
  id v21 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v22 = v21;
    [v20 timeIntervalSinceDate:v9];
    *(_DWORD *)buf = 136315394;
    id v29 = "-[CSAudioRecorder setRecordMode:streamHandleId:error:]";
    __int16 v30 = 2050;
    uint64_t v31 = v23;
    _os_log_impl(&dword_1BA1A5000, v22, OS_LOG_TYPE_DEFAULT, "%s setRecordMode elapsed time = %{public}lf", buf, 0x16u);
  }
  return v14;
}

- (void)_logResourceNotAvailableErrorIfNeeded:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v7 = v4;
    id v5 = [v4 domain];
    if (![v5 isEqualToString:*MEMORY[0x1E4F28760]])
    {
LABEL_6:

      goto LABEL_7;
    }
    uint64_t v6 = [v7 code];

    if (v6 == 561145203
      && [(CSAudioRecorder *)self _shouldLogResourceNotAvailableError])
    {
      id v5 = +[CSDiagnosticReporter sharedInstance];
      [v5 submitAudioIssueReport:@"resourceNotAvailable"];
      goto LABEL_6;
    }
  }
LABEL_7:
  MEMORY[0x1F41817F8]();
}

- (BOOL)_shouldLogResourceNotAvailableError
{
  if (_shouldLogResourceNotAvailableError_onceToken != -1) {
    dispatch_once(&_shouldLogResourceNotAvailableError_onceToken, &__block_literal_global_1995);
  }
  return _shouldLogResourceNotAvailableError_answer;
}

void __54__CSAudioRecorder__shouldLogResourceNotAvailableError__block_invoke()
{
  v0 = +[CSUtils deviceProductVersion];
  if ([v0 isEqualToString:@"iPhone9,1"]) {
    goto LABEL_6;
  }
  v1 = +[CSUtils deviceProductVersion];
  if ([v1 isEqualToString:@"iPhone9,2"])
  {
LABEL_5:

LABEL_6:
LABEL_7:
    _shouldLogResourceNotAvailableError_answer = 1;
    return;
  }
  id v2 = +[CSUtils deviceProductVersion];
  if ([v2 isEqualToString:@"iPhone9,3"])
  {

    goto LABEL_5;
  }
  BOOL v3 = +[CSUtils deviceProductVersion];
  char v4 = [v3 isEqualToString:@"iPhone9,4"];

  if (v4) {
    goto LABEL_7;
  }
}

- (BOOL)prewarmAudioSessionWithStreamHandleId:(unint64_t)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  BOOL v7 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v17 = "-[CSAudioRecorder prewarmAudioSessionWithStreamHandleId:error:]";
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC setSessionActive for Prewarm", buf, 0xCu);
  }
  BOOL v8 = [(CSAudioRecorder *)self _getVoiceController];
  id v15 = 0;
  char v9 = [v8 activateAudioSessionForStream:a3 isPrewarm:1 error:&v15];
  id v10 = v15;

  if ((v9 & 1) == 0)
  {
    id v11 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      char v13 = v11;
      char v14 = [v10 localizedDescription];
      *(_DWORD *)buf = 136315394;
      BOOL v17 = "-[CSAudioRecorder prewarmAudioSessionWithStreamHandleId:error:]";
      __int16 v18 = 2114;
      uint64_t v19 = v14;
      _os_log_error_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_ERROR, "%s Prewarm AudioSession has failed : %{public}@", buf, 0x16u);
    }
  }
  kdebug_trace();
  if (a4) {
    *a4 = v10;
  }

  return v9;
}

- (BOOL)isNarrowBandWithStreamHandleId:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (+[CSUtils isDarwinOS])
  {
    id v5 = CSLogCategoryAudio;
    LOBYTE(v6) = 0;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      char v13 = "-[CSAudioRecorder isNarrowBandWithStreamHandleId:]";
      __int16 v14 = 2050;
      unint64_t v15 = a3;
      _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s (darwinOS) : isNarrowBand = NO for streamHandleId = %{public}lu", (uint8_t *)&v12, 0x16u);
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    BOOL v7 = [(CSAudioRecorder *)self _getVoiceController];
    BOOL v8 = [v7 getRecordDeviceInfoForStream:a3];

    int v6 = [v8 isUpsamplingSourceAudio];
    char v9 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = @"NO";
      char v13 = "-[CSAudioRecorder isNarrowBandWithStreamHandleId:]";
      int v12 = 136315650;
      if (v6) {
        id v10 = @"YES";
      }
      __int16 v14 = 2114;
      unint64_t v15 = (unint64_t)v10;
      __int16 v16 = 2050;
      unint64_t v17 = a3;
      _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s isNarrowBand = %{public}@ for streamHandleId = %{public}lu", (uint8_t *)&v12, 0x20u);
    }
  }
  return v6;
}

- (id)recordSettingsWithStreamHandleId:(unint64_t)a3
{
  char v4 = [(CSAudioRecorder *)self _getVoiceController];
  id v5 = [v4 getRecordSettingsForStream:a3];

  return v5;
}

- (float)recordingSampleRateWithStreamHandleId:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CSAudioRecorder *)self recordSettingsWithStreamHandleId:a3];
  char v4 = v3;
  if (v3
    && (uint64_t v5 = *MEMORY[0x1E4F15268],
        [v3 objectForKeyedSubscript:*MEMORY[0x1E4F15268]],
        int v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    BOOL v7 = [v4 objectForKeyedSubscript:v5];
    [v7 floatValue];
    float v9 = v8;

    uint64_t v10 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315394;
      uint64_t v18 = "-[CSAudioRecorder recordingSampleRateWithStreamHandleId:]";
      __int16 v19 = 2050;
      double v20 = v9;
      id v11 = "%s AVVC sampling rate = %{public}f";
      int v12 = v10;
      uint32_t v13 = 22;
LABEL_7:
      _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, v13);
    }
  }
  else
  {
    +[CSConfig inputRecordingSampleRate];
    float v9 = v14;
    uint64_t v15 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315138;
      uint64_t v18 = "-[CSAudioRecorder recordingSampleRateWithStreamHandleId:]";
      id v11 = "%s AVVC doesn't return sampleRate, assume it is default sample rate";
      int v12 = v15;
      uint32_t v13 = 12;
      goto LABEL_7;
    }
  }

  return v9;
}

- (id)audioDeviceInfoWithStreamHandleId:(unint64_t)a3 recordDeviceIndicator:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  int v6 = [(CSAudioRecorder *)self recordDeviceInfoWithStreamHandleId:a3 recordDeviceIndicator:a4];
  BOOL v7 = [(CSAudioRecorder *)self getPlaybackRouteForStreamID:a3];
  float v8 = [MEMORY[0x1E4F1C9C8] date];
  float v9 = [MEMORY[0x1E4F1CA48] array];
  if (([v7 isEqualToString:*MEMORY[0x1E4F150C8]] & 1) != 0
    || [v7 isEqualToString:*MEMORY[0x1E4F150D0]])
  {
    uint64_t v26 = v8;
    uint64_t v10 = [MEMORY[0x1E4F153D8] sharedInstance];
    id v11 = [v10 currentRoute];
    int v12 = [v11 outputs];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = [*(id *)(*((void *)&v27 + 1) + 8 * i) endpointType];
          __int16 v19 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", v18);
          [v9 addObject:v19];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v15);
    }

    float v8 = v26;
  }
  double v20 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v21 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v22 = v21;
    [v20 timeIntervalSinceDate:v8];
    *(_DWORD *)buf = 136315394;
    uint64_t v32 = "-[CSAudioRecorder audioDeviceInfoWithStreamHandleId:recordDeviceIndicator:]";
    __int16 v33 = 2050;
    uint64_t v34 = v23;
    _os_log_impl(&dword_1BA1A5000, v22, OS_LOG_TYPE_DEFAULT, "%s fetch EndpointDeviceType elapsed time = %{public}lf", buf, 0x16u);
  }
  unint64_t v24 = [[CSFAudioDeviceInfo alloc] initWithRecordDeviceInfo:v6 playbackRoute:v7 playbackDeviceTypeList:v9];

  return v24;
}

- (id)recordDeviceInfoWithStreamHandleId:(unint64_t)a3 recordDeviceIndicator:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (+[CSUtils isDarwinOS])
  {
    BOOL v7 = 0;
  }
  else
  {
    float v8 = [MEMORY[0x1E4F1C9C8] date];
    float v9 = [(CSAudioRecorder *)self _getVoiceController];
    uint64_t v10 = [v9 getRecordDeviceInfoForStream:a3];

    id v11 = [MEMORY[0x1E4F1C9C8] date];
    int v12 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      [v11 timeIntervalSinceDate:v8];
      *(_DWORD *)buf = 136315394;
      int v25 = "-[CSAudioRecorder recordDeviceInfoWithStreamHandleId:recordDeviceIndicator:]";
      __int16 v26 = 2050;
      uint64_t v27 = v14;
      _os_log_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_DEFAULT, "%s fetch recordDeviceInfo elapsed time = %{public}lf", buf, 0x16u);
    }
    if (v10) {
      uint64_t v15 = [[CSFAudioRecordDeviceInfo alloc] initWithAVVCRecordDeviceInfo:v10];
    }
    else {
      uint64_t v15 = 0;
    }
    if ([v6 shouldUseRemoteRecorder]
      && [(CSRemoteRecordClient *)self->_remoteRecordClient isRemoteDeviceDarwin])
    {
      uint64_t v23 = [CSFAudioRecordDeviceInfo alloc];
      uint64_t v22 = *MEMORY[0x1E4F15128];
      id v16 = objc_alloc(MEMORY[0x1E4F29128]);
      int v17 = [(CSRemoteRecordClient *)self->_remoteRecordClient deviceId];
      uint64_t v18 = (void *)[v16 initWithUUIDString:v17];
      __int16 v19 = [(CSFAudioRecordDeviceInfo *)v15 remoteDeviceProductIdentifier];
      double v20 = [(CSFAudioRecordDeviceInfo *)v15 remoteDeviceUIDString];
      BOOL v7 = [(CSFAudioRecordDeviceInfo *)v23 initWithRoute:v22 isRemoteDevice:1 remoteDeviceUID:v18 remoteDeviceProductIdentifier:v19 remoteDeviceUIDString:v20];
    }
    else
    {
      BOOL v7 = v15;
    }
  }
  return v7;
}

- (id)recordRouteWithRecordDeviceIndicator:(id)a3
{
  id v4 = a3;
  if ([v4 shouldUseRemoteRecorder]
    && [(CSRemoteRecordClient *)self->_remoteRecordClient isRemoteDeviceGibraltar])
  {
    goto LABEL_7;
  }
  if ([v4 shouldUseRemoteRecorder]
    && [(CSRemoteRecordClient *)self->_remoteRecordClient isRemoteDeviceDarwin])
  {
    uint64_t v5 = (__CFString *)(id)*MEMORY[0x1E4F15128];
    goto LABEL_9;
  }
  if (+[CSUtils isDarwinOS])
  {
LABEL_7:
    uint64_t v5 = @"Builtin Microphone";
  }
  else
  {
    id v6 = [(CSAudioRecorder *)self _getVoiceController];
    BOOL v7 = objc_msgSend(v6, "getRecordDeviceInfoForStream:", objc_msgSend(v4, "streamHandleId"));

    uint64_t v5 = [v7 recordRoute];
  }
LABEL_9:

  return v5;
}

- (BOOL)isRecordingWithRecordDeviceIndicator:(id)a3
{
  id v4 = a3;
  if ([v4 shouldUseRemoteRecorder])
  {
    BOOL v5 = [(CSRemoteRecordClient *)self->_remoteRecordClient isRecording];
  }
  else
  {
    id v6 = [(CSAudioRecorder *)self _getVoiceController];
    uint64_t v7 = objc_msgSend(v6, "getCurrentStreamState:", objc_msgSend(v4, "streamHandleId"));

    BOOL v5 = v7 > 3;
  }

  return v5;
}

- (BOOL)isSessionCurrentlyActivated
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [(CSAudioRecorder *)self _getVoiceController];
  uint64_t v3 = [v2 getCurrentSessionState];

  id v4 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    float v9 = "-[CSAudioRecorder isSessionCurrentlyActivated]";
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Session State = %d", (uint8_t *)&v8, 0x12u);
    id v4 = CSLogCategoryAudio;
  }
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 == 6)
  {
    if (v5)
    {
      int v8 = 136315138;
      float v9 = "-[CSAudioRecorder isSessionCurrentlyActivated]";
      id v6 = "%s AudioSessionState = YES";
LABEL_8:
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v5)
  {
    int v8 = 136315138;
    float v9 = "-[CSAudioRecorder isSessionCurrentlyActivated]";
    id v6 = "%s AudioSessionState = NO";
    goto LABEL_8;
  }
  return v3 == 6;
}

- (BOOL)stopDeliverSecureAudioStreamWithRecordDeviceIndicator:(id)a3 from:(unint64_t)a4 error:(id *)a5
{
  uint64_t v5 = [a3 streamHandleId];
  return v5 == *MEMORY[0x1E4F152C8] && +[CSUtils isExclaveHardware];
}

- (BOOL)fetchSecureAudioStreamWithRecordDeviceIndicator:(id)a3 from:(unint64_t)a4 numSamples:(unint64_t)a5 hostTime:(unint64_t)a6 error:(id *)a7
{
  return 1;
}

- (BOOL)stopAudioStreamWithRecordDeviceIndicator:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  audioFileReader = self->_audioFileReader;
  if (!audioFileReader)
  {
    float v9 = [MEMORY[0x1E4F1C9C8] date];
    if ([v6 shouldUseRemoteRecorder])
    {
      remoteRecordClient = self->_remoteRecordClient;
      id v29 = 0;
      char v8 = [(CSRemoteRecordClient *)remoteRecordClient stopRecording:&v29];
      id v11 = v29;
      if ((v8 & 1) == 0
        && (uint64_t v12 = (void *)CSLogCategoryAudio, os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR)))
      {
        unint64_t v24 = v12;
        int v25 = [v11 localizedDescription];
        *(_DWORD *)buf = 136315394;
        uint64_t v31 = "-[CSAudioRecorder stopAudioStreamWithRecordDeviceIndicator:error:]";
        __int16 v32 = 2114;
        __int16 v33 = v25;
        _os_log_error_impl(&dword_1BA1A5000, v24, OS_LOG_TYPE_ERROR, "%s Failed to stopRecording to remoteRecordClient : %{public}@", buf, 0x16u);

        if (!a4)
        {
LABEL_8:
          id v13 = [MEMORY[0x1E4F1C9C8] date];
          uint64_t v14 = (void *)CSLogCategoryAudio;
          if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v15 = v14;
            [v13 timeIntervalSinceDate:v9];
            *(_DWORD *)buf = 136315394;
            uint64_t v31 = "-[CSAudioRecorder stopAudioStreamWithRecordDeviceIndicator:error:]";
            __int16 v32 = 2050;
            __int16 v33 = v16;
            int v17 = "%s stopRecording elapsed time = %{public}lf";
LABEL_18:
            _os_log_impl(&dword_1BA1A5000, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 0x16u);

            goto LABEL_19;
          }
          goto LABEL_19;
        }
      }
      else if (!a4)
      {
        goto LABEL_8;
      }
      *a4 = v11;
      goto LABEL_8;
    }
    uint64_t v18 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v31 = "-[CSAudioRecorder stopAudioStreamWithRecordDeviceIndicator:error:]";
      _os_log_impl(&dword_1BA1A5000, v18, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC stopRecordForStream", buf, 0xCu);
    }
    __int16 v19 = [(CSAudioRecorder *)self _getVoiceController];
    id v28 = 0;
    char v8 = objc_msgSend(v19, "stopRecordForStream:error:", objc_msgSend(v6, "streamHandleId"), &v28);
    id v11 = v28;

    if ((v8 & 1) == 0
      && (double v20 = (void *)CSLogCategoryAudio, os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR)))
    {
      __int16 v26 = v20;
      uint64_t v27 = [v11 localizedDescription];
      *(_DWORD *)buf = 136315394;
      uint64_t v31 = "-[CSAudioRecorder stopAudioStreamWithRecordDeviceIndicator:error:]";
      __int16 v32 = 2114;
      __int16 v33 = v27;
      _os_log_error_impl(&dword_1BA1A5000, v26, OS_LOG_TYPE_ERROR, "%s Failed to stopRecordForStream : %{public}@", buf, 0x16u);

      if (!a4)
      {
LABEL_16:
        id v13 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v21 = (void *)CSLogCategoryAudio;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = v21;
          [v13 timeIntervalSinceDate:v9];
          *(_DWORD *)buf = 136315394;
          uint64_t v31 = "-[CSAudioRecorder stopAudioStreamWithRecordDeviceIndicator:error:]";
          __int16 v32 = 2050;
          __int16 v33 = v22;
          int v17 = "%s stopRecordForStream elapsed time = %{public}lf";
          goto LABEL_18;
        }
LABEL_19:
        self->_waitingForDidStart = 0;

        goto LABEL_20;
      }
    }
    else if (!a4)
    {
      goto LABEL_16;
    }
    *a4 = v11;
    goto LABEL_16;
  }
  [(CSAudioFileReader *)audioFileReader stopRecording];
  char v8 = 1;
LABEL_20:

  return v8;
}

- (BOOL)startAudioStreamWithOption:(id)a3 recordDeviceIndicator:(id)a4 error:(id *)a5
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = [MEMORY[0x1E4F1C9C8] date];
  id v11 = [v9 recordContext];
  uint64_t v12 = [v11 avvcContext];

  if ([v9 shouldUseRemoteRecorder])
  {
    id v13 = [v9 recordContext];
    uint64_t v14 = [v13 type];

    if (([(CSRemoteRecordClient *)self->_remoteRecordClient hasPendingTwoShotBeep]
       || [(CSAudioRecorder *)self _hasLocalPendingTwoShot])
      && v14 != 27
      || [v8 startAlertBehavior] == 2 && (objc_msgSend(v8, "skipAlertBehavior") & 1) == 0)
    {
      uint64_t v15 = [(CSAudioRecorder *)self _getVoiceController];
      [v15 playAlertSoundForType:1 overrideMode:-1];
    }
    id v16 = v12;
    int v17 = v16;
    if (+[CSUtils isRecordContextVoiceTrigger:v16])
    {
      if (v14 == 27) {
        +[CSAudioRecordContext contextForHomeButton];
      }
      else {
      int v25 = +[CSAudioRecordContext contextForBuiltInVoiceTrigger];
      }
      int v17 = [v25 avvcContext];
    }
    v67 = v12;
    p_info = &OBJC_METACLASS___CSPolicy.info;
    uint64_t v27 = CSLogCategoryAudio;
    if (v17)
    {
      id v28 = a5;
      id v29 = v8;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v75 = "-[CSAudioRecorder startAudioStreamWithOption:recordDeviceIndicator:error:]";
        __int16 v76 = 2114;
        v77 = v17;
        __int16 v78 = 2114;
        id v79 = v16;
        _os_log_impl(&dword_1BA1A5000, v27, OS_LOG_TYPE_DEFAULT, "%s Asking startRecording to remote device with context : %{public}@ (original context : %{public}@)", buf, 0x20u);
      }
      remoteRecordClient = self->_remoteRecordClient;
      v72 = @"context";
      v73 = v17;
      char v18 = 1;
      uint64_t v31 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1, v67);
      id v71 = 0;
      BOOL v32 = [(CSRemoteRecordClient *)remoteRecordClient startRecordingWithOptions:v31 error:&v71];
      id v33 = v71;

      if (v32)
      {
        self->_waitingForDidStart = 1;
        id v8 = v29;
        a5 = v28;
        p_info = (__objc2_class_ro **)(&OBJC_METACLASS___CSPolicy + 32);
        if (!a5) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
      id v8 = v29;
      a5 = v28;
      p_info = &OBJC_METACLASS___CSPolicy.info;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v75 = "-[CSAudioRecorder startAudioStreamWithOption:recordDeviceIndicator:error:]";
        _os_log_error_impl(&dword_1BA1A5000, v27, OS_LOG_TYPE_ERROR, "%s Failed to fetch valid context", buf, 0xCu);
      }
      id v33 = 0;
    }
    uint64_t v34 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      v61 = v34;
      v62 = [v33 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v75 = "-[CSAudioRecorder startAudioStreamWithOption:recordDeviceIndicator:error:]";
      __int16 v76 = 2114;
      v77 = v62;
      _os_log_error_impl(&dword_1BA1A5000, v61, OS_LOG_TYPE_ERROR, "%s Failed to startRecording : %{public}@", buf, 0x16u);
    }
    char v18 = 0;
    if (!a5) {
      goto LABEL_33;
    }
LABEL_32:
    *a5 = v33;
LABEL_33:
    __int16 v35 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v67);
    uint64_t v36 = p_info[306];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = v36;
      [v35 timeIntervalSinceDate:v10];
      *(_DWORD *)buf = 136315394;
      v75 = "-[CSAudioRecorder startAudioStreamWithOption:recordDeviceIndicator:error:]";
      __int16 v76 = 2050;
      v77 = v38;
      _os_log_impl(&dword_1BA1A5000, v37, OS_LOG_TYPE_DEFAULT, "%s startRecordingWithOptions elapsed time = %{public}lf", buf, 0x16u);
    }
LABEL_56:
    uint64_t v12 = v68;
    goto LABEL_57;
  }
  if (![(CSAudioRecorder *)self _shouldInjectAudio])
  {
    mach_absolute_time();
    kdebug_trace();
    uint64_t v19 = [v9 streamHandleId];
    if (v8)
    {
      double v20 = +[CSCarKitUtils sharedInstance];
      int v21 = [v20 isCarPlayConnected];

      if (v21)
      {
        uint64_t v22 = +[CSCarKitUtils sharedInstance];
        uint64_t v23 = [(CSAudioRecorder *)self _getVoiceController];
        uint64_t v24 = [v22 potentiallyAddHWLatencyToOption:v8 streamHandle:v19 voiceController:v23];

        id v8 = (id)v24;
      }
    }
    else
    {
      id v8 = +[CSAudioStartStreamOption noAlertOption];
    }
    uint64_t v39 = objc_msgSend(v9, "streamHandleId", v12);
    uint64_t v40 = (__objc2_class_ro **)(&OBJC_METACLASS___CSPolicy + 32);
    id v41 = v8;
    if (v39 == *MEMORY[0x1E4F152C8] && +[CSUtils isExclaveHardware])
    {
      unint64_t v42 = [MEMORY[0x1E4F153D8] sharedInstance];
      unint64_t v43 = NSNumber;
      +[CSConfig inputRecordingDurationInSecs];
      v44 = objc_msgSend(v43, "numberWithFloat:");
      id v70 = 0;
      char v45 = [v42 setMXSessionProperty:@"PreferredMinimumMicrophoneIndicatorLightOnTime" value:v44 error:&v70];
      id v46 = v70;

      uint64_t v40 = &OBJC_METACLASS___CSPolicy.info;
      v47 = CSLogCategoryAudio;
      if (v45)
      {
        if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v75 = "-[CSAudioRecorder startAudioStreamWithOption:recordDeviceIndicator:error:]";
          _os_log_impl(&dword_1BA1A5000, v47, OS_LOG_TYPE_DEFAULT, "%s success", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        v65 = v47;
        v66 = [v46 localizedDescription];
        *(_DWORD *)buf = 136315394;
        v75 = "-[CSAudioRecorder startAudioStreamWithOption:recordDeviceIndicator:error:]";
        __int16 v76 = 2112;
        v77 = v66;
        _os_log_error_impl(&dword_1BA1A5000, v65, OS_LOG_TYPE_ERROR, "%s Failed to set preferred mic indicator light time : %@", buf, 0x16u);

        uint64_t v40 = (__objc2_class_ro **)(&OBJC_METACLASS___CSPolicy + 32);
      }
      [(CSExclaveAudioProviding *)self->_exclaveAudioClient prepare];

      id v8 = v41;
    }
    __int16 v48 = [v8 avvcStartRecordSettingsWithAudioStreamHandleId:v19];
    int v49 = v40[306];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v50 = v49;
      unsigned int v51 = [v48 debugDescription];
      *(_DWORD *)buf = 136315394;
      v75 = "-[CSAudioRecorder startAudioStreamWithOption:recordDeviceIndicator:error:]";
      __int16 v76 = 2114;
      v77 = v51;
      _os_log_impl(&dword_1BA1A5000, v50, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC startRecordForStream : %{public}@", buf, 0x16u);
    }
    __int16 v52 = [(CSAudioRecorder *)self _getVoiceController];
    id v69 = 0;
    char v18 = [v52 startRecordForStream:v48 error:&v69];
    id v53 = v69;

    if (v18)
    {
      self->_waitingForDidStart = 1;
    }
    else
    {
      uint64_t v54 = &OBJC_METACLASS___CSPolicy.info;
      v55 = (void *)CSLogCategoryAudio;
      if (!os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR)) {
        goto LABEL_51;
      }
      v63 = v55;
      v64 = [v53 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v75 = "-[CSAudioRecorder startAudioStreamWithOption:recordDeviceIndicator:error:]";
      __int16 v76 = 2114;
      v77 = v64;
      _os_log_error_impl(&dword_1BA1A5000, v63, OS_LOG_TYPE_ERROR, "%s startRecordForStream failed : %{public}@", buf, 0x16u);
    }
    uint64_t v54 = (__objc2_class_ro **)(&OBJC_METACLASS___CSPolicy + 32);
LABEL_51:
    if (a5) {
      *a5 = v53;
    }
    v56 = [MEMORY[0x1E4F1C9C8] date];
    v57 = v54[306];
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      v58 = v57;
      [v56 timeIntervalSinceDate:v10];
      *(_DWORD *)buf = 136315394;
      v75 = "-[CSAudioRecorder startAudioStreamWithOption:recordDeviceIndicator:error:]";
      __int16 v76 = 2050;
      v77 = v59;
      _os_log_impl(&dword_1BA1A5000, v58, OS_LOG_TYPE_DEFAULT, "%s startRecordForStream elapsed time = %{public}lf", buf, 0x16u);
    }
    [(CSAudioRecorder *)self _logResourceNotAvailableErrorIfNeeded:v53];

    id v8 = v41;
    goto LABEL_56;
  }
  char v18 = [(CSAudioRecorder *)self _startAudioStreamForAudioInjectionWithAVVCContext:v12];
LABEL_57:

  return v18;
}

- (BOOL)_startAudioStreamForAudioInjectionWithAVVCContext:(id)a3
{
  *(void *)&v37[13] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CSAudioRecorder *)self _shouldInjectAudio])
  {
    uint64_t v5 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = 136315138;
      __int16 v35 = "-[CSAudioRecorder _startAudioStreamForAudioInjectionWithAVVCContext:]";
      _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s ::: CSAudioRecord will inject audio file instead of recording", (uint8_t *)&v34, 0xCu);
    }
    if ([(CSAudioRecorder *)self _needResetAudioInjectionIndex:v4])
    {
      id v6 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = 136315138;
        __int16 v35 = "-[CSAudioRecorder _startAudioStreamForAudioInjectionWithAVVCContext:]";
        _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Resetting AudioFilePathIndex", (uint8_t *)&v34, 0xCu);
      }
      self->_unint64_t audioFilePathIndex = 0;
    }
    else
    {
      unint64_t v8 = self->_audioFilePathIndex + 1;
      self->_unint64_t audioFilePathIndex = v8;
      id v9 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = 136315394;
        __int16 v35 = "-[CSAudioRecorder _startAudioStreamForAudioInjectionWithAVVCContext:]";
        __int16 v36 = 1024;
        *(_DWORD *)uint64_t v37 = v8;
        _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Increase AudioFilePathIndex = %d", (uint8_t *)&v34, 0x12u);
      }
    }
    __int16 v10 = +[CSFPreferences sharedPreferences];
    id v11 = [v10 audioInjectionFilePath];

    unint64_t audioFilePathIndex = self->_audioFilePathIndex;
    if (audioFilePathIndex >= [v11 count])
    {
      uint64_t v14 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        unint64_t v31 = self->_audioFilePathIndex;
        BOOL v32 = v14;
        int v33 = [v11 count];
        int v34 = 136315650;
        __int16 v35 = "-[CSAudioRecorder _startAudioStreamForAudioInjectionWithAVVCContext:]";
        __int16 v36 = 1024;
        *(_DWORD *)uint64_t v37 = v31;
        v37[2] = 1024;
        *(_DWORD *)&v37[3] = v33;
        _os_log_error_impl(&dword_1BA1A5000, v32, OS_LOG_TYPE_ERROR, "%s AudioFilePathIndex is out-of-boundary _audioFilePathIndex:%d injectAudioFilePaths:%d", (uint8_t *)&v34, 0x18u);
      }
      uint64_t v13 = [v11 count] - 1;
      self->_unint64_t audioFilePathIndex = v13;
    }
    else
    {
      uint64_t v13 = self->_audioFilePathIndex;
    }
    uint64_t v15 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v15;
      int v17 = [v11 objectAtIndex:v13];
      int v34 = 136315650;
      __int16 v35 = "-[CSAudioRecorder _startAudioStreamForAudioInjectionWithAVVCContext:]";
      __int16 v36 = 1024;
      *(_DWORD *)uint64_t v37 = v13;
      v37[2] = 2112;
      *(void *)&v37[3] = v17;
      _os_log_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_DEFAULT, "%s AudioFilePathIndex:%d accessing:%@", (uint8_t *)&v34, 0x1Cu);

      uint64_t v13 = self->_audioFilePathIndex;
    }
    char v18 = [v11 objectAtIndex:v13];
    if (v18
      && ([MEMORY[0x1E4F28CB8] defaultManager],
          uint64_t v19 = objc_claimAutoreleasedReturnValue(),
          char v20 = [v19 fileExistsAtPath:v18],
          v19,
          (v20 & 1) != 0))
    {
      int v21 = [CSAudioFileReader alloc];
      uint64_t v22 = [MEMORY[0x1E4F1CB10] URLWithString:v18];
      uint64_t v23 = [(CSAudioFileReader *)v21 initWithURL:v22];
      audioFileReader = self->_audioFileReader;
      self->_audioFileReader = v23;

      [(CSAudioFileReader *)self->_audioFileReader setDelegate:self];
      int v25 = self->_audioFileReader;
      +[CSConfig inputRecordingBufferDuration];
      -[CSAudioFileReader setRecordBufferDuration:](v25, "setRecordBufferDuration:");
      __int16 v26 = +[CSAudioStreamRequest requestForLpcmRecordSettingsWithContext:0];
      uint64_t v27 = [(CSAudioRecorder *)self _getRecordSettingsWithRequest:v26];
      BOOL v28 = [(CSAudioFileReader *)self->_audioFileReader prepareRecording:v27];

      if (v28)
      {
        BOOL v7 = [(CSAudioFileReader *)self->_audioFileReader startRecording];
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
      id v29 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        int v34 = 136315394;
        __int16 v35 = "-[CSAudioRecorder _startAudioStreamForAudioInjectionWithAVVCContext:]";
        __int16 v36 = 2112;
        *(void *)uint64_t v37 = v18;
        _os_log_error_impl(&dword_1BA1A5000, v29, OS_LOG_TYPE_ERROR, "%s Unable to find injectAudioFilePath = %@", (uint8_t *)&v34, 0x16u);
      }
    }
    BOOL v7 = 0;
    goto LABEL_25;
  }
  BOOL v7 = 0;
LABEL_26:

  return v7;
}

- (BOOL)_shouldInjectAudio
{
  id v2 = +[CSFPreferences sharedPreferences];
  char v3 = [v2 audioInjectionEnabled];

  return v3;
}

- (BOOL)prepareAudioStreamRecord:(id)a3 recordDeviceIndicator:(id)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1E4F1C9C8];
  id v10 = a3;
  id v11 = [v9 date];
  uint64_t v12 = [(CSAudioRecorder *)self _getRecordSettingsWithRequest:v10];

  kdebug_trace();
  uint64_t v13 = 0;
  if ([v8 shouldUseRemoteRecorder])
  {
    uint64_t v14 = [v8 deviceId];
    uint64_t v15 = -[CSAudioRecorder _fetchRemoteRecordClientWithDeviceId:streamHandleId:](self, "_fetchRemoteRecordClientWithDeviceId:streamHandleId:", v14, [v8 streamHandleId]);

    if (v15)
    {
      id v43 = 0;
      char v16 = [v15 waitingForConnection:&v43 error:3.0];
      id v17 = v43;

      uint64_t v13 = v17;
      if (v16) {
        goto LABEL_4;
      }
    }
    else
    {
      BOOL v32 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        uint64_t v39 = v32;
        uint64_t v40 = [v8 deviceId];
        *(_DWORD *)buf = 136315395;
        char v45 = "-[CSAudioRecorder prepareAudioStreamRecord:recordDeviceIndicator:error:]";
        __int16 v46 = 2113;
        uint64_t v47 = (uint64_t)v40;
        _os_log_error_impl(&dword_1BA1A5000, v39, OS_LOG_TYPE_ERROR, "%s Remote device with device id: %{private}@ not found", buf, 0x16u);
      }
      if ([v8 streamHandleId] == 1) {
        uint64_t v33 = 305;
      }
      else {
        uint64_t v33 = 307;
      }
      id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:v33 userInfo:0];
    }
    int v34 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      __int16 v35 = v34;
      __int16 v36 = [v17 localizedDescription];
      *(_DWORD *)buf = 136315394;
      char v45 = "-[CSAudioRecorder prepareAudioStreamRecord:recordDeviceIndicator:error:]";
      __int16 v46 = 2114;
      uint64_t v47 = (uint64_t)v36;
      _os_log_error_impl(&dword_1BA1A5000, v35, OS_LOG_TYPE_ERROR, "%s Failed to prepare remote device : %{public}@", buf, 0x16u);

      if (a5) {
        goto LABEL_23;
      }
    }
    else if (a5)
    {
LABEL_23:
      id v17 = v17;
      char v25 = 0;
      *a5 = v17;
      goto LABEL_26;
    }
    char v25 = 0;
    goto LABEL_26;
  }
LABEL_4:
  char v18 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = v18;
    uint64_t v20 = [v8 streamHandleId];
    *(_DWORD *)buf = 136315650;
    char v45 = "-[CSAudioRecorder prepareAudioStreamRecord:recordDeviceIndicator:error:]";
    __int16 v46 = 2050;
    uint64_t v47 = v20;
    __int16 v48 = 2114;
    int v49 = v12;
    _os_log_impl(&dword_1BA1A5000, v19, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC prepareRecordForStream(%{public}llu) : %{public}@", buf, 0x20u);
  }
  id v21 = objc_alloc(MEMORY[0x1E4F154D8]);
  uint64_t v22 = [v8 streamHandleId];
  +[CSConfig inputRecordingBufferDuration];
  uint64_t v23 = objc_msgSend(v21, "initWithStreamID:settings:bufferDuration:", v22, v12);
  [v23 setMeteringEnabled:1];
  uint64_t v24 = [(CSAudioRecorder *)self _getVoiceController];
  id v42 = v13;
  char v25 = [v24 prepareRecordForStream:v23 error:&v42];
  id v17 = v42;

  if (v25)
  {
    [(CSAudioRecorder *)self _trackRemoteAccessoryStreamIdIfNeeded:v8];
    p_info = (__objc2_class_ro **)(&OBJC_METACLASS___CSPolicy + 32);
    if (!a5) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  p_info = &OBJC_METACLASS___CSPolicy.info;
  uint64_t v27 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
  {
    uint64_t v38 = v27;
    id v41 = [v17 localizedDescription];
    *(_DWORD *)buf = 136315394;
    char v45 = "-[CSAudioRecorder prepareAudioStreamRecord:recordDeviceIndicator:error:]";
    __int16 v46 = 2114;
    uint64_t v47 = (uint64_t)v41;
    _os_log_error_impl(&dword_1BA1A5000, v38, OS_LOG_TYPE_ERROR, "%s AVVC prepareRecordForStream failed : %{public}@", buf, 0x16u);

    if (!a5) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (a5) {
LABEL_11:
  }
    *a5 = v17;
LABEL_12:
  BOOL v28 = [MEMORY[0x1E4F1C9C8] date];
  id v29 = p_info[306];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    long long v30 = v29;
    [v28 timeIntervalSinceDate:v11];
    *(_DWORD *)buf = 136315394;
    char v45 = "-[CSAudioRecorder prepareAudioStreamRecord:recordDeviceIndicator:error:]";
    __int16 v46 = 2050;
    uint64_t v47 = v31;
    _os_log_impl(&dword_1BA1A5000, v30, OS_LOG_TYPE_DEFAULT, "%s prepareRecordForStream elapsed time = %{public}lf", buf, 0x16u);
  }
  [(CSAudioRecorder *)self _logResourceNotAvailableErrorIfNeeded:v17];

LABEL_26:
  return v25;
}

- (BOOL)setCurrentContext:(id)a3 streamHandleId:(unint64_t)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  if ([v8 type] == 5 && objc_msgSend(v8, "isRequestDuringActiveCall"))
  {
    id v10 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v29 = "-[CSAudioRecorder setCurrentContext:streamHandleId:error:]";
      _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Will skip setting current record context because we were in active call and context was post or auto", buf, 0xCu);
    }
    char v11 = 1;
  }
  else
  {
    uint64_t v12 = [v8 avvcContextSettings];
    uint64_t v13 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = v13;
      uint64_t v15 = [v12 debugDescription];
      *(_DWORD *)buf = 136315394;
      id v29 = "-[CSAudioRecorder setCurrentContext:streamHandleId:error:]";
      __int16 v30 = 2114;
      uint64_t v31 = (uint64_t)v15;
      _os_log_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC setContextForStream : %{public}@", buf, 0x16u);
    }
    audioFileReader = self->_audioFileReader;
    self->_audioFileReader = 0;

    if ([v12 activationMode] == 1886352244 || objc_msgSend(v12, "activationMode") == 1635087471)
    {
      id v17 = [(CSAudioRecorder *)self _getVoiceController];
      id v27 = 0;
      char v11 = [v17 setContextForStream:v12 forStream:a4 error:&v27];
      id v18 = v27;

      uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v20 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = v20;
        [v19 timeIntervalSinceDate:v9];
        *(_DWORD *)buf = 136315394;
        id v29 = "-[CSAudioRecorder setCurrentContext:streamHandleId:error:]";
        __int16 v30 = 2050;
        uint64_t v31 = v22;
        _os_log_impl(&dword_1BA1A5000, v21, OS_LOG_TYPE_DEFAULT, "%s setCurrentContext elapsed time = %{public}lf", buf, 0x16u);
      }
      if (a5) {
        *a5 = v18;
      }
    }
    else
    {
      uint64_t v23 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = v23;
        uint64_t v25 = [v12 activationMode];
        *(_DWORD *)buf = 136315394;
        id v29 = "-[CSAudioRecorder setCurrentContext:streamHandleId:error:]";
        __int16 v30 = 2048;
        uint64_t v31 = v25;
        _os_log_impl(&dword_1BA1A5000, v24, OS_LOG_TYPE_DEFAULT, "%s Tried to setCurrentContext with mode %ld. This method can only be used for auto and post", buf, 0x16u);
      }
      char v11 = 1;
    }
  }
  return v11;
}

- (void)setContext:(id)a3 completion:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = (void (**)(id, uint64_t, uint64_t, uint64_t))a4;
  uint64_t v35 = 0;
  __int16 v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__2020;
  uint64_t v39 = __Block_byref_object_dispose__2021;
  id v40 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  uint64_t v27 = 0;
  BOOL v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  id v8 = [MEMORY[0x1E4F1C9C8] date];
  id v9 = [v6 avvcContextSettings];
  id v10 = (id)CSLogCategoryAudio;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    char v11 = [v9 debugDescription];
    *(_DWORD *)buf = 136315394;
    id v42 = "-[CSAudioRecorder setContext:completion:]";
    __int16 v43 = 2112;
    v44 = v11;
    _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Calling AVVC setContext : %@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CSAudioRecorder_setContext_completion___block_invoke;
  block[3] = &unk_1E61FF520;
  uint64_t v24 = &v31;
  void block[4] = self;
  id v13 = v9;
  id v23 = v13;
  uint64_t v25 = &v27;
  __int16 v26 = &v35;
  dispatch_async_and_wait(queue, block);
  if (!v32[3])
  {
    uint64_t v14 = (id)CSLogCategoryAudio;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v21 = [(id)v36[5] localizedDescription];
      *(_DWORD *)buf = 136315394;
      id v42 = "-[CSAudioRecorder setContext:completion:]";
      __int16 v43 = 2114;
      v44 = v21;
      _os_log_error_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_ERROR, "%s Failed to get handle id : %{public}@", buf, 0x16u);
    }
  }
  audioFileReader = self->_audioFileReader;
  self->_audioFileReader = 0;

  char v16 = [MEMORY[0x1E4F1C9C8] date];
  id v17 = (id)CSLogCategoryAudio;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    [v16 timeIntervalSinceDate:v8];
    uint64_t v18 = v32[3];
    uint64_t v19 = v28[3];
    *(_DWORD *)buf = 136315906;
    id v42 = "-[CSAudioRecorder setContext:completion:]";
    __int16 v43 = 2050;
    v44 = v20;
    __int16 v45 = 2050;
    uint64_t v46 = v18;
    __int16 v47 = 2050;
    uint64_t v48 = v19;
    _os_log_impl(&dword_1BA1A5000, v17, OS_LOG_TYPE_DEFAULT, "%s setContext elapsed time = %{public}lf, streamHandleId = %{public}lu, streamType = %{public}lu", buf, 0x2Au);
  }

  if (v7) {
    v7[2](v7, v32[3], v28[3], v36[5]);
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
}

void __41__CSAudioRecorder_setContext_completion___block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  char v3 = *(void **)(a1[4] + 8);
  uint64_t v4 = *(void *)(a1[7] + 8) + 24;
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v3 setContext:v2 streamType:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(void *)(*(void *)(a1[6] + 8) + 24) = v6;
}

- (void)setAnnounceCallsEnabled:(BOOL)a3 withStreamHandleID:(unint64_t)a4
{
  BOOL v5 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v7 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    id v10 = "-[CSAudioRecorder setAnnounceCallsEnabled:withStreamHandleID:]";
    __int16 v11 = 1024;
    BOOL v12 = v5;
    __int16 v13 = 2048;
    unint64_t v14 = a4;
    _os_log_impl(&dword_1BA1A5000, v7, OS_LOG_TYPE_DEFAULT, "%s Setting announced call flag to: %d with stream handle Id: %lu", (uint8_t *)&v9, 0x1Cu);
  }
  id v8 = [(CSAudioRecorder *)self _getVoiceController];
  [v8 setAnnounceCallsEnabledForStream:a4 enable:v5];
}

- (id)_getVoiceController
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__2020;
  id v10 = __Block_byref_object_dispose__2021;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__CSAudioRecorder__getVoiceController__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__CSAudioRecorder__getVoiceController__block_invoke(uint64_t a1)
{
}

- (id)_createVoiceControllerWithError:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__2020;
  uint64_t v18 = __Block_byref_object_dispose__2021;
  id v19 = 0;
  voiceController = self->_voiceController;
  if (!voiceController)
  {
    [(CSAudioRecorder *)self clearListeningMicIndicatorProperty];
    kdebug_trace();
    if (CSIsHorseman_onceToken != -1) {
      dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
    }
    if (CSIsHorseman_isHorseman)
    {
      voiceControllerCreationQueue = self->_voiceControllerCreationQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__CSAudioRecorder__createVoiceControllerWithError___block_invoke;
      block[3] = &unk_1E6200F40;
      void block[4] = self;
      void block[5] = &v14;
      dispatch_sync(voiceControllerCreationQueue, block);
    }
    queue = self->_queue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__CSAudioRecorder__createVoiceControllerWithError___block_invoke_2;
    v12[3] = &unk_1E6200F40;
    v12[4] = self;
    v12[5] = &v14;
    dispatch_async_and_wait(queue, v12);
    if (a3) {
      *a3 = (id) v15[5];
    }
    uint64_t v8 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = self->_voiceController;
      *(_DWORD *)buf = 136315394;
      id v21 = "-[CSAudioRecorder _createVoiceControllerWithError:]";
      __int16 v22 = 2050;
      id v23 = v9;
      _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Successfully create AVVC : %{public}p", buf, 0x16u);
    }
    voiceController = self->_voiceController;
  }
  id v10 = voiceController;
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __51__CSAudioRecorder__createVoiceControllerWithError___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F15500]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 initWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v4;
}

void __51__CSAudioRecorder__createVoiceControllerWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    id v2 = objc_alloc(MEMORY[0x1E4F15500]);
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v3 + 40);
    uint64_t v4 = [v2 initWithError:&obj];
    objc_storeStrong((id *)(v3 + 40), obj);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 8);
    *(void *)(v5 + 8) = v4;
  }
  kdebug_trace();
  BOOL v7 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v7)
  {
    objc_msgSend(v7, "setRecordDelegate:");
  }
  else
  {
    uint64_t v8 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = "-[CSAudioRecorder _createVoiceControllerWithError:]_block_invoke_2";
      _os_log_error_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_ERROR, "%s AVVC initialization failed", buf, 0xCu);
    }
    int v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v9)
    {
      id v10 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        id v11 = v10;
        BOOL v12 = [v9 localizedDescription];
        *(_DWORD *)buf = 136315394;
        uint64_t v15 = "-[CSAudioRecorder _createVoiceControllerWithError:]_block_invoke";
        __int16 v16 = 2114;
        id v17 = v12;
        _os_log_error_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
      }
    }
  }
}

- (void)_destroyVoiceController
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  voiceController = self->_voiceController;
  if (voiceController)
  {
    uint64_t v4 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v13 = "-[CSAudioRecorder _destroyVoiceController]";
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
      voiceController = self->_voiceController;
    }
    id v11 = 0;
    [(AVVoiceController *)voiceController teardownWithError:&v11];
    id v5 = v11;
    if (v5)
    {
      uint64_t v6 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        int v9 = v6;
        id v10 = [v5 localizedDescription];
        *(_DWORD *)buf = 136315394;
        __int16 v13 = "-[CSAudioRecorder _destroyVoiceController]";
        __int16 v14 = 2114;
        uint64_t v15 = v10;
        _os_log_error_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_ERROR, "%s Failed to teardown AVVC : %{public}@", buf, 0x16u);
      }
    }
    BOOL v7 = (void *)MEMORY[0x1BA9E7330]();
    uint64_t v8 = self->_voiceController;
    self->_voiceController = 0;
  }
  [(NSMutableDictionary *)self->_hasSetAlertDictionary removeAllObjects];
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(CSAudioRecorder *)self _destroyVoiceController];
  pNonInterleavedABL = self->_pNonInterleavedABL;
  if (pNonInterleavedABL) {
    free(pNonInterleavedABL);
  }
  uint64_t v4 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v7 = "-[CSAudioRecorder dealloc]";
    __int16 v8 = 2050;
    int v9 = self;
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s CSAudioRecorder %{public}p deallocated", buf, 0x16u);
  }
  v5.receiver = self;
  v5.super_class = (Class)CSAudioRecorder;
  [(CSAudioRecorder *)&v5 dealloc];
}

- (void)willDestroy
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[CSAudioRecorder willDestroy]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__CSAudioRecorder_willDestroy__block_invoke;
  block[3] = &unk_1E6201288;
  void block[4] = self;
  dispatch_async_and_wait(queue, block);
  if (self->_waitingForDidStart)
  {
    objc_super v5 = self->_queue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __30__CSAudioRecorder_willDestroy__block_invoke_2;
    v8[3] = &unk_1E6201288;
    v8[4] = self;
    dispatch_async(v5, v8);
  }
  uint64_t v6 = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__CSAudioRecorder_willDestroy__block_invoke_3;
  v7[3] = &unk_1E6201288;
  v7[4] = self;
  dispatch_async(v6, v7);
}

uint64_t __30__CSAudioRecorder_willDestroy__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) clearListeningMicIndicatorProperty];
  id v2 = *(void **)(a1 + 32);
  return [v2 _destroyVoiceController];
}

void __30__CSAudioRecorder_willDestroy__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.corespeech" code:205 userInfo:0];
  [v1 _audioRecorderDidStartRecordingSuccessfully:0 streamHandleID:0 error:v2];
}

void __30__CSAudioRecorder_willDestroy__block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 136);
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
        BOOL v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "audioRecorderWillBeDestroyed:", *(void *)(a1 + 32), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)userSessionActivateMonitor:(id)a3 didReceivedUserSessionActiveHasChanged:(BOOL)a4
{
  if (!a4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__CSAudioRecorder_userSessionActivateMonitor_didReceivedUserSessionActiveHasChanged___block_invoke;
    block[3] = &unk_1E6201288;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

void __85__CSAudioRecorder_userSessionActivateMonitor_didReceivedUserSessionActiveHasChanged___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[CSAudioRecorder userSessionActivateMonitor:didReceivedUserSessionActiveHasChanged:]_block_invoke";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Tear down _remoteRecordClient if needed", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 48);
  if (v4)
  {
    *(void *)(v3 + 48) = 0;
  }
}

- (void)setAudioSessionEventDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__CSAudioRecorder_setAudioSessionEventDelegate___block_invoke;
  v7[3] = &unk_1E6201030;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

id __48__CSAudioRecorder_setAudioSessionEventDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 144), *(id *)(a1 + 40));
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__CSAudioRecorder_unregisterObserver___block_invoke;
  v7[3] = &unk_1E6201030;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __38__CSAudioRecorder_unregisterObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 136) removeObject:*(void *)(a1 + 40)];
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__CSAudioRecorder_registerObserver___block_invoke;
  v7[3] = &unk_1E6201030;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __36__CSAudioRecorder_registerObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 136) addObject:*(void *)(a1 + 40)];
}

- (CSAudioRecorder)initWithQueue:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v43.receiver = self;
  v43.super_class = (Class)CSAudioRecorder;
  uint64_t v7 = [(CSAudioRecorder *)&v43 init];
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      [(CSAudioRecorder *)v7 setQueue:v6];
    }
    else
    {
      long long v9 = [(id)objc_opt_class() description];
      uint64_t v10 = +[CSUtils getSerialQueue:v9 qualityOfService:33];
      queue = v8->_queue;
      v8->_queue = (OS_dispatch_queue *)v10;
    }
    uint64_t v12 = [(id)objc_opt_class() description];
    uint64_t v13 = +[CSUtils getSerialQueue:v12 qualityOfService:9];
    voiceControllerCreationQueue = v8->_voiceControllerCreationQueue;
    v8->_voiceControllerCreationQueue = (OS_dispatch_queue *)v13;

    id v42 = 0;
    uint64_t v15 = [(CSAudioRecorder *)v8 _createVoiceControllerWithError:&v42];
    id v16 = v42;
    voiceController = v8->_voiceController;
    v8->_voiceController = (AVVoiceController *)v15;

    if (+[CSUtils isExclaveHardware])
    {
      uint64_t v18 = +[CSExclaveMessageHandlingFactory exclaveAudioProvider];
      exclaveAudioClient = v8->_exclaveAudioClient;
      v8->_exclaveAudioClient = (CSExclaveAudioProviding *)v18;

      [(CSExclaveAudioProviding *)v8->_exclaveAudioClient setDelegate:v8];
    }
    if (v8->_voiceController && !v16)
    {
      uint64_t v20 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      observers = v8->_observers;
      v8->_observers = (NSHashTable *)v20;

      uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
      opusDecoders = v8->_opusDecoders;
      v8->_opusDecoders = (NSMutableDictionary *)v22;

      v8->_unint64_t audioFilePathIndex = 0;
      v8->_waitingForDidStart = 0;
      uint64_t v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      remoteAccessoryStreamIdSet = v8->_remoteAccessoryStreamIdSet;
      v8->_remoteAccessoryStreamIdSet = v24;

      __int16 v26 = +[CSUserSessionActiveMonitor sharedInstance];
      [v26 addObserver:v8];

      if (CSIsHorseman_onceToken != -1) {
        dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_9);
      }
      if (CSIsHorseman_isHorseman)
      {
        +[CSConfig inputRecordingSampleRate];
        double v28 = (float)(v27
                    * (float)+[CSConfig inputRecordingSampleByteDepth]);
        +[CSConfig inputRecordingBufferDuration];
        uint64_t v30 = [[CSReusableBufferPoolConfiguration alloc] initWithBackingStoreCapacity:(unint64_t)(v29* v28* (double)+[CSConfig inputRecordingNumberOfChannels]) minimalNumberOfBackingStores:4 maximumNumberOfBackingStores:32 backingStoreIdleTimeout:10.0];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = [[CSReusableBufferPool alloc] initWithConfiguration:v30];
          audioBufferPool = v8->_audioBufferPool;
          v8->_audioBufferPool = v32;
        }
      }
      uint64_t v34 = [MEMORY[0x1E4F1CA60] dictionary];
      hasSetAlertDictionary = v8->_hasSetAlertDictionary;
      v8->_hasSetAlertDictionary = (NSMutableDictionary *)v34;

      __int16 v36 = CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v45 = "-[CSAudioRecorder initWithQueue:error:]";
        __int16 v46 = 2050;
        __int16 v47 = v8;
        _os_log_impl(&dword_1BA1A5000, v36, OS_LOG_TYPE_DEFAULT, "%s Create new CSAudioRecorder = %{public}p", buf, 0x16u);
      }
      goto LABEL_16;
    }
    uint64_t v38 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      uint64_t v39 = v38;
      id v40 = [v16 localizedDescription];
      *(_DWORD *)buf = 136315394;
      __int16 v45 = "-[CSAudioRecorder initWithQueue:error:]";
      __int16 v46 = 2114;
      __int16 v47 = v40;
      _os_log_error_impl(&dword_1BA1A5000, v39, OS_LOG_TYPE_ERROR, "%s Failed to create AVVC : %{public}@", buf, 0x16u);

      if (a4) {
        goto LABEL_21;
      }
    }
    else if (a4)
    {
LABEL_21:
      id v16 = v16;
      uint64_t v37 = 0;
      *a4 = v16;
      goto LABEL_24;
    }
    uint64_t v37 = 0;
    goto LABEL_24;
  }
LABEL_16:
  if (a4) {
    *a4 = 0;
  }
  uint64_t v37 = v8;
  id v16 = 0;
LABEL_24:

  return v37;
}

- (CSAudioRecorder)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSAudioRecorder;
  id v2 = [(CSAudioRecorder *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [(id)objc_opt_class() description];
    uint64_t v4 = +[CSUtils getSerialQueue:v3 qualityOfService:33];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (void)resetDuckSettings
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "+[CSAudioRecorder resetDuckSettings]";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s Calling audio session reset ducking settings", buf, 0xCu);
  }
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = [MEMORY[0x1E4F153D8] sharedInstance];
  id v13 = 0;
  [v4 setDuckToLevelDB:0 error:&v13];
  id v5 = v13;

  id v6 = [MEMORY[0x1E4F1C9C8] date];
  objc_super v7 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    [v6 timeIntervalSinceDate:v3];
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "+[CSAudioRecorder resetDuckSettings]";
    __int16 v16 = 2050;
    id v17 = v9;
    _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s resetDuckSettings elapsed time = %{public}lf", buf, 0x16u);
  }
  if (v5)
  {
    uint64_t v10 = (void *)CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      long long v11 = v10;
      uint64_t v12 = [v5 localizedDescription];
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "+[CSAudioRecorder resetDuckSettings]";
      __int16 v16 = 2114;
      id v17 = v12;
      _os_log_error_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_ERROR, "%s Failed to setDuckToLevelDB : %{public}@", buf, 0x16u);
    }
  }
}

+ (void)createSharedAudioSession
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!+[CSUtils isDarwinOS])
  {
    id v2 = [MEMORY[0x1E4F153D8] sharedInstance];
    id v15 = 0;
    char v3 = [v2 setIAmTheAssistant:1 error:&v15];
    id v4 = v15;

    id v5 = CSLogCategoryAudio;
    if ((v3 & 1) == 0 && os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = v5;
      long long v11 = [v4 localizedDescription];
      *(_DWORD *)buf = 136315394;
      id v17 = "+[CSAudioRecorder createSharedAudioSession]";
      __int16 v18 = 2114;
      id v19 = v11;
      _os_log_error_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_ERROR, "%s Failed to setIamTheAssistant : %{public}@", buf, 0x16u);

      id v5 = CSLogCategoryAudio;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v17 = "+[CSAudioRecorder createSharedAudioSession]";
      _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s Creating audio session with allow mixable audio while recording to YES", buf, 0xCu);
    }
    id v6 = [MEMORY[0x1E4F153D8] sharedInstance];
    id v14 = 0;
    char v7 = [v6 setAllowMixableAudioWhileRecording:1 error:&v14];
    id v8 = v14;

    if ((v7 & 1) == 0)
    {
      long long v9 = (void *)CSLogCategoryAudio;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = v9;
        id v13 = [v8 localizedDescription];
        *(_DWORD *)buf = 136315394;
        id v17 = "+[CSAudioRecorder createSharedAudioSession]";
        __int16 v18 = 2114;
        id v19 = v13;
        _os_log_error_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_ERROR, "%s Failed to setAllowMixableAudioWhileRecording : %{public}@", buf, 0x16u);
      }
    }
  }
}

+ (unint64_t)_convertDeactivateOption:(unint64_t)a3
{
  return a3 == 1;
}

@end