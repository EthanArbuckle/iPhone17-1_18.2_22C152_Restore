@interface SSCoreHapticsPlayer
- (BOOL)createAudioPlayerAndReturnError:(id *)a3;
- (BOOL)doInit:(id)a3 haptic:(id)a4 error:(id *)a5;
- (BOOL)playWithOptions:(id)a3 completionCallbackToken:(unsigned int)a4 error:(id *)a5;
- (BOOL)prepareHapticPatternFromPlayOptions:(id)a3;
- (BOOL)startPlayerAtTime:(double)a3 forAudio:(BOOL)a4 error:(id *)a5;
- (CHHapticEngine)engine;
- (SSCoreHapticsPlayer)init;
- (SSCoreHapticsPlayer)initWithAudio:(id)a3 haptic:(id)a4 error:(id *)a5;
- (SSCoreHapticsPlayer)initWithAudio:(id)a3 hapticDictionary:(id)a4 error:(id *)a5;
- (id)getHapticDictionaryFromURL:(id)a3;
- (id)setupDefaultEngineConfigBlock;
- (unint64_t)createAudioResource:(id)a3 error:(id *)a4;
- (unint64_t)ssid;
- (void)createHapticPlayer:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)handleFinish;
- (void)prewarm:(BOOL)a3;
- (void)registerCompletionAndStop;
- (void)registerCompletionPortion:(BOOL)a3;
- (void)setupLooping;
- (void)stop:(BOOL)a3;
@end

@implementation SSCoreHapticsPlayer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_hapticPatternDict, 0);
  objc_storeStrong((id *)&self->_audioURL, 0);
  objc_storeStrong((id *)&self->_hapticPlayer, 0);

  objc_storeStrong((id *)&self->_audioPlayer, 0);
}

- (unint64_t)ssid
{
  return self->_ssid;
}

- (CHHapticEngine)engine
{
  return (CHHapticEngine *)objc_getProperty(self, a2, 72, 1);
}

- (void)prewarm:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (kSystemSoundClientLogSubsystem)
  {
    v5 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v5) {
      goto LABEL_10;
    }
  }
  else
  {
    v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = @"Unprewarming";
    unint64_t ssid = self->_ssid;
    int v10 = 136316162;
    v11 = "SSCoreHapticsPlayer.mm";
    __int16 v12 = 1024;
    if (v3) {
      v7 = @"Prewarming";
    }
    int v13 = 603;
    __int16 v14 = 2112;
    v15 = v7;
    __int16 v16 = 1024;
    int v17 = ssid;
    __int16 v18 = 2048;
    v19 = self;
    _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@ SSID %u, SSCoreHapticsPlayer %p", (uint8_t *)&v10, 0x2Cu);
  }

LABEL_10:
  engine = self->_engine;
  if (v3) {
    [(CHHapticEngine *)engine prewarmWithCompletionHandler:0];
  }
  else {
    [(CHHapticEngine *)engine stopPrewarm];
  }
}

- (void)stop:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!kSystemSoundClientLogSubsystem)
  {
    v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
LABEL_6:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t ssid = self->_ssid;
      int v8 = 136316162;
      v9 = "SSCoreHapticsPlayer.mm";
      __int16 v10 = 1024;
      int v11 = 585;
      __int16 v12 = 1024;
      int v13 = ssid;
      __int16 v14 = 2048;
      v15 = self;
      __int16 v16 = 1024;
      BOOL v17 = v3;
      _os_log_impl(&dword_1A3931000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Stopping SSID %u, SSCoreHapticsPlayer %p. stopNow: %d", (uint8_t *)&v8, 0x28u);
    }

    if (v3) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v5 = *(id *)kSystemSoundClientLogSubsystem;
  if (v5) {
    goto LABEL_6;
  }
  if (v3)
  {
LABEL_4:
    [(SSCoreHapticsPlayer *)self registerCompletionAndStop];
    return;
  }
LABEL_9:
  if (self->_shouldPlayAudioFinal) {
    [(CHHapticAdvancedPatternPlayerExtended *)self->_audioPlayer setLoopEnabled:0];
  }
  if (self->_shouldPlayHapticsFinal) {
    [(CHHapticAdvancedPatternPlayerExtended *)self->_hapticPlayer setLoopEnabled:0];
  }
}

- (BOOL)playWithOptions:(id)a3 completionCallbackToken:(unsigned int)a4 error:(id *)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v7 = (const __CFDictionary *)a3;
  int v8 = (PlatformUtilities *)getpid();
  self->_clientCompletionToken = a4;
  BOOL v9 = [(SSCoreHapticsPlayer *)self prepareHapticPatternFromPlayOptions:v7];
  SSClientPlayOptions::SSClientPlayOptions((SSClientPlayOptions *)&v56, self->_ssid, v7);
  if (*((float *)&v56 + 3) < 0.0) {
    HIDWORD(v56) = 0;
  }
  float v10 = 0.0;
  if (*(float *)&v57 < 0.0 || (float v10 = 1.0, *(float *)&v57 > 1.0)) {
    *(float *)&long long v57 = v10;
  }
  float v11 = -1.0;
  if (*((float *)&v57 + 1) < -1.0 || (float v11 = 1.0, *((float *)&v57 + 1) > 1.0)) {
    *((float *)&v57 + 1) = v11;
  }
  if (*((float *)&v57 + 2) < 0.0) {
    DWORD2(v57) = 0;
  }
  if (kSystemSoundClientLogSubsystem)
  {
    id v12 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v12) {
      goto LABEL_22;
    }
  }
  else
  {
    id v12 = (id)MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
  }
  __int16 v14 = v12;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t ssid = self->_ssid;
    PlatformUtilities::processName(v8);
    __int16 v16 = v49 >= 0 ? &__p : (void **)__p;
    *(_DWORD *)buf = 136317698;
    *(void *)&buf[4] = "SSCoreHapticsPlayer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 489;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = ssid;
    LOWORD(v59) = 1024;
    *(_DWORD *)((char *)&v59 + 2) = v8;
    WORD3(v59) = 2080;
    *((void *)&v59 + 1) = v16;
    LOWORD(v60) = 1024;
    *(_DWORD *)((char *)&v60 + 2) = DWORD1(v56);
    HIWORD(v60) = 1024;
    *(_DWORD *)v61 = v9;
    *(_WORD *)&v61[4] = 1024;
    *(_DWORD *)&v61[6] = BYTE12(v57);
    *(_WORD *)v62 = 2048;
    *(double *)&v62[2] = *((float *)&v56 + 3);
    __int16 v63 = 1024;
    int v64 = DWORD2(v56);
    __int16 v65 = 2048;
    v66 = self;
    _os_log_impl(&dword_1A3931000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d -> Incoming Request : SSID %d, inClientPID %d(%s), behaviorID %d, customHapticsProvided %d, loop %d, loopPeriod %f, inFlags %u, SSCoreHapticsPlayer %p", buf, 0x54u);
    if (SHIBYTE(v49) < 0) {
      operator delete(__p);
    }
  }

