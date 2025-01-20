@interface VCAudioSessionAVAS
+ (SEL)selectorForNotification:(id)a3;
+ (unsigned)muteReasonFromMuteChangedInfo:(id)a3;
- (BOOL)applyAudioSessionMediaProperties:(id)a3;
- (BOOL)applyRequestedProperties:(id)a3 propertyOrder:(id)a4;
- (BOOL)applyRequestedProperty:(id)a3 defaultValue:(void *)a4;
- (BOOL)handleNetworkUplinkClockConfigurationUpdate:(id)a3;
- (BOOL)hasStarted;
- (BOOL)internalSelectMicrophoneWithType:(unsigned int)a3;
- (BOOL)isInputAvailable;
- (BOOL)isInputSupported;
- (BOOL)microphoneMuted;
- (BOOL)setSampleRate:(double)a3;
- (BOOL)setSessionProperty:(id)a3 value:(id)a4;
- (BOOL)setUpCMSessionToAVAudioSessionMapping;
- (BOOL)setUpGenericSessionProperties;
- (BOOL)setUpNotificationsArray;
- (BOOL)setVPBlockConfigurationProperties:(id)a3;
- (BOOL)shouldSetupSharePlayWithOperatingMode:(unsigned int)a3 isSharePlayCapable:(BOOL *)a4;
- (BOOL)startInternal;
- (BOOL)startSessionWithMediaProperties:(id)a3 sessionRef:(unsigned int *)a4;
- (BOOL)stopSession;
- (VCAudioSessionAVAS)initWithMode:(int)a3;
- (double)externalInputAudioLatency;
- (double)externalOutputAudioLatency;
- (id)avAudioSessionKeyFromCMSessionKey:(id)a3;
- (unint64_t)avAudioSessionAllowedRouteTypesFromCMSession:(id)a3;
- (void)applyAudioSessionMediaPropertiesForSystemAudio;
- (void)applyAudioSessionProperties;
- (void)applyClientPid;
- (void)dealloc;
- (void)deregisterObserverNotifications;
- (void)destroyAudioSession;
- (void)dispatchedApplyMicrophoneMute:(BOOL)a3;
- (void)dispatchedInvokeMuteStateChangedHandlerWithIsMuted:(BOOL)a3 reason:(unsigned __int8)a4;
- (void)dispatchedSetVPBlockConfigurationProperties:(BOOL)a3;
- (void)handleAudioSessionInputMuteChangeNotification:(id)a3;
- (void)handleAudioSessionInterruption:(id)a3;
- (void)handleAudioSessionMediaServicesWereLostNotification:(id)a3;
- (void)handleAudioSessionMediaServicesWereResetNotification:(id)a3;
- (void)handleAudioSessionRouteChangeNotification:(id)a3;
- (void)handleOutputSampleRateChange:(id)a3;
- (void)handleSecureMicNotificationWithInterruptionInfo:(id)a3;
- (void)registerObserverNotifications;
- (void)resetOverrideRoute;
- (void)scheduleDeferredNetworkUplinkClockUpdate;
- (void)setAudioClockDeviceEnabled:(BOOL)a3;
- (void)setBlockSize:(double)a3 sampleRate:(double)a4 force:(BOOL)a5;
- (void)setExternalInputAudioLatency:(double)a3;
- (void)setExternalOutputAudioLatency:(double)a3;
- (void)setMicrophoneMuted:(BOOL)a3;
- (void)setMuteStateChangedHandler:(id)a3 delegateQueue:(id)a4;
- (void)setOptimizedTelephonyHandoverSettings:(BOOL)a3 networkUplinkClockUsesBaseband:(BOOL)a4;
- (void)setSpeakerProperty:(id)a3;
- (void)setupInputBeamforming;
- (void)stopSession;
@end

@implementation VCAudioSessionAVAS

- (BOOL)setUpCMSessionToAVAudioSessionMapping
{
  v15[10] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F15070];
  uint64_t v4 = *MEMORY[0x1E4F75BC0];
  v14[0] = *MEMORY[0x1E4F75B90];
  v14[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F15080];
  v15[0] = v3;
  v15[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F15078];
  uint64_t v7 = *MEMORY[0x1E4F75A58];
  v14[2] = *MEMORY[0x1E4F75BA0];
  v14[3] = v7;
  uint64_t v8 = *MEMORY[0x1E4F15050];
  v15[2] = v6;
  v15[3] = v8;
  uint64_t v9 = *MEMORY[0x1E4F14F90];
  uint64_t v10 = *MEMORY[0x1E4F758D0];
  v14[4] = *MEMORY[0x1E4F75928];
  v14[5] = v10;
  uint64_t v11 = *MEMORY[0x1E4F14F98];
  v15[4] = v9;
  v15[5] = v11;
  v14[6] = &unk_1F3DC59E8;
  v14[7] = &unk_1F3DC5A18;
  v15[6] = &unk_1F3DC5A00;
  v15[7] = &unk_1F3DC5A30;
  v14[8] = @"AirTunes";
  v14[9] = @"HeadphonesBT";
  v15[8] = &unk_1F3DC5A48;
  v15[9] = &unk_1F3DC5A60;
  v12 = (NSDictionary *)(id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:10];
  self->_cmSessionToAVAudioSessionMapping = v12;
  return v12 != 0;
}

- (BOOL)setUpGenericSessionProperties
{
  v8[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v4 = *MEMORY[0x1E4F76290];
  v8[0] = *MEMORY[0x1E4F76008];
  v8[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F76550];
  v8[2] = *MEMORY[0x1E4F761B0];
  v8[3] = v5;
  uint64_t v6 = (NSSet *)objc_msgSend(v3, "initWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v8, 4));
  self->_genericSessionProperties = v6;
  return v6 != 0;
}

+ (SEL)selectorForNotification:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)*MEMORY[0x1E4F14FD8], "isEqualToString:")) {
    return sel_handleAudioSessionInputMuteChangeNotification_;
  }
  if ([(id)*MEMORY[0x1E4F15000] isEqualToString:a3]) {
    return sel_handleAudioSessionInterruption_;
  }
  if ([(id)*MEMORY[0x1E4F150A0] isEqualToString:a3]) {
    return sel_handleOutputSampleRateChange_;
  }
  if ([(id)*MEMORY[0x1E4F15030] isEqualToString:a3]) {
    return sel_handleAudioSessionMediaServicesWereLostNotification_;
  }
  if ([(id)*MEMORY[0x1E4F15048] isEqualToString:a3]) {
    return sel_handleAudioSessionMediaServicesWereResetNotification_;
  }
  if ([(id)*MEMORY[0x1E4F15168] isEqualToString:a3]) {
    return sel_handleAudioSessionRouteChangeNotification_;
  }
  if ((id)objc_opt_class() == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCAudioSessionAVAS selectorForNotification:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[a1 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v9 = 136316418;
        uint64_t v10 = v7;
        __int16 v11 = 2080;
        v12 = "+[VCAudioSessionAVAS selectorForNotification:]";
        __int16 v13 = 1024;
        int v14 = 126;
        __int16 v15 = 2112;
        v16 = v6;
        __int16 v17 = 2048;
        id v18 = a1;
        __int16 v19 = 2112;
        id v20 = a3;
        _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unrecognized notification=%@, returning NULL selector", (uint8_t *)&v9, 0x3Au);
      }
    }
  }
  return 0;
}

- (BOOL)setUpNotificationsArray
{
  v9[6] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  uint64_t v4 = *MEMORY[0x1E4F15000];
  v9[0] = *MEMORY[0x1E4F14FD8];
  v9[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F15030];
  v9[2] = *MEMORY[0x1E4F150A0];
  v9[3] = v5;
  uint64_t v6 = *MEMORY[0x1E4F15168];
  v9[4] = *MEMORY[0x1E4F15048];
  v9[5] = v6;
  uint64_t v7 = (NSOrderedSet *)objc_msgSend(v3, "initWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v9, 6));
  self->_avAudioSessionNotifications = v7;
  return v7 != 0;
}

- (VCAudioSessionAVAS)initWithMode:(int)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)VCAudioSessionAVAS;
  id v3 = [(VCAudioSession *)&v6 initWithMode:*(void *)&a3];
  uint64_t v4 = v3;
  if (v3
    && (![(VCAudioSessionAVAS *)v3 setUpCMSessionToAVAudioSessionMapping]
     || ![(VCAudioSessionAVAS *)v4 setUpGenericSessionProperties]
     || ![(VCAudioSessionAVAS *)v4 setUpNotificationsArray]))
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [(VCAudioSessionAVAS *)self destroyAudioSession];
  _Block_release(self->_muteStateChangedHandler);
  muteStateChangedHandlerQueue = self->_muteStateChangedHandlerQueue;
  if (muteStateChangedHandlerQueue) {
    dispatch_release(muteStateChangedHandlerQueue);
  }

  v4.receiver = self;
  v4.super_class = (Class)VCAudioSessionAVAS;
  [(VCAudioSession *)&v4 dealloc];
}

- (void)resetOverrideRoute
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  avAudioSession = self->_avAudioSession;
  if (avAudioSession)
  {
    uint64_t v10 = 0;
    if ([(AVAudioSession *)avAudioSession overrideOutputAudioPort:0 error:&v10]) {
      BOOL v4 = v10 == 0;
    }
    else {
      BOOL v4 = 0;
    }
    if (!v4 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      objc_super v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = self->_avAudioSession;
        *(_DWORD *)buf = 136316418;
        uint64_t v12 = v5;
        __int16 v13 = 2080;
        int v14 = "-[VCAudioSessionAVAS resetOverrideRoute]";
        __int16 v15 = 1024;
        int v16 = 181;
        __int16 v17 = 2048;
        id v18 = v7;
        __int16 v19 = 2112;
        id v20 = v7;
        __int16 v21 = 2112;
        uint64_t v22 = v10;
        _os_log_error_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d _avAudioSession=%p [%@] overrideOutputAudioPort:AVAudioSessionPortOverrideNone failed with error=%@", buf, 0x3Au);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    int v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v12 = v8;
      __int16 v13 = 2080;
      int v14 = "-[VCAudioSessionAVAS resetOverrideRoute]";
      __int16 v15 = 1024;
      int v16 = 175;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Error no AVAudioSession", buf, 0x1Cu);
    }
  }
}

- (BOOL)setSessionProperty:(id)a3 value:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (self->_avAudioSession)
  {
    uint64_t v16 = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        avAudioSession = self->_avAudioSession;
        *(_DWORD *)buf = 136316674;
        uint64_t v18 = v7;
        __int16 v19 = 2080;
        id v20 = "-[VCAudioSessionAVAS setSessionProperty:value:]";
        __int16 v21 = 1024;
        int v22 = 192;
        __int16 v23 = 2048;
        v24 = avAudioSession;
        __int16 v25 = 2112;
        v26 = avAudioSession;
        __int16 v27 = 2112;
        id v28 = a3;
        __int16 v29 = 2112;
        id v30 = a4;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _avAudioSession=%p [%@] setting propertyKey=%@ to propertyValue=%@", buf, 0x44u);
      }
    }
    char v10 = [(AVAudioSession *)self->_avAudioSession setMXSessionProperty:a3 value:a4 error:&v16];
    if (v16) {
      BOOL v11 = 0;
    }
    else {
      BOOL v11 = v10;
    }
    if (!v11 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      __int16 v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v14 = self->_avAudioSession;
        *(_DWORD *)buf = 136316930;
        uint64_t v18 = v12;
        __int16 v19 = 2080;
        id v20 = "-[VCAudioSessionAVAS setSessionProperty:value:]";
        __int16 v21 = 1024;
        int v22 = 199;
        __int16 v23 = 2048;
        v24 = v14;
        __int16 v25 = 2112;
        v26 = v14;
        __int16 v27 = 2112;
        id v28 = a3;
        __int16 v29 = 2112;
        id v30 = a4;
        __int16 v31 = 2112;
        uint64_t v32 = v16;
        _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d _avAudioSession=%p [%@] setting propertyKey=%@ with propertyValue=%@ failed with error=%@", buf, 0x4Eu);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioSessionAVAS setSessionProperty:value:]();
      }
    }
    return 0;
  }
  return v11;
}

- (BOOL)applyRequestedProperties:(id)a3 propertyOrder:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (self->_avAudioSession)
  {
    if (!a3 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioSessionAVAS applyRequestedProperties:propertyOrder:]();
      }
    }
    id v35 = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v37 = v6;
        __int16 v38 = 2080;
        v39 = "-[VCAudioSessionAVAS applyRequestedProperties:propertyOrder:]";
        __int16 v40 = 1024;
        int v41 = 217;
        __int16 v42 = 2112;
        id v43 = a3;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Batch set properties=%@", buf, 0x26u);
      }
    }
    char v30 = -[AVAudioSession setMXProperties:propertyErrors:](self->_avAudioSession, "setMXProperties:propertyErrors:", a3, &v35, 304);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = v35;
    uint64_t v33 = [v35 countByEnumeratingWithState:&v54 objects:v53 count:16];
    if (v33)
    {
      uint64_t v32 = *(void *)v55;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v55 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = v8;
          int v9 = *(void **)(*((void *)&v54 + 1) + 8 * v8);
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          char v10 = (void *)[v9 allKeys];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v49 objects:v48 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v50;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v50 != v13) {
                  objc_enumerationMutation(v10);
                }
                __int16 v15 = *(void **)(*((void *)&v49 + 1) + 8 * i);
                if (objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v15), "unsignedIntValue")|| !objc_msgSend(a3, "objectForKeyedSubscript:", v15))
                {
                  [(NSMutableDictionary *)self->super._currentAudioSessionProperties setObject:0 forKeyedSubscript:v15];
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
                  {
                    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
                    __int16 v17 = *MEMORY[0x1E4F47A50];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v18 = [a3 objectForKeyedSubscript:v15];
                      *(_DWORD *)buf = 136316162;
                      uint64_t v37 = v16;
                      __int16 v38 = 2080;
                      v39 = "-[VCAudioSessionAVAS applyRequestedProperties:propertyOrder:]";
                      __int16 v40 = 1024;
                      int v41 = 227;
                      __int16 v42 = 2112;
                      id v43 = v15;
                      __int16 v44 = 2112;
                      uint64_t v45 = v18;
                      __int16 v19 = v17;
                      id v20 = " [%s] %s:%d Failed to set property=%@ value=%@";
LABEL_27:
                      _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0x30u);
                      continue;
                    }
                  }
                }
                else
                {
                  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._currentAudioSessionProperties, "setObject:forKeyedSubscript:", [a3 objectForKeyedSubscript:v15], v15);
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                  {
                    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
                    int v22 = *MEMORY[0x1E4F47A50];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v23 = [a3 objectForKeyedSubscript:v15];
                      *(_DWORD *)buf = 136316162;
                      uint64_t v37 = v21;
                      __int16 v38 = 2080;
                      v39 = "-[VCAudioSessionAVAS applyRequestedProperties:propertyOrder:]";
                      __int16 v40 = 1024;
                      int v41 = 224;
                      __int16 v42 = 2112;
                      id v43 = v15;
                      __int16 v44 = 2112;
                      uint64_t v45 = v23;
                      __int16 v19 = v22;
                      id v20 = " [%s] %s:%d Succeeded in setting property=%@ value=%@";
                      goto LABEL_27;
                    }
                  }
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v49 objects:v48 count:16];
            }
            while (v12);
          }
          uint64_t v8 = v34 + 1;
        }
        while (v34 + 1 != v33);
        uint64_t v33 = [obj countByEnumeratingWithState:&v54 objects:v53 count:16];
      }
      while (v33);
    }
    BOOL v24 = v30;
    if ((v30 & 1) == 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        __int16 v27 = *(Class *)((char *)&self->super.super.super.isa + v29);
        *(_DWORD *)buf = 136316418;
        uint64_t v37 = v25;
        __int16 v38 = 2080;
        v39 = "-[VCAudioSessionAVAS applyRequestedProperties:propertyOrder:]";
        __int16 v40 = 1024;
        int v41 = 233;
        __int16 v42 = 2048;
        id v43 = v27;
        __int16 v44 = 2112;
        uint64_t v45 = (uint64_t)v27;
        __int16 v46 = 2112;
        id v47 = v35;
        _os_log_error_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_ERROR, " [%s] %s:%d _avAudioSession=%p [%@] failed to batch set property keys with errors=%@", buf, 0x3Au);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioSessionAVAS applyRequestedProperties:propertyOrder:]();
      }
    }
    return 0;
  }
  return v24;
}

- (BOOL)hasStarted
{
  return self->_avAudioSession != 0;
}

- (BOOL)isInputAvailable
{
  avAudioSession = self->_avAudioSession;
  if (avAudioSession) {
    LOBYTE(avAudioSession) = [(AVAudioSession *)avAudioSession isInputAvailable];
  }
  return (char)avAudioSession;
}

- (BOOL)isInputSupported
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (![(VCAudioSessionAVAS *)self isInputAvailable])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      LOBYTE(v4) = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return v4;
      }
      avAudioSession = self->_avAudioSession;
      int v12 = 136315906;
      uint64_t v13 = v5;
      __int16 v14 = 2080;
      __int16 v15 = "-[VCAudioSessionAVAS isInputSupported]";
      __int16 v16 = 1024;
      int v17 = 249;
      __int16 v18 = 2112;
      __int16 v19 = avAudioSession;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d No input available avAudioSession=%@", (uint8_t *)&v12, 0x26u);
    }
    LOBYTE(v4) = 0;
    return v4;
  }
  id v3 = [(AVAudioSession *)self->_avAudioSession category];
  int v4 = [(NSString *)v3 isEqualToString:*MEMORY[0x1E4F14F90]]
    || [(NSString *)v3 isEqualToString:*MEMORY[0x1E4F14FA8]];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    int v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      char v10 = self->_avAudioSession;
      int v12 = 136316418;
      uint64_t v13 = v8;
      __int16 v14 = 2080;
      __int16 v15 = "-[VCAudioSessionAVAS isInputSupported]";
      __int16 v16 = 1024;
      int v17 = 255;
      __int16 v18 = 2112;
      __int16 v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v3;
      __int16 v22 = 1024;
      int v23 = v4;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Configured avAudioSession=%@ with category=%@, categorySupportsInput=%{BOOL}d", (uint8_t *)&v12, 0x36u);
    }
  }
  return v4;
}

- (void)setSpeakerProperty:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F76008];
  uint64_t v5 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F76008]];

  [(VCAudioSessionAVAS *)self setSessionProperty:v4 value:v5];
}

- (id)avAudioSessionKeyFromCMSessionKey:(id)a3
{
  id result = -[NSDictionary objectForKeyedSubscript:](self->_cmSessionToAVAudioSessionMapping, "objectForKeyedSubscript:");
  if (!result) {
    return a3;
  }
  return result;
}

- (unint64_t)avAudioSessionAllowedRouteTypesFromCMSession:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v29 objects:v28 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v7 = v5;
  unint64_t v8 = 0;
  uint64_t v9 = *(void *)v30;
  *(void *)&long long v6 = 136316162;
  long long v17 = v6;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v30 != v9) {
        objc_enumerationMutation(a3);
      }
      id v11 = *(id *)(*((void *)&v29 + 1) + 8 * i);
      id v12 = -[VCAudioSessionAVAS avAudioSessionKeyFromCMSessionKey:](self, "avAudioSessionKeyFromCMSessionKey:", v11, v17);
      if (v12 == v11)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v13 = VRTraceErrorLogLevelToCSTR();
          __int16 v14 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            cmSessionToAVAudioSessionMapping = self->_cmSessionToAVAudioSessionMapping;
            *(_DWORD *)buf = v17;
            uint64_t v19 = v13;
            __int16 v20 = 2080;
            uint64_t v21 = "-[VCAudioSessionAVAS avAudioSessionAllowedRouteTypesFromCMSession:]";
            __int16 v22 = 1024;
            int v23 = 273;
            __int16 v24 = 2112;
            uint64_t v25 = v11;
            __int16 v26 = 2112;
            __int16 v27 = cmSessionToAVAudioSessionMapping;
            _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d AllowedRouteType=%@ not found in mapping=%@", buf, 0x30u);
          }
        }
      }
      else
      {
        v8 |= [v12 unsignedIntegerValue];
      }
    }
    uint64_t v7 = [a3 countByEnumeratingWithState:&v29 objects:v28 count:16];
  }
  while (v7);
  return v8;
}

- (void)dispatchedSetVPBlockConfigurationProperties:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v5 = micro();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316162;
      uint64_t v9 = v6;
      __int16 v10 = 2080;
      id v11 = "-[VCAudioSessionAVAS dispatchedSetVPBlockConfigurationProperties:]";
      __int16 v12 = 1024;
      int v13 = 283;
      __int16 v14 = 1024;
      BOOL v15 = v3;
      __int16 v16 = 2048;
      unint64_t v17 = vcvtmd_u64_f64(v5);
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Dispatching scheduled=%d VPBlock update to set network uplink clock now (time=%llu sec), ", (uint8_t *)&v8, 0x2Cu);
    }
  }
  [(VCAudioSessionAVAS *)self setVPBlockConfigurationProperties:self->super._vpBlock];
}

- (void)scheduleDeferredNetworkUplinkClockUpdate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  self->_pendingVPBlockUpdate = 1;
  self->_unint64_t networkUplinkClockScheduledTime = vcvtmd_u64_f64(micro());
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unint64_t networkUplinkClockScheduledTime = self->_networkUplinkClockScheduledTime;
      *(_DWORD *)buf = 136315906;
      uint64_t v11 = v3;
      __int16 v12 = 2080;
      int v13 = "-[VCAudioSessionAVAS scheduleDeferredNetworkUplinkClockUpdate]";
      __int16 v14 = 1024;
      int v15 = 290;
      __int16 v16 = 2048;
      unint64_t v17 = networkUplinkClockScheduledTime;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting network uplink clock property on VPBlock now (time=%llu sec)", buf, 0x26u);
    }
  }
  unint64_t v6 = self->_networkUplinkClockScheduledTime;
  dispatch_time_t v7 = dispatch_time(0, 30000000000);
  dispatchQueue = self->super._dispatchQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__VCAudioSessionAVAS_scheduleDeferredNetworkUplinkClockUpdate__block_invoke;
  v9[3] = &unk_1E6DB4568;
  v9[4] = self;
  v9[5] = v6;
  dispatch_after(v7, dispatchQueue, v9);
}

uint64_t __62__VCAudioSessionAVAS_scheduleDeferredNetworkUplinkClockUpdate__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (*(unsigned char *)(result + 384))
  {
    if (*(void *)(a1 + 40) == *(void *)(result + 376)) {
      return [(id)result dispatchedSetVPBlockConfigurationProperties:0];
    }
  }
  return result;
}

- (BOOL)handleNetworkUplinkClockConfigurationUpdate:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  -[NSMutableDictionary setValue:forKey:](self->super._vpBlock, "setValue:forKey:", a3, [NSString stringWithUTF8String:"network uplink clock uses baseband"]);
  if (self->super._deferredNetworkUplinkClockEnabled)
  {
    [(VCAudioSessionAVAS *)self scheduleDeferredNetworkUplinkClockUpdate];
    return 1;
  }
  else
  {
    vpBlock = self->super._vpBlock;
    return [(VCAudioSessionAVAS *)self setVPBlockConfigurationProperties:vpBlock];
  }
}

- (BOOL)applyRequestedProperty:(id)a3 defaultValue:(void *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!self->_avAudioSession)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v12) {
        return v12;
      }
      -[VCAudioSessionAVAS applyRequestedProperty:defaultValue:]();
    }
LABEL_40:
    LOBYTE(v12) = 0;
    return v12;
  }
  id v7 = [(NSDictionary *)[(VCAudioSession *)self audioSessionProperties] objectForKeyedSubscript:a3];
  if (v7) {
    a4 = v7;
  }
  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v12) {
        return v12;
      }
      -[VCAudioSessionAVAS applyRequestedProperty:defaultValue:]();
    }
    goto LABEL_40;
  }
  uint64_t v22 = 0;
  id v8 = [(VCAudioSessionAVAS *)self avAudioSessionKeyFromCMSessionKey:a4];
  if ([(NSSet *)self->_genericSessionProperties containsObject:a3])
  {
LABEL_6:
    int v9 = [(VCAudioSessionAVAS *)self setSessionProperty:a3 value:a4];
    goto LABEL_7;
  }
  if ([a3 isEqualToString:*MEMORY[0x1E4F75F00]])
  {
    if (![v8 isEqualToString:a4])
    {
      int v9 = [(AVAudioSession *)self->_avAudioSession setMode:v8 error:&v22];
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v13 = *MEMORY[0x1E4F75EC8];
  if ([a3 isEqualToString:*MEMORY[0x1E4F75EC8]])
  {
    int v9 = [(AVAudioSession *)self->_avAudioSession setCategory:v8 error:&v22];
  }
  else if ([a3 isEqualToString:*MEMORY[0x1E4F75FC8]])
  {
    int v9 = -[AVAudioSession setInterruptionPriority:error:](self->_avAudioSession, "setInterruptionPriority:error:", [v8 integerValue], &v22);
  }
  else if ([a3 isEqualToString:*MEMORY[0x1E4F761F8]])
  {
    int v9 = [(AVAudioSession *)self->_avAudioSession setActivationContext:a4 error:&v22];
  }
  else if ([a3 isEqualToString:*MEMORY[0x1E4F75E90]])
  {
    unint64_t v14 = [(VCAudioSessionAVAS *)self avAudioSessionAllowedRouteTypesFromCMSession:a4];
    if (v14)
    {
      int v9 = [(AVAudioSession *)self->_avAudioSession setCategory:[(VCAudioSessionAVAS *)self avAudioSessionKeyFromCMSessionKey:[(NSMutableDictionary *)self->super._currentAudioSessionProperties objectForKeyedSubscript:v13]] withOptions:v14 error:&v22];
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        __int16 v20 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v24 = v19;
          __int16 v25 = 2080;
          __int16 v26 = "-[VCAudioSessionAVAS applyRequestedProperty:defaultValue:]";
          __int16 v27 = 1024;
          int v28 = 357;
          _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d No allowed route types, nothing to do", buf, 0x1Cu);
        }
      }
      int v9 = 1;
    }
  }
  else
  {
    if (![a3 isEqualToString:@"kVirtualAudioPluginVPBlockConfigurationNetworkUplinkClockUsesBaseband"])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        __int16 v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v24 = v15;
          __int16 v25 = 2080;
          __int16 v26 = "-[VCAudioSessionAVAS applyRequestedProperty:defaultValue:]";
          __int16 v27 = 1024;
          int v28 = 368;
          __int16 v29 = 2112;
          id v30 = a3;
          __int16 v31 = 2112;
          long long v32 = a4;
          _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d propertyKey=%@ is NOT explicitly mapped, value=%@", buf, 0x30u);
        }
      }
      goto LABEL_36;
    }
    int v9 = [(VCAudioSessionAVAS *)self handleNetworkUplinkClockConfigurationUpdate:a4];
  }
LABEL_7:
  if (!v9 || v22)
  {
LABEL_36:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v24 = v17;
        __int16 v25 = 2080;
        __int16 v26 = "-[VCAudioSessionAVAS applyRequestedProperty:defaultValue:]";
        __int16 v27 = 1024;
        int v28 = 375;
        __int16 v29 = 2112;
        id v30 = a3;
        __int16 v31 = 2112;
        long long v32 = a4;
        __int16 v33 = 2112;
        uint64_t v34 = v22;
        _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d Setting propertyKey=%@ failed, value=%@, error=%@", buf, 0x3Au);
      }
    }
    [(NSMutableDictionary *)self->super._currentAudioSessionProperties setObject:0 forKeyedSubscript:a3];
    goto LABEL_40;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v24 = v10;
      __int16 v25 = 2080;
      __int16 v26 = "-[VCAudioSessionAVAS applyRequestedProperty:defaultValue:]";
      __int16 v27 = 1024;
      int v28 = 372;
      __int16 v29 = 2112;
      id v30 = a3;
      __int16 v31 = 2112;
      long long v32 = a4;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Property propertyKey=%@ successfully set value=%@", buf, 0x30u);
    }
  }
  [(NSMutableDictionary *)self->super._currentAudioSessionProperties setObject:a4 forKeyedSubscript:a3];
  LOBYTE(v12) = 1;
  return v12;
}

- (void)applyAudioSessionMediaPropertiesForSystemAudio
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d _avAudioSession is nil, cannot set media properties for system audio", v2, v3, v4, v5, v6);
}

- (BOOL)shouldSetupSharePlayWithOperatingMode:(unsigned int)a3 isSharePlayCapable:(BOOL *)a4
{
  int playbackMode = self->super._playbackMode;
  if (!playbackMode)
  {
    BOOL v5 = a3 == 2;
    if (a3 == 4) {
      BOOL v5 = 1;
    }
    *a4 = v5;
    if (a3 == 4 || a3 == 2) {
      -[VCAudioSessionAVAS setSessionProperty:value:](self, "setSessionProperty:value:", *MEMORY[0x1E4F76308], [NSNumber numberWithBool:1]);
    }
  }
  return playbackMode == 0;
}

- (BOOL)setSampleRate:(double)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (self->super._isTetheredDisplayMode) {
    a3 = 48000.0;
  }
  [(AVAudioSession *)self->_avAudioSession preferredOutputSampleRate];
  double v6 = v5;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    id v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v23 = v7;
      __int16 v24 = 2080;
      __int16 v25 = "-[VCAudioSessionAVAS setSampleRate:]";
      __int16 v26 = 1024;
      int v27 = 428;
      __int16 v28 = 2048;
      double v29 = v6;
      __int16 v30 = 2048;
      double v31 = a3;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Getting: preferredOutputSampleRate currentPreferredSampleRate=%f -> wanted sampleRate=%f", buf, 0x30u);
    }
  }
  if (a3 == v6) {
    goto LABEL_16;
  }
  double v21 = 0.0;
  BOOL v9 = [(AVAudioSession *)self->_avAudioSession setPreferredSampleRate:&v21 error:a3];
  double v10 = v21;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v9 && *(void *)&v10 == 0)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      unint64_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        avAudioSession = self->_avAudioSession;
        *(_DWORD *)buf = 136316418;
        uint64_t v23 = v13;
        __int16 v24 = 2080;
        __int16 v25 = "-[VCAudioSessionAVAS setSampleRate:]";
        __int16 v26 = 1024;
        int v27 = 437;
        __int16 v28 = 2048;
        double v29 = *(double *)&avAudioSession;
        __int16 v30 = 2112;
        double v31 = *(double *)&avAudioSession;
        __int16 v32 = 2048;
        double v33 = a3;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d avAudioSession=%p [%@] setPreferredOutputSampleRate with sampleRate=%f", buf, 0x3Au);
      }
    }
LABEL_16:
    LOBYTE(v16) = 1;
    return v16;
  }
  if (ErrorLogLevelForModule >= 3)
  {
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    uint64_t v18 = *MEMORY[0x1E4F47A50];
    BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v16) {
      return v16;
    }
    uint64_t v19 = self->_avAudioSession;
    *(_DWORD *)buf = 136316418;
    uint64_t v23 = v17;
    __int16 v24 = 2080;
    __int16 v25 = "-[VCAudioSessionAVAS setSampleRate:]";
    __int16 v26 = 1024;
    int v27 = 435;
    __int16 v28 = 2048;
    double v29 = *(double *)&v19;
    __int16 v30 = 2112;
    double v31 = *(double *)&v19;
    __int16 v32 = 2112;
    double v33 = v21;
    _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d avAudioSession=%p [%@] setPreferredSampleRate failed with error=%@", buf, 0x3Au);
  }
  LOBYTE(v16) = 0;
  return v16;
}

- (void)setOptimizedTelephonyHandoverSettings:(BOOL)a3 networkUplinkClockUsesBaseband:(BOOL)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->super._useOptimizedHandoversForTelephony)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      id v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136316162;
        uint64_t v11 = v7;
        __int16 v12 = 2080;
        uint64_t v13 = "-[VCAudioSessionAVAS setOptimizedTelephonyHandoverSettings:networkUplinkClockUsesBaseband:]";
        __int16 v14 = 1024;
        int v15 = 446;
        __int16 v16 = 1024;
        BOOL v17 = v5;
        __int16 v18 = 1024;
        BOOL v19 = v4;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting optimized handover settings for Telephony. audioClockDeviceEnabled=%d, networkUplinkClockUsesBaseband=%d", (uint8_t *)&v10, 0x28u);
      }
    }
    [(VCAudioSessionAVAS *)self setAudioClockDeviceEnabled:v5];
    if (v5)
    {
      uint64_t v9 = [NSString stringWithUTF8String:"network uplink clock uses baseband"];
      -[NSMutableDictionary setValue:forKey:](self->super._vpBlock, "setValue:forKey:", [NSNumber numberWithBool:v4], v9);
    }
  }
}

- (void)setBlockSize:(double)a3 sampleRate:(double)a4 force:(BOOL)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  avAudioSession = self->_avAudioSession;
  if (avAudioSession)
  {
    BOOL v7 = a5;
    if (self->super._isTetheredDisplayMode) {
      a4 = 48000.0;
    }
    if (a5) {
      goto LABEL_47;
    }
    [(AVAudioSession *)avAudioSession sampleRate];
    a4 = v10;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      __int16 v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v46 = v11;
        __int16 v47 = 2080;
        v48 = "-[VCAudioSessionAVAS setBlockSize:sampleRate:force:]";
        __int16 v49 = 1024;
        int v50 = 470;
        __int16 v51 = 2048;
        double v52 = a4;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Route or AvailableSampleRate Changed: AVAudioSession CurrentHardwareSampleRate=%f", buf, 0x26u);
      }
    }
    if (self->super._hardwareSampleRate != a4)
    {
LABEL_47:
      if (VCFeatureFlagManager_UseBlockDurationHinting())
      {
        [(AVAudioSession *)self->_avAudioSession IOBufferDuration];
        double v14 = v13;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v15 = VRTraceErrorLogLevelToCSTR();
          __int16 v16 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316418;
            uint64_t v46 = v15;
            __int16 v47 = 2080;
            v48 = "-[VCAudioSessionAVAS setBlockSize:sampleRate:force:]";
            __int16 v49 = 1024;
            int v50 = 477;
            __int16 v51 = 2048;
            double v52 = v14;
            __int16 v53 = 2048;
            double v54 = a3;
            __int16 v55 = 2048;
            *(double *)long long v56 = 1.0 / a4;
            _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Current ioBufferDuration=%f Desired duration=%f Error=%f", buf, 0x3Au);
          }
        }
        if (!v7 && vabdd_f64(v14, a3) < 1.0 / a4) {
          goto LABEL_36;
        }
        uint64_t v44 = 0;
        BOOL v17 = [(AVAudioSession *)self->_avAudioSession setPreferredIOBufferDuration:&v44 error:a3];
        uint64_t v18 = v44;
        int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
        if (!v17 || v18 != 0)
        {
          if (ErrorLogLevelForModule < 3) {
            goto LABEL_36;
          }
          uint64_t v40 = VRTraceErrorLogLevelToCSTR();
          int v41 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            goto LABEL_36;
          }
          __int16 v42 = self->_avAudioSession;
          *(_DWORD *)buf = 136316674;
          uint64_t v46 = v40;
          __int16 v47 = 2080;
          v48 = "-[VCAudioSessionAVAS setBlockSize:sampleRate:force:]";
          __int16 v49 = 1024;
          int v50 = 481;
          __int16 v51 = 2048;
          double v52 = *(double *)&v42;
          __int16 v53 = 2112;
          double v54 = *(double *)&v42;
          __int16 v55 = 2048;
          *(double *)long long v56 = a3;
          *(_WORD *)&v56[8] = 2112;
          *(void *)&v56[10] = v44;
          uint64_t v37 = " [%s] %s:%d avAudioSession=%p [%@] setPreferredIOBufferDuration=%f failed with error=%@";
          __int16 v38 = v41;
          uint32_t v39 = 68;
          goto LABEL_44;
        }
        if (ErrorLogLevelForModule < 7) {
          goto LABEL_36;
        }
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        uint64_t v22 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_36;
        }
        uint64_t v23 = self->_avAudioSession;
        *(_DWORD *)buf = 136316674;
        uint64_t v46 = v21;
        __int16 v47 = 2080;
        v48 = "-[VCAudioSessionAVAS setBlockSize:sampleRate:force:]";
        __int16 v49 = 1024;
        int v50 = 482;
        __int16 v51 = 2048;
        double v52 = *(double *)&v23;
        __int16 v53 = 2112;
        double v54 = *(double *)&v23;
        __int16 v55 = 2048;
        *(double *)long long v56 = a3;
        *(_WORD *)&v56[8] = 1024;
        *(_DWORD *)&v56[10] = v7;
        __int16 v24 = " [%s] %s:%d avAudioSession=%p [%@] setPreferredIOBufferDuration=%f force=%{BOOL}d succeeded";
        __int16 v25 = v22;
        uint32_t v26 = 64;
      }
      else
      {
        signed int v43 = llround(a4 * a3);
        [(VCAudioSession *)self forceBufferFrames:&v43];
        uint64_t v44 = 0;
        int v27 = [(AVAudioSession *)self->_avAudioSession setPreferredIOBufferFrameSize:v43 error:&v44];
        uint64_t v28 = v44;
        int v29 = VRTraceGetErrorLogLevelForModule();
        if (v27) {
          BOOL v30 = v28 == 0;
        }
        else {
          BOOL v30 = 0;
        }
        if (!v30)
        {
          if (v29 < 3) {
            goto LABEL_36;
          }
          uint64_t v34 = VRTraceErrorLogLevelToCSTR();
          uint64_t v35 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            goto LABEL_36;
          }
          v36 = self->_avAudioSession;
          *(_DWORD *)buf = 136316674;
          uint64_t v46 = v34;
          __int16 v47 = 2080;
          v48 = "-[VCAudioSessionAVAS setBlockSize:sampleRate:force:]";
          __int16 v49 = 1024;
          int v50 = 492;
          __int16 v51 = 2048;
          double v52 = *(double *)&v36;
          __int16 v53 = 2112;
          double v54 = *(double *)&v36;
          __int16 v55 = 1024;
          *(_DWORD *)long long v56 = v43;
          *(_WORD *)&v56[4] = 2112;
          *(void *)&v56[6] = v44;
          uint64_t v37 = " [%s] %s:%d avAudioSession=%p [%@] setPreferredIOBufferFrameSize=%d failed with error=%@";
          __int16 v38 = v35;
          uint32_t v39 = 64;
LABEL_44:
          _os_log_error_impl(&dword_1E1EA4000, v38, OS_LOG_TYPE_ERROR, v37, buf, v39);
          goto LABEL_36;
        }
        if (v29 < 7) {
          goto LABEL_36;
        }
        uint64_t v31 = VRTraceErrorLogLevelToCSTR();
        __int16 v32 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_36;
        }
        double v33 = self->_avAudioSession;
        *(_DWORD *)buf = 136316674;
        uint64_t v46 = v31;
        __int16 v47 = 2080;
        v48 = "-[VCAudioSessionAVAS setBlockSize:sampleRate:force:]";
        __int16 v49 = 1024;
        int v50 = 493;
        __int16 v51 = 2048;
        double v52 = *(double *)&v33;
        __int16 v53 = 2112;
        double v54 = *(double *)&v33;
        __int16 v55 = 1024;
        *(_DWORD *)long long v56 = v43;
        *(_WORD *)&v56[4] = 1024;
        *(_DWORD *)&v56[6] = v7;
        __int16 v24 = " [%s] %s:%d avAudioSession=%p [%@] setPreferredIOBufferFrameSize=%d force=%{BOOL}d succeeded";
        __int16 v25 = v32;
        uint32_t v26 = 60;
      }
      _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
LABEL_36:
      self->super._hardwareSampleRate = a4;
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioSessionAVAS setBlockSize:sampleRate:force:]();
    }
  }
}

- (BOOL)setVPBlockConfigurationProperties:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(VCAudioSessionAVAS *)self setSessionProperty:*MEMORY[0x1E4F766B0] value:a3];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    BOOL v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        id v8 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      }
      else {
        id v8 = "<nil>";
      }
      int v10 = 136316162;
      uint64_t v11 = v6;
      __int16 v12 = 2080;
      double v13 = "-[VCAudioSessionAVAS setVPBlockConfigurationProperties:]";
      __int16 v14 = 1024;
      int v15 = 503;
      __int16 v16 = 2080;
      BOOL v17 = v8;
      __int16 v18 = 1024;
      BOOL v19 = v5;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d kCMSessionProperty_VPBlockConfiguration vpBlockDict=%s, success=%{BOOL}d", (uint8_t *)&v10, 0x2Cu);
    }
  }
  self->_pendingVPBlockUpdate = 0;
  return v5;
}

- (void)applyClientPid
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  int v4 = 523;
  __int16 v5 = v0;
  int v6 = v1;
  __int16 v7 = v0;
  int v8 = 0;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d VCAudioSessionProperty_ClientPID processId=%d, success=%{BOOL}d", v3, 0x28u);
}

- (BOOL)applyAudioSessionMediaProperties:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      __int16 v12 = "-[VCAudioSessionAVAS applyAudioSessionMediaProperties:]";
      __int16 v13 = 1024;
      int v14 = 527;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  [(VCAudioSessionAVAS *)self applyClientPid];
  v8.receiver = self;
  v8.super_class = (Class)VCAudioSessionAVAS;
  return [(VCAudioSession *)&v8 applyAudioSessionMediaProperties:a3];
}

- (BOOL)startInternal
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (!self->_isMuteStateCached) {
    goto LABEL_14;
  }
  [(VCAudioSessionAVAS *)self dispatchedApplyMicrophoneMute:self->_isMicrophoneMuted];
  if ((VCAudioSessionAVAS *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_13;
    }
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    avAudioSession = self->_avAudioSession;
    BOOL isMicrophoneMuted = self->_isMicrophoneMuted;
    *(_DWORD *)buf = 136316162;
    uint64_t v40 = v4;
    __int16 v41 = 2080;
    __int16 v42 = "-[VCAudioSessionAVAS startInternal]";
    __int16 v43 = 1024;
    int v44 = 537;
    __int16 v45 = 2112;
    uint64_t v46 = avAudioSession;
    __int16 v47 = 1024;
    LODWORD(v48) = isMicrophoneMuted;
    objc_super v8 = " [%s] %s:%d AVAudioSession=%@ applying pre-cached mute state=%{BOOL}d on inital setActive call";
    uint64_t v9 = v5;
    uint32_t v10 = 44;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v3 = (__CFString *)[(VCAudioSessionAVAS *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_13;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    __int16 v12 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    __int16 v13 = self->_avAudioSession;
    BOOL v14 = self->_isMicrophoneMuted;
    *(_DWORD *)buf = 136316674;
    uint64_t v40 = v11;
    __int16 v41 = 2080;
    __int16 v42 = "-[VCAudioSessionAVAS startInternal]";
    __int16 v43 = 1024;
    int v44 = 537;
    __int16 v45 = 2112;
    uint64_t v46 = v3;
    __int16 v47 = 2048;
    v48 = self;
    __int16 v49 = 2112;
    *(void *)int v50 = v13;
    *(_WORD *)&v50[8] = 1024;
    *(_DWORD *)&v50[10] = v14;
    objc_super v8 = " [%s] %s:%d %@(%p) AVAudioSession=%@ applying pre-cached mute state=%{BOOL}d on inital setActive call";
    uint64_t v9 = v12;
    uint32_t v10 = 64;
  }
  _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_13:
  self->_isMuteStateCached = 0;
LABEL_14:
  uint64_t v38 = 0;
  BOOL v15 = [(AVAudioSession *)self->_avAudioSession setActive:1 error:&v38];
  BOOL v16 = v38 == 0;
  BOOL v17 = v15 && v16;
  if (v15 && v16) {
    int v18 = 7;
  }
  else {
    int v18 = 3;
  }
  if ((VCAudioSessionAVAS *)objc_opt_class() == self)
  {
    if (v18 > (int)VRTraceGetErrorLogLevelForModule()) {
      goto LABEL_33;
    }
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    uint64_t v21 = *MEMORY[0x1E4F47A50];
    uint64_t v22 = *MEMORY[0x1E4F47A50];
    if (v17)
    {
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_33;
      }
      uint64_t v23 = self->_avAudioSession;
      *(_DWORD *)buf = 136316674;
      uint64_t v40 = v20;
      __int16 v41 = 2080;
      __int16 v42 = "-[VCAudioSessionAVAS startInternal]";
      __int16 v43 = 1024;
      int v44 = 545;
      __int16 v45 = 2048;
      uint64_t v46 = v23;
      __int16 v47 = 2112;
      v48 = (VCAudioSessionAVAS *)v23;
      __int16 v49 = 1024;
      *(_DWORD *)int v50 = 1;
      *(_WORD *)&v50[4] = 2112;
      *(void *)&v50[6] = v38;
      __int16 v24 = " [%s] %s:%d AVAudioSession=%p [%@] setActive=YES returned success=%{BOOL}d error=%@";
      __int16 v25 = v21;
      uint32_t v26 = 64;
LABEL_29:
      _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
      goto LABEL_33;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v37 = self->_avAudioSession;
      *(_DWORD *)buf = 136316674;
      uint64_t v40 = v20;
      __int16 v41 = 2080;
      __int16 v42 = "-[VCAudioSessionAVAS startInternal]";
      __int16 v43 = 1024;
      int v44 = 545;
      __int16 v45 = 2048;
      uint64_t v46 = v37;
      __int16 v47 = 2112;
      v48 = (VCAudioSessionAVAS *)v37;
      __int16 v49 = 1024;
      *(_DWORD *)int v50 = v15;
      *(_WORD *)&v50[4] = 2112;
      *(void *)&v50[6] = v38;
      __int16 v32 = " [%s] %s:%d AVAudioSession=%p [%@] setActive=YES returned success=%{BOOL}d error=%@";
      double v33 = v21;
      uint32_t v34 = 64;
      goto LABEL_38;
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v19 = (__CFString *)[(VCAudioSessionAVAS *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v19 = &stru_1F3D3E450;
    }
    if (v18 <= (int)VRTraceGetErrorLogLevelForModule())
    {
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      uint64_t v28 = *MEMORY[0x1E4F47A50];
      int v29 = *MEMORY[0x1E4F47A50];
      if (v17)
      {
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_33;
        }
        BOOL v30 = self->_avAudioSession;
        *(_DWORD *)buf = 136317186;
        uint64_t v40 = v27;
        __int16 v41 = 2080;
        __int16 v42 = "-[VCAudioSessionAVAS startInternal]";
        __int16 v43 = 1024;
        int v44 = 545;
        __int16 v45 = 2112;
        uint64_t v46 = v19;
        __int16 v47 = 2048;
        v48 = self;
        __int16 v49 = 2048;
        *(void *)int v50 = v30;
        *(_WORD *)&v50[8] = 2112;
        *(void *)&v50[10] = v30;
        __int16 v51 = 1024;
        int v52 = 1;
        __int16 v53 = 2112;
        uint64_t v54 = v38;
        __int16 v24 = " [%s] %s:%d %@(%p) AVAudioSession=%p [%@] setActive=YES returned success=%{BOOL}d error=%@";
        __int16 v25 = v28;
        uint32_t v26 = 84;
        goto LABEL_29;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = self->_avAudioSession;
        *(_DWORD *)buf = 136317186;
        uint64_t v40 = v27;
        __int16 v41 = 2080;
        __int16 v42 = "-[VCAudioSessionAVAS startInternal]";
        __int16 v43 = 1024;
        int v44 = 545;
        __int16 v45 = 2112;
        uint64_t v46 = v19;
        __int16 v47 = 2048;
        v48 = self;
        __int16 v49 = 2048;
        *(void *)int v50 = v31;
        *(_WORD *)&v50[8] = 2112;
        *(void *)&v50[10] = v31;
        __int16 v51 = 1024;
        int v52 = v15;
        __int16 v53 = 2112;
        uint64_t v54 = v38;
        __int16 v32 = " [%s] %s:%d %@(%p) AVAudioSession=%p [%@] setActive=YES returned success=%{BOOL}d error=%@";
        double v33 = v28;
        uint32_t v34 = 84;
LABEL_38:
        _os_log_error_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
      }
    }
  }
LABEL_33:
  BOOL v35 = !v15 && self->super._isInterrupted;
  self->super._isInterrupted = v35;
  return v15;
}

- (void)destroyAudioSession
{
  self->_avAudioSession = 0;
}

- (void)setAudioClockDeviceEnabled:(BOOL)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->super._useOptimizedHandoversForTelephony)
  {
    if (a3) {
      uint64_t v5 = @"NetworkUplinkClock_UID";
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    uint64_t v14 = 0;
    [(AVAudioSession *)self->_avAudioSession setAudioClockDevice:v5 error:&v14];
    uint64_t v6 = v14;
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v6)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        __int16 v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int audioSessionId = self->super._audioSessionId;
          *(_DWORD *)buf = 136316162;
          uint64_t v16 = v11;
          __int16 v17 = 2080;
          int v18 = "-[VCAudioSessionAVAS setAudioClockDeviceEnabled:]";
          __int16 v19 = 1024;
          int v20 = 564;
          __int16 v21 = 2112;
          uint64_t v22 = v5;
          __int16 v23 = 1024;
          unsigned int v24 = audioSessionId;
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed setting audio clock deviceUID=%@ on sessionID=%d", buf, 0x2Cu);
        }
      }
    }
    else
    {
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v10 = self->super._audioSessionId;
          *(_DWORD *)buf = 136316162;
          uint64_t v16 = v8;
          __int16 v17 = 2080;
          int v18 = "-[VCAudioSessionAVAS setAudioClockDeviceEnabled:]";
          __int16 v19 = 1024;
          int v20 = 566;
          __int16 v21 = 2112;
          uint64_t v22 = v5;
          __int16 v23 = 1024;
          unsigned int v24 = v10;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Successfully set the audio clock device=%@ on sessionID=%d", buf, 0x2Cu);
        }
      }
      self->super._audioClockDeviceEnabled = a3;
    }
  }
}

- (void)registerObserverNotifications
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = self->_avAudioSessionNotifications;
  uint64_t v3 = [(NSOrderedSet *)obj countByEnumeratingWithState:&v41 objects:v40 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v42;
    *(void *)&long long v4 = 136316418;
    long long v23 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v42 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(__CFString **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v9 = +[VCAudioSessionAVAS selectorForNotification:](VCAudioSessionAVAS, "selectorForNotification:", v8, v23);
        if (v9)
        {
          unsigned int v10 = v9;
          if ((VCAudioSessionAVAS *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v19 = VRTraceErrorLogLevelToCSTR();
              int v20 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                int sessionPid = self->super._sessionPid;
                unsigned int audioSessionId = self->super._audioSessionId;
                *(_DWORD *)buf = v23;
                uint64_t v26 = v19;
                __int16 v27 = 2080;
                uint64_t v28 = "-[VCAudioSessionAVAS registerObserverNotifications]";
                __int16 v29 = 1024;
                int v30 = 582;
                __int16 v31 = 2112;
                __int16 v32 = v8;
                __int16 v33 = 1024;
                *(_DWORD *)uint32_t v34 = sessionPid;
                *(_WORD *)&v34[4] = 1024;
                *(_DWORD *)&v34[6] = audioSessionId;
                uint64_t v16 = v20;
                __int16 v17 = " [%s] %s:%d Adding notification=%@ observer for _sessionPid=%d, _audioSessionId=%u";
                uint32_t v18 = 50;
LABEL_16:
                _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, v18);
              }
            }
          }
          else
          {
            uint64_t v11 = &stru_1F3D3E450;
            if (objc_opt_respondsToSelector()) {
              uint64_t v11 = (__CFString *)[(VCAudioSessionAVAS *)self performSelector:sel_logPrefix];
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v12 = VRTraceErrorLogLevelToCSTR();
              __int16 v13 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
              {
                int v14 = self->super._sessionPid;
                unsigned int v15 = self->super._audioSessionId;
                *(_DWORD *)buf = 136316930;
                uint64_t v26 = v12;
                __int16 v27 = 2080;
                uint64_t v28 = "-[VCAudioSessionAVAS registerObserverNotifications]";
                __int16 v29 = 1024;
                int v30 = 582;
                __int16 v31 = 2112;
                __int16 v32 = v11;
                __int16 v33 = 2048;
                *(void *)uint32_t v34 = self;
                *(_WORD *)&v34[8] = 2112;
                BOOL v35 = v8;
                __int16 v36 = 1024;
                int v37 = v14;
                __int16 v38 = 1024;
                unsigned int v39 = v15;
                uint64_t v16 = v13;
                __int16 v17 = " [%s] %s:%d %@(%p) Adding notification=%@ observer for _sessionPid=%d, _audioSessionId=%u";
                uint32_t v18 = 70;
                goto LABEL_16;
              }
            }
          }
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", self, v10, v8, self->_avAudioSession);
          continue;
        }
      }
      uint64_t v5 = [(NSOrderedSet *)obj countByEnumeratingWithState:&v41 objects:v40 count:16];
    }
    while (v5);
  }
}

- (BOOL)startSessionWithMediaProperties:(id)a3 sessionRef:(unsigned int *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_avAudioSession)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      LODWORD(v4) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v4) {
        return v4;
      }
      -[VCAudioSessionAVAS startSessionWithMediaProperties:sessionRef:]();
    }
    goto LABEL_5;
  }
  __int16 v7 = (AVAudioSession *)[objc_alloc(MEMORY[0x1E4F153E0]) initAuxiliarySession];
  self->_avAudioSession = v7;
  if (v7)
  {
    self->super._unsigned int audioSessionId = [(AVAudioSession *)v7 opaqueSessionID];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        avAudioSession = self->_avAudioSession;
        int v18 = 136316162;
        uint64_t v19 = v8;
        __int16 v20 = 2080;
        __int16 v21 = "-[VCAudioSessionAVAS startSessionWithMediaProperties:sessionRef:]";
        __int16 v22 = 1024;
        int v23 = 599;
        __int16 v24 = 2048;
        *(void *)uint64_t v25 = avAudioSession;
        *(_WORD *)&v25[8] = 2112;
        uint64_t v26 = avAudioSession;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created AVAudioSession=%p [%@]", (uint8_t *)&v18, 0x30u);
      }
    }
    self->super._int operatingMode = [a3 operatingMode];
    self->super._unsigned int vpOperatingMode = [a3 vpOperatingMode];
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int operatingMode = self->super._operatingMode;
        unsigned int vpOperatingMode = self->super._vpOperatingMode;
        int v18 = 136316162;
        uint64_t v19 = v11;
        __int16 v20 = 2080;
        __int16 v21 = "-[VCAudioSessionAVAS startSessionWithMediaProperties:sessionRef:]";
        __int16 v22 = 1024;
        int v23 = 603;
        __int16 v24 = 1024;
        *(_DWORD *)uint64_t v25 = operatingMode;
        *(_WORD *)&v25[4] = 1024;
        *(_DWORD *)&v25[6] = vpOperatingMode;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _operatingMode=%d, _vpOperatingMode=%d", (uint8_t *)&v18, 0x28u);
      }
    }
    -[VCAudioSessionAVAS setAudioClockDeviceEnabled:](self, "setAudioClockDeviceEnabled:", [a3 audioClockDeviceEnabled]);
    [(VCAudioSessionAVAS *)self applyAudioSessionProperties];
    [(AVAudioSession *)self->_avAudioSession inputLatency];
    -[VCAudioSessionAVAS setExternalInputAudioLatency:](self, "setExternalInputAudioLatency:");
    [(AVAudioSession *)self->_avAudioSession outputLatency];
    -[VCAudioSessionAVAS setExternalOutputAudioLatency:](self, "setExternalOutputAudioLatency:");
    [(VCAudioSessionAVAS *)self registerObserverNotifications];
    LOBYTE(v4) = 1;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315650;
        uint64_t v19 = v15;
        __int16 v20 = 2080;
        __int16 v21 = "-[VCAudioSessionAVAS startSessionWithMediaProperties:sessionRef:]";
        __int16 v22 = 1024;
        int v23 = 595;
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d initAuxiliarySession failed", (uint8_t *)&v18, 0x1Cu);
      }
    }
    uint64_t v4 = [(NSMutableArray *)self->super._clients count];
    if (v4)
    {
      [(VCAudioSessionAVAS *)self destroyAudioSession];
LABEL_5:
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (void)handleAudioSessionMediaServicesWereResetNotification:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__VCAudioSessionAVAS_handleAudioSessionMediaServicesWereResetNotification___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(dispatchQueue, block);
  [(VCAudioSession *)self didInterruptionEnded];
}

uint64_t __75__VCAudioSessionAVAS_handleAudioSessionMediaServicesWereResetNotification___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 168);
  *(_DWORD *)(v2 + 168) = [*(id *)(v2 + 304) opaqueSessionID];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [*(id *)(a1 + 40) name];
      __int16 v7 = *(_DWORD **)(a1 + 32);
      int v8 = v7[63];
      int v9 = v7[64];
      LODWORD(v7) = v7[42];
      int v11 = 136316930;
      uint64_t v12 = v4;
      __int16 v13 = 2080;
      int v14 = "-[VCAudioSessionAVAS handleAudioSessionMediaServicesWereResetNotification:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 631;
      __int16 v17 = 2112;
      uint64_t v18 = v6;
      __int16 v19 = 1024;
      int v20 = v8;
      __int16 v21 = 1024;
      int v22 = v9;
      __int16 v23 = 1024;
      int v24 = v3;
      __int16 v25 = 1024;
      int v26 = (int)v7;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received notification=%@ _playbackMode=%d _vpOperatingMode=%u oldAudioSessionID=%u new audioSessionID=%u", (uint8_t *)&v11, 0x3Eu);
    }
  }
  return [*(id *)(a1 + 32) applyAudioSessionProperties];
}

- (void)handleAudioSessionRouteChangeNotification:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__VCAudioSessionAVAS_handleAudioSessionRouteChangeNotification___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = a3;
  block[5] = self;
  dispatch_async(dispatchQueue, block);
}

void __64__VCAudioSessionAVAS_handleAudioSessionRouteChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[*(id *)(a1 + 32) userInfo];
  int v3 = (void *)[v2 objectForKeyedSubscript:*MEMORY[0x1E4F15178]];
  [*(id *)(*(void *)(a1 + 40) + 304) inputLatency];
  objc_msgSend(*(id *)(a1 + 40), "setExternalInputAudioLatency:");
  [*(id *)(*(void *)(a1 + 40) + 304) outputLatency];
  objc_msgSend(*(id *)(a1 + 40), "setExternalOutputAudioLatency:");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [*(id *)(a1 + 32) name];
      uint64_t v7 = [v3 unsignedLongValue];
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(v8 + 352);
      uint64_t v10 = *(void *)(v8 + 360);
      int v11 = 136316674;
      uint64_t v12 = v4;
      __int16 v13 = 2080;
      int v14 = "-[VCAudioSessionAVAS handleAudioSessionRouteChangeNotification:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 643;
      __int16 v17 = 2112;
      uint64_t v18 = v6;
      __int16 v19 = 2048;
      uint64_t v20 = v7;
      __int16 v21 = 2048;
      uint64_t v22 = v9;
      __int16 v23 = 2048;
      uint64_t v24 = v10;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received audio route changed notification=%@, with reason=%lu new externalInputAudioLatency=%f externalOutputAudioLatency=%f", (uint8_t *)&v11, 0x44u);
    }
  }
}

- (void)applyAudioSessionProperties
{
  if (self->super._playbackMode) {
    [(VCAudioSessionAVAS *)self applyAudioSessionMediaPropertiesForSystemAudio];
  }
  else {
    [(VCAudioSession *)self applyAudioSessionPropertiesWithVPOperatingMode:self->super._vpOperatingMode];
  }
}

- (void)deregisterObserverNotifications
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(NSOrderedSet *)self->_avAudioSessionNotifications reverseObjectEnumerator];
  uint64_t v3 = [(NSEnumerator *)obj countByEnumeratingWithState:&v25 objects:v24 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v26;
    *(void *)&long long v4 = 136316162;
    long long v12 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v25 + 1) + 8 * v7);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          uint64_t v10 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            avAudioSession = self->_avAudioSession;
            *(_DWORD *)buf = v12;
            uint64_t v15 = v9;
            __int16 v16 = 2080;
            __int16 v17 = "-[VCAudioSessionAVAS deregisterObserverNotifications]";
            __int16 v18 = 1024;
            int v19 = 660;
            __int16 v20 = 2112;
            uint64_t v21 = v8;
            __int16 v22 = 2112;
            __int16 v23 = avAudioSession;
            _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Removing notification=%@ observer for avAudioSession=%@", buf, 0x30u);
          }
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v12), "removeObserver:name:object:", self, v8, self->_avAudioSession);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSEnumerator *)obj countByEnumeratingWithState:&v25 objects:v24 count:16];
    }
    while (v5);
  }
}

- (BOOL)stopSession
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  self->_pendingVPBlockUpdate = 0;
  if (self->_avAudioSession)
  {
    [(VCAudioSessionAVAS *)self deregisterObserverNotifications];
    uint64_t v14 = 0;
    BOOL v3 = [(AVAudioSession *)self->_avAudioSession setActive:0 withOptions:1 error:&v14];
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    uint64_t v5 = (os_log_t *)MEMORY[0x1E4F47A50];
    if (ErrorLogLevelForModule > 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        avAudioSession = self->_avAudioSession;
        *(_DWORD *)buf = 136316930;
        uint64_t v16 = v6;
        __int16 v17 = 2080;
        __int16 v18 = "-[VCAudioSessionAVAS stopSession]";
        __int16 v19 = 1024;
        int v20 = 689;
        __int16 v21 = 2048;
        __int16 v22 = avAudioSession;
        __int16 v23 = 2112;
        uint64_t v24 = avAudioSession;
        __int16 v25 = 2048;
        uint64_t v26 = 1;
        __int16 v27 = 1024;
        BOOL v28 = v3;
        __int16 v29 = 2112;
        uint64_t v30 = v14;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVAudioSession=%p [%@] setActive=NO endInterruptionStatus=%lu returned success=%{BOOL}d error=%@", buf, 0x4Au);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = self->_avAudioSession;
        unsigned int audioSessionId = self->super._audioSessionId;
        *(_DWORD *)buf = 136316162;
        uint64_t v16 = v9;
        __int16 v17 = 2080;
        __int16 v18 = "-[VCAudioSessionAVAS stopSession]";
        __int16 v19 = 1024;
        int v20 = 691;
        __int16 v21 = 2112;
        __int16 v22 = v11;
        __int16 v23 = 1024;
        LODWORD(v24) = audioSessionId;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Releasing AVAudioSession=%@, _audioSessionId=%u", buf, 0x2Cu);
      }
    }
    [(VCAudioSessionAVAS *)self destroyAudioSession];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioSessionAVAS stopSession]();
      }
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)dispatchedApplyMicrophoneMute:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  uint64_t v36 = 0;
  int v5 = [(AVAudioSession *)self->_avAudioSession muteSessionInput:v3 error:&v36];
  uint64_t v6 = v36;
  uint64_t v7 = (VCAudioSessionAVAS *)objc_opt_class();
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    if (v7 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        return;
      }
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      __int16 v19 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      avAudioSession = self->_avAudioSession;
      *(_DWORD *)buf = 136316162;
      uint64_t v38 = v18;
      __int16 v39 = 2080;
      uint64_t v40 = "-[VCAudioSessionAVAS dispatchedApplyMicrophoneMute:]";
      __int16 v41 = 1024;
      int v42 = 704;
      __int16 v43 = 2112;
      long long v44 = avAudioSession;
      __int16 v45 = 1024;
      *(_DWORD *)uint64_t v46 = v3;
      __int16 v21 = " [%s] %s:%d AVAudioSession=%@ uplink successfully applied isMuted=%{BOOL}d";
      __int16 v22 = v19;
      uint32_t v23 = 44;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v10 = (__CFString *)[(VCAudioSessionAVAS *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        return;
      }
      uint64_t v28 = VRTraceErrorLogLevelToCSTR();
      __int16 v29 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      uint64_t v30 = self->_avAudioSession;
      *(_DWORD *)buf = 136316674;
      uint64_t v38 = v28;
      __int16 v39 = 2080;
      uint64_t v40 = "-[VCAudioSessionAVAS dispatchedApplyMicrophoneMute:]";
      __int16 v41 = 1024;
      int v42 = 704;
      __int16 v43 = 2112;
      long long v44 = v10;
      __int16 v45 = 2048;
      *(void *)uint64_t v46 = self;
      *(_WORD *)&v46[8] = 2112;
      *(void *)&v46[10] = v30;
      __int16 v47 = 1024;
      BOOL v48 = v3;
      __int16 v21 = " [%s] %s:%d %@(%p) AVAudioSession=%@ uplink successfully applied isMuted=%{BOOL}d";
      __int16 v22 = v29;
      uint32_t v23 = 64;
    }
    _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
    return;
  }
  if (v7 != self)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v9 = (__CFString *)[(VCAudioSessionAVAS *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 2) {
      return;
    }
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
    uint64_t v26 = *MEMORY[0x1E4F47A50];
    if (IsOSFaultDisabled)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        __int16 v27 = self->_avAudioSession;
        *(_DWORD *)buf = 136316930;
        uint64_t v38 = v24;
        __int16 v39 = 2080;
        uint64_t v40 = "-[VCAudioSessionAVAS dispatchedApplyMicrophoneMute:]";
        __int16 v41 = 1024;
        int v42 = 706;
        __int16 v43 = 2112;
        long long v44 = v9;
        __int16 v45 = 2048;
        *(void *)uint64_t v46 = self;
        *(_WORD *)&v46[8] = 2112;
        *(void *)&v46[10] = v27;
        __int16 v47 = 1024;
        BOOL v48 = v3;
        __int16 v49 = 2112;
        uint64_t v50 = v36;
        uint64_t v15 = " [%s] %s:%d %@(%p) AVAudioSession=%@ failed to apply isMuted=%{BOOL}d with error=%@";
        uint64_t v16 = v26;
        uint32_t v17 = 74;
        goto LABEL_23;
      }
      return;
    }
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT)) {
      return;
    }
    uint64_t v31 = self->_avAudioSession;
    *(_DWORD *)buf = 136316930;
    uint64_t v38 = v24;
    __int16 v39 = 2080;
    uint64_t v40 = "-[VCAudioSessionAVAS dispatchedApplyMicrophoneMute:]";
    __int16 v41 = 1024;
    int v42 = 706;
    __int16 v43 = 2112;
    long long v44 = v9;
    __int16 v45 = 2048;
    *(void *)uint64_t v46 = self;
    *(_WORD *)&v46[8] = 2112;
    *(void *)&v46[10] = v31;
    __int16 v47 = 1024;
    BOOL v48 = v3;
    __int16 v49 = 2112;
    uint64_t v50 = v36;
    __int16 v32 = " [%s] %s:%d %@(%p) AVAudioSession=%@ failed to apply isMuted=%{BOOL}d with error=%@";
    __int16 v33 = v26;
    uint32_t v34 = 74;
LABEL_34:
    _os_log_fault_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_FAULT, v32, buf, v34);
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 2) {
    return;
  }
  uint64_t v11 = VRTraceErrorLogLevelToCSTR();
  char v12 = VRTraceIsOSFaultDisabled();
  __int16 v13 = *MEMORY[0x1E4F47A50];
  if ((v12 & 1) == 0)
  {
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT)) {
      return;
    }
    BOOL v35 = self->_avAudioSession;
    *(_DWORD *)buf = 136316418;
    uint64_t v38 = v11;
    __int16 v39 = 2080;
    uint64_t v40 = "-[VCAudioSessionAVAS dispatchedApplyMicrophoneMute:]";
    __int16 v41 = 1024;
    int v42 = 706;
    __int16 v43 = 2112;
    long long v44 = v35;
    __int16 v45 = 1024;
    *(_DWORD *)uint64_t v46 = v3;
    *(_WORD *)&v46[4] = 2112;
    *(void *)&v46[6] = v36;
    __int16 v32 = " [%s] %s:%d AVAudioSession=%@ failed to apply isMuted=%{BOOL}d with error=%@";
    __int16 v33 = v13;
    uint32_t v34 = 54;
    goto LABEL_34;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
  {
    uint64_t v14 = self->_avAudioSession;
    *(_DWORD *)buf = 136316418;
    uint64_t v38 = v11;
    __int16 v39 = 2080;
    uint64_t v40 = "-[VCAudioSessionAVAS dispatchedApplyMicrophoneMute:]";
    __int16 v41 = 1024;
    int v42 = 706;
    __int16 v43 = 2112;
    long long v44 = v14;
    __int16 v45 = 1024;
    *(_DWORD *)uint64_t v46 = v3;
    *(_WORD *)&v46[4] = 2112;
    *(void *)&v46[6] = v36;
    uint64_t v15 = " [%s] %s:%d AVAudioSession=%@ failed to apply isMuted=%{BOOL}d with error=%@";
    uint64_t v16 = v13;
    uint32_t v17 = 54;
LABEL_23:
    _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
  }
}

- (void)setMicrophoneMuted:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__VCAudioSessionAVAS_setMicrophoneMuted___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, block);
}

void __41__VCAudioSessionAVAS_setMicrophoneMuted___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(_DWORD *)(v2 + 252))
  {
    if (*(void *)(v2 + 304))
    {
      uint64_t v4 = *(unsigned __int8 *)(a1 + 40);
      [(id)v2 dispatchedApplyMicrophoneMute:v4];
      return;
    }
    *(unsigned char *)(v2 + 368) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 369) = *(unsigned char *)(a1 + 40);
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_28;
      }
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      uint32_t v17 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 304);
      int v19 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)uint64_t v28 = 136316162;
      *(void *)&v28[4] = v16;
      *(_WORD *)&v28[12] = 2080;
      *(void *)&v28[14] = "-[VCAudioSessionAVAS setMicrophoneMuted:]_block_invoke";
      *(_WORD *)&v28[22] = 1024;
      LODWORD(v29) = 721;
      WORD2(v29) = 2112;
      *(void *)((char *)&v29 + 6) = v18;
      HIWORD(v29) = 1024;
      LODWORD(v30) = v19;
      int v20 = " [%s] %s:%d AVAudioSession=%@ uplink mute cached, isMuted=%{BOOL}d";
      __int16 v21 = v17;
      uint32_t v22 = 44;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v15 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v15 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_28;
      }
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      uint64_t v24 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      uint64_t v25 = *(void *)(a1 + 32);
      uint64_t v26 = *(void *)(v25 + 304);
      int v27 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)uint64_t v28 = 136316674;
      *(void *)&v28[4] = v23;
      *(_WORD *)&v28[12] = 2080;
      *(void *)&v28[14] = "-[VCAudioSessionAVAS setMicrophoneMuted:]_block_invoke";
      *(_WORD *)&v28[22] = 1024;
      LODWORD(v29) = 721;
      WORD2(v29) = 2112;
      *(void *)((char *)&v29 + 6) = v15;
      HIWORD(v29) = 2048;
      uint64_t v30 = v25;
      LOWORD(v31) = 2112;
      *(void *)((char *)&v31 + 2) = v26;
      WORD5(v31) = 1024;
      HIDWORD(v31) = v27;
      int v20 = " [%s] %s:%d %@(%p) AVAudioSession=%@ uplink mute cached, isMuted=%{BOOL}d";
      __int16 v21 = v24;
      uint32_t v22 = 64;
    }
    _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v20, v28, v22);
LABEL_28:
    objc_msgSend(*(id *)(a1 + 32), "dispatchedInvokeMuteStateChangedHandlerWithIsMuted:reason:", *(unsigned __int8 *)(*(void *)(a1 + 32) + 369), 0, *(_OWORD *)v28, *(void *)&v28[16], v29, v30, v31);
    return;
  }
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 304);
        *(_DWORD *)uint64_t v28 = 136315906;
        *(void *)&v28[4] = v5;
        *(_WORD *)&v28[12] = 2080;
        *(void *)&v28[14] = "-[VCAudioSessionAVAS setMicrophoneMuted:]_block_invoke";
        *(_WORD *)&v28[22] = 1024;
        LODWORD(v29) = 713;
        WORD2(v29) = 2112;
        *(void *)((char *)&v29 + 6) = v7;
        BOOL v8 = " [%s] %s:%d Not applying mute to the AVAudioSession=%@ because this playback mode does not support it.";
        uint64_t v9 = v6;
        uint32_t v10 = 38;
LABEL_16:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, v28, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v3 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      BOOL v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      char v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v14 = *(void *)(v13 + 304);
        *(_DWORD *)uint64_t v28 = 136316418;
        *(void *)&v28[4] = v11;
        *(_WORD *)&v28[12] = 2080;
        *(void *)&v28[14] = "-[VCAudioSessionAVAS setMicrophoneMuted:]_block_invoke";
        *(_WORD *)&v28[22] = 1024;
        LODWORD(v29) = 713;
        WORD2(v29) = 2112;
        *(void *)((char *)&v29 + 6) = v3;
        HIWORD(v29) = 2048;
        uint64_t v30 = v13;
        LOWORD(v31) = 2112;
        *(void *)((char *)&v31 + 2) = v14;
        BOOL v8 = " [%s] %s:%d %@(%p) Not applying mute to the AVAudioSession=%@ because this playback mode does not support it.";
        uint64_t v9 = v12;
        uint32_t v10 = 58;
        goto LABEL_16;
      }
    }
  }
}

- (BOOL)microphoneMuted
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__VCAudioSessionAVAS_microphoneMuted__block_invoke;
  block[3] = &unk_1E6DB3EB8;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(dispatchQueue, block);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __37__VCAudioSessionAVAS_microphoneMuted__block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 252))
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v4 = VRTraceErrorLogLevelToCSTR();
        uint64_t v5 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 304);
          int v26 = 136315906;
          uint64_t v27 = v4;
          __int16 v28 = 2080;
          long long v29 = "-[VCAudioSessionAVAS microphoneMuted]_block_invoke";
          __int16 v30 = 1024;
          int v31 = 731;
          __int16 v32 = 2112;
          *(void *)__int16 v33 = v6;
          uint64_t v7 = " [%s] %s:%d Not fetching mute from the AVAudioSession=%@ because this playback mode does not support it.";
          uint64_t v8 = v5;
          uint32_t v9 = 38;
LABEL_26:
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v26, v9);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        char v3 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        char v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint64_t v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = *(void *)(a1 + 32);
          uint64_t v13 = *(void *)(v12 + 304);
          int v26 = 136316418;
          uint64_t v27 = v10;
          __int16 v28 = 2080;
          long long v29 = "-[VCAudioSessionAVAS microphoneMuted]_block_invoke";
          __int16 v30 = 1024;
          int v31 = 731;
          __int16 v32 = 2112;
          *(void *)__int16 v33 = v3;
          *(_WORD *)&v33[8] = 2048;
          *(void *)&v33[10] = v12;
          *(_WORD *)&v33[18] = 2112;
          *(void *)uint32_t v34 = v13;
          uint64_t v7 = " [%s] %s:%d %@(%p) Not fetching mute from the AVAudioSession=%@ because this playback mode does not support it.";
          uint64_t v8 = v11;
          uint32_t v9 = 58;
          goto LABEL_26;
        }
      }
    }
  }
  else
  {
    if (*(void *)(v2 + 304))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(v2 + 304) isSessionInputMuted];
    }
    else if (*(unsigned char *)(v2 + 368))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(v2 + 369);
    }
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        uint64_t v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = *(void *)(a1 + 32);
          int v18 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
          uint64_t v19 = *(void *)(v17 + 304);
          LODWORD(v17) = *(unsigned __int8 *)(v17 + 368);
          int v26 = 136316418;
          uint64_t v27 = v15;
          __int16 v28 = 2080;
          long long v29 = "-[VCAudioSessionAVAS microphoneMuted]_block_invoke";
          __int16 v30 = 1024;
          int v31 = 739;
          __int16 v32 = 1024;
          *(_DWORD *)__int16 v33 = v18;
          *(_WORD *)&v33[4] = 2112;
          *(void *)&v33[6] = v19;
          *(_WORD *)&v33[14] = 1024;
          *(_DWORD *)&v33[16] = v17;
          uint64_t v7 = " [%s] %s:%d Fetching isMicrophoneMuted=%{BOOL}d, avAudioSession=%@ isMuteStateCached=%{BOOL}d";
          uint64_t v8 = v16;
          uint32_t v9 = 50;
          goto LABEL_26;
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v14 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v14 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        __int16 v21 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = *(void *)(a1 + 32);
          uint64_t v23 = *(void *)(v22 + 304);
          int v24 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
          int v25 = *(unsigned __int8 *)(v22 + 368);
          int v26 = 136316930;
          uint64_t v27 = v20;
          __int16 v28 = 2080;
          long long v29 = "-[VCAudioSessionAVAS microphoneMuted]_block_invoke";
          __int16 v30 = 1024;
          int v31 = 739;
          __int16 v32 = 2112;
          *(void *)__int16 v33 = v14;
          *(_WORD *)&v33[8] = 2048;
          *(void *)&v33[10] = v22;
          *(_WORD *)&v33[18] = 1024;
          *(_DWORD *)uint32_t v34 = v24;
          *(_WORD *)&v34[4] = 2112;
          *(void *)&v34[6] = v23;
          __int16 v35 = 1024;
          int v36 = v25;
          uint64_t v7 = " [%s] %s:%d %@(%p) Fetching isMicrophoneMuted=%{BOOL}d, avAudioSession=%@ isMuteStateCached=%{BOOL}d";
          uint64_t v8 = v21;
          uint32_t v9 = 70;
          goto LABEL_26;
        }
      }
    }
  }
}

- (void)setMuteStateChangedHandler:(id)a3 delegateQueue:(id)a4
{
  v5[7] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->super._dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__VCAudioSessionAVAS_setMuteStateChangedHandler_delegateQueue___block_invoke;
  v5[3] = &unk_1E6DB4F60;
  v5[5] = a4;
  v5[6] = a3;
  v5[4] = self;
  dispatch_sync(dispatchQueue, v5);
}

void __63__VCAudioSessionAVAS_setMuteStateChangedHandler_delegateQueue___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(const void **)(v3 + 336);
  if (v2 != v4)
  {
    _Block_release(v4);
    *(void *)(*(void *)(a1 + 32) + 336) = _Block_copy(*(const void **)(a1 + 48));
    uint64_t v3 = *(void *)(a1 + 32);
  }
  uint64_t v5 = *(NSObject **)(a1 + 40);
  uint64_t v6 = *(NSObject **)(v3 + 344);
  if (v5 != v6)
  {
    if (v6)
    {
      dispatch_release(v6);
      uint64_t v5 = *(NSObject **)(a1 + 40);
    }
    if (v5) {
      dispatch_retain(v5);
    }
    *(void *)(*(void *)(a1 + 32) + 344) = v5;
  }
}

+ (unsigned)muteReasonFromMuteChangedInfo:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F14FE8]];
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && ([(id)*MEMORY[0x1E4F14FE0] isEqualToString:v3] & 1) != 0;
}

- (void)dispatchedInvokeMuteStateChangedHandlerWithIsMuted:(BOOL)a3 reason:(unsigned __int8)a4
{
  int v4 = a4;
  BOOL v5 = a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  id muteStateChangedHandler = self->_muteStateChangedHandler;
  if (muteStateChangedHandler)
  {
    muteStateChangedHandlerQueue = self->_muteStateChangedHandlerQueue;
    if (muteStateChangedHandlerQueue)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __80__VCAudioSessionAVAS_dispatchedInvokeMuteStateChangedHandlerWithIsMuted_reason___block_invoke;
      v21[3] = &unk_1E6DB8970;
      v21[4] = muteStateChangedHandler;
      BOOL v22 = v5;
      char v23 = v4;
      dispatch_async(muteStateChangedHandlerQueue, v21);
      return;
    }
  }
  if ((VCAudioSessionAVAS *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return;
    }
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return;
    }
    id v12 = self->_muteStateChangedHandler;
    uint64_t v13 = self->_muteStateChangedHandlerQueue;
    *(_DWORD *)buf = 136316674;
    uint64_t v25 = v10;
    __int16 v26 = 2080;
    uint64_t v27 = "-[VCAudioSessionAVAS dispatchedInvokeMuteStateChangedHandlerWithIsMuted:reason:]";
    __int16 v28 = 1024;
    int v29 = 781;
    __int16 v30 = 1024;
    *(_DWORD *)int v31 = v5;
    *(_WORD *)&v31[4] = 1024;
    *(_DWORD *)&v31[6] = v4;
    *(_WORD *)__int16 v32 = 2112;
    *(void *)&v32[2] = v12;
    *(_WORD *)__int16 v33 = 2112;
    *(void *)&v33[2] = v13;
    uint64_t v14 = " [%s] %s:%d Attempting to propagate an isMuted=%{BOOL}d event with reason=%hhu without a handler=%@ or handler queue=%@";
    uint64_t v15 = v11;
    uint32_t v16 = 60;
LABEL_15:
    _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
    return;
  }
  if (objc_opt_respondsToSelector()) {
    uint32_t v9 = (__CFString *)[(VCAudioSessionAVAS *)self performSelector:sel_logPrefix];
  }
  else {
    uint32_t v9 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    int v18 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      id v19 = self->_muteStateChangedHandler;
      uint64_t v20 = self->_muteStateChangedHandlerQueue;
      *(_DWORD *)buf = 136317186;
      uint64_t v25 = v17;
      __int16 v26 = 2080;
      uint64_t v27 = "-[VCAudioSessionAVAS dispatchedInvokeMuteStateChangedHandlerWithIsMuted:reason:]";
      __int16 v28 = 1024;
      int v29 = 781;
      __int16 v30 = 2112;
      *(void *)int v31 = v9;
      *(_WORD *)&v31[8] = 2048;
      *(void *)__int16 v32 = self;
      *(_WORD *)&v32[8] = 1024;
      *(_DWORD *)__int16 v33 = v5;
      *(_WORD *)&v33[4] = 1024;
      *(_DWORD *)&v33[6] = v4;
      __int16 v34 = 2112;
      id v35 = v19;
      __int16 v36 = 2112;
      uint64_t v37 = v20;
      uint64_t v14 = " [%s] %s:%d %@(%p) Attempting to propagate an isMuted=%{BOOL}d event with reason=%hhu without a handler=%@ o"
            "r handler queue=%@";
      uint64_t v15 = v18;
      uint32_t v16 = 80;
      goto LABEL_15;
    }
  }
}

uint64_t __80__VCAudioSessionAVAS_dispatchedInvokeMuteStateChangedHandlerWithIsMuted_reason___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

- (void)handleAudioSessionInputMuteChangeNotification:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if (!VCFeatureFlagManager_SessionBasedMutingEnabled())
  {
    if ((VCAudioSessionAVAS *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        return;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v52 = v12;
      __int16 v53 = 2080;
      uint64_t v54 = "-[VCAudioSessionAVAS handleAudioSessionInputMuteChangeNotification:]";
      __int16 v55 = 1024;
      int v56 = 798;
      __int16 v57 = 2112;
      uint64_t v58 = (const char *)a3;
      uint64_t v14 = " [%s] %s:%d Dropping session input mute notification=%@ because SessionBasedMuting is NOT enabled.";
      uint64_t v15 = v13;
      uint32_t v16 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v10 = (__CFString *)[(VCAudioSessionAVAS *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        return;
      }
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      int v18 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v52 = v17;
      __int16 v53 = 2080;
      uint64_t v54 = "-[VCAudioSessionAVAS handleAudioSessionInputMuteChangeNotification:]";
      __int16 v55 = 1024;
      int v56 = 798;
      __int16 v57 = 2112;
      uint64_t v58 = (const char *)v10;
      __int16 v59 = 2048;
      v60 = self;
      __int16 v61 = 2112;
      id v62 = a3;
      uint64_t v14 = " [%s] %s:%d %@(%p) Dropping session input mute notification=%@ because SessionBasedMuting is NOT enabled.";
      uint64_t v15 = v18;
      uint32_t v16 = 58;
    }
    _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    return;
  }
  BOOL v5 = (void *)[a3 userInfo];
  uint64_t v6 = (void *)[v5 objectForKeyedSubscript:*MEMORY[0x1E4F14FF0]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = [v6 BOOLValue];
    int v8 = +[VCAudioSessionAVAS muteReasonFromMuteChangedInfo:v5];
    if ((VCAudioSessionAVAS *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_62;
      }
      __str = 0;
      if (v5) {
        id v19 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
      }
      else {
        id v19 = "<nil>";
      }
      __int16 v34 = "NO";
      if (v7) {
        __int16 v34 = "YES";
      }
      asprintf(&__str, "Received mute state change notice=%s with currentMuteState=%s, muteReason=%hhu", v19, v34, v8);
      if (!__str) {
        goto LABEL_62;
      }
      char v44 = v8;
      char v45 = v7;
      __lasts = 0;
      id v35 = strtok_r(__str, "\n", &__lasts);
      __int16 v36 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v37 = VRTraceErrorLogLevelToCSTR();
          uint64_t v38 = *v36;
          if (os_log_type_enabled(*v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v52 = v37;
            __int16 v53 = 2080;
            uint64_t v54 = "-[VCAudioSessionAVAS handleAudioSessionInputMuteChangeNotification:]";
            __int16 v55 = 1024;
            int v56 = 809;
            __int16 v57 = 2080;
            uint64_t v58 = "";
            __int16 v59 = 2080;
            v60 = (VCAudioSessionAVAS *)v35;
            _os_log_impl(&dword_1E1EA4000, v38, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        id v35 = strtok_r(0, "\n", &__lasts);
      }
      while (v35);
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint32_t v9 = (__CFString *)[(VCAudioSessionAVAS *)self performSelector:sel_logPrefix];
      }
      else {
        uint32_t v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_62;
      }
      __str = 0;
      __int16 v21 = (const char *)[(__CFString *)v9 UTF8String];
      if (v5) {
        BOOL v22 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
      }
      else {
        BOOL v22 = "<nil>";
      }
      uint64_t v25 = "NO";
      if (v7) {
        uint64_t v25 = "YES";
      }
      asprintf(&__str, "%s(%p) Received mute state change notice=%s with currentMuteState=%s, muteReason=%hhu", v21, self, v22, v25, v8);
      if (!__str) {
        goto LABEL_62;
      }
      char v44 = v8;
      char v45 = v7;
      __lasts = 0;
      __int16 v26 = strtok_r(__str, "\n", &__lasts);
      uint64_t v27 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v28 = VRTraceErrorLogLevelToCSTR();
          int v29 = *v27;
          if (os_log_type_enabled(*v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v52 = v28;
            __int16 v53 = 2080;
            uint64_t v54 = "-[VCAudioSessionAVAS handleAudioSessionInputMuteChangeNotification:]";
            __int16 v55 = 1024;
            int v56 = 809;
            __int16 v57 = 2080;
            uint64_t v58 = "";
            __int16 v59 = 2080;
            v60 = (VCAudioSessionAVAS *)v26;
            _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        __int16 v26 = strtok_r(0, "\n", &__lasts);
      }
      while (v26);
    }
    free(__str);
    LOBYTE(v8) = v44;
    LOBYTE(v7) = v45;
LABEL_62:
    dispatchQueue = self->super._dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__VCAudioSessionAVAS_handleAudioSessionInputMuteChangeNotification___block_invoke;
    block[3] = &unk_1E6DB4658;
    block[4] = self;
    char v47 = v7;
    char v48 = v8;
    dispatch_async(dispatchQueue, block);
    return;
  }
  if ((VCAudioSessionAVAS *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      __str = 0;
      uint64_t v20 = v5 ? (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "Malformed mute changed context=%s, dropping notification", v20);
      if (__str)
      {
        __lasts = 0;
        uint64_t v40 = strtok_r(__str, "\n", &__lasts);
        __int16 v41 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v42 = VRTraceErrorLogLevelToCSTR();
            __int16 v43 = *v41;
            if (os_log_type_enabled(*v41, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v52 = v42;
              __int16 v53 = 2080;
              uint64_t v54 = "-[VCAudioSessionAVAS handleAudioSessionInputMuteChangeNotification:]";
              __int16 v55 = 1024;
              int v56 = 804;
              __int16 v57 = 2080;
              uint64_t v58 = "";
              __int16 v59 = 2080;
              v60 = (VCAudioSessionAVAS *)v40;
              _os_log_error_impl(&dword_1E1EA4000, v43, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          uint64_t v40 = strtok_r(0, "\n", &__lasts);
        }
        while (v40);
        goto LABEL_70;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v11 = (__CFString *)[(VCAudioSessionAVAS *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      __str = 0;
      char v23 = (const char *)[(__CFString *)v11 UTF8String];
      int v24 = v5 ? (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "%s(%p) Malformed mute changed context=%s, dropping notification", v23, self, v24);
      if (__str)
      {
        __lasts = 0;
        __int16 v30 = strtok_r(__str, "\n", &__lasts);
        int v31 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v32 = VRTraceErrorLogLevelToCSTR();
            __int16 v33 = *v31;
            if (os_log_type_enabled(*v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v52 = v32;
              __int16 v53 = 2080;
              uint64_t v54 = "-[VCAudioSessionAVAS handleAudioSessionInputMuteChangeNotification:]";
              __int16 v55 = 1024;
              int v56 = 804;
              __int16 v57 = 2080;
              uint64_t v58 = "";
              __int16 v59 = 2080;
              v60 = (VCAudioSessionAVAS *)v30;
              _os_log_error_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_ERROR, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          __int16 v30 = strtok_r(0, "\n", &__lasts);
        }
        while (v30);
LABEL_70:
        free(__str);
      }
    }
  }
}

uint64_t __68__VCAudioSessionAVAS_handleAudioSessionInputMuteChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedInvokeMuteStateChangedHandlerWithIsMuted:*(unsigned __int8 *)(a1 + 40) reason:*(unsigned __int8 *)(a1 + 41)];
}

- (void)handleSecureMicNotificationWithInterruptionInfo:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F15010]];
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      return;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint32_t v9 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v15 = 136315650;
    uint64_t v16 = v8;
    __int16 v17 = 2080;
    int v18 = "-[VCAudioSessionAVAS handleSecureMicNotificationWithInterruptionInfo:]";
    __int16 v19 = 1024;
    int v20 = 820;
    uint64_t v10 = " [%s] %s:%d No interruption reason provided";
    uint64_t v11 = v9;
    uint32_t v12 = 28;
LABEL_13:
    _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
    return;
  }
  uint64_t v4 = [v3 unsignedIntegerValue];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v4 != 2)
  {
    if (ErrorLogLevelForModule < 6) {
      return;
    }
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint64_t v14 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v15 = 136315906;
    uint64_t v16 = v13;
    __int16 v17 = 2080;
    int v18 = "-[VCAudioSessionAVAS handleSecureMicNotificationWithInterruptionInfo:]";
    __int16 v19 = 1024;
    int v20 = 833;
    __int16 v21 = 2048;
    uint64_t v22 = v4;
    uint64_t v10 = " [%s] %s:%d Interruption reason=%lu";
    uint64_t v11 = v14;
    uint32_t v12 = 38;
    goto LABEL_13;
  }
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    int v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315650;
      uint64_t v16 = v6;
      __int16 v17 = 2080;
      int v18 = "-[VCAudioSessionAVAS handleSecureMicNotificationWithInterruptionInfo:]";
      __int16 v19 = 1024;
      int v20 = 829;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d BuiltInMicMuted interruption reason", (uint8_t *)&v15, 0x1Cu);
    }
  }
  [+[VCAudioClientManager sharedInstance] secureMicrophoneEngagedNotification];
}

- (void)handleAudioSessionInterruption:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[a3 userInfo];
  BOOL v5 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x1E4F15020]];
  if (v5)
  {
    uint64_t v6 = [v5 unsignedIntegerValue];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (v4) {
          uint32_t v9 = (const char *)objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
        }
        else {
          uint32_t v9 = "<nil>";
        }
        int v17 = 136316162;
        uint64_t v18 = v7;
        __int16 v19 = 2080;
        int v20 = "-[VCAudioSessionAVAS handleAudioSessionInterruption:]";
        __int16 v21 = 1024;
        int v22 = 847;
        __int16 v23 = 2048;
        uint64_t v24 = v6;
        __int16 v25 = 2080;
        __int16 v26 = v9;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d interruptionType=%lu, interruptInfo=%s", (uint8_t *)&v17, 0x30u);
      }
    }
    if (!v6)
    {
      [(VCAudioSession *)self didInterruptionEnded];
      return;
    }
    if (v6 == 1)
    {
      [(VCAudioSessionAVAS *)self handleSecureMicNotificationWithInterruptionInfo:v4];
      [(VCAudioSession *)self didStop];
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315906;
        uint64_t v18 = v15;
        __int16 v19 = 2080;
        int v20 = "-[VCAudioSessionAVAS handleAudioSessionInterruption:]";
        __int16 v21 = 1024;
        int v22 = 858;
        __int16 v23 = 2048;
        uint64_t v24 = v6;
        uint32_t v12 = " [%s] %s:%d Unhandled session interruption: interruptionType=%lu";
        uint64_t v13 = v16;
        uint32_t v14 = 38;
        goto LABEL_18;
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315650;
      uint64_t v18 = v10;
      __int16 v19 = 2080;
      int v20 = "-[VCAudioSessionAVAS handleAudioSessionInterruption:]";
      __int16 v21 = 1024;
      int v22 = 842;
      uint32_t v12 = " [%s] %s:%d Interruption type id not provided.";
      uint64_t v13 = v11;
      uint32_t v14 = 28;
LABEL_18:
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
    }
  }
}

- (void)handleOutputSampleRateChange:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    BOOL v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315650;
      uint64_t v7 = v4;
      __int16 v8 = 2080;
      uint32_t v9 = "-[VCAudioSessionAVAS handleOutputSampleRateChange:]";
      __int16 v10 = 1024;
      int v11 = 864;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received notification that Output Sample Rate has changed", (uint8_t *)&v6, 0x1Cu);
    }
  }
  [(VCAudioSession *)self didAvailableSampleRateChange];
  [(VCAudioSession *)self setBlockSizeOnSampleRateChange];
}

- (void)handleAudioSessionMediaServicesWereLostNotification:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unsigned int vpOperatingMode = self->super._vpOperatingMode;
  if (vpOperatingMode - 4 >= 3)
  {
    if (vpOperatingMode) {
      BOOL v7 = vpOperatingMode == 2;
    }
    else {
      BOOL v7 = 1;
    }
    BOOL v6 = v7 && VCFeatureFlagManager_DaemonCrashRecovery();
  }
  else
  {
    BOOL v6 = 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint32_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [a3 name];
      unsigned int v11 = self->super._vpOperatingMode;
      int playbackMode = self->super._playbackMode;
      avAudioSession = self->_avAudioSession;
      int v16 = 136316930;
      uint64_t v17 = v8;
      __int16 v18 = 2080;
      __int16 v19 = "-[VCAudioSessionAVAS handleAudioSessionMediaServicesWereLostNotification:]";
      __int16 v20 = 1024;
      int v21 = 890;
      __int16 v22 = 2112;
      uint64_t v23 = v10;
      __int16 v24 = 1024;
      unsigned int v25 = v11;
      __int16 v26 = 1024;
      int v27 = playbackMode;
      __int16 v28 = 2048;
      int v29 = avAudioSession;
      __int16 v30 = 1024;
      BOOL v31 = v6;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received notification=%@, _vpOperatingMode=%d, _playbackMode=%d, _avAudioSession=%p, daemonCrashRecoveryEnabled=%d", (uint8_t *)&v16, 0x42u);
    }
  }
  if (v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315650;
        uint64_t v17 = v14;
        __int16 v18 = 2080;
        __int16 v19 = "-[VCAudioSessionAVAS handleAudioSessionMediaServicesWereLostNotification:]";
        __int16 v20 = 1024;
        int v21 = 892;
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Calling didStop.  Trying to restore connection.", (uint8_t *)&v16, 0x1Cu);
      }
    }
    [(VCAudioSession *)self didStop];
  }
  else
  {
    [(VCAudioSession *)self serverDidDie];
  }
}

- (void)setupInputBeamforming
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d builtInMicPort is nil", v2, v3, v4, v5, v6);
}

- (BOOL)internalSelectMicrophoneWithType:(unsigned int)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  if (a3 != 1)
  {
    if (!a3 && self->super._micSourceFront)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        uint8_t v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          micSourceFront = self->super._micSourceFront;
          int v13 = 136315906;
          uint64_t v14 = v5;
          __int16 v15 = 2080;
          int v16 = "-[VCAudioSessionAVAS internalSelectMicrophoneWithType:]";
          __int16 v17 = 1024;
          int v18 = 935;
          __int16 v19 = 2112;
          __int16 v20 = micSourceFront;
          _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d applying front microphone preference _micSourceFront=%@", (uint8_t *)&v13, 0x26u);
        }
      }
      if ((VCMicrophonePreferencesAVAS_ApplyMicrophonePreferences(self->_avAudioSession, self->super._micSourceFront) & 1) == 0)
      {
        LOBYTE(v8) = 0;
        return v8;
      }
    }
LABEL_14:
    self->super._selectedMicrophone = a3;
    LOBYTE(v8) = 1;
    return v8;
  }
  if (!self->super._micSourceBack) {
    goto LABEL_14;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      micSourceBack = self->super._micSourceBack;
      int v13 = 136315906;
      uint64_t v14 = v9;
      __int16 v15 = 2080;
      int v16 = "-[VCAudioSessionAVAS internalSelectMicrophoneWithType:]";
      __int16 v17 = 1024;
      int v18 = 939;
      __int16 v19 = 2112;
      __int16 v20 = micSourceBack;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d applying back microphone preference _micSourceBack=%@", (uint8_t *)&v13, 0x26u);
    }
  }
  int v8 = VCMicrophonePreferencesAVAS_ApplyMicrophonePreferences(self->_avAudioSession, self->super._micSourceBack);
  if (v8) {
    goto LABEL_14;
  }
  return v8;
}

unsigned char *__VCAudioSessionAVAS_ScheduleNetworkUplinkClockUpdate_block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[384])
  {
    [result dispatchedSetVPBlockConfigurationProperties:1];
    uint64_t result = *(unsigned char **)(a1 + 32);
  }
  result[384] = 0;
  return result;
}

- (double)externalInputAudioLatency
{
  return self->_externalInputAudioLatency;
}

- (void)setExternalInputAudioLatency:(double)a3
{
  self->_externalInputAudioLatency = a3;
}

- (double)externalOutputAudioLatency
{
  return self->_externalOutputAudioLatency;
}

- (void)setExternalOutputAudioLatency:(double)a3
{
  self->_externalOutputAudioLatency = a3;
}

+ (void)selectorForNotification:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unrecognized notification=%@, returning NULL selector");
}

- (void)setSessionProperty:value:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d _avAudioSession is nil", v2, v3, v4, v5, v6);
}

- (void)applyRequestedProperties:propertyOrder:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d _avAudioSession is nil", v2, v3, v4, v5, v6);
}

- (void)applyRequestedProperties:propertyOrder:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Properties to set is nil", v2, v3, v4, v5, v6);
}

- (void)applyRequestedProperty:defaultValue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Error: _avAudioSession is nil", v2, v3, v4, v5, v6);
}

- (void)applyRequestedProperty:defaultValue:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Setting propertyKey=%@ failed, value is nil.");
}

- (void)setBlockSize:sampleRate:force:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d _avAudioSession is nil, cannot set block size", v2, v3, v4, v5, v6);
}

- (void)startSessionWithMediaProperties:sessionRef:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid state... ????", v2, v3, v4, v5, v6);
}

- (void)stopSession
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Session already stopped ?", v2, v3, v4, v5, v6);
}

@end