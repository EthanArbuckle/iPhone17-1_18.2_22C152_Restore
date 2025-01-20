@interface AVVCSessionManager
- (AVAudioSession)audioSession;
- (AVVCSessionManager)initWithSession:(id)a3;
- (BOOL)activateAudioSessionWithPrewarm:(BOOL)a3 error:(id *)a4;
- (BOOL)clearInputPreferences:(id *)a3;
- (BOOL)clientRequestsRecording;
- (BOOL)deactivateAudioSessionWithOptions:(unsigned int)a3 error:(id *)a4;
- (BOOL)forceGetSessionProperties;
- (BOOL)getClientRequestsRecording;
- (BOOL)getForceGetSessionProperties;
- (BOOL)getSiriInputSource:(unint64_t *)a3 withIdentifier:(id *)a4 withIsMicrophoneCheck:(BOOL *)a5 forActivationMode:(int64_t)a6;
- (BOOL)isAirplayOneOfTheOutputRoutes:(id)a3;
- (BOOL)isBTDeviceInEar;
- (BOOL)isCurrentInputBuiltInMic;
- (BOOL)isInputAvailable;
- (BOOL)isMiniDuckingEnabled;
- (BOOL)isPickedRouteW1;
- (BOOL)isPrimary;
- (BOOL)isSWVolumeSupportedOnPickedRoute;
- (BOOL)isSessionActive;
- (BOOL)isSessionInSiriCategory;
- (BOOL)isSessionInSiriCategoryModeAndOptions:(unsigned int)a3;
- (BOOL)isSessionOutputInWirelessSplitterMode;
- (BOOL)predictIfMicrophoneShouldBeUsedForActivationMode:(int64_t)a3;
- (BOOL)setActivationContext:(id)a3 error:(id *)a4;
- (BOOL)setActive:(BOOL)a3 withOptions:(unint64_t)a4 error:(id *)a5;
- (BOOL)setAudioHardwareControlFlags:(unint64_t)a3 error:(id *)a4;
- (BOOL)setCategory:(id)a3 mode:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (BOOL)setCategory:(id)a3 mode:(id)a4 routeSharingPolicy:(unint64_t)a5 options:(unint64_t)a6 error:(id *)a7;
- (BOOL)setDuckOthers:(id)a3 mixWithOthers:(id)a4 error:(id *)a5;
- (BOOL)setDuckToLevelDB:(id)a3 error:(id *)a4;
- (BOOL)setDuckToLevelScalar:(id)a3 error:(id *)a4;
- (BOOL)setDuckingFadeOutDuration:(id)a3 fadeInDuration:(id)a4 error:(id *)a5;
- (BOOL)setEnableBTTriangleMode:(BOOL)a3 error:(id *)a4;
- (BOOL)setIAmTheAssistant:(BOOL)a3 error:(id *)a4;
- (BOOL)setIsUsingBuiltInMicForRecording:(BOOL)a3 error:(id *)a4;
- (BOOL)setMicrophoneAttribution:(BOOL)a3 error:(id *)a4;
- (BOOL)setPreferredSampleRate:(double)a3 error:(id *)a4;
- (BOOL)setPrefersBeingInterruptedByNextActiveRecordingClient:(BOOL)a3 error:(id *)a4;
- (BOOL)setRecordingFromRemoteInput:(BOOL)a3 error:(id *)a4;
- (NSString)playbackRoute;
- (double)inputLatency;
- (double)inputSafetyOffset;
- (double)outputLatency;
- (double)outputSafetyOffset;
- (double)outputVolume;
- (double)speechDetectionDeviceSampleRate;
- (float)deviceGain;
- (float)getDeviceGain;
- (id).cxx_construct;
- (id)currentRoute;
- (id)getActiveSessionDisplayIDsAsString;
- (id)getPlaybackRoute;
- (id)pickedRoute;
- (id)sessionCurrentInputRoutes;
- (id)sessionCurrentOutputRoutes;
- (id)siriRemoteInputIdentifier;
- (int)enableSmartRoutingConsideration:(BOOL)a3;
- (int)sessionState;
- (int)setSessionActivationContext:(id)a3;
- (int)setSessionAudioHWControlFlagsForActivationMode:(int64_t)a3 withOptions:(unint64_t)a4;
- (int)setSessionBufferSize:(int)a3;
- (int)setSessionCategoryModeOptionsForActivationMode:(int64_t)a3 withOptions:(unint64_t)a4;
- (int)setSessionSampleRateForActivationMode:(int64_t)a3;
- (int)setupOneTimeSessionSettingsForClient:(int64_t)a3;
- (int64_t)inputNumberOfChannels;
- (int64_t)reporterID;
- (unint64_t)siriInputSource;
- (unsigned)getOpaqueSessionID;
- (unsigned)getSessionActivationOptions;
- (void)changeDuckOthersOption:(BOOL)a3;
- (void)dealloc;
- (void)getHypotheticalRouteAndUpdateStates;
- (void)removeSessionNotifications:(id)a3;
- (void)setAudioSession:(id)a3;
- (void)setClientRequestsRecording:(BOOL)a3;
- (void)setDeviceGain:(float)a3;
- (void)setForceGetSessionProperties:(BOOL)a3;
- (void)setPlaybackRoute:(id)a3;
- (void)setSessionActivationOptions:(unsigned int)a3;
- (void)setSessionState:(int)a3;
- (void)setSessionStateWithoutLock:(int)a3;
- (void)setupSessionNotifications:(id)a3;
- (void)shouldEnableMiniDucking:(BOOL)a3 withOptions:(unint64_t)a4;
@end

@implementation AVVCSessionManager

- (id).cxx_construct
{
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackRoute, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->mPreviousSessionMode, 0);
  objc_storeStrong((id *)&self->mPreviousSessionCategory, 0);
  objc_storeStrong((id *)&self->mPreviousActivationDeviceUID, 0);

  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)&self->mSessionManagerLock);
}

- (BOOL)forceGetSessionProperties
{
  return self->_forceGetSessionProperties;
}

- (NSString)playbackRoute
{
  return self->_playbackRoute;
}

- (float)deviceGain
{
  return self->_deviceGain;
}

- (BOOL)clientRequestsRecording
{
  return self->_clientRequestsRecording;
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (void)setAudioSession:(id)a3
{
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (BOOL)isCurrentInputBuiltInMic
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      v8 = *(id *)kAVVCScope;
      if (!v8) {
        return 0;
      }
    }
    else
    {
      v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v11 = 136315906;
      *(void *)&v11[4] = "AVVCSessionManager.mm";
      __int16 v12 = 1024;
      int v13 = 2134;
      __int16 v14 = 2080;
      v15 = "isCurrentInputBuiltInMic";
      __int16 v16 = 1024;
      int v17 = 0;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", v11, 0x22u);
    }

    return 0;
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v4 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  v5 = [(AVAudioSession *)self->_audioSession currentRoute];
  extractFirstInputPortTypeFromRouteDescription(v5, (void **)v11);
  v6 = *(void **)v11;
  char v7 = areNSStringsEqual(*(NSString **)v11, (NSString *)*MEMORY[0x1E4F4E950]);

  if (v4) {
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  return v7;
}

- (BOOL)setIsUsingBuiltInMicForRecording:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      int v13 = *(id *)kAVVCScope;
      if (!v13)
      {
LABEL_20:
        LOBYTE(v11) = 0;
        return v11;
      }
    }
    else
    {
      int v13 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "AVVCSessionManager.mm";
      __int16 v28 = 1024;
      int v29 = 2116;
      __int16 v30 = 2080;
      *(void *)v31 = "setIsUsingBuiltInMicForRecording";
      *(_WORD *)&v31[8] = 1024;
      int v32 = 0;
      _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

    goto LABEL_20;
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v8 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  ElapsedTime::ElapsedTime((ElapsedTime *)buf, "-[AVVCSessionManager setIsUsingBuiltInMicForRecording:error:]", "setIsUsingBuiltInMicForRecording", 0);
  audioSession = self->_audioSession;
  v10 = [NSNumber numberWithBool:v5];
  int v11 = [(AVAudioSession *)audioSession setMXSessionProperty:*MEMORY[0x1E4F76318] value:v10 error:a4];

  if ((v11 & 1) == 0 && *a4)
  {
    if (kAVVCScope)
    {
      __int16 v12 = *(id *)kAVVCScope;
      if (!v12) {
        goto LABEL_25;
      }
    }
    else
    {
      __int16 v12 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v16 = *a4;
      int v20 = 136315650;
      v21 = "AVVCSessionManager.mm";
      __int16 v22 = 1024;
      int v23 = 2123;
      __int16 v24 = 2112;
      id v25 = v16;
      _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: setIsUsingBuiltInMicForRecording failed with error: %@", (uint8_t *)&v20, 0x1Cu);
    }
  }
LABEL_25:
  ElapsedTime::~ElapsedTime((ElapsedTime *)buf);
  if (!kAVVCScope)
  {
    int v17 = MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
    goto LABEL_29;
  }
  int v17 = *(id *)kAVVCScope;
  if (v17)
  {
LABEL_29:
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "AVVCSessionManager.mm";
      __int16 v28 = 1024;
      int v29 = 2127;
      __int16 v30 = 1024;
      *(_DWORD *)v31 = v5;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = v11;
      _os_log_impl(&dword_19D794000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setIsUsingBuiltInMicForRecording : %d (bSet = %d)", buf, 0x1Eu);
    }
  }
  if (v8) {
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  return v11;
}

- (BOOL)setPrefersBeingInterruptedByNextActiveRecordingClient:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      int v13 = *(id *)kAVVCScope;
      if (!v13)
      {
LABEL_20:
        LOBYTE(v11) = 0;
        return v11;
      }
    }
    else
    {
      int v13 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "AVVCSessionManager.mm";
      __int16 v28 = 1024;
      int v29 = 2094;
      __int16 v30 = 2080;
      *(void *)v31 = "setPrefersBeingInterruptedByNextActiveRecordingClient";
      *(_WORD *)&v31[8] = 1024;
      int v32 = 0;
      _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

    goto LABEL_20;
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v8 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  ElapsedTime::ElapsedTime((ElapsedTime *)buf, "-[AVVCSessionManager setPrefersBeingInterruptedByNextActiveRecordingClient:error:]", "setPrefersBeingInterruptedByNextActiveRecordingClient", 0);
  audioSession = self->_audioSession;
  v10 = [NSNumber numberWithBool:v5];
  int v11 = [(AVAudioSession *)audioSession setMXSessionProperty:*MEMORY[0x1E4F764D0] value:v10 error:a4];

  if ((v11 & 1) == 0 && *a4)
  {
    if (kAVVCScope)
    {
      __int16 v12 = *(id *)kAVVCScope;
      if (!v12) {
        goto LABEL_25;
      }
    }
    else
    {
      __int16 v12 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v16 = *a4;
      int v20 = 136315650;
      v21 = "AVVCSessionManager.mm";
      __int16 v22 = 1024;
      int v23 = 2102;
      __int16 v24 = 2112;
      id v25 = v16;
      _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: setPrefersBeingInterruptedByNextActiveRecordingClient failed with error: %@", (uint8_t *)&v20, 0x1Cu);
    }
  }
LABEL_25:
  ElapsedTime::~ElapsedTime((ElapsedTime *)buf);
  if (!kAVVCScope)
  {
    int v17 = MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
    goto LABEL_29;
  }
  int v17 = *(id *)kAVVCScope;
  if (v17)
  {
LABEL_29:
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "AVVCSessionManager.mm";
      __int16 v28 = 1024;
      int v29 = 2107;
      __int16 v30 = 1024;
      *(_DWORD *)v31 = v5;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = v11;
      _os_log_impl(&dword_19D794000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setPrefersBeingInterruptedByNextActiveRecordingClient : %d (bSet = %d)", buf, 0x1Eu);
    }
  }
  if (v8) {
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  return v11;
}

- (BOOL)setMicrophoneAttribution:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      int v13 = *(id *)kAVVCScope;
      if (!v13)
      {
LABEL_20:
        LOBYTE(v11) = 0;
        return v11;
      }
    }
    else
    {
      int v13 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "AVVCSessionManager.mm";
      __int16 v28 = 1024;
      int v29 = 2077;
      __int16 v30 = 2080;
      *(void *)v31 = "setMicrophoneAttribution";
      *(_WORD *)&v31[8] = 1024;
      int v32 = 0;
      _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

    goto LABEL_20;
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v8 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  ElapsedTime::ElapsedTime((ElapsedTime *)buf, "-[AVVCSessionManager setMicrophoneAttribution:error:]", "setMicrophoneAttribution", 0);
  audioSession = self->_audioSession;
  v10 = [NSNumber numberWithBool:v5];
  int v11 = [(AVAudioSession *)audioSession setMXSessionProperty:@"MicrophoneAttribution" value:v10 error:a4];

  if ((v11 & 1) == 0 && *a4)
  {
    if (kAVVCScope)
    {
      __int16 v12 = *(id *)kAVVCScope;
      if (!v12) {
        goto LABEL_25;
      }
    }
    else
    {
      __int16 v12 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v16 = *a4;
      int v20 = 136315650;
      v21 = "AVVCSessionManager.mm";
      __int16 v22 = 1024;
      int v23 = 2084;
      __int16 v24 = 2112;
      id v25 = v16;
      _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: setMicrophoneAttribution failed with error: %@", (uint8_t *)&v20, 0x1Cu);
    }
  }
LABEL_25:
  ElapsedTime::~ElapsedTime((ElapsedTime *)buf);
  if (!kAVVCScope)
  {
    int v17 = MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
    goto LABEL_29;
  }
  int v17 = *(id *)kAVVCScope;
  if (v17)
  {
LABEL_29:
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v27 = "AVVCSessionManager.mm";
      __int16 v28 = 1024;
      int v29 = 2088;
      __int16 v30 = 1024;
      *(_DWORD *)v31 = v5;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = v11;
      _os_log_impl(&dword_19D794000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setting microphone attribution : %d (bSet = %d)", buf, 0x1Eu);
    }
  }
  if (v8) {
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  return v11;
}

- (BOOL)isInputAvailable
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      char v7 = *(id *)kAVVCScope;
      if (!v7)
      {
LABEL_24:
        LOBYTE(v5) = 0;
        return v5;
      }
    }
    else
    {
      char v7 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315906;
      __int16 v12 = "AVVCSessionManager.mm";
      __int16 v13 = 1024;
      int v14 = 2062;
      __int16 v15 = 2080;
      id v16 = "isInputAvailable";
      __int16 v17 = 1024;
      int v18 = 0;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v11, 0x22u);
    }

    goto LABEL_24;
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v4 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  ElapsedTime::ElapsedTime((ElapsedTime *)&v11, "-[AVVCSessionManager isInputAvailable]", "isInputAvailable", 0);
  BOOL v5 = [(AVAudioSession *)self->_audioSession isInputAvailable];
  ElapsedTime::~ElapsedTime((ElapsedTime *)&v11);
  if (!kAVVCScope)
  {
    v6 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
    goto LABEL_15;
  }
  v6 = *(id *)kAVVCScope;
  if (v6)
  {
LABEL_15:
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      __int16 v12 = "AVVCSessionManager.mm";
      __int16 v13 = 1024;
      int v14 = 2070;
      __int16 v15 = 1024;
      LODWORD(v16) = v5;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d input available %d", (uint8_t *)&v11, 0x18u);
    }
  }
  if (v4) {
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  return v5;
}

- (BOOL)isSWVolumeSupportedOnPickedRoute
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      char v7 = *(id *)kAVVCScope;
      if (!v7)
      {
LABEL_23:
        LOBYTE(v8) = 0;
        return (char)v8;
      }
    }
    else
    {
      char v7 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315906;
      __int16 v15 = "AVVCSessionManager.mm";
      __int16 v16 = 1024;
      int v17 = 2040;
      __int16 v18 = 2080;
      uint64_t v19 = "isSWVolumeSupportedOnPickedRoute";
      __int16 v20 = 1024;
      int v21 = 0;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v14, 0x22u);
    }

    goto LABEL_23;
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v4 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  BOOL v5 = [(AVAudioSession *)self->_audioSession pickedRoute];
  if (v5)
  {
    if (_os_feature_enabled_impl()) {
      [v5 objectForKey:@"SoftwareVolumeEnabled"];
    }
    else {
    v6 = [v5 objectForKey:@"BTDetails_SupportsSoftwareVolume"];
    }
    LODWORD(v8) = [v6 BOOLValue];
  }
  else
  {
    if (kAVVCScope)
    {
      id v8 = *(id *)kAVVCScope;
      if (!v8) {
        goto LABEL_28;
      }
    }
    else
    {
      id v8 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      __int16 v15 = "AVVCSessionManager.mm";
      __int16 v16 = 1024;
      int v17 = 2051;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d isSWVolumeSupportedOnPickedRoute: Picked Route is nil", (uint8_t *)&v14, 0x12u);
    }

    LODWORD(v8) = 0;
  }
LABEL_28:
  if (!kAVVCScope)
  {
    int v11 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
    goto LABEL_32;
  }
  int v11 = *(id *)kAVVCScope;
  if (v11)
  {
LABEL_32:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315650;
      __int16 v15 = "AVVCSessionManager.mm";
      __int16 v16 = 1024;
      int v17 = 2054;
      __int16 v18 = 1024;
      LODWORD(v19) = v8;
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d isSWVolumeSupportedOnPickedRoute: %d", (uint8_t *)&v14, 0x18u);
    }
  }
  if (v4) {
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  return (char)v8;
}

- (BOOL)setDuckToLevelScalar:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      id v8 = *(id *)kAVVCScope;
      if (!v8)
      {
LABEL_12:
        char v7 = 1;
        goto LABEL_13;
      }
    }
    else
    {
      id v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315906;
      id v12 = "AVVCSessionManager.mm";
      __int16 v13 = 1024;
      int v14 = 2032;
      __int16 v15 = 2080;
      __int16 v16 = "setDuckToLevelScalar";
      __int16 v17 = 1024;
      int v18 = 1;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v11, 0x22u);
    }

    goto LABEL_12;
  }
  char v7 = [(AVAudioSession *)self->_audioSession setDuckToLevelScalar:v6 error:a4];
LABEL_13:

  return v7;
}

- (BOOL)setDuckToLevelDB:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      id v8 = *(id *)kAVVCScope;
      if (!v8)
      {
LABEL_12:
        char v7 = 1;
        goto LABEL_13;
      }
    }
    else
    {
      id v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 136315906;
      id v12 = "AVVCSessionManager.mm";
      __int16 v13 = 1024;
      int v14 = 2025;
      __int16 v15 = 2080;
      __int16 v16 = "setDuckToLevelDB";
      __int16 v17 = 1024;
      int v18 = 1;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v11, 0x22u);
    }

    goto LABEL_12;
  }
  char v7 = [(AVAudioSession *)self->_audioSession setDuckToLevelDB:v6 error:a4];
LABEL_13:

  return v7;
}

- (int64_t)inputNumberOfChannels
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      id v6 = *(id *)kAVVCScope;
      if (!v6) {
        return 1;
      }
    }
    else
    {
      id v6 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315906;
      id v10 = "AVVCSessionManager.mm";
      __int16 v11 = 1024;
      int v12 = 2017;
      __int16 v13 = 2080;
      int v14 = "inputNumberOfChannels";
      __int16 v15 = 1024;
      int v16 = 1;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v9, 0x22u);
    }

    return 1;
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v4 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  int64_t v5 = [(AVAudioSession *)self->_audioSession inputNumberOfChannels];
  if (v4) {
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  return v5;
}

- (BOOL)setRecordingFromRemoteInput:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      id v10 = *(id *)kAVVCScope;
      if (!v10) {
        return 1;
      }
    }
    else
    {
      id v10 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 136315906;
      int v21 = "AVVCSessionManager.mm";
      __int16 v22 = 1024;
      int v23 = 1999;
      __int16 v24 = 2080;
      *(void *)id v25 = "setRecordingFromRemoteInput";
      *(_WORD *)&v25[8] = 1024;
      *(_DWORD *)&v25[10] = 1;
      _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v20, 0x22u);
    }

    return 1;
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v8 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  if (kAVVCScope)
  {
    int v9 = *(id *)kAVVCScope;
    if (!v9) {
      goto LABEL_18;
    }
  }
  else
  {
    int v9 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315650;
    int v21 = "AVVCSessionManager.mm";
    __int16 v22 = 1024;
    int v23 = 2002;
    __int16 v24 = 1024;
    *(_DWORD *)id v25 = v5;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setRecordingFromRemoteInput: %d", (uint8_t *)&v20, 0x18u);
  }

LABEL_18:
  ElapsedTime::ElapsedTime((ElapsedTime *)&v20, "-[AVVCSessionManager setRecordingFromRemoteInput:error:]", "setRecordingFromRemoteInput", 0);
  char v12 = [(AVAudioSession *)self->_audioSession setRecordingFromRemoteInput:v5 error:a4];
  ElapsedTime::~ElapsedTime((ElapsedTime *)&v20);
  if ((v12 & 1) == 0 && *a4)
  {
    if (kAVVCScope)
    {
      id v13 = *(id *)kAVVCScope;
      if (!v13) {
        goto LABEL_32;
      }
    }
    else
    {
      id v13 = (id)MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    int v16 = v13;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = [*a4 code];
      int v18 = [*a4 description];
      int v20 = 136315906;
      int v21 = "AVVCSessionManager.mm";
      __int16 v22 = 1024;
      int v23 = 2009;
      __int16 v24 = 1024;
      *(_DWORD *)id v25 = v17;
      *(_WORD *)&v25[4] = 2112;
      *(void *)&v25[6] = v18;
      _os_log_impl(&dword_19D794000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d Error setting recording from remote input %d, %@", (uint8_t *)&v20, 0x22u);
    }
  }
LABEL_32:
  if (v8) {
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  return v12;
}

- (void)removeSessionNotifications:(id)a3
{
  id v7 = a3;
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1) {
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
    }
    int v4 = IsSerializationEnabled(void)::enable;
    if (IsSerializationEnabled(void)::enable) {
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
    if (v7 && self->_audioSession)
    {
      BOOL v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 removeObserver:v7 name:*MEMORY[0x1E4F4E838] object:self->_audioSession];

      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 removeObserver:v7 name:*MEMORY[0x1E4F4E9B0] object:self->_audioSession];
    }
    if (v4) {
      std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
  }
}

- (void)setupSessionNotifications:(id)a3
{
  id v7 = a3;
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1) {
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
    }
    int v4 = IsSerializationEnabled(void)::enable;
    if (IsSerializationEnabled(void)::enable) {
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
    if (v7 && self->_audioSession)
    {
      BOOL v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 addObserver:v7 selector:NSSelectorFromString(&cfstr_Handleinterrup_0.isa) name:*MEMORY[0x1E4F4E838] object:self->_audioSession];

      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 addObserver:v7 selector:NSSelectorFromString(&cfstr_Handleroutecha_0.isa) name:*MEMORY[0x1E4F4E9B0] object:self->_audioSession];
    }
    if (v4) {
      std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
  }
}

- (id)getActiveSessionDisplayIDsAsString
{
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1) {
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
    }
    int v3 = IsSerializationEnabled(void)::enable;
    p_mSessionManagerLock = &self->mSessionManagerLock;
    if (IsSerializationEnabled(void)::enable) {
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
    BOOL v5 = [(AVAudioSession *)self->_audioSession activeSessionDisplayIDs];
    id v6 = [v5 componentsJoinedByString:@", "];

    id v7 = v6;
    if (v3) {
      std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
    }
  }
  else
  {
    id v7 = &stru_1EEFA9548;
  }

  return v7;
}

- (unsigned)getOpaqueSessionID
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    p_mSessionManagerLock = &self->mSessionManagerLock;
    if (IsSerializationEnabled(void)::onceToken != -1) {
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
    }
    int v4 = IsSerializationEnabled(void)::enable;
    if (IsSerializationEnabled(void)::enable) {
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
    LODWORD(self) = [(AVAudioSession *)self->_audioSession opaqueSessionID];
    if (v4) {
      std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
    }
  }
  else
  {
    if (kAVVCScope)
    {
      self = (AVVCSessionManager *)*(id *)kAVVCScope;
      if (!self) {
        return self;
      }
    }
    else
    {
      self = (AVVCSessionManager *)MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315906;
      int v8 = "AVVCSessionManager.mm";
      __int16 v9 = 1024;
      int v10 = 1940;
      __int16 v11 = 2080;
      char v12 = "getOpaqueSessionID";
      __int16 v13 = 1024;
      int v14 = 0;
      _os_log_impl(&dword_19D794000, &self->super, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v7, 0x22u);
    }

    LODWORD(self) = 0;
  }
  return self;
}

- (BOOL)setActive:(BOOL)a3 withOptions:(unint64_t)a4 error:(id *)a5
{
  BOOL v7 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      __int16 v11 = *(id *)kAVVCScope;
      if (!v11) {
        return 1;
      }
    }
    else
    {
      __int16 v11 = MEMORY[0x1E4F14500];
      id v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 136315906;
      uint64_t v15 = "AVVCSessionManager.mm";
      __int16 v16 = 1024;
      int v17 = 1929;
      __int16 v18 = 2080;
      uint64_t v19 = "setActive";
      __int16 v20 = 1024;
      int v21 = 1;
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v14, 0x22u);
    }

    return 1;
  }
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v9 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  BOOL v10 = [(AVAudioSession *)self->_audioSession setActive:v7 withOptions:a4 error:a5];
  if (v9) {
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  return v10;
}

- (BOOL)setActivationContext:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1) {
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
    }
    int v7 = IsSerializationEnabled(void)::enable;
    if (IsSerializationEnabled(void)::enable) {
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
    LOBYTE(a4) = [(AVAudioSession *)self->_audioSession setActivationContext:v6 error:a4];
    if (v7) {
      std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
  }
  else
  {
    if (kAVVCScope)
    {
      a4 = (id *)*(id *)kAVVCScope;
      if (!a4) {
        goto LABEL_17;
      }
    }
    else
    {
      a4 = (id *)MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315906;
      __int16 v11 = "AVVCSessionManager.mm";
      __int16 v12 = 1024;
      int v13 = 1918;
      __int16 v14 = 2080;
      uint64_t v15 = "setActivationContext";
      __int16 v16 = 1024;
      int v17 = 0;
      _os_log_impl(&dword_19D794000, (os_log_t)a4, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v10, 0x22u);
    }

    LOBYTE(a4) = 0;
  }
LABEL_17:

  return (char)a4;
}

- (BOOL)getSiriInputSource:(unint64_t *)a3 withIdentifier:(id *)a4 withIsMicrophoneCheck:(BOOL *)a5 forActivationMode:(int64_t)a6
{
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    *a3 = 1936289391;
    return 1;
  }
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v11 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  __int16 v12 = [(AVAudioSession *)self->_audioSession currentRoute];
  int64_t v13 = [v12 siriInputSource];
  BOOL v14 = 0;
  uint64_t v15 = 0;
  *a3 = v13;
  if (v13 > 1936290659)
  {
    if (v13 == 1936290660)
    {
LABEL_23:
      BOOL v14 = [(AVVCSessionManager *)self predictIfMicrophoneShouldBeUsedForActivationMode:a6];
      uint64_t v15 = 0;
      if (!a4) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    if (v13 != 1936679529) {
      goto LABEL_16;
    }
LABEL_15:
    uint64_t v15 = [v12 siriRemoteInputIdentifier];
    BOOL v14 = 0;
    goto LABEL_16;
  }
  if (v13 == 1936024681) {
    goto LABEL_15;
  }
  if (v13 == 1936286822) {
    goto LABEL_23;
  }
LABEL_16:
  if (a4) {
LABEL_17:
  }
    *a4 = v15;
LABEL_18:
  if (a5) {
    *a5 = v14;
  }

  if (v11) {
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  return 1;
}

- (BOOL)predictIfMicrophoneShouldBeUsedForActivationMode:(int64_t)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    p_mSessionManagerLock = (std::recursive_mutex *)&self->mSessionManagerLock;
    if (IsSerializationEnabled(void)::onceToken != -1) {
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
    }
    int v46 = IsSerializationEnabled(void)::enable;
    if (IsSerializationEnabled(void)::enable) {
      std::recursive_mutex::lock(p_mSessionManagerLock);
    }
    if ((isHACProduct() & 1) == 0)
    {
      LOBYTE(v5) = 0;
      goto LABEL_99;
    }
    v48 = [(AVAudioSession *)self->_audioSession availableInputs];
    if (kAVVCScope)
    {
      int v4 = *(id *)kAVVCScope;
      if (!v4) {
        goto LABEL_24;
      }
    }
    else
    {
      int v4 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v66 = "AVVCSessionManager.mm";
      __int16 v67 = 1024;
      int v68 = 1766;
      __int16 v69 = 2112;
      v70 = v48;
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d availableInputs: %@", buf, 0x1Cu);
    }

LABEL_24:
    v64 = 0;
    v45 = [(AVAudioSession *)self->_audioSession currentRoute];
    extractFirstInputPortTypeFromRouteDescription(v45, &v64);
    if (![v48 count])
    {
      if (kAVVCScope)
      {
        id v5 = *(id *)kAVVCScope;
        if (!v5) {
          goto LABEL_91;
        }
      }
      else
      {
        id v5 = MEMORY[0x1E4F14500];
        id v21 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v66 = "AVVCSessionManager.mm";
        __int16 v67 = 1024;
        int v68 = 1773;
        _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d predictIfMicrophoneShouldBeUsedForActivationMode: No available inputs.", buf, 0x12u);
      }

LABEL_50:
      LODWORD(v5) = 0;
      goto LABEL_91;
    }
    if ([v48 count] == 1)
    {
      id v8 = [v48 objectAtIndexedSubscript:0];
      int v9 = [v8 portType];

      if (kAVVCScope)
      {
        int v10 = *(id *)kAVVCScope;
        if (!v10) {
          goto LABEL_55;
        }
      }
      else
      {
        int v10 = MEMORY[0x1E4F14500];
        id v22 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v66 = "AVVCSessionManager.mm";
        __int16 v67 = 1024;
        int v68 = 1777;
        __int16 v69 = 2112;
        v70 = v9;
        _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d predictIfMicrophoneShouldBeUsedForActivationMode: Only one input available: %@", buf, 0x1Cu);
      }

LABEL_55:
      LODWORD(v5) = v9 == (char *)*MEMORY[0x1E4F4E950];
      if (v9 != (char *)*MEMORY[0x1E4F4E950])
      {
        if (kAVVCScope)
        {
          int v23 = *(id *)kAVVCScope;
          if (!v23) {
            goto LABEL_88;
          }
        }
        else
        {
          int v23 = MEMORY[0x1E4F14500];
          id v41 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v66 = "AVVCSessionManager.mm";
          __int16 v67 = 1024;
          int v68 = 1781;
          _os_log_impl(&dword_19D794000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d predictIfMicrophoneShouldBeUsedForActivationMode: Only one input available: Not Builtin Mic.", buf, 0x12u);
        }
      }
LABEL_88:

      goto LABEL_91;
    }
    if (a3 != 1752132965)
    {
      if (a3 == 1684628340)
      {
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        int v11 = v48;
        char v12 = 0;
        uint64_t v13 = [v11 countByEnumeratingWithState:&v60 objects:v82 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v61;
          uint64_t v15 = *MEMORY[0x1E4F4E940];
          uint64_t v16 = *MEMORY[0x1E4F4E950];
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v61 != v14) {
                objc_enumerationMutation(v11);
              }
              id v18 = *(id *)(*((void *)&v60 + 1) + 8 * i);
              uint64_t v19 = [v18 portType];
              __int16 v20 = (void *)v19;
              if (v19 == v15)
              {
                char v12 = ![(AVVCSessionManager *)self isBTDeviceInEar];
              }
              else if (v19 != v16)
              {
                char v12 = 0;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v60 objects:v82 count:16];
          }
          while (v13);
        }

        LODWORD(v5) = v12 & 1;
LABEL_91:
        if (kAVVCScope)
        {
          v42 = *(id *)kAVVCScope;
          if (!v42)
          {
LABEL_98:

LABEL_99:
            if (v46) {
              std::recursive_mutex::unlock(p_mSessionManagerLock);
            }
            return (char)v5;
          }
        }
        else
        {
          v42 = MEMORY[0x1E4F14500];
          id v43 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v66 = "AVVCSessionManager.mm";
          __int16 v67 = 1024;
          int v68 = 1862;
          __int16 v69 = 1024;
          LODWORD(v70) = v5;
          _os_log_impl(&dword_19D794000, v42, OS_LOG_TYPE_DEFAULT, "%25s:%-5d predictIfMicrophoneShouldBeUsedForActivationMode: isMicrophoneBuiltin(%d)", buf, 0x18u);
        }

        goto LABEL_98;
      }
      goto LABEL_50;
    }
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    obj = v48;
    uint64_t v24 = [obj countByEnumeratingWithState:&v56 objects:v81 count:16];
    if (!v24)
    {
      char v54 = 0;
      goto LABEL_90;
    }
    char v54 = 0;
    uint64_t v25 = *(void *)v57;
    v55 = (NSString *)*MEMORY[0x1E4F4E940];
    v52 = (NSString *)*MEMORY[0x1E4F4E990];
    v51 = (NSString *)*MEMORY[0x1E4F4E978];
    v49 = (NSString *)v64;
LABEL_61:
    uint64_t v26 = 0;
    while (1)
    {
      if (*(void *)v57 != v25) {
        objc_enumerationMutation(obj);
      }
      id v27 = *(id *)(*((void *)&v56 + 1) + 8 * v26);
      __int16 v28 = [v27 portType];
      if (kAVVCScope)
      {
        id v29 = *(id *)kAVVCScope;
        if (!v29) {
          goto LABEL_71;
        }
      }
      else
      {
        __int16 v30 = (void *)MEMORY[0x1E4F14500];
        id v31 = MEMORY[0x1E4F14500];
        id v29 = v30;
      }
      int v32 = v29;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        [v27 portName];
        uint64_t v33 = v25;
        id v34 = (id)objc_claimAutoreleasedReturnValue();
        id v35 = [v27 UID];
        uint64_t v36 = [v27 portSubType];
        Get4CCFromInt([v27 endpointType]);
        id v37 = (id)objc_claimAutoreleasedReturnValue();
        int v38 = [v27 isHeadphones];
        *(_DWORD *)buf = 136316930;
        v66 = "AVVCSessionManager.mm";
        __int16 v67 = 1024;
        int v68 = 1822;
        __int16 v69 = 2112;
        v70 = (const char *)v28;
        __int16 v71 = 2112;
        id v72 = v34;
        __int16 v73 = 2112;
        id v74 = v35;
        __int16 v75 = 2048;
        uint64_t v76 = v36;
        __int16 v77 = 2112;
        id v78 = v37;
        __int16 v79 = 1024;
        int v80 = v38;
        _os_log_impl(&dword_19D794000, v32, OS_LOG_TYPE_DEFAULT, "%25s:%-5d predictIfMicrophoneShouldBeUsedForActivationMode: Available input: [ portType(%@), portName(%@), portUID(%@), portSubType(%ld), endpointType(%@) isHeadphones(%d) ]", buf, 0x4Au);

        uint64_t v25 = v33;
      }

LABEL_71:
      if (v28 == v55)
      {
        if ([v27 isHeadphones])
        {
          char v39 = [(AVVCSessionManager *)self isBTDeviceInEar];
LABEL_77:
          char v40 = v39 ^ 1;
        }
        else
        {
          char v40 = 1;
        }
        char v54 = v40;
        goto LABEL_81;
      }
      if (v28 == v52)
      {
        char v54 = 0;
      }
      else if (v28 == v51)
      {
        char v39 = areNSStringsEqual(v49, v51);
        goto LABEL_77;
      }
LABEL_81:

      if (v24 == ++v26)
      {
        uint64_t v24 = [obj countByEnumeratingWithState:&v56 objects:v81 count:16];
        if (!v24)
        {
LABEL_90:

          LODWORD(v5) = v54 & 1;
          goto LABEL_91;
        }
        goto LABEL_61;
      }
    }
  }
  if (kAVVCScope)
  {
    id v5 = *(id *)kAVVCScope;
    if (!v5) {
      return (char)v5;
    }
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v66 = "AVVCSessionManager.mm";
    __int16 v67 = 1024;
    int v68 = 1757;
    __int16 v69 = 2080;
    v70 = "predictIfMicrophoneShouldBeUsedForActivationMode";
    __int16 v71 = 1024;
    LODWORD(v72) = 0;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
  }

  LOBYTE(v5) = 0;
  return (char)v5;
}

- (BOOL)isBTDeviceInEar
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [(AVVCSessionManager *)self pickedRoute];
  if (kAVVCScope)
  {
    int v3 = *(id *)kAVVCScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    int v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315650;
    id v18 = "AVVCSessionManager.mm";
    __int16 v19 = 1024;
    int v20 = 1725;
    __int16 v21 = 2112;
    id v22 = v2;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d isBTDeviceInEar: pickedRoute from AudioSession: %@", (uint8_t *)&v17, 0x1Cu);
  }

LABEL_8:
  if (!v2)
  {
LABEL_18:
    LODWORD(v12) = 0;
    goto LABEL_19;
  }
  id v5 = [v2 objectForKey:@"IsBTRoute"];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    uint64_t v7 = [v2 objectForKey:@"PreferredExternalRouteDetails_InEarDetectSupported"];
    int v8 = [(id)v7 BOOLValue];

    int v9 = [v2 objectForKey:@"PreferredExternalRouteDetails_InEarDetectEnabled"];
    LODWORD(v7) = [v9 BOOLValue];

    int v10 = [v2 objectForKey:@"PreferredExternalRouteDetails_IsActive"];
    int v11 = [v10 BOOLValue];

    LODWORD(v12) = v8 & v7 ^ 1 | v11;
    goto LABEL_19;
  }
  if (!kAVVCScope)
  {
    char v12 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
    goto LABEL_15;
  }
  char v12 = *(id *)kAVVCScope;
  if (v12)
  {
LABEL_15:
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315394;
      id v18 = "AVVCSessionManager.mm";
      __int16 v19 = 1024;
      int v20 = 1745;
      _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d isBTDeviceInEar: pickedRoute is not a BT device", (uint8_t *)&v17, 0x12u);
    }

    goto LABEL_18;
  }
LABEL_19:
  if (kAVVCScope)
  {
    uint64_t v14 = *(id *)kAVVCScope;
    if (!v14) {
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v14 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315650;
    id v18 = "AVVCSessionManager.mm";
    __int16 v19 = 1024;
    int v20 = 1749;
    __int16 v21 = 1024;
    LODWORD(v22) = v12;
    _os_log_impl(&dword_19D794000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d isBTDeviceInEar: (%d)", (uint8_t *)&v17, 0x18u);
  }

LABEL_26:
  return (char)v12;
}

- (BOOL)isPickedRouteW1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [(AVVCSessionManager *)self pickedRoute];
  int v3 = v2;
  if (v2)
  {
    id v4 = [v2 objectForKey:@"BTDetails_ProductID"];
    id v5 = v4;
    if (v4) {
      int v6 = [v4 hasSuffix:@"76,8194"];
    }
    else {
      int v6 = 0;
    }
    if (kAVVCScope)
    {
      uint64_t v7 = *(id *)kAVVCScope;
      if (!v7)
      {
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = "NO";
      id v13 = "AVVCSessionManager.mm";
      __int16 v14 = 1024;
      int v15 = 1710;
      int v12 = 136315906;
      if (v6) {
        int v9 = "YES";
      }
      __int16 v16 = 2080;
      int v17 = v9;
      __int16 v18 = 2112;
      __int16 v19 = v5;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d isPickedRouteW1: %s, id: %@", (uint8_t *)&v12, 0x26u);
    }

    goto LABEL_21;
  }
  if (!kAVVCScope)
  {
    id v5 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
    goto LABEL_18;
  }
  id v5 = *(id *)kAVVCScope;
  if (v5)
  {
LABEL_18:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      id v13 = "AVVCSessionManager.mm";
      __int16 v14 = 1024;
      int v15 = 1713;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d isPickedRouteW1: NO. pickedRoute is nil", (uint8_t *)&v12, 0x12u);
    }
    LOBYTE(v6) = 0;
    goto LABEL_21;
  }
  LOBYTE(v6) = 0;
LABEL_22:

  return v6;
}

- (id)siriRemoteInputIdentifier
{
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1) {
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
    }
    int v3 = IsSerializationEnabled(void)::enable;
    p_mSessionManagerLock = &self->mSessionManagerLock;
    if (IsSerializationEnabled(void)::enable) {
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
    id v5 = [(AVAudioSession *)self->_audioSession currentRoute];
    int v6 = [v5 siriRemoteInputIdentifier];

    id v7 = v6;
    if (v3) {
      std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (unint64_t)siriInputSource
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    p_mSessionManagerLock = &self->mSessionManagerLock;
    if (IsSerializationEnabled(void)::onceToken != -1) {
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
    }
    int v4 = IsSerializationEnabled(void)::enable;
    if (IsSerializationEnabled(void)::enable) {
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
    id v5 = [(AVAudioSession *)self->_audioSession currentRoute];
    unint64_t v6 = [v5 siriInputSource];

    if (v4) {
      std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
    }
  }
  else
  {
    unint64_t v6 = 1936289391;
    if (kAVVCScope)
    {
      id v7 = *(id *)kAVVCScope;
      if (!v7) {
        return v6;
      }
    }
    else
    {
      id v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315906;
      int v11 = "AVVCSessionManager.mm";
      __int16 v12 = 1024;
      int v13 = 1678;
      __int16 v14 = 2080;
      int v15 = "siriInputSource";
      __int16 v16 = 1024;
      int v17 = 1936289391;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v10, 0x22u);
    }
  }
  return v6;
}

- (id)sessionCurrentInputRoutes
{
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1) {
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
    }
    int v3 = IsSerializationEnabled(void)::enable;
    p_mSessionManagerLock = &self->mSessionManagerLock;
    if (IsSerializationEnabled(void)::enable) {
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
    id v5 = [(AVAudioSession *)self->_audioSession currentRoute];
    unint64_t v6 = [v5 inputs];

    id v7 = v6;
    if (v3) {
      std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)sessionCurrentOutputRoutes
{
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1) {
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
    }
    int v3 = IsSerializationEnabled(void)::enable;
    p_mSessionManagerLock = &self->mSessionManagerLock;
    if (IsSerializationEnabled(void)::enable) {
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
    id v5 = [(AVAudioSession *)self->_audioSession currentRoute];
    unint64_t v6 = [v5 outputs];

    id v7 = v6;
    if (v3) {
      std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)pickedRoute
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    p_mSessionManagerLock = &self->mSessionManagerLock;
    if (IsSerializationEnabled(void)::onceToken != -1) {
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
    }
    int v4 = IsSerializationEnabled(void)::enable;
    if (IsSerializationEnabled(void)::enable) {
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
    ElapsedTime::ElapsedTime((ElapsedTime *)v7, "-[AVVCSessionManager pickedRoute]", "pickedRoute", 0);
    id v5 = [(AVAudioSession *)self->_audioSession pickedRoute];
    ElapsedTime::~ElapsedTime((ElapsedTime *)v7);
    if (v4) {
      std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)currentRoute
{
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    p_mSessionManagerLock = &self->mSessionManagerLock;
    if (IsSerializationEnabled(void)::onceToken != -1) {
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
    }
    int v4 = IsSerializationEnabled(void)::enable;
    if (IsSerializationEnabled(void)::enable) {
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
    id v5 = [(AVAudioSession *)self->_audioSession currentRoute];
    if (v4) {
      std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)setPreferredSampleRate:(double)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      int v9 = *(id *)kAVVCScope;
      if (!v9) {
        return 1;
      }
    }
    else
    {
      int v9 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315906;
      int v13 = "AVVCSessionManager.mm";
      __int16 v14 = 1024;
      int v15 = 1620;
      __int16 v16 = 2080;
      int v17 = "setPreferredSampleRate:error";
      __int16 v18 = 1024;
      int v19 = 1;
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v12, 0x22u);
    }

    return 1;
  }
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v7 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  BOOL v8 = [(AVAudioSession *)self->_audioSession setPreferredSampleRate:a4 error:a3];
  if (v7) {
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  return v8;
}

- (BOOL)setIAmTheAssistant:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      int v9 = *(id *)kAVVCScope;
      if (!v9) {
        return 1;
      }
    }
    else
    {
      int v9 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315906;
      int v13 = "AVVCSessionManager.mm";
      __int16 v14 = 1024;
      int v15 = 1610;
      __int16 v16 = 2080;
      int v17 = "setIAmTheAssistant";
      __int16 v18 = 1024;
      int v19 = 1;
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v12, 0x22u);
    }

    return 1;
  }
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v7 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  char v8 = [(AVAudioSession *)self->_audioSession setIAmTheAssistant:v5 error:a4];
  if (v7) {
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  return v8;
}

- (int64_t)reporterID
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  ElapsedTime::ElapsedTime((ElapsedTime *)v15, "-[AVVCSessionManager reporterID]", "reporterID", 0);
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      int v4 = *(id *)kAVVCScope;
      if (!v4)
      {
LABEL_16:
        int64_t reporterID = 0;
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 136315906;
      char v8 = "AVVCSessionManager.mm";
      __int16 v9 = 1024;
      int v10 = 1601;
      __int16 v11 = 2080;
      int v12 = "reporterID";
      __int16 v13 = 1024;
      int v14 = 0;
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v7, 0x22u);
    }

    goto LABEL_16;
  }
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  if (IsSerializationEnabled(void)::enable)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    int64_t reporterID = self->_reporterID;
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  else
  {
    int64_t reporterID = self->_reporterID;
  }
LABEL_17:
  ElapsedTime::~ElapsedTime((ElapsedTime *)v15);
  return reporterID;
}

- (BOOL)setAudioHardwareControlFlags:(unint64_t)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1) {
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
    }
    int v7 = IsSerializationEnabled(void)::enable;
    if (IsSerializationEnabled(void)::enable) {
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
    LOBYTE(a4) = [(AVAudioSession *)self->_audioSession setAudioHardwareControlFlags:a3 error:a4];
    if (v7) {
      std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
  }
  else
  {
    if (kAVVCScope)
    {
      a4 = (id *)*(id *)kAVVCScope;
      if (!a4) {
        return (char)a4;
      }
    }
    else
    {
      a4 = (id *)MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315906;
      __int16 v11 = "AVVCSessionManager.mm";
      __int16 v12 = 1024;
      int v13 = 1587;
      __int16 v14 = 2080;
      int v15 = "setAudioHardwareControlFlags";
      __int16 v16 = 1024;
      int v17 = 0;
      _os_log_impl(&dword_19D794000, (os_log_t)a4, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v10, 0x22u);
    }

    LOBYTE(a4) = 0;
  }
  return (char)a4;
}

- (BOOL)isSessionInSiriCategory
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      unint64_t v6 = *(id *)kAVVCScope;
      if (!v6) {
        return 0;
      }
    }
    else
    {
      unint64_t v6 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315906;
      int v10 = "AVVCSessionManager.mm";
      __int16 v11 = 1024;
      int v12 = 1574;
      __int16 v13 = 2080;
      __int16 v14 = "isSessionInSiriCategory";
      __int16 v15 = 1024;
      int v16 = 0;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v9, 0x22u);
    }

    return 0;
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v4 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  BOOL v5 = [(NSString *)self->mPreviousSessionCategory isEqualToString:*MEMORY[0x1E4F4E7F0]];
  if (v4) {
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  return v5;
}

- (BOOL)isSessionInSiriCategoryModeAndOptions:(unsigned int)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      __int16 v11 = *(id *)kAVVCScope;
      if (!v11) {
        return 0;
      }
    }
    else
    {
      __int16 v11 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 136315906;
      uint64_t v18 = "AVVCSessionManager.mm";
      __int16 v19 = 1024;
      int v20 = 1554;
      __int16 v21 = 2080;
      id v22 = "speechDetectionDeviceSampleRate";
      __int16 v23 = 1024;
      LODWORD(v24) = 0;
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v17, 0x22u);
    }

    return 0;
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v6 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  id v7 = self->mPreviousSessionCategory;
  id v8 = self->mPreviousSessionMode;
  int mPreviousSessionCategoryOptions = self->mPreviousSessionCategoryOptions;
  if (!kAVVCScope)
  {
    int v10 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
    goto LABEL_15;
  }
  int v10 = *(id *)kAVVCScope;
  if (v10)
  {
LABEL_15:
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 136316162;
      uint64_t v18 = "AVVCSessionManager.mm";
      __int16 v19 = 1024;
      int v20 = 1560;
      __int16 v21 = 2112;
      id v22 = (const char *)v7;
      __int16 v23 = 2112;
      uint64_t v24 = v8;
      __int16 v25 = 1024;
      int v26 = mPreviousSessionCategoryOptions;
      _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d isSessionInSiriCategoryModeAndOptions: about to set Play&Record category, speech recognition/assistant mode. Current category: %@, mode: %@, options: 0x%x", (uint8_t *)&v17, 0x2Cu);
    }
  }
  if ([(NSString *)v7 isEqualToString:*MEMORY[0x1E4F4E7F0]])
  {
    BOOL v13 = [(NSString *)v8 isEqualToString:*MEMORY[0x1E4F4E8F0]];
    BOOL v14 = mPreviousSessionCategoryOptions == a3 && v13;
  }
  else
  {
    BOOL v14 = 0;
  }

  if (v6) {
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  return v14;
}

- (BOOL)clearInputPreferences:(id *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1) {
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
    }
    int v5 = IsSerializationEnabled(void)::enable;
    if (IsSerializationEnabled(void)::enable) {
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
    LOBYTE(a3) = [(AVAudioSession *)self->_audioSession clearInputPreferences:a3];
    if (v5) {
      std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
  }
  else
  {
    if (kAVVCScope)
    {
      a3 = (id *)*(id *)kAVVCScope;
      if (!a3) {
        return (char)a3;
      }
    }
    else
    {
      a3 = (id *)MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 136315906;
      int v9 = "AVVCSessionManager.mm";
      __int16 v10 = 1024;
      int v11 = 1543;
      __int16 v12 = 2080;
      BOOL v13 = "clearInputPreferences";
      __int16 v14 = 1024;
      int v15 = 0;
      _os_log_impl(&dword_19D794000, (os_log_t)a3, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v8, 0x22u);
    }

    LOBYTE(a3) = 0;
  }
  return (char)a3;
}

- (BOOL)setCategory:(id)a3 mode:(id)a4 routeSharingPolicy:(unint64_t)a5 options:(unint64_t)a6 error:(id *)a7
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1) {
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
    }
    int v14 = IsSerializationEnabled(void)::enable;
    if (IsSerializationEnabled(void)::enable) {
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
    LOBYTE(a7) = [(AVAudioSession *)self->_audioSession setCategory:v12 mode:v13 routeSharingPolicy:a5 options:a6 error:a7];
    if (v14) {
      std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
  }
  else
  {
    if (kAVVCScope)
    {
      a7 = (id *)*(id *)kAVVCScope;
      if (!a7) {
        goto LABEL_17;
      }
    }
    else
    {
      a7 = (id *)MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled((os_log_t)a7, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 136315906;
      uint64_t v18 = "AVVCSessionManager.mm";
      __int16 v19 = 1024;
      int v20 = 1535;
      __int16 v21 = 2080;
      id v22 = "setCategory:mode:routeSharingPolicy:options";
      __int16 v23 = 1024;
      int v24 = 0;
      _os_log_impl(&dword_19D794000, (os_log_t)a7, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v17, 0x22u);
    }

    LOBYTE(a7) = 0;
  }
LABEL_17:

  return (char)a7;
}

- (BOOL)setCategory:(id)a3 mode:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1) {
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
    }
    int v12 = IsSerializationEnabled(void)::enable;
    if (IsSerializationEnabled(void)::enable) {
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
    LOBYTE(a6) = [(AVAudioSession *)self->_audioSession setCategory:v10 mode:v11 options:a5 error:a6];
    if (v12) {
      std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
  }
  else
  {
    if (kAVVCScope)
    {
      a6 = (id *)*(id *)kAVVCScope;
      if (!a6) {
        goto LABEL_17;
      }
    }
    else
    {
      a6 = (id *)MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled((os_log_t)a6, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 136315906;
      uint64_t v16 = "AVVCSessionManager.mm";
      __int16 v17 = 1024;
      int v18 = 1526;
      __int16 v19 = 2080;
      int v20 = "setCategory:mode:options";
      __int16 v21 = 1024;
      int v22 = 0;
      _os_log_impl(&dword_19D794000, (os_log_t)a6, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v15, 0x22u);
    }

    LOBYTE(a6) = 0;
  }
LABEL_17:

  return (char)a6;
}

- (double)speechDetectionDeviceSampleRate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      id v6 = *(id *)kAVVCScope;
      if (!v6) {
        return 16000.0;
      }
    }
    else
    {
      id v6 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315906;
      id v10 = "AVVCSessionManager.mm";
      __int16 v11 = 1024;
      int v12 = 1517;
      __int16 v13 = 2080;
      int v14 = "speechDetectionDeviceSampleRate";
      __int16 v15 = 1024;
      int v16 = 16000;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v9, 0x22u);
    }

    return 16000.0;
  }
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v3 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  [(AVAudioSession *)self->_audioSession speechDetectionDeviceSampleRate];
  double v5 = v4;
  if (v3) {
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  return v5;
}

- (double)outputVolume
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      id v6 = *(id *)kAVVCScope;
      if (!v6) {
        return 0.0;
      }
    }
    else
    {
      id v6 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315906;
      id v10 = "AVVCSessionManager.mm";
      __int16 v11 = 1024;
      int v12 = 1509;
      __int16 v13 = 2080;
      int v14 = "outputVolume";
      __int16 v15 = 1024;
      int v16 = 0;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v9, 0x22u);
    }

    return 0.0;
  }
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v3 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  [(AVAudioSession *)self->_audioSession outputVolume];
  double v5 = v4;
  self->_outputVolume = v4;
  if (v3) {
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  return v5;
}

- (double)inputSafetyOffset
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      id v6 = *(id *)kAVVCScope;
      if (!v6) {
        return 0.0;
      }
    }
    else
    {
      id v6 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315906;
      id v10 = "AVVCSessionManager.mm";
      __int16 v11 = 1024;
      int v12 = 1501;
      __int16 v13 = 2080;
      int v14 = "inputSafetyOffset";
      __int16 v15 = 1024;
      int v16 = 0;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v9, 0x22u);
    }

    return 0.0;
  }
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v3 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  [(AVAudioSession *)self->_audioSession inputSafetyOffset];
  double v5 = v4;
  self->_inputSafetyOffset = v4;
  if (v3) {
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  return v5;
}

- (double)outputSafetyOffset
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      id v6 = *(id *)kAVVCScope;
      if (!v6) {
        return 0.0;
      }
    }
    else
    {
      id v6 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315906;
      id v10 = "AVVCSessionManager.mm";
      __int16 v11 = 1024;
      int v12 = 1493;
      __int16 v13 = 2080;
      int v14 = "outputSafetyOffset";
      __int16 v15 = 1024;
      int v16 = 0;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v9, 0x22u);
    }

    return 0.0;
  }
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v3 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  [(AVAudioSession *)self->_audioSession outputSafetyOffset];
  double v5 = v4;
  self->_outputSafetyOffset = v4;
  if (v3) {
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  return v5;
}

- (double)outputLatency
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      id v6 = *(id *)kAVVCScope;
      if (!v6) {
        return 0.0;
      }
    }
    else
    {
      id v6 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315906;
      id v10 = "AVVCSessionManager.mm";
      __int16 v11 = 1024;
      int v12 = 1485;
      __int16 v13 = 2080;
      int v14 = "outputLatency";
      __int16 v15 = 1024;
      int v16 = 0;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v9, 0x22u);
    }

    return 0.0;
  }
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v3 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  [(AVAudioSession *)self->_audioSession outputLatency];
  double v5 = v4;
  self->_outputLatency = v4;
  if (v3) {
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  return v5;
}

- (double)inputLatency
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      id v6 = *(id *)kAVVCScope;
      if (!v6) {
        return 0.0;
      }
    }
    else
    {
      id v6 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315906;
      id v10 = "AVVCSessionManager.mm";
      __int16 v11 = 1024;
      int v12 = 1477;
      __int16 v13 = 2080;
      int v14 = "inputLatency";
      __int16 v15 = 1024;
      int v16 = 0;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v9, 0x22u);
    }

    return 0.0;
  }
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v3 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  [(AVAudioSession *)self->_audioSession inputLatency];
  double v5 = v4;
  self->_inputLatency = v4;
  if (v3) {
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  return v5;
}

- (BOOL)setEnableBTTriangleMode:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1) {
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
    }
    int v7 = IsSerializationEnabled(void)::enable;
    if (IsSerializationEnabled(void)::enable) {
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
    LOBYTE(a4) = [(AVAudioSession *)self->_audioSession setEligibleForBTTriangleConsideration:v5 error:a4];
    if (v7) {
      std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
  }
  else
  {
    if (kAVVCScope)
    {
      a4 = (id *)*(id *)kAVVCScope;
      if (!a4) {
        return (char)a4;
      }
    }
    else
    {
      a4 = (id *)MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 136315906;
      __int16 v11 = "AVVCSessionManager.mm";
      __int16 v12 = 1024;
      int v13 = 1463;
      __int16 v14 = 2080;
      __int16 v15 = "setEnableBTTriangleMode";
      __int16 v16 = 1024;
      int v17 = 0;
      _os_log_impl(&dword_19D794000, (os_log_t)a4, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v10, 0x22u);
    }

    LOBYTE(a4) = 0;
  }
  return (char)a4;
}

- (BOOL)getForceGetSessionProperties
{
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  if (IsSerializationEnabled(void)::enable)
  {
    p_mSessionManagerLock = &self->mSessionManagerLock;
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    BOOL forceGetSessionProperties = self->_forceGetSessionProperties;
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  else
  {
    return self->_forceGetSessionProperties;
  }
  return forceGetSessionProperties;
}

- (void)setForceGetSessionProperties:(BOOL)a3
{
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  if (IsSerializationEnabled(void)::enable)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    self->_BOOL forceGetSessionProperties = a3;
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  else
  {
    self->_BOOL forceGetSessionProperties = a3;
  }
}

- (id)getPlaybackRoute
{
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  if (IsSerializationEnabled(void)::enable)
  {
    p_mSessionManagerLock = &self->mSessionManagerLock;
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    double v4 = self->_playbackRoute;
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  else
  {
    double v4 = self->_playbackRoute;
  }

  return v4;
}

- (void)setPlaybackRoute:(id)a3
{
  double v4 = (NSString *)a3;
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  if (IsSerializationEnabled(void)::enable)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    playbackRoute = self->_playbackRoute;
    self->_playbackRoute = v4;

    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  else
  {
    id v6 = self->_playbackRoute;
    self->_playbackRoute = v4;
  }
}

- (float)getDeviceGain
{
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  if (!IsSerializationEnabled(void)::enable) {
    return self->_deviceGain;
  }
  std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  float deviceGain = self->_deviceGain;
  std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  return deviceGain;
}

- (void)setDeviceGain:(float)a3
{
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  if (IsSerializationEnabled(void)::enable)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    self->_float deviceGain = a3;
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  else
  {
    self->_float deviceGain = a3;
  }
}

- (BOOL)getClientRequestsRecording
{
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  if (IsSerializationEnabled(void)::enable)
  {
    p_mSessionManagerLock = &self->mSessionManagerLock;
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    BOOL clientRequestsRecording = self->_clientRequestsRecording;
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  else
  {
    return self->_clientRequestsRecording;
  }
  return clientRequestsRecording;
}

- (void)setClientRequestsRecording:(BOOL)a3
{
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  if (IsSerializationEnabled(void)::enable)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    self->_BOOL clientRequestsRecording = a3;
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  else
  {
    self->_BOOL clientRequestsRecording = a3;
  }
}

- (BOOL)isSessionActive
{
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  if (IsSerializationEnabled(void)::enable)
  {
    p_mSessionManagerLock = &self->mSessionManagerLock;
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    int sessionState = self->_sessionState;
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  else
  {
    int sessionState = self->_sessionState;
  }
  return sessionState > 4;
}

- (int)sessionState
{
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  if (!IsSerializationEnabled(void)::enable) {
    return self->_sessionState;
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  int sessionState = self->_sessionState;
  std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  return sessionState;
}

- (void)setSessionStateWithoutLock:(int)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v6 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  if (kAVVCScope)
  {
    int v7 = *(id *)kAVVCScope;
    if (!v7) {
      goto LABEL_18;
    }
  }
  else
  {
    int v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t sessionState = self->_sessionState;
    if (sessionState > 7) {
      int v10 = "ILLEGAL";
    }
    else {
      int v10 = off_1E59658A8[sessionState];
    }
    if (a3 > 7) {
      __int16 v11 = "ILLEGAL";
    }
    else {
      __int16 v11 = off_1E59658A8[a3];
    }
    int v12 = 136316162;
    int v13 = "AVVCSessionManager.mm";
    __int16 v14 = 1024;
    int v15 = 1391;
    __int16 v16 = 2048;
    int v17 = self;
    __int16 v18 = 2080;
    __int16 v19 = v10;
    __int16 v20 = 2080;
    __int16 v21 = v11;
    _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d session(%p) state %s => %s", (uint8_t *)&v12, 0x30u);
  }

LABEL_18:
  self->_uint64_t sessionState = a3;
  if (v6) {
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
}

- (void)setSessionState:(int)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v6 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  if (kAVVCScope)
  {
    int v7 = *(id *)kAVVCScope;
    if (!v7) {
      goto LABEL_18;
    }
  }
  else
  {
    int v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t sessionState = self->_sessionState;
    if (sessionState > 7) {
      int v10 = "ILLEGAL";
    }
    else {
      int v10 = off_1E59658A8[sessionState];
    }
    if (a3 > 7) {
      __int16 v11 = "ILLEGAL";
    }
    else {
      __int16 v11 = off_1E59658A8[a3];
    }
    int v12 = 136316162;
    int v13 = "AVVCSessionManager.mm";
    __int16 v14 = 1024;
    int v15 = 1385;
    __int16 v16 = 2048;
    int v17 = self;
    __int16 v18 = 2080;
    __int16 v19 = v10;
    __int16 v20 = 2080;
    __int16 v21 = v11;
    _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d session(%p) state %s => %s", (uint8_t *)&v12, 0x30u);
  }

LABEL_18:
  self->_uint64_t sessionState = a3;
  if (v6) {
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
}

- (BOOL)deactivateAudioSessionWithOptions:(unsigned int)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      int v10 = *(id *)kAVVCScope;
      if (!v10)
      {
LABEL_29:
        LOBYTE(v12) = 1;
        return v12;
      }
    }
    else
    {
      int v10 = MEMORY[0x1E4F14500];
      id v17 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      id v29 = "AVVCSessionManager.mm";
      __int16 v30 = 1024;
      int v31 = 1352;
      __int16 v32 = 2080;
      uint64_t v33 = (uint8_t *)"deactivateAudioSessionWithOptions";
      __int16 v34 = 1024;
      int v35 = 1;
      _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

    goto LABEL_29;
  }
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v7 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  id v8 = [(AVVCSessionManager *)self audioSession];
  [(AVVCSessionManager *)self setSessionStateWithoutLock:4];
  if (kAVVCScope)
  {
    int v9 = *(id *)kAVVCScope;
    if (!v9) {
      goto LABEL_18;
    }
  }
  else
  {
    int v9 = MEMORY[0x1E4F14500];
    id v11 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v29 = "AVVCSessionManager.mm";
    __int16 v30 = 1024;
    int v31 = 1360;
    __int16 v32 = 1024;
    LODWORD(v33) = a3;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d deactivateAudioSession: session options : %d", buf, 0x18u);
  }

LABEL_18:
  id v26 = 0;
  int v12 = [v8 setActive:0 withOptions:a3 error:&v26];
  id v13 = v26;
  unsigned int v14 = [v13 code];
  if (!v12)
  {
    if (kAVVCScope)
    {
      id v16 = *(id *)kAVVCScope;
      if (!v16)
      {
LABEL_39:
        BOOL v21 = v14 != 1836282486;
        goto LABEL_40;
      }
    }
    else
    {
      id v16 = (id)MEMORY[0x1E4F14500];
      id v22 = MEMORY[0x1E4F14500];
    }
    uint64_t v23 = v16;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v27, v14);
      int v24 = [(AVAudioSession *)self->_audioSession opaqueSessionID];
      *(_DWORD *)buf = 136315906;
      id v29 = "AVVCSessionManager.mm";
      __int16 v30 = 1024;
      int v31 = 1370;
      __int16 v32 = 2080;
      uint64_t v33 = v27;
      __int16 v34 = 1024;
      int v35 = v24;
      _os_log_impl(&dword_19D794000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d deactivateAudioSession failed with error: %s, session id:0x%x", buf, 0x22u);
    }

    goto LABEL_39;
  }
  if (!kAVVCScope)
  {
    id v15 = (id)MEMORY[0x1E4F14500];
    id v18 = MEMORY[0x1E4F14500];
    goto LABEL_31;
  }
  id v15 = *(id *)kAVVCScope;
  if (v15)
  {
LABEL_31:
    __int16 v19 = v15;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v27, v14);
      int v20 = [(AVAudioSession *)self->_audioSession opaqueSessionID];
      *(_DWORD *)buf = 136315906;
      id v29 = "AVVCSessionManager.mm";
      __int16 v30 = 1024;
      int v31 = 1366;
      __int16 v32 = 2080;
      uint64_t v33 = v27;
      __int16 v34 = 1024;
      int v35 = v20;
      _os_log_impl(&dword_19D794000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d deactivateAudioSession succeeded error: %s, session id:0x%x", buf, 0x22u);
    }
  }
  BOOL v21 = 1;
LABEL_40:
  [(AVVCSessionManager *)self setSessionStateWithoutLock:v21];
  if (a4) {
    *a4 = v13;
  }

  if (v7) {
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  return v12;
}

- (BOOL)activateAudioSessionWithPrewarm:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      int v10 = *(id *)kAVVCScope;
      if (!v10)
      {
LABEL_32:
        LOBYTE(v17) = 1;
        return v17;
      }
    }
    else
    {
      int v10 = MEMORY[0x1E4F14500];
      id v21 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v44 = "AVVCSessionManager.mm";
      __int16 v45 = 1024;
      int v46 = 1296;
      __int16 v47 = 2080;
      v48 = "activateAudioSessionWithPrewarm";
      __int16 v49 = 1024;
      LODWORD(v50) = 1;
      _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

    goto LABEL_32;
  }
  p_mSessionManagerLock = (std::recursive_mutex *)&self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v7 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock(p_mSessionManagerLock);
  }
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  char v39 = __Block_byref_object_copy__6389;
  char v40 = __Block_byref_object_dispose__6390;
  id v41 = 0;
  __int16 v30 = [(AVVCSessionManager *)self audioSession];
  if (v5)
  {
    [(AVVCSessionManager *)self setSessionStateWithoutLock:5];
    unsigned int mSessionActivationOptions = 0x2000;
    int v9 = @"prewarmAudioSession";
  }
  else
  {
    [(AVVCSessionManager *)self setSessionStateWithoutLock:6];
    unsigned int mSessionActivationOptions = self->mSessionActivationOptions;
    int v9 = @"activateAudioSession";
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
    id v11 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v44 = "AVVCSessionManager.mm";
    __int16 v45 = 1024;
    int v46 = 1315;
    __int16 v47 = 2112;
    v48 = (const char *)v9;
    __int16 v49 = 1024;
    LODWORD(v50) = mSessionActivationOptions;
    _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@: session options : %d", buf, 0x22u);
  }

LABEL_21:
  ProfileMetrics(&cfstr_AvvcProfilePro_6.isa);
  kdebug_trace();
  ElapsedTime::ElapsedTime((ElapsedTime *)buf, "-[AVVCSessionManager activateAudioSessionWithPrewarm:error:]", "AVAudioSessionSetActive", 0);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__AVVCSessionManager_activateAudioSessionWithPrewarm_error___block_invoke;
  aBlock[3] = &unk_1E5965880;
  id v13 = v30;
  unsigned int v35 = mSessionActivationOptions;
  id v33 = v13;
  __int16 v34 = &v36;
  unsigned int v14 = _Block_copy(aBlock);
  id v15 = (void *)MEMORY[0x19F3AC180]();
  id v16 = +[AVVCMetricsManager sharedManager];
  int v17 = [v16 measureElapseTimeForMetric:@"SetSessionActiveTime" block:v14];

  ElapsedTime::~ElapsedTime((ElapsedTime *)buf);
  kdebug_trace();
  ProfileMetrics(&cfstr_AvvcProfilePro_7.isa);
  unsigned int v18 = [(id)v37[5] code];
  if (!v17)
  {
    if (kAVVCScope)
    {
      id v20 = *(id *)kAVVCScope;
      if (!v20)
      {
LABEL_42:
        uint64_t v25 = v18 != 1836282486;
        goto LABEL_43;
      }
    }
    else
    {
      id v20 = (id)MEMORY[0x1E4F14500];
      id v26 = MEMORY[0x1E4F14500];
    }
    uint64_t v27 = v20;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v42, v18);
      int v28 = [(AVAudioSession *)self->_audioSession opaqueSessionID];
      *(_DWORD *)buf = 136316162;
      v44 = "AVVCSessionManager.mm";
      __int16 v45 = 1024;
      int v46 = 1339;
      __int16 v47 = 2112;
      v48 = (const char *)v9;
      __int16 v49 = 2080;
      v50 = v42;
      __int16 v51 = 1024;
      int v52 = v28;
      _os_log_impl(&dword_19D794000, v27, OS_LOG_TYPE_ERROR, "%25s:%-5d %@ failed with error: %s, session id:0x%x", buf, 0x2Cu);
    }

    goto LABEL_42;
  }
  if (!kAVVCScope)
  {
    id v19 = (id)MEMORY[0x1E4F14500];
    id v22 = MEMORY[0x1E4F14500];
    goto LABEL_34;
  }
  id v19 = *(id *)kAVVCScope;
  if (v19)
  {
LABEL_34:
    uint64_t v23 = v19;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v42, v18);
      int v24 = [(AVAudioSession *)self->_audioSession opaqueSessionID];
      *(_DWORD *)buf = 136316162;
      v44 = "AVVCSessionManager.mm";
      __int16 v45 = 1024;
      int v46 = 1335;
      __int16 v47 = 2112;
      v48 = (const char *)v9;
      __int16 v49 = 2080;
      v50 = v42;
      __int16 v51 = 1024;
      int v52 = v24;
      _os_log_impl(&dword_19D794000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@ succeeded error: %s, session id:0x%x", buf, 0x2Cu);
    }
  }
  uint64_t v25 = 7;
LABEL_43:
  [(AVVCSessionManager *)self setSessionStateWithoutLock:v25];
  if (a4) {
    *a4 = (id) v37[5];
  }

  _Block_object_dispose(&v36, 8);
  if (v7) {
    std::recursive_mutex::unlock(p_mSessionManagerLock);
  }
  return v17;
}

uint64_t __60__AVVCSessionManager_activateAudioSessionWithPrewarm_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 48);
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [v2 setActive:1 withOptions:v1 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  return v4;
}

- (BOOL)isAirplayOneOfTheOutputRoutes:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  int v15 = [v14 count];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v14;
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v31 count:16];
  if (v3)
  {
    int v4 = 0;
    char v5 = 0;
    uint64_t v6 = *(void *)v18;
    uint64_t v7 = *MEMORY[0x1E4F4E930];
    while (1)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        int v9 = [*(id *)(*((void *)&v17 + 1) + 8 * i) portType];
        if (kAVVCScope)
        {
          int v10 = *(id *)kAVVCScope;
          if (!v10) {
            goto LABEL_13;
          }
        }
        else
        {
          int v10 = MEMORY[0x1E4F14500];
          id v11 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          id v22 = "AVVCSessionManager.mm";
          __int16 v23 = 1024;
          int v24 = 1281;
          __int16 v25 = 1024;
          int v26 = v4 + i + 1;
          __int16 v27 = 1024;
          int v28 = v15;
          __int16 v29 = 2112;
          __int16 v30 = v9;
          _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Output Port[%d / %d] : %@", buf, 0x28u);
        }

LABEL_13:
        char v12 = [v9 isEqualToString:v7];

        v5 |= v12;
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v31 count:16];
      v4 += i;
      if (!v3) {
        goto LABEL_17;
      }
    }
  }
  char v5 = 0;
LABEL_17:

  return v5 & 1;
}

- (int)enableSmartRoutingConsideration:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      int v9 = *(id *)kAVVCScope;
      if (!v9) {
        return 0;
      }
    }
    else
    {
      int v9 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v29 = "AVVCSessionManager.mm";
      __int16 v30 = 1024;
      int v31 = 1246;
      __int16 v32 = 2080;
      id v33 = "enableSmartRoutingConsideration";
      __int16 v34 = 1024;
      int v35 = 0;
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

    return 0;
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v6 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  ElapsedTime::ElapsedTime((ElapsedTime *)buf, "-[AVVCSessionManager enableSmartRoutingConsideration:]", "enableSmartRoutingConsideration", 0);
  if (self->mEnableSmartRoutingConsideration == v3)
  {
    if (kAVVCScope)
    {
      uint64_t v7 = *(id *)kAVVCScope;
      if (!v7)
      {
        int v8 = 0;
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v7 = MEMORY[0x1E4F14500];
      id v16 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v22 = 136315394;
      __int16 v23 = "AVVCSessionManager.mm";
      __int16 v24 = 1024;
      int v25 = 1258;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::enableSmartRoutingConsideration No-op", v22, 0x12u);
    }
  }
  else
  {
    audioSession = self->_audioSession;
    id v21 = 0;
    char v11 = [(AVAudioSession *)audioSession setEligibleForBTSmartRoutingConsideration:v3 error:&v21];
    char v12 = v21;
    uint64_t v7 = v12;
    if (v12) {
      char v13 = v11;
    }
    else {
      char v13 = 1;
    }
    if ((v13 & 1) == 0)
    {
      int v8 = [v12 code];
      if (kAVVCScope)
      {
        id v14 = *(id *)kAVVCScope;
        if (!v14) {
          goto LABEL_35;
        }
      }
      else
      {
        id v14 = (id)MEMORY[0x1E4F14500];
        id v17 = MEMORY[0x1E4F14500];
      }
      long long v18 = v14;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        long long v19 = [v7 description];
        *(_DWORD *)id v22 = 136315650;
        __int16 v23 = "AVVCSessionManager.mm";
        __int16 v24 = 1024;
        int v25 = 1266;
        __int16 v26 = 2112;
        __int16 v27 = v19;
        _os_log_impl(&dword_19D794000, v18, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::enableSmartRoutingConsideration failed: %@", v22, 0x1Cu);
      }
      goto LABEL_35;
    }
  }
  int v8 = 0;
LABEL_35:

LABEL_36:
  ElapsedTime::~ElapsedTime((ElapsedTime *)buf);
  if (v6) {
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  return v8;
}

- (void)setSessionActivationOptions:(unsigned int)a3
{
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  if (IsSerializationEnabled(void)::enable)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    self->unsigned int mSessionActivationOptions = a3;
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  else
  {
    self->unsigned int mSessionActivationOptions = a3;
  }
}

- (unsigned)getSessionActivationOptions
{
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  if (!IsSerializationEnabled(void)::enable) {
    return self->mSessionActivationOptions;
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  unsigned int mSessionActivationOptions = self->mSessionActivationOptions;
  std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  return mSessionActivationOptions;
}

- (BOOL)isSessionOutputInWirelessSplitterMode
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v4 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  if (self->mDeviceIsIOSAccessory)
  {
    BOOL v5 = 0;
    if (!v4) {
      return v5;
    }
LABEL_7:
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
    return v5;
  }
  __int16 v26 = p_mSessionManagerLock;
  int v27 = v4;
  ElapsedTime::ElapsedTime((ElapsedTime *)v32, "-[AVVCSessionManager isSessionOutputInWirelessSplitterMode]", "isSessionOutputInWirelessSplitterMode", 0);
  if (isAVOutputContextAvailable(void)::onceToken1 != -1) {
    dispatch_once(&isAVOutputContextAvailable(void)::onceToken1, &__block_literal_global);
  }
  if (!isAVOutputContextAvailable(void)::wirelessSplitterModeAPIAvailable)
  {
    if (kAVVCScope)
    {
      uint64_t v7 = *(id *)kAVVCScope;
      if (!v7)
      {
        BOOL v5 = 0;
        goto LABEL_51;
      }
    }
    else
    {
      uint64_t v7 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v42 = "AVVCCarplayRuntimeAvailability.mm";
      __int16 v43 = 1024;
      int v44 = 70;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVOutputContext API not available", buf, 0x12u);
    }
    BOOL v5 = 0;
    goto LABEL_50;
  }
  uint64_t v7 = [getAVOutputContextClass() sharedSystemAudioContext];
  int v25 = v7;
  int v8 = [v7 supportsMultipleBluetoothOutputDevices];
  if (kAVVCScope)
  {
    int v9 = *(id *)kAVVCScope;
    if (!v9)
    {
      if (v8) {
        goto LABEL_15;
      }
LABEL_25:
      int v13 = 0;
      goto LABEL_49;
    }
  }
  else
  {
    int v9 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v42 = "AVVCCarplayRuntimeAvailability.mm";
    __int16 v43 = 1024;
    int v44 = 78;
    __int16 v45 = 1024;
    LODWORD(v46) = v8;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d supportsMultipleBTDevices: %d", buf, 0x18u);
  }

  if (!v8) {
    goto LABEL_25;
  }
LABEL_15:
  int v10 = [v7 outputDevices];
  if (!kAVVCScope)
  {
    char v11 = MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
    goto LABEL_31;
  }
  char v11 = *(id *)kAVVCScope;
  if (v11)
  {
LABEL_31:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v42 = "AVVCCarplayRuntimeAvailability.mm";
      __int16 v43 = 1024;
      int v44 = 82;
      __int16 v45 = 2112;
      int v46 = v10;
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Wireless Output Devices: %@", buf, 0x1Cu);
    }
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v16 = v10;
  int v13 = 0;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:buf count:16];
  if (!v17) {
    goto LABEL_48;
  }
  uint64_t v18 = *(void *)v29;
  long long v19 = MEMORY[0x1E4F14500];
  do
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v29 != v18) {
        objc_enumerationMutation(v16);
      }
      id v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      int v22 = [v21 supportsBluetoothSharing];
      if (kAVVCScope)
      {
        __int16 v23 = *(id *)kAVVCScope;
        if (!v23) {
          goto LABEL_46;
        }
      }
      else
      {
        __int16 v24 = v19;
        __int16 v23 = v19;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v33 = 136315906;
        __int16 v34 = "AVVCCarplayRuntimeAvailability.mm";
        __int16 v35 = 1024;
        int v36 = 86;
        __int16 v37 = 2048;
        uint64_t v38 = v21;
        __int16 v39 = 1024;
        int v40 = v22;
        _os_log_impl(&dword_19D794000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVOutputDevice %p supports BT sharing: %d", v33, 0x22u);
      }

LABEL_46:
      v13 += v22;
    }
    uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:buf count:16];
  }
  while (v17);
LABEL_48:

  uint64_t v7 = v25;
LABEL_49:
  BOOL v5 = v13 > 1;
LABEL_50:

  p_mSessionManagerLock = v26;
  int v4 = v27;
LABEL_51:
  self->mSessionOutputIsWirelessSplitter = v5;
  ElapsedTime::~ElapsedTime((ElapsedTime *)v32);
  if (v4) {
    goto LABEL_7;
  }
  return v5;
}

- (BOOL)setDuckingFadeOutDuration:(id)a3 fadeInDuration:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  ElapsedTime::ElapsedTime((ElapsedTime *)v25, "-[AVVCSessionManager setDuckingFadeOutDuration:fadeInDuration:error:]", "setDuckingFadeDuration", 0);
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (IsSerializationEnabled(void)::onceToken != -1) {
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
    }
    int v10 = IsSerializationEnabled(void)::enable;
    p_mSessionManagerLock = &self->mSessionManagerLock;
    if (IsSerializationEnabled(void)::enable) {
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
    LOBYTE(self) = [(AVAudioSession *)self->_audioSession setDuckingFadeOutDuration:v8 fadeInDuration:v9 error:a5];
    if ((self & 1) != 0 || !*a5) {
      goto LABEL_24;
    }
    if (kAVVCScope)
    {
      id v12 = *(id *)kAVVCScope;
      if (!v12)
      {
LABEL_24:
        if (v10) {
          std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
        }
        goto LABEL_26;
      }
    }
    else
    {
      id v12 = (id)MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    id v15 = v12;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = [*a5 code];
      uint64_t v17 = [*a5 description];
      int v19 = 136315906;
      long long v20 = "AVVCSessionManager.mm";
      __int16 v21 = 1024;
      int v22 = 1193;
      __int16 v23 = 1024;
      *(_DWORD *)__int16 v24 = v16;
      *(_WORD *)&v24[4] = 2112;
      *(void *)&v24[6] = v17;
      _os_log_impl(&dword_19D794000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d Error in setDuckingFadeDuration %d, %@", (uint8_t *)&v19, 0x22u);
    }
    goto LABEL_24;
  }
  if (kAVVCScope)
  {
    self = (AVVCSessionManager *)*(id *)kAVVCScope;
    if (!self) {
      goto LABEL_26;
    }
  }
  else
  {
    self = (AVVCSessionManager *)MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(&self->super, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 136315906;
    long long v20 = "AVVCSessionManager.mm";
    __int16 v21 = 1024;
    int v22 = 1188;
    __int16 v23 = 2080;
    *(void *)__int16 v24 = "setDuckingFadeDuration";
    *(_WORD *)&v24[8] = 1024;
    *(_DWORD *)&v24[10] = 0;
    _os_log_impl(&dword_19D794000, &self->super, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v19, 0x22u);
  }

  LOBYTE(self) = 0;
LABEL_26:
  ElapsedTime::~ElapsedTime((ElapsedTime *)v25);

  return (char)self;
}

- (BOOL)setDuckOthers:(id)a3 mixWithOthers:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  ElapsedTime::ElapsedTime((ElapsedTime *)v36, "-[AVVCSessionManager setDuckOthers:mixWithOthers:error:]", "setDuckOthersMixWithOthers", 0);
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      id v14 = *(id *)kAVVCScope;
      if (!v14)
      {
LABEL_31:
        char v20 = 0;
        goto LABEL_49;
      }
    }
    else
    {
      id v14 = MEMORY[0x1E4F14500];
      id v19 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v30 = 136315906;
      long long v31 = "AVVCSessionManager.mm";
      __int16 v32 = 1024;
      int v33 = 1137;
      __int16 v34 = 2080;
      *(void *)__int16 v35 = "setDuckOthers:mixWithOthers";
      *(_WORD *)&v35[8] = 1024;
      *(_DWORD *)&v35[10] = 0;
      _os_log_impl(&dword_19D794000, v14, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", (uint8_t *)&v30, 0x22u);
    }

    goto LABEL_31;
  }
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v10 = IsSerializationEnabled(void)::enable;
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  unint64_t mPreviousSessionCategoryOptions = self->mPreviousSessionCategoryOptions;
  unint64_t v13 = mPreviousSessionCategoryOptions;
  if (!v8)
  {
LABEL_11:
    if (!v9) {
      goto LABEL_20;
    }
    goto LABEL_17;
  }
  if ([v8 BOOLValue])
  {
    unint64_t v13 = mPreviousSessionCategoryOptions | 2;
    goto LABEL_11;
  }
  unint64_t v13 = mPreviousSessionCategoryOptions & 0xFFFFFFFFFFFFFFFDLL;
  if (!v9) {
    goto LABEL_20;
  }
LABEL_17:
  int v15 = [v9 BOOLValue];
  uint64_t v16 = 17;
  if (!v15) {
    uint64_t v16 = 0;
  }
  unint64_t v13 = v16 | v13 & 0xFFFFFFFFFFFFFFEELL;
LABEL_20:
  if (mPreviousSessionCategoryOptions == v13)
  {
    if (kAVVCScope)
    {
      uint64_t v17 = *(id *)kAVVCScope;
      if (!v17) {
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v17 = MEMORY[0x1E4F14500];
      id v21 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v22 = self->mPreviousSessionCategoryOptions;
      int v30 = 136315650;
      long long v31 = "AVVCSessionManager.mm";
      __int16 v32 = 1024;
      int v33 = 1175;
      __int16 v34 = 1024;
      *(_DWORD *)__int16 v35 = v22;
      _os_log_impl(&dword_19D794000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager: No change - options are the same. No op. Current options: 0x%x.", (uint8_t *)&v30, 0x18u);
    }

LABEL_36:
    char v20 = 1;
    if (!v10) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
  if (!kAVVCScope)
  {
    uint64_t v18 = MEMORY[0x1E4F14500];
    id v23 = MEMORY[0x1E4F14500];
    goto LABEL_39;
  }
  uint64_t v18 = *(id *)kAVVCScope;
  if (v18)
  {
LABEL_39:
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 136315906;
      long long v31 = "AVVCSessionManager.mm";
      __int16 v32 = 1024;
      int v33 = 1164;
      __int16 v34 = 1024;
      *(_DWORD *)__int16 v35 = v13;
      *(_WORD *)&v35[4] = 1024;
      *(_DWORD *)&v35[6] = mPreviousSessionCategoryOptions;
      _os_log_impl(&dword_19D794000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager: Setting new options: 0x%x. Previous options: 0x%x", (uint8_t *)&v30, 0x1Eu);
    }
  }
  char v20 = [(AVAudioSession *)self->_audioSession setCategoryOptions:v13 error:a5];
  if ((v20 & 1) == 0 && *a5)
  {
    if (kAVVCScope)
    {
      id v24 = *(id *)kAVVCScope;
      if (!v24) {
        goto LABEL_54;
      }
    }
    else
    {
      id v24 = (id)MEMORY[0x1E4F14500];
      id v26 = MEMORY[0x1E4F14500];
    }
    int v27 = v24;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      int v28 = [*a5 code];
      long long v29 = [*a5 description];
      int v30 = 136315906;
      long long v31 = "AVVCSessionManager.mm";
      __int16 v32 = 1024;
      int v33 = 1168;
      __int16 v34 = 1024;
      *(_DWORD *)__int16 v35 = v28;
      *(_WORD *)&v35[4] = 2112;
      *(void *)&v35[6] = v29;
      _os_log_impl(&dword_19D794000, v27, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setDuckOthers:mixWithOthers failed with error: %d, %@", (uint8_t *)&v30, 0x22u);
    }
LABEL_54:
    char v20 = 0;
    if (!v10) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
  self->unint64_t mPreviousSessionCategoryOptions = v13;
  if (v10) {
LABEL_48:
  }
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
LABEL_49:
  ElapsedTime::~ElapsedTime((ElapsedTime *)v36);

  return v20;
}

- (void)changeDuckOthersOption:(BOOL)a3
{
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  if (IsSerializationEnabled(void)::enable)
  {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    self->mShouldDuckOthers = a3;
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  else
  {
    self->mShouldDuckOthers = a3;
  }
}

- (int)setSessionBufferSize:(int)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      uint64_t v7 = *(id *)kAVVCScope;
      if (!v7) {
        return 0;
      }
    }
    else
    {
      uint64_t v7 = MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      int v30 = "AVVCSessionManager.mm";
      __int16 v31 = 1024;
      int v32 = 1097;
      __int16 v33 = 2080;
      __int16 v34 = "setSessionBufferSize";
      __int16 v35 = 1024;
      int v36 = 0;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

    return 0;
  }
  ElapsedTime::ElapsedTime((ElapsedTime *)buf, "-[AVVCSessionManager setSessionBufferSize:]", "setSessionBufferSize", 0);
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v5 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  if (self->mPreviousIOBufferFrameSize == a3)
  {
    if (kAVVCScope)
    {
      int v6 = *(id *)kAVVCScope;
      if (!v6)
      {
LABEL_29:
        int v11 = 0;
        goto LABEL_34;
      }
    }
    else
    {
      int v6 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v23 = 136315394;
      id v24 = "AVVCSessionManager.mm";
      __int16 v25 = 1024;
      int v26 = 1114;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionBufferSize: No change - not setting preferred IO buffer size. No op.", v23, 0x12u);
    }

    int v6 = 0;
    goto LABEL_29;
  }
  audioSession = self->_audioSession;
  id v22 = 0;
  char v9 = [(AVAudioSession *)audioSession setPreferredIOBufferFrameSize:a3 error:&v22];
  int v10 = v22;
  int v6 = v10;
  if (v9)
  {
    int v11 = 0;
    self->int mPreviousIOBufferFrameSize = a3;
    goto LABEL_34;
  }
  int v11 = [v10 code];
  if (kAVVCScope)
  {
    id v12 = *(id *)kAVVCScope;
    if (!v12) {
      goto LABEL_34;
    }
  }
  else
  {
    id v12 = (id)MEMORY[0x1E4F14500];
    id v15 = MEMORY[0x1E4F14500];
  }
  uint64_t v16 = v12;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = [v6 description];
    *(_DWORD *)id v23 = 136315650;
    id v24 = "AVVCSessionManager.mm";
    __int16 v25 = 1024;
    int v26 = 1107;
    __int16 v27 = 2112;
    int v28 = v17;
    _os_log_impl(&dword_19D794000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setSessionBufferSize failed: %@", v23, 0x1Cu);
  }
LABEL_34:
  if (!kAVVCScope)
  {
    uint64_t v18 = MEMORY[0x1E4F14500];
    id v19 = MEMORY[0x1E4F14500];
    goto LABEL_38;
  }
  uint64_t v18 = *(id *)kAVVCScope;
  if (v18)
  {
LABEL_38:
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int mPreviousIOBufferFrameSize = self->mPreviousIOBufferFrameSize;
      *(_DWORD *)id v23 = 136315650;
      id v24 = "AVVCSessionManager.mm";
      __int16 v25 = 1024;
      int v26 = 1117;
      __int16 v27 = 1024;
      LODWORD(v28) = mPreviousIOBufferFrameSize;
      _os_log_impl(&dword_19D794000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionBufferSize: Previous IO buffer size: %d", v23, 0x18u);
    }
  }
  if (v5) {
    std::recursive_mutex::unlock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)buf);
  return v11;
}

- (int)setSessionSampleRateForActivationMode:(int64_t)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      int v11 = *(id *)kAVVCScope;
      if (!v11) {
        return 0;
      }
    }
    else
    {
      int v11 = MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      int v46 = "AVVCSessionManager.mm";
      __int16 v47 = 1024;
      int v48 = 1049;
      __int16 v49 = 2080;
      v50 = "setSessionSampleRateForActivationMode";
      __int16 v51 = 1024;
      int v52 = 0;
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

    return 0;
  }
  ElapsedTime::ElapsedTime((ElapsedTime *)buf, "-[AVVCSessionManager setSessionSampleRateForActivationMode:]", "setSessionSampleRateForActivationMode", 0);
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v5 = IsSerializationEnabled(void)::enable;
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  int v7 = 0;
  if ((IsPluginActivationContext(a3) & 1) != 0 || a3 == 1684108899) {
    goto LABEL_61;
  }
  [(AVAudioSession *)self->_audioSession sampleRate];
  uint64_t v9 = *(void *)&v8;
  if (a3 == 1986357346)
  {
    if (v8 != 24000.0)
    {
      if (kAVVCScope)
      {
        int v10 = *(id *)kAVVCScope;
        if (!v10) {
          goto LABEL_37;
        }
      }
      else
      {
        int v10 = MEMORY[0x1E4F14500];
        id v16 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)uint64_t v37 = 136315394;
        uint64_t v38 = "AVVCSessionManager.mm";
        __int16 v39 = 1024;
        int v40 = 1063;
        _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVVCSessionManager::setSessionSampleRateForActivationMode: forcing 22050k audio for car audio", v37, 0x12u);
      }

LABEL_37:
      audioSession = self->_audioSession;
      id v36 = 0;
      BOOL v18 = [(AVAudioSession *)audioSession setPreferredSampleRate:&v36 error:24000.0];
      id v19 = v36;
      id v15 = v19;
      if (!v18)
      {
        int v7 = [v19 code];
        char v20 = CALog::LogObjIfEnabled(1, kAVVCScope);
        id v14 = v20;
        if (!v20 || !os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          goto LABEL_59;
        }
        *(_DWORD *)uint64_t v37 = 136315650;
        uint64_t v38 = "AVVCSessionManager.mm";
        __int16 v39 = 1024;
        int v40 = 1066;
        __int16 v41 = 2112;
        uint64_t v42 = (uint64_t)v15;
        id v21 = "%25s:%-5d ERROR: AVVCSessionManager::setPreferredSampleRate for VehicleButtonPress : %@";
        id v22 = v14;
        uint32_t v23 = 28;
        goto LABEL_50;
      }
      goto LABEL_46;
    }
    if (kAVVCScope)
    {
      id v14 = *(id *)kAVVCScope;
      if (!v14)
      {
LABEL_32:
        id v15 = 0;
        goto LABEL_46;
      }
    }
    else
    {
      id v14 = MEMORY[0x1E4F14500];
      id v33 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v37 = 136315394;
      uint64_t v38 = "AVVCSessionManager.mm";
      __int16 v39 = 1024;
      int v40 = 1070;
      int v30 = "%25s:%-5d AVVCSessionManager::setSessionSampleRateForActivationMode: No change - not setting preferred sample rate. No op.";
      __int16 v31 = v14;
      uint32_t v32 = 18;
      goto LABEL_57;
    }
    goto LABEL_58;
  }
  if (v8 >= 22050.0)
  {
    if (kAVVCScope)
    {
      id v14 = *(id *)kAVVCScope;
      if (!v14) {
        goto LABEL_32;
      }
    }
    else
    {
      id v14 = MEMORY[0x1E4F14500];
      id v29 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v37 = 136315650;
      uint64_t v38 = "AVVCSessionManager.mm";
      __int16 v39 = 1024;
      int v40 = 1084;
      __int16 v41 = 2048;
      uint64_t v42 = v9;
      int v30 = "%25s:%-5d AVVCSessionManager::setSessionSampleRateForActivationMode: SR remains at %f";
      __int16 v31 = v14;
      uint32_t v32 = 28;
LABEL_57:
      _os_log_impl(&dword_19D794000, v31, OS_LOG_TYPE_DEFAULT, v30, v37, v32);
    }
LABEL_58:
    id v15 = 0;
    int v7 = 0;
    goto LABEL_59;
  }
  if (kAVVCScope)
  {
    id v12 = *(id *)kAVVCScope;
    if (!v12) {
      goto LABEL_45;
    }
  }
  else
  {
    id v12 = MEMORY[0x1E4F14500];
    id v24 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v37 = 136315906;
    uint64_t v38 = "AVVCSessionManager.mm";
    __int16 v39 = 1024;
    int v40 = 1076;
    __int16 v41 = 2048;
    uint64_t v42 = v9;
    __int16 v43 = 2048;
    uint64_t v44 = 0x40D5888000000000;
    _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionSampleRateForActivationMode: SR changes from %f to %f", v37, 0x26u);
  }

LABEL_45:
  __int16 v25 = self->_audioSession;
  id v35 = 0;
  BOOL v26 = [(AVAudioSession *)v25 setPreferredSampleRate:&v35 error:22050.0];
  id v27 = v35;
  id v15 = v27;
  if (!v26)
  {
    int v7 = [v27 code];
    int v28 = CALog::LogObjIfEnabled(1, kAVVCScope);
    id v14 = v28;
    if (!v28 || !os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      goto LABEL_59;
    }
    *(_DWORD *)uint64_t v37 = 136315906;
    uint64_t v38 = "AVVCSessionManager.mm";
    __int16 v39 = 1024;
    int v40 = 1080;
    __int16 v41 = 2048;
    uint64_t v42 = 0x40D5888000000000;
    __int16 v43 = 2112;
    uint64_t v44 = (uint64_t)v15;
    id v21 = "%25s:%-5d ERROR: AVVCSessionManager::setPreferredSampleRate to %f : %@";
    id v22 = v14;
    uint32_t v23 = 38;
LABEL_50:
    _os_log_impl(&dword_19D794000, v22, OS_LOG_TYPE_ERROR, v21, v37, v23);
LABEL_59:

    goto LABEL_60;
  }
LABEL_46:
  int v7 = 0;
LABEL_60:

LABEL_61:
  if (v5) {
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)buf);
  return v7;
}

- (int)setSessionAudioHWControlFlagsForActivationMode:(int64_t)a3 withOptions:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      int v10 = *(id *)kAVVCScope;
      if (!v10) {
        return 0;
      }
    }
    else
    {
      int v10 = MEMORY[0x1E4F14500];
      id v17 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v101 = "AVVCSessionManager.mm";
      __int16 v102 = 1024;
      int v103 = 815;
      __int16 v104 = 2080;
      v105 = "setSessionAudioHWControlFlagsForActivationMode";
      __int16 v106 = 1024;
      int v107 = 0;
      _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

    return 0;
  }
  ElapsedTime::ElapsedTime((ElapsedTime *)buf, "-[AVVCSessionManager setSessionAudioHWControlFlagsForActivationMode:withOptions:]", "setSessionAudioHWControlFlagsFromActivationMode", 0);
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v7 = IsSerializationEnabled(void)::enable;
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  self->mSessionActivationOptions &= ~0x4000u;
  if (MGGetSInt32Answer() == 4 && (MGGetBoolAnswer() & 1) == 0)
  {
    if (IsPluginActivationContext(a3))
    {
      if (self->mPreviousHardwareControlFlags != 0x100000)
      {
        audioSession = self->_audioSession;
        id v92 = 0;
        char v13 = [(AVAudioSession *)audioSession setAudioHardwareControlFlags:0x100000 error:&v92];
        id v14 = (uint8_t *)v92;
        id v15 = v14;
        if (v13)
        {
          int v16 = 0;
          self->mPreviousHardwareControlFlags = 0x100000;
        }
        else
        {
          int v16 = [(uint8_t *)v14 code];
          id v35 = CALog::LogObjIfEnabled(1, kAVVCScope);
          id v36 = v35;
          if (v35 && os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v94 = 136315650;
            v95 = "AVVCSessionManager.mm";
            __int16 v96 = 1024;
            int v97 = 837;
            __int16 v98 = 2112;
            v99 = v15;
            _os_log_impl(&dword_19D794000, v36, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setAudioHardwareControlFlags (ATV + Plugin) : %@", v94, 0x1Cu);
          }
        }
        goto LABEL_105;
      }
      goto LABEL_104;
    }
    if (kAVVCScope)
    {
      uint32_t v23 = *(id *)kAVVCScope;
      if (!v23) {
        goto LABEL_104;
      }
    }
    else
    {
      uint32_t v23 = MEMORY[0x1E4F14500];
      id v27 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v94 = 136315394;
      v95 = "AVVCSessionManager.mm";
      __int16 v96 = 1024;
      int v97 = 843;
      _os_log_impl(&dword_19D794000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setSessionAudioHWControlFlags: Take Audio HW control on tvOS", v94, 0x12u);
    }
    goto LABEL_56;
  }
  if (self->mDeviceIsIOSAccessory)
  {
    if (kAVVCScope)
    {
      uint64_t v9 = *(id *)kAVVCScope;
      if (!v9) {
        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v9 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v94 = 136315394;
      v95 = "AVVCSessionManager.mm";
      __int16 v96 = 1024;
      int v97 = 854;
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d setSessionAudioHWControlFlags: iOS Audio Accessory Product (HomePod), setting volume desired HW control flag.", v94, 0x12u);
    }

LABEL_34:
    if (self->mPreviousHardwareControlFlags == 0x100000)
    {
LABEL_104:
      int v16 = 0;
      goto LABEL_105;
    }
    id v19 = self->_audioSession;
    id v91 = 0;
    char v20 = [(AVAudioSession *)v19 setAudioHardwareControlFlags:0x100000 error:&v91];
    id v21 = v91;
    id v22 = v21;
    if (v20)
    {
      self->mPreviousHardwareControlFlags = 0x100000;

      goto LABEL_104;
    }
    int v16 = [v21 code];
    if (kAVVCScope)
    {
      id v24 = *(id *)kAVVCScope;
      if (!v24)
      {
LABEL_61:

        goto LABEL_105;
      }
    }
    else
    {
      id v24 = MEMORY[0x1E4F14500];
      id v28 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v94 = 136315650;
      v95 = "AVVCSessionManager.mm";
      __int16 v96 = 1024;
      int v97 = 860;
      __int16 v98 = 2112;
      v99 = (uint8_t *)v22;
      _os_log_impl(&dword_19D794000, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setAudioHardwareControlFlags (HomePod) : %@", v94, 0x1Cu);
    }

    goto LABEL_61;
  }
  if (!self->mDeviceIsOlderWatch)
  {
    if (self->mSessionOutputIsWirelessSplitter)
    {
      if (kAVVCScope)
      {
        __int16 v25 = *(id *)kAVVCScope;
        if (!v25) {
          goto LABEL_82;
        }
      }
      else
      {
        __int16 v25 = MEMORY[0x1E4F14500];
        id v37 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v94 = 136315394;
        v95 = "AVVCSessionManager.mm";
        __int16 v96 = 1024;
        int v97 = 880;
        _os_log_impl(&dword_19D794000, v25, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionAudioHWControlFlags: wireless splitter mode, no volume control, yes routing control.", v94, 0x12u);
      }

LABEL_82:
      if (self->mPreviousHardwareControlFlags != 2)
      {
        uint64_t v38 = self->_audioSession;
        id v90 = 0;
        char v39 = [(AVAudioSession *)v38 setAudioHardwareControlFlags:2 error:&v90];
        int v40 = (uint8_t *)v90;
        __int16 v41 = v40;
        if ((v39 & 1) == 0)
        {
          int v16 = [(uint8_t *)v40 code];
          int v48 = CALog::LogObjIfEnabled(1, kAVVCScope);
          __int16 v49 = v48;
          if (v48 && os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v94 = 136315650;
            v95 = "AVVCSessionManager.mm";
            __int16 v96 = 1024;
            int v97 = 886;
            __int16 v98 = 2112;
            v99 = v41;
            _os_log_impl(&dword_19D794000, v49, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setAudioHardwareControlFlags (wireless splitter) : %@", v94, 0x1Cu);
          }

          goto LABEL_105;
        }
        self->mPreviousHardwareControlFlags = 2;
      }
      goto LABEL_104;
    }
    BOOL v30 = a3 == 1987012963 || a3 == 1751414371;
    if ((v4 & 1) != 0 && v30)
    {
      if (self->mPreviousHardwareControlFlags)
      {
        __int16 v31 = self->_audioSession;
        id v89 = 0;
        char v32 = [(AVAudioSession *)v31 setAudioHardwareControlFlags:0 error:&v89];
        id v33 = (uint8_t *)v89;
        __int16 v34 = v33;
        if (v32)
        {
          int v16 = 0;
          self->mPreviousHardwareControlFlags = 0;
        }
        else
        {
          int v16 = [(uint8_t *)v33 code];
          long long v57 = CALog::LogObjIfEnabled(1, kAVVCScope);
          long long v58 = v57;
          if (v57 && os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v94 = 136315650;
            v95 = "AVVCSessionManager.mm";
            __int16 v96 = 1024;
            int v97 = 905;
            __int16 v98 = 2112;
            v99 = v34;
            _os_log_impl(&dword_19D794000, v58, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setAudioHardwareControlFlags : %@", v94, 0x1Cu);
          }
        }
      }
      else
      {
        __int16 v34 = 0;
        int v16 = 0;
      }
      long long v59 = CALog::LogObjIfEnabled(3, kAVVCScope);
      long long v60 = v59;
      if (v59)
      {
        long long v61 = v59;
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          CAX4CCString::CAX4CCString((CAX4CCString *)v93, a3);
          *(_DWORD *)v94 = 136315650;
          v95 = "AVVCSessionManager.mm";
          __int16 v96 = 1024;
          int v97 = 910;
          __int16 v98 = 2080;
          v99 = v93;
          _os_log_impl(&dword_19D794000, v61, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setAudioHardwareControlFlags: announce mode for %s context - set HW control flags to 0", v94, 0x1Cu);
        }
      }
      goto LABEL_105;
    }
    if (self->mShouldEnableMiniDucking)
    {
      uint64_t v42 = CALog::LogObjIfEnabled(3, kAVVCScope);
      __int16 v43 = v42;
      if (v42 && os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v94 = 136315394;
        v95 = "AVVCSessionManager.mm";
        __int16 v96 = 1024;
        int v97 = 915;
        _os_log_impl(&dword_19D794000, v43, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionAudioHWControlFlags: mini-ducking enabled. Not setting volume control flag", v94, 0x12u);
      }

      if (self->mPreviousHardwareControlFlags != 2)
      {
        uint64_t v44 = self->_audioSession;
        id v88 = 0;
        char v45 = [(AVAudioSession *)v44 setAudioHardwareControlFlags:2 error:&v88];
        int v46 = (uint8_t *)v88;
        __int16 v47 = v46;
        if ((v45 & 1) == 0)
        {
          int v16 = [(uint8_t *)v46 code];
          long long v62 = CALog::LogObjIfEnabled(1, kAVVCScope);
          long long v63 = v62;
          if (v62 && os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v94 = 136315650;
            v95 = "AVVCSessionManager.mm";
            __int16 v96 = 1024;
            int v97 = 921;
            __int16 v98 = 2112;
            v99 = v47;
            _os_log_impl(&dword_19D794000, v63, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setAudioHardwareControlFlags (enable mini-ducking) : %@", v94, 0x1Cu);
          }

          goto LABEL_105;
        }
        self->mPreviousHardwareControlFlags = 2;
      }
      goto LABEL_104;
    }
    if (self->mShouldDisableMiniDucking)
    {
      v50 = CALog::LogObjIfEnabled(3, kAVVCScope);
      __int16 v51 = v50;
      if (v50 && os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v94 = 136315394;
        v95 = "AVVCSessionManager.mm";
        __int16 v96 = 1024;
        int v97 = 930;
        _os_log_impl(&dword_19D794000, v51, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionAudioHWControlFlags: disable mini-ducking. Set all HW control flags", v94, 0x12u);
      }

      if (self->mPreviousHardwareControlFlags != 18)
      {
        int v52 = self->_audioSession;
        id v87 = 0;
        char v53 = [(AVAudioSession *)v52 setAudioHardwareControlFlags:18 error:&v87];
        char v54 = (uint8_t *)v87;
        v55 = v54;
        if ((v53 & 1) == 0)
        {
          int v16 = [(uint8_t *)v54 code];
          __int16 v71 = CALog::LogObjIfEnabled(1, kAVVCScope);
          id v72 = v71;
          if (v71 && os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v94 = 136315650;
            v95 = "AVVCSessionManager.mm";
            __int16 v96 = 1024;
            int v97 = 937;
            __int16 v98 = 2112;
            v99 = v55;
            _os_log_impl(&dword_19D794000, v72, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setAudioHardwareControlFlags (disable mini-ducking) : %@", v94, 0x1Cu);
          }

          goto LABEL_105;
        }
        self->mPreviousHardwareControlFlags = 18;
      }
      goto LABEL_104;
    }
    BOOL mSessionNeedsVolumeControl = self->mSessionNeedsVolumeControl;
    if (a3 == 1651795060)
    {
      if (self->mSessionNeedsVolumeControl)
      {
LABEL_162:
        unint64_t v70 = 18;
        goto LABEL_163;
      }
      goto LABEL_151;
    }
    if (a3 == 1987012963)
    {
      v65 = [(AVAudioSession *)self->_audioSession currentRoute];
      v66 = [v65 outputs];
      BOOL v67 = [(AVVCSessionManager *)self isAirplayOneOfTheOutputRoutes:v66];

      if (v67)
      {
        self->mSessionActivationOptions |= 0x4000u;
        int v68 = CALog::LogObjIfEnabled(3, kAVVCScope);
        __int16 v69 = v68;
        if (v68 && os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v94 = 136315394;
          v95 = "AVVCSessionManager.mm";
          __int16 v96 = 1024;
          int v97 = 971;
          _os_log_impl(&dword_19D794000, v69, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionAudioHWControlFlags: will not take control of hardware upon activation for AirPlay output (voic/rais)", v94, 0x12u);
        }

        unint64_t v70 = 0;
        goto LABEL_163;
      }
      uint64_t v76 = CALog::LogObjIfEnabled(3, kAVVCScope);
      id v74 = v76;
      if (!v76 || !os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_161;
      }
      *(_DWORD *)v94 = 136315394;
      v95 = "AVVCSessionManager.mm";
      __int16 v96 = 1024;
      int v97 = 979;
      __int16 v75 = "%25s:%-5d AVVCSessionManager::setSessionAudioHWControlFlags: setting volume/routing required hardware contro"
            "l flag for 'voic' activation mode (output is not Airplay)";
      goto LABEL_160;
    }
    if (IsPluginActivationContext(a3))
    {
LABEL_136:
      __int16 v73 = CALog::LogObjIfEnabled(3, kAVVCScope);
      id v74 = v73;
      if (mSessionNeedsVolumeControl)
      {
        if (!v73 || !os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_161;
        }
        *(_DWORD *)v94 = 136315394;
        v95 = "AVVCSessionManager.mm";
        __int16 v96 = 1024;
        int v97 = 996;
        __int16 v75 = "%25s:%-5d AVVCSessionManager::setSessionAudioHWControlFlags: (plugin activation context / (post->hdvc) : s"
              "et all hw control flags";
LABEL_160:
        _os_log_impl(&dword_19D794000, v74, OS_LOG_TYPE_DEFAULT, v75, v94, 0x12u);
LABEL_161:

        goto LABEL_162;
      }
      if (v73 && os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v94 = 136315394;
        v95 = "AVVCSessionManager.mm";
        __int16 v96 = 1024;
        int v97 = 999;
        _os_log_impl(&dword_19D794000, v74, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionAudioHWControlFlags: (plugin activation context / (post->hdvc) : not setting volume control flag", v94, 0x12u);
      }

LABEL_151:
      unint64_t v70 = 2;
LABEL_163:
      if (v70 == self->mPreviousHardwareControlFlags)
      {
        __int16 v79 = CALog::LogObjIfEnabled(3, kAVVCScope);
        int v80 = v79;
        if (v79 && os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v94 = 136315394;
          v95 = "AVVCSessionManager.mm";
          __int16 v96 = 1024;
          int v97 = 1034;
          _os_log_impl(&dword_19D794000, v80, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionAudioHWControlFlags: No change - not setting hardware control flags. No op.", v94, 0x12u);
        }
        int v16 = 0;
      }
      else
      {
        v81 = self->_audioSession;
        id v86 = 0;
        char v82 = [(AVAudioSession *)v81 setAudioHardwareControlFlags:v70 error:&v86];
        uint64_t v83 = v86;
        int v80 = v83;
        if (v82)
        {
          int v16 = 0;
          self->mPreviousHardwareControlFlags = v70;
        }
        else
        {
          int v16 = [v83 code];
          v84 = CALog::LogObjIfEnabled(1, kAVVCScope);
          v85 = v84;
          if (v84 && os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v94 = 136315650;
            v95 = "AVVCSessionManager.mm";
            __int16 v96 = 1024;
            int v97 = 1028;
            __int16 v98 = 2112;
            v99 = (uint8_t *)v80;
            _os_log_impl(&dword_19D794000, v85, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setAudioHardwareControlFlags : %@", v94, 0x1Cu);
          }
        }
      }

      goto LABEL_105;
    }
    if (a3 != 1635087471)
    {
      if (a3 == 1886352244 && self->mPreviousActivationMode == 1751414371) {
        goto LABEL_136;
      }
LABEL_157:
      id v78 = CALog::LogObjIfEnabled(3, kAVVCScope);
      id v74 = v78;
      if (!v78 || !os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_161;
      }
      *(_DWORD *)v94 = 136315394;
      v95 = "AVVCSessionManager.mm";
      __int16 v96 = 1024;
      int v97 = 1010;
      __int16 v75 = "%25s:%-5d AVVCSessionManager::setSessionAudioHWControlFlags: default mode - set all HW control flags";
      goto LABEL_160;
    }
    if (!self->mIsMiniDuckingEnabled) {
      goto LABEL_157;
    }
    __int16 v77 = CALog::LogObjIfEnabled(3, kAVVCScope);
    uint32_t v23 = v77;
    if (v77 && os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v94 = 136315394;
      v95 = "AVVCSessionManager.mm";
      __int16 v96 = 1024;
      int v97 = 1004;
      _os_log_impl(&dword_19D794000, v23, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionAudioHWControlFlags: post followed by BluetoothVoiceTrigger (or auto context) should not control volume, so not setting any hw control flags.", v94, 0x12u);
    }
LABEL_56:

    goto LABEL_104;
  }
  if (!kAVVCScope)
  {
    int v11 = MEMORY[0x1E4F14500];
    id v26 = MEMORY[0x1E4F14500];
    goto LABEL_48;
  }
  int v11 = *(id *)kAVVCScope;
  if (v11)
  {
LABEL_48:
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v94 = 136315394;
      v95 = "AVVCSessionManager.mm";
      __int16 v96 = 1024;
      int v97 = 872;
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionAudioHWControlFlags on older watch hardware: will never take control of HW on activation", v94, 0x12u);
    }
  }
  if (a3 == 1768780647) {
    goto LABEL_104;
  }
  int v16 = 0;
  self->mSessionActivationOptions |= 0x4000u;
LABEL_105:
  if (v7) {
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)buf);
  return v16;
}

- (int)setSessionCategoryModeOptionsForActivationMode:(int64_t)a3 withOptions:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      uint64_t v9 = *(id *)kAVVCScope;
      if (!v9) {
        return 0;
      }
    }
    else
    {
      uint64_t v9 = MEMORY[0x1E4F14500];
      id v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      id v91 = "AVVCSessionManager.mm";
      __int16 v92 = 1024;
      int v93 = 614;
      __int16 v94 = 2080;
      v95 = "setSessionCategoryModeOptionsForActivationMode";
      __int16 v96 = 1024;
      int v97 = 0;
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

    return 0;
  }
  ElapsedTime::ElapsedTime((ElapsedTime *)buf, "-[AVVCSessionManager setSessionCategoryModeOptionsForActivationMode:withOptions:]", "setSessionCategoryModeOptionsFromActivationMode", 0);
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v7 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (self->mDeviceIsIOSAccessory)
  {
    self->BOOL mShouldDuckOthers = 1;
    if (kAVVCScope)
    {
      double v8 = *(id *)kAVVCScope;
      if (!v8) {
        goto LABEL_40;
      }
    }
    else
    {
      double v8 = MEMORY[0x1E4F14500];
      id v10 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v74 = 136315394;
      __int16 v75 = "AVVCSessionManager.mm";
      __int16 v76 = 1024;
      int v77 = 629;
      int v11 = "%25s:%-5d AVVCSessionManager::setSessionCategoryModeOptions: on 'audioOS'. Duck others.";
LABEL_38:
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEFAULT, v11, v74, 0x12u);
      goto LABEL_39;
    }
    goto LABEL_39;
  }
  if (!self->mDeviceIsOlderWatch)
  {
    if (![(AVVCSessionManager *)self isSessionOutputInWirelessSplitterMode])
    {
      [(AVVCSessionManager *)self getHypotheticalRouteAndUpdateStates];
      goto LABEL_40;
    }
    self->BOOL mShouldDuckOthers = 0;
    if (kAVVCScope)
    {
      double v8 = *(id *)kAVVCScope;
      if (!v8) {
        goto LABEL_39;
      }
    }
    else
    {
      double v8 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v74 = 136315394;
      __int16 v75 = "AVVCSessionManager.mm";
      __int16 v76 = 1024;
      int v77 = 639;
      int v11 = "%25s:%-5d AVVCSessionManager::setSessionCategoryModeOptions: (wireless splitter mode). Interrupt others.";
      goto LABEL_38;
    }
    goto LABEL_39;
  }
  self->BOOL mShouldDuckOthers = 0;
  if (!kAVVCScope)
  {
    double v8 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
LABEL_32:
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v74 = 136315394;
      __int16 v75 = "AVVCSessionManager.mm";
      __int16 v76 = 1024;
      int v77 = 634;
      int v11 = "%25s:%-5d AVVCSessionManager::setSessionCategoryModeOptions: on older watchOS. Interrupt others.";
      goto LABEL_38;
    }
LABEL_39:

    goto LABEL_40;
  }
  double v8 = *(id *)kAVVCScope;
  if (v8) {
    goto LABEL_32;
  }
LABEL_40:
  BOOL mShouldDuckOthers = self->mShouldDuckOthers;
  if (a3 > 1768764004)
  {
    if (a3 != 1768764005 && a3 != 1768780647) {
      goto LABEL_54;
    }
    id v17 = (id)*MEMORY[0x1E4F4E7F0];
    id v18 = (id)*MEMORY[0x1E4F4E918];
    if (kAVVCScope)
    {
      char v20 = *(id *)kAVVCScope;
      if (!v20)
      {
LABEL_66:
        BOOL v25 = 0;
        int v22 = 1;
        unint64_t v21 = 12;
        goto LABEL_78;
      }
    }
    else
    {
      char v20 = MEMORY[0x1E4F14500];
      id v26 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id v74 = 136315394;
      __int16 v75 = "AVVCSessionManager.mm";
      __int16 v76 = 1024;
      int v77 = 685;
      _os_log_impl(&dword_19D794000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVVCSessionManager::setSessionCategoryModeOptions: iMessage -- setting P&R category, clearing preferred input, etc.", v74, 0x12u);
    }

    goto LABEL_66;
  }
  if (a3 != 1651797093)
  {
    if (a3 == 1752396914)
    {
      id v17 = (id)*MEMORY[0x1E4F4E7F0];
      id v18 = (id)*MEMORY[0x1E4F4E8F0];
      if (kAVVCScope)
      {
        id v19 = *(id *)kAVVCScope;
        if (!v19)
        {
LABEL_71:
          int v22 = 0;
          BOOL v25 = 0;
LABEL_72:
          unint64_t v21 = 4;
          goto LABEL_78;
        }
      }
      else
      {
        id v19 = MEMORY[0x1E4F14500];
        id v27 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v74 = 136315394;
        __int16 v75 = "AVVCSessionManager.mm";
        __int16 v76 = 1024;
        int v77 = 664;
        _os_log_impl(&dword_19D794000, v19, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionCategoryModeOptions: Interrupt other audio during Siri Training", v74, 0x12u);
      }

      goto LABEL_71;
    }
LABEL_54:
    if (!self->mDeviceIsIOSAccessory && !self->mDeviceIsOlderWatch && supportsCarPlayMixableStream())
    {
      uint32_t v23 = CALog::LogObjIfEnabled(3, kAVVCScope);
      id v24 = v23;
      if (v23 && os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v74 = 136315394;
        __int16 v75 = "AVVCSessionManager.mm";
        __int16 v76 = 1024;
        int v77 = 693;
        _os_log_impl(&dword_19D794000, v24, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionCategoryModeOptions: Carplay Supports Mixable Siri", v74, 0x12u);
      }

      BOOL mShouldDuckOthers = 1;
    }
    id v17 = (id)*MEMORY[0x1E4F4E7F0];
    id v18 = (id)*MEMORY[0x1E4F4E8F0];
    int v22 = 0;
    BOOL v25 = mShouldDuckOthers;
    goto LABEL_72;
  }
  id v17 = (id)*MEMORY[0x1E4F4E7F8];
  id v18 = (id)*MEMORY[0x1E4F4E8A8];
  if (!kAVVCScope)
  {
    unint64_t v21 = MEMORY[0x1E4F14500];
    id v28 = MEMORY[0x1E4F14500];
    goto LABEL_74;
  }
  unint64_t v21 = (unint64_t)*(id *)kAVVCScope;
  if (v21)
  {
LABEL_74:
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id v74 = 136315394;
      __int16 v75 = "AVVCSessionManager.mm";
      __int16 v76 = 1024;
      int v77 = 675;
      _os_log_impl(&dword_19D794000, (os_log_t)v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d AVVCSessionManager::setSessionCategoryModeOptions: ATV Activation  -- setting Playback category and Duck/Mix Options.", v74, 0x12u);
    }

    int v22 = 0;
    unint64_t v21 = 0;
    goto LABEL_77;
  }
  int v22 = 0;
LABEL_77:
  BOOL v25 = 1;
LABEL_78:
  BOOL v30 = a3 == 1987012963 || a3 == 1751414371;
  if ((v4 & 1) != 0 && v30)
  {
    if (kAVVCScope)
    {
      id v31 = *(id *)kAVVCScope;
      if (!v31) {
        goto LABEL_95;
      }
    }
    else
    {
      id v31 = (id)MEMORY[0x1E4F14500];
      id v32 = MEMORY[0x1E4F14500];
    }
    id v33 = v31;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v89, a3);
      *(_DWORD *)id v74 = 136315650;
      __int16 v75 = "AVVCSessionManager.mm";
      __int16 v76 = 1024;
      int v77 = 718;
      __int16 v78 = 2080;
      *(void *)__int16 v79 = v89;
      _os_log_impl(&dword_19D794000, v33, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionCategoryModeOptions: announce mode for %s context - duck others", v74, 0x1Cu);
    }

    goto LABEL_95;
  }
  if (v25) {
LABEL_95:
  }
    v21 |= 0x13uLL;
  BOOL v34 = -[NSString isEqualToString:](self->mPreviousSessionCategory, "isEqualToString:", v17, p_mSessionManagerLock);
  if ((v34 & [(NSString *)self->mPreviousSessionMode isEqualToString:v18] & 1) == 0)
  {
    if (kAVVCScope)
    {
      id v36 = *(id *)kAVVCScope;
      if (!v36)
      {
LABEL_111:
        audioSession = self->_audioSession;
        id v73 = 0;
        BOOL v44 = [(AVAudioSession *)audioSession setCategory:v17 mode:v18 routeSharingPolicy:0 options:v21 error:&v73];
        char v45 = v73;
        id v35 = v45;
        if (v44)
        {
          objc_storeStrong((id *)&self->mPreviousSessionCategory, v17);
          objc_storeStrong((id *)&self->mPreviousSessionMode, v18);
LABEL_126:
          int v13 = 0;
          self->unint64_t mPreviousSessionCategoryOptions = v21;
          goto LABEL_138;
        }
        int v13 = [v45 code];
        if (kAVVCScope)
        {
          int v46 = *(id *)kAVVCScope;
          if (!v46) {
            goto LABEL_138;
          }
        }
        else
        {
          int v46 = MEMORY[0x1E4F14500];
          id v61 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)id v74 = 136315650;
          __int16 v75 = "AVVCSessionManager.mm";
          __int16 v76 = 1024;
          int v77 = 748;
          __int16 v78 = 2112;
          *(void *)__int16 v79 = v35;
          _os_log_impl(&dword_19D794000, v46, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setSessionCategoryModeOptions: setCategoryModeRouteSharingPolicyOptions failed with error: %@", v74, 0x1Cu);
        }

        goto LABEL_138;
      }
    }
    else
    {
      id v36 = MEMORY[0x1E4F14500];
      id v38 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      mPreviousSessionCategory = self->mPreviousSessionCategory;
      mPreviousSessionMode = self->mPreviousSessionMode;
      unint64_t mPreviousSessionCategoryOptions = self->mPreviousSessionCategoryOptions;
      int64_t mPreviousActivationMode = self->mPreviousActivationMode;
      *(_DWORD *)id v74 = 136317442;
      __int16 v75 = "AVVCSessionManager.mm";
      __int16 v76 = 1024;
      int v77 = 739;
      __int16 v78 = 2112;
      *(void *)__int16 v79 = v17;
      *(_WORD *)&v79[8] = 2112;
      *(void *)&v79[10] = v18;
      *(_WORD *)&v79[18] = 1024;
      *(_DWORD *)&v79[20] = v21;
      __int16 v80 = 2112;
      *(void *)v81 = mPreviousSessionCategory;
      *(_WORD *)&v81[8] = 2112;
      char v82 = mPreviousSessionMode;
      __int16 v83 = 1024;
      int v84 = mPreviousSessionCategoryOptions;
      __int16 v85 = 1024;
      int v86 = a3;
      __int16 v87 = 1024;
      int v88 = mPreviousActivationMode;
      _os_log_impl(&dword_19D794000, v36, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionCategoryModeOptions: Setting new category: %@, mode: %@, options: 0x%x. Previous category: %@, mode: %@, options: 0x%x. (Current activation: %d, Previous activation: %d)", v74, 0x52u);
    }

    goto LABEL_111;
  }
  if (self->mPreviousSessionCategoryOptions == v21)
  {
    if (kAVVCScope)
    {
      id v35 = *(id *)kAVVCScope;
      if (!v35)
      {
LABEL_120:
        int v13 = 0;
        goto LABEL_138;
      }
    }
    else
    {
      id v35 = MEMORY[0x1E4F14500];
      id v47 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      int v48 = self->mPreviousSessionCategory;
      __int16 v49 = self->mPreviousSessionMode;
      unint64_t v50 = self->mPreviousSessionCategoryOptions;
      int64_t v51 = self->mPreviousActivationMode;
      *(_DWORD *)id v74 = 136316674;
      __int16 v75 = "AVVCSessionManager.mm";
      __int16 v76 = 1024;
      int v77 = 769;
      __int16 v78 = 2112;
      *(void *)__int16 v79 = v48;
      *(_WORD *)&v79[8] = 2112;
      *(void *)&v79[10] = v49;
      *(_WORD *)&v79[18] = 1024;
      *(_DWORD *)&v79[20] = v50;
      __int16 v80 = 1024;
      *(_DWORD *)v81 = a3;
      *(_WORD *)&v81[4] = 1024;
      *(_DWORD *)&v81[6] = v51;
      _os_log_impl(&dword_19D794000, v35, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionCategoryModeOptions: No change - category, mode and options are the same. No op. Current category: %@, mode: %@, options: 0x%x. (Current activation: %d, Previous activation: %d)", v74, 0x38u);
    }

    id v35 = 0;
    goto LABEL_120;
  }
  if (!kAVVCScope)
  {
    id v37 = MEMORY[0x1E4F14500];
    id v52 = MEMORY[0x1E4F14500];
    goto LABEL_122;
  }
  id v37 = *(id *)kAVVCScope;
  if (v37)
  {
LABEL_122:
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      char v53 = self->mPreviousSessionCategory;
      char v54 = self->mPreviousSessionMode;
      unint64_t v55 = self->mPreviousSessionCategoryOptions;
      int64_t v56 = self->mPreviousActivationMode;
      *(_DWORD *)id v74 = 136316930;
      __int16 v75 = "AVVCSessionManager.mm";
      __int16 v76 = 1024;
      int v77 = 759;
      __int16 v78 = 1024;
      *(_DWORD *)__int16 v79 = v21;
      *(_WORD *)&v79[4] = 2112;
      *(void *)&v79[6] = v53;
      *(_WORD *)&v79[14] = 2112;
      *(void *)&v79[16] = v54;
      __int16 v80 = 1024;
      *(_DWORD *)v81 = v55;
      *(_WORD *)&v81[4] = 1024;
      *(_DWORD *)&v81[6] = a3;
      LOWORD(v82) = 1024;
      *(_DWORD *)((char *)&v82 + 2) = v56;
      _os_log_impl(&dword_19D794000, v37, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionCategoryModeOptions: Setting new options: 0x%x. Previous category: %@, mode: %@, options: 0x%x. (Current activation: %d, Previous activation: %d)", v74, 0x3Eu);
    }
  }
  long long v57 = self->_audioSession;
  id v72 = 0;
  char v58 = [(AVAudioSession *)v57 setCategoryOptions:v21 error:&v72];
  long long v59 = v72;
  id v35 = v59;
  if (v58) {
    goto LABEL_126;
  }
  int v13 = [v59 code];
  if (kAVVCScope)
  {
    long long v60 = *(id *)kAVVCScope;
    if (!v60) {
      goto LABEL_138;
    }
  }
  else
  {
    long long v60 = MEMORY[0x1E4F14500];
    id v62 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)id v74 = 136315650;
    __int16 v75 = "AVVCSessionManager.mm";
    __int16 v76 = 1024;
    int v77 = 762;
    __int16 v78 = 2112;
    *(void *)__int16 v79 = v35;
    _os_log_impl(&dword_19D794000, v60, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setSessionCategoryModeOptions: setCategoryOptions failed with error: %@", v74, 0x1Cu);
  }

LABEL_138:
  if (v22)
  {
    long long v63 = self->_audioSession;
    __int16 v71 = v35;
    char v64 = [(AVAudioSession *)v63 clearInputPreferences:&v71];
    v65 = v71;

    if ((v64 & 1) == 0)
    {
      int v13 = [v65 code];
      if (kAVVCScope)
      {
        v66 = *(id *)kAVVCScope;
        if (!v66) {
          goto LABEL_148;
        }
      }
      else
      {
        v66 = MEMORY[0x1E4F14500];
        id v67 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id v74 = 136315650;
        __int16 v75 = "AVVCSessionManager.mm";
        __int16 v76 = 1024;
        int v77 = 775;
        __int16 v78 = 2112;
        *(void *)__int16 v79 = v65;
        _os_log_impl(&dword_19D794000, v66, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::clearInputPreferences failed with error: %@", v74, 0x1Cu);
      }
    }
  }
  else
  {
    v65 = v35;
  }
LABEL_148:

  if (v7) {
    std::recursive_mutex::unlock(v70);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)buf);
  return v13;
}

- (void)getHypotheticalRouteAndUpdateStates
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    ElapsedTime::ElapsedTime((ElapsedTime *)v26, "-[AVVCSessionManager getHypotheticalRouteAndUpdateStates]", "getHypotheticalRouteAndUpdateStates", 0);
    BOOL v3 = [(AVVCSessionManager *)self pickedRoute];
    if (kAVVCScope)
    {
      char v4 = *(id *)kAVVCScope;
      if (!v4) {
        goto LABEL_11;
      }
    }
    else
    {
      char v4 = MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315650;
      unint64_t v21 = "AVVCSessionManager.mm";
      __int16 v22 = 1024;
      int v23 = 531;
      __int16 v24 = 2112;
      v25[0] = v3;
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d pickedRoute from AudioSession: %@", (uint8_t *)&v20, 0x1Cu);
    }

LABEL_11:
    self->BOOL mIsOtherAudioPlaying = [(AVAudioSession *)self->_audioSession isOtherAudioPlaying];
    if (kAVVCScope)
    {
      int v6 = *(id *)kAVVCScope;
      if (!v6) {
        goto LABEL_18;
      }
    }
    else
    {
      int v6 = MEMORY[0x1E4F14500];
      id v7 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL mIsOtherAudioPlaying = self->mIsOtherAudioPlaying;
      int v20 = 136315650;
      unint64_t v21 = "AVVCSessionManager.mm";
      __int16 v22 = 1024;
      int v23 = 534;
      __int16 v24 = 1024;
      LODWORD(v25[0]) = mIsOtherAudioPlaying;
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d isSomeOtherAudioPlaying: %d", (uint8_t *)&v20, 0x18u);
    }

LABEL_18:
    uint64_t v9 = [v3 objectForKey:@"BTDetails_SupportsDoAP"];
    self->mRouteHasDoAPSupport = [v9 BOOLValue];

    if (_os_feature_enabled_impl()) {
      [v3 objectForKey:@"SoftwareVolumeEnabled"];
    }
    else {
    id v10 = [v3 objectForKey:@"BTDetails_SupportsSoftwareVolume"];
    }
    self->BOOL mOutputSupportsSWVolume = [v10 BOOLValue];

    if (self->mIsOtherAudioPlaying)
    {
      if (!self->mRouteHasDoAPSupport)
      {
        if (_os_feature_enabled_impl())
        {
          self->BOOL mShouldDuckOthers = self->mOutputSupportsSWVolume;
          if (kAVVCScope)
          {
            id v17 = *(id *)kAVVCScope;
            if (!v17) {
              goto LABEL_29;
            }
          }
          else
          {
            id v17 = MEMORY[0x1E4F14500];
            id v18 = MEMORY[0x1E4F14500];
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            BOOL mOutputSupportsSWVolume = self->mOutputSupportsSWVolume;
            int v20 = 136315650;
            unint64_t v21 = "AVVCSessionManager.mm";
            __int16 v22 = 1024;
            int v23 = 556;
            __int16 v24 = 1024;
            LODWORD(v25[0]) = mOutputSupportsSWVolume;
            _os_log_impl(&dword_19D794000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Non-BT route OutputSupportsVolume: %d", (uint8_t *)&v20, 0x18u);
          }

          goto LABEL_29;
        }
        self->BOOL mShouldDuckOthers = 0;
LABEL_29:
        BOOL v11 = 1;
LABEL_30:
        self->BOOL mSessionNeedsVolumeControl = v11;
        if (kAVVCScope)
        {
          int v13 = *(id *)kAVVCScope;
          if (!v13)
          {
LABEL_37:

            ElapsedTime::~ElapsedTime((ElapsedTime *)v26);
            return;
          }
        }
        else
        {
          int v13 = MEMORY[0x1E4F14500];
          id v14 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          BOOL mShouldDuckOthers = self->mShouldDuckOthers;
          BOOL mSessionNeedsVolumeControl = self->mSessionNeedsVolumeControl;
          int v20 = 136315906;
          unint64_t v21 = "AVVCSessionManager.mm";
          __int16 v22 = 1024;
          int v23 = 599;
          __int16 v24 = 1024;
          LODWORD(v25[0]) = mShouldDuckOthers;
          WORD2(v25[0]) = 1024;
          *(_DWORD *)((char *)v25 + 6) = mSessionNeedsVolumeControl;
          _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d shouldDuckOthers(%d), sessionNeedsVolumeControl(%d)", (uint8_t *)&v20, 0x1Eu);
        }

        goto LABEL_37;
      }
      if (self->mShouldEnableMiniDucking)
      {
        self->BOOL mShouldDuckOthers = 1;
        BOOL v11 = self->mOutputSupportsSWVolume;
        goto LABEL_30;
      }
    }
    else if (self->_sessionState == 7)
    {
      BOOL v12 = (LOBYTE(self->mPreviousSessionCategoryOptions) >> 1) & 1;
LABEL_28:
      self->BOOL mShouldDuckOthers = v12;
      goto LABEL_29;
    }
    LOBYTE(v12) = self->mOutputSupportsSWVolume;
    goto LABEL_28;
  }
}

- (BOOL)isMiniDuckingEnabled
{
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  if (IsSerializationEnabled(void)::enable)
  {
    p_mSessionManagerLock = &self->mSessionManagerLock;
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    BOOL mIsMiniDuckingEnabled = self->mIsMiniDuckingEnabled;
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  else
  {
    return self->mIsMiniDuckingEnabled;
  }
  return mIsMiniDuckingEnabled;
}

- (void)shouldEnableMiniDucking:(BOOL)a3 withOptions:(unint64_t)a4
{
  char v4 = a4;
  BOOL v5 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable) {
    return;
  }
  if (MGGetSInt32Answer() != 4 && !self->mDeviceIsIOSAccessory)
  {
    ElapsedTime::ElapsedTime((ElapsedTime *)buf, "-[AVVCSessionManager shouldEnableMiniDucking:withOptions:]", "shouldEnableMiniDucking", 0);
    if (IsSerializationEnabled(void)::onceToken != -1) {
      dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
    }
    int v9 = IsSerializationEnabled(void)::enable;
    p_mSessionManagerLock = &self->mSessionManagerLock;
    if (IsSerializationEnabled(void)::enable) {
      std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
    }
    if (self->mIsMiniDuckingEnabled == v5)
    {
      if (kAVVCScope)
      {
        BOOL v11 = *(id *)kAVVCScope;
        if (!v11) {
          goto LABEL_44;
        }
      }
      else
      {
        BOOL v11 = MEMORY[0x1E4F14500];
        id v19 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136315394;
        unint64_t v21 = "AVVCSessionManager.mm";
        __int16 v22 = 1024;
        int v23 = 478;
        _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d shouldEnableMiniDucking: No change, no-op", (uint8_t *)&v20, 0x12u);
      }

      goto LABEL_44;
    }
    if (v5)
    {
      BOOL mShouldEnableMiniDucking = 1;
      self->BOOL mShouldEnableMiniDucking = 1;
      p_mShouldDisableMiniDucking = &self->mShouldDisableMiniDucking;
    }
    else
    {
      BOOL mShouldEnableMiniDucking = self->mShouldEnableMiniDucking;
      if (!mShouldEnableMiniDucking)
      {
LABEL_43:
        self->BOOL mIsMiniDuckingEnabled = mShouldEnableMiniDucking;
LABEL_44:
        if (v9) {
          std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
        }
        ElapsedTime::~ElapsedTime((ElapsedTime *)buf);
        return;
      }
      *(_WORD *)&self->BOOL mShouldEnableMiniDucking = 256;
      p_mShouldDisableMiniDucking = &self->mShouldDisableMiniDucking;
      int64_t mPreviousActivationMode = self->mPreviousActivationMode;
      BOOL v16 = mPreviousActivationMode == 1987012963 || mPreviousActivationMode == 1751414371;
      if ((v4 & 1) != 0 && v16)
      {
        id v17 = CALog::LogObjIfEnabled(3, kAVVCScope);
        id v18 = v17;
        if (v17 && os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 136315394;
          unint64_t v21 = "AVVCSessionManager.mm";
          __int16 v22 = 1024;
          int v23 = 496;
          _os_log_impl(&dword_19D794000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d shouldEnableMiniDucking: Announce calls enabled. Will not set session properties while disabling miniDucking", (uint8_t *)&v20, 0x12u);
        }
      }
      else
      {
        -[AVVCSessionManager setSessionCategoryModeOptionsForActivationMode:withOptions:](self, "setSessionCategoryModeOptionsForActivationMode:withOptions:");
        [(AVVCSessionManager *)self setSessionAudioHWControlFlagsForActivationMode:self->mPreviousActivationMode withOptions:0];
      }
      BOOL mShouldEnableMiniDucking = 0;
    }
    BOOL *p_mShouldDisableMiniDucking = 0;
    goto LABEL_43;
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
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v25 = "AVVCSessionManager.mm";
    __int16 v26 = 1024;
    int v27 = 469;
    _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d shouldEnableMiniDucking not available on this device", buf, 0x12u);
  }
}

- (int)setSessionActivationContext:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      id v8 = *(id *)kAVVCScope;
      if (!v8)
      {
LABEL_19:
        int v10 = 0;
        goto LABEL_58;
      }
    }
    else
    {
      id v8 = MEMORY[0x1E4F14500];
      id v9 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      id v47 = "AVVCSessionManager.mm";
      __int16 v48 = 1024;
      int v49 = 419;
      __int16 v50 = 2080;
      int64_t v51 = "setSessionActivationContext";
      __int16 v52 = 1024;
      int v53 = 0;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

    goto LABEL_19;
  }
  ElapsedTime::ElapsedTime((ElapsedTime *)buf, "-[AVVCSessionManager setSessionActivationContext:]", "setSessionActivationContext", 0);
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v5 = IsSerializationEnabled(void)::enable;
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  if (!v4)
  {
    if (kAVVCScope)
    {
      id v7 = *(id *)kAVVCScope;
      if (!v7)
      {
LABEL_24:
        id v4 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
        goto LABEL_25;
      }
    }
    else
    {
      id v7 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v36 = 136315394;
      id v37 = "AVVCSessionManager.mm";
      __int16 v38 = 1024;
      int v39 = 425;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionActivationContext : passed 'nil' dictionary, creating empty one.", v36, 0x12u);
    }

    goto LABEL_24;
  }
LABEL_25:
  BOOL v12 = [v4 objectForKey:@"activation trigger"];
  signed int v13 = [v12 intValue];

  id v14 = [v4 objectForKey:@"activation device uid"];
  p_mPreviousActivationDeviceUID = &self->mPreviousActivationDeviceUID;
  int64_t mPreviousActivationMode = self->mPreviousActivationMode;
  char v17 = areNSStringsEqual(v14, self->mPreviousActivationDeviceUID);
  if (mPreviousActivationMode == v13) {
    char v18 = v17;
  }
  else {
    char v18 = 0;
  }
  if ((v18 & 1) == 0)
  {
    audioSession = self->_audioSession;
    id v33 = 0;
    char v21 = [(AVAudioSession *)audioSession setActivationContext:v4 error:&v33];
    __int16 v22 = v33;
    if (v21)
    {
      if (kAVVCScope)
      {
        id v23 = *(id *)kAVVCScope;
        if (!v23)
        {
LABEL_47:
          self->int64_t mPreviousActivationMode = v13;
          objc_storeStrong((id *)&self->mPreviousActivationDeviceUID, v14);
LABEL_48:
          int v10 = 0;
LABEL_54:

          goto LABEL_55;
        }
      }
      else
      {
        id v23 = (id)MEMORY[0x1E4F14500];
        id v28 = MEMORY[0x1E4F14500];
      }
      id v29 = v23;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        CAX4CCString::CAX4CCString((CAX4CCString *)v35, v13);
        CAX4CCString::CAX4CCString((CAX4CCString *)v34, self->mPreviousActivationMode);
        BOOL v30 = *p_mPreviousActivationDeviceUID;
        *(_DWORD *)id v36 = 136316418;
        id v37 = "AVVCSessionManager.mm";
        __int16 v38 = 1024;
        int v39 = 443;
        __int16 v40 = 2080;
        *(void *)__int16 v41 = v35;
        *(_WORD *)&v41[8] = 2112;
        *(void *)&v41[10] = v14;
        __int16 v42 = 2080;
        __int16 v43 = v34;
        __int16 v44 = 2112;
        char v45 = v30;
        _os_log_impl(&dword_19D794000, v29, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionActivationContext : Setting new activation context. Previous: { activationMode(%s), deviceUID(%@) }. Current: { activationMode(%s), deviceUID(%@) }.", v36, 0x3Au);
      }

      goto LABEL_47;
    }
    int v24 = [(AVAudioSession *)self->_audioSession opaqueSessionID];
    if (kAVVCScope)
    {
      BOOL v25 = *(id *)kAVVCScope;
      if (!v25)
      {
LABEL_53:
        int v10 = [v22 code];
        goto LABEL_54;
      }
    }
    else
    {
      BOOL v25 = MEMORY[0x1E4F14500];
      id v31 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v36 = 136315906;
      id v37 = "AVVCSessionManager.mm";
      __int16 v38 = 1024;
      int v39 = 439;
      __int16 v40 = 1024;
      *(_DWORD *)__int16 v41 = v24;
      *(_WORD *)&v41[4] = 2112;
      *(void *)&v41[6] = v22;
      _os_log_impl(&dword_19D794000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setActivationContext of sessionID(0x%x) failed with error: %@", v36, 0x22u);
    }

    goto LABEL_53;
  }
  if (!kAVVCScope)
  {
    id v19 = (id)MEMORY[0x1E4F14500];
    id v26 = MEMORY[0x1E4F14500];
    goto LABEL_40;
  }
  id v19 = *(id *)kAVVCScope;
  if (v19)
  {
LABEL_40:
    __int16 v22 = v19;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      CAX4CCString::CAX4CCString((CAX4CCString *)v35, v13);
      CAX4CCString::CAX4CCString((CAX4CCString *)v34, self->mPreviousActivationMode);
      int v27 = *p_mPreviousActivationDeviceUID;
      *(_DWORD *)id v36 = 136316418;
      id v37 = "AVVCSessionManager.mm";
      __int16 v38 = 1024;
      int v39 = 449;
      __int16 v40 = 2080;
      *(void *)__int16 v41 = v35;
      *(_WORD *)&v41[8] = 2112;
      *(void *)&v41[10] = v14;
      __int16 v42 = 2080;
      __int16 v43 = v34;
      __int16 v44 = 2112;
      char v45 = v27;
      _os_log_impl(&dword_19D794000, v22, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCSessionManager::setSessionActivationContext : No change - not setting activationMode and deviceUID. Previous: { activationMode(%s), deviceUID(%@) }. Current: { activationMode(%s), deviceUID(%@) }. No op.", v36, 0x3Au);
    }

    goto LABEL_48;
  }
  int v10 = 0;
LABEL_55:

  if (v5) {
    std::recursive_mutex::unlock((std::recursive_mutex *)p_mSessionManagerLock);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)buf);
LABEL_58:

  return v10;
}

- (int)setupOneTimeSessionSettingsForClient:(int64_t)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  if (isAudioSessionAvailable(void)::onceToken != -1) {
    dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
  }
  if (!isAudioSessionAvailable(void)::audioSessionAvailable)
  {
    if (kAVVCScope)
    {
      BOOL v12 = *(id *)kAVVCScope;
      if (!v12) {
        return 0;
      }
    }
    else
    {
      BOOL v12 = MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      char v82 = "AVVCSessionManager.mm";
      __int16 v83 = 1024;
      int v84 = 217;
      __int16 v85 = 2080;
      int v86 = "setupOneTimeSessionSettingsForClient";
      __int16 v87 = 1024;
      int v88 = 0;
      _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_DEBUG, "%25s:%-5d logAndReturnIfAudioSessionIsNotAvailable-%s returning : %d", buf, 0x22u);
    }

    return 0;
  }
  ElapsedTime::ElapsedTime((ElapsedTime *)buf, "-[AVVCSessionManager setupOneTimeSessionSettingsForClient:]", "setupOneTimeSessionSettingsForClient", 0);
  if (IsSerializationEnabled(void)::onceToken != -1) {
    dispatch_once(&IsSerializationEnabled(void)::onceToken, &__block_literal_global_193);
  }
  int v5 = IsSerializationEnabled(void)::enable;
  if (IsSerializationEnabled(void)::enable) {
    std::recursive_mutex::lock((std::recursive_mutex *)&self->mSessionManagerLock);
  }
  if (IsMetricsOwnedByAVVC(void)::onceToken != -1) {
    dispatch_once(&IsMetricsOwnedByAVVC(void)::onceToken, &__block_literal_global_205);
  }
  p_mSessionManagerLock = &self->mSessionManagerLock;
  if (!IsMetricsOwnedByAVVC(void)::owned)
  {
    int v10 = 0;
    self->_int64_t reporterID = [(AVAudioSession *)self->_audioSession reporterID];
    goto LABEL_43;
  }
  int v6 = +[AVVCMetricsManager sharedManager];
  uint64_t v7 = [v6 reporterID];

  if (v7)
  {
    audioSession = self->_audioSession;
    id v72 = 0;
    char v9 = [(AVAudioSession *)audioSession setReporterID:v7 error:&v72];
    int v10 = v72;
    if (v9)
    {
      if (kAVVCScope)
      {
        id v11 = *(id *)kAVVCScope;
        if (!v11) {
          goto LABEL_43;
        }
      }
      else
      {
        id v11 = (id)MEMORY[0x1E4F14500];
        id v17 = MEMORY[0x1E4F14500];
      }
      char v18 = v11;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = [(AVAudioSession *)self->_audioSession opaqueSessionID];
        *(_DWORD *)id v73 = 136315906;
        id v74 = "AVVCSessionManager.mm";
        __int16 v75 = 1024;
        int v76 = 236;
        __int16 v77 = 2048;
        __int16 v78 = v7;
        __int16 v79 = 1024;
        int v80 = v19;
        _os_log_impl(&dword_19D794000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Set reporterID(%lld) on session(0x%x)", v73, 0x22u);
      }
    }
    else
    {
      if (kAVVCScope)
      {
        id v15 = *(id *)kAVVCScope;
        if (!v15) {
          goto LABEL_43;
        }
      }
      else
      {
        id v15 = MEMORY[0x1E4F14500];
        id v20 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id v73 = 136315650;
        id v74 = "AVVCSessionManager.mm";
        __int16 v75 = 1024;
        int v76 = 233;
        __int16 v77 = 2112;
        __int16 v78 = v10;
        _os_log_impl(&dword_19D794000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: setReporterID failed with error: %@", v73, 0x1Cu);
      }
    }
  }
  else
  {
    if (kAVVCScope)
    {
      int v10 = *(id *)kAVVCScope;
      if (!v10) {
        goto LABEL_43;
      }
    }
    else
    {
      int v10 = MEMORY[0x1E4F14500];
      id v16 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v73 = 136315394;
      id v74 = "AVVCSessionManager.mm";
      __int16 v75 = 1024;
      int v76 = 240;
      _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCMetricsManager returned invalid reporterID", v73, 0x12u);
    }

    int v10 = 0;
  }
LABEL_43:
  char v21 = (void *)*MEMORY[0x1E4F4E8A8];
  id v22 = (id)*MEMORY[0x1E4F4E8A8];
  if (a3 == 3) {
    goto LABEL_46;
  }
  if (a3 == 2)
  {
    id v31 = (void *)*MEMORY[0x1E4F4E7F0];
    int v24 = (__CFString *)(id)*MEMORY[0x1E4F4E7F0];
    id v32 = (void *)*MEMORY[0x1E4F4E918];
    id v33 = (id)*MEMORY[0x1E4F4E918];

    id v22 = v33;
    BOOL v34 = self->_audioSession;
    v66 = v10;
    LOBYTE(v33) = [(AVAudioSession *)v34 setCategory:v24 mode:v33 routeSharingPolicy:0 options:12 error:&v66];
    id v35 = v66;

    int v10 = v35;
    if (v33)
    {
      objc_storeStrong((id *)&self->mPreviousSessionCategory, v31);
      objc_storeStrong((id *)&self->mPreviousSessionMode, v32);
      self->unint64_t mPreviousSessionCategoryOptions = 12;
      goto LABEL_112;
    }
    if (kAVVCScope)
    {
      __int16 v41 = *(id *)kAVVCScope;
      if (!v41)
      {
LABEL_74:
        int v45 = [v35 code];
        goto LABEL_111;
      }
    }
    else
    {
      __int16 v41 = MEMORY[0x1E4F14500];
      id v44 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v73 = 136315650;
      id v74 = "AVVCSessionManager.mm";
      __int16 v75 = 1024;
      int v76 = 391;
      __int16 v77 = 2112;
      __int16 v78 = v35;
      _os_log_impl(&dword_19D794000, v41, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setupOneTimeSessionSettings setCategoryModeRouteSharingPolicyOptions failed with error: %@", v73, 0x1Cu);
    }

    goto LABEL_74;
  }
  if (a3 != 1)
  {
    int v24 = &stru_1EEFA9548;
    goto LABEL_112;
  }
LABEL_46:
  if MGGetSInt32Answer() != 4 || (MGGetBoolAnswer())
  {
    id v23 = (void *)*MEMORY[0x1E4F4E7F0];
    int v24 = (__CFString *)(id)*MEMORY[0x1E4F4E7F0];
    BOOL v25 = (void *)*MEMORY[0x1E4F4E8F0];
    id v26 = (id)*MEMORY[0x1E4F4E8F0];

    id v22 = v26;
    int v27 = self->_audioSession;
    unint64_t v70 = v10;
    LOBYTE(v26) = [(AVAudioSession *)v27 setCategory:v24 mode:v26 routeSharingPolicy:0 options:4 error:&v70];
    id v28 = v70;

    id v29 = v28;
    if (v26)
    {
      objc_storeStrong((id *)&self->mPreviousSessionCategory, v23);
      objc_storeStrong((id *)&self->mPreviousSessionMode, v25);
      int v14 = 0;
      unint64_t v30 = 4;
LABEL_58:
      self->unint64_t mPreviousSessionCategoryOptions = v30;
      goto LABEL_80;
    }
    if (kAVVCScope)
    {
      id v36 = *(id *)kAVVCScope;
      if (!v36)
      {
LABEL_66:
        int v14 = [v28 code];
        goto LABEL_80;
      }
    }
    else
    {
      id v36 = MEMORY[0x1E4F14500];
      id v42 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v73 = 136315650;
      id v74 = "AVVCSessionManager.mm";
      __int16 v75 = 1024;
      int v76 = 329;
      __int16 v77 = 2112;
      __int16 v78 = v28;
      _os_log_impl(&dword_19D794000, v36, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setupOneTimeSessionSettings setCategoryModeOptions failed with error: %@", v73, 0x1Cu);
    }

    goto LABEL_66;
  }
  id v37 = (void *)*MEMORY[0x1E4F4E7F8];
  int v24 = (__CFString *)(id)*MEMORY[0x1E4F4E7F8];
  __int16 v38 = self->_audioSession;
  __int16 v71 = v10;
  BOOL v39 = [(AVAudioSession *)v38 setCategory:v24 withOptions:19 error:&v71];
  __int16 v40 = v71;

  id v29 = v40;
  if (v39)
  {
    objc_storeStrong((id *)&self->mPreviousSessionCategory, v37);
    objc_storeStrong((id *)&self->mPreviousSessionMode, v21);
    int v14 = 0;
    unint64_t v30 = 19;
    goto LABEL_58;
  }
  if (!kAVVCScope)
  {
    __int16 v43 = MEMORY[0x1E4F14500];
    id v46 = MEMORY[0x1E4F14500];
    goto LABEL_76;
  }
  __int16 v43 = *(id *)kAVVCScope;
  if (v43)
  {
LABEL_76:
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v73 = 136315650;
      id v74 = "AVVCSessionManager.mm";
      __int16 v75 = 1024;
      int v76 = 267;
      __int16 v77 = 2112;
      __int16 v78 = v40;
      _os_log_impl(&dword_19D794000, v43, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setupOneTimeSessionSettings setCategoryModeOptions failed with error: %@", v73, 0x1Cu);
    }
  }
  int v14 = [v40 code];
LABEL_80:
  id v47 = self->_audioSession;
  __int16 v69 = v29;
  char v48 = [(AVAudioSession *)v47 setIAmTheAssistant:1 error:&v69];
  int v49 = v69;

  __int16 v50 = v49;
  if (v48) {
    goto LABEL_89;
  }
  if (!kAVVCScope)
  {
    int64_t v51 = MEMORY[0x1E4F14500];
    id v52 = MEMORY[0x1E4F14500];
    goto LABEL_85;
  }
  int64_t v51 = *(id *)kAVVCScope;
  if (v51)
  {
LABEL_85:
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v73 = 136315650;
      id v74 = "AVVCSessionManager.mm";
      __int16 v75 = 1024;
      int v76 = 341;
      __int16 v77 = 2112;
      __int16 v78 = v49;
      _os_log_impl(&dword_19D794000, v51, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setIAmTheAssistant failed with error: %@", v73, 0x1Cu);
    }
  }
  int v14 = [v49 code];
LABEL_89:
  int v53 = self->_audioSession;
  int v68 = v49;
  BOOL v54 = [(AVAudioSession *)v53 setAllowHapticsAndSystemSoundsDuringRecording:1 error:&v68];
  unint64_t v55 = v68;

  int v10 = v55;
  if (v54) {
    goto LABEL_98;
  }
  if (!kAVVCScope)
  {
    int64_t v56 = MEMORY[0x1E4F14500];
    id v57 = MEMORY[0x1E4F14500];
    goto LABEL_94;
  }
  int64_t v56 = *(id *)kAVVCScope;
  if (v56)
  {
LABEL_94:
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v73 = 136315650;
      id v74 = "AVVCSessionManager.mm";
      __int16 v75 = 1024;
      int v76 = 348;
      __int16 v77 = 2112;
      __int16 v78 = v55;
      _os_log_impl(&dword_19D794000, v56, OS_LOG_TYPE_ERROR, "%25s:%-5d ERROR: AVVCSessionManager::setAllowHapticsAndSystemSoundsDuringRecording failed with error: %@", v73, 0x1Cu);
    }
  }
  int v14 = [v55 code];
LABEL_98:
  if (a3 != 1) {
    goto LABEL_101;
  }
  char v58 = self->_audioSession;
  id v67 = v55;
  char v59 = [(AVAudioSession *)v58 setEligibleForBTSmartRoutingConsideration:0 error:&v67];
  long long v60 = v67;

  int v10 = v60;
  if ((v59 & 1) == 0)
  {
    if (kAVVCScope)
    {
      id v61 = *(id *)kAVVCScope;
      if (!v61)
      {
LABEL_110:
        int v45 = [v60 code];
LABEL_111:
        int v14 = v45;
        if (v45) {
          goto LABEL_113;
        }
LABEL_112:
        [(AVVCSessionManager *)self setSessionStateWithoutLock:1];
        int v14 = 0;
        goto LABEL_113;
      }
    }
    else
    {
      id v61 = MEMORY[0x1E4F14500];
      id v62 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v73 = 136315650;
      id v74 = "AVVCSessionManager.mm";
      __int16 v75 = 1024;
      int v76 = 355;
      __int16 v77 = 2112;
      __int16 v78 = v60;
      _os_log_impl(&dword_19D794000, v61, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ERROR: AVVCSessionManager::setEligibleForBTSmartRoutingConsideration failed with error: %@", v73, 0x1Cu);
    }

    goto LABEL_110;
  }
  self->mEnableSmartRoutingConsideration = 0;
LABEL_101:
  if (!v14) {
    goto LABEL_112;
  }
LABEL_113:

  if (v5) {
    std::recursive_mutex::unlock(v65);
  }
  ElapsedTime::~ElapsedTime((ElapsedTime *)buf);
  return v14;
}

- (void)dealloc
{
  audioSession = self->_audioSession;
  self->_audioSession = 0;

  playbackRoute = self->_playbackRoute;
  self->_playbackRoute = 0;

  v5.receiver = self;
  v5.super_class = (Class)AVVCSessionManager;
  [(AVVCSessionManager *)&v5 dealloc];
}

- (AVVCSessionManager)initWithSession:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AVVCSessionManager;
  int v6 = [(AVVCSessionManager *)&v19 init];
  if (v6)
  {
    if (isAudioSessionAvailable(void)::onceToken != -1) {
      dispatch_once(&isAudioSessionAvailable(void)::onceToken, &__block_literal_global_38);
    }
    if (isAudioSessionAvailable(void)::audioSessionAvailable)
    {
      objc_storeStrong((id *)v6 + 25, a3);
      v6[8] = 0;
      *(void *)(v6 + 10) = 0;
      *((_WORD *)v6 + 9) = 0;
      *((_DWORD *)v6 + 5) = 1;
      *((_DWORD *)v6 + 36) = 0;
      id v7 = [MEMORY[0x1E4F4E9F8] sharedInstance];
      v6[141] = v7 == v5;

      v6[142] = 0;
      *((_DWORD *)v6 + 37) = 1065353216;
      id v8 = (void *)*((void *)v6 + 26);
      *((void *)v6 + 26) = 0;

      v6[143] = 0;
      *(_OWORD *)(v6 + 152) = 0u;
      *(_OWORD *)(v6 + 168) = 0u;
      *(_OWORD *)(v6 + 184) = 0u;
      *(_OWORD *)(v6 + 88) = xmmword_19D8B1E30;
      char v9 = (void *)*((void *)v6 + 14);
      *((void *)v6 + 14) = &stru_1EEFA9548;

      int v10 = (void *)*((void *)v6 + 15);
      *((void *)v6 + 15) = &stru_1EEFA9548;

      *((void *)v6 + 16) = -1;
      *((_DWORD *)v6 + 34) = 0;
      v6[140] = [*((id *)v6 + 25) eligibleForBTSmartRoutingConsideration];
      int v11 = MGGetSInt32Answer();
      BOOL v12 = (PlatformUtilities_iOS *)MGGetBoolAnswer();
      if (v11 == 7) {
        char v13 = 1;
      }
      else {
        char v13 = (char)v12;
      }
      v6[18] = v13;
      ProductType = (PlatformUtilities_iOS *)PlatformUtilities_iOS::GetProductType(v12);
      BOOL v17 = ProductType == 111
         || (id v15 = (PlatformUtilities_iOS *)PlatformUtilities_iOS::GetProductType(ProductType), v15 == 112)
         || (id v16 = (PlatformUtilities_iOS *)PlatformUtilities_iOS::GetProductType(v15), v16 == 96)
         || PlatformUtilities_iOS::GetProductType(v16) == 97;
      v6[19] = v17;
    }
  }

  return (AVVCSessionManager *)v6;
}

@end