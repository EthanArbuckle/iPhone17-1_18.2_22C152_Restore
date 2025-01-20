@interface AVVoiceController
- (AVVoiceController)initWithError:(id *)a3;
- (AVVoiceControllerRecordDelegate)recordDelegate;
- (BOOL)IsDeviceAvailableInLocalRoute:(id)a3 error:(id *)a4;
- (BOOL)activateAudioSessionForStream:(unint64_t)a3 isPrewarm:(BOOL)a4 error:(id *)a5;
- (BOOL)activateAudioSessionForStream:(unint64_t)a3 isPrewarm:(BOOL)a4 recordMode:(BOOL)a5 error:(id *)a6;
- (BOOL)configureAlertBehaviorForStream:(id)a3 error:(id *)a4;
- (BOOL)enableSmartRoutingConsiderationForStream:(unint64_t)a3 enable:(BOOL)a4 error:(id *)a5;
- (BOOL)isDuckingSupportedOnPickedRouteForStream:(unint64_t)a3 error:(id *)a4;
- (BOOL)isMeteringEnabledForStream:(unint64_t)a3;
- (BOOL)playAlertSoundForType:(int)a3 overrideMode:(int64_t)a4;
- (BOOL)prepareRecordForStream:(id)a3 error:(id *)a4;
- (BOOL)setAlertSoundFromURL:(id)a3 forType:(int)a4;
- (BOOL)setAnnounceCallsEnabledForStream:(unint64_t)a3 enable:(BOOL)a4;
- (BOOL)setContextForStream:(id)a3 forStream:(unint64_t)a4 error:(id *)a5;
- (BOOL)setDuckOthersForStream:(unint64_t)a3 withSettings:(id)a4 error:(id *)a5;
- (BOOL)setEnableInterruptionByRecordingClientsForStream:(unint64_t)a3 enable:(BOOL)a4 error:(id *)a5;
- (BOOL)setRecordModeForStream:(unint64_t)a3 recordMode:(int64_t)a4 error:(id *)a5;
- (BOOL)startRecordForStream:(id)a3 error:(id *)a4;
- (BOOL)stopRecordForStream:(unint64_t)a3 error:(id *)a4;
- (BOOL)updateMeterForStream:(unint64_t)a3;
- (Endpointer)endpointerDelegate;
- (NSDictionary)metrics;
- (double)getRecordBufferDurationForStream:(unint64_t)a3;
- (double)recordEndWaitTime;
- (double)recordInterspeechWaitTime;
- (double)recordStartWaitTime;
- (float)alertVolume;
- (float)getAveragePowerForStream:(unint64_t)a3 forChannel:(unint64_t)a4;
- (float)getPeakPowerForStream:(unint64_t)a3 forChannel:(unint64_t)a4;
- (id)getPlaybackRouteForStream:(unint64_t)a3 withError:(id *)a4;
- (id)getRecordDeviceInfoForStream:(unint64_t)a3;
- (id)getRecordSettingsForStream:(unint64_t)a3;
- (id)initVoiceControllerForClient:(int64_t)a3 withError:(id *)a4;
- (id)mockPluginEndpoint;
- (int)recordEndpointMode;
- (int64_t)_bringUp:(int64_t)a3 withError:(id *)a4;
- (int64_t)getCurrentSessionState;
- (int64_t)getCurrentSessionStateForStream:(unint64_t)a3;
- (int64_t)getCurrentStreamState:(unint64_t)a3;
- (int64_t)getRecordModeForStream:(unint64_t)a3;
- (shared_ptr<ControllerImpl>)impl;
- (unint64_t)alertStartTime;
- (unint64_t)getAlertStartTime;
- (unint64_t)setContext:(id)a3 error:(id *)a4;
- (unint64_t)setContext:(id)a3 streamType:(int64_t *)a4 error:(id *)a5;
- (void)_teardownWithError:(id *)a3;
- (void)alertPlaybackFinishedWithSettings:(id)a3;
- (void)beganRecording:(unint64_t)a3 status:(int)a4;
- (void)beginAudioSessionActivate:(BOOL)a3;
- (void)beginRecordInterruptionWithContext:(id)a3;
- (void)cleanSlateWithError:(id *)a3;
- (void)configureAlertBehaviorForStream:(id)a3 completion:(id)a4;
- (void)configureVoiceTriggerClientCompletionBlocks;
- (void)deactivateAudioSessionForStream:(unint64_t)a3 withOptions:(unint64_t)a4 completion:(id)a5;
- (void)deactivateAudioSessionForStream:(unint64_t)a3 withOptions:(unint64_t)a4 error:(id *)a5;
- (void)deactivateAudioSessionWithOptions:(unint64_t)a3;
- (void)dealloc;
- (void)enableMiniDucking:(BOOL)a3;
- (void)enableTriangleModeForStream:(unint64_t)a3 enable:(BOOL)a4 withCompletion:(id)a5;
- (void)encodeError:(int)a3;
- (void)endAudioSessionActivate:(BOOL)a3;
- (void)endRecordInterruption;
- (void)endpointDetectedAtTime:(double)a3;
- (void)finalize;
- (void)finishedRecording:(unint64_t)a3 status:(int)a4;
- (void)getDeviceLatenciesForStream:(unint64_t)a3 withCompletion:(id)a4;
- (void)getInputChannelInfoForStream:(unint64_t)a3 completion:(id)a4;
- (void)getPlaybackRouteForStream:(unint64_t)a3 withCompletion:(id)a4;
- (void)handleInterruption:(id)a3;
- (void)handleMediaServerDeath:(id)a3;
- (void)handleMediaServerReset:(id)a3;
- (void)handlePluginDidPublishDevice:(id)a3 withDevice:(id)a4;
- (void)handlePluginDidUnpublishDevice:(id)a3 withDevice:(id)a4;
- (void)handleRouteChange:(id)a3;
- (void)hardwareConfigChanged:(int)a3;
- (void)interspeechPointDetectedAtTime:(double)a3;
- (void)notifyEventOccured:(unint64_t)a3 error:(id)a4;
- (void)notifyStreamInvalidated:(unint64_t)a3;
- (void)playAlert:(int)a3 withOverride:(int64_t)a4 completion:(id)a5;
- (void)prepareRecordForStream:(id)a3 completion:(id)a4;
- (void)removeSessionNotifications:(id)a3;
- (void)removeStream:(unint64_t)a3 completion:(id)a4;
- (void)sessionCleanup;
- (void)sessionSetup;
- (void)setAlertVolume:(float)a3;
- (void)setContext:(id)a3 completion:(id)a4;
- (void)setEndpointerDelegate:(id)a3;
- (void)setRecordDelegate:(id)a3;
- (void)setRecordEndWaitTime:(double)a3;
- (void)setRecordEndpointMode:(int)a3;
- (void)setRecordInterspeechWaitTime:(double)a3;
- (void)setRecordStartWaitTime:(double)a3;
- (void)setRecordStatusChangeBlock:(id)a3;
- (void)setSessionNotifications:(id)a3;
- (void)startKeepAliveQueueForStream:(unint64_t)a3 completion:(id)a4;
- (void)startRecordForStream:(id)a3 completion:(id)a4;
- (void)startRecordWithSettings:(id)a3 completion:(id)a4 alertCompletion:(id)a5 audioCallback:(id)a6;
- (void)startpointDetected;
- (void)stopKeepAliveQueueForStream:(unint64_t)a3 completion:(id)a4;
- (void)stopRecordForStream:(unint64_t)a3 completion:(id)a4;
- (void)teardownWithError:(id *)a3;
@end

@implementation AVVoiceController

- (unint64_t)alertStartTime
{
  return self->_alertStartTime;
}

- (id)mockPluginEndpoint
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  if (!v8 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      v3 = *(id *)kAVVCScope;
      if (!v3)
      {
LABEL_10:
        v6 = 0;
        goto LABEL_12;
      }
    }
    else
    {
      v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      v11 = "AVVoiceController.mm";
      __int16 v12 = 1024;
      int v13 = 1892;
      __int16 v14 = 2048;
      uint64_t v15 = v8;
      __int16 v16 = 1024;
      BOOL v17 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  v6 = [*(id *)(v8 + 464) mockPluginEndpoint];
LABEL_12:
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }

  return v6;
}

- (BOOL)setEnableInterruptionByRecordingClientsForStream:(unint64_t)a3 enable:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  ElapsedTime::ElapsedTime((ElapsedTime *)v25, "-[AVVoiceController setEnableInterruptionByRecordingClientsForStream:enable:error:]", 0, 0);
  if (kAVVCScope)
  {
    v9 = *(id *)kAVVCScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "AVVoiceController.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1861;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = self;
    __int16 v21 = 2048;
    unint64_t v22 = a3;
    __int16 v23 = 1024;
    BOOL v24 = v6;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: setEnableInterruptionByRecordingClientForStream: streamHandle(%lu) enable(%d)", buf, 0x2Cu);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  *(_DWORD *)&buf[24] = 0;
  if (v18 && !self->mClientAPIClutch)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3321888768;
    v14[2] = __83__AVVoiceController_setEnableInterruptionByRecordingClientsForStream_enable_error___block_invoke;
    v14[3] = &unk_1EEFA2C40;
    v14[4] = buf;
    v14[5] = v18;
    uint64_t v15 = v19;
    if (v19) {
      atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    unint64_t v16 = a3;
    BOOL v17 = v6;
    ControllerImpl::safeWork(v18, v14, (uint64_t)"-[AVVoiceController setEnableInterruptionByRecordingClientsForStream:enable:error:]");
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
  }
  else
  {
    *(_DWORD *)&buf[24] = -11780;
  }
  int v11 = *(_DWORD *)(*(void *)&buf[8] + 24);
  int v12 = v11;
  if (a5 && v11)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v11 userInfo:0];
  }
  _Block_object_dispose(buf, 8);
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v25);
  return v12 == 0;
}

void __83__AVVoiceController_setEnableInterruptionByRecordingClientsForStream_enable_error___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = *(void *)(a1 + 56);
  char v3 = *(unsigned char *)(a1 + 64);
  std::shared_ptr<AVVCRecordingEngine>::shared_ptr[abi:ne180100]<AVVCRecordingEngine,void>(&v15, *(void *)(*(void *)(a1 + 40) + 8), *(std::__shared_weak_count **)(*(void *)(a1 + 40) + 16));
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  ControllerImpl::_lookupEngineForStreamID((ControllerImpl *)&v9, *(void *)(v15 + 576), *(std::__shared_weak_count **)(v15 + 584), v2);
  uint64_t v4 = v9;
  if (!v9)
  {
    if (kAVVCScope)
    {
      BOOL v6 = *(id *)kAVVCScope;
      if (!v6)
      {
LABEL_13:
        *((_DWORD *)v12 + 6) = -11793;
        v5 = v10;
        goto LABEL_14;
      }
    }
    else
    {
      BOOL v6 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "ControllerImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 6827;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = v2;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d setPrefersBeingInterruptedByNextActiveRecordingClient: Cannot find recording engine for streamID(%lu). Returning.", buf, 0x1Cu);
    }

    goto LABEL_13;
  }
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3321888768;
  *(void *)&buf[16] = ___ZN14ControllerImpl48setEnableInterruptionByRecordingClientsForStreamEmb_block_invoke;
  *(void *)&buf[24] = &unk_1EEFA2B98;
  v5 = v10;
  uint64_t v19 = v9;
  v20 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  char v21 = v3;
  uint64_t v18 = &v11;
  (*(void (**)(uint64_t, unsigned char *, const char *))(*(void *)v4 + 360))(v4, buf, "setEnableInterruptionByRecordingClientsForStream");
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
LABEL_14:
  int v8 = *((_DWORD *)v12 + 6);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  _Block_object_dispose(&v11, 8);
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
}

- (void)getDeviceLatenciesForStream:(unint64_t)a3 withCompletion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  ElapsedTime::ElapsedTime((ElapsedTime *)v25, "-[AVVoiceController getDeviceLatenciesForStream:withCompletion:]", 0, 0);
  if (kAVVCScope)
  {
    id v7 = *(id *)kAVVCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  uint64_t v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = _Block_copy(v6);
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "AVVoiceController.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1846;
    __int16 v19 = 2048;
    v20 = self;
    __int16 v21 = 2048;
    unint64_t v22 = a3;
    __int16 v23 = 2048;
    BOOL v24 = v10;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: getDeviceLatenciesForStream: streamHandle(%lu), completionBlock(%p)", buf, 0x30u);
  }
LABEL_8:
  [(AVVoiceController *)self impl];
  uint64_t v11 = *(void *)buf;
  if (*(void *)buf && !self->mClientAPIClutch)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3321888768;
    v13[2] = __64__AVVoiceController_getDeviceLatenciesForStream_withCompletion___block_invoke;
    v13[3] = &unk_1EEFA7FA0;
    uint64_t v15 = *(void *)buf;
    unint64_t v16 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8]) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 1uLL, memory_order_relaxed);
    }
    unint64_t v17 = a3;
    id v14 = v6;
    ControllerImpl::safeWork(v11, v13, (uint64_t)"-[AVVoiceController getDeviceLatenciesForStream:withCompletion:]");

    if (v16) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v16);
    }
  }
  else if (v6)
  {
    int v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11780 userInfo:0];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v12);
  }
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v25);
}

void __64__AVVoiceController_getDeviceLatenciesForStream_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  unint64_t v1 = *(void *)(a1 + 56);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  std::shared_ptr<AVVCRecordingEngine>::shared_ptr[abi:ne180100]<AVVCRecordingEngine,void>(&v34, *(void *)(v2 + 8), *(std::__shared_weak_count **)(v2 + 16));
  uint64_t v4 = ControllerImpl::sessionManagerForStreamID(v34, v1, 0);
  if ([v4 sessionState] != 7)
  {
    if (kAVVCScope)
    {
      v27 = *(id *)kAVVCScope;
      if (!v27)
      {
LABEL_12:
        *(double *)&uint64_t v26 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11782 userInfo:0];
        v25 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      v27 = MEMORY[0x1E4F14500];
      id v28 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "ControllerImpl.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 6803;
      *(_WORD *)&unsigned char buf[18] = 2048;
      *(void *)&buf[20] = v1;
      _os_log_impl(&dword_19D794000, v27, OS_LOG_TYPE_DEFAULT, "%25s:%-5d getDeviceLatencies: Session for streamID(%lu) is not active !!!.", buf, 0x1Cu);
    }

    goto LABEL_12;
  }
  [v4 inputLatency];
  double v6 = v5;
  [v4 outputLatency];
  double v8 = v7;
  [v4 inputSafetyOffset];
  double v10 = v9;
  [v4 outputSafetyOffset];
  double v12 = v11;
  float v13 = v6;
  id v14 = (void *)MEMORY[0x1E4F1C9E8];
  *(float *)&double v11 = v13;
  uint64_t v15 = [NSNumber numberWithFloat:v11];
  float v16 = v8;
  *(float *)&double v17 = v16;
  uint64_t v18 = [NSNumber numberWithFloat:v17];
  float v19 = v10;
  *(float *)&double v20 = v19;
  __int16 v21 = [NSNumber numberWithFloat:v20];
  float v22 = v12;
  *(float *)&double v23 = v22;
  BOOL v24 = [NSNumber numberWithFloat:v23];
  v25 = objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v15, @"AVVCCurrentInputDeviceLatency", v18, @"AVVCCurrentOutputDeviceLatency", v21, @"AVVCCurrentInputSafetyOffset", v24, @"AVVCCurrentOutputSafetyOffset", 0);

  if (kAVVCScope)
  {
    *(double *)&uint64_t v26 = COERCE_DOUBLE(*(id *)kAVVCScope);
    if (*(double *)&v26 == 0.0) {
      goto LABEL_17;
    }
  }
  else
  {
    *(double *)&uint64_t v26 = MEMORY[0x1E4F14500];
    id v29 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316674;
    *(void *)&uint8_t buf[4] = "ControllerImpl.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 6800;
    *(_WORD *)&unsigned char buf[18] = 2048;
    *(void *)&buf[20] = v1;
    *(_WORD *)&unsigned char buf[28] = 2048;
    *(double *)&buf[30] = v13;
    *(_WORD *)&buf[38] = 2048;
    double v37 = v16;
    *(_WORD *)v38 = 2048;
    *(double *)&v38[2] = v19;
    __int16 v39 = 2048;
    double v40 = v22;
    _os_log_impl(&dword_19D794000, v26, OS_LOG_TYPE_DEFAULT, "%25s:%-5d getDeviceLatencies: streamID(%lu) : input Latency(%f), output latency(%f), input safety offset (%f), output safety offset (%f)", buf, 0x44u);
  }

  *(double *)&uint64_t v26 = 0.0;
LABEL_17:
  uint64_t v30 = v34;
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = ___ZN14ControllerImpl18getDeviceLatenciesEmU13block_pointerFvP12NSDictionaryP7NSErrorE_block_invoke;
  *(void *)&buf[24] = &unk_1E5965D28;
  id v31 = v3;
  double v37 = *(double *)&v26;
  *(void *)v38 = v31;
  *(void *)&unsigned char buf[32] = v25;
  v32 = v26;
  id v33 = v25;
  ControllerImpl::safeNotifyAlwaysAsync(v30, v3 != 0, buf);

  if (v35) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v35);
  }
}

- (void)stopKeepAliveQueueForStream:(unint64_t)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  ElapsedTime::ElapsedTime((ElapsedTime *)v24, "-[AVVoiceController stopKeepAliveQueueForStream:completion:]", 0, 0);
  [(AVVoiceController *)self impl];
  if (kAVVCScope)
  {
    id v7 = *(id *)kAVVCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  double v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = _Block_copy(v6);
    *(_DWORD *)buf = 136316162;
    uint64_t v15 = "AVVoiceController.mm";
    __int16 v16 = 1024;
    int v17 = 1834;
    __int16 v18 = 2048;
    float v19 = self;
    __int16 v20 = 2048;
    unint64_t v21 = a3;
    __int16 v22 = 2048;
    double v23 = v10;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: stopKeepAliveQueueForStream: streamHandle(%lu) completion(%p)", buf, 0x30u);
  }
LABEL_8:
  if (v12 && !self->mClientAPIClutch)
  {
    ControllerImpl::stopKeepAliveQueueForStream(v12, a3, v6);
  }
  else if (v6)
  {
    double v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11780 userInfo:0];
    (*((void (**)(id, unint64_t, void, void *))v6 + 2))(v6, a3, 0, v11);
  }
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v24);
}

- (void)startKeepAliveQueueForStream:(unint64_t)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  ElapsedTime::ElapsedTime((ElapsedTime *)v24, "-[AVVoiceController startKeepAliveQueueForStream:completion:]", 0, 0);
  [(AVVoiceController *)self impl];
  if (kAVVCScope)
  {
    id v7 = *(id *)kAVVCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  double v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = _Block_copy(v6);
    *(_DWORD *)buf = 136316162;
    uint64_t v15 = "AVVoiceController.mm";
    __int16 v16 = 1024;
    int v17 = 1821;
    __int16 v18 = 2048;
    float v19 = self;
    __int16 v20 = 2048;
    unint64_t v21 = a3;
    __int16 v22 = 2048;
    double v23 = v10;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: startKeepAliveQueueForStream: streamHandle(%lu) completion(%p)", buf, 0x30u);
  }
LABEL_8:
  if (v12 && !self->mClientAPIClutch)
  {
    ControllerImpl::startKeepAliveQueueForStream(v12, a3, v6);
  }
  else if (v6)
  {
    double v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11780 userInfo:0];
    (*((void (**)(id, unint64_t, void, void *))v6 + 2))(v6, a3, 0, v11);
  }
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v24);
}

- (id)getPlaybackRouteForStream:(unint64_t)a3 withError:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v18 = 0;
  if (kAVVCScope)
  {
    id v6 = *(id *)kAVVCScope;
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    id v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVVoiceController.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1805;
    *(_WORD *)&unsigned char buf[18] = 2048;
    *(void *)&buf[20] = a3;
    _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ### getPlaybackRouteForStream:withError: streamHandle(%lu)", buf, 0x1Cu);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  if (!v16 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      id v8 = *(id *)kAVVCScope;
      if (!v8)
      {
LABEL_17:
        id v11 = 0;
        goto LABEL_26;
      }
    }
    else
    {
      id v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "AVVoiceController.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1807;
      *(_WORD *)&unsigned char buf[18] = 2048;
      *(void *)&buf[20] = v16;
      *(_WORD *)&unsigned char buf[28] = 1024;
      *(_DWORD *)&buf[30] = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_17;
  }
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = ___ZN14ControllerImpl16getPlaybackRouteEPU8__strongP8NSStringm_block_invoke;
  *(void *)&buf[24] = &__block_descriptor_56_e41_v16__0__NSObject_OS_dispatch_semaphore__8l;
  *(void *)&unsigned char buf[32] = v16;
  unint64_t v20 = a3;
  unint64_t v21 = &v18;
  makeSynchronous(buf);
  if (!kAVVCScope)
  {
    uint64_t v12 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
    goto LABEL_22;
  }
  uint64_t v12 = *(id *)kAVVCScope;
  if (v12)
  {
LABEL_22:
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AVVoiceController.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1812;
      *(_WORD *)&unsigned char buf[18] = 2112;
      *(void *)&buf[20] = v18;
      _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Playback route: %@", buf, 0x1Cu);
    }
  }
  id v11 = v18;
LABEL_26:
  id v14 = v11;
  if (v17)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
    id v14 = v18;
  }

  return v11;
}

- (void)getPlaybackRouteForStream:(unint64_t)a3 withCompletion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  ElapsedTime::ElapsedTime((ElapsedTime *)v22, "-[AVVoiceController getPlaybackRouteForStream:withCompletion:]", 0, 0);
  if (kAVVCScope)
  {
    id v7 = *(id *)kAVVCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  id v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = _Block_copy(v6);
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "AVVoiceController.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1786;
    __int16 v18 = 2048;
    unint64_t v19 = a3;
    __int16 v20 = 2048;
    unint64_t v21 = v10;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ### getPlaybackRouteForStream: streamHandle(%lu) completionBlock(%p)", buf, 0x26u);
  }
LABEL_8:
  [(AVVoiceController *)self impl];
  uint64_t v11 = *(void *)buf;
  if (*(void *)buf && !self->mClientAPIClutch)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3321888768;
    v12[2] = __62__AVVoiceController_getPlaybackRouteForStream_withCompletion___block_invoke;
    v12[3] = &unk_1EEFA7FA0;
    uint64_t v14 = *(void *)buf;
    uint64_t v15 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8]) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 1uLL, memory_order_relaxed);
    }
    unint64_t v16 = a3;
    id v13 = v6;
    ControllerImpl::safeWork(v11, v12, (uint64_t)"-[AVVoiceController getPlaybackRouteForStream:withCompletion:]");

    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
  }
  else if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v22);
}