LABEL_22:
  audioPlayer = self->_audioPlayer;
  hapticPlayer = self->_hapticPlayer;
  BOOL shouldPlayAudioFinal = audioPlayer != 0;
  self->_BOOL shouldPlayAudioFinal = shouldPlayAudioFinal;
  self->_BOOL shouldPlayHapticsFinal = hapticPlayer != 0;
  char v20 = BYTE8(v56);
  if ((BYTE8(v56) & 1) == 0) {
    goto LABEL_32;
  }
  if (audioPlayer)
  {
    if (kSystemSoundClientLogSubsystem)
    {
      v21 = *(id *)kSystemSoundClientLogSubsystem;
      if (!v21) {
        goto LABEL_31;
      }
    }
    else
    {
      v21 = MEMORY[0x1E4F14500];
      id v22 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v23 = self->_ssid;
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "SSCoreHapticsPlayer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 499;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v23;
      LOWORD(v59) = 2048;
      *(void *)((char *)&v59 + 2) = self;
      _os_log_impl(&dword_1A3931000, v21, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Disabling audio for SSID %d, SSCoreHapticsPlayer %p as suppress audio flag is set", buf, 0x22u);
    }
  }
LABEL_31:
  BOOL shouldPlayAudioFinal = 0;
  self->_BOOL shouldPlayAudioFinal = 0;
LABEL_32:
  if ((v20 & 2) != 0)
  {
    if (!self->_shouldPlayHapticsFinal)
    {
LABEL_42:
      self->_BOOL shouldPlayHapticsFinal = 0;
      goto LABEL_43;
    }
    if (kSystemSoundClientLogSubsystem)
    {
      v24 = *(id *)kSystemSoundClientLogSubsystem;
      if (!v24)
      {
LABEL_41:
        BOOL shouldPlayAudioFinal = self->_shouldPlayAudioFinal;
        goto LABEL_42;
      }
    }
    else
    {
      v24 = MEMORY[0x1E4F14500];
      id v25 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v26 = self->_ssid;
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "SSCoreHapticsPlayer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 503;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v26;
      LOWORD(v59) = 2048;
      *(void *)((char *)&v59 + 2) = self;
      _os_log_impl(&dword_1A3931000, v24, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Disabling haptics for SSID %d, SSCoreHapticsPlayer %p as suppress haptic flag is set", buf, 0x22u);
    }

    goto LABEL_41;
  }
LABEL_43:
  if (!shouldPlayAudioFinal && !self->_shouldPlayHapticsFinal)
  {
    if (kSystemSoundClientLogSubsystem)
    {
      v37 = *(id *)kSystemSoundClientLogSubsystem;
      if (!v37)
      {
LABEL_63:
        [(SSCoreHapticsPlayer *)self registerCompletionAndStop];
        BOOL v35 = 1;
        goto LABEL_55;
      }
    }
    else
    {
      v37 = MEMORY[0x1E4F14500];
      id v38 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v39 = self->_ssid;
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = "SSCoreHapticsPlayer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 508;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v39;
      LOWORD(v59) = 1024;
      *(_DWORD *)((char *)&v59 + 2) = DWORD1(v56);
      WORD3(v59) = 2048;
      *((void *)&v59 + 1) = self;
      _os_log_impl(&dword_1A3931000, v37, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Both sound and haptic flags are false for SSID %d, behaviorID: %d, SSCoreHapticsPlayer %p", buf, 0x28u);
    }

    goto LABEL_63;
  }
  v27 = objc_opt_new();
  self->_audioPlaybackFinished = !self->_shouldPlayAudioFinal;
  self->_hapticPlaybackFinished = !self->_shouldPlayHapticsFinal;
  if (!kSystemSoundClientLogSubsystem)
  {
    v28 = MEMORY[0x1E4F14500];
    id v29 = MEMORY[0x1E4F14500];
    goto LABEL_49;
  }
  v28 = *(id *)kSystemSoundClientLogSubsystem;
  if (v28)
  {
LABEL_49:
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v30 = self->_ssid;
      BOOL v31 = self->_shouldPlayAudioFinal;
      BOOL shouldPlayHapticsFinal = self->_shouldPlayHapticsFinal;
      *(_DWORD *)buf = 136317186;
      *(void *)&buf[4] = "SSCoreHapticsPlayer.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 523;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v30;
      LOWORD(v59) = 2048;
      *(void *)((char *)&v59 + 2) = self;
      WORD5(v59) = 1024;
      HIDWORD(v59) = v31;
      LOWORD(v60) = 1024;
      *(_DWORD *)((char *)&v60 + 2) = shouldPlayHapticsFinal;
      HIWORD(v60) = 2048;
      *(double *)v61 = *(float *)&v57;
      *(_WORD *)&v61[8] = 1024;
      *(_DWORD *)v62 = 0;
      *(_WORD *)&v62[4] = 1024;
      *(_DWORD *)&v62[6] = 0;
      _os_log_impl(&dword_1A3931000, v28, OS_LOG_TYPE_DEFAULT, "%25s:%-5d SSID %d, SSCoreHapticsPlayer %p, shouldPlayAudio %d, shouldPlayHaptics %d, clientVolumeScalar %f, needsUnduckCall %d, interruptCurrentSystemSounds %d", buf, 0x44u);
    }
  }
  objc_initWeak(&location, self);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __69__SSCoreHapticsPlayer_playWithOptions_completionCallbackToken_error___block_invoke;
  v53[3] = &unk_1E5B14660;
  objc_copyWeak(&v54, &location);
  [(CHHapticAdvancedPatternPlayerExtended *)self->_audioPlayer setCompletionHandler:v53];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __69__SSCoreHapticsPlayer_playWithOptions_completionCallbackToken_error___block_invoke_63;
  v51[3] = &unk_1E5B14660;
  objc_copyWeak(&v52, &location);
  [(CHHapticAdvancedPatternPlayerExtended *)self->_hapticPlayer setCompletionHandler:v51];
  if (BYTE12(v57)) {
    [(SSCoreHapticsPlayer *)self setupLooping];
  }
  __p = 0;
  p_p = &__p;
  uint64_t v49 = 0x2020000000;
  char v50 = 1;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&long long v59 = __Block_byref_object_copy__3153;
  *((void *)&v59 + 1) = __Block_byref_object_dispose__3154;
  id v60 = 0;
  engine = self->_engine;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __69__SSCoreHapticsPlayer_playWithOptions_completionCallbackToken_error___block_invoke_64;
  v40[3] = &unk_1E5B14688;
  v40[4] = self;
  v43 = &__p;
  long long v46 = v57;
  long long v45 = v56;
  CFDictionaryRef v41 = v7;
  v44 = buf;
  id v34 = v27;
  id v42 = v34;
  [(CHHapticEngine *)engine startWithCompletionHandler:v40];
  BOOL v35 = *((unsigned char *)p_p + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&__p, 8);
  objc_destroyWeak(&v52);
  objc_destroyWeak(&v54);
  objc_destroyWeak(&location);

LABEL_55:
  return v35;
}

void __69__SSCoreHapticsPlayer_playWithOptions_completionCallbackToken_error___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (kSystemSoundClientLogSubsystem)
  {
    v2 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v2) {
      goto LABEL_8;
    }
  }
  else
  {
    v2 = MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = WeakRetained[10];
    int v5 = 136315650;
    id v6 = "SSCoreHapticsPlayer.mm";
    __int16 v7 = 1024;
    int v8 = 529;
    __int16 v9 = 1024;
    int v10 = v4;
    _os_log_impl(&dword_1A3931000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d Audio player completion handler called. SSID %d", (uint8_t *)&v5, 0x18u);
  }

LABEL_8:
  [WeakRetained registerCompletionPortion:1];
}

