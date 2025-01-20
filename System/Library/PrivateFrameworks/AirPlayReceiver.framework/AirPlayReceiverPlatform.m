@interface AirPlayReceiverPlatform
- (int)_updateVolume:(float)a3 andMute:(unsigned __int8)a4 becauseVolumeChanged:(unsigned __int8)a5;
- (void)_avSystemControllerConnectionDied:(id)a3;
- (void)_avSystemControllerMuteChanged:(id)a3;
- (void)_avSystemControllerVolumeChanged:(id)a3;
- (void)_avSystemControllerVolumeConfigChanged:(id)a3;
- (void)_fetchInitialStates;
- (void)_handleAVAudioSessionInterruption:(id)a3;
- (void)_handleAVAudioSessionServicesLost:(id)a3;
- (void)_handleAVAudioSessionServicesReset:(id)a3;
- (void)_handleNowPlayingAppStartedPlaying:(id)a3;
- (void)_handleVolumeControlTypeChange;
- (void)_registerAVSystemControllerNotifications;
- (void)_unregisterAVSystemControllerNotifications;
- (void)_updateMediaSessionActivationStateBasedOnMediaAudioActiveState:(unsigned __int8)a3 andVideoActiveState:(unsigned __int8)a4;
- (void)handleMRCommand:(unsigned int)a3 translatedAPCommand:(unsigned int)a4 withOptions:(__CFDictionary *)a5;
- (void)setIsAmbientAudioActive:(unsigned __int8)a3;
- (void)setIsMediaAudioActive:(unsigned __int8)a3;
- (void)setIsScreenActive:(unsigned __int8)a3;
- (void)setIsVideoActive:(unsigned __int8)a3;
- (void)setMainMediaReceiverSession:(OpaqueAPReceiverRequestProcessor *)a3;
- (void)setReceiverSessionCountAndUpdateStateIfNeeded:(unint64_t)a3;
- (void)setShouldHandleMRCommands:(unsigned __int8)a3;
- (void)updateActiveSessionRegistration:(AirPlayReceiverSessionPrivate *)a3 regType:(int)a4 regOp:(int)a5;
- (void)updateMRNowPlayingAppStateForSinglePrimary;
@end

@implementation AirPlayReceiverPlatform

- (void)_updateMediaSessionActivationStateBasedOnMediaAudioActiveState:(unsigned __int8)a3 andVideoActiveState:(unsigned __int8)a4
{
  if (self->_state.isMediaAudioActive) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = self->_state.isVideoActive != 0;
  }
  int v6 = a4 | a3;
  if (v5 != ((a4 | a3) != 0))
  {
    uint64_t v11 = 0;
    if (gLogCategory_AirPlayReceiverPlatform <= 50
      && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
    {
      if (self->_server->var40) {
        v7 = "yes";
      }
      else {
        v7 = "no";
      }
      BOOL v9 = v6 != 0;
      v10 = v7;
      BOOL v8 = v5;
      LogPrintF();
    }
    if (!self->_server->var40)
    {
      if ([+[APAVAudioSessionManager mediaSessionManager] setActive:v6 != 0 error:&v11])
      {
        if (gLogCategory_AirPlayReceiverPlatform > 50
          || gLogCategory_AirPlayReceiverPlatform == -1 && !_LogCategory_Initialize())
        {
          return;
        }
      }
      else if (gLogCategory_AirPlayReceiverPlatform > 60 {
             || gLogCategory_AirPlayReceiverPlatform == -1 && !_LogCategory_Initialize())
      }
      {
        return;
      }
      LogPrintF();
    }
  }
}

- (void)_handleAVAudioSessionServicesLost:(id)a3
{
  if (gLogCategory_AirPlayReceiverPlatform <= 60
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  server = self->_server;

  AirPlayReceiverServerControl((uint64_t)server, (int)a2, @"partnerProcessDeath", @"MediaServices", 0, 0);
}

- (void)_handleAVAudioSessionServicesReset:(id)a3
{
  BOOL v5 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  if (gLogCategory_AirPlayReceiverPlatform <= 60
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  AirPlayReceiverServerControl((uint64_t)self->_server, v4, @"partnerProcessDeath", @"MediaServices", 0, 0);
  [+[APAVAudioSessionManager mediaSessionManager] resetSession];
  [+[APAVAudioSessionManager mediaSessionManager] setUpSessionWithIsMixable:self->_server->var40 != 0];
  uint64_t v6 = *MEMORY[0x263EF90A0];
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x263EF90A0], -[APAVAudioSessionManager session](+[APAVAudioSessionManager ambientSessionManager](APAVAudioSessionManager, "ambientSessionManager"), "session"));
  [+[APAVAudioSessionManager ambientSessionManager] resetSession];
  [+[APAVAudioSessionManager ambientSessionManager] setUpSessionWithIsMixable:1];
  v7 = [+[APAVAudioSessionManager ambientSessionManager] session];

  [v5 addObserver:self selector:sel__handleAVAudioSessionInterruption_ name:v6 object:v7];
}