void __62__AVVoiceController_getPlaybackRouteForStream_withCompletion___block_invoke(uint64_t a1)
{
}

- (void)enableTriangleModeForStream:(unint64_t)a3 enable:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  ElapsedTime::ElapsedTime((ElapsedTime *)v24, "-[AVVoiceController enableTriangleModeForStream:enable:withCompletion:]", 0, 0);
  [(AVVoiceController *)self impl];
  if (kAVVCScope)
  {
    id v9 = *(id *)kAVVCScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v15 = "AVVoiceController.mm";
    __int16 v16 = 1024;
    int v17 = 1774;
    __int16 v18 = 2048;
    unint64_t v19 = self;
    __int16 v20 = 2048;
    unint64_t v21 = a3;
    __int16 v22 = 1024;
    BOOL v23 = v5;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: enableTriangleModeForStream: streamHandle(%lu), opt value : %d", buf, 0x2Cu);
  }

LABEL_8:
  if (v12 && !self->mClientAPIClutch)
  {
    ControllerImpl::enableTriangleModeForStream(v12, a3, v5, v8);
  }
  else if (v8)
  {
    uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11780 userInfo:0];
    (*((void (**)(id, unint64_t, void, void *))v8 + 2))(v8, a3, 0, v11);
  }
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v24);
}

- (BOOL)isDuckingSupportedOnPickedRouteForStream:(unint64_t)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  ElapsedTime::ElapsedTime((ElapsedTime *)v28, "-[AVVoiceController isDuckingSupportedOnPickedRouteForStream:error:]", 0, 0);
  [(AVVoiceController *)self impl];
  uint64_t v7 = (uint64_t)v18;
  if (!v18 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      id v8 = *(id *)kAVVCScope;
      if (!v8)
      {
LABEL_10:
        id v11 = 0;
        char isDuckingSupportedOnPickedRouteForStream = 0;
        goto LABEL_11;
      }
    }
    else
    {
      id v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      unint64_t v21 = "AVVoiceController.mm";
      __int16 v22 = 1024;
      int v23 = 1759;
      __int16 v24 = 2048;
      uint64_t v25 = v18;
      __int16 v26 = 1024;
      LODWORD(v27) = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  if (!kAVVCScope)
  {
    uint64_t v14 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
    goto LABEL_18;
  }
  uint64_t v14 = *(id *)kAVVCScope;
  if (v14)
  {
LABEL_18:
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      unint64_t v21 = "AVVoiceController.mm";
      __int16 v22 = 1024;
      int v23 = 1760;
      __int16 v24 = 2048;
      uint64_t v25 = self;
      __int16 v26 = 2048;
      unint64_t v27 = a3;
      _os_log_impl(&dword_19D794000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: isDuckingSupportedOnPickedRouteForStream: streamHandle(%lu)", buf, 0x26u);
    }

    uint64_t v7 = (uint64_t)v18;
  }
  id v17 = 0;
  char isDuckingSupportedOnPickedRouteForStream = ControllerImpl::isDuckingSupportedOnPickedRouteForStream(v7, a3, &v17);
  id v16 = v17;
  id v11 = v16;
  if (a4)
  {
    id v11 = v16;
    *a4 = v11;
  }
LABEL_11:
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }

  ElapsedTime::~ElapsedTime((ElapsedTime *)v28);
  return isDuckingSupportedOnPickedRouteForStream;
}

- (BOOL)setDuckOthersForStream:(unint64_t)a3 withSettings:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  ElapsedTime::ElapsedTime((ElapsedTime *)v31, "-[AVVoiceController setDuckOthersForStream:withSettings:error:]", 0, 0);
  if (kAVVCScope)
  {
    id v9 = *(id *)kAVVCScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    __int16 v22 = "AVVoiceController.mm";
    __int16 v23 = 1024;
    int v24 = 1743;
    __int16 v25 = 2048;
    __int16 v26 = self;
    __int16 v27 = 2048;
    unint64_t v28 = a3;
    __int16 v29 = 2112;
    id v30 = v8;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: setDuckOthersForStream: streamHandle(%lu), duckSettings(%@)", buf, 0x30u);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  if (!v19 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      id v11 = *(id *)kAVVCScope;
      if (!v11)
      {
LABEL_17:
        id v14 = 0;
        char v15 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      id v11 = MEMORY[0x1E4F14500];
      id v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      __int16 v22 = "AVVoiceController.mm";
      __int16 v23 = 1024;
      int v24 = 1745;
      __int16 v25 = 2048;
      __int16 v26 = v19;
      __int16 v27 = 1024;
      LODWORD(v28) = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_17;
  }
  id v18 = 0;
  char v15 = ControllerImpl::setDuckOthersForStream((uint64_t)v19, a3, v8, &v18);
  id v17 = v18;
  id v14 = v17;
  if (a5)
  {
    id v14 = v17;
    *a5 = v14;
  }
LABEL_18:
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }

  ElapsedTime::~ElapsedTime((ElapsedTime *)v31);
  return v15;
}

- (void)getInputChannelInfoForStream:(unint64_t)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(AVVoiceController *)self impl];
  if (kAVVCScope)
  {
    uint64_t v7 = *(id *)kAVVCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    id v13 = "AVVoiceController.mm";
    __int16 v14 = 1024;
    int v15 = 1728;
    __int16 v16 = 2048;
    id v17 = self;
    __int16 v18 = 2048;
    unint64_t v19 = a3;
    _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: getInputChannelInfoForStream: streamHandle(%lu)", buf, 0x26u);
  }

LABEL_8:
  if (v10 && !self->mClientAPIClutch)
  {
    ControllerImpl::getInputChannelInfoForStream(v10, v6);
  }
  else if (v6)
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11780 userInfo:0];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v9);
  }
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
}

- (BOOL)setAnnounceCallsEnabledForStream:(unint64_t)a3 enable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (kAVVCScope)
  {
    uint64_t v7 = *(id *)kAVVCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    id v17 = "AVVoiceController.mm";
    __int16 v18 = 1024;
    int v19 = 1715;
    __int16 v20 = 2048;
    unint64_t v21 = self;
    __int16 v22 = 2048;
    unint64_t v23 = a3;
    __int16 v24 = 1024;
    BOOL v25 = v4;
    _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: setAnnounceCallsEnabledForStream: streamHandle(%lu), enable : %d", buf, 0x2Cu);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  if (!v14 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      id v9 = *(id *)kAVVCScope;
      if (!v9)
      {
LABEL_17:
        BOOL v12 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      id v9 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      id v17 = "AVVoiceController.mm";
      __int16 v18 = 1024;
      int v19 = 1717;
      __int16 v20 = 2048;
      unint64_t v21 = (AVVoiceController *)v14;
      __int16 v22 = 1024;
      LODWORD(v23) = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_17;
  }
  BOOL v12 = ControllerImpl::setAnnounceCallsEnabledForStream(v14, a3, v4) == 0;
LABEL_19:
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  return v12;
}

- (int64_t)getRecordModeForStream:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (kAVVCScope)
  {
    BOOL v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    int v15 = "AVVoiceController.mm";
    __int16 v16 = 1024;
    int v17 = 1701;
    __int16 v18 = 2048;
    int v19 = self;
    __int16 v20 = 2048;
    unint64_t v21 = a3;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: getRecordModeForStream: streamHandle(%lu)", buf, 0x26u);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  if (!v12 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      uint64_t v7 = *(id *)kAVVCScope;
      if (!v7)
      {
LABEL_17:
        int64_t RecordModeForStream = 0;
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      int v15 = "AVVoiceController.mm";
      __int16 v16 = 1024;
      int v17 = 1703;
      __int16 v18 = 2048;
      int v19 = (AVVoiceController *)v12;
      __int16 v20 = 1024;
      LODWORD(v21) = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_17;
  }
  int64_t RecordModeForStream = ControllerImpl::getRecordModeForStream(v12, a3);
LABEL_19:
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  return RecordModeForStream;
}

- (BOOL)setRecordModeForStream:(unint64_t)a3 recordMode:(int64_t)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  int v19 = 4122;
  char v20 = 1;
  long long v21 = 0u;
  long long v22 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v33, "-[AVVoiceController setRecordModeForStream:recordMode:error:]", 0, 0);
  if (kAVVCScope)
  {
    id v9 = *(id *)kAVVCScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    __int16 v24 = "AVVoiceController.mm";
    __int16 v25 = 1024;
    int v26 = 1680;
    __int16 v27 = 2048;
    unint64_t v28 = self;
    __int16 v29 = 2048;
    unint64_t v30 = a3;
    __int16 v31 = 1024;
    int v32 = a4;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: setRecordModeForStream: streamHandle(%lu), mode : %d", buf, 0x2Cu);
  }

LABEL_8:
  if (!a4)
  {
    LOBYTE(v11) = 0;
    goto LABEL_25;
  }
  [(AVVoiceController *)self impl];
  if (v17 && !self->mClientAPIClutch)
  {
    int v14 = ControllerImpl::setRecordModeForStream(v17, a3, a4);
    int v15 = v14;
    if (a5 && v14)
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v14 userInfo:0];
    }
    LOBYTE(v11) = v15 == 0;
    goto LABEL_23;
  }
  if (!kAVVCScope)
  {
    id v11 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
    goto LABEL_16;
  }
  id v11 = *(id *)kAVVCScope;
  if (v11)
  {
LABEL_16:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      __int16 v24 = "AVVoiceController.mm";
      __int16 v25 = 1024;
      int v26 = 1686;
      __int16 v27 = 2048;
      unint64_t v28 = (AVVoiceController *)v17;
      __int16 v29 = 1024;
      LODWORD(v30) = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    LOBYTE(v11) = 0;
  }
LABEL_23:
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
LABEL_25:
  ElapsedTime::~ElapsedTime((ElapsedTime *)v33);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v19);
  return (char)v11;
}

- (BOOL)enableSmartRoutingConsiderationForStream:(unint64_t)a3 enable:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  ElapsedTime::ElapsedTime((ElapsedTime *)v29, "-[AVVoiceController enableSmartRoutingConsiderationForStream:enable:error:]", 0, 0);
  if (kAVVCScope)
  {
    id v9 = *(id *)kAVVCScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    char v20 = "AVVoiceController.mm";
    __int16 v21 = 1024;
    int v22 = 1660;
    __int16 v23 = 2048;
    __int16 v24 = self;
    __int16 v25 = 2048;
    unint64_t v26 = a3;
    __int16 v27 = 1024;
    BOOL v28 = v6;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: enableSmartRoutingConsideration: streamHandle(%lu), enable : %d", buf, 0x2Cu);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  if (v17 && !self->mClientAPIClutch)
  {
    int v14 = ControllerImpl::enableSmartRoutingConsideration(v17, a3, v6);
    int v15 = v14;
    if (a5 && v14)
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v14 userInfo:0];
    }
    LOBYTE(v11) = v15 == 0;
  }
  else
  {
    if (kAVVCScope)
    {
      id v11 = *(id *)kAVVCScope;
      if (!v11) {
        goto LABEL_21;
      }
    }
    else
    {
      id v11 = MEMORY[0x1E4F14500];
      id v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      char v20 = "AVVoiceController.mm";
      __int16 v21 = 1024;
      int v22 = 1662;
      __int16 v23 = 2048;
      __int16 v24 = (AVVoiceController *)v17;
      __int16 v25 = 1024;
      LODWORD(v26) = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    LOBYTE(v11) = 0;
  }
LABEL_21:
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v29);
  return (char)v11;
}

- (void)setRecordStatusChangeBlock:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (kAVVCScope)
  {
    BOOL v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v13 = "AVVoiceController.mm";
    __int16 v14 = 1024;
    int v15 = 1650;
    __int16 v16 = 2048;
    uint64_t v17 = self;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: setRecordStatusChangeBlock", buf, 0x1Cu);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  if (v10 && !self->mClientAPIClutch)
  {
    ControllerImpl::setRecordStatusChangeBlock(v10, v4);
    goto LABEL_18;
  }
  if (kAVVCScope)
  {
    uint64_t v7 = *(id *)kAVVCScope;
    if (!v7) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    BOOL mClientAPIClutch = self->mClientAPIClutch;
    *(_DWORD *)buf = 136315906;
    id v13 = "AVVoiceController.mm";
    __int16 v14 = 1024;
    int v15 = 1651;
    __int16 v16 = 2048;
    uint64_t v17 = (AVVoiceController *)v10;
    __int16 v18 = 1024;
    BOOL v19 = mClientAPIClutch;
    _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
  }

LABEL_18:
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
}

- (float)getAveragePowerForStream:(unint64_t)a3 forChannel:(unint64_t)a4
{
  int v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  if (!v12 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      uint64_t v7 = *(id *)kAVVCScope;
      if (!v7)
      {
LABEL_10:
        float AveragePowerForStreamAndChannel = 0.0;
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      int v15 = "AVVoiceController.mm";
      __int16 v16 = 1024;
      int v17 = 1645;
      __int16 v18 = 2048;
      BOOL v19 = v12;
      __int16 v20 = 1024;
      BOOL v21 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  float AveragePowerForStreamAndChannel = ControllerImpl::getAveragePowerForStreamAndChannel(v12, a3, v4);
LABEL_12:
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  return AveragePowerForStreamAndChannel;
}

- (float)getPeakPowerForStream:(unint64_t)a3 forChannel:(unint64_t)a4
{
  int v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  if (!v12 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      uint64_t v7 = *(id *)kAVVCScope;
      if (!v7)
      {
LABEL_10:
        float PeakPowerForStreamAndChannel = 0.0;
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      int v15 = "AVVoiceController.mm";
      __int16 v16 = 1024;
      int v17 = 1640;
      __int16 v18 = 2048;
      BOOL v19 = v12;
      __int16 v20 = 1024;
      BOOL v21 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  float PeakPowerForStreamAndChannel = ControllerImpl::getPeakPowerForStreamAndChannel(v12, a3, v4);
LABEL_12:
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  return PeakPowerForStreamAndChannel;
}

- (BOOL)updateMeterForStream:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  if (!v10 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      BOOL v5 = *(id *)kAVVCScope;
      if (!v5)
      {
LABEL_10:
        char updated = 0;
        goto LABEL_12;
      }
    }
    else
    {
      BOOL v5 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      id v13 = "AVVoiceController.mm";
      __int16 v14 = 1024;
      int v15 = 1635;
      __int16 v16 = 2048;
      int v17 = v10;
      __int16 v18 = 1024;
      BOOL v19 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  char updated = ControllerImpl::updateMeterLevelForStream(v10, a3);
LABEL_12:
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  return updated;
}

- (BOOL)isMeteringEnabledForStream:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  if (!v10 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      BOOL v5 = *(id *)kAVVCScope;
      if (!v5)
      {
LABEL_10:
        char isMeteringEnabledForStream = 0;
        goto LABEL_12;
      }
    }
    else
    {
      BOOL v5 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      id v13 = "AVVoiceController.mm";
      __int16 v14 = 1024;
      int v15 = 1630;
      __int16 v16 = 2048;
      int v17 = v10;
      __int16 v18 = 1024;
      BOOL v19 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  char isMeteringEnabledForStream = ControllerImpl::isMeteringEnabledForStream(v10, a3);
LABEL_12:
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  return isMeteringEnabledForStream;
}

- (id)getRecordSettingsForStream:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  if (!v10 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      BOOL v5 = *(id *)kAVVCScope;
      if (!v5)
      {
LABEL_10:
        id v8 = 0;
        goto LABEL_12;
      }
    }
    else
    {
      BOOL v5 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      id v13 = "AVVoiceController.mm";
      __int16 v14 = 1024;
      int v15 = 1624;
      __int16 v16 = 2048;
      int v17 = v10;
      __int16 v18 = 1024;
      BOOL v19 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  id v8 = ControllerImpl::getRecordSettingsForStream(v10, self, a3);
LABEL_12:
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }

  return v8;
}

- (double)getRecordBufferDurationForStream:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  if (!v10 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      BOOL v5 = *(id *)kAVVCScope;
      if (!v5)
      {
LABEL_10:
        double RecordBufferDurationForStream = 0.0;
        goto LABEL_12;
      }
    }
    else
    {
      BOOL v5 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      id v13 = "AVVoiceController.mm";
      __int16 v14 = 1024;
      int v15 = 1618;
      __int16 v16 = 2048;
      int v17 = v10;
      __int16 v18 = 1024;
      BOOL v19 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  double RecordBufferDurationForStream = ControllerImpl::getRecordBufferDurationForStream(v10, a3);
LABEL_12:
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  return RecordBufferDurationForStream;
}

- (BOOL)playAlertSoundForType:(int)a3 overrideMode:(int64_t)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int v20 = 4145;
  char v21 = 1;
  long long v22 = 0u;
  long long v23 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v34, "-[AVVoiceController playAlertSoundForType:overrideMode:]", 0, 0);
  [(AVVoiceController *)self impl];
  uint64_t v7 = v18;
  if (!v18 || *(unsigned char *)(v18 + 521) || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      id v8 = *(id *)kAVVCScope;
      if (!v8) {
        goto LABEL_12;
      }
    }
    else
    {
      id v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      LOBYTE(v8) = 0;
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136315394;
    __int16 v25 = "AVVoiceController.mm";
    __int16 v26 = 1024;
    int v27 = 1604;
    uint64_t v10 = "%25s:%-5d call to playAlertSoundForType blocked because mediaserverd is dead";
    id v11 = v8;
    uint32_t v12 = 18;
LABEL_10:
    _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
    goto LABEL_11;
  }
  if (kAVVCScope)
  {
    __int16 v14 = *(id *)kAVVCScope;
    if (!v14) {
      goto LABEL_22;
    }
  }
  else
  {
    __int16 v14 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    __int16 v25 = "AVVoiceController.mm";
    __int16 v26 = 1024;
    int v27 = 1608;
    __int16 v28 = 2048;
    __int16 v29 = self;
    __int16 v30 = 1024;
    int v31 = a3;
    __int16 v32 = 1024;
    int v33 = a4;
    _os_log_impl(&dword_19D794000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: playAlertSoundForStream: alertType(%d) overrideMode(%d)", buf, 0x28u);
  }

  uint64_t v7 = v18;
LABEL_22:
  int v16 = ControllerImpl::playAlertWithOverride(v7, self, a3, a4);
  if (!v16)
  {
    LOBYTE(v8) = 1;
    goto LABEL_12;
  }
  if (!kAVVCScope)
  {
    id v8 = MEMORY[0x1E4F14500];
    id v17 = MEMORY[0x1E4F14500];
    goto LABEL_28;
  }
  id v8 = *(id *)kAVVCScope;
  if (v8)
  {
LABEL_28:
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 136315650;
    __int16 v25 = "AVVoiceController.mm";
    __int16 v26 = 1024;
    int v27 = 1611;
    __int16 v28 = 1024;
    LODWORD(v29) = v16;
    uint64_t v10 = "%25s:%-5d playAlertSoundForStream failed with error : %d";
    id v11 = v8;
    uint32_t v12 = 24;
    goto LABEL_10;
  }
LABEL_12:
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v34);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v20);
  return (char)v8;
}

- (void)playAlert:(int)a3 withOverride:(int64_t)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  int v16 = 4145;
  char v17 = 1;
  long long v18 = 0u;
  long long v19 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v30, "-[AVVoiceController playAlert:withOverride:completion:]", 0, 0);
  if (kAVVCScope)
  {
    id v9 = *(id *)kAVVCScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    char v21 = "AVVoiceController.mm";
    __int16 v22 = 1024;
    int v23 = 1592;
    __int16 v24 = 2048;
    __int16 v25 = self;
    __int16 v26 = 1024;
    int v27 = a3;
    __int16 v28 = 1024;
    int v29 = a4;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: playAlert alertType(%d). overrideMode(%d)", buf, 0x28u);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  if (v14 && !self->mClientAPIClutch)
  {
    ControllerImpl::playAlertWithCompletion(v14, self, a3, a4, v8);
    goto LABEL_18;
  }
  if (kAVVCScope)
  {
    id v11 = *(id *)kAVVCScope;
    if (!v11) {
      goto LABEL_18;
    }
  }
  else
  {
    id v11 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    BOOL mClientAPIClutch = self->mClientAPIClutch;
    *(_DWORD *)buf = 136315906;
    char v21 = "AVVoiceController.mm";
    __int16 v22 = 1024;
    int v23 = 1593;
    __int16 v24 = 2048;
    __int16 v25 = (AVVoiceController *)v14;
    __int16 v26 = 1024;
    int v27 = mClientAPIClutch;
    _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
  }

LABEL_18:
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v30);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v16);
}

- (BOOL)setContextForStream:(id)a3 forStream:(unint64_t)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = (AVVCContextSettings *)a3;
  int v24 = 4146;
  char v25 = 1;
  long long v26 = 0u;
  long long v27 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v40, "-[AVVoiceController setContextForStream:forStream:error:]", 0, 0);
  if (kAVVCScope)
  {
    id v9 = *(id *)kAVVCScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = (id)MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  id v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = Get4CCFromInt([(AVVCContextSettings *)v8 activationMode]);
    id v13 = [(AVVCContextSettings *)v8 activationDeviceUID];
    *(_DWORD *)buf = 136316418;
    int v29 = "AVVoiceController.mm";
    __int16 v30 = 1024;
    int v31 = 1576;
    __int16 v32 = 2048;
    int v33 = self;
    __int16 v34 = 2112;
    uint64_t v35 = v12;
    __int16 v36 = 2112;
    double v37 = v13;
    __int16 v38 = 2048;
    unint64_t v39 = a4;
    _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: setContextForStream: activationMode(%@), deviceUID(%@). streamHandle(%lu)", buf, 0x3Au);
  }
LABEL_8:
  [(AVVoiceController *)self impl];
  if (!v22 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      uint64_t v14 = *(id *)kAVVCScope;
      if (!v14)
      {
LABEL_17:
        BOOL v17 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v14 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      int v29 = "AVVoiceController.mm";
      __int16 v30 = 1024;
      int v31 = 1577;
      __int16 v32 = 2048;
      int v33 = (AVVoiceController *)v22;
      __int16 v34 = 1024;
      LODWORD(v35) = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_17;
  }
  int v19 = ControllerImpl::setContextForStream(v22, self, v8, a4);
  BOOL v17 = v19 == 0;
  if (a5 && v19)
  {
    uint64_t v20 = v19;
    if (v19 == 560557673) {
      uint64_t v20 = -11785;
    }
    if (v19 == -66671) {
      uint64_t v21 = -11785;
    }
    else {
      uint64_t v21 = v20;
    }
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v21 userInfo:0];
    BOOL v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_18:
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v23);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v40);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v24);

  return v17;
}