void __69__SSCoreHapticsPlayer_playWithOptions_completionCallbackToken_error___block_invoke_63(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (kSystemSoundClientLogSubsystem)
  {
    v2 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v2) {
      goto LABEL_8;
    }
  }
  else
  {
    v2 = MEMORY[0x1E4F14500];
    id v3 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = WeakRetained[10];
    int v5 = 136315650;
    id v6 = "SSCoreHapticsPlayer.mm";
    __int16 v7 = 1024;
    int v8 = 534;
    __int16 v9 = 1024;
    int v10 = v4;
    _os_log_impl(&dword_1A3931000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d Haptic player completion handler called. SSID %d", (uint8_t *)&v5, 0x18u);
  }

LABEL_8:
  [WeakRetained registerCompletionPortion:0];
}

void __69__SSCoreHapticsPlayer_playWithOptions_completionCallbackToken_error___block_invoke_64(uint64_t a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (kSystemSoundClientLogSubsystem)
    {
      uint64_t v4 = *(id *)kSystemSoundClientLogSubsystem;
      if (!v4)
      {
LABEL_9:
        [*(id *)(a1 + 32) registerCompletionAndStop];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v4 = MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(v6 + 80);
      *(_DWORD *)buf = 136316162;
      v47 = "SSCoreHapticsPlayer.mm";
      __int16 v48 = 1024;
      int v49 = 548;
      __int16 v50 = 2048;
      *(void *)v51 = v6;
      *(_WORD *)&v51[8] = 1024;
      *(_DWORD *)id v52 = v7;
      *(_WORD *)&v52[4] = 2112;
      *(void *)&v52[6] = v3;
      _os_log_impl(&dword_1A3931000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot start SSCoreHapticsPlayer %p for SSID %d, error %@", buf, 0x2Cu);
    }

    goto LABEL_9;
  }
LABEL_10:
  uint64_t v8 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v8 + 68)) {
    goto LABEL_24;
  }
  if (!kSystemSoundClientLogSubsystem)
  {
    __int16 v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
    goto LABEL_15;
  }
  __int16 v9 = *(id *)kSystemSoundClientLogSubsystem;
  if (v9)
  {
LABEL_15:
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(v11 + 80);
      int v13 = *(_DWORD *)(a1 + 76);
      double v14 = *(float *)(a1 + 88);
      *(_DWORD *)buf = 136316418;
      v47 = "SSCoreHapticsPlayer.mm";
      __int16 v48 = 1024;
      int v49 = 555;
      __int16 v50 = 1024;
      *(_DWORD *)v51 = v12;
      *(_WORD *)&void v51[4] = 1024;
      *(_DWORD *)&v51[6] = v13;
      *(_WORD *)id v52 = 2048;
      *(void *)&v52[2] = v11;
      *(_WORD *)&v52[10] = 2048;
      *(double *)&v52[12] = v14;
      _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Starting audio: SSID %u, behaviorID %u, SSCoreHapticsPlayer %p, clientVolumeScalar %f", buf, 0x32u);
    }
  }
  v15 = [*(id *)(a1 + 40) objectForKey:@"PlaySystemSoundOption_UnduckTime"];
  __int16 v16 = v15;
  if (v15)
  {
    [v15 doubleValue];
    if (v17 > 0.00999999978)
    {
      uint64_t v18 = *(void *)(a1 + 32);
      v19 = *(void **)(v18 + 8);
      [*(id *)(v18 + 72) currentTime];
      double v21 = v20;
      [v16 doubleValue];
      uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8);
      id obj = *(id *)(v23 + 40);
      [v19 earlyUnduckAudioAtTime:&obj error:v21 + v22];
      objc_storeStrong((id *)(v23 + 40), obj);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 72) currentTime];
  double v25 = v24 + 0.03;
  unint64_t v26 = *(void **)(a1 + 32);
  uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8);
  id v44 = *(id *)(v27 + 40);
  char v28 = [v26 startPlayerAtTime:1 forAudio:&v44 error:v24 + 0.03];
  objc_storeStrong((id *)(v27 + 40), v44);
  if ((v28 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  id v29 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v30 = *(void *)(a1 + 48);
  uint64_t v31 = *(void *)(*(void *)(a1 + 64) + 8);
  id v43 = *(id *)(v31 + 40);
  [v29 sendParameters:v30 atTime:&v43 error:v25];
  objc_storeStrong((id *)(v31 + 40), v43);

  uint64_t v8 = *(void *)(a1 + 32);
LABEL_24:
  if (!*(unsigned char *)(v8 + 69)) {
    goto LABEL_34;
  }
  [*(id *)(v8 + 72) currentTime];
  double v33 = v32;
  if (!kSystemSoundClientLogSubsystem)
  {
    id v34 = MEMORY[0x1E4F14500];
    id v35 = MEMORY[0x1E4F14500];
    goto LABEL_29;
  }
  id v34 = *(id *)kSystemSoundClientLogSubsystem;
  if (v34)
  {
LABEL_29:
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = *(void *)(a1 + 32);
      uint64_t v37 = *(void *)(v36 + 80);
      int v38 = *(_DWORD *)(a1 + 76);
      *(_DWORD *)buf = 136316162;
      v47 = "SSCoreHapticsPlayer.mm";
      __int16 v48 = 1024;
      int v49 = 573;
      __int16 v50 = 1024;
      *(_DWORD *)v51 = v37;
      *(_WORD *)&void v51[4] = 1024;
      *(_DWORD *)&v51[6] = v38;
      *(_WORD *)id v52 = 2048;
      *(void *)&v52[2] = v36;
      _os_log_impl(&dword_1A3931000, v34, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Starting haptics: SSID %u, behaviorID %u, SSCoreHapticsPlayer %p", buf, 0x28u);
    }
  }
  unint64_t v39 = *(void **)(a1 + 32);
  uint64_t v40 = *(void *)(*(void *)(a1 + 64) + 8);
  id v42 = *(id *)(v40 + 40);
  char v41 = [v39 startPlayerAtTime:0 forAudio:&v42 error:v33 + 0.03];
  objc_storeStrong((id *)(v40 + 40), v42);
  if ((v41 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
LABEL_34:
}

- (SSCoreHapticsPlayer)initWithAudio:(id)a3 hapticDictionary:(id)a4 error:(id *)a5
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  if (v8 | v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)SSCoreHapticsPlayer;
    id v10 = [(SSCoreHapticsPlayer *)&v14 init];
    uint64_t v11 = v10;
    if (v10 && ![(SSCoreHapticsPlayer *)v10 doInit:v8 haptic:v9 error:a5])
    {

      uint64_t v11 = 0;
    }
    self = v11;
    uint64_t v12 = self;
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4813 userInfo:0];
    uint64_t v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (SSCoreHapticsPlayer)initWithAudio:(id)a3 haptic:(id)a4 error:(id *)a5
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  if (v8 | v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)SSCoreHapticsPlayer;
    id v10 = [(SSCoreHapticsPlayer *)&v15 init];
    uint64_t v11 = v10;
    if (v10)
    {
      uint64_t v12 = [(SSCoreHapticsPlayer *)v10 getHapticDictionaryFromURL:v9];
      if (![(SSCoreHapticsPlayer *)v11 doInit:v8 haptic:v12 error:a5])
      {

        uint64_t v11 = 0;
      }
    }
    self = v11;
    int v13 = self;
  }
  else if (a5)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4813 userInfo:0];
    int v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v13 = 0;
  }

  return v13;
}

- (SSCoreHapticsPlayer)init
{
  return 0;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (kSystemSoundClientLogSubsystem)
  {
    id v3 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = "SSCoreHapticsPlayer.mm";
    __int16 v12 = 1024;
    int v13 = 429;
    __int16 v14 = 2048;
    objc_super v15 = self;
    _os_log_impl(&dword_1A3931000, v3, OS_LOG_TYPE_INFO, "%25s:%-5d Destroying SSCoreHapticsPlayer %p", buf, 0x1Cu);
  }

LABEL_8:
  id v5 = +[SSCoreHapticsInfo instance];
  [v5 unregisterSSID:self->_ssid];

  engine = self->_engine;
  self->_engine = 0;

  audioPlayer = self->_audioPlayer;
  self->_audioPlayer = 0;

  hapticPlayer = self->_hapticPlayer;
  self->_hapticPlayer = 0;

  v9.receiver = self;
  v9.super_class = (Class)SSCoreHapticsPlayer;
  [(SSCoreHapticsPlayer *)&v9 dealloc];
}

- (void)registerCompletionAndStop
{
  *(_WORD *)&self->_audioPlaybackFinished = 257;
  [(SSCoreHapticsPlayer *)self handleFinish];
}

- (void)registerCompletionPortion:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (!self->_audioPlayer) {
      return;
    }
    p_audioPlaybackFinished = &self->_audioPlaybackFinished;
    if (!self->_audioPlaybackFinished) {
      goto LABEL_4;
    }
  }
  else
  {
    if (!self->_hapticPlayer) {
      return;
    }
    p_audioPlaybackFinished = &self->_hapticPlaybackFinished;
    if (!self->_hapticPlaybackFinished)
    {
LABEL_4:
      BOOL *p_audioPlaybackFinished = 1;
      if (kSystemSoundClientLogSubsystem)
      {
        uint64_t v6 = *(id *)kSystemSoundClientLogSubsystem;
        if (!v6)
        {
LABEL_24:
          [(SSCoreHapticsPlayer *)self handleFinish];
          return;
        }
      }
      else
      {
        uint64_t v6 = MEMORY[0x1E4F14500];
        id v11 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = @"Haptics";
        unint64_t ssid = self->_ssid;
        *(void *)&v14[4] = "SSCoreHapticsPlayer.mm";
        *(_DWORD *)__int16 v14 = 136316162;
        *(_WORD *)&v14[12] = 1024;
        if (v3) {
          __int16 v12 = @"Audio";
        }
        *(_DWORD *)&v14[14] = 415;
        __int16 v15 = 2112;
        uint64_t v16 = v12;
        __int16 v17 = 1024;
        int v18 = ssid;
        __int16 v19 = 2048;
        double v20 = self;
        _os_log_impl(&dword_1A3931000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@ completed for SSID %d, SSCoreHapticsPlayer %p", v14, 0x2Cu);
      }

      goto LABEL_24;
    }
  }
  if (kSystemSoundClientLogSubsystem)
  {
    uint64_t v7 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v7) {
      return;
    }
  }
  else
  {
    uint64_t v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_super v9 = @"Haptics";
    unint64_t v10 = self->_ssid;
    *(void *)&v14[4] = "SSCoreHapticsPlayer.mm";
    *(_DWORD *)__int16 v14 = 136316162;
    *(_WORD *)&v14[12] = 1024;
    if (v3) {
      objc_super v9 = @"Audio";
    }
    *(_DWORD *)&v14[14] = 410;
    __int16 v15 = 2112;
    uint64_t v16 = v9;
    __int16 v17 = 1024;
    int v18 = v10;
    __int16 v19 = 2048;
    double v20 = self;
    _os_log_impl(&dword_1A3931000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d %@ for SSID %d, SSCoreHapticsPlayer %p has already finished or never started", v14, 0x2Cu);
  }
}

- (void)handleFinish
{
  if (self->_audioPlaybackFinished && self->_hapticPlaybackFinished)
  {
    engine = self->_engine;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __35__SSCoreHapticsPlayer_handleFinish__block_invoke;
    v3[3] = &unk_1E5B14638;
    v3[4] = self;
    [(CHHapticEngine *)engine stopWithCompletionHandler:v3];
  }
}

void __35__SSCoreHapticsPlayer_handleFinish__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (kSystemSoundClientLogSubsystem)
  {
    id v4 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v4) {
      goto LABEL_8;
    }
  }
  else
  {
    id v4 = MEMORY[0x1E4F14500];
    id v5 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(v6 + 80);
    int v9 = 136315906;
    unint64_t v10 = "SSCoreHapticsPlayer.mm";
    __int16 v11 = 1024;
    int v12 = 397;
    __int16 v13 = 1024;
    int v14 = v7;
    __int16 v15 = 2048;
    uint64_t v16 = v6;
    _os_log_impl(&dword_1A3931000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d System sound finished playing, SSID %d, SSCoreHapticsPlayer %p", (uint8_t *)&v9, 0x22u);
  }

LABEL_8:
  id v8 = (SSClientCompletion *)CADeprecated::TSingleton<SSClientCompletion>::instance();
  SSClientCompletion::SendClientCompletion(v8, *(_DWORD *)(*(void *)(a1 + 32) + 64), *(_DWORD *)(*(void *)(a1 + 32) + 80));
}

- (BOOL)startPlayerAtTime:(double)a3 forAudio:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 16;
  if (a4) {
    uint64_t v9 = 8;
  }
  id v10 = *(id *)((char *)&self->super.isa + v9);
  [v10 startAtTime:a5 error:a3];
  id v11 = *a5;
  if (*a5)
  {
    if (kSystemSoundClientLogSubsystem)
    {
      int v12 = *(id *)kSystemSoundClientLogSubsystem;
      if (!v12)
      {
LABEL_13:
        [(SSCoreHapticsPlayer *)self registerCompletionPortion:v6];
        goto LABEL_14;
      }
    }
    else
    {
      int v12 = MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      unint64_t ssid = self->_ssid;
      __int16 v15 = @"haptics";
      id v16 = *a5;
      if (v6) {
        __int16 v15 = @"audio";
      }
      int v18 = 136316418;
      __int16 v19 = "SSCoreHapticsPlayer.mm";
      __int16 v20 = 1024;
      int v21 = 386;
      __int16 v22 = 2112;
      uint64_t v23 = v15;
      __int16 v24 = 1024;
      int v25 = ssid;
      __int16 v26 = 2048;
      uint64_t v27 = self;
      __int16 v28 = 2112;
      id v29 = v16;
      _os_log_impl(&dword_1A3931000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot start %@ portion for SSID %d, SSCoreHapticsPlayer %p, error %@", (uint8_t *)&v18, 0x36u);
    }

    goto LABEL_13;
  }
LABEL_14:

  return v11 == 0;
}

- (void)setupLooping
{
  if (self->_shouldPlayAudioFinal)
  {
    if (self->_shouldPlayHapticsFinal)
    {
      if (self->_audioPatternDuration < self->_hapticPatternDuration) {
        double hapticPatternDuration = self->_hapticPatternDuration;
      }
      else {
        double hapticPatternDuration = self->_audioPatternDuration;
      }
      [(CHHapticAdvancedPatternPlayerExtended *)self->_audioPlayer setLoopEnd:hapticPatternDuration];
      hapticPlayer = self->_hapticPlayer;
      double audioPatternDuration = hapticPatternDuration;
    }
    else
    {
      [(CHHapticAdvancedPatternPlayerExtended *)self->_audioPlayer setLoopEnabled:1];
      hapticPlayer = self->_audioPlayer;
      double audioPatternDuration = self->_audioPatternDuration;
    }
  }
  else
  {
    if (!self->_shouldPlayHapticsFinal) {
      return;
    }
    [(CHHapticAdvancedPatternPlayerExtended *)self->_hapticPlayer setLoopEnabled:1];
    hapticPlayer = self->_hapticPlayer;
    double audioPatternDuration = self->_hapticPatternDuration;
  }

  [(CHHapticAdvancedPatternPlayerExtended *)hapticPlayer setLoopEnd:audioPatternDuration];
}

- (BOOL)prepareHapticPatternFromPlayOptions:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 objectForKey:@"PlaySystemSoundOption_VibrationPattern"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(SSCoreHapticsPlayer *)self getHapticDictionaryFromURL:v4];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_10;
    }
    id v5 = v4;
  }
  BOOL v6 = v5;
  if (v5)
  {
    if ([v5 isEqualToDictionary:self->_hapticPatternDict])
    {
      if (kSystemSoundClientLogSubsystem)
      {
        uint64_t v7 = *(id *)kSystemSoundClientLogSubsystem;
        if (!v7) {
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v7 = MEMORY[0x1E4F14500];
        id v10 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        int v14 = "SSCoreHapticsPlayer.mm";
        __int16 v15 = 1024;
        int v16 = 343;
        __int16 v17 = 2048;
        int v18 = self;
        _os_log_impl(&dword_1A3931000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d playOptions contain haptic pattern identical to the one stored in SSCoreHapticsPlayer %p. NOT recreating haptic player", buf, 0x1Cu);
      }

      goto LABEL_16;
    }
    hapticPlayer = self->_hapticPlayer;
    self->_hapticPlayer = 0;

    uint64_t v12 = 0;
    [(SSCoreHapticsPlayer *)self createHapticPlayer:v6 error:&v12];
LABEL_16:

    BOOL v8 = 1;
    goto LABEL_17;
  }
LABEL_10:
  BOOL v8 = 0;
LABEL_17:

  return v8;
}

- (id)getHapticDictionaryFromURL:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 isFileURL]) {
    goto LABEL_8;
  }
  id v4 = [v3 path];
  id v5 = [v4 pathExtension];
  if ([v5 isEqualToString:@"json"])
  {

    goto LABEL_5;
  }
  BOOL v6 = [v3 path];
  uint64_t v7 = [v6 pathExtension];
  int v8 = [v7 isEqualToString:@"ahap"];

  if (!v8)
  {
LABEL_8:
    if (kSystemSoundClientLogSubsystem)
    {
      id v11 = *(id *)kSystemSoundClientLogSubsystem;
      if (!v11)
      {
        id v13 = 0;
        id v14 = 0;
        goto LABEL_28;
      }
    }
    else
    {
      id v11 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v22 = "SSCoreHapticsPlayer.mm";
      __int16 v23 = 1024;
      int v24 = 314;
      _os_log_impl(&dword_1A3931000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Incoming ahapURL not a valid file path URL or file type not supported. Not creating haptic portion", buf, 0x12u);
    }
    id v13 = 0;
    id v14 = 0;
    goto LABEL_27;
  }
LABEL_5:
  uint64_t v9 = (void *)MEMORY[0x1E4F1C9B8];
  id v10 = [v3 path];
  id v11 = [v9 dataWithContentsOfFile:v10];

  if (kSystemSoundClientLogSubsystem)
  {
    uint64_t v12 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v12) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v12 = MEMORY[0x1E4F14500];
    id v16 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v22 = "SSCoreHapticsPlayer.mm";
    __int16 v23 = 1024;
    int v24 = 307;
    _os_log_impl(&dword_1A3931000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d Creating haptic dictionary from JSON or AHAP...", buf, 0x12u);
  }

LABEL_19:
  id v20 = 0;
  id v13 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v11 options:0 error:&v20];
  id v14 = v20;
  if (v14)
  {
    if (kSystemSoundClientLogSubsystem)
    {
      __int16 v17 = *(id *)kSystemSoundClientLogSubsystem;
      if (!v17) {
        goto LABEL_27;
      }
    }
    else
    {
      __int16 v17 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v22 = "SSCoreHapticsPlayer.mm";
      __int16 v23 = 1024;
      int v24 = 310;
      __int16 v25 = 2112;
      id v26 = v14;
      _os_log_impl(&dword_1A3931000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot create haptic dictionary. error: %@", buf, 0x1Cu);
    }
  }
LABEL_27:

LABEL_28:

  return v13;
}

- (BOOL)doInit:(id)a3 haptic:(id)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (kSystemSoundClientLogSubsystem)
  {
    id v10 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v10) {
      goto LABEL_8;
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
    id v13 = [v8 absoluteString];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "SSCoreHapticsPlayer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 232;
    *(_WORD *)&buf[18] = 2112;
    *(void *)&buf[20] = v13;
    _os_log_impl(&dword_1A3931000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Creating new system sound. Audio: %@", buf, 0x1Cu);
  }
LABEL_8:
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&unsigned char buf[24] = __Block_byref_object_copy__3153;
  v47 = __Block_byref_object_dispose__3154;
  id v48 = 0;
  self->_audioResourceID = 0;
  *(_DWORD *)&self->_BOOL shouldPlayAudioFinal = 16842752;
  id v14 = [(SSCoreHapticsPlayer *)self setupDefaultEngineConfigBlock];
  id v15 = objc_alloc(MEMORY[0x1E4F1DF58]);
  id v16 = (id *)(*(void *)&buf[8] + 40);
  id obj = *(id *)(*(void *)&buf[8] + 40);
  __int16 v17 = (CHHapticEngine *)[v15 initWithAudioSession:0 sessionIsShared:0 options:v14 error:&obj];
  objc_storeStrong(v16, obj);
  engine = self->_engine;
  self->_engine = v17;

  uint64_t v19 = (id *)(*(void *)&buf[8] + 40);
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    if (kSystemSoundClientLogSubsystem)
    {
      id v20 = *(id *)kSystemSoundClientLogSubsystem;
      if (!v20) {
        goto LABEL_21;
      }
    }
    else
    {
      id v20 = MEMORY[0x1E4F14500];
      id v27 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v28 = *v19;
      *(_DWORD *)id location = 136315650;
      *(void *)&location[4] = "SSCoreHapticsPlayer.mm";
      __int16 v42 = 1024;
      int v43 = 248;
      __int16 v44 = 2112;
      id v45 = v28;
      _os_log_impl(&dword_1A3931000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot initialize CHHapticEngine. error: %@", location, 0x1Cu);
    }

LABEL_21:
    if (a5)
    {
      id v29 = *(id *)(*(void *)&buf[8] + 40);
LABEL_23:
      BOOL v26 = 0;
      *a5 = v29;
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  if (!self->_engine)
  {
    if (a5)
    {
      id v29 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4898 userInfo:0];
      goto LABEL_23;
    }
LABEL_26:
    BOOL v26 = 0;
    goto LABEL_27;
  }
  id v39 = 0;
  unint64_t v21 = [(SSCoreHapticsPlayer *)self createAudioResource:v8 error:&v39];
  objc_storeStrong(v19, v39);
  self->_audioResourceID = v21;
  if (v21)
  {
    __int16 v22 = (id *)(*(void *)&buf[8] + 40);
    id v38 = *(id *)(*(void *)&buf[8] + 40);
    BOOL v23 = [(SSCoreHapticsPlayer *)self createAudioPlayerAndReturnError:&v38];
    objc_storeStrong(v22, v38);
    if (v23) {
      [(CHHapticEngine *)self->_engine setFollowAudioRoute:1];
    }
  }
  int v24 = (id *)(*(void *)&buf[8] + 40);
  id v37 = *(id *)(*(void *)&buf[8] + 40);
  [(SSCoreHapticsPlayer *)self createHapticPlayer:v9 error:&v37];
  objc_storeStrong(v24, v37);
  objc_initWeak((id *)location, self);
  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  double v33 = __43__SSCoreHapticsPlayer_doInit_haptic_error___block_invoke;
  id v34 = &unk_1E5B14610;
  objc_copyWeak(&v36, (id *)location);
  id v35 = buf;
  [(CHHapticEngine *)self->_engine setResetHandler:&v31];
  objc_destroyWeak(&v36);
  objc_destroyWeak((id *)location);
  __int16 v25 = +[SSCoreHapticsInfo instance];
  self->_unint64_t ssid = [v25 generateNewSSIDForPlayer:self];

  BOOL v26 = self->_ssid != 0;
LABEL_27:

  _Block_object_dispose(buf, 8);
  return v26;
}

void __43__SSCoreHapticsPlayer_doInit_haptic_error___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (kSystemSoundClientLogSubsystem)
  {
    id v3 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v20 = "SSCoreHapticsPlayer.mm";
    __int16 v21 = 1024;
    int v22 = 271;
    __int16 v23 = 2048;
    int v24 = WeakRetained;
    _os_log_impl(&dword_1A3931000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d SSCoreHapticsPlayer %p: Lost connection with server. re-creating players", buf, 0x1Cu);
  }

LABEL_8:
  id v5 = (void *)WeakRetained[1];
  WeakRetained[1] = 0;

  BOOL v6 = (void *)WeakRetained[9];
  uint64_t v7 = WeakRetained[4];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v8 + 40);
  [v6 unregisterAudioResource:v7 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  uint64_t v9 = WeakRetained[3];
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  id v17 = *(id *)(v10 + 40);
  uint64_t v11 = [WeakRetained createAudioResource:v9 error:&v17];
  objc_storeStrong((id *)(v10 + 40), v17);
  WeakRetained[4] = v11;
  if (v11)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    id v16 = *(id *)(v12 + 40);
    [WeakRetained createAudioPlayerAndReturnError:&v16];
    objc_storeStrong((id *)(v12 + 40), v16);
  }
  uint64_t v13 = WeakRetained[5];
  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
  id v15 = *(id *)(v14 + 40);
  [WeakRetained createHapticPlayer:v13 error:&v15];
  objc_storeStrong((id *)(v14 + 40), v15);
}

- (id)setupDefaultEngineConfigBlock
{
  v9[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F1DF38];
  uint64_t v3 = *MEMORY[0x1E4F1DEB8];
  v8[0] = *MEMORY[0x1E4F1DEB0];
  v8[1] = v3;
  v9[0] = v2;
  v9[1] = v2;
  uint64_t v4 = *MEMORY[0x1E4F1DEC8];
  v8[2] = *MEMORY[0x1E4F1DED0];
  v8[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1DF10];
  v9[2] = *MEMORY[0x1E4F1DF40];
  v9[3] = v5;
  v8[4] = @"UsageCategory";
  v9[4] = @"SystemSound";
  BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];

  return v6;
}

- (void)createHapticPlayer:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    if (kSystemSoundClientLogSubsystem)
    {
      hapticPatternDict = (NSDictionary *)*(id *)kSystemSoundClientLogSubsystem;
      if (!hapticPatternDict) {
        goto LABEL_30;
      }
    }
    else
    {
      hapticPatternDict = (NSDictionary *)MEMORY[0x1E4F14500];
      id v17 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(&hapticPatternDict->super, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 136315394;
      uint64_t v25 = "SSCoreHapticsPlayer.mm";
      __int16 v26 = 1024;
      int v27 = 185;
      _os_log_impl(&dword_1A3931000, &hapticPatternDict->super, OS_LOG_TYPE_DEFAULT, "%25s:%-5d No haptic dictionary passed in", (uint8_t *)&v24, 0x12u);
    }
    goto LABEL_29;
  }
  uint64_t v8 = [v6 objectForKey:*MEMORY[0x1E4F1DF30]];

  if (!v8)
  {
    uint64_t v13 = [(CHHapticEngine *)self->_engine createAdvancedPlayerWithVibePatternDictionary:v7 error:a4];
    hapticPlayer = self->_hapticPlayer;
    self->_hapticPlayer = v13;

    goto LABEL_27;
  }
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1DF98]) initWithDictionary:v7 error:a4];
  uint64_t v10 = v9;
  if (!*a4)
  {
    [v9 duration];
    self->_float hapticPatternDuration = v15;
    if (kSystemSoundClientLogSubsystem)
    {
      id v16 = *(id *)kSystemSoundClientLogSubsystem;
      if (!v16)
      {
LABEL_24:
        int v22 = [(CHHapticEngine *)self->_engine createAdvancedPlayerWithPattern:v10 error:a4];
        uint64_t v11 = self->_hapticPlayer;
        self->_hapticPlayer = v22;
        goto LABEL_25;
      }
    }
    else
    {
      id v16 = MEMORY[0x1E4F14500];
      id v20 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      float hapticPatternDuration = self->_hapticPatternDuration;
      int v24 = 136315650;
      uint64_t v25 = "SSCoreHapticsPlayer.mm";
      __int16 v26 = 1024;
      int v27 = 196;
      __int16 v28 = 2048;
      double v29 = hapticPatternDuration;
      _os_log_impl(&dword_1A3931000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d haptic duration: %.2fs", (uint8_t *)&v24, 0x1Cu);
    }

    goto LABEL_24;
  }
  if (kSystemSoundClientLogSubsystem)
  {
    uint64_t v11 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v11) {
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v11 = MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = *a4;
    int v24 = 136315650;
    uint64_t v25 = "SSCoreHapticsPlayer.mm";
    __int16 v26 = 1024;
    int v27 = 192;
    __int16 v28 = 2112;
    double v29 = *(double *)&v19;
    _os_log_impl(&dword_1A3931000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Invalid haptic pattern. Not creating haptic player and continue. error: %@", (uint8_t *)&v24, 0x1Cu);
  }
LABEL_25:

LABEL_26:
LABEL_27:
  if (!*a4)
  {
    __int16 v23 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v7 copyItems:1];
    hapticPatternDict = self->_hapticPatternDict;
    self->_hapticPatternDict = v23;
LABEL_29:
  }
LABEL_30:
}

- (BOOL)createAudioPlayerAndReturnError:(id *)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  audioPlayer = self->_audioPlayer;
  self->_audioPlayer = 0;

  [(CHHapticEngine *)self->_engine getDurationForResource:self->_audioResourceID];
  double v7 = v6;
  id v8 = objc_alloc(MEMORY[0x1E4F1DF98]);
  id v9 = objc_alloc(MEMORY[0x1E4F1DF68]);
  uint64_t v10 = (void *)[v9 initWithAudioResourceID:self->_audioResourceID parameters:MEMORY[0x1E4F1CBF0] relativeTime:0.0 duration:v7];
  v33[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  uint64_t v12 = (void *)[v8 initWithEvents:v11 parameters:MEMORY[0x1E4F1CBF0] error:a3];

  if (*a3)
  {
    if (kSystemSoundClientLogSubsystem)
    {
      uint64_t v13 = *(id *)kSystemSoundClientLogSubsystem;
      if (!v13) {
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v13 = MEMORY[0x1E4F14500];
      id v16 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
LABEL_24:

LABEL_25:
      BOOL v23 = 0;
      goto LABEL_26;
    }
    id v17 = *a3;
    int v27 = 136315650;
    __int16 v28 = "SSCoreHapticsPlayer.mm";
    __int16 v29 = 1024;
    int v30 = 166;
    __int16 v31 = 2112;
    double v32 = *(double *)&v17;
    id v18 = "%25s:%-5d Invalid audio pattern. Not creating audio player and continue. error: %@";
LABEL_23:
    _os_log_impl(&dword_1A3931000, v13, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v27, 0x1Cu);
    goto LABEL_24;
  }
  [v12 duration];
  self->_float audioPatternDuration = v14;
  if (kSystemSoundClientLogSubsystem)
  {
    double v15 = *(id *)kSystemSoundClientLogSubsystem;
    if (!v15) {
      goto LABEL_15;
    }
  }
  else
  {
    double v15 = MEMORY[0x1E4F14500];
    id v19 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    float audioPatternDuration = self->_audioPatternDuration;
    int v27 = 136315650;
    __int16 v28 = "SSCoreHapticsPlayer.mm";
    __int16 v29 = 1024;
    int v30 = 172;
    __int16 v31 = 2048;
    double v32 = audioPatternDuration;
    _os_log_impl(&dword_1A3931000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d audio duration: %.2fs", (uint8_t *)&v27, 0x1Cu);
  }

LABEL_15:
  __int16 v21 = [(CHHapticEngine *)self->_engine createAdvancedPlayerWithPattern:v12 error:a3];
  int v22 = self->_audioPlayer;
  self->_audioPlayer = v21;

  if (*a3)
  {
    if (kSystemSoundClientLogSubsystem)
    {
      uint64_t v13 = *(id *)kSystemSoundClientLogSubsystem;
      if (!v13) {
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v13 = MEMORY[0x1E4F14500];
      id v24 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    id v25 = *a3;
    int v27 = 136315650;
    __int16 v28 = "SSCoreHapticsPlayer.mm";
    __int16 v29 = 1024;
    int v30 = 175;
    __int16 v31 = 2112;
    double v32 = *(double *)&v25;
    id v18 = "%25s:%-5d Failed to create audio player and continue. error: %@";
    goto LABEL_23;
  }
  BOOL v23 = 1;
LABEL_26:

  return v23;
}

- (unint64_t)createAudioResource:(id)a3 error:(id *)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    engine = self->_engine;
    uint64_t v26 = *MEMORY[0x1E4F1DE98];
    v27[0] = MEMORY[0x1E4F1CC28];
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    unint64_t v9 = [(CHHapticEngine *)engine registerAudioResource:v6 options:v8 error:a4];

    if (!*a4)
    {
      uint64_t v11 = (NSURL *)[v6 copy];
      audioURL = self->_audioURL;
      self->_audioURL = v11;
LABEL_18:

      goto LABEL_19;
    }
    if (kSystemSoundClientLogSubsystem)
    {
      audioURL = (NSURL *)*(id *)kSystemSoundClientLogSubsystem;
      if (!audioURL) {
        goto LABEL_8;
      }
    }
    else
    {
      audioURL = (NSURL *)MEMORY[0x1E4F14500];
      id v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(&audioURL->super, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = *a4;
      int v20 = 136315650;
      __int16 v21 = "SSCoreHapticsPlayer.mm";
      __int16 v22 = 1024;
      int v23 = 148;
      __int16 v24 = 2112;
      id v25 = v13;
      double v14 = "%25s:%-5d Invalid audio resource. Not creating audio player and continue. error: %@";
      p_super = &audioURL->super;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      uint32_t v17 = 28;
LABEL_16:
      _os_log_impl(&dword_1A3931000, p_super, v16, v14, (uint8_t *)&v20, v17);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (!kSystemSoundClientLogSubsystem)
  {
    audioURL = (NSURL *)MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
LABEL_14:
    if (os_log_type_enabled(&audioURL->super, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 136315394;
      __int16 v21 = "SSCoreHapticsPlayer.mm";
      __int16 v22 = 1024;
      int v23 = 141;
      double v14 = "%25s:%-5d audioURL not valid";
      p_super = &audioURL->super;
      os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
      uint32_t v17 = 18;
      goto LABEL_16;
    }
LABEL_17:
    unint64_t v9 = 0;
    goto LABEL_18;
  }
  audioURL = (NSURL *)*(id *)kSystemSoundClientLogSubsystem;
  if (audioURL) {
    goto LABEL_14;
  }
LABEL_8:
  unint64_t v9 = 0;
LABEL_19:

  return v9;
}

@end