- (void)_handleAVAudioSessionInterruption:(id)a3
{
  keys[1] = *(void **)MEMORY[0x263EF8340];
  BOOL v5 = (void *)[a3 userInfo];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x263EF90C8]), "unsignedIntegerValue");
  v7 = (void *)[a3 userInfo];
  char v8 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x263EF90A8]), "unsignedIntegerValue");
  if (v6 == 1)
  {
    int v9 = 0;
    v10 = @"audioInterruptionBegan";
  }
  else if (v6)
  {
    v10 = 0;
    int v9 = 1;
  }
  else
  {
    int v9 = 0;
    v10 = @"audioInterruptionEnded";
  }
  if (objc_msgSend((id)objc_msgSend(a3, "object"), "isEqual:", -[APAVAudioSessionManager session](+[APAVAudioSessionManager mediaSessionManager](APAVAudioSessionManager, "mediaSessionManager"), "session")))
  {
    int v12 = 0;
    v13 = @"Media";
  }
  else
  {
    int v14 = objc_msgSend((id)objc_msgSend(a3, "object"), "isEqual:", -[APAVAudioSessionManager session](+[APAVAudioSessionManager ambientSessionManager](APAVAudioSessionManager, "ambientSessionManager"), "session"));
    int v12 = v14 ^ 1;
    if (v14) {
      v13 = @"Ambient";
    }
    else {
      v13 = 0;
    }
  }
  if (v6) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = (v8 & 1) == 0;
  }
  if (v15)
  {
    CFDictionaryRef v16 = 0;
  }
  else
  {
    values = (void *)*MEMORY[0x263EFFB40];
    keys[0] = @"canResume";
    CFDictionaryRef v16 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)&values, 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  if (gLogCategory_AirPlayReceiverPlatform <= 50
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v9 || v12)
  {
    APSLogErrorAt();
    if (!v16) {
      return;
    }
  }
  else
  {
    AirPlayReceiverServerControl((uint64_t)self->_server, v11, v10, v13, v16, 0);
    if (!v16) {
      return;
    }
  }
  CFRelease(v16);
}

- (void)updateMRNowPlayingAppStateForSinglePrimary
{
  if (!APSMultiPrimariesEnabled())
  {
    if (self->_state.receiverSessionCount)
    {
      if (IsAppleTV() && self->_state.isScreenActive)
      {
        value = 0;
        APReceiverSessionManagerCopyAirPlaySessionWithAttribute((uint64_t)self->_server->var33, 2, 0, (const void **)&value);
        if (value)
        {
          int v3 = APSIsMemberOfHTGroup();
          int v4 = (const char *)value;
          if (!v3 || *((_DWORD *)value + 124) == 2)
          {
            BOOL v5 = CFSetContainsValue(self->_state.mediaAudioSessions, value) != 0;
            uint64_t v6 = 1;
            goto LABEL_17;
          }
          if (gLogCategory_AirPlayReceiverPlatform <= 50)
          {
            if (gLogCategory_AirPlayReceiverPlatform == -1)
            {
              if (!_LogCategory_Initialize()) {
                goto LABEL_16;
              }
              int v4 = (const char *)value;
            }
            int v9 = v4;
            LogPrintF();
          }
LABEL_16:
          uint64_t v6 = 0;
          BOOL v5 = 0;
LABEL_17:
          if (value) {
            CFRelease(value);
          }
          goto LABEL_19;
        }
        BOOL v5 = 1;
        uint64_t v6 = 1;
      }
      else
      {
        uint64_t v6 = 1;
        BOOL v5 = 1;
      }
    }
    else
    {
      uint64_t v6 = 0;
      BOOL v5 = 0;
    }
LABEL_19:
    if (self->_state.nowPlaying.singlePrimary.isAirPlayReceiverMRNowPlayingApp != v6)
    {
      int v7 = gLogCategory_AirPlayReceiverPlatform;
      if (!(self->_useMediaRemotePerPlayerAPI | v6))
      {
        if (gLogCategory_AirPlayReceiverPlatform <= 50
          && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        -[AirPlayReceiverMediaRemoteHelper setMRPlaybackState:](self->_mediaRemoteHelper, "setMRPlaybackState:", 3, v9);
        int v7 = gLogCategory_AirPlayReceiverPlatform;
      }
      if (v7 <= 50 && (v7 != -1 || _LogCategory_Initialize()))
      {
        char v8 = "yes";
        if (!v6) {
          char v8 = "no";
        }
        int v9 = v8;
        LogPrintF();
      }
      -[AirPlayReceiverMediaRemoteHelper setIsNowPlaying:](self->_mediaRemoteHelper, "setIsNowPlaying:", v6, v9);
      self->_state.nowPlaying.singlePrimary.isAirPlayReceiverMRNowPlayingApp = v6;
      if (v6 && !self->_useMediaRemotePerPlayerAPI)
      {
        if (self->_server->var43) {
          [(AirPlayReceiverMediaRemoteHelper *)self->_mediaRemoteHelper broadcastPauseCommand];
        }
        [(AirPlayReceiverMediaRemoteHelper *)self->_mediaRemoteHelper associateNowPlayingSessionWithAudioSession:[[+[APAVAudioSessionManager mediaSessionManager] session] opaqueSessionID]];
      }
    }
    if (!self->_useMediaRemotePerPlayerAPI) {
      [(AirPlayReceiverPlatform *)self setShouldHandleMRCommands:v5];
    }
    return;
  }
  APSLogErrorAt();
  if (gLogCategory_AirPlayReceiverPlatform <= 90
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)setShouldHandleMRCommands:(unsigned __int8)a3
{
  int v3 = a3;
  if (self->_state.isHandlingMRCommands != a3 && !self->_useMediaRemotePerPlayerAPI)
  {
    if (gLogCategory_AirPlayReceiverPlatform <= 50
      && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
    {
      BOOL v5 = "in to";
      if (!v3) {
        BOOL v5 = "out of";
      }
      int v7 = v5;
      LogPrintF();
    }
    if (v3) {
      uint64_t v6 = self;
    }
    else {
      uint64_t v6 = 0;
    }
    -[AirPlayReceiverMediaRemoteHelper setDelegate:](self->_mediaRemoteHelper, "setDelegate:", v6, v7);
  }
  self->_state.isHandlingMRCommands = v3;
}

- (void)setIsScreenActive:(unsigned __int8)a3
{
  if (self->_state.isScreenActive != a3)
  {
    if (gLogCategory_AirPlayReceiverPlatform <= 50
      && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_state.isScreenActive = a3;
    if (!APSMultiPrimariesEnabled())
    {
      [(AirPlayReceiverPlatform *)self updateMRNowPlayingAppStateForSinglePrimary];
    }
  }
}

- (void)setIsVideoActive:(unsigned __int8)a3
{
  unsigned int isVideoActive = self->_state.isVideoActive;
  if (isVideoActive == a3) {
    return;
  }
  uint64_t v4 = a3;
  if (gLogCategory_AirPlayReceiverPlatform <= 50)
  {
    if (gLogCategory_AirPlayReceiverPlatform == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_6;
      }
      unsigned int isVideoActive = self->_state.isVideoActive;
    }
    uint64_t v6 = isVideoActive;
    uint64_t v7 = v4;
    LogPrintF();
  }
LABEL_6:
  if (v4) {
    APSEnsureCanInitiatePlayback();
  }
  -[AirPlayReceiverPlatform _updateMediaSessionActivationStateBasedOnMediaAudioActiveState:andVideoActiveState:](self, "_updateMediaSessionActivationStateBasedOnMediaAudioActiveState:andVideoActiveState:", self->_state.isMediaAudioActive, v4, v6, v7);
  self->_state.unsigned int isVideoActive = v4;
}

- (void)setIsMediaAudioActive:(unsigned __int8)a3
{
  unsigned int isMediaAudioActive = self->_state.isMediaAudioActive;
  if (isMediaAudioActive == a3) {
    return;
  }
  uint64_t v4 = a3;
  if (gLogCategory_AirPlayReceiverPlatform <= 50)
  {
    if (gLogCategory_AirPlayReceiverPlatform != -1)
    {
LABEL_4:
      uint64_t v6 = isMediaAudioActive;
      uint64_t v7 = v4;
      LogPrintF();
      goto LABEL_6;
    }
    if (_LogCategory_Initialize())
    {
      unsigned int isMediaAudioActive = self->_state.isMediaAudioActive;
      goto LABEL_4;
    }
  }
LABEL_6:
  -[AirPlayReceiverPlatform _updateMediaSessionActivationStateBasedOnMediaAudioActiveState:andVideoActiveState:](self, "_updateMediaSessionActivationStateBasedOnMediaAudioActiveState:andVideoActiveState:", v4, self->_state.isVideoActive, v6, v7);
  self->_state.unsigned int isMediaAudioActive = v4;
  if (!APSMultiPrimariesEnabled())
  {
    [(AirPlayReceiverPlatform *)self updateMRNowPlayingAppStateForSinglePrimary];
  }
}

- (void)setIsAmbientAudioActive:(unsigned __int8)a3
{
  unsigned int isAmbientAudioActive = self->_state.isAmbientAudioActive;
  if (isAmbientAudioActive != a3)
  {
    uint64_t v4 = a3;
    if (gLogCategory_AirPlayReceiverPlatform > 50) {
      goto LABEL_6;
    }
    if (gLogCategory_AirPlayReceiverPlatform == -1)
    {
      if (!_LogCategory_Initialize())
      {
LABEL_6:
        uint64_t v8 = 0;
        if ([+[APAVAudioSessionManager ambientSessionManager] setActive:v4 != 0 error:&v8])
        {
          if (gLogCategory_AirPlayReceiverPlatform > 50
            || gLogCategory_AirPlayReceiverPlatform == -1 && !_LogCategory_Initialize())
          {
            goto LABEL_16;
          }
        }
        else if (gLogCategory_AirPlayReceiverPlatform > 90 {
               || gLogCategory_AirPlayReceiverPlatform == -1 && !_LogCategory_Initialize())
        }
        {
          goto LABEL_16;
        }
        LogPrintF();
LABEL_16:
        _NotifyIsPlayingAmbientAudio(v4);
        self->_state.unsigned int isAmbientAudioActive = v4;
        return;
      }
      unsigned int isAmbientAudioActive = self->_state.isAmbientAudioActive;
    }
    uint64_t v6 = isAmbientAudioActive;
    uint64_t v7 = v4;
    LogPrintF();
    goto LABEL_6;
  }
}

- (void)setMainMediaReceiverSession:(OpaqueAPReceiverRequestProcessor *)a3
{
  if (!APSMultiPrimariesEnabled())
  {
    APSLogErrorAt();
    if (gLogCategory_AirPlayReceiverPlatform <= 90
      && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_29;
  }
  p_mainMediaReceiverSession = &self->_state.nowPlaying.multiPrimaries.mainMediaReceiverSession;
  mainMediaReceiverSession = self->_state.nowPlaying.multiPrimaries.mainMediaReceiverSession;
  if (mainMediaReceiverSession == a3) {
    goto LABEL_29;
  }
  if (gLogCategory_AirPlayReceiverPlatform <= 50)
  {
    if (gLogCategory_AirPlayReceiverPlatform != -1)
    {
LABEL_5:
      uint64_t v8 = mainMediaReceiverSession;
      int v9 = a3;
      LogPrintF();
      goto LABEL_7;
    }
    if (_LogCategory_Initialize())
    {
      mainMediaReceiverSession = *p_mainMediaReceiverSession;
      goto LABEL_5;
    }
  }
LABEL_7:
  if (!self->_useMediaRemotePerPlayerAPI)
  {
    if (*p_mainMediaReceiverSession && self->_state.nowPlaying.singlePrimary.isAirPlayReceiverMRNowPlayingApp)
    {
      [(AirPlayReceiverMediaRemoteHelper *)self->_mediaRemoteHelper stopNowPlayingSession];
      [(AirPlayReceiverPlatform *)self setShouldHandleMRCommands:0];
      self->_state.nowPlaying.singlePrimary.isAirPlayReceiverMRNowPlayingApp = 0;
    }
    if (a3)
    {
      if (!self->_state.nowPlaying.singlePrimary.isAirPlayReceiverMRNowPlayingApp)
      {
        [(AirPlayReceiverMediaRemoteHelper *)self->_mediaRemoteHelper startNowPlayingSession];
        self->_state.nowPlaying.singlePrimary.isAirPlayReceiverMRNowPlayingApp = 1;
        [(AirPlayReceiverPlatform *)self setShouldHandleMRCommands:1];
        if (self->_server->var43) {
          [(AirPlayReceiverMediaRemoteHelper *)self->_mediaRemoteHelper broadcastPauseCommand];
        }
        [(AirPlayReceiverMediaRemoteHelper *)self->_mediaRemoteHelper associateNowPlayingSessionWithAudioSession:[[+[APAVAudioSessionManager mediaSessionManager] session] opaqueSessionID]];
      }
      uint64_t v7 = *p_mainMediaReceiverSession;
      goto LABEL_17;
    }
    uint64_t v7 = *p_mainMediaReceiverSession;
    goto LABEL_19;
  }
LABEL_29:
  uint64_t v7 = self->_state.nowPlaying.multiPrimaries.mainMediaReceiverSession;
  p_mainMediaReceiverSession = &self->_state.nowPlaying.multiPrimaries.mainMediaReceiverSession;
  if (a3) {
LABEL_17:
  }
    CFRetain(a3);
LABEL_19:
  *p_mainMediaReceiverSession = a3;
  if (v7)
  {
    CFRelease(v7);
  }
}

- (void)setReceiverSessionCountAndUpdateStateIfNeeded:(unint64_t)a3
{
  unint64_t receiverSessionCount = self->_state.receiverSessionCount;
  if (receiverSessionCount == a3) {
    return;
  }
  if (gLogCategory_AirPlayReceiverPlatform <= 50)
  {
    if (gLogCategory_AirPlayReceiverPlatform != -1
      || (int v6 = _LogCategory_Initialize(), receiverSessionCount = self->_state.receiverSessionCount, v6))
    {
      unint64_t v10 = receiverSessionCount;
      unint64_t v11 = a3;
      LogPrintF();
      unint64_t receiverSessionCount = self->_state.receiverSessionCount;
    }
  }
  if (!a3 || !receiverSessionCount)
  {
    CFTypeRef cf = 0;
    if (a3)
    {
      if (gLogCategory_AirPlayReceiverPlatform <= 50
        && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      APSEnsureCanInitiatePlayback();
    }
    if ([+[APAVAudioSessionManager mediaSessionManager] setActive:a3 != 0 error:&cf])
    {
      if (gLogCategory_AirPlayReceiverPlatform > 50
        || gLogCategory_AirPlayReceiverPlatform == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_29;
      }
      uint64_t v7 = "de";
      if (a3) {
        uint64_t v7 = "";
      }
      unint64_t v10 = (unint64_t)v7;
    }
    else
    {
      if (gLogCategory_AirPlayReceiverPlatform > 90
        || gLogCategory_AirPlayReceiverPlatform == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_29;
      }
      uint64_t v8 = "de";
      if (a3) {
        uint64_t v8 = "";
      }
      unint64_t v10 = (unint64_t)v8;
      unint64_t v11 = (unint64_t)cf;
    }
    LogPrintF();
  }
LABEL_29:
  if (APSIsAPMSpeaker()
    && (APSIsMemberOfHTGroup()
     || APSSettingsIsFeatureEnabled() && APSIsMemberOfStereoPair())
    && a3
    && self->_state.receiverSessionCount > a3
    && !self->_useMediaRemotePerPlayerAPI)
  {
    CFTypeRef cf = 0;
    APReceiverSessionManagerCopyAirPlaySessionWithAttribute((uint64_t)self->_server->var33, 4, 0, &cf);
    CFTypeRef v9 = cf;
    if (cf) {
      goto LABEL_42;
    }
    if (gLogCategory_AirPlayReceiverPlatform <= 50
      && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[AirPlayReceiverMediaRemoteHelper setMRPlaybackState:](self->_mediaRemoteHelper, "setMRPlaybackState:", 3, v10, v11);
    CFTypeRef v9 = cf;
    if (cf) {
LABEL_42:
    }
      CFRelease(v9);
  }
  self->_state.unint64_t receiverSessionCount = a3;
  if (!APSMultiPrimariesEnabled()) {
    [(AirPlayReceiverPlatform *)self updateMRNowPlayingAppStateForSinglePrimary];
  }
}

- (void)updateActiveSessionRegistration:(AirPlayReceiverSessionPrivate *)a3 regType:(int)a4 regOp:(int)a5
{
  if (a4 <= 3 && (int v6 = &self->super.isa + a4, (v7 = v6[2]) != 0))
  {
    CFIndex Count = CFSetGetCount(v6[2]);
    if (a5) {
      CFSetRemoveValue(v7, a3);
    }
    else {
      CFSetAddValue(v7, a3);
    }
    [(AirPlayReceiverPlatform *)self setIsAmbientAudioActive:CFSetGetCount(self->_state.auxAudioSessions) > 0];
    [(AirPlayReceiverPlatform *)self setIsMediaAudioActive:CFSetGetCount(self->_state.mediaAudioSessions) > 0];
    [(AirPlayReceiverPlatform *)self setIsVideoActive:CFSetGetCount(self->_state.mediaVideoSessions) > 0];
    [(AirPlayReceiverPlatform *)self setIsScreenActive:CFSetGetCount(self->_state.screenSessions) > 0];
    if (Count != CFSetGetCount(v7) && a3->var11 == 128)
    {
      if (a5)
      {
        if (a5 != 1) {
          return;
        }
        unsigned int v11 = self->_state.activeNANLinkRetainCount - 1;
        self->_state.activeNANLinkRetainCFIndex Count = v11;
        if (v11) {
          return;
        }
        var4 = self->_server->var4;
        int v13 = 0;
      }
      else
      {
        activeNANLinkRetainCFIndex Count = self->_state.activeNANLinkRetainCount;
        self->_state.activeNANLinkRetainCFIndex Count = activeNANLinkRetainCount + 1;
        if (activeNANLinkRetainCount) {
          return;
        }
        var4 = self->_server->var4;
        int v13 = 1;
      }
      APAdvertiserUpdateNANLinkStatus((uint64_t)var4, v13);
    }
  }
  else
  {
    APSLogErrorAt();
  }
}

- (void)_handleVolumeControlTypeChange
{
  IsAppleTV();
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F318F8], "sharedAVSystemController"), "currentRouteHasVolumeControl");
  if (gLogCategory_AirPlayReceiverPlatform <= 50
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  CFObjectSetPropertyInt64();
}

- (void)_unregisterAVSystemControllerNotifications
{
  int v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  if (gLogCategory_AirPlayReceiverPlatform <= 50
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    BOOL v5 = self;
    LogPrintF();
  }
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x263F318E0], 0, v5);
  [v3 removeObserver:self name:*MEMORY[0x263F318F0] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F318D8] object:0];
  uint64_t v4 = *MEMORY[0x263F318C8];

  [v3 removeObserver:self name:v4 object:0];
}

- (void)_registerAVSystemControllerNotifications
{
  v13[4] = *MEMORY[0x263EF8340];
  int v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = (void *)[MEMORY[0x263F318F8] sharedAVSystemController];
  if (gLogCategory_AirPlayReceiverPlatform <= 50
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    int v12 = self;
    LogPrintF();
  }
  BOOL v5 = (void *)MEMORY[0x263F318E0];
  int v6 = (void *)MEMORY[0x263F318F0];
  uint64_t v7 = *MEMORY[0x263F318F0];
  v13[0] = *MEMORY[0x263F318E0];
  v13[1] = v7;
  uint64_t v8 = (void *)MEMORY[0x263F318D8];
  CFTypeRef v9 = (void *)MEMORY[0x263F318C8];
  uint64_t v10 = *MEMORY[0x263F318C8];
  v13[2] = *MEMORY[0x263F318D8];
  v13[3] = v10;
  uint64_t v11 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v13, 4, v12);
  [v4 setAttribute:v11 forKey:*MEMORY[0x263F318E8] error:0];
  [v3 addObserver:self selector:sel__avSystemControllerConnectionDied_ name:*v5 object:v4];
  if (APSIsAPMSpeaker())
  {
    if (gLogCategory_AirPlayReceiverPlatform <= 50
      && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [v3 addObserver:self selector:sel__avSystemControllerVolumeChanged_ name:*v6 object:v4];
    [v3 addObserver:self selector:sel__avSystemControllerMuteChanged_ name:*v8 object:v4];
  }
  if ([v4 currentRouteHasVolumeControl])
  {
    if (gLogCategory_AirPlayReceiverPlatform <= 50
      && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [v3 addObserver:self selector:sel__avSystemControllerVolumeConfigChanged_ name:*v9 object:v4];
  }
}

- (void)_fetchInitialStates
{
  if (gLogCategory_AirPlayReceiverPlatform <= 50
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    uint64_t v4 = self;
    LogPrintF();
  }
  [(AirPlayReceiverPlatform *)self _handleVolumeControlTypeChange];
  if (APSIsAPMSpeaker())
  {
    self->_state.volumeSliderValue = _GetHWVolumeSliderValue();
    APSVolumeConvertSliderValueToDB();
    CFObjectSetPropertyDouble();
    int v3 = (void *)[MEMORY[0x263F318F8] sharedAVSystemController];
    self->_state.isMuted = objc_msgSend((id)objc_msgSend(v3, "attributeForKey:", *MEMORY[0x263F318D0]), "BOOLValue");
    CFObjectSetProperty();
    if (gLogCategory_AirPlayReceiverPlatform <= 50
      && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_avSystemControllerConnectionDied:(id)a3
{
  if (gLogCategory_AirPlayReceiverPlatform <= 90
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    BOOL v5 = self;
    LogPrintF();
  }
  [(AirPlayReceiverPlatform *)self _unregisterAVSystemControllerNotifications];
  [(AirPlayReceiverPlatform *)self _registerAVSystemControllerNotifications];
  var14 = self->_server->var14;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__AirPlayReceiverPlatform__avSystemControllerConnectionDied___block_invoke;
  block[3] = &unk_264895FB0;
  block[4] = self;
  dispatch_sync(var14, block);
}

uint64_t __61__AirPlayReceiverPlatform__avSystemControllerConnectionDied___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _fetchInitialStates];
}

- (void)_avSystemControllerMuteChanged:(id)a3
{
  float HWVolumeSliderValue = _GetHWVolumeSliderValue();
  BOOL v5 = (void *)[MEMORY[0x263F318F8] sharedAVSystemController];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(v5, "attributeForKey:", *MEMORY[0x263F318D0]), "BOOLValue");
  *(float *)&double v7 = HWVolumeSliderValue;
  [(AirPlayReceiverPlatform *)self _updateVolume:v6 andMute:0 becauseVolumeChanged:v7];
  var14 = self->_server->var14;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__AirPlayReceiverPlatform__avSystemControllerMuteChanged___block_invoke;
  v9[3] = &unk_2648952D8;
  v9[4] = self;
  char v10 = v6;
  dispatch_async(var14, v9);
  CFObjectSetProperty();
}

uint64_t __58__AirPlayReceiverPlatform__avSystemControllerMuteChanged___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 88) = *(unsigned char *)(result + 40);
  return result;
}

- (void)_avSystemControllerVolumeChanged:(id)a3
{
  uint64_t v4 = (void *)[a3 userInfo];
  if (objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x263F318C0]), "isEqual:", @"Audio/Video"))
  {
    float HWVolumeSliderValue = _GetHWVolumeSliderValue();
    uint64_t v6 = (void *)[MEMORY[0x263F318F8] sharedAVSystemController];
    uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "attributeForKey:", *MEMORY[0x263F318D0]), "BOOLValue");
    *(float *)&double v8 = HWVolumeSliderValue;
    [(AirPlayReceiverPlatform *)self _updateVolume:v7 andMute:1 becauseVolumeChanged:v8];
    var14 = self->_server->var14;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __60__AirPlayReceiverPlatform__avSystemControllerVolumeChanged___block_invoke;
    v10[3] = &unk_2648952B0;
    v10[4] = self;
    float v11 = HWVolumeSliderValue;
    dispatch_async(var14, v10);
    APSVolumeConvertSliderValueToDB();
    CFObjectSetPropertyDouble();
  }
}

float __60__AirPlayReceiverPlatform__avSystemControllerVolumeChanged___block_invoke(uint64_t a1)
{
  float result = *(float *)(a1 + 40);
  *(float *)(*(void *)(a1 + 32) + 84) = result;
  return result;
}

- (int)_updateVolume:(float)a3 andMute:(unsigned __int8)a4 becauseVolumeChanged:(unsigned __int8)a5
{
  int v5 = a5;
  int v6 = a4;
  if (gLogCategory_AirPlayReceiverPlatform <= 50
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (Mutable)
  {
    CFTypeRef v9 = Mutable;
    int v10 = CFDictionarySetDouble();
    if (v10)
    {
      int v16 = v10;
    }
    else
    {
      float v11 = (const void *)*MEMORY[0x263EFFB40];
      int v12 = (const void *)*MEMORY[0x263EFFB38];
      if (v6) {
        int v13 = (const void *)*MEMORY[0x263EFFB40];
      }
      else {
        int v13 = (const void *)*MEMORY[0x263EFFB38];
      }
      CFDictionarySetValue(v9, @"isMuted", v13);
      if (v5) {
        int v14 = v11;
      }
      else {
        int v14 = v12;
      }
      CFDictionarySetValue(v9, @"isVolumeUpdate", v14);
      int v16 = AirPlayReceiverServerControl((uint64_t)self->_server, v15, @"sendVolumeUpdate", 0, v9, 0);
      if (!v16)
      {
        CFRelease(v9);
        return v16;
      }
    }
    APSLogErrorAt();
    CFRelease(v9);
  }
  else
  {
    APSLogErrorAt();
    int v16 = -6728;
  }
  if (gLogCategory_AirPlayReceiverPlatform <= 50
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v16;
}

- (void)_avSystemControllerVolumeConfigChanged:(id)a3
{
  uint64_t v4 = (void *)[a3 userInfo];
  objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x263F318C0]), "BOOLValue");
  if (gLogCategory_AirPlayReceiverPlatform <= 50
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  [(AirPlayReceiverPlatform *)self _handleVolumeControlTypeChange];
}

- (void)_handleNowPlayingAppStartedPlaying:(id)a3
{
  int v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"APReceiverMediaRemoteHelperUserInfoKeyNowPlayingAppProcessIdentifier"), "intValue");
  int v6 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"kAPReceiverMediaRemoteHelperUserInfoKeyNowPlayingAppProcessDisplayName");
  int v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"APReceiverMediaRemoteHelperUserInfoKeyNowPlayingAppIsPlaying"), "BOOLValue");
  if (v5 != getpid() && v7 && !self->_server->var40)
  {
    double v8 = self;
    id v9 = v6;
    var14 = self->_server->var14;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__AirPlayReceiverPlatform__handleNowPlayingAppStartedPlaying___block_invoke;
    block[3] = &unk_264895288;
    block[4] = self;
    void block[5] = v6;
    int v12 = v5;
    dispatch_async(var14, block);
  }
  CFObjectSetProperty();
}

void __62__AirPlayReceiverPlatform__handleNowPlayingAppStartedPlaying___block_invoke(uint64_t a1, int a2)
{
  int v3 = *(unsigned char **)(a1 + 32);
  if (!v3[49] && !v3[50])
  {
    if (gLogCategory_AirPlayReceiverPlatform <= 60
      && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    AirPlayReceiverServerControl(*(void *)(*(void *)(a1 + 32) + 8), a2, @"otherProcessStartedPlaying", 0, 0, 0);
    int v3 = *(unsigned char **)(a1 + 32);
  }

  uint64_t v4 = *(void **)(a1 + 40);
}

- (void)handleMRCommand:(unsigned int)a3 translatedAPCommand:(unsigned int)a4 withOptions:(__CFDictionary *)a5
{
  CFRetain(self->_server);
  if (a5) {
    CFRetain(a5);
  }
  var14 = self->_server->var14;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__AirPlayReceiverPlatform_handleMRCommand_translatedAPCommand_withOptions___block_invoke;
  block[3] = &unk_264895260;
  unsigned int v11 = a3;
  unsigned int v12 = a4;
  block[4] = self;
  void block[5] = a5;
  dispatch_async(var14, block);
}

void __75__AirPlayReceiverPlatform_handleMRCommand_translatedAPCommand_withOptions___block_invoke(uint64_t a1)
{
  CFTypeRef cf = 0;
  APReceiverSessionManagerCopyAirPlaySessionWithAttribute(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 216), 0, 0, &cf);
  v2 = cf;
  if (cf)
  {
    if (gLogCategory_AirPlayReceiverPlatform <= 50)
    {
      if (gLogCategory_AirPlayReceiverPlatform != -1 || (int v3 = _LogCategory_Initialize(), v2 = cf, v3))
      {
        LogPrintF();
        v2 = cf;
      }
    }
    AirPlayReceiverSessionSendMediaRemoteCommand(v2, *(unsigned int *)(a1 + 48), *(_DWORD *)(a1 + 52), *(const void **)(a1 + 40));
  }
  CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 8));
  uint64_t v4 = *(const void **)(a1 + 40);
  if (v4) {
    CFRelease(v4);
  }
  if (cf) {
    CFRelease(cf);
  }
}

@end