- (int64_t)getCurrentSessionStateForStream:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  if (!v10 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      BOOL v5 = *(id *)kAVVCScope;
      if (!v5)
      {
LABEL_10:
        int64_t AVVCSessionState = 0;
        goto LABEL_12;
      }
    }
    else
    {
      BOOL v5 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      id v13 = "AVVoiceController.mm";
      __int16 v14 = 1024;
      int v15 = 1568;
      __int16 v16 = 2048;
      BOOL v17 = v10;
      __int16 v18 = 1024;
      BOOL v19 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  int64_t AVVCSessionState = ControllerImpl::getAVVCSessionState(v10, a3);
LABEL_12:
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  return AVVCSessionState;
}

- (int64_t)getCurrentSessionState
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  if (!v8 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      id v3 = *(id *)kAVVCScope;
      if (!v3)
      {
LABEL_10:
        int64_t AVVCSessionState = 0;
        goto LABEL_12;
      }
    }
    else
    {
      id v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      id v11 = "AVVoiceController.mm";
      __int16 v12 = 1024;
      int v13 = 1563;
      __int16 v14 = 2048;
      int v15 = v8;
      __int16 v16 = 1024;
      BOOL v17 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  int64_t AVVCSessionState = ControllerImpl::getAVVCSessionState(v8, 0);
LABEL_12:
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  return AVVCSessionState;
}

- (void)deactivateAudioSessionForStream:(unint64_t)a3 withOptions:(unint64_t)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  int v16 = 4144;
  char v17 = 1;
  long long v18 = 0u;
  long long v19 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v30, "-[AVVoiceController deactivateAudioSessionForStream:withOptions:error:]", 0, 0);
  if (kAVVCScope)
  {
    id v9 = *(id *)kAVVCScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v21 = "AVVoiceController.mm";
    __int16 v22 = 1024;
    int v23 = 1556;
    __int16 v24 = 2048;
    char v25 = self;
    __int16 v26 = 1024;
    int v27 = a3;
    __int16 v28 = 2048;
    unint64_t v29 = a4;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: deactivateAudioSessionForStream:(%d) withOptions(%lu)", buf, 0x2Cu);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  if (v14 && !self->mClientAPIClutch)
  {
    ControllerImpl::deactivateAudioSessionWithOptions(v14, self, a4, a3, a5);
    goto LABEL_18;
  }
  if (kAVVCScope)
  {
    id v11 = *(id *)kAVVCScope;
    if (!v11) {
      goto LABEL_18;
    }
  }
  else
  {
    id v11 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    BOOL mClientAPIClutch = self->mClientAPIClutch;
    *(_DWORD *)buf = 136315906;
    uint64_t v21 = "AVVoiceController.mm";
    __int16 v22 = 1024;
    int v23 = 1557;
    __int16 v24 = 2048;
    char v25 = (AVVoiceController *)v14;
    __int16 v26 = 1024;
    int v27 = mClientAPIClutch;
    _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
  }

LABEL_18:
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v30);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v16);
}

- (void)deactivateAudioSessionForStream:(unint64_t)a3 withOptions:(unint64_t)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  int v16 = 4144;
  char v17 = 1;
  long long v18 = 0u;
  long long v19 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v30, "-[AVVoiceController deactivateAudioSessionForStream:withOptions:completion:]", 0, 0);
  if (kAVVCScope)
  {
    id v9 = *(id *)kAVVCScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v21 = "AVVoiceController.mm";
    __int16 v22 = 1024;
    int v23 = 1547;
    __int16 v24 = 2048;
    char v25 = self;
    __int16 v26 = 1024;
    int v27 = a3;
    __int16 v28 = 2048;
    unint64_t v29 = a4;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: deactivateAudioSessionForStream:(%d) withOptions(%lu) completion:", buf, 0x2Cu);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  if (v14 && !self->mClientAPIClutch)
  {
    ControllerImpl::deactivateAudioSessionWithOptions(v14, self, a4, a3, v8);
    goto LABEL_18;
  }
  if (kAVVCScope)
  {
    id v11 = *(id *)kAVVCScope;
    if (!v11) {
      goto LABEL_18;
    }
  }
  else
  {
    id v11 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    BOOL mClientAPIClutch = self->mClientAPIClutch;
    *(_DWORD *)buf = 136315906;
    uint64_t v21 = "AVVoiceController.mm";
    __int16 v22 = 1024;
    int v23 = 1548;
    __int16 v24 = 2048;
    char v25 = (AVVoiceController *)v14;
    __int16 v26 = 1024;
    int v27 = mClientAPIClutch;
    _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
  }

LABEL_18:
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v30);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v16);
}

- (void)deactivateAudioSessionWithOptions:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v12 = 4144;
  char v13 = 1;
  long long v14 = 0u;
  long long v15 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v24, "-[AVVoiceController deactivateAudioSessionWithOptions:]", 0, 0);
  if (kAVVCScope)
  {
    BOOL v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    char v17 = "AVVoiceController.mm";
    __int16 v18 = 1024;
    int v19 = 1538;
    __int16 v20 = 2048;
    uint64_t v21 = self;
    __int16 v22 = 2048;
    unint64_t v23 = a3;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: deactivateAudioSessionWithOptions(%lu)", buf, 0x26u);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  if (v10 && !self->mClientAPIClutch)
  {
    ControllerImpl::deactivateAudioSessionWithOptions(v10, self, a3, *(void *)(v10 + 472), 0);
    goto LABEL_18;
  }
  if (kAVVCScope)
  {
    uint64_t v7 = *(id *)kAVVCScope;
    if (!v7) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    BOOL mClientAPIClutch = self->mClientAPIClutch;
    *(_DWORD *)buf = 136315906;
    char v17 = "AVVoiceController.mm";
    __int16 v18 = 1024;
    int v19 = 1539;
    __int16 v20 = 2048;
    uint64_t v21 = (AVVoiceController *)v10;
    __int16 v22 = 1024;
    LODWORD(v23) = mClientAPIClutch;
    _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
  }

LABEL_18:
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v24);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v12);
}

- (BOOL)activateAudioSessionForStream:(unint64_t)a3 isPrewarm:(BOOL)a4 recordMode:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  int v21 = 4144;
  char v22 = 1;
  long long v23 = 0u;
  long long v24 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v37, "-[AVVoiceController activateAudioSessionForStream:isPrewarm:recordMode:error:]", 0, 0);
  if (kAVVCScope)
  {
    id v11 = *(id *)kAVVCScope;
    if (!v11) {
      goto LABEL_8;
    }
  }
  else
  {
    id v11 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v26 = "AVVoiceController.mm";
    __int16 v27 = 1024;
    int v28 = 1525;
    __int16 v29 = 2048;
    __int16 v30 = self;
    __int16 v31 = 1024;
    BOOL v32 = v8;
    __int16 v33 = 1024;
    BOOL v34 = v7;
    __int16 v35 = 2048;
    unint64_t v36 = a3;
    _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: activateAudioSessionForStream isPrewarm(%d), switchRecordMode(%d). streamHandle(%lu)", buf, 0x32u);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  if (v19 && !self->mClientAPIClutch)
  {
    int v16 = ControllerImpl::activateAudioSessionForStream(v19, self, a3, v8, v7);
    int v17 = v16;
    if (a6 && v16)
    {
      *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v16 userInfo:0];
    }
    LOBYTE(v13) = v17 == 0;
  }
  else
  {
    if (kAVVCScope)
    {
      char v13 = *(id *)kAVVCScope;
      if (!v13) {
        goto LABEL_21;
      }
    }
    else
    {
      char v13 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      __int16 v26 = "AVVoiceController.mm";
      __int16 v27 = 1024;
      int v28 = 1526;
      __int16 v29 = 2048;
      __int16 v30 = (AVVoiceController *)v19;
      __int16 v31 = 1024;
      BOOL v32 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    LOBYTE(v13) = 0;
  }
LABEL_21:
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v37);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v21);
  return (char)v13;
}

- (BOOL)activateAudioSessionForStream:(unint64_t)a3 isPrewarm:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  int v19 = 4144;
  char v20 = 1;
  long long v21 = 0u;
  long long v22 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v33, "-[AVVoiceController activateAudioSessionForStream:isPrewarm:error:]", 0, 0);
  if (kAVVCScope)
  {
    id v9 = *(id *)kAVVCScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    long long v24 = "AVVoiceController.mm";
    __int16 v25 = 1024;
    int v26 = 1512;
    __int16 v27 = 2048;
    int v28 = self;
    __int16 v29 = 1024;
    BOOL v30 = v6;
    __int16 v31 = 2048;
    unint64_t v32 = a3;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: activateAudioSessionForStream isPrewarm(%d). streamHandle(%lu)", buf, 0x2Cu);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  if (v17 && !self->mClientAPIClutch)
  {
    int v14 = ControllerImpl::activateAudioSessionForStream(v17, self, a3, v6, 1);
    int v15 = v14;
    if (a5 && v14)
    {
      *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v14 userInfo:0];
    }
    LOBYTE(v11) = v15 == 0;
  }
  else
  {
    if (kAVVCScope)
    {
      id v11 = *(id *)kAVVCScope;
      if (!v11) {
        goto LABEL_21;
      }
    }
    else
    {
      id v11 = MEMORY[0x1E4F14500];
      id v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      long long v24 = "AVVoiceController.mm";
      __int16 v25 = 1024;
      int v26 = 1513;
      __int16 v27 = 2048;
      int v28 = (AVVoiceController *)v17;
      __int16 v29 = 1024;
      BOOL v30 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    LOBYTE(v11) = 0;
  }
LABEL_21:
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v33);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v19);
  return (char)v11;
}

- (id)getRecordDeviceInfoForStream:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  ElapsedTime::ElapsedTime((ElapsedTime *)v22, "-[AVVoiceController getRecordDeviceInfoForStream:]", 0, 0);
  if (kAVVCScope)
  {
    BOOL v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    int v15 = "AVVoiceController.mm";
    __int16 v16 = 1024;
    int v17 = 1502;
    __int16 v18 = 2048;
    int v19 = self;
    __int16 v20 = 2048;
    unint64_t v21 = a3;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: getRecordDeviceInfoForStream: streamHandle(%lu)", buf, 0x26u);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  if (!v12 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      BOOL v7 = *(id *)kAVVCScope;
      if (!v7)
      {
LABEL_17:
        id v10 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      BOOL v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      int v15 = "AVVoiceController.mm";
      __int16 v16 = 1024;
      int v17 = 1503;
      __int16 v18 = 2048;
      int v19 = (AVVoiceController *)v12;
      __int16 v20 = 1024;
      LODWORD(v21) = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_17;
  }
  id v10 = ControllerImpl::getRecordDeviceInfoForStream(v12, self, a3);
LABEL_19:
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v22);

  return v10;
}

- (int64_t)getCurrentStreamState:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  if (!v12 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      BOOL v5 = *(id *)kAVVCScope;
      if (!v5)
      {
        unint64_t CurrentStreamStateForStream = 0;
        goto LABEL_11;
      }
    }
    else
    {
      BOOL v5 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      int v15 = "AVVoiceController.mm";
      __int16 v16 = 1024;
      int v17 = 1493;
      __int16 v18 = 2048;
      int v19 = (AVVoiceController *)v12;
      __int16 v20 = 1024;
      LODWORD(v21) = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }
    unint64_t CurrentStreamStateForStream = 0;
    goto LABEL_10;
  }
  unint64_t CurrentStreamStateForStream = ControllerImpl::getCurrentStreamStateForStream(v12, self, a3);
  if (!kAVVCScope)
  {
    BOOL v5 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
LABEL_18:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (CurrentStreamStateForStream > 6) {
        id v11 = "ILLEGAL";
      }
      else {
        id v11 = off_1E59657E8[CurrentStreamStateForStream];
      }
      *(_DWORD *)buf = 136316162;
      int v15 = "AVVoiceController.mm";
      __int16 v16 = 1024;
      int v17 = 1495;
      __int16 v18 = 2048;
      int v19 = self;
      __int16 v20 = 2048;
      unint64_t v21 = a3;
      __int16 v22 = 2080;
      uint64_t v23 = v11;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: getCurrentStreamState: streamHandle(%lu). State(%s)", buf, 0x30u);
    }
LABEL_10:

    goto LABEL_11;
  }
  BOOL v5 = *(id *)kAVVCScope;
  if (v5) {
    goto LABEL_18;
  }
LABEL_11:
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  return CurrentStreamStateForStream;
}

- (BOOL)stopRecordForStream:(unint64_t)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v28, "-[AVVoiceController stopRecordForStream:error:]", 0, 0);
  if (kAVVCScope)
  {
    id v7 = *(id *)kAVVCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    unint64_t v21 = "AVVoiceController.mm";
    __int16 v22 = 1024;
    int v23 = 1471;
    __int16 v24 = 2048;
    unint64_t v25 = (unint64_t)self;
    __int16 v26 = 2048;
    unint64_t v27 = a3;
    _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: stopRecordForStream: streamHandle(%lu)", buf, 0x26u);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  if (!v18 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      id v9 = *(id *)kAVVCScope;
      if (!v9)
      {
LABEL_17:
        BOOL v12 = 0;
        goto LABEL_32;
      }
    }
    else
    {
      id v9 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      unint64_t v21 = "AVVoiceController.mm";
      __int16 v22 = 1024;
      int v23 = 1473;
      __int16 v24 = 2048;
      unint64_t v25 = (unint64_t)v18;
      __int16 v26 = 1024;
      LODWORD(v27) = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_17;
  }
  int v13 = ControllerImpl::stopRecordForStream(v18, self, a3);
  int v14 = v13;
  if (v13)
  {
    BOOL v12 = v13 != -11781 && v13 != -11793;
    if (v13 != -11793 && v13 != -11781 && v13 != -308)
    {
      int v15 = *(NSObject **)kAVVCScope;
      __int16 v16 = CALog::Scope::oslog(*(id *)kAVVCScope);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315650;
        unint64_t v21 = "-[AVVoiceController stopRecordForStream:error:]";
        __int16 v22 = 1024;
        int v23 = v14;
        __int16 v24 = 2048;
        unint64_t v25 = a3;
        _os_log_fault_impl(&dword_19D794000, v15, OS_LOG_TYPE_FAULT, "%s unexpected error (%d) returned from stopRecordForStream for streamHandle(%lu)", buf, 0x1Cu);
      }
    }
    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v14 userInfo:0];
    }
  }
  else
  {
    BOOL v12 = 1;
  }
  kdebug_trace();
LABEL_32:
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v28);
  return v12;
}

- (void)stopRecordForStream:(unint64_t)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v10 = 4137;
  char v11 = 1;
  long long v12 = 0u;
  long long v13 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v19, "-[AVVoiceController stopRecordForStream:completion:]", 0, 0);
  if (kAVVCScope)
  {
    id v7 = *(id *)kAVVCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "AVVoiceController.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1458;
    __int16 v15 = 2048;
    __int16 v16 = self;
    __int16 v17 = 2048;
    unint64_t v18 = a3;
    _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d !! DEPRECATED !! #### AVVoiceController[self = %p]: stopRecordForStream: streamHandle(%lu)", buf, 0x26u);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  if (*(void *)buf && !self->mClientAPIClutch)
  {
    ControllerImpl::stopRecordForStream(*(uint64_t *)buf, self, a3, v6);
  }
  else if (v6)
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11780 userInfo:0];
    (*((void (**)(id, unint64_t, void, void, void *))v6 + 2))(v6, a3, 0, 0, v9);
  }
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v19);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v10);
}

- (BOOL)configureAlertBehaviorForStream:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = (AVVCConfigureAlertBehaviorSettings *)a3;
  int v18 = 4147;
  char v19 = 1;
  long long v20 = 0u;
  long long v21 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v36, "-[AVVoiceController configureAlertBehaviorForStream:error:]", 0, 0);
  if (kAVVCScope)
  {
    id v7 = *(id *)kAVVCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  id v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316674;
    int v23 = "AVVoiceController.mm";
    __int16 v24 = 1024;
    int v25 = 1441;
    __int16 v26 = 2048;
    unint64_t v27 = self;
    __int16 v28 = 2048;
    uint64_t v29 = [(AVVCConfigureAlertBehaviorSettings *)v6 streamID];
    __int16 v30 = 1024;
    int v31 = [(AVVCConfigureAlertBehaviorSettings *)v6 startAlert];
    __int16 v32 = 1024;
    int v33 = [(AVVCConfigureAlertBehaviorSettings *)v6 stopAlert];
    __int16 v34 = 1024;
    int v35 = [(AVVCConfigureAlertBehaviorSettings *)v6 stopOnErrorAlert];
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: configureAlertBehaviorForStream: streamHandle(%lu), AlertsOverride(%d,%d,%d)", buf, 0x38u);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  if (!v16 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      int v10 = *(id *)kAVVCScope;
      if (!v10)
      {
LABEL_17:
        BOOL v13 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      int v10 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      int v23 = "AVVoiceController.mm";
      __int16 v24 = 1024;
      int v25 = 1443;
      __int16 v26 = 2048;
      unint64_t v27 = (AVVoiceController *)v16;
      __int16 v28 = 1024;
      LODWORD(v29) = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_17;
  }
  int v15 = ControllerImpl::configureAlertBehaviorForStream(v16, self, v6);
  BOOL v13 = v15 == 0;
  if (a4 && v15)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v15 userInfo:0];
    BOOL v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_18:
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v36);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v18);

  return v13;
}

- (void)configureAlertBehaviorForStream:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v12 = 4147;
  char v13 = 1;
  long long v14 = 0u;
  long long v15 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v27, "-[AVVoiceController configureAlertBehaviorForStream:completion:]", 0, 0);
  if (kAVVCScope)
  {
    id v8 = *(id *)kAVVCScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = (id)MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  int v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316674;
    *(void *)&uint8_t buf[4] = "AVVoiceController.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1427;
    __int16 v17 = 2048;
    int v18 = self;
    __int16 v19 = 2048;
    uint64_t v20 = [v6 streamID];
    __int16 v21 = 1024;
    int v22 = [v6 startAlert];
    __int16 v23 = 1024;
    int v24 = [v6 stopAlert];
    __int16 v25 = 1024;
    int v26 = [v6 stopOnErrorAlert];
    _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: configureAlertBehaviorForStream:completion: streamHandle(%lu), AlertsOverride(%d,%d,%d)", buf, 0x38u);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  if (*(void *)buf && !self->mClientAPIClutch)
  {
    ControllerImpl::configureAlertBehaviorForStream(*(uint64_t *)buf, self, v6, v7);
  }
  else if (v7)
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11780 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v27);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v12);
}

- (BOOL)startRecordForStream:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = (AVVCStartRecordSettings *)a3;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v43, "-[AVVoiceController startRecordForStream:error:]", 0, 0);
  if (kAVVCScope)
  {
    id v7 = *(id *)kAVVCScope;
    if (!v7) {
      goto LABEL_10;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  id v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [(AVVCStartRecordSettings *)v6 streamID];
    uint64_t v11 = [(AVVCStartRecordSettings *)v6 startHostTime];
    int v12 = [(AVVCStartRecordSettings *)v6 startAlert];
    int v13 = [(AVVCStartRecordSettings *)v6 stopAlert];
    int v14 = [(AVVCStartRecordSettings *)v6 stopOnErrorAlert];
    BOOL v15 = [(AVVCStartRecordSettings *)v6 skipAlert];
    __int16 v16 = " will NOT skip alert";
    *(_DWORD *)buf = 136317186;
    int v26 = "AVVoiceController.mm";
    int v28 = 1409;
    __int16 v27 = 1024;
    if (v15) {
      __int16 v16 = " will skip alert";
    }
    __int16 v29 = 2048;
    __int16 v30 = self;
    __int16 v31 = 2048;
    uint64_t v32 = v10;
    __int16 v33 = 2048;
    uint64_t v34 = v11;
    __int16 v35 = 1024;
    int v36 = v12;
    __int16 v37 = 1024;
    int v38 = v13;
    __int16 v39 = 1024;
    int v40 = v14;
    __int16 v41 = 2080;
    v42 = v16;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: startRecordForStream: streamHandle(%lu), startTime(%llu). AlertsOverride(%d,%d,%d,%s)", buf, 0x4Cu);
  }

LABEL_10:
  [(AVVoiceController *)self impl];
  if (!v23 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      __int16 v17 = *(id *)kAVVCScope;
      if (!v17)
      {
LABEL_19:
        BOOL v20 = 0;
        goto LABEL_24;
      }
    }
    else
    {
      __int16 v17 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      int v26 = "AVVoiceController.mm";
      __int16 v27 = 1024;
      int v28 = 1411;
      __int16 v29 = 2048;
      __int16 v30 = (AVVoiceController *)v23;
      __int16 v31 = 1024;
      LODWORD(v32) = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_19;
  }
  int started = ControllerImpl::startRecordForStream(v23, self, v6);
  BOOL v20 = started == 0;
  if (a4 && started)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:started userInfo:0];
  }
  kdebug_trace();
LABEL_24:
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v43);

  return v20;
}

- (void)startRecordForStream:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v20 = 4136;
  char v21 = 1;
  long long v22 = 0u;
  long long v23 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v39, "-[AVVoiceController startRecordForStream:completion:]", 0, 0);
  if (kAVVCScope)
  {
    id v8 = *(id *)kAVVCScope;
    if (!v8) {
      goto LABEL_10;
    }
  }
  else
  {
    id v8 = (id)MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  uint64_t v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v6 streamID];
    uint64_t v12 = [v6 startHostTime];
    int v13 = [v6 startAlert];
    int v14 = [v6 stopAlert];
    int v15 = [v6 stopOnErrorAlert];
    int v16 = [v6 skipAlert];
    __int16 v17 = " will NOT skip alert";
    *(_DWORD *)buf = 136317186;
    *(void *)&uint8_t buf[4] = "AVVoiceController.mm";
    *(_DWORD *)&buf[14] = 1395;
    *(_WORD *)&buf[12] = 1024;
    if (v16) {
      __int16 v17 = " will skip alert";
    }
    __int16 v25 = 2048;
    int v26 = self;
    __int16 v27 = 2048;
    uint64_t v28 = v11;
    __int16 v29 = 2048;
    uint64_t v30 = v12;
    __int16 v31 = 1024;
    int v32 = v13;
    __int16 v33 = 1024;
    int v34 = v14;
    __int16 v35 = 1024;
    int v36 = v15;
    __int16 v37 = 2080;
    int v38 = v17;
    _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: startRecordForStream:completion: streamHandle(%lu), startTime(%llu). AlertsOverride(%d,%d,%d,%s)", buf, 0x4Cu);
  }

LABEL_10:
  [(AVVoiceController *)self impl];
  if (*(void *)buf && !self->mClientAPIClutch)
  {
    ControllerImpl::startRecordForStream(*(uint64_t *)buf, self, v6, v7);
  }
  else if (v7)
  {
    uint64_t v18 = [v6 streamID];
    __int16 v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11780 userInfo:0];
    (*((void (**)(id, uint64_t, void, void, void *))v7 + 2))(v7, v18, 0, 0, v19);
  }
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v39);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v20);
}

- (void)startRecordWithSettings:(id)a3 completion:(id)a4 alertCompletion:(id)a5 audioCallback:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v19 = 4136;
  char v20 = 1;
  long long v21 = 0u;
  long long v22 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v36, "-[AVVoiceController startRecordWithSettings:completion:alertCompletion:audioCallback:]", 0, 0);
  if (kAVVCScope)
  {
    id v14 = *(id *)kAVVCScope;
    if (!v14) {
      goto LABEL_8;
    }
  }
  else
  {
    id v14 = (id)MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
  }
  int v16 = v14;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316930;
    *(void *)&uint8_t buf[4] = "AVVoiceController.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1381;
    __int16 v24 = 2048;
    __int16 v25 = self;
    __int16 v26 = 2048;
    uint64_t v27 = [v10 streamID];
    __int16 v28 = 2048;
    uint64_t v29 = [v10 startHostTime];
    __int16 v30 = 1024;
    int v31 = [v10 startAlert];
    __int16 v32 = 1024;
    int v33 = [v10 stopAlert];
    __int16 v34 = 1024;
    int v35 = [v10 stopOnErrorAlert];
    _os_log_impl(&dword_19D794000, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d !! DEPRECATED !! #### AVVoiceController[self = %p]: startRecordWithSettings:completion:alertCompletion:audioCallback: streamHandle(%lu), startTime(%llu). AlertsOverride(%d,%d,%d)", buf, 0x42u);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  if (*(void *)buf && !self->mClientAPIClutch)
  {
    ControllerImpl::startRecordForStream(*(uint64_t *)buf, self, v10, v11, v12, v13);
  }
  else if (v11)
  {
    uint64_t v17 = [v10 streamID];
    uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11780 userInfo:0];
    (*((void (**)(id, uint64_t, void, void, void *))v11 + 2))(v11, v17, 0, 0, v18);
  }
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v36);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v19);
}

- (BOOL)prepareRecordForStream:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = (AVVCPrepareRecordSettings *)a3;
  int v22 = 4135;
  char v23 = 1;
  long long v24 = 0u;
  long long v25 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v38, "-[AVVoiceController prepareRecordForStream:error:]", 0, 0);
  if (kAVVCScope)
  {
    id v7 = *(id *)kAVVCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  id v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [(AVVCPrepareRecordSettings *)v6 streamID];
    [(AVVCPrepareRecordSettings *)v6 recordBufferDuration];
    uint64_t v12 = v11;
    id v13 = [(AVVCPrepareRecordSettings *)v6 avAudioSettings];
    *(_DWORD *)buf = 136316418;
    uint64_t v27 = "AVVoiceController.mm";
    __int16 v28 = 1024;
    int v29 = 1364;
    __int16 v30 = 2048;
    int v31 = self;
    __int16 v32 = 2048;
    uint64_t v33 = v10;
    __int16 v34 = 2048;
    uint64_t v35 = v12;
    __int16 v36 = 2112;
    uint64_t v37 = v13;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: prepareRecordForStream: streamHandle(%lu), bufferDuration(%f), settings: %@", buf, 0x3Au);
  }
LABEL_8:
  [(AVVoiceController *)self impl];
  if (!v20 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      id v14 = *(id *)kAVVCScope;
      if (!v14)
      {
LABEL_17:
        BOOL v17 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      id v14 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      uint64_t v27 = "AVVoiceController.mm";
      __int16 v28 = 1024;
      int v29 = 1366;
      __int16 v30 = 2048;
      int v31 = (AVVoiceController *)v20;
      __int16 v32 = 1024;
      LODWORD(v33) = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_17;
  }
  int v19 = ControllerImpl::prepareRecordForStream(v20, self, v6);
  BOOL v17 = v19 == 0;
  if (a4 && v19)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v19 userInfo:0];
    BOOL v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_18:
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v38);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v22);

  return v17;
}

- (void)prepareRecordForStream:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v17 = 4135;
  char v18 = 1;
  long long v19 = 0u;
  long long v20 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v30, "-[AVVoiceController prepareRecordForStream:completion:]", 0, 0);
  if (kAVVCScope)
  {
    id v8 = *(id *)kAVVCScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = (id)MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  uint64_t v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v6 streamID];
    [v6 recordBufferDuration];
    uint64_t v13 = v12;
    id v14 = [v6 avAudioSettings];
    *(_DWORD *)buf = 136316418;
    *(void *)&uint8_t buf[4] = "AVVoiceController.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1351;
    __int16 v22 = 2048;
    char v23 = self;
    __int16 v24 = 2048;
    uint64_t v25 = v11;
    __int16 v26 = 2048;
    uint64_t v27 = v13;
    __int16 v28 = 2112;
    int v29 = v14;
    _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d !! DEPRECATED !! #### AVVoiceController[self = %p]: prepareRecordForStream: streamHandle(%lu), bufferDuration(%f), settings: %@", buf, 0x3Au);
  }
LABEL_8:
  [(AVVoiceController *)self impl];
  if (*(void *)buf && !self->mClientAPIClutch)
  {
    ControllerImpl::prepareRecordForStream(*(uint64_t *)buf, v6, v7);
  }
  else if (v7)
  {
    uint64_t v15 = [v6 streamID];
    int v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11780 userInfo:0];
    (*((void (**)(id, uint64_t, void, void *))v7 + 2))(v7, v15, 0, v16);
  }
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v30);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v17);
}

- (unint64_t)setContext:(id)a3 streamType:(int64_t *)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v22 = 4134;
  char v23 = 1;
  long long v24 = 0u;
  long long v25 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v36, "-[AVVoiceController setContext:streamType:error:]", 0, 0);
  if (kAVVCScope)
  {
    id v9 = *(id *)kAVVCScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = (id)MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  uint64_t v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = Get4CCFromInt([v8 activationMode]);
    uint64_t v13 = [v8 activationDeviceUID];
    *(_DWORD *)buf = 136316162;
    uint64_t v27 = "AVVoiceController.mm";
    __int16 v28 = 1024;
    int v29 = 1335;
    __int16 v30 = 2048;
    uint64_t v31 = self;
    __int16 v32 = 2112;
    uint64_t v33 = v12;
    __int16 v34 = 2112;
    uint64_t v35 = v13;
    _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: setContext: activationMode(%@), deviceUID(%@)", buf, 0x30u);
  }
LABEL_8:
  long long v21 = 0;
  [(AVVoiceController *)self impl];
  if (v19 && !self->mClientAPIClutch)
  {
    int v18 = ControllerImpl::setContext(v19, self, v8, (uint64_t)&v21, (uint64_t)a4);
    if (v18)
    {
      if (a5)
      {
        *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v18 userInfo:0];
      }
      id v14 = 0;
      long long v21 = 0;
    }
    else
    {
      id v14 = v21;
    }
  }
  else
  {
    if (kAVVCScope)
    {
      id v14 = *(id *)kAVVCScope;
      if (!v14) {
        goto LABEL_17;
      }
    }
    else
    {
      id v14 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      uint64_t v27 = "AVVoiceController.mm";
      __int16 v28 = 1024;
      int v29 = 1337;
      __int16 v30 = 2048;
      uint64_t v31 = (AVVoiceController *)v19;
      __int16 v32 = 1024;
      LODWORD(v33) = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    id v14 = 0;
  }
LABEL_17:
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v36);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v22);

  return (unint64_t)v14;
}

- (unint64_t)setContext:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v20 = 4134;
  char v21 = 1;
  long long v22 = 0u;
  long long v23 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v34, "-[AVVoiceController setContext:error:]", 0, 0);
  if (kAVVCScope)
  {
    id v7 = *(id *)kAVVCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  id v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = Get4CCFromInt([v6 activationMode]);
    uint64_t v11 = [v6 activationDeviceUID];
    *(_DWORD *)buf = 136316162;
    long long v25 = "AVVoiceController.mm";
    __int16 v26 = 1024;
    int v27 = 1318;
    __int16 v28 = 2048;
    int v29 = self;
    __int16 v30 = 2112;
    uint64_t v31 = v10;
    __int16 v32 = 2112;
    uint64_t v33 = v11;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: setContext: activationMode(%@), deviceUID(%@)", buf, 0x30u);
  }
LABEL_8:
  uint64_t v19 = 0;
  [(AVVoiceController *)self impl];
  if (v17 && !self->mClientAPIClutch)
  {
    int v16 = ControllerImpl::setContext(v17, self, v6, (uint64_t)&v19, 0);
    if (v16)
    {
      if (a4)
      {
        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v16 userInfo:0];
      }
      uint64_t v12 = 0;
      uint64_t v19 = 0;
    }
    else
    {
      uint64_t v12 = v19;
    }
  }
  else
  {
    if (kAVVCScope)
    {
      uint64_t v12 = *(id *)kAVVCScope;
      if (!v12) {
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v12 = MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      long long v25 = "AVVoiceController.mm";
      __int16 v26 = 1024;
      int v27 = 1320;
      __int16 v28 = 2048;
      int v29 = (AVVoiceController *)v17;
      __int16 v30 = 1024;
      LODWORD(v31) = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    uint64_t v12 = 0;
  }
LABEL_17:
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v34);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v20);

  return (unint64_t)v12;
}

- (void)setContext:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v14 = 4134;
  char v15 = 1;
  long long v16 = 0u;
  long long v17 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v25, "-[AVVoiceController setContext:completion:]", 0, 0);
  if (kAVVCScope)
  {
    id v8 = *(id *)kAVVCScope;
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = (id)MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  id v10 = v8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = Get4CCFromInt([v6 activationMode]);
    uint64_t v12 = [v6 activationDeviceUID];
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "AVVoiceController.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1304;
    __int16 v19 = 2048;
    int v20 = self;
    __int16 v21 = 2112;
    long long v22 = v11;
    __int16 v23 = 2112;
    long long v24 = v12;
    _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController[self = %p]: setContext:streamType:completion: activationMode(%@), deviceUID(%@)", buf, 0x30u);
  }
LABEL_8:
  [(AVVoiceController *)self impl];
  if (*(void *)buf && !self->mClientAPIClutch)
  {
    ControllerImpl::setContext(*(uint64_t *)buf, self, v6, v7);
  }
  else if (v7)
  {
    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-11780 userInfo:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v13);
  }
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v25);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v14);
}

- (int64_t)_bringUp:(int64_t)a3 withError:(id *)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 0;
  id v4 = operator new(0x288uLL);
  v4[1] = 0;
  v4[2] = 0;
  *id v4 = &unk_1EEFA7800;
  ControllerImpl::ControllerImpl(v4 + 3);
}

uint64_t __40__AVVoiceController__bringUp_withError___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 48) + 464) setParentVoiceController:*(void *)(a1 + 32)];
  uint64_t result = ControllerImpl::configureAlerts(*(ControllerImpl **)(a1 + 48), *(AVVoiceController **)(a1 + 32));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (int)result;
  return result;
}

- (id)initVoiceControllerForClient:(int64_t)a3 withError:(id *)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  int v50 = 4133;
  char v51 = 1;
  long long v52 = 0u;
  long long v53 = 0u;
  kdebug_trace();
  Initialize_Logging();
  ElapsedTime::ElapsedTime((ElapsedTime *)v54, "-[AVVoiceController initVoiceControllerForClient:withError:]", 0, 0);
  if (kAVVCScope)
  {
    uint64_t v7 = *(id *)kAVVCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v56 = "AVVoiceController.mm";
    __int16 v57 = 1024;
    *(_DWORD *)v58 = 1243;
    *(_WORD *)&v58[4] = 1024;
    *(_DWORD *)&v58[6] = a3;
    *(_WORD *)&v58[10] = 2048;
    *(void *)&v58[12] = self;
    _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [enforce 1 avvc] #### AVVoiceController: initVoiceControllerForClient:(%d) (V2): [self == %p]", buf, 0x22u);
  }

LABEL_8:
  id v9 = self;
  if (kAVVCScope)
  {
    id v10 = *(id *)kAVVCScope;
    if (!v10) {
      goto LABEL_15;
    }
  }
  else
  {
    id v10 = (id)MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  uint64_t v12 = v10;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = GetAVVCSingleInstanceSemaphore();
    int v14 = [v13 debugDescription];
    *(_DWORD *)buf = 136315906;
    v56 = "AVVoiceController.mm";
    __int16 v57 = 1024;
    *(_DWORD *)v58 = 124;
    *(_WORD *)&v58[4] = 2048;
    *(void *)&v58[6] = v9;
    *(_WORD *)&v58[14] = 2112;
    *(void *)&v58[16] = v14;
    _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [enforce 1 avvc] before wait controller(%p), %@", buf, 0x26u);
  }
LABEL_15:
  char v15 = GetAVVCSingleInstanceSemaphore();
  dispatch_time_t v16 = dispatch_time(0, 7500000000);
  intptr_t v17 = dispatch_semaphore_wait(v15, v16);

  if (kAVVCScope)
  {
    id v18 = *(id *)kAVVCScope;
    if (!v18) {
      goto LABEL_24;
    }
  }
  else
  {
    id v18 = (id)MEMORY[0x1E4F14500];
    id v19 = MEMORY[0x1E4F14500];
  }
  int v20 = v18;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v21 = GetAVVCSingleInstanceSemaphore();
    uint64_t v22 = [v21 debugDescription];
    __int16 v23 = (void *)v22;
    v56 = "AVVoiceController.mm";
    __int16 v57 = 1024;
    long long v24 = " TIMEDOUT!";
    *(_DWORD *)v58 = 126;
    *(_WORD *)&v58[4] = 2080;
    *(_DWORD *)buf = 136316162;
    if (!v17) {
      long long v24 = "";
    }
    *(void *)&v58[6] = v24;
    *(_WORD *)&v58[14] = 2048;
    *(void *)&v58[16] = v9;
    __int16 v59 = 2112;
    uint64_t v60 = v22;
    _os_log_impl(&dword_19D794000, v20, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [enforce 1 avvc] after wait%s controller(%p), %@", buf, 0x30u);
  }
LABEL_24:
  if (v17)
  {
    if (kAVVCScope)
    {
      long long v25 = *(id *)kAVVCScope;
      if (!v25)
      {
LABEL_32:
        int v27 = *(NSObject **)kAVVCScope;
        __int16 v28 = CALog::Scope::oslog(*(id *)kAVVCScope);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v56 = "BlockIfAnotherAVVCIsStillAlive";
          __int16 v57 = 2048;
          *(void *)v58 = v9;
          _os_log_fault_impl(&dword_19D794000, v27, OS_LOG_TYPE_FAULT, "[enforce 1 avvc] %s Timed out waiting to initialize, which means multiple AVVC objects exist simultaneously. Controller(%p)", buf, 0x16u);
        }

        goto LABEL_35;
      }
    }
    else
    {
      long long v25 = MEMORY[0x1E4F14500];
      id v26 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v56 = "AVVoiceController.mm";
      __int16 v57 = 1024;
      *(_DWORD *)v58 = 129;
      _os_log_impl(&dword_19D794000, v25, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [enforce 1 avvc] Timed out waiting to initialize, which means multiple AVVC objects exist simultaneously", buf, 0x12u);
    }

    goto LABEL_32;
  }
LABEL_35:

  v49.receiver = v9;
  v49.super_class = (Class)AVVoiceController;
  int v29 = [(AVVoiceController *)&v49 init];
  __int16 v30 = v29;
  if (v29)
  {
    uint64_t v31 = v29;
    if (kAVVCScope)
    {
      if (*(unsigned char *)(kAVVCScope + 8))
      {
        __int16 v32 = *(id *)kAVVCScope;
        if (v32)
        {
          uint64_t v33 = v32;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v56 = "AVVCUtils.mm";
            __int16 v57 = 1024;
            *(_DWORD *)v58 = 80;
            *(_WORD *)&v58[4] = 2048;
            *(void *)&v58[6] = v31;
            _os_log_impl(&dword_19D794000, v33, OS_LOG_TYPE_DEBUG, "%25s:%-5d RegisterObject: registering %p", buf, 0x1Cu);
          }
        }
      }
    }
    pthread_mutex_lock(&MapLocker::sMapLock);
    uint64_t ObjectMap = GetObjectMap();
    uint64_t v35 = ObjectMap;
    uint64_t v37 = (void *)(ObjectMap + 8);
    __int16 v36 = *(void **)(ObjectMap + 8);
    if (v36)
    {
      while (1)
      {
        while (1)
        {
          int v38 = v36;
          unint64_t v39 = v36[4];
          if ((unint64_t)v31 >= v39) {
            break;
          }
          __int16 v36 = (void *)*v38;
          uint64_t v37 = v38;
          if (!*v38) {
            goto LABEL_50;
          }
        }
        if (v39 >= (unint64_t)v31) {
          break;
        }
        __int16 v36 = (void *)v38[1];
        if (!v36)
        {
          uint64_t v37 = v38 + 1;
          goto LABEL_50;
        }
      }
    }
    else
    {
      int v38 = (void *)(ObjectMap + 8);
LABEL_50:
      uint64_t v40 = operator new(0x30uLL);
      v40[4] = v31;
      *((unsigned char *)v40 + 40) = 1;
      *uint64_t v40 = 0;
      v40[1] = 0;
      v40[2] = v38;
      *uint64_t v37 = v40;
      uint64_t v41 = **(void **)v35;
      if (v41)
      {
        *(void *)uint64_t v35 = v41;
        uint64_t v40 = (void *)*v37;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v35 + 8), v40);
      ++*(void *)(v35 + 16);
    }
    pthread_mutex_unlock(&MapLocker::sMapLock);

    uint64_t v42 = [(AVVoiceController *)v31 _bringUp:a3 withError:a4];
    if (v42)
    {
      if (a4)
      {
        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v42 userInfo:0];
      }
      id v48 = 0;
      -[AVVoiceController _teardownWithError:](v31, "_teardownWithError:", &v48, v42);
      id v43 = v48;
      if (kAVVCScope)
      {
        uint64_t v44 = *(id *)kAVVCScope;
        if (!v44)
        {
LABEL_64:

          v45 = 0;
          goto LABEL_65;
        }
      }
      else
      {
        uint64_t v44 = MEMORY[0x1E4F14500];
        id v46 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v56 = "AVVoiceController.mm";
        __int16 v57 = 1024;
        *(_DWORD *)v58 = 1258;
        *(_WORD *)&v58[4] = 2112;
        *(void *)&v58[6] = v43;
        _os_log_impl(&dword_19D794000, v44, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to initialize. Teardown error: %@", buf, 0x1Cu);
      }

      goto LABEL_64;
    }
  }
  v45 = v30;
LABEL_65:
  ElapsedTime::~ElapsedTime((ElapsedTime *)v54);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v50);

  return v45;
}

- (AVVoiceController)initWithError:(id *)a3
{
  return (AVVoiceController *)[(AVVoiceController *)self initVoiceControllerForClient:1 withError:a3];
}

- (NSDictionary)metrics
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy__145;
  char v15 = __Block_byref_object_dispose__146;
  id v16 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v8 = __28__AVVoiceController_metrics__block_invoke;
  id v9 = &unk_1E5965E38;
  id v10 = &v11;
  uint64_t v2 = self;
  id v3 = v7;
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  if (IsSerializationEnabled(void)::enable)
  {
    v8((uint64_t)v3);
  }
  else
  {
    id v4 = v2;
    objc_sync_enter(v4);
    v8((uint64_t)v3);
    objc_sync_exit(v4);
  }
  id v5 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSDictionary *)v5;
}

void __28__AVVoiceController_metrics__block_invoke(uint64_t a1)
{
  id v5 = +[AVVCMetricsManager sharedManager];
  uint64_t v2 = [v5 retrieveMetrics];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (unint64_t)getAlertStartTime
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  if (!v8 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      uint64_t v3 = *(id *)kAVVCScope;
      if (!v3)
      {
LABEL_10:
        unint64_t v6 = 0;
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      uint64_t v11 = "AVVoiceController.mm";
      __int16 v12 = 1024;
      int v13 = 1205;
      __int16 v14 = 2048;
      uint64_t v15 = v8;
      __int16 v16 = 1024;
      BOOL v17 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  unint64_t v6 = *(void *)(v8 + 376);
LABEL_12:
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  return v6;
}

- (float)alertVolume
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  if (!v8 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      uint64_t v3 = *(id *)kAVVCScope;
      if (!v3)
      {
LABEL_10:
        float v6 = 0.0;
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      uint64_t v11 = "AVVoiceController.mm";
      __int16 v12 = 1024;
      int v13 = 1197;
      __int16 v14 = 2048;
      uint64_t v15 = v8;
      __int16 v16 = 1024;
      BOOL v17 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  float v6 = *(float *)(v8 + 400);
LABEL_12:
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  return v6;
}

- (void)setAlertVolume:(float)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (kAVVCScope)
  {
    id v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v16 = "AVVoiceController.mm";
    __int16 v17 = 1024;
    int v18 = 1180;
    __int16 v19 = 2048;
    double v20 = a3;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController: setAlertVolume: %f ####", buf, 0x1Cu);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  if (v13 == 0.0 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      uint64_t v7 = *(id *)kAVVCScope;
      if (!v7) {
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      __int16 v16 = "AVVoiceController.mm";
      __int16 v17 = 1024;
      int v18 = 1181;
      __int16 v19 = 2048;
      double v20 = v13;
      __int16 v21 = 1024;
      BOOL v22 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3321888768;
    v10[2] = __36__AVVoiceController_setAlertVolume___block_invoke;
    v10[3] = &__block_descriptor_52_ea8_32c42_ZTSNSt3__110shared_ptrI14ControllerImplEE_e5_v8__0l;
    *(double *)&v10[4] = v13;
    uint64_t v11 = v14;
    if (v14) {
      atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    float v12 = a3;
    ControllerImpl::safeWork(*(uint64_t *)&v13, v10, (uint64_t)"-[AVVoiceController setAlertVolume:]");
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
  }
LABEL_17:
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
}

void __36__AVVoiceController_setAlertVolume___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  float v2 = *(float *)(a1 + 48);
  if (*(float *)(v1 + 400) != v2)
  {
    *(float *)(v1 + 400) = v2;
    id v4 = *(std::__shared_weak_count **)(a1 + 40);
    if (v4) {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    AlertLock::AlertLock(v6, v1, v4);
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    if (ControllerImpl::getAlertQueueFromImplQueue(*(ControllerImpl **)(a1 + 32)))
    {
      AlertQueueFromImplQueue = (OpaqueAudioQueue *)ControllerImpl::getAlertQueueFromImplQueue(*(ControllerImpl **)(a1 + 32));
      AudioQueueSetParameter(AlertQueueFromImplQueue, 1u, *(AudioQueueParameterValue *)(*(void *)(a1 + 32) + 400));
    }
    VCLocker::~VCLocker((VCLocker *)v6);
  }
}

- (void)setRecordEndWaitTime:(double)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  if (v10 && !self->mClientAPIClutch)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3321888768;
    v8[2] = __42__AVVoiceController_setRecordEndWaitTime___block_invoke;
    v8[3] = &__block_descriptor_56_ea8_40c42_ZTSNSt3__110shared_ptrI14ControllerImplEE_e5_v8__0l;
    *(double *)&v8[4] = a3;
    v8[5] = v10;
    id v9 = v11;
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    ControllerImpl::safeWork(v10, v8, (uint64_t)"-[AVVoiceController setRecordEndWaitTime:]");
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
  else
  {
    if (kAVVCScope)
    {
      id v5 = *(id *)kAVVCScope;
      if (!v5) {
        goto LABEL_10;
      }
    }
    else
    {
      id v5 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      double v13 = "AVVoiceController.mm";
      __int16 v14 = 1024;
      int v15 = 1162;
      __int16 v16 = 2048;
      uint64_t v17 = v10;
      __int16 v18 = 1024;
      BOOL v19 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }
  }
LABEL_10:
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
}

void __42__AVVoiceController_setRecordEndWaitTime___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2 != *(double *)(v3 + 448))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3321888768;
    v5[2] = __42__AVVoiceController_setRecordEndWaitTime___block_invoke_2;
    v5[3] = &__block_descriptor_56_ea8_40c42_ZTSNSt3__110shared_ptrI14ControllerImplEE_e5_v8__0l;
    *(double *)&v5[4] = v2;
    id v4 = *(std::__shared_weak_count **)(a1 + 48);
    v5[5] = v3;
    id v6 = v4;
    if (v4) {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    ControllerImpl::safeNotify(v3, (uint64_t)"setRecordEndWaitTime", v5);
    if (v6) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
}

void __42__AVVoiceController_setRecordEndWaitTime___block_invoke_2(uint64_t a1)
{
  double v2 = *(double *)(a1 + 32);
  double v3 = fmax(v2, 0.25);
  if (v2 == -1.0) {
    double v4 = -1.0;
  }
  else {
    double v4 = v3;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  *(double *)(v5 + 448) = v4;
  id WeakRetained = objc_loadWeakRetained((id *)(v5 + 416));
  [WeakRetained setEndWaitTime:*(double *)(*(void *)(a1 + 40) + 448)];
}

- (double)recordEndWaitTime
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  if (!v10 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      double v3 = *(id *)kAVVCScope;
      if (!v3)
      {
LABEL_10:
        double v6 = 0.0;
        goto LABEL_16;
      }
    }
    else
    {
      double v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "AVVoiceController.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1152;
      *(_WORD *)&unsigned char buf[18] = 2048;
      *(void *)&buf[20] = v10;
      *(_WORD *)&unsigned char buf[28] = 1024;
      *(_DWORD *)&buf[30] = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  *(void *)&buf[24] = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3321888768;
  v8[2] = __38__AVVoiceController_recordEndWaitTime__block_invoke;
  v8[3] = &unk_1EEFA7D18;
  v8[4] = buf;
  v8[5] = v10;
  id v9 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ControllerImpl::safeWorkSync(v10, v8);
  double v6 = *(double *)(*(void *)&buf[8] + 24);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  _Block_object_dispose(buf, 8);
LABEL_16:
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  return v6;
}

double __38__AVVoiceController_recordEndWaitTime__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 40) + 448);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)setRecordInterspeechWaitTime:(double)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  if (v10 && !self->mClientAPIClutch)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3321888768;
    v8[2] = __50__AVVoiceController_setRecordInterspeechWaitTime___block_invoke;
    v8[3] = &__block_descriptor_56_ea8_40c42_ZTSNSt3__110shared_ptrI14ControllerImplEE_e5_v8__0l;
    *(double *)&v8[4] = a3;
    v8[5] = v10;
    id v9 = v11;
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    ControllerImpl::safeWork(v10, v8, (uint64_t)"-[AVVoiceController setRecordInterspeechWaitTime:]");
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
  else
  {
    if (kAVVCScope)
    {
      uint64_t v5 = *(id *)kAVVCScope;
      if (!v5) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v5 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = "AVVoiceController.mm";
      __int16 v14 = 1024;
      int v15 = 1135;
      __int16 v16 = 2048;
      uint64_t v17 = v10;
      __int16 v18 = 1024;
      BOOL v19 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }
  }
LABEL_10:
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
}

void __50__AVVoiceController_setRecordInterspeechWaitTime___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2 != *(double *)(v3 + 440))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3321888768;
    v5[2] = __50__AVVoiceController_setRecordInterspeechWaitTime___block_invoke_2;
    v5[3] = &__block_descriptor_56_ea8_40c42_ZTSNSt3__110shared_ptrI14ControllerImplEE_e5_v8__0l;
    *(double *)&v5[4] = v2;
    id v4 = *(std::__shared_weak_count **)(a1 + 48);
    v5[5] = v3;
    id v6 = v4;
    if (v4) {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    ControllerImpl::safeNotify(v3, (uint64_t)"setRecordInterspeechWaitTime", v5);
    if (v6) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
}

void __50__AVVoiceController_setRecordInterspeechWaitTime___block_invoke_2(uint64_t a1)
{
  double v2 = *(double *)(a1 + 32);
  double v3 = fmax(v2, 0.25);
  if (v2 == -1.0) {
    double v4 = -1.0;
  }
  else {
    double v4 = v3;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  *(double *)(v5 + 440) = v4;
  id WeakRetained = objc_loadWeakRetained((id *)(v5 + 416));
  [WeakRetained setInterspeechWaitTime:*(double *)(*(void *)(a1 + 40) + 440)];
}

- (double)recordInterspeechWaitTime
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  if (!v10 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      double v3 = *(id *)kAVVCScope;
      if (!v3)
      {
LABEL_10:
        double v6 = 0.0;
        goto LABEL_16;
      }
    }
    else
    {
      double v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "AVVoiceController.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1125;
      *(_WORD *)&unsigned char buf[18] = 2048;
      *(void *)&buf[20] = v10;
      *(_WORD *)&unsigned char buf[28] = 1024;
      *(_DWORD *)&buf[30] = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  *(void *)&buf[24] = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3321888768;
  v8[2] = __46__AVVoiceController_recordInterspeechWaitTime__block_invoke;
  v8[3] = &unk_1EEFA7D18;
  v8[4] = buf;
  v8[5] = v10;
  id v9 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ControllerImpl::safeWorkSync(v10, v8);
  double v6 = *(double *)(*(void *)&buf[8] + 24);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  _Block_object_dispose(buf, 8);
LABEL_16:
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  return v6;
}

double __46__AVVoiceController_recordInterspeechWaitTime__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 40) + 440);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)setRecordStartWaitTime:(double)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (kAVVCScope)
  {
    uint64_t v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int v15 = "AVVoiceController.mm";
    __int16 v16 = 1024;
    int v17 = 1108;
    __int16 v18 = 2048;
    double v19 = a3;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController: recordStartWaitTime: %f ####", buf, 0x1Cu);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  if (v12 == 0.0 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      uint64_t v7 = *(id *)kAVVCScope;
      if (!v7) {
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      int v15 = "AVVoiceController.mm";
      __int16 v16 = 1024;
      int v17 = 1109;
      __int16 v18 = 2048;
      double v19 = v12;
      __int16 v20 = 1024;
      BOOL v21 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3321888768;
    v10[2] = __44__AVVoiceController_setRecordStartWaitTime___block_invoke;
    v10[3] = &__block_descriptor_56_ea8_40c42_ZTSNSt3__110shared_ptrI14ControllerImplEE_e5_v8__0l;
    *(double *)&v10[4] = a3;
    *(double *)&void v10[5] = v12;
    uint64_t v11 = v13;
    if (v13) {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    ControllerImpl::safeWork(*(uint64_t *)&v12, v10, (uint64_t)"-[AVVoiceController setRecordStartWaitTime:]");
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
  }
LABEL_17:
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
}

void __44__AVVoiceController_setRecordStartWaitTime___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2 != *(double *)(v3 + 432))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3321888768;
    v5[2] = __44__AVVoiceController_setRecordStartWaitTime___block_invoke_2;
    v5[3] = &__block_descriptor_56_ea8_40c42_ZTSNSt3__110shared_ptrI14ControllerImplEE_e5_v8__0l;
    *(double *)&v5[4] = v2;
    id v4 = *(std::__shared_weak_count **)(a1 + 48);
    v5[5] = v3;
    id v6 = v4;
    if (v4) {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    ControllerImpl::safeNotify(v3, (uint64_t)"setRecordStartWaitTime", v5);
    if (v6) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
}

void __44__AVVoiceController_setRecordStartWaitTime___block_invoke_2(uint64_t a1)
{
  double v2 = *(double *)(a1 + 32);
  double v3 = fmax(v2, 0.25);
  if (v2 == -1.0) {
    double v4 = -1.0;
  }
  else {
    double v4 = v3;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  *(double *)(v5 + 432) = v4;
  id WeakRetained = objc_loadWeakRetained((id *)(v5 + 416));
  [WeakRetained setStartWaitTime:*(double *)(*(void *)(a1 + 40) + 432)];
}

- (double)recordStartWaitTime
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  if (!v10 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      double v3 = *(id *)kAVVCScope;
      if (!v3)
      {
LABEL_10:
        double v6 = 0.0;
        goto LABEL_16;
      }
    }
    else
    {
      double v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "AVVoiceController.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1098;
      *(_WORD *)&unsigned char buf[18] = 2048;
      *(void *)&buf[20] = v10;
      *(_WORD *)&unsigned char buf[28] = 1024;
      *(_DWORD *)&buf[30] = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  *(void *)&buf[24] = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3321888768;
  v8[2] = __40__AVVoiceController_recordStartWaitTime__block_invoke;
  v8[3] = &unk_1EEFA7D18;
  v8[4] = buf;
  v8[5] = v10;
  id v9 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ControllerImpl::safeWorkSync(v10, v8);
  double v6 = *(double *)(*(void *)&buf[8] + 24);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  _Block_object_dispose(buf, 8);
LABEL_16:
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  return v6;
}

double __40__AVVoiceController_recordStartWaitTime__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 40) + 432);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)setRecordEndpointMode:(int)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (kAVVCScope)
  {
    uint64_t v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v16 = "AVVoiceController.mm";
    __int16 v17 = 1024;
    int v18 = 1084;
    __int16 v19 = 1024;
    LODWORD(v20) = a3;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController: setRecordEndpointMode: %d ####", buf, 0x18u);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  if (v13 && !self->mClientAPIClutch)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3321888768;
    v10[2] = __43__AVVoiceController_setRecordEndpointMode___block_invoke;
    v10[3] = &__block_descriptor_52_ea8_32c42_ZTSNSt3__110shared_ptrI14ControllerImplEE_e5_v8__0l;
    v10[4] = v13;
    uint64_t v11 = v14;
    if (v14) {
      atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    int v12 = a3;
    ControllerImpl::safeWork(v13, v10, (uint64_t)"-[AVVoiceController setRecordEndpointMode:]");
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
  }
  else
  {
    if (kAVVCScope)
    {
      uint64_t v7 = *(id *)kAVVCScope;
      if (!v7) {
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      __int16 v16 = "AVVoiceController.mm";
      __int16 v17 = 1024;
      int v18 = 1085;
      __int16 v19 = 2048;
      uint64_t v20 = v13;
      __int16 v21 = 1024;
      BOOL v22 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }
  }
LABEL_17:
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
}

void __43__AVVoiceController_setRecordEndpointMode___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(a1 + 48);
  if (*(_DWORD *)(v2 + 428) != v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3321888768;
    v5[2] = __43__AVVoiceController_setRecordEndpointMode___block_invoke_2;
    v5[3] = &__block_descriptor_52_ea8_32c42_ZTSNSt3__110shared_ptrI14ControllerImplEE_e5_v8__0l;
    id v4 = *(std::__shared_weak_count **)(a1 + 40);
    v5[4] = v2;
    id v6 = v4;
    if (v4)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      int v3 = *(_DWORD *)(a1 + 48);
    }
    int v7 = v3;
    ControllerImpl::safeNotify(v2, (uint64_t)"setRecordEndpointMode", v5);
    if (v6) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v6);
    }
  }
}

void __43__AVVoiceController_setRecordEndpointMode___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  *(_DWORD *)(v2 + 428) = *(_DWORD *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(v2 + 416));
  if (*(_DWORD *)(a1 + 48) == 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  id v5 = WeakRetained;
  [WeakRetained setEndpointMode:v4];
}

- (int)recordEndpointMode
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  if (!v10 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      int v3 = *(id *)kAVVCScope;
      if (!v3)
      {
LABEL_10:
        int v6 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      int v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "AVVoiceController.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1074;
      *(_WORD *)&unsigned char buf[18] = 2048;
      *(void *)&buf[20] = v10;
      __int16 v13 = 1024;
      BOOL v14 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  *(_DWORD *)&buf[24] = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3321888768;
  v8[2] = __39__AVVoiceController_recordEndpointMode__block_invoke;
  v8[3] = &unk_1EEFA7D18;
  v8[4] = buf;
  v8[5] = v10;
  id v9 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ControllerImpl::safeWorkSync(v10, v8);
  int v6 = *(_DWORD *)(*(void *)&buf[8] + 24);
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  _Block_object_dispose(buf, 8);
LABEL_16:
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  return v6;
}

uint64_t __39__AVVoiceController_recordEndpointMode__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(_DWORD *)(*(void *)(result + 40) + 428);
  return result;
}

- (void)setEndpointerDelegate:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (kAVVCScope)
  {
    id v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v18 = "AVVoiceController.mm";
    __int16 v19 = 1024;
    int v20 = 1064;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController: setEndpointerDelegate ####", buf, 0x12u);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  uint64_t v7 = v15;
  if (v15 && !self->mClientAPIClutch)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3321888768;
    v11[2] = __43__AVVoiceController_setEndpointerDelegate___block_invoke;
    v11[3] = &unk_1EEFA81C8;
    uint64_t v13 = v15;
    BOOL v14 = v16;
    if (v16) {
      atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v11[4] = self;
    id v12 = v4;
    ControllerImpl::safeWorkSync(v7, v11);

    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
  }
  else
  {
    if (kAVVCScope)
    {
      id v8 = *(id *)kAVVCScope;
      if (!v8) {
        goto LABEL_17;
      }
    }
    else
    {
      id v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      int v18 = "AVVoiceController.mm";
      __int16 v19 = 1024;
      int v20 = 1065;
      __int16 v21 = 2048;
      uint64_t v22 = v15;
      __int16 v23 = 1024;
      BOOL v24 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }
  }
LABEL_17:
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
}

void __43__AVVoiceController_setEndpointerDelegate___block_invoke(uint64_t a1)
{
}

- (Endpointer)endpointerDelegate
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__145;
  __int16 v16 = __Block_byref_object_dispose__146;
  id v17 = 0;
  [(AVVoiceController *)self impl];
  if (!v10 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      int v3 = *(id *)kAVVCScope;
      if (!v3)
      {
LABEL_10:
        id v6 = 0;
        goto LABEL_11;
      }
    }
    else
    {
      int v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      __int16 v19 = "AVVoiceController.mm";
      __int16 v20 = 1024;
      int v21 = 1054;
      __int16 v22 = 2048;
      uint64_t v23 = v10;
      __int16 v24 = 1024;
      BOOL v25 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3321888768;
  v8[2] = __39__AVVoiceController_endpointerDelegate__block_invoke;
  v8[3] = &unk_1EEFA7D18;
  v8[4] = &v12;
  v8[5] = v10;
  id v9 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ControllerImpl::safeWorkSync(v10, v8);
  id v6 = (id)v13[5];
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
LABEL_11:
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  _Block_object_dispose(&v12, 8);

  return (Endpointer *)v6;
}

uint64_t __39__AVVoiceController_endpointerDelegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 416));

  return MEMORY[0x1F41817F8]();
}

- (void)setRecordDelegate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (kAVVCScope)
  {
    id v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVVoiceController.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1029;
    __int16 v14 = 2048;
    id v15 = v4;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController: setRecordDelegate: %p ####", buf, 0x1Cu);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  uint64_t v7 = *(void *)buf;
  if (*(void *)buf)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3321888768;
    v8[2] = __39__AVVoiceController_setRecordDelegate___block_invoke;
    v8[3] = &unk_1EEFA81C8;
    id v9 = v4;
    uint64_t v11 = v7;
    uint64_t v12 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8]) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v10 = self;
    ControllerImpl::safeWorkSync(v7, v8);
    if (v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
  }
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
}

void __39__AVVoiceController_setRecordDelegate___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 168));

  if (v2 != WeakRetained)
  {
    ControllerImpl::waitForAllStopRecordCompletion(*(ControllerImpl **)(a1 + 48), *(AVVoiceController **)(a1 + 40));
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3321888768;
    v6[2] = __39__AVVoiceController_setRecordDelegate___block_invoke_2;
    v6[3] = &unk_1EEFA7D50;
    uint64_t v5 = *(void *)(a1 + 48);
    id v4 = *(std::__shared_weak_count **)(a1 + 56);
    uint64_t v8 = v5;
    id v9 = v4;
    if (v4) {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    id v7 = *(id *)(a1 + 32);
    ControllerImpl::safeNotifySync(v5, (uint64_t)"set record delegate", v6);

    if (v9) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
}

id __39__AVVoiceController_setRecordDelegate___block_invoke_2(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 40) + 168), *(id *)(a1 + 32));
}

- (AVVoiceControllerRecordDelegate)recordDelegate
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__145;
  uint64_t v16 = __Block_byref_object_dispose__146;
  id v17 = 0;
  [(AVVoiceController *)self impl];
  if (!v10 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      int v3 = *(id *)kAVVCScope;
      if (!v3)
      {
LABEL_10:
        id v6 = 0;
        goto LABEL_11;
      }
    }
    else
    {
      int v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      __int16 v19 = "AVVoiceController.mm";
      __int16 v20 = 1024;
      int v21 = 1019;
      __int16 v22 = 2048;
      uint64_t v23 = v10;
      __int16 v24 = 1024;
      BOOL v25 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3321888768;
  v8[2] = __35__AVVoiceController_recordDelegate__block_invoke;
  v8[3] = &unk_1EEFA7D18;
  void v8[4] = &v12;
  v8[5] = v10;
  id v9 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ControllerImpl::safeWorkSync(v10, v8);
  id v6 = (id)v13[5];
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
LABEL_11:
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  _Block_object_dispose(&v12, 8);

  return (AVVoiceControllerRecordDelegate *)v6;
}

uint64_t __35__AVVoiceController_recordDelegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 168));

  return MEMORY[0x1F41817F8]();
}

- (BOOL)setAlertSoundFromURL:(id)a3 forType:(int)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(AVVoiceController *)self impl];
  if (!v16 || self->mClientAPIClutch)
  {
    if (kAVVCScope)
    {
      id v7 = *(id *)kAVVCScope;
      if (!v7)
      {
LABEL_10:
        LOBYTE(self) = 0;
        goto LABEL_11;
      }
    }
    else
    {
      id v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      __int16 v19 = "AVVoiceController.mm";
      __int16 v20 = 1024;
      int v21 = 1000;
      __int16 v22 = 2048;
      uint64_t v23 = v16;
      __int16 v24 = 1024;
      int v25 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }

    goto LABEL_10;
  }
  if (kAVVCScope)
  {
    id v11 = *(id *)kAVVCScope;
    if (!v11) {
      goto LABEL_21;
    }
  }
  else
  {
    id v11 = (id)MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
  }
  uint64_t v13 = v11;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v6 absoluteString];
    *(_DWORD *)buf = 136315906;
    __int16 v19 = "AVVoiceController.mm";
    __int16 v20 = 1024;
    int v21 = 1002;
    __int16 v22 = 2112;
    uint64_t v23 = (uint64_t)v14;
    __int16 v24 = 1024;
    int v25 = a4;
    _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController: setAlertSoundFromURL: %@ forType: %d ####", buf, 0x22u);
  }
LABEL_21:
  if ((a4 - 4) > 0xFFFFFFFC)
  {
    LOBYTE(self) = ControllerImpl::setAlertURL(v16, self, a4, v6) == 0;
    goto LABEL_11;
  }
  if (!kAVVCScope)
  {
    self = (AVVoiceController *)MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
    goto LABEL_27;
  }
  self = (AVVoiceController *)*(id *)kAVVCScope;
  if (self)
  {
LABEL_27:
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v19 = "AVVoiceController.mm";
      __int16 v20 = 1024;
      int v21 = 1004;
      _os_log_impl(&dword_19D794000, &self->super, OS_LOG_TYPE_ERROR, "%25s:%-5d setAlertSoundFromURL:forType: Illegal alertType", buf, 0x12u);
    }

    goto LABEL_10;
  }
LABEL_11:
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }

  return (char)self;
}

- (BOOL)IsDeviceAvailableInLocalRoute:(id)a3 error:(id *)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a4)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-4 userInfo:0];
  }
  if (kAVVCScope)
  {
    id v6 = *(id *)kAVVCScope;
    if (!v6) {
      goto LABEL_10;
    }
  }
  else
  {
    id v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136315394;
    uint64_t v10 = "AVVoiceController.mm";
    __int16 v11 = 1024;
    int v12 = 993;
    _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d ### unimplemented in this platform", (uint8_t *)&v9, 0x12u);
  }

LABEL_10:
  return 1;
}

- (void)enableMiniDucking:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (kAVVCScope)
  {
    id v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v16 = "AVVoiceController.mm";
    __int16 v17 = 1024;
    int v18 = 949;
    __int16 v19 = 1024;
    LODWORD(v20) = v3;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController: enableMiniDucking: %d", buf, 0x18u);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  if (v13 && !self->mClientAPIClutch)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3321888768;
    v10[2] = __39__AVVoiceController_enableMiniDucking___block_invoke;
    v10[3] = &__block_descriptor_49_ea8_32c42_ZTSNSt3__110shared_ptrI14ControllerImplEE_e5_v8__0l;
    v10[4] = v13;
    __int16 v11 = v14;
    if (v14) {
      atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    BOOL v12 = v3;
    ControllerImpl::safeWorkSync(v13, v10);
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
  }
  else
  {
    if (kAVVCScope)
    {
      id v7 = *(id *)kAVVCScope;
      if (!v7) {
        goto LABEL_17;
      }
    }
    else
    {
      id v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      uint64_t v16 = "AVVoiceController.mm";
      __int16 v17 = 1024;
      int v18 = 950;
      __int16 v19 = 2048;
      uint64_t v20 = v13;
      __int16 v21 = 1024;
      BOOL v22 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }
  }
LABEL_17:
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
}

void __39__AVVoiceController_enableMiniDucking___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(std::__shared_weak_count **)(a1 + 40);
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  SessionLock::SessionLock(v4, v2, v3);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  ControllerImpl::enableMiniDucking(*(ControllerImpl **)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
  VCLocker::~VCLocker((VCLocker *)v4);
}

- (void)dealloc
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  int v42 = 4114;
  char v43 = 1;
  long long v44 = 0u;
  long long v45 = 0u;
  kdebug_trace();
  TraceMethod::TraceMethod((TraceMethod *)v41, "dealloc");
  ElapsedTime::ElapsedTime((ElapsedTime *)v46, "-[AVVoiceController dealloc]", 0, 0);
  if (kAVVCScope)
  {
    BOOL v3 = *(id *)kAVVCScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v48 = "AVVoiceController.mm";
    __int16 v49 = 1024;
    int v50 = 929;
    __int16 v51 = 2048;
    long long v52 = self;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [enforce 1 avvc] #### AVVoiceController: dealloc [self == %p] ####", buf, 0x1Cu);
  }

LABEL_8:
  impl = (uint64_t *)self->_impl;
  if (!impl) {
    goto LABEL_24;
  }
  uint64_t v6 = *impl;
  id v7 = (std::__shared_weak_count *)impl[1];
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (!*(unsigned char *)(v6 + 520))
  {
    if (kAVVCScope)
    {
      id v8 = *(id *)kAVVCScope;
      if (!v8)
      {
LABEL_19:
        uint64_t v10 = *(NSObject **)kAVVCScope;
        __int16 v11 = CALog::Scope::oslog(*(id *)kAVVCScope);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          id v48 = (const char *)self;
          _os_log_fault_impl(&dword_19D794000, v10, OS_LOG_TYPE_FAULT, "In dealloc without prior teardownWithError: call. Controller(%p)", buf, 0xCu);
        }

        goto LABEL_22;
      }
    }
    else
    {
      id v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v48 = "AVVoiceController.mm";
      __int16 v49 = 1024;
      int v50 = 935;
      __int16 v51 = 2048;
      long long v52 = self;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d In dealloc without prior teardownWithError: call. Controller(%p)", buf, 0x1Cu);
    }

    goto LABEL_19;
  }
LABEL_22:
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
LABEL_24:
  BOOL v12 = self;
  if (kAVVCScope)
  {
    if (*(unsigned char *)(kAVVCScope + 8))
    {
      uint64_t v13 = *(id *)kAVVCScope;
      if (v13)
      {
        uint64_t v14 = v13;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          id v48 = "AVVCUtils.mm";
          __int16 v49 = 1024;
          int v50 = 87;
          __int16 v51 = 2048;
          long long v52 = v12;
          _os_log_impl(&dword_19D794000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d UnregisterObject: unregistering %p", buf, 0x1Cu);
        }
      }
    }
  }
  if (!ObjectExists(v12))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19D794000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, " ASSERTION FAILED: unregistering a nonexistent object!", buf, 2u);
    }
    __break(1u);
  }
  pthread_mutex_lock(&MapLocker::sMapLock);
  uint64_t ObjectMap = (uint64_t **)GetObjectMap();
  uint64_t v16 = ObjectMap[1];
  if (!v16) {
    goto LABEL_42;
  }
  __int16 v17 = (uint64_t *)(ObjectMap + 1);
  int v18 = ObjectMap[1];
  do
  {
    unint64_t v19 = v18[4];
    BOOL v20 = v19 >= (unint64_t)v12;
    if (v19 >= (unint64_t)v12) {
      __int16 v21 = (uint64_t **)v18;
    }
    else {
      __int16 v21 = (uint64_t **)(v18 + 1);
    }
    if (v20) {
      __int16 v17 = v18;
    }
    int v18 = *v21;
  }
  while (*v21);
  if (v17 == (uint64_t *)(ObjectMap + 1) || v17[4] > (unint64_t)v12) {
LABEL_42:
  }
    __int16 v17 = (uint64_t *)(ObjectMap + 1);
  BOOL v22 = (uint64_t *)v17[1];
  if (v22)
  {
    do
    {
      uint64_t v23 = v22;
      BOOL v22 = (uint64_t *)*v22;
    }
    while (v22);
  }
  else
  {
    __int16 v24 = v17;
    do
    {
      uint64_t v23 = (uint64_t *)v24[2];
      BOOL v25 = *v23 == (void)v24;
      __int16 v24 = v23;
    }
    while (!v25);
  }
  if (*ObjectMap == v17) {
    *uint64_t ObjectMap = v23;
  }
  ObjectMap[2] = (uint64_t *)((char *)ObjectMap[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v16, v17);
  operator delete(v17);
  pthread_mutex_unlock(&MapLocker::sMapLock);

  if (kAVVCScope)
  {
    uint64_t v26 = *(id *)kAVVCScope;
    if (!v26) {
      goto LABEL_58;
    }
  }
  else
  {
    uint64_t v26 = MEMORY[0x1E4F14500];
    id v27 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v48 = "AVVoiceController.mm";
    __int16 v49 = 1024;
    int v50 = 941;
    _os_log_impl(&dword_19D794000, v26, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController: exiting dealloc ####", buf, 0x12u);
  }

LABEL_58:
  __int16 v28 = v12;
  if (kAVVCScope)
  {
    id v29 = *(id *)kAVVCScope;
    if (!v29) {
      goto LABEL_65;
    }
  }
  else
  {
    id v29 = (id)MEMORY[0x1E4F14500];
    id v30 = MEMORY[0x1E4F14500];
  }
  uint64_t v31 = v29;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v32 = GetAVVCSingleInstanceSemaphore();
    uint64_t v33 = [v32 debugDescription];
    *(_DWORD *)buf = 136315906;
    id v48 = "AVVoiceController.mm";
    __int16 v49 = 1024;
    int v50 = 137;
    __int16 v51 = 2048;
    long long v52 = v28;
    __int16 v53 = 2112;
    v54 = v33;
    _os_log_impl(&dword_19D794000, v31, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [enforce 1 avvc] before signal avvc(%p), %@", buf, 0x26u);
  }
LABEL_65:
  __int16 v34 = GetAVVCSingleInstanceSemaphore();
  dispatch_semaphore_signal(v34);

  if (kAVVCScope)
  {
    id v35 = *(id *)kAVVCScope;
    if (!v35) {
      goto LABEL_72;
    }
  }
  else
  {
    id v35 = (id)MEMORY[0x1E4F14500];
    id v36 = MEMORY[0x1E4F14500];
  }
  uint64_t v37 = v35;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = GetAVVCSingleInstanceSemaphore();
    unint64_t v39 = [v38 debugDescription];
    *(_DWORD *)buf = 136315906;
    id v48 = "AVVoiceController.mm";
    __int16 v49 = 1024;
    int v50 = 139;
    __int16 v51 = 2048;
    long long v52 = v28;
    __int16 v53 = 2112;
    v54 = v39;
    _os_log_impl(&dword_19D794000, v37, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [enforce 1 avvc] after signal avvc(%p), %@", buf, 0x26u);
  }
LABEL_72:

  ElapsedTime::~ElapsedTime((ElapsedTime *)v46);
  TraceMethod::~TraceMethod((TraceMethod *)v41);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v42);
  v40.receiver = v28;
  v40.super_class = (Class)AVVoiceController;
  [(AVVoiceController *)&v40 dealloc];
}

- (void)_teardownWithError:(id *)a3
{
  impl = self->_impl;
  if (!impl) {
    return;
  }
  uint64_t v6 = *(ControllerImpl **)impl;
  id v5 = (std::__shared_weak_count *)*((void *)impl + 1);
  if (v5)
  {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    if (!v6)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
      return;
    }
  }
  else if (!v6)
  {
    return;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3321888768;
  v8[2] = __40__AVVoiceController__teardownWithError___block_invoke;
  v8[3] = &unk_1EEFA7D50;
  void v8[4] = self;
  v8[5] = v6;
  id v9 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ControllerImpl::safeWorkSync((uint64_t)v6, v8);
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  if (IsSerializationEnabled(void)::enable) {
    ControllerImpl::safeAllQueuesBarrier(v6);
  }
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  id v7 = (std::__shared_weak_count *)*((void *)impl + 1);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  MEMORY[0x19F3ABB30](impl, 0x20C40A4A59CD2);
  self->_impl = 0;
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

void __40__AVVoiceController__teardownWithError___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (kAVVCScope)
  {
    uint64_t v1 = *(id *)kAVVCScope;
    if (!v1) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v1 = MEMORY[0x1E4F14500];
    id v2 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    unint64_t v39 = "AVVoiceController.mm";
    __int16 v40 = 1024;
    int v41 = 849;
    __int16 v42 = 2048;
    id v43 = v3;
    _os_log_impl(&dword_19D794000, v1, OS_LOG_TYPE_DEFAULT, "%25s:%-5d beginning teardown. self == %p", buf, 0x1Cu);
  }

LABEL_8:
  [*(id *)(a1 + 32) sessionCleanup];
  ControllerImpl::cleanup(*(ControllerImpl **)(a1 + 40), *(AVVoiceController **)(a1 + 32));
  ControllerImpl::deleteRecordingEngines(*(ControllerImpl **)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v4 + 521)) {
    goto LABEL_37;
  }
  id v5 = *(std::__shared_weak_count **)(a1 + 48);
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  SessionLock::SessionLock(v36, v4, v5);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  __int16 v28 = ControllerImpl::sessionManagerForStreamID(*(void *)(a1 + 40), 0, 0);
  id v35 = 0;
  objc_msgSend(v28, "setActive:withOptions:error:", 0, objc_msgSend(v28, "getSessionActivationOptions"), &v35);
  id v6 = v35;
  if (!v6) {
    goto LABEL_21;
  }
  if (!kAVVCScope)
  {
    id v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
    goto LABEL_18;
  }
  id v7 = *(id *)kAVVCScope;
  if (v7)
  {
LABEL_18:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      unint64_t v39 = "AVVoiceController.mm";
      __int16 v40 = 1024;
      int v41 = 868;
      __int16 v42 = 2112;
      id v43 = v6;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d setActive(false): failed with error: %@", buf, 0x1Cu);
    }
  }
LABEL_21:
  id v9 = +[AVVCSessionFactory sharedInstance];
  uint64_t v10 = [v9 auxSessionManagers];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (!v12) {
    goto LABEL_36;
  }
  uint64_t v13 = MEMORY[0x1E4F14500];
  uint64_t v14 = *(void *)v32;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v32 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      unsigned int v17 = [v16 getSessionActivationOptions];
      id v30 = v6;
      [v16 setActive:0 withOptions:v17 error:&v30];
      id v18 = v30;

      id v6 = v18;
      if (v18)
      {
        if (kAVVCScope)
        {
          unint64_t v19 = *(id *)kAVVCScope;
          if (!v19) {
            continue;
          }
        }
        else
        {
          BOOL v20 = v13;
          unint64_t v19 = v13;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          unint64_t v39 = "AVVoiceController.mm";
          __int16 v40 = 1024;
          int v41 = 877;
          __int16 v42 = 2112;
          id v43 = v6;
          _os_log_impl(&dword_19D794000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d setActive(false): failed with error: %@", buf, 0x1Cu);
        }
      }
    }
    uint64_t v12 = [v11 countByEnumeratingWithState:&v31 objects:v37 count:16];
  }
  while (v12);
LABEL_36:

  VCLocker::~VCLocker((VCLocker *)v36);
  uint64_t v4 = *(void *)(a1 + 40);
LABEL_37:
  objc_storeWeak((id *)(v4 + 416), 0);
  uint64_t v21 = *(void *)(a1 + 40);
  BOOL v22 = *(void **)(v21 + 456);
  *(void *)(v21 + 456) = 0;

  uint64_t v23 = +[AVVoiceTriggerClient sharedInstance];
  [v23 setAVVCServerCrashedBlock:0];

  __int16 v24 = +[AVVoiceTriggerClient sharedInstance];
  [v24 setAVVCServerResetBlock:0];

  uint64_t v25 = *(void *)(a1 + 40);
  *(unsigned char *)(v25 + 520) = 1;
  [*(id *)(v25 + 464) setParentVoiceController:0];
  if (kAVVCScope)
  {
    uint64_t v26 = *(id *)kAVVCScope;
    if (!v26) {
      return;
    }
  }
  else
  {
    uint64_t v26 = MEMORY[0x1E4F14500];
    id v27 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    unint64_t v39 = "ControllerImpl.mm";
    __int16 v40 = 1024;
    int v41 = 487;
    __int16 v42 = 1024;
    LODWORD(v43) = 1;
    _os_log_impl(&dword_19D794000, v26, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ControllerImpl::setAVVCTeardownCompleted(%d)", buf, 0x18u);
  }
}

- (void)teardownWithError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  self->BOOL mClientAPIClutch = 1;
  int v7 = 4138;
  char v8 = 1;
  long long v9 = 0u;
  long long v10 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v17, "-[AVVoiceController teardownWithError:]", 0, 0);
  if (kAVVCScope)
  {
    id v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v12 = "AVVoiceController.mm";
    __int16 v13 = 1024;
    int v14 = 828;
    __int16 v15 = 2048;
    uint64_t v16 = self;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController: teardownWithError: [self = %p] ####", buf, 0x1Cu);
  }

LABEL_8:
  if (a3) {
    *a3 = 0;
  }
  [(AVVoiceController *)self setRecordDelegate:0];
  [(AVVoiceController *)self _teardownWithError:a3];
  ElapsedTime::~ElapsedTime((ElapsedTime *)v17);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v7);
}

- (void)removeStream:(unint64_t)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(AVVoiceController *)self impl];
  uint64_t v7 = v17;
  if (v17 && !self->mClientAPIClutch)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3321888768;
    v11[2] = __45__AVVoiceController_removeStream_completion___block_invoke;
    v11[3] = &unk_1EEFA87B0;
    uint64_t v14 = v17;
    __int16 v15 = v18;
    if (v18) {
      atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    unint64_t v16 = a3;
    v11[4] = self;
    id v12 = 0;
    id v13 = v6;
    ControllerImpl::safeWork(v7, v11, (uint64_t)"-[AVVoiceController removeStream:completion:]");

    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
  }
  else
  {
    if (kAVVCScope)
    {
      char v8 = *(id *)kAVVCScope;
      if (!v8) {
        goto LABEL_10;
      }
    }
    else
    {
      char v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      BOOL mClientAPIClutch = self->mClientAPIClutch;
      *(_DWORD *)buf = 136315906;
      BOOL v20 = "AVVoiceController.mm";
      __int16 v21 = 1024;
      int v22 = 808;
      __int16 v23 = 2048;
      uint64_t v24 = v17;
      __int16 v25 = 1024;
      BOOL v26 = mClientAPIClutch;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Invalid operation. impl(%p) ClientAPIClutch(%d)", buf, 0x22u);
    }
  }
LABEL_10:
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
}

void __45__AVVoiceController_removeStream_completion___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 72);
  BOOL v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3321888768;
  v9[2] = __45__AVVoiceController_removeStream_completion___block_invoke_2;
  v9[3] = &unk_1EEFA7FA0;
  uint64_t v6 = *(void *)(a1 + 56);
  id v5 = *(std::__shared_weak_count **)(a1 + 64);
  uint64_t v11 = v6;
  id v12 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 72);
  id v10 = v7;
  uint64_t v13 = v8;
  ControllerImpl::_removeEngineFromMap(v6, v3, v2, v4, v9);

  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
}

void __45__AVVoiceController_removeStream_completion___block_invoke_2(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__AVVoiceController_removeStream_completion___block_invoke_3;
  v5[3] = &unk_1E5965A60;
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 56);
  id v6 = v3;
  uint64_t v7 = v4;
  ControllerImpl::safeNotify(v2, (uint64_t)"removeStream", v5);
}

uint64_t __45__AVVoiceController_removeStream_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(a1 + 40), 0);
  }
  return result;
}

- (void)cleanSlateWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  self->BOOL mClientAPIClutch = 1;
  int v12 = 4139;
  char v13 = 1;
  long long v14 = 0u;
  long long v15 = 0u;
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)v19, "-[AVVoiceController cleanSlateWithError:]", 0, 0);
  if (kAVVCScope)
  {
    id v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVVoiceController.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 783;
    __int16 v17 = 2048;
    uint64_t v18 = self;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController: cleanSlate: [self = %p] ####", buf, 0x1Cu);
  }

LABEL_8:
  [(AVVoiceController *)self impl];
  if (*(void *)buf)
  {
    uint64_t v7 = *(void *)(*(void *)buf + 184);
    uint64_t v8 = *(std::__shared_weak_count **)&buf[8];
    *(void *)buf = 0;
    *(void *)&buf[8] = 0;
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
    [(AVVoiceController *)self setRecordDelegate:0];
    [(AVVoiceController *)self _teardownWithError:a3];
    id v11 = 0;
    int64_t v9 = [(AVVoiceController *)self _bringUp:v7 withError:&v11];
    id v10 = v11;
    if (a3 && v9)
    {
      *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v9 userInfo:0];
    }
    self->BOOL mClientAPIClutch = 0;
  }
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)v19);
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v12);
}

- (void)finalize
{
  TraceMethod::TraceMethod((TraceMethod *)v6, "finalize");
  [(AVVoiceController *)self impl];
  [(AVVoiceController *)self sessionCleanup];
  if (v4) {
    ControllerImpl::cleanup(v4, self);
  }
  v3.receiver = self;
  v3.super_class = (Class)AVVoiceController;
  [(AVVoiceController *)&v3 finalize];
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  TraceMethod::~TraceMethod((TraceMethod *)v6);
}

- (void)endAudioSessionActivate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  if (!v11) {
    goto LABEL_12;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v11 + 168));
  if (!WeakRetained) {
    goto LABEL_12;
  }
  id v6 = objc_loadWeakRetained((id *)(v11 + 168));
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0) {
    goto LABEL_12;
  }
  if (!kAVVCScope)
  {
    uint64_t v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
    goto LABEL_8;
  }
  uint64_t v8 = *(id *)kAVVCScope;
  if (v8)
  {
LABEL_8:
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      long long v14 = "AVVoiceController.mm";
      __int16 v15 = 1024;
      int v16 = 750;
      __int16 v17 = 1024;
      BOOL v18 = v3;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Calling record delegate's voiceControllerDidSetAudioSessionActive. Going active? : %d", buf, 0x18u);
    }
  }
  id v10 = objc_loadWeakRetained((id *)(v11 + 168));
  [v10 voiceControllerDidSetAudioSessionActive:self isActivated:v3];

LABEL_12:
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
}

- (void)beginAudioSessionActivate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  if (!v11) {
    goto LABEL_12;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v11 + 168));
  if (!WeakRetained) {
    goto LABEL_12;
  }
  id v6 = objc_loadWeakRetained((id *)(v11 + 168));
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0) {
    goto LABEL_12;
  }
  if (!kAVVCScope)
  {
    uint64_t v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
    goto LABEL_8;
  }
  uint64_t v8 = *(id *)kAVVCScope;
  if (v8)
  {
LABEL_8:
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      long long v14 = "AVVoiceController.mm";
      __int16 v15 = 1024;
      int v16 = 738;
      __int16 v17 = 1024;
      BOOL v18 = v3;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Calling record delegate's voiceControllerWillSetAudioSessionActive. Going active? : %d", buf, 0x18u);
    }
  }
  id v10 = objc_loadWeakRetained((id *)(v11 + 168));
  [v10 voiceControllerWillSetAudioSessionActive:self willActivate:v3];

LABEL_12:
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
}

- (void)endRecordInterruption
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  if (!v9) {
    goto LABEL_12;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v9 + 168));
  if (!WeakRetained) {
    goto LABEL_12;
  }
  id v4 = objc_loadWeakRetained((id *)(v9 + 168));
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    goto LABEL_12;
  }
  if (!kAVVCScope)
  {
    id v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
    goto LABEL_8;
  }
  id v6 = *(id *)kAVVCScope;
  if (v6)
  {
LABEL_8:
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      int v12 = "AVVoiceController.mm";
      __int16 v13 = 1024;
      int v14 = 726;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d handleInterruptStop: notifying", buf, 0x12u);
    }
  }
  id v8 = objc_loadWeakRetained((id *)(v9 + 168));
  [v8 voiceControllerEndRecordInterruption:self];

LABEL_12:
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

- (void)beginRecordInterruptionWithContext:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(AVVoiceController *)self impl];
  if (v17)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v17 + 168));
    if (WeakRetained)
    {
      id v6 = objc_loadWeakRetained((id *)(v17 + 168));
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        if (kAVVCScope)
        {
          id v8 = *(id *)kAVVCScope;
          if (!v8)
          {
LABEL_22:
            __int16 v13 = objc_loadWeakRetained((id *)(v17 + 168));
            [v13 voiceControllerBeginRecordInterruption:self withContext:v4];
LABEL_28:

            goto LABEL_29;
          }
        }
        else
        {
          id v8 = MEMORY[0x1E4F14500];
          id v15 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v20 = "AVVoiceController.mm";
          __int16 v21 = 1024;
          int v22 = 708;
          __int16 v23 = 2112;
          id v24 = v4;
          _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d handleInterruptStart: notifying with context: %@", buf, 0x1Cu);
        }

        goto LABEL_22;
      }
    }
    id v9 = objc_loadWeakRetained((id *)(v17 + 168));
    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)(v17 + 168));
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        if (kAVVCScope)
        {
          int v12 = *(id *)kAVVCScope;
          if (!v12)
          {
LABEL_27:
            __int16 v13 = objc_loadWeakRetained((id *)(v17 + 168));
            [v13 voiceControllerBeginRecordInterruption:self];
            goto LABEL_28;
          }
        }
        else
        {
          int v12 = MEMORY[0x1E4F14500];
          id v16 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v20 = "AVVoiceController.mm";
          __int16 v21 = 1024;
          int v22 = 711;
          _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d handleInterruptStart: notifying without context", buf, 0x12u);
        }

        goto LABEL_27;
      }
    }
    if (kAVVCScope)
    {
      __int16 v13 = *(id *)kAVVCScope;
      if (!v13) {
        goto LABEL_29;
      }
    }
    else
    {
      __int16 v13 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v20 = "AVVoiceController.mm";
      __int16 v21 = 1024;
      int v22 = 715;
      _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d handleInterruptStart: WARNING: delegate does not respond to voiceControllerBeginRecordInterruption:", buf, 0x12u);
    }
    goto LABEL_28;
  }
LABEL_29:
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
}

- (void)notifyEventOccured:(unint64_t)a3 error:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(AVVoiceController *)self impl];
  if (v14)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v14 + 168));
    if (WeakRetained)
    {
      id v8 = objc_loadWeakRetained((id *)(v14 + 168));
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        if (kAVVCScope)
        {
          id v10 = *(id *)kAVVCScope;
          if (!v10)
          {
LABEL_17:
            char v11 = objc_loadWeakRetained((id *)(v14 + 168));
            [v11 voiceControllerEventOccurred:self forStream:a3 error:v6];
LABEL_18:

            goto LABEL_19;
          }
        }
        else
        {
          id v10 = MEMORY[0x1E4F14500];
          id v13 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v17 = "AVVoiceController.mm";
          __int16 v18 = 1024;
          int v19 = 691;
          __int16 v20 = 2048;
          unint64_t v21 = a3;
          __int16 v22 = 2112;
          id v23 = v6;
          _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Notifying streamHandle(%lu) that an event occured: %@", buf, 0x26u);
        }

        goto LABEL_17;
      }
    }
    if (kAVVCScope)
    {
      char v11 = *(id *)kAVVCScope;
      if (!v11) {
        goto LABEL_19;
      }
    }
    else
    {
      char v11 = MEMORY[0x1E4F14500];
      id v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v17 = "AVVoiceController.mm";
      __int16 v18 = 1024;
      int v19 = 695;
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d WARNING: delegate does not respond to voiceControllerEventOccurred:forStream:error:", buf, 0x12u);
    }
    goto LABEL_18;
  }
LABEL_19:
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
}

- (void)notifyStreamInvalidated:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  if (!v12) {
    goto LABEL_19;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v12 + 168));
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)(v12 + 168));
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      if (kAVVCScope)
      {
        id v8 = *(id *)kAVVCScope;
        if (!v8)
        {
LABEL_17:
          char v9 = objc_loadWeakRetained((id *)(v12 + 168));
          [v9 voiceControllerStreamInvalidated:self forStream:a3];
LABEL_18:

          goto LABEL_19;
        }
      }
      else
      {
        id v8 = MEMORY[0x1E4F14500];
        id v11 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        id v15 = "AVVoiceController.mm";
        __int16 v16 = 1024;
        int v17 = 676;
        __int16 v18 = 2048;
        unint64_t v19 = a3;
        _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Notifying streamHandle(%lu) invalidated", buf, 0x1Cu);
      }

      goto LABEL_17;
    }
  }
  if (!kAVVCScope)
  {
    char v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
LABEL_11:
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v15 = "AVVoiceController.mm";
      __int16 v16 = 1024;
      int v17 = 680;
      __int16 v18 = 2048;
      unint64_t v19 = a3;
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d streamHandle(%lu) invalidated but no record delegate, or notify selector not supported", buf, 0x1Cu);
    }
    goto LABEL_18;
  }
  char v9 = *(id *)kAVVCScope;
  if (v9) {
    goto LABEL_11;
  }
LABEL_19:
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
}

- (void)alertPlaybackFinishedWithSettings:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(AVVoiceController *)self impl];
  if (v21)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v21 + 168));
    if (WeakRetained)
    {
      id v6 = objc_loadWeakRetained((id *)(v21 + 168));
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = objc_loadWeakRetained((id *)(v21 + 168));
        [v8 voiceControllerDidFinishAlertPlayback:self withSettings:v4 error:0];

        if (kAVVCScope)
        {
          id v9 = *(id *)kAVVCScope;
          if (!v9) {
            goto LABEL_20;
          }
        }
        else
        {
          id v9 = (id)MEMORY[0x1E4F14500];
          id v15 = MEMORY[0x1E4F14500];
        }
        __int16 v16 = v9;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v24 = "AVVoiceController.mm";
          __int16 v25 = 1024;
          int v26 = 661;
          __int16 v27 = 1024;
          int v28 = [v4 type];
          __int16 v29 = 1024;
          int v30 = [v4 mode];
          __int16 v31 = 2048;
          uint64_t v32 = [v4 alertEndTime];
          int v17 = "%25s:%-5d Calling alert playback finished delegate. Settings { Type: %d, Mode: %d, alertEndTime: %llu }";
          __int16 v18 = v16;
          uint32_t v19 = 40;
LABEL_18:
          _os_log_impl(&dword_19D794000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
          goto LABEL_19;
        }
        goto LABEL_19;
      }
    }
    id v10 = objc_loadWeakRetained((id *)(v21 + 168));
    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)(v21 + 168));
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        id v13 = objc_loadWeakRetained((id *)(v21 + 168));
        objc_msgSend(v13, "voiceControllerDidFinishAlertPlayback:ofType:error:", self, objc_msgSend(v4, "type"), 0);

        if (kAVVCScope)
        {
          id v14 = *(id *)kAVVCScope;
          if (!v14) {
            goto LABEL_20;
          }
        }
        else
        {
          id v14 = (id)MEMORY[0x1E4F14500];
          id v20 = MEMORY[0x1E4F14500];
        }
        __int16 v16 = v14;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v24 = "AVVoiceController.mm";
          __int16 v25 = 1024;
          int v26 = 665;
          __int16 v27 = 1024;
          int v28 = [v4 type];
          int v17 = "%25s:%-5d Calling alert playback finished delegate. Type: %d";
          __int16 v18 = v16;
          uint32_t v19 = 24;
          goto LABEL_18;
        }
LABEL_19:
      }
    }
  }
LABEL_20:
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
}

- (void)encodeError:(int)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  uint64_t v5 = v16;
  if (!v16) {
    goto LABEL_19;
  }
  if (kAVVCScope)
  {
    id v6 = *(id *)kAVVCScope;
    if (!v6) {
      goto LABEL_9;
    }
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  id v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    CAX4CCString::CAX4CCString((CAX4CCString *)v18, a3);
    *(_DWORD *)buf = 136315650;
    id v20 = "AVVoiceController.mm";
    __int16 v21 = 1024;
    int v22 = 643;
    __int16 v23 = 2080;
    uint64_t v24 = v18;
    _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d     Reporting encoder error %s via delegate", buf, 0x1Cu);
  }

  uint64_t v5 = v16;
LABEL_9:
  id WeakRetained = objc_loadWeakRetained((id *)(v5 + 168));
  if (WeakRetained)
  {
    id v10 = objc_loadWeakRetained((id *)(v16 + 168));
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v13 = [v12 initWithDomain:*MEMORY[0x1E4F28760] code:a3 userInfo:0];
      id v14 = objc_loadWeakRetained((id *)(v16 + 168));
      [v14 voiceControllerEncoderErrorDidOccur:self error:v13];

LABEL_18:
      goto LABEL_19;
    }
  }
  if (!kAVVCScope)
  {
    id v13 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
LABEL_16:
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v20 = "AVVoiceController.mm";
      __int16 v21 = 1024;
      int v22 = 649;
      _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d encodeError detected but no record delegate, or notify selector not supported", buf, 0x12u);
    }
    goto LABEL_18;
  }
  id v13 = *(id *)kAVVCScope;
  if (v13) {
    goto LABEL_16;
  }
LABEL_19:
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
}

- (void)endpointDetectedAtTime:(double)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (ObjectExists(self))
  {
    [(AVVoiceController *)self impl];
    uint64_t v5 = v18;
    if (!v18) {
      goto LABEL_30;
    }
    if (kAVVCScope)
    {
      id v6 = *(id *)kAVVCScope;
      if (!v6) {
        goto LABEL_17;
      }
    }
    else
    {
      id v6 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v21 = "AVVoiceController.mm";
      __int16 v22 = 1024;
      int v23 = 625;
      __int16 v24 = 2048;
      double v25 = a3;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### endpointDetected: time %.2f seconds ####", buf, 0x1Cu);
    }

    uint64_t v5 = v18;
LABEL_17:
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 168));
    if (WeakRetained
      && (id v11 = objc_loadWeakRetained((id *)(v18 + 168)),
          char v12 = objc_opt_respondsToSelector(),
          v11,
          WeakRetained,
          (v12 & 1) != 0))
    {
      id v13 = objc_loadWeakRetained((id *)(v18 + 168));
      [v13 voiceControllerDidDetectEndpoint:self ofType:2 atTime:a3];
    }
    else
    {
      id v14 = objc_loadWeakRetained((id *)(v18 + 168));
      if (v14
        && (id v15 = objc_loadWeakRetained((id *)(v18 + 168)),
            char v16 = objc_opt_respondsToSelector(),
            v15,
            v14,
            (v16 & 1) != 0))
      {
        id v13 = objc_loadWeakRetained((id *)(v18 + 168));
        [v13 voiceControllerDidDetectEndpoint:self ofType:2];
      }
      else
      {
        if (kAVVCScope)
        {
          id v13 = *(id *)kAVVCScope;
          if (!v13)
          {
LABEL_30:
            if (v19) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v19);
            }
            return;
          }
        }
        else
        {
          id v13 = MEMORY[0x1E4F14500];
          id v17 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v21 = "AVVoiceController.mm";
          __int16 v22 = 1024;
          int v23 = 633;
          _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d WARNING: delegate is nil or does not respond to voiceControllerDidDetectEndpoint:ofType:", buf, 0x12u);
        }
      }
    }

    goto LABEL_30;
  }
  if (kAVVCScope)
  {
    id v7 = *(id *)kAVVCScope;
    if (!v7) {
      return;
    }
  }
  else
  {
    id v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v21 = "AVVoiceController.mm";
    __int16 v22 = 1024;
    int v23 = 618;
    _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d endpointDetected -> called after object destroyed -- ignoring call", buf, 0x12u);
  }
}

- (void)interspeechPointDetectedAtTime:(double)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (ObjectExists(self))
  {
    [(AVVoiceController *)self impl];
    uint64_t v5 = v18;
    if (!v18) {
      goto LABEL_30;
    }
    if (kAVVCScope)
    {
      id v6 = *(id *)kAVVCScope;
      if (!v6) {
        goto LABEL_17;
      }
    }
    else
    {
      id v6 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v21 = "AVVoiceController.mm";
      __int16 v22 = 1024;
      int v23 = 603;
      __int16 v24 = 2048;
      double v25 = a3;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### interspeechPointDetected: time %.2f seconds ####", buf, 0x1Cu);
    }

    uint64_t v5 = v18;
LABEL_17:
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 168));
    if (WeakRetained
      && (id v11 = objc_loadWeakRetained((id *)(v18 + 168)),
          char v12 = objc_opt_respondsToSelector(),
          v11,
          WeakRetained,
          (v12 & 1) != 0))
    {
      id v13 = objc_loadWeakRetained((id *)(v18 + 168));
      [v13 voiceControllerDidDetectEndpoint:self ofType:1 atTime:a3];
    }
    else
    {
      id v14 = objc_loadWeakRetained((id *)(v18 + 168));
      if (v14
        && (id v15 = objc_loadWeakRetained((id *)(v18 + 168)),
            char v16 = objc_opt_respondsToSelector(),
            v15,
            v14,
            (v16 & 1) != 0))
      {
        id v13 = objc_loadWeakRetained((id *)(v18 + 168));
        [v13 voiceControllerDidDetectEndpoint:self ofType:1];
      }
      else
      {
        if (kAVVCScope)
        {
          id v13 = *(id *)kAVVCScope;
          if (!v13)
          {
LABEL_30:
            if (v19) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v19);
            }
            return;
          }
        }
        else
        {
          id v13 = MEMORY[0x1E4F14500];
          id v17 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v21 = "AVVoiceController.mm";
          __int16 v22 = 1024;
          int v23 = 611;
          _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d WARNING: delegate is nil or does not respond to voiceControllerDidDetectEndpoint:ofType:", buf, 0x12u);
        }
      }
    }

    goto LABEL_30;
  }
  if (kAVVCScope)
  {
    id v7 = *(id *)kAVVCScope;
    if (!v7) {
      return;
    }
  }
  else
  {
    id v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v21 = "AVVoiceController.mm";
    __int16 v22 = 1024;
    int v23 = 596;
    _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d interspeechPointDetected -> called after object destroyed -- ignoring call", buf, 0x12u);
  }
}

- (void)startpointDetected
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (ObjectExists(self))
  {
    [(AVVoiceController *)self impl];
    uint64_t v3 = v13;
    if (!v13) {
      goto LABEL_27;
    }
    if (kAVVCScope)
    {
      id v4 = *(id *)kAVVCScope;
      if (!v4) {
        goto LABEL_17;
      }
    }
    else
    {
      id v4 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      char v16 = "AVVoiceController.mm";
      __int16 v17 = 1024;
      int v18 = 584;
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### startpointDetected: ####", buf, 0x12u);
    }

    uint64_t v3 = v13;
LABEL_17:
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 168));
    if (WeakRetained
      && (id v9 = objc_loadWeakRetained((id *)(v13 + 168)),
          char v10 = objc_opt_respondsToSelector(),
          v9,
          WeakRetained,
          (v10 & 1) != 0))
    {
      id v11 = objc_loadWeakRetained((id *)(v13 + 168));
      [v11 voiceControllerDidDetectStartpoint:self];
    }
    else
    {
      if (kAVVCScope)
      {
        id v11 = *(id *)kAVVCScope;
        if (!v11)
        {
LABEL_27:
          if (v14) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v14);
          }
          return;
        }
      }
      else
      {
        id v11 = MEMORY[0x1E4F14500];
        id v12 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        char v16 = "AVVoiceController.mm";
        __int16 v17 = 1024;
        int v18 = 589;
        _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d WARNING: delegate is nil or does not respond to voiceControllerDidDetectStartpoint:", buf, 0x12u);
      }
    }

    goto LABEL_27;
  }
  if (kAVVCScope)
  {
    uint64_t v5 = *(id *)kAVVCScope;
    if (!v5) {
      return;
    }
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    char v16 = "AVVoiceController.mm";
    __int16 v17 = 1024;
    int v18 = 576;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d startpointDetected -> called after object destroyed -- ignoring call", buf, 0x12u);
  }
}

- (void)finishedRecording:(unint64_t)a3 status:(int)a4
{
  LODWORD(v4) = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (ObjectExists(self))
  {
    [(AVVoiceController *)self impl];
    uint64_t v7 = v24;
    if (!v24) {
      goto LABEL_38;
    }
    if (kAVVCScope)
    {
      id v8 = *(id *)kAVVCScope;
      if (!v8) {
        goto LABEL_23;
      }
    }
    else
    {
      id v8 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)__int16 v27 = "AVVoiceController.mm";
      BOOL v12 = v4 == -11789 || v4 == 0;
      *(_WORD *)&v27[8] = 1024;
      int v13 = v12;
      *(_DWORD *)&v27[10] = 559;
      *(_WORD *)&v27[14] = 1024;
      *(_DWORD *)&v27[16] = v13;
      LOWORD(v28) = 1024;
      *(_DWORD *)((char *)&v28 + 2) = v4;
      HIWORD(v28) = 2048;
      unint64_t v29 = a3;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController: Recording finished (success = %d status = %d streamID = %llu) ####", buf, 0x28u);
    }

    uint64_t v7 = v24;
LABEL_23:
    id WeakRetained = objc_loadWeakRetained((id *)(v7 + 168));
    if (WeakRetained)
    {
      id v15 = objc_loadWeakRetained((id *)(v24 + 168));
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        id v17 = objc_loadWeakRetained((id *)(v24 + 168));
        unint64_t v4 = (int)v4;
        [v17 voiceControllerDidStopRecording:self forStream:a3 forReason:(int)v4];

LABEL_37:
        *(_DWORD *)buf = 4116;
        v27[0] = 0;
        *(_OWORD *)&v27[4] = v4;
        uint64_t v28 = 0;
        unint64_t v29 = 0;
        kdebug_trace();
        TraceWrapper::~TraceWrapper((TraceWrapper *)buf);
LABEL_38:
        if (v25) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v25);
        }
        return;
      }
    }
    id v18 = objc_loadWeakRetained((id *)(v24 + 168));
    if (v18)
    {
      id v19 = objc_loadWeakRetained((id *)(v24 + 168));
      char v20 = objc_opt_respondsToSelector();

      if (v20)
      {
        id v21 = objc_loadWeakRetained((id *)(v24 + 168));
        unint64_t v4 = (int)v4;
        [v21 voiceControllerDidStopRecording:self forReason:(int)v4];

        goto LABEL_37;
      }
    }
    if (kAVVCScope)
    {
      __int16 v22 = *(id *)kAVVCScope;
      if (!v22)
      {
LABEL_36:
        unint64_t v4 = (int)v4;
        goto LABEL_37;
      }
    }
    else
    {
      __int16 v22 = MEMORY[0x1E4F14500];
      id v23 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)__int16 v27 = "AVVoiceController.mm";
      *(_WORD *)&v27[8] = 1024;
      *(_DWORD *)&v27[10] = 568;
      _os_log_impl(&dword_19D794000, v22, OS_LOG_TYPE_DEBUG, "%25s:%-5d WARNING: delegate is nil or does not respond to voiceControllerDidStopRecording:forReason:", buf, 0x12u);
    }

    goto LABEL_36;
  }
  if (kAVVCScope)
  {
    id v9 = *(id *)kAVVCScope;
    if (!v9) {
      return;
    }
  }
  else
  {
    id v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)__int16 v27 = "AVVoiceController.mm";
    *(_WORD *)&v27[8] = 1024;
    *(_DWORD *)&v27[10] = 550;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d finishedRecording -> called after AVVC object destroyed -- ignoring call and possibly leaking ControllerImpl", buf, 0x12u);
  }
}

- (void)beganRecording:(unint64_t)a3 status:(int)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  uint64_t v7 = v25;
  if (!v25) {
    goto LABEL_32;
  }
  if (kAVVCScope)
  {
    id v8 = *(id *)kAVVCScope;
    if (!v8) {
      goto LABEL_9;
    }
  }
  else
  {
    id v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    *(void *)uint64_t v28 = "AVVoiceController.mm";
    *(_WORD *)&v28[8] = 1024;
    *(_DWORD *)&v28[10] = 525;
    *(_WORD *)&v28[14] = 1024;
    *(_DWORD *)&v28[16] = a4 == 0;
    LOWORD(v29) = 1024;
    *(_DWORD *)((char *)&v29 + 2) = a4;
    HIWORD(v29) = 2048;
    unint64_t v30 = a3;
    _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### beganRecording: (success = %d status = %d streamID = %llu) ####", buf, 0x28u);
  }

  uint64_t v7 = v25;
LABEL_9:
  id WeakRetained = objc_loadWeakRetained((id *)(v7 + 168));
  if (WeakRetained
    && (id v11 = objc_loadWeakRetained((id *)(v25 + 168)),
        char v12 = objc_opt_respondsToSelector(),
        v11,
        WeakRetained,
        (v12 & 1) != 0))
  {
    if (a4)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v14 = [v13 initWithDomain:*MEMORY[0x1E4F28760] code:a4 userInfo:0];
    }
    else
    {
      id v14 = 0;
    }
    id v23 = objc_loadWeakRetained((id *)(v25 + 168));
    [v23 voiceControllerDidStartRecording:self forStream:a3 successfully:a4 == 0 error:v14];
  }
  else
  {
    id v15 = objc_loadWeakRetained((id *)(v25 + 168));
    if (v15
      && (id v16 = objc_loadWeakRetained((id *)(v25 + 168)),
          char v17 = objc_opt_respondsToSelector(),
          v16,
          v15,
          (v17 & 1) != 0))
    {
      if (a4)
      {
        id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v14 = [v18 initWithDomain:*MEMORY[0x1E4F28760] code:a4 userInfo:0];
      }
      else
      {
        id v14 = 0;
      }
      id v24 = objc_loadWeakRetained((id *)(v25 + 168));
      [v24 voiceControllerDidStartRecording:self successfully:a4 == 0 error:v14];
    }
    else
    {
      id v19 = objc_loadWeakRetained((id *)(v25 + 168));
      if (v19
        && (id v20 = objc_loadWeakRetained((id *)(v25 + 168)),
            char v21 = objc_opt_respondsToSelector(),
            v20,
            v19,
            (v21 & 1) != 0))
      {
        id v14 = objc_loadWeakRetained((id *)(v25 + 168));
        [v14 voiceControllerDidStartRecording:self successfully:a4 == 0];
      }
      else
      {
        if (kAVVCScope)
        {
          id v14 = *(id *)kAVVCScope;
          if (!v14) {
            goto LABEL_31;
          }
        }
        else
        {
          id v14 = MEMORY[0x1E4F14500];
          id v22 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)uint64_t v28 = "AVVoiceController.mm";
          *(_WORD *)&v28[8] = 1024;
          *(_DWORD *)&v28[10] = 539;
          _os_log_impl(&dword_19D794000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d WARNING: delegate is nil or does not respond to voiceControllerDidStartRecording: variants", buf, 0x12u);
        }
      }
    }
  }

LABEL_31:
  ProfileMetrics(&cfstr_AvvcProfilePro.isa);
  *(_DWORD *)buf = 4115;
  v28[0] = 0;
  *(_OWORD *)&v28[4] = (unint64_t)a4;
  uint64_t v29 = 0;
  unint64_t v30 = 0;
  kdebug_trace();
  TraceWrapper::~TraceWrapper((TraceWrapper *)buf);
LABEL_32:
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }
}

- (void)handlePluginDidUnpublishDevice:(id)a3 withDevice:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(AVVoiceController *)self impl];
  uint64_t v8 = v16;
  if (v16)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3321888768;
    v11[2] = __90__AVVoiceController_AVVoiceControllerInternal__handlePluginDidUnpublishDevice_withDevice___block_invoke;
    v11[3] = &unk_1EEFA8510;
    uint64_t v14 = v16;
    id v15 = v17;
    if (v17) {
      atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    ControllerImpl::dispatchAndSafeWork(v8, v11, (uint64_t)"-[AVVoiceController(AVVoiceControllerInternal) handlePluginDidUnpublishDevice:withDevice:]");

    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
  }
  else
  {
    if (kAVVCScope)
    {
      id v9 = *(id *)kAVVCScope;
      if (!v9) {
        goto LABEL_13;
      }
    }
    else
    {
      id v9 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "AVVoiceController.mm";
      __int16 v20 = 1024;
      int v21 = 503;
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d Error! handlePluginDidUNpublishDevice: ControllerImpl is NULL", buf, 0x12u);
    }
  }
LABEL_13:
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
}

void __90__AVVoiceController_AVVoiceControllerInternal__handlePluginDidUnpublishDevice_withDevice___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 40);
  uint64_t v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  id v4 = *(id *)(a1 + 32);
  id v5 = v1;
  id v6 = v2;
  if (kAVVCScope)
  {
    id v7 = *(id *)kAVVCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  id v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v6 deviceIdentifier];
    int v12 = 136316162;
    id v13 = "ControllerImpl.mm";
    __int16 v14 = 1024;
    int v15 = 728;
    __int16 v16 = 2048;
    id v17 = v5;
    __int16 v18 = 2048;
    id v19 = v6;
    __int16 v20 = 2112;
    int v21 = v10;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d handlePluginDidUnpublishDevice notification for plugin(%p), device(%p), deviceID(%@)", (uint8_t *)&v12, 0x30u);
  }
LABEL_8:
  id v11 = [v6 deviceIdentifier];
  ControllerImpl::_removeEngineFromMap(v3, v4, 0, v11, &__block_literal_global_5601);
}

- (void)handlePluginDidPublishDevice:(id)a3 withDevice:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(AVVoiceController *)self impl];
  if (v10)
  {
    ControllerImpl::handlePluginDidPublishDevice(self, v6, v7);
    goto LABEL_10;
  }
  if (kAVVCScope)
  {
    id v8 = *(id *)kAVVCScope;
    if (!v8) {
      goto LABEL_10;
    }
  }
  else
  {
    id v8 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v13 = "AVVoiceController.mm";
    __int16 v14 = 1024;
    int v15 = 494;
    _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Error! handlePluginDidPublishDevice: ControllerImpl is NULL", buf, 0x12u);
  }

LABEL_10:
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
}

- (void)configureVoiceTriggerClientCompletionBlocks
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__AVVoiceController_AVVoiceControllerInternal__configureVoiceTriggerClientCompletionBlocks__block_invoke;
  aBlock[3] = &unk_1E5964768;
  objc_copyWeak(&v14, &location);
  uint64_t v2 = _Block_copy(aBlock);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91__AVVoiceController_AVVoiceControllerInternal__configureVoiceTriggerClientCompletionBlocks__block_invoke_2;
  v11[3] = &unk_1E5964768;
  objc_copyWeak(&v12, &location);
  uint64_t v3 = _Block_copy(v11);
  id v4 = +[AVVoiceTriggerClient sharedInstance];
  [v4 setAVVCServerCrashedBlock:v2];

  id v5 = +[AVVoiceTriggerClient sharedInstance];
  [v5 setAVVCServerResetBlock:v3];

  if (kAVVCScope)
  {
    id v6 = *(id *)kAVVCScope;
    if (!v6) {
      goto LABEL_8;
    }
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  id v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = _Block_copy(v2);
    uint64_t v10 = _Block_copy(v3);
    *(_DWORD *)buf = 136315906;
    id v17 = "AVVoiceController.mm";
    __int16 v18 = 1024;
    int v19 = 485;
    __int16 v20 = 2048;
    int v21 = v9;
    __int16 v22 = 2048;
    id v23 = v10;
    _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d configureVoiceTriggerClientCompletionBlocks: crashBlock: %p resetBlock: %p", buf, 0x26u);
  }
LABEL_8:
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __91__AVVoiceController_AVVoiceControllerInternal__configureVoiceTriggerClientCompletionBlocks__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained handleMediaServerDeath:v5];
  }
  else if (v5)
  {
    v5[2]();
  }
}

void __91__AVVoiceController_AVVoiceControllerInternal__configureVoiceTriggerClientCompletionBlocks__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained handleMediaServerReset:v5];
  }
  else if (v5)
  {
    v5[2]();
  }
}

- (void)handleMediaServerReset:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  int v16 = 4111;
  char v17 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  kdebug_trace();
  [(AVVoiceController *)self impl];
  uint64_t v5 = v14;
  if (v14)
  {
    BOOL v6 = !self->mClientAPIClutch;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3321888768;
    v9[2] = __71__AVVoiceController_AVVoiceControllerInternal__handleMediaServerReset___block_invoke;
    v9[3] = &unk_1EEFA38E8;
    BOOL v13 = v6;
    uint64_t v11 = v14;
    id v12 = v15;
    if (v15) {
      atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    void v9[4] = self;
    uint64_t v10 = v4;
    ControllerImpl::dispatchAndSafeWork(v5, v9, (uint64_t)"-[AVVoiceController(AVVoiceControllerInternal) handleMediaServerReset:]");

    if (v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
    goto LABEL_15;
  }
  if (!kAVVCScope)
  {
    id v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
    goto LABEL_10;
  }
  id v7 = *(id *)kAVVCScope;
  if (v7)
  {
LABEL_10:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v21 = "AVVoiceController.mm";
      __int16 v22 = 1024;
      int v23 = 423;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d handleMediaServerReset: ControllerImpl is nil. Bailing!", buf, 0x12u);
    }
  }
  if (v4) {
    v4[2](v4);
  }
LABEL_15:
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v16);
}

void __71__AVVoiceController_AVVoiceControllerInternal__handleMediaServerReset___block_invoke(uint64_t a1, AVVoiceController *a2)
{
  if (*(unsigned char *)(a1 + 64)) {
    ControllerImpl::handleServerReset(*(ControllerImpl **)(a1 + 48), a2);
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3321888768;
  void v7[2] = __71__AVVoiceController_AVVoiceControllerInternal__handleMediaServerReset___block_invoke_2;
  v7[3] = &unk_1EEFA80E8;
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v5 = *(std::__shared_weak_count **)(a1 + 56);
  id v8 = v4;
  uint64_t v9 = v6;
  uint64_t v10 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v7[4] = *(void *)(a1 + 32);
  ControllerImpl::safeNotify(v3, (uint64_t)"notify server reset", v7);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

void __71__AVVoiceController_AVVoiceControllerInternal__handleMediaServerReset___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[5];
  if (v2)
  {
    uint64_t v3 = *(void (**)(void))(v2 + 16);
    v3();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 168));
    if (WeakRetained)
    {
      id v7 = WeakRetained;
      id v5 = objc_loadWeakRetained((id *)(a1[6] + 168));
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        id v8 = objc_loadWeakRetained((id *)(a1[6] + 168));
        [v8 voiceControllerMediaServicesWereReset:a1[4]];
      }
    }
  }
}

- (void)handleMediaServerDeath:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  int v16 = 4110;
  char v17 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  kdebug_trace();
  [(AVVoiceController *)self impl];
  uint64_t v5 = v14;
  if (v14)
  {
    BOOL v6 = !self->mClientAPIClutch;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3321888768;
    v9[2] = __71__AVVoiceController_AVVoiceControllerInternal__handleMediaServerDeath___block_invoke;
    v9[3] = &unk_1EEFA38E8;
    BOOL v13 = v6;
    uint64_t v11 = v14;
    id v12 = v15;
    if (v15) {
      atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    void v9[4] = self;
    uint64_t v10 = v4;
    ControllerImpl::dispatchAndSafeWork(v5, v9, (uint64_t)"-[AVVoiceController(AVVoiceControllerInternal) handleMediaServerDeath:]");

    if (v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
    goto LABEL_15;
  }
  if (!kAVVCScope)
  {
    id v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
    goto LABEL_10;
  }
  id v7 = *(id *)kAVVCScope;
  if (v7)
  {
LABEL_10:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v21 = "AVVoiceController.mm";
      __int16 v22 = 1024;
      int v23 = 388;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d handleMediaServerDeath: ControllerImpl is nil. Bailing!", buf, 0x12u);
    }
  }
  if (v4) {
    v4[2](v4);
  }
LABEL_15:
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  TraceWrapper::~TraceWrapper((TraceWrapper *)&v16);
}

void __71__AVVoiceController_AVVoiceControllerInternal__handleMediaServerDeath___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64)) {
    ControllerImpl::handleServerDeath(*(ControllerImpl **)(a1 + 48), *(AVVoiceController **)(a1 + 32));
  }
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 56);
  uint64_t v4 = v3;
  if (v2)
  {
    atomic_fetch_add_explicit(&v2->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    uint64_t v4 = *(void *)(a1 + 48);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3321888768;
  v5[2] = __71__AVVoiceController_AVVoiceControllerInternal__handleMediaServerDeath___block_invoke_2;
  v5[3] = &unk_1EEFA3B78;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = v3;
  id v8 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  void v5[4] = *(void *)(a1 + 32);
  ControllerImpl::safeNotify(v4, (uint64_t)"notify server death", v5);
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }

  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
}

void __71__AVVoiceController_AVVoiceControllerInternal__handleMediaServerDeath___block_invoke_2(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[5];
  if (!v2)
  {
    uint64_t v4 = (std::__shared_weak_count *)a1[7];
    if (v4)
    {
      uint64_t v5 = std::__shared_weak_count::lock(v4);
      if (v5)
      {
        uint64_t v6 = a1[6];
        if (v6)
        {
          uint64_t v7 = (id *)(v6 + 168);
          id WeakRetained = objc_loadWeakRetained((id *)(v6 + 168));
          if (WeakRetained)
          {
            uint64_t v9 = WeakRetained;
            id v10 = objc_loadWeakRetained(v7);
            char v11 = objc_opt_respondsToSelector();

            if (v11)
            {
              id v12 = objc_loadWeakRetained(v7);
              [v12 voiceControllerMediaServicesWereLost:a1[4]];
            }
          }
LABEL_20:
          std::__shared_weak_count::__release_shared[abi:ne180100](v5);
          return;
        }
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
    if (kAVVCScope)
    {
      BOOL v13 = *(id *)kAVVCScope;
      if (!v13) {
        goto LABEL_19;
      }
    }
    else
    {
      BOOL v13 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315650;
      int v16 = "AVVoiceController.mm";
      __int16 v17 = 1024;
      int v18 = 409;
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d nil object encountered (impl: %p). Bailing", (uint8_t *)&v15, 0x1Cu);
    }

LABEL_19:
    if (!v5) {
      return;
    }
    goto LABEL_20;
  }
  uint64_t v3 = *(void (**)(void))(v2 + 16);

  v3();
}

- (void)handleRouteChange:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(AVVoiceController *)self impl];
  if (v18)
  {
    uint64_t v5 = [v4 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v4 object];

      if (!v6) {
        goto LABEL_16;
      }
      id v7 = objc_alloc(MEMORY[0x1E4F1CA60]);
      id v8 = [v4 userInfo];
      uint64_t v9 = (void *)[v7 initWithDictionary:v8];

      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3321888768;
      v12[2] = __66__AVVoiceController_AVVoiceControllerInternal__handleRouteChange___block_invoke;
      v12[3] = &unk_1EEFA8510;
      uint64_t v5 = v6;
      BOOL v13 = v5;
      id v10 = v9;
      id v14 = v10;
      uint64_t v16 = v18;
      __int16 v17 = v19;
      if (v19) {
        atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      int v15 = self;
      ControllerImpl::dispatchAndSafeWork(v18, v12, (uint64_t)"-[AVVoiceController(AVVoiceControllerInternal) handleRouteChange:]");
      if (v17) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v17);
      }
    }
    goto LABEL_15;
  }
  if (!kAVVCScope)
  {
    uint64_t v5 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
LABEL_13:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v21 = "AVVoiceController.mm";
      __int16 v22 = 1024;
      int v23 = 360;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d handleRouteChange: ControllerImpl is nil. Bailing!", buf, 0x12u);
    }
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v5 = *(id *)kAVVCScope;
  if (v5) {
    goto LABEL_13;
  }
LABEL_16:
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
}

void __66__AVVoiceController_AVVoiceControllerInternal__handleRouteChange___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) currentRoute];
  if (v2) {
    [*(id *)(a1 + 40) setObject:v2 forKey:@"AVAudioSessionRouteChangeCurrentRouteKey"];
  }
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = ControllerImpl::audioSessionForStreamID(*(void *)(a1 + 56), 0, 0);

  if (kAVVCScope)
  {
    uint64_t v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = "aux";
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)uint64_t v26 = 136315906;
    *(void *)&v26[4] = "AVVoiceController.mm";
    *(_WORD *)&v26[12] = 1024;
    if (v3 == v4) {
      id v7 = "primary";
    }
    *(_DWORD *)&v26[14] = 373;
    __int16 v27 = 2080;
    uint64_t v28 = v7;
    __int16 v29 = 2048;
    uint64_t v30 = v8;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController handleRouteChange: %s session (%p)", v26, 0x26u);
  }

LABEL_12:
  id v9 = *(id *)(a1 + 40);
  if (kAVVCScope)
  {
    id v10 = *(id *)kAVVCScope;
    if (!v10) {
      goto LABEL_19;
    }
  }
  else
  {
    id v10 = (id)MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  id v12 = v10;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v13 = [v9 objectForKey:@"AVAudioSessionRouteChangeCurrentRouteKey"];
    _logRouteDesc(v13);
    id v14 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)uint64_t v26 = 136315650;
    *(void *)&v26[4] = "AVVCUtils.mm";
    *(_WORD *)&v26[12] = 1024;
    *(_DWORD *)&v26[14] = 1111;
    __int16 v27 = 2112;
    uint64_t v28 = v14;
    _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CurrentRoute: %@", v26, 0x1Cu);
  }
LABEL_19:
  if (kAVVCScope)
  {
    id v15 = *(id *)kAVVCScope;
    if (!v15) {
      goto LABEL_26;
    }
  }
  else
  {
    id v15 = (id)MEMORY[0x1E4F14500];
    id v16 = MEMORY[0x1E4F14500];
  }
  __int16 v17 = v15;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [v9 objectForKey:*MEMORY[0x1E4F4E9C0]];
    _logRouteDesc(v18);
    __int16 v19 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)uint64_t v26 = 136315650;
    *(void *)&v26[4] = "AVVCUtils.mm";
    *(_WORD *)&v26[12] = 1024;
    *(_DWORD *)&v26[14] = 1112;
    __int16 v27 = 2112;
    uint64_t v28 = v19;
    _os_log_impl(&dword_19D794000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d PreviousRoute: %@", v26, 0x1Cu);
  }
LABEL_26:
  uint64_t v20 = objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E4F4E9C8], *(_OWORD *)v26);
  if (kAVVCScope)
  {
    id v21 = *(id *)kAVVCScope;
    if (!v21) {
      goto LABEL_38;
    }
  }
  else
  {
    id v21 = (id)MEMORY[0x1E4F14500];
    id v22 = MEMORY[0x1E4F14500];
  }
  int v23 = v21;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    if (v20)
    {
      unint64_t v24 = [v20 unsignedIntegerValue];
      if (v24 > 8) {
        uint64_t v25 = 0;
      }
      else {
        uint64_t v25 = off_1E5964680[v24];
      }
    }
    else
    {
      uint64_t v25 = "null";
    }
    *(_DWORD *)uint64_t v26 = 136315650;
    *(void *)&v26[4] = "AVVCUtils.mm";
    *(_WORD *)&v26[12] = 1024;
    *(_DWORD *)&v26[14] = 1114;
    __int16 v27 = 2080;
    uint64_t v28 = v25;
    _os_log_impl(&dword_19D794000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d RouteChangeReason: %s", v26, 0x1Cu);
  }

LABEL_38:
  ControllerImpl::handleRouteChange(*(ControllerImpl **)(a1 + 56), *(AVVoiceController **)(a1 + 48), *(AVAudioSession **)(a1 + 32), *(NSDictionary **)(a1 + 40));
}

- (void)handleInterruption:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(AVVoiceController *)self impl];
  if (v16)
  {
    uint64_t v5 = [v4 userInfo];
    id v6 = [v4 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v4 object];

      if (!v7)
      {
LABEL_16:

        goto LABEL_17;
      }
      uint64_t v8 = v16;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3321888768;
      v10[2] = __67__AVVoiceController_AVVoiceControllerInternal__handleInterruption___block_invoke;
      v10[3] = &unk_1EEFA8510;
      id v6 = v7;
      id v11 = v6;
      uint64_t v14 = v16;
      id v15 = v17;
      if (v17) {
        atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      id v12 = v5;
      BOOL v13 = self;
      ControllerImpl::dispatchAndSafeWork(v8, v10, (uint64_t)"-[AVVoiceController(AVVoiceControllerInternal) handleInterruption:]");

      if (v15) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v15);
      }
    }
    goto LABEL_16;
  }
  if (!kAVVCScope)
  {
    uint64_t v5 = MEMORY[0x1E4F14500];
    id v9 = MEMORY[0x1E4F14500];
LABEL_14:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v19 = "AVVoiceController.mm";
      __int16 v20 = 1024;
      int v21 = 334;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d handleInterruption: ControllerImpl is nil. Bailing!", buf, 0x12u);
    }
    goto LABEL_16;
  }
  uint64_t v5 = *(id *)kAVVCScope;
  if (v5) {
    goto LABEL_14;
  }
LABEL_17:
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
}

void __67__AVVoiceController_AVVoiceControllerInternal__handleInterruption___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = ControllerImpl::audioSessionForStreamID(*(void *)(a1 + 56), 0, 0);

  if (kAVVCScope)
  {
    id v4 = *(id *)kAVVCScope;
    if (!v4) {
      goto LABEL_10;
    }
  }
  else
  {
    id v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = "aux";
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    if (v2 == v3) {
      id v6 = "primary";
    }
    int v11 = 136316162;
    id v12 = "AVVoiceController.mm";
    __int16 v13 = 1024;
    int v14 = 342;
    __int16 v15 = 2080;
    uint64_t v16 = v6;
    __int16 v17 = 2048;
    uint64_t v18 = v7;
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController handleInterruption: %s session (%p), %@", (uint8_t *)&v11, 0x30u);
  }

LABEL_10:
  id v9 = [*(id *)(a1 + 40) objectForKey:*MEMORY[0x1E4F4E860]];
  uint64_t v10 = [v9 unsignedLongValue];
  if (v10)
  {
    if (v10 == 1) {
      ControllerImpl::handleInterruptStart(*(ControllerImpl **)(a1 + 56), *(AVVoiceController **)(a1 + 48), *(AVAudioSession **)(a1 + 32), *(NSDictionary **)(a1 + 40));
    }
  }
  else
  {
    ControllerImpl::handleInterruptStop(*(ControllerImpl **)(a1 + 56), *(AVVoiceController **)(a1 + 48), *(AVAudioSession **)(a1 + 32), *(NSDictionary **)(a1 + 40));
  }
}

- (void)hardwareConfigChanged:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(AVVoiceController *)self impl];
  uint64_t v5 = v13;
  if (!v13) {
    goto LABEL_19;
  }
  if (kAVVCScope)
  {
    id v6 = *(id *)kAVVCScope;
    if (!v6) {
      goto LABEL_9;
    }
  }
  else
  {
    id v6 = MEMORY[0x1E4F14500];
    id v7 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "AVVoiceController.mm";
    __int16 v17 = 1024;
    int v18 = 318;
    _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### hardwareConfigChanged: ####", buf, 0x12u);
  }

  uint64_t v5 = v13;
LABEL_9:
  id WeakRetained = objc_loadWeakRetained((id *)(v5 + 168));
  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)(v13 + 168));
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      int v11 = objc_loadWeakRetained((id *)(v13 + 168));
      [v11 voiceControllerRecordHardwareConfigurationDidChange:self toConfiguration:v3];
LABEL_18:

      goto LABEL_19;
    }
  }
  if (!kAVVCScope)
  {
    int v11 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
LABEL_16:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "AVVoiceController.mm";
      __int16 v17 = 1024;
      int v18 = 323;
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d WARNING: delegate is nil or does not respond to voiceControllerRecordHardwareConfigurationDidChange:toConfiguration:", buf, 0x12u);
    }
    goto LABEL_18;
  }
  int v11 = *(id *)kAVVCScope;
  if (v11) {
    goto LABEL_16;
  }
LABEL_19:
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
}

- (void)removeSessionNotifications:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (kAVVCScope)
    {
      id v5 = *(id *)kAVVCScope;
      if (!v5)
      {
LABEL_11:
        objc_msgSend(v4, "removeSessionNotifications:", self, *(_OWORD *)v12, *(void *)&v12[16]);
        goto LABEL_12;
      }
    }
    else
    {
      id v5 = (id)MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    id v7 = v5;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [v4 isPrimary];
      uint64_t v9 = [v4 audioSession];
      char v10 = (void *)v9;
      int v11 = "aux";
      *(void *)&void v12[4] = "AVVoiceController.mm";
      *(_WORD *)&v12[12] = 1024;
      *(_DWORD *)&v12[14] = 308;
      *(_DWORD *)id v12 = 136315906;
      if (v8) {
        int v11 = "primary";
      }
      *(_WORD *)&v12[18] = 2080;
      *(void *)&v12[20] = v11;
      __int16 v13 = 2048;
      uint64_t v14 = v9;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d removeSessionNotifications: removing all notifications for %s session(%p)", v12, 0x26u);
    }
    goto LABEL_11;
  }
LABEL_12:
}

- (void)setSessionNotifications:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (kAVVCScope)
    {
      id v5 = *(id *)kAVVCScope;
      if (!v5)
      {
LABEL_11:
        objc_msgSend(v4, "setupSessionNotifications:", self, *(_OWORD *)v12, *(void *)&v12[16]);
        goto LABEL_12;
      }
    }
    else
    {
      id v5 = (id)MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    id v7 = v5;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = [v4 isPrimary];
      uint64_t v9 = [v4 audioSession];
      char v10 = (void *)v9;
      int v11 = "aux";
      *(void *)&void v12[4] = "AVVoiceController.mm";
      *(_WORD *)&v12[12] = 1024;
      *(_DWORD *)&v12[14] = 298;
      *(_DWORD *)id v12 = 136315906;
      if (v8) {
        int v11 = "primary";
      }
      *(_WORD *)&v12[18] = 2080;
      *(void *)&v12[20] = v11;
      __int16 v13 = 2048;
      uint64_t v14 = v9;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setSessionNotifications: setting up notifications for %s session(%p)", v12, 0x26u);
    }
    goto LABEL_11;
  }
LABEL_12:
}

- (void)sessionCleanup
{
  uint64_t v3 = +[AVVCSessionFactory sharedInstance];
  [v3 setSessionWasCreatedBlock:0];

  id v4 = +[AVVCSessionFactory sharedInstance];
  [v4 setSessionWillBeDestroyedBlock:0];

  [(AVVoiceController *)self impl];
  if (v6)
  {
    id v5 = ControllerImpl::sessionManagerForStreamID(v6, 0, 0);
    [(AVVoiceController *)self removeSessionNotifications:v5];
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
}

- (void)sessionSetup
{
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__AVVoiceController_AVVoiceControllerInternal__sessionSetup__block_invoke;
  v10[3] = &unk_1E5964740;
  objc_copyWeak(&v11, &location);
  uint64_t v3 = +[AVVCSessionFactory sharedInstance];
  [v3 setSessionWasCreatedBlock:v10];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__AVVoiceController_AVVoiceControllerInternal__sessionSetup__block_invoke_2;
  v8[3] = &unk_1E5964740;
  objc_copyWeak(&v9, &location);
  id v4 = +[AVVCSessionFactory sharedInstance];
  [v4 setSessionWillBeDestroyedBlock:v8];

  [(AVVoiceController *)self impl];
  if (v6)
  {
    id v5 = ControllerImpl::sessionManagerForStreamID(v6, 0, 0);
    [(AVVoiceController *)self setSessionNotifications:v5];
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __60__AVVoiceController_AVVoiceControllerInternal__sessionSetup__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setSessionNotifications:v3];
}

void __60__AVVoiceController_AVVoiceControllerInternal__sessionSetup__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained removeSessionNotifications:v3];
}

- (shared_ptr<ControllerImpl>)impl
{
  impl = (uint64_t *)self->_impl;
  *uint64_t v2 = 0;
  v2[1] = 0;
  if (impl)
  {
    uint64_t v5 = *impl;
    uint64_t v4 = impl[1];
    if (v4) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
    }
    *uint64_t v2 = v5;
    v2[1] = v4;
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (ControllerImpl *)self;
  return result;
}

@end