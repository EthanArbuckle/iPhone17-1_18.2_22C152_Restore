@interface APAVAudioSessionManager
+ (APAVAudioSessionManager)ambientSessionManager;
+ (APAVAudioSessionManager)mediaSessionManager;
- (APAVAudioSessionManager)initWithType:(unint64_t)a3;
- (AVAudioSession)session;
- (BOOL)setActive:(BOOL)a3 error:(id *)a4;
- (BOOL)setAudioMode:(__CFString *)a3 isLongForm:(BOOL)a4 error:(id *)a5;
- (BOOL)setDuckOthers:(unsigned __int8)a3 error:(id *)a4;
- (BOOL)setPreferredHardwareFormat:(int64_t)a3 error:(id *)a4;
- (BOOL)setPreferredOutputNumberOfChannels:(int64_t)a3 error:(id *)a4;
- (BOOL)setPrefersMultichannelAudio:(unsigned __int8)a3 error:(id *)a4;
- (void)dealloc;
- (void)resetSession;
- (void)setUpSessionWithIsMixable:(BOOL)a3;
@end

@implementation APAVAudioSessionManager

- (BOOL)setPreferredHardwareFormat:(int64_t)a3 error:(id *)a4
{
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  BOOL isSetUp = self->_isSetUp;
  if (self->_isSetUp)
  {
    uint64_t v7 = 0;
  }
  else
  {
    APSLogErrorAt();
    if (gLogCategory_APAVAudioSessionManager <= 60
      && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v7 = -6718;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
  if (a4 && !isSetUp) {
    *a4 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v7 userInfo:0];
  }
  return isSetUp;
}

- (BOOL)setPreferredOutputNumberOfChannels:(int64_t)a3 error:(id *)a4
{
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  BOOL isSetUp = self->_isSetUp;
  if (self->_isSetUp)
  {
    uint64_t v7 = 0;
  }
  else
  {
    APSLogErrorAt();
    if (gLogCategory_APAVAudioSessionManager <= 60
      && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v7 = -6718;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
  if (a4 && !isSetUp) {
    *a4 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v7 userInfo:0];
  }
  return isSetUp;
}

- (BOOL)setDuckOthers:(unsigned __int8)a3 error:(id *)a4
{
  int v5 = a3;
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  if (!self->_isSetUp)
  {
    if (gLogCategory_APAVAudioSessionManager <= 90
      && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
    {
      v17 = self;
      v18 = "-[APAVAudioSessionManager setDuckOthers:error:]";
      LogPrintF();
    }
    if (!a4) {
      goto LABEL_29;
    }
    v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08410];
    uint64_t v15 = -6718;
LABEL_27:
    BOOL v11 = 0;
    *a4 = (id)objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, v15, 0, v17, v18);
    goto LABEL_30;
  }
  if (self->_type != 1)
  {
    if (gLogCategory_APAVAudioSessionManager <= 90
      && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
    {
      v17 = self;
      LogPrintF();
    }
    if (!a4) {
      goto LABEL_29;
    }
    v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F08410];
    uint64_t v15 = -6735;
    goto LABEL_27;
  }
  if (self->_forceRAW) {
    uint64_t v7 = (uint64_t *)MEMORY[0x263EF9050];
  }
  else {
    uint64_t v7 = (uint64_t *)MEMORY[0x263EF9060];
  }
  uint64_t v8 = *v7;
  v9 = (void *)MEMORY[0x263EF9138];
  if (!self->_forceRAW) {
    v9 = (void *)MEMORY[0x263EF9108];
  }
  BOOL v10 = v5 == 0;
  BOOL v11 = 1;
  if (v10) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = 2;
  }
  if (![(AVAudioSession *)self->_session setCategory:v8 mode:*v9 routeSharingPolicy:0 options:v12 error:a4])
  {
    if (gLogCategory_APAVAudioSessionManager <= 90
      && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
LABEL_29:
    BOOL v11 = 0;
  }
LABEL_30:
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
  return v11;
}

- (BOOL)setActive:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  if (self->_isSetUp)
  {
    BOOL v7 = [(AVAudioSession *)self->_session setActive:v5 error:a4];
  }
  else
  {
    if (gLogCategory_APAVAudioSessionManager <= 60
      && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    BOOL v7 = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
  return v7;
}

- (BOOL)setPrefersMultichannelAudio:(unsigned __int8)a3 error:(id *)a4
{
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  BOOL isSetUp = self->_isSetUp;
  if (self->_isSetUp)
  {
    uint64_t v7 = 0;
  }
  else
  {
    APSLogErrorAt();
    if (gLogCategory_APAVAudioSessionManager <= 60
      && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v7 = -6718;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
  if (a4 && !isSetUp) {
    *a4 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v7 userInfo:0];
  }
  return isSetUp;
}

- (BOOL)setAudioMode:(__CFString *)a3 isLongForm:(BOOL)a4 error:(id *)a5
{
  LODWORD(v6) = a4;
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  if (self->_isSetUp)
  {
    uint64_t v9 = *MEMORY[0x263EF9108];
    if (APSSettingsGetIntWithDefault()) {
      int v10 = 1;
    }
    else {
      int v10 = _os_feature_enabled_impl();
    }
    unint64_t type = self->_type;
    if (type == 1)
    {
      uint64_t v6 = 0;
      goto LABEL_14;
    }
    if (!type)
    {
      if (a3 == @"moviePlayback") {
        goto LABEL_10;
      }
      if (!a3)
      {
LABEL_12:
        uint64_t v6 = v6;
LABEL_14:
        if (self->_forceRAW)
        {
          if (gLogCategory_APAVAudioSessionManager <= 50
            && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
          {
            session = self->_session;
            LogPrintF();
          }
          uint64_t v15 = *MEMORY[0x263EF9050];
          uint64_t v9 = *MEMORY[0x263EF9138];
        }
        else
        {
          uint64_t v15 = *MEMORY[0x263EF9060];
        }
        if (self->_type || !APSMultiPrimariesEnabled()) {
          BOOL v16 = [(AVAudioSession *)self->_session setCategory:v15 mode:v9 routeSharingPolicy:v6 options:[(AVAudioSession *)self->_session categoryOptions] error:a5];
        }
        else {
          BOOL v16 = [(AVAudioSession *)self->_session setCategory:v15 mode:v9 options:[(AVAudioSession *)self->_session categoryOptions] error:a5];
        }
        char v14 = v16;
        if (v9 == *MEMORY[0x263EF9148] && v16)
        {
          char v14 = [(AVAudioSession *)self->_session setMXSessionProperty:*MEMORY[0x263F54668] value:MEMORY[0x263EFFA88] error:a5];
          if (gLogCategory_APAVAudioSessionManager <= 50
            && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
        }
        pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
        return v14;
      }
      if (CFEqual(a3, @"moviePlayback"))
      {
LABEL_10:
        uint64_t v12 = (uint64_t *)MEMORY[0x263EF9130];
      }
      else
      {
        if (!v10 || a3 != @"spokenAudio" && !CFEqual(a3, @"spokenAudio")) {
          goto LABEL_12;
        }
        if (gLogCategory_APAVAudioSessionManager <= 50
          && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
        {
          unint64_t v19 = self->_type;
          v20 = "?";
          if (v19 == 1) {
            v20 = "Ambient";
          }
          if (v19) {
            v21 = v20;
          }
          else {
            v21 = "Media";
          }
          v23 = v21;
          v24 = a3;
          session = self;
          LogPrintF();
        }
        uint64_t v12 = (uint64_t *)MEMORY[0x263EF9148];
      }
      uint64_t v9 = *v12;
      goto LABEL_12;
    }
    uint64_t v13 = -6756;
  }
  else
  {
    APSLogErrorAt();
    if (gLogCategory_APAVAudioSessionManager <= 60
      && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v13 = -6718;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
  char v14 = 0;
  if (a5) {
    *a5 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:v13 userInfo:0];
  }
  return v14;
}

- (void)resetSession
{
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  if (self->_isSetUp)
  {
    if (gLogCategory_APAVAudioSessionManager <= 50
      && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    self->_session = 0;
    self->_BOOL isSetUp = 0;
  }
  mutex = self->_mutex;

  pthread_mutex_unlock((pthread_mutex_t *)mutex);
}

- (void)setUpSessionWithIsMixable:(BOOL)a3
{
  LODWORD(v3) = a3;
  uint64_t v21 = 0;
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  if (!self->_isSetUp)
  {
    if (gLogCategory_APAVAudioSessionManager <= 50
      && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
    {
      unint64_t type = self->_type;
      uint64_t v6 = "?";
      if (type == 1) {
        uint64_t v6 = "Ambient";
      }
      if (type) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = "Media";
      }
      v17 = v7;
      uint64_t v19 = v3;
      session = self;
      LogPrintF();
    }
    unint64_t v8 = self->_type;
    if (v8 == 1)
    {
      self->_session = (AVAudioSession *)[objc_alloc(MEMORY[0x263EF93E0]) initAuxiliarySession];
      uint64_t v3 = 1;
    }
    else if (v8)
    {
      uint64_t v3 = 0;
    }
    else
    {
      self->_session = (AVAudioSession *)(id)[MEMORY[0x263EF93E0] sharedInstance];
      uint64_t v3 = v3;
    }
    if (self->_forceRAW)
    {
      if (gLogCategory_APAVAudioSessionManager <= 50
        && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
      {
        session = self->_session;
        LogPrintF();
      }
      uint64_t v9 = *MEMORY[0x263EF9050];
      uint64_t v10 = *MEMORY[0x263EF9138];
    }
    else
    {
      uint64_t v9 = *MEMORY[0x263EF9060];
      uint64_t v10 = *MEMORY[0x263EF9108];
    }
    unsigned int v11 = -[AVAudioSession setMXSessionProperty:value:error:](self->_session, "setMXSessionProperty:value:error:", *MEMORY[0x263F54660], MEMORY[0x263EFFA88], &v21, session, v17, v19);
    if (gLogCategory_APAVAudioSessionManager <= 50)
    {
      unsigned int v12 = v11;
      if (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize())
      {
        uint64_t v18 = v12;
        uint64_t v20 = v21;
        BOOL v16 = self->_session;
        LogPrintF();
      }
    }
    if (self->_type || !APSMultiPrimariesEnabled()) {
      -[AVAudioSession setCategory:mode:routeSharingPolicy:options:error:](self->_session, "setCategory:mode:routeSharingPolicy:options:error:", v9, v10, 0, v3, 0, v16, v18, v20);
    }
    else {
      [(AVAudioSession *)self->_session setCategory:v9 mode:v10 options:v3 error:0];
    }
    unsigned int Int64 = APSSettingsGetInt64();
    if (Int64)
    {
      uint64_t v21 = 0;
      if ([(AVAudioSession *)self->_session setPreferredSampleRate:&v21 error:(double)Int64])
      {
        if (gLogCategory_APAVAudioSessionManager <= 50
          && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
        {
LABEL_38:
          LogPrintF();
        }
      }
      else if (gLogCategory_APAVAudioSessionManager <= 60 {
             && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
      }
      {
        goto LABEL_38;
      }
    }
    unsigned int v14 = APSSettingsGetInt64();
    if (v14)
    {
      uint64_t v21 = 0;
      if ([(AVAudioSession *)self->_session setPreferredIOBufferFrameSize:v14 error:&v21])
      {
        if (gLogCategory_APAVAudioSessionManager > 50
          || gLogCategory_APAVAudioSessionManager == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_53;
        }
      }
      else if (gLogCategory_APAVAudioSessionManager > 60 {
             || gLogCategory_APAVAudioSessionManager == -1 && !_LogCategory_Initialize())
      }
      {
        goto LABEL_53;
      }
      LogPrintF();
    }
LABEL_53:
    self->_BOOL isSetUp = 1;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
}

- (AVAudioSession)session
{
  pthread_mutex_lock((pthread_mutex_t *)self->_mutex);
  if (self->_isSetUp)
  {
    session = self->_session;
  }
  else
  {
    APSLogErrorAt();
    if (gLogCategory_APAVAudioSessionManager <= 60
      && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    session = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_mutex);
  return session;
}

- (void)dealloc
{
  FigSimpleMutexDestroy();

  v3.receiver = self;
  v3.super_class = (Class)APAVAudioSessionManager;
  [(APAVAudioSessionManager *)&v3 dealloc];
}

- (APAVAudioSessionManager)initWithType:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)APAVAudioSessionManager;
  v4 = [(APAVAudioSessionManager *)&v6 init];
  if (v4)
  {
    v4->_mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v4->_session = 0;
    v4->_unint64_t type = a3;
    v4->_forceRAW = APSSettingsGetIntWithDefault() != 0;
    if (gLogCategory_APAVAudioSessionManager <= 50
      && (gLogCategory_APAVAudioSessionManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return v4;
}

+ (APAVAudioSessionManager)ambientSessionManager
{
  if (ambientSessionManager_onceToken != -1) {
    dispatch_once(&ambientSessionManager_onceToken, &__block_literal_global_4);
  }
  return (APAVAudioSessionManager *)ambientSessionManager_sessionManager;
}

APAVAudioSessionManager *__48__APAVAudioSessionManager_ambientSessionManager__block_invoke()
{
  result = [[APAVAudioSessionManager alloc] initWithType:1];
  ambientSessionManager_sessionManager = (uint64_t)result;
  return result;
}

+ (APAVAudioSessionManager)mediaSessionManager
{
  if (mediaSessionManager_onceToken != -1) {
    dispatch_once(&mediaSessionManager_onceToken, &__block_literal_global_749);
  }
  return (APAVAudioSessionManager *)mediaSessionManager_sessionManager;
}

APAVAudioSessionManager *__46__APAVAudioSessionManager_mediaSessionManager__block_invoke()
{
  result = [[APAVAudioSessionManager alloc] initWithType:0];
  mediaSessionManager_sessionManager = (uint64_t)result;
  return result;
}

@end