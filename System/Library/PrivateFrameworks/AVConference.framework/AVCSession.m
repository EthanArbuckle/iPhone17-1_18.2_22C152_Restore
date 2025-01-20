@interface AVCSession
+ (id)configurationWithSessionMode:(int64_t)a3;
+ (int)mediaNegotiatorVersionWithNegotiationProtocolVersion:(unsigned int)a3;
- (AVCSession)initWithTransportToken:(id)a3 configuration:(id)a4 delegate:(id)a5 queue:(id)a6;
- (AVCSessionConfiguration)configuration;
- (AVCSessionDelegate)delegate;
- (AVCSessionParticipant)localParticipant;
- (BOOL)isAudioEnabled;
- (BOOL)isAudioMuted;
- (BOOL)isAudioPaused;
- (BOOL)isOneToOneEnabled;
- (BOOL)isScreenEnabled;
- (BOOL)isVideoEnabled;
- (BOOL)isVideoPaused;
- (BOOL)validateParticipantToAdd:(id)a3;
- (BOOL)validateParticipantToRemove:(id)a3;
- (NSArray)remoteParticipants;
- (NSData)frequencyLevels;
- (NSData)negotiationData;
- (NSDictionary)capabilities;
- (NSMutableDictionary)participantsToAdd;
- (NSMutableDictionary)remoteParticipantsMap;
- (NSString)description;
- (NSString)uuid;
- (OS_dispatch_queue)delegateNotificationQueue;
- (VCXPCClientShared)xpcConnection;
- (float)volume;
- (id)dispatchedConfiguration;
- (id)initPrivateWithTransportToken:(id)a3 configuration:(id)a4 negotiationData:(id)a5 delegate:(id)a6 queue:(id)a7;
- (id)negotiationDataForLoopbackParticipant;
- (id)negotiationDataForProtocolVersion:(unsigned int)a3;
- (id)newNSErrorWithErrorDictionary:(id)a3;
- (int64_t)sessionToken;
- (int64_t)streamTokenForStreamGroupID:(unsigned int)a3;
- (tagAVCSessionPresentationInfo)presentationInfo;
- (unsigned)mediaStateForMediaType:(unsigned int)a3;
- (void)addParticipant:(id)a3;
- (void)addParticipants:(id)a3;
- (void)appendConfigurationToXPCArguments:(id)a3;
- (void)beginParticipantConfiguration;
- (void)dealloc;
- (void)deregisterFromNotifications;
- (void)didAddParticipantHandlerWithResult:(id)a3;
- (void)endParticipantConfiguration;
- (void)participant:(id)a3 audioEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)participant:(id)a3 audioPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)participant:(id)a3 didReact:(id)a4;
- (void)participant:(id)a3 frequencyLevelsDidChange:(id)a4;
- (void)participant:(id)a3 mediaPrioritiesDidChange:(id)a4;
- (void)participant:(id)a3 mediaStateDidChange:(unsigned int)a4 forMediaType:(unsigned int)a5 didSucceed:(BOOL)a6 error:(id)a7;
- (void)participant:(id)a3 mixingDidStartForMediaType:(unsigned int)a4 mixingMediaType:(unsigned int)a5;
- (void)participant:(id)a3 mixingDidStopForMediaType:(unsigned int)a4;
- (void)participant:(id)a3 screenEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)participant:(id)a3 videoEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)participant:(id)a3 videoPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6;
- (void)participantDidStopReacting:(id)a3;
- (void)registerBlocksForNotifications;
- (void)removeParticipant:(id)a3;
- (void)removeParticipants:(id)a3;
- (void)setAudioEnabled:(BOOL)a3;
- (void)setAudioMuted:(BOOL)a3;
- (void)setAudioPaused:(BOOL)a3;
- (void)setCapabilities:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4;
- (void)setOneToOneEnabled:(BOOL)a3;
- (void)setPresentationInfo:(tagAVCSessionPresentationInfo *)a3;
- (void)setScreenEnabled:(BOOL)a3;
- (void)setVideoEnabled:(BOOL)a3;
- (void)setVideoPaused:(BOOL)a3;
- (void)setVolume:(float)a3;
- (void)setupNotificationQueue:(id)a3;
- (void)start;
- (void)stop;
- (void)stopWithError:(id)a3;
- (void)updateConfiguration:(id)a3;
- (void)updateOneToOneModeEnabled:(BOOL)a3;
- (void)validateParticipantConfiguration;
@end

@implementation AVCSession

- (void)dealloc
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v17 = v4;
        __int16 v18 = 2080;
        v19 = "-[AVCSession dealloc]";
        __int16 v20 = 1024;
        int v21 = 79;
        __int16 v22 = 2112;
        v23 = [(AVCSession *)self description];
        v6 = " [%s] %s:%d %@";
        v7 = v5;
        uint32_t v8 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(AVCSession *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v17 = v9;
        __int16 v18 = 2080;
        v19 = "-[AVCSession dealloc]";
        __int16 v20 = 1024;
        int v21 = 79;
        __int16 v22 = 2112;
        v23 = (AVCSession *)v3;
        __int16 v24 = 2048;
        v25 = self;
        __int16 v26 = 2112;
        v27 = [(AVCSession *)self description];
        v6 = " [%s] %s:%d %@(%p) %@";
        v7 = v10;
        uint32_t v8 = 58;
        goto LABEL_11;
      }
    }
  }
  [(AVCSession *)self setCapabilities:0];
  [(AVCSession *)self deregisterFromNotifications];
  [(AVCSessionParticipant *)self->_localParticipant setSharedXPCConnection:0];
  [(AVConferenceXPCClient *)self->_connection sendMessageSync:"vcSessionTerminate"];
  objc_storeWeak(&self->_delegate, 0);

  delegateNotificationQueue = self->_delegateNotificationQueue;
  if (delegateNotificationQueue) {
    dispatch_release(delegateNotificationQueue);
  }
  stateQueue = self->_stateQueue;
  if (stateQueue) {
    dispatch_release(stateQueue);
  }

  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCSession-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v17 = v13;
      __int16 v18 = 2080;
      v19 = "-[AVCSession dealloc]";
      __int16 v20 = 1024;
      int v21 = 100;
      __int16 v22 = 2048;
      v23 = self;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-dealloc (%p)", buf, 0x26u);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)AVCSession;
  [(AVCSession *)&v15 dealloc];
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"%@: transportToken[%@] configuration[%@]", NSStringFromClass(v4), self->_transportToken, self->_configuration];
}

- (id)dispatchedConfiguration
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v3 = (void *)[(AVCSessionConfiguration *)self->_configuration copy];

  return v3;
}

- (AVCSessionConfiguration)configuration
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__41;
  v10 = __Block_byref_object_dispose__41;
  uint64_t v11 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__AVCSession_configuration__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(stateQueue, block);
  v3 = (AVCSessionConfiguration *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __27__AVCSession_configuration__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dispatchedConfiguration];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSArray)remoteParticipants
{
  return (NSArray *)[(NSMutableDictionary *)self->_remoteParticipants allValues];
}

- (void)setAudioMuted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v13 = 136315906;
        *(void *)&v13[4] = v6;
        *(_WORD *)&v13[12] = 2080;
        *(void *)&v13[14] = "-[AVCSession setAudioMuted:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 128;
        WORD2(v14) = 1024;
        *(_DWORD *)((char *)&v14 + 6) = v3;
        uint64_t v8 = " [%s] %s:%d Session change to muted[%d]";
        uint64_t v9 = v7;
        uint32_t v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v5 = (__CFString *)[(AVCSession *)self performSelector:sel_logPrefix];
    }
    else {
      v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v13 = 136316418;
        *(void *)&v13[4] = v11;
        *(_WORD *)&v13[12] = 2080;
        *(void *)&v13[14] = "-[AVCSession setAudioMuted:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 128;
        WORD2(v14) = 2112;
        *(void *)((char *)&v14 + 6) = v5;
        HIWORD(v14) = 2048;
        objc_super v15 = self;
        LOWORD(v16) = 1024;
        *(_DWORD *)((char *)&v16 + 2) = v3;
        uint64_t v8 = " [%s] %s:%d %@(%p) Session change to muted[%d]";
        uint64_t v9 = v12;
        uint32_t v10 = 54;
        goto LABEL_11;
      }
    }
  }
  -[AVCSessionParticipant setAudioMuted:](self->_localParticipant, "setAudioMuted:", v3, *(_OWORD *)v13, *(void *)&v13[16], v14, v15, v16, v17);
}

- (void)setVolume:(float)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long v14 = 136315906;
        *(void *)&v14[4] = v7;
        *(_WORD *)&v14[12] = 2080;
        *(void *)&v14[14] = "-[AVCSession setVolume:]";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 133;
        WORD2(v15) = 2048;
        *(double *)((char *)&v15 + 6) = a3;
        uint64_t v9 = " [%s] %s:%d Session change to volume[%f]";
        uint32_t v10 = v8;
        uint32_t v11 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, v14, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v5 = (__CFString *)[(AVCSession *)self performSelector:sel_logPrefix];
    }
    else {
      v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long v14 = 136316418;
        *(void *)&v14[4] = v12;
        *(_WORD *)&v14[12] = 2080;
        *(void *)&v14[14] = "-[AVCSession setVolume:]";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 133;
        WORD2(v15) = 2112;
        *(void *)((char *)&v15 + 6) = v5;
        HIWORD(v15) = 2048;
        uint64_t v16 = self;
        LOWORD(v17) = 2048;
        *(double *)((char *)&v17 + 2) = a3;
        uint64_t v9 = " [%s] %s:%d %@(%p) Session change to volume[%f]";
        uint32_t v10 = v13;
        uint32_t v11 = 58;
        goto LABEL_11;
      }
    }
  }
  *(float *)&double v6 = a3;
  -[AVCSessionParticipant setVolume:](self->_localParticipant, "setVolume:", v6, *(_OWORD *)v14, *(void *)&v14[16], v15, v16, v17);
}

- (void)setOneToOneEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v17 = v6;
        __int16 v18 = 2080;
        v19 = "-[AVCSession setOneToOneEnabled:]";
        __int16 v20 = 1024;
        int v21 = 138;
        __int16 v22 = 1024;
        LODWORD(v23) = v3;
        uint64_t v8 = " [%s] %s:%d Session change to oneToOneEnabled[%d]";
        uint64_t v9 = v7;
        uint32_t v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v5 = (__CFString *)[(AVCSession *)self performSelector:sel_logPrefix];
    }
    else {
      v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v17 = v11;
        __int16 v18 = 2080;
        v19 = "-[AVCSession setOneToOneEnabled:]";
        __int16 v20 = 1024;
        int v21 = 138;
        __int16 v22 = 2112;
        v23 = v5;
        __int16 v24 = 2048;
        v25 = self;
        __int16 v26 = 1024;
        BOOL v27 = v3;
        uint64_t v8 = " [%s] %s:%d %@(%p) Session change to oneToOneEnabled[%d]";
        uint64_t v9 = v12;
        uint32_t v10 = 54;
        goto LABEL_11;
      }
    }
  }
  stateQueue = self->_stateQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __33__AVCSession_setOneToOneEnabled___block_invoke;
  v14[3] = &unk_1E6DB3DF0;
  v14[4] = self;
  BOOL v15 = v3;
  dispatch_async(stateQueue, v14);
}

void __33__AVCSession_setOneToOneEnabled___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 32) isOneToOneModeEnabled];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *(void *)(a1 + 32);
  if (v3 == v2)
  {
    if (v4 == v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_19;
      }
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      int v10 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      uint64_t v34 = v8;
      __int16 v35 = 2080;
      v36 = "-[AVCSession setOneToOneEnabled:]_block_invoke";
      __int16 v37 = 1024;
      int v38 = 141;
      __int16 v39 = 1024;
      LODWORD(v40) = v10;
      uint64_t v11 = " [%s] %s:%d Session is already configure with oneToOneMode Enabled[%d]";
      uint64_t v12 = v9;
      uint32_t v13 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_19;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      int v21 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      uint64_t v22 = *(void *)(a1 + 32);
      int v23 = *(unsigned __int8 *)(a1 + 40);
      *(_DWORD *)buf = 136316418;
      uint64_t v34 = v20;
      __int16 v35 = 2080;
      v36 = "-[AVCSession setOneToOneEnabled:]_block_invoke";
      __int16 v37 = 1024;
      int v38 = 141;
      __int16 v39 = 2112;
      v40 = v6;
      __int16 v41 = 2048;
      uint64_t v42 = v22;
      __int16 v43 = 1024;
      int v44 = v23;
      uint64_t v11 = " [%s] %s:%d %@(%p) Session is already configure with oneToOneMode Enabled[%d]";
      uint64_t v12 = v21;
      uint32_t v13 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_19:
    __int16 v24 = [*(id *)(a1 + 32) delegateNotificationQueue];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __33__AVCSession_setOneToOneEnabled___block_invoke_15;
    v29[3] = &unk_1E6DB3DF0;
    v29[4] = *(void *)(a1 + 32);
    char v30 = *(unsigned char *)(a1 + 40);
    dispatch_async(v24, v29);
    return;
  }
  if (v4 == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_25;
    }
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    BOOL v15 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    int v16 = *(unsigned __int8 *)(a1 + 40);
    *(_DWORD *)buf = 136315906;
    uint64_t v34 = v14;
    __int16 v35 = 2080;
    v36 = "-[AVCSession setOneToOneEnabled:]_block_invoke_2";
    __int16 v37 = 1024;
    int v38 = 149;
    __int16 v39 = 1024;
    LODWORD(v40) = v16;
    uint64_t v17 = " [%s] %s:%d oneToOneModeEnabled[%d]";
    __int16 v18 = v15;
    uint32_t v19 = 34;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_25;
    }
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    __int16 v26 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    uint64_t v27 = *(void *)(a1 + 32);
    int v28 = *(unsigned __int8 *)(a1 + 40);
    *(_DWORD *)buf = 136316418;
    uint64_t v34 = v25;
    __int16 v35 = 2080;
    v36 = "-[AVCSession setOneToOneEnabled:]_block_invoke";
    __int16 v37 = 1024;
    int v38 = 149;
    __int16 v39 = 2112;
    v40 = v7;
    __int16 v41 = 2048;
    uint64_t v42 = v27;
    __int16 v43 = 1024;
    int v44 = v28;
    uint64_t v17 = " [%s] %s:%d %@(%p) oneToOneModeEnabled[%d]";
    __int16 v18 = v26;
    uint32_t v19 = 54;
  }
  _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_25:
  v31 = @"vcSessionOneOnOneModeEnabled";
  uint64_t v32 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "sendMessageAsync:arguments:", "vcSessionSetOneToOneEnabled", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
}

uint64_t __33__AVCSession_setOneToOneEnabled___block_invoke_15(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    int v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
    return [v3 session:v4 oneToOneEnabled:v5 didSucceed:1 error:0];
  }
  return result;
}

- (void)updateOneToOneModeEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__AVCSession_updateOneToOneModeEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __40__AVCSession_updateOneToOneModeEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) setOneToOneModeEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setAudioEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint32_t v13 = 136315906;
        *(void *)&v13[4] = v6;
        *(_WORD *)&v13[12] = 2080;
        *(void *)&v13[14] = "-[AVCSession setAudioEnabled:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 162;
        WORD2(v14) = 1024;
        *(_DWORD *)((char *)&v14 + 6) = v3;
        uint64_t v8 = " [%s] %s:%d Session change to audio enabled[%d]";
        uint64_t v9 = v7;
        uint32_t v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v5 = (__CFString *)[(AVCSession *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint32_t v13 = 136316418;
        *(void *)&v13[4] = v11;
        *(_WORD *)&v13[12] = 2080;
        *(void *)&v13[14] = "-[AVCSession setAudioEnabled:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 162;
        WORD2(v14) = 2112;
        *(void *)((char *)&v14 + 6) = v5;
        HIWORD(v14) = 2048;
        BOOL v15 = self;
        LOWORD(v16) = 1024;
        *(_DWORD *)((char *)&v16 + 2) = v3;
        uint64_t v8 = " [%s] %s:%d %@(%p) Session change to audio enabled[%d]";
        uint64_t v9 = v12;
        uint32_t v10 = 54;
        goto LABEL_11;
      }
    }
  }
  -[AVCSessionParticipant setAudioEnabled:](self->_localParticipant, "setAudioEnabled:", v3, *(_OWORD *)v13, *(void *)&v13[16], v14, v15, v16, v17);
}

- (void)setVideoEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint32_t v13 = 136315906;
        *(void *)&v13[4] = v6;
        *(_WORD *)&v13[12] = 2080;
        *(void *)&v13[14] = "-[AVCSession setVideoEnabled:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 167;
        WORD2(v14) = 1024;
        *(_DWORD *)((char *)&v14 + 6) = v3;
        uint64_t v8 = " [%s] %s:%d Session change to video enabled[%d]";
        uint64_t v9 = v7;
        uint32_t v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v5 = (__CFString *)[(AVCSession *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint32_t v13 = 136316418;
        *(void *)&v13[4] = v11;
        *(_WORD *)&v13[12] = 2080;
        *(void *)&v13[14] = "-[AVCSession setVideoEnabled:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 167;
        WORD2(v14) = 2112;
        *(void *)((char *)&v14 + 6) = v5;
        HIWORD(v14) = 2048;
        BOOL v15 = self;
        LOWORD(v16) = 1024;
        *(_DWORD *)((char *)&v16 + 2) = v3;
        uint64_t v8 = " [%s] %s:%d %@(%p) Session change to video enabled[%d]";
        uint64_t v9 = v12;
        uint32_t v10 = 54;
        goto LABEL_11;
      }
    }
  }
  -[AVCSessionParticipant setVideoEnabled:](self->_localParticipant, "setVideoEnabled:", v3, *(_OWORD *)v13, *(void *)&v13[16], v14, v15, v16, v17);
}

- (void)setScreenEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint32_t v13 = 136315906;
        *(void *)&v13[4] = v6;
        *(_WORD *)&v13[12] = 2080;
        *(void *)&v13[14] = "-[AVCSession setScreenEnabled:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 172;
        WORD2(v14) = 1024;
        *(_DWORD *)((char *)&v14 + 6) = v3;
        uint64_t v8 = " [%s] %s:%d Session change to screen enabled[%d]";
        uint64_t v9 = v7;
        uint32_t v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v5 = (__CFString *)[(AVCSession *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint32_t v13 = 136316418;
        *(void *)&v13[4] = v11;
        *(_WORD *)&v13[12] = 2080;
        *(void *)&v13[14] = "-[AVCSession setScreenEnabled:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 172;
        WORD2(v14) = 2112;
        *(void *)((char *)&v14 + 6) = v5;
        HIWORD(v14) = 2048;
        BOOL v15 = self;
        LOWORD(v16) = 1024;
        *(_DWORD *)((char *)&v16 + 2) = v3;
        uint64_t v8 = " [%s] %s:%d %@(%p) Session change to screen enabled[%d]";
        uint64_t v9 = v12;
        uint32_t v10 = 54;
        goto LABEL_11;
      }
    }
  }
  -[AVCSessionParticipant setScreenEnabled:](self->_localParticipant, "setScreenEnabled:", v3, *(_OWORD *)v13, *(void *)&v13[16], v14, v15, v16, v17);
}

- (void)setAudioPaused:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint32_t v13 = 136315906;
        *(void *)&v13[4] = v6;
        *(_WORD *)&v13[12] = 2080;
        *(void *)&v13[14] = "-[AVCSession setAudioPaused:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 177;
        WORD2(v14) = 1024;
        *(_DWORD *)((char *)&v14 + 6) = v3;
        uint64_t v8 = " [%s] %s:%d Session change to audio paused[%d]";
        uint64_t v9 = v7;
        uint32_t v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v5 = (__CFString *)[(AVCSession *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint32_t v13 = 136316418;
        *(void *)&v13[4] = v11;
        *(_WORD *)&v13[12] = 2080;
        *(void *)&v13[14] = "-[AVCSession setAudioPaused:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 177;
        WORD2(v14) = 2112;
        *(void *)((char *)&v14 + 6) = v5;
        HIWORD(v14) = 2048;
        BOOL v15 = self;
        LOWORD(v16) = 1024;
        *(_DWORD *)((char *)&v16 + 2) = v3;
        uint64_t v8 = " [%s] %s:%d %@(%p) Session change to audio paused[%d]";
        uint64_t v9 = v12;
        uint32_t v10 = 54;
        goto LABEL_11;
      }
    }
  }
  -[AVCSessionParticipant setAudioPaused:](self->_localParticipant, "setAudioPaused:", v3, *(_OWORD *)v13, *(void *)&v13[16], v14, v15, v16, v17);
}

- (void)setVideoPaused:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint32_t v13 = 136315906;
        *(void *)&v13[4] = v6;
        *(_WORD *)&v13[12] = 2080;
        *(void *)&v13[14] = "-[AVCSession setVideoPaused:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 182;
        WORD2(v14) = 1024;
        *(_DWORD *)((char *)&v14 + 6) = v3;
        uint64_t v8 = " [%s] %s:%d Session change to video paused[%d]";
        uint64_t v9 = v7;
        uint32_t v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v5 = (__CFString *)[(AVCSession *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint32_t v13 = 136316418;
        *(void *)&v13[4] = v11;
        *(_WORD *)&v13[12] = 2080;
        *(void *)&v13[14] = "-[AVCSession setVideoPaused:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 182;
        WORD2(v14) = 2112;
        *(void *)((char *)&v14 + 6) = v5;
        HIWORD(v14) = 2048;
        BOOL v15 = self;
        LOWORD(v16) = 1024;
        *(_DWORD *)((char *)&v16 + 2) = v3;
        uint64_t v8 = " [%s] %s:%d %@(%p) Session change to video paused[%d]";
        uint64_t v9 = v12;
        uint32_t v10 = 54;
        goto LABEL_11;
      }
    }
  }
  -[AVCSessionParticipant setVideoPaused:](self->_localParticipant, "setVideoPaused:", v3, *(_OWORD *)v13, *(void *)&v13[16], v14, v15, v16, v17);
}

- (NSString)uuid
{
  return [(AVCSessionParticipant *)self->_localParticipant uuid];
}

- (NSData)negotiationData
{
  uint64_t result = self->_cachedNegotiationData;
  if (!result)
  {
    uint64_t result = (NSData *)[(AVCSession *)self negotiationDataForProtocolVersion:0];
    self->_cachedNegotiationData = result;
  }
  return result;
}

+ (int)mediaNegotiatorVersionWithNegotiationProtocolVersion:(unsigned int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = +[VCDefaults integerValueForKey:@"forceMediaNegotiatorVersion" defaultValue:-1];
  if (v4 > 1)
  {
    if (a3 == 1) {
      int v7 = 1;
    }
    else {
      int v7 = -1;
    }
    if (a3) {
      return v7;
    }
    else {
      return 0;
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315906;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      uint64_t v12 = "+[AVCSession mediaNegotiatorVersionWithNegotiationProtocolVersion:]";
      __int16 v13 = 1024;
      int v14 = 200;
      __int16 v15 = 1024;
      unsigned int v16 = v4;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing mediaNegotiatorVersion=%d", (uint8_t *)&v9, 0x22u);
    }
  }
  return v4;
}

- (id)negotiationDataForProtocolVersion:(unsigned int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[AVCSession mediaNegotiatorVersionWithNegotiationProtocolVersion:](AVCSession, "mediaNegotiatorVersionWithNegotiationProtocolVersion:");
  if (v5 == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCSession negotiationDataForProtocolVersion:]();
      }
    }
    return 0;
  }
  else
  {
    id v6 = +[VCSessionParticipant participantDataWithMediaNegotiatorVersion:v5 participantData:[(AVCSessionParticipant *)self->_localParticipant negotiationData]];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315906;
        uint64_t v11 = v7;
        __int16 v12 = 2080;
        __int16 v13 = "-[AVCSession negotiationDataForProtocolVersion:]";
        __int16 v14 = 1024;
        int v15 = 222;
        __int16 v16 = 1024;
        unsigned int v17 = a3;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Negotiation blob requested with protocol version=%d", (uint8_t *)&v10, 0x22u);
      }
    }
  }
  return v6;
}

- (id)negotiationDataForLoopbackParticipant
{
  id v2 = +[VCSessionParticipant participantInfoWithParticipantData:[(AVCSession *)self negotiationDataForProtocolVersion:1]];
  BOOL v3 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v2];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString"), @"vcSessionParticipantKeyUUID");

  return +[VCSessionParticipant participantDataWithParticipantInfo:v3];
}

- (BOOL)isAudioPaused
{
  return [(AVCSessionParticipant *)self->_localParticipant isAudioPaused];
}

- (BOOL)isVideoPaused
{
  return [(AVCSessionParticipant *)self->_localParticipant isVideoPaused];
}

- (BOOL)isAudioEnabled
{
  return [(AVCSessionParticipant *)self->_localParticipant isAudioEnabled];
}

- (BOOL)isVideoEnabled
{
  return [(AVCSessionParticipant *)self->_localParticipant isVideoEnabled];
}

- (BOOL)isScreenEnabled
{
  return [(AVCSessionParticipant *)self->_localParticipant isScreenEnabled];
}

- (BOOL)isAudioMuted
{
  if (VCFeatureFlagManager_SessionBasedMutingEnabled())
  {
    return +[AVAudioClient isMicrophoneMuted];
  }
  else
  {
    localParticipant = self->_localParticipant;
    return [(AVCSessionParticipant *)localParticipant isAudioMuted];
  }
}

- (float)volume
{
  [(AVCSessionParticipant *)self->_localParticipant volume];
  return result;
}

- (BOOL)isOneToOneEnabled
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = -86;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__AVCSession_isOneToOneEnabled__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(stateQueue, block);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__AVCSession_isOneToOneEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) isOneToOneModeEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setDelegate:(id)a3
{
}

- (AVCSessionDelegate)delegate
{
  return (AVCSessionDelegate *)objc_loadWeak(&self->_delegate);
}

- (tagAVCSessionPresentationInfo)presentationInfo
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x5010000000;
  __int16 v12 = "";
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__AVCSession_presentationInfo__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  void block[5] = &v9;
  dispatch_sync(stateQueue, block);
  uint64_t v5 = v10;
  CGSize v6 = (CGSize)*((_OWORD *)v10 + 3);
  retstr->var0.origin = (CGPoint)*((_OWORD *)v10 + 2);
  retstr->var0.size = v6;
  *(_OWORD *)&retstr->var1 = *((_OWORD *)v5 + 4);
  _Block_object_dispose(&v9, 8);
  return result;
}

__n128 __30__AVCSession_presentationInfo__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 128);
  if (v2)
  {
    [v2 avcSessionPresentationInfo];
  }
  else
  {
    long long v6 = 0u;
    __n128 v7 = 0u;
    long long v5 = 0u;
  }
  char v3 = *(_OWORD **)(*(void *)(a1 + 40) + 8);
  __n128 result = v7;
  v3[2] = v5;
  v3[3] = v6;
  v3[4] = v7;
  return result;
}

- (void)setPresentationInfo:(tagAVCSessionPresentationInfo *)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    long long v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      CGFloat x = a3->var0.origin.x;
      CGFloat y = a3->var0.origin.y;
      CGFloat width = a3->var0.size.width;
      CGFloat height = a3->var0.size.height;
      unsigned int var1 = a3->var1;
      unsigned int var2 = a3->var2;
      int var3 = a3->var3;
      *(_DWORD *)buf = 136317442;
      uint64_t v42 = v5;
      __int16 v43 = 2080;
      int v44 = "-[AVCSession setPresentationInfo:]";
      __int16 v45 = 1024;
      int v46 = 292;
      __int16 v47 = 2048;
      CGFloat v48 = x;
      __int16 v49 = 2048;
      v50 = *(AVCSession **)&y;
      __int16 v51 = 2048;
      CGFloat v52 = width;
      __int16 v53 = 2048;
      CGFloat v54 = height;
      __int16 v55 = 1024;
      unsigned int v56 = var1;
      __int16 v57 = 1024;
      unsigned int v58 = var2;
      __int16 v59 = 1024;
      int v60 = var3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [AVC SPATIAL AUDIO] Receivieng presentation info: rect=[%f, %f, %f, %f] didplayID=%u layout=%d state=%u", buf, 0x56u);
    }
  }
  p_unsigned int var2 = &a3->var2;
  if (!a3->var2)
  {
    p_CGSize size = &a3->var0.size;
    if (a3->var0.size.width <= 0.0)
    {
      if ((AVCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCSession setPresentationInfo:]();
          }
        }
        return;
      }
      if (objc_opt_respondsToSelector()) {
        *(double *)&int v21 = COERCE_DOUBLE([(AVCSession *)self performSelector:sel_logPrefix]);
      }
      else {
        *(double *)&int v21 = COERCE_DOUBLE(&stru_1F3D3E450);
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return;
      }
      uint64_t v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return;
      }
      CGFloat v30 = p_size->width;
      *(_DWORD *)buf = 136316418;
      uint64_t v42 = v28;
      __int16 v43 = 2080;
      int v44 = "-[AVCSession setPresentationInfo:]";
      __int16 v45 = 1024;
      int v46 = 294;
      __int16 v47 = 2112;
      CGFloat v48 = *(double *)&v21;
      __int16 v49 = 2048;
      v50 = self;
      __int16 v51 = 2048;
      CGFloat v52 = v30;
      uint64_t v27 = " [%s] %s:%d %@(%p) Invalid display width=%f";
    }
    else
    {
      p_CGFloat height = &a3->var0.size.height;
      if (a3->var0.size.height > 0.0)
      {
        p_int var3 = &a3->var3;
        if (a3->var3 < 4u)
        {
          stateQueue = self->_stateQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          CGSize size = a3->var0.size;
          CGPoint origin = a3->var0.origin;
          CGSize v39 = size;
          block[2] = __34__AVCSession_setPresentationInfo___block_invoke;
          block[3] = &unk_1E6DB7F08;
          block[4] = self;
          long long v40 = *(_OWORD *)&a3->var1;
          dispatch_async(stateQueue, block);
          return;
        }
        if ((AVCSession *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[AVCSession setPresentationInfo:]();
            }
          }
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            *(double *)&int v23 = COERCE_DOUBLE([(AVCSession *)self performSelector:sel_logPrefix]);
          }
          else {
            *(double *)&int v23 = COERCE_DOUBLE(&stru_1F3D3E450);
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v35 = VRTraceErrorLogLevelToCSTR();
            uint64_t v25 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              int v36 = *p_var3;
              *(_DWORD *)buf = 136316418;
              uint64_t v42 = v35;
              __int16 v43 = 2080;
              int v44 = "-[AVCSession setPresentationInfo:]";
              __int16 v45 = 1024;
              int v46 = 296;
              __int16 v47 = 2112;
              CGFloat v48 = *(double *)&v23;
              __int16 v49 = 2048;
              v50 = self;
              __int16 v51 = 1024;
              LODWORD(v52) = v36;
              uint64_t v27 = " [%s] %s:%d %@(%p) Invalid state=%u";
              goto LABEL_51;
            }
          }
        }
        return;
      }
      if ((AVCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCSession setPresentationInfo:]();
          }
        }
        return;
      }
      if (objc_opt_respondsToSelector()) {
        *(double *)&uint64_t v22 = COERCE_DOUBLE([(AVCSession *)self performSelector:sel_logPrefix]);
      }
      else {
        *(double *)&uint64_t v22 = COERCE_DOUBLE(&stru_1F3D3E450);
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return;
      }
      uint64_t v31 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return;
      }
      double v32 = *p_height;
      *(_DWORD *)buf = 136316418;
      uint64_t v42 = v31;
      __int16 v43 = 2080;
      int v44 = "-[AVCSession setPresentationInfo:]";
      __int16 v45 = 1024;
      int v46 = 295;
      __int16 v47 = 2112;
      CGFloat v48 = *(double *)&v22;
      __int16 v49 = 2048;
      v50 = self;
      __int16 v51 = 2048;
      CGFloat v52 = v32;
      uint64_t v27 = " [%s] %s:%d %@(%p) Invalid display height=%f";
    }
    v33 = v29;
    uint32_t v34 = 58;
LABEL_52:
    _os_log_error_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_ERROR, v27, buf, v34);
    return;
  }
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCSession setPresentationInfo:].cold.4();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      *(double *)&uint64_t v20 = COERCE_DOUBLE([(AVCSession *)self performSelector:sel_logPrefix]);
    }
    else {
      *(double *)&uint64_t v20 = COERCE_DOUBLE(&stru_1F3D3E450);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      uint64_t v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        unsigned int v26 = *p_var2;
        *(_DWORD *)buf = 136316418;
        uint64_t v42 = v24;
        __int16 v43 = 2080;
        int v44 = "-[AVCSession setPresentationInfo:]";
        __int16 v45 = 1024;
        int v46 = 293;
        __int16 v47 = 2112;
        CGFloat v48 = *(double *)&v20;
        __int16 v49 = 2048;
        v50 = self;
        __int16 v51 = 1024;
        LODWORD(v52) = v26;
        uint64_t v27 = " [%s] %s:%d %@(%p) Invalid layout=%u";
LABEL_51:
        v33 = v25;
        uint32_t v34 = 54;
        goto LABEL_52;
      }
    }
  }
}

void __34__AVCSession_setPresentationInfo___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long __s1 = xmmword_1E25A3218;
  long long v9 = unk_1E25A3228;
  long long v10 = xmmword_1E25A3238;
  id v2 = *(void **)(*(void *)(a1 + 32) + 128);
  if (v2)
  {
    [v2 avcSessionPresentationInfo];
  }
  else
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long __s1 = 0u;
  }
  if (memcmp(&__s1, (const void *)(a1 + 40), 0x30uLL))
  {
    long long v3 = *(_OWORD *)(a1 + 56);
    v7[0] = *(_OWORD *)(a1 + 40);
    v7[1] = v3;
    v7[2] = *(_OWORD *)(a1 + 72);
    [*(id *)(*(void *)(a1 + 32) + 128) setAvcSessionPresentationInfo:v7];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 128) description];
        *(_DWORD *)buf = 136315906;
        uint64_t v12 = v4;
        __int16 v13 = 2080;
        long long v14 = "-[AVCSession setPresentationInfo:]_block_invoke";
        __int16 v15 = 1024;
        int v16 = 306;
        __int16 v17 = 2112;
        uint64_t v18 = v6;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [AVC SPATIAL AUDIO] Presentation info updated: %@", buf, 0x26u);
      }
    }
  }
}

- (id)initPrivateWithTransportToken:(id)a3 configuration:(id)a4 negotiationData:(id)a5 delegate:(id)a6 queue:(id)a7
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  VRTraceReset();
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      __int16 v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v66 = v14;
        __int16 v67 = 2080;
        v68 = "-[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:]";
        __int16 v69 = 1024;
        int v70 = 318;
        __int16 v71 = 2112;
        id v72 = a3;
        int v16 = " [%s] %s:%d transportToken[%@]";
        __int16 v17 = v15;
        uint32_t v18 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = (__CFString *)[(AVCSession *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v66 = v19;
        __int16 v67 = 2080;
        v68 = "-[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:]";
        __int16 v69 = 1024;
        int v70 = 318;
        __int16 v71 = 2112;
        id v72 = v13;
        __int16 v73 = 2048;
        v74 = self;
        __int16 v75 = 2112;
        id v76 = a3;
        int v16 = " [%s] %s:%d %@(%p) transportToken[%@]";
        __int16 v17 = v20;
        uint32_t v18 = 58;
        goto LABEL_11;
      }
    }
  }
  v64.receiver = self;
  v64.super_class = (Class)AVCSession;
  int v21 = [(AVCSession *)&v64 init];
  if (!v21) {
    return v21;
  }
  if (VCDefaults_GetBoolValueForKey(@"forceLoopback", 0)) {
    a3 = (id)[NSString stringWithFormat:@"%@%u", @"loopback:", arc4random()];
  }
  if (a3)
  {
    if (a4
      && [a4 parentNWActivity]
      && ([a4 parentNWActivity], (nw_activity_is_activated() & 1) == 0))
    {
      if ((AVCSession *)objc_opt_class() == v21)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:].cold.4();
          }
        }
        goto LABEL_82;
      }
      if (objc_opt_respondsToSelector()) {
        CGFloat v52 = (__CFString *)[(AVCSession *)v21 performSelector:sel_logPrefix];
      }
      else {
        CGFloat v52 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v61 = VRTraceErrorLogLevelToCSTR();
        CGFloat v54 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v66 = v61;
          __int16 v67 = 2080;
          v68 = "-[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:]";
          __int16 v69 = 1024;
          int v70 = 328;
          __int16 v71 = 2112;
          id v72 = v52;
          __int16 v73 = 2048;
          v74 = v21;
          __int16 v55 = " [%s] %s:%d %@(%p) Non-nil parentNWActivity is unactivated!";
          goto LABEL_80;
        }
      }
    }
    else
    {
      v21->_transportToken = (NSString *)a3;
      v21->_configuration = (AVCSessionConfiguration *)a4;
      v21->_connection = objc_alloc_init(VCXPCClientShared);
      v21->_remoteParticipants = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v21->_participantsToAdd = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
      v21->_stateQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AVCSession.stateQueue", 0, CustomRootQueue);
      v21->_presentationInfo = objc_alloc_init(VCSessionPresentationInfo);
      v21->_cachedNegotiationData = (NSData *)a5;
      objc_storeWeak(&v21->_delegate, a6);
      [(AVCSession *)v21 setupNotificationQueue:a7];
      [(AVCSession *)v21 registerBlocksForNotifications];
      int v23 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      [v23 setObject:a3 forKeyedSubscript:@"vcSessionIDSDestination"];
      configuration = v21->_configuration;
      if (configuration) {
        objc_msgSend(v23, "setObject:forKeyedSubscript:", -[AVCSessionConfiguration dictionary](configuration, "dictionary"), @"vcSessionConfiguration");
      }
      if (a5) {
        [v23 setObject:a5 forKeyedSubscript:@"vcSessionParticipantData"];
      }
      id v25 = [(AVConferenceXPCClient *)v21->_connection sendMessageSync:"vcSessionInitialize" arguments:v23];
      unsigned int v26 = (void *)[v25 objectForKeyedSubscript:@"vcSessionSucceeded"];
      v21->_uuid = (NSString *)(id)[v25 objectForKeyedSubscript:@"vcSessionUUID"];
      if ([v26 BOOLValue])
      {
        uint64_t v27 = [v25 objectForKeyedSubscript:@"vcSessionParticipantData"];
        id v28 = -[AVConferenceXPCClient newNSDictionaryFromNSDictionary:](v21->_connection, "newNSDictionaryFromNSDictionary:", [v25 objectForKeyedSubscript:@"vcSessionParameterStreamTokens"]);
        if (v28)
        {
          id v29 = v28;
          CGFloat v30 = [[AVCSessionParticipant alloc] initWithParticipantID:0 data:v27 delegate:v21 queue:0];
          v21->_localParticipant = v30;
          [(AVCSessionParticipant *)v30 setStateQueue:v21->_stateQueue];
          [(AVCSessionParticipant *)v21->_localParticipant setStreamTokens:v29];
          if ((AVCSession *)objc_opt_class() == v21)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() <= 6
              || (uint64_t v32 = VRTraceErrorLogLevelToCSTR(),
                  v33 = *MEMORY[0x1E4F47A50],
                  !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)))
            {
LABEL_36:
              v21->_sessionToken = objc_msgSend((id)objc_msgSend(v25, "objectForKeyedSubscript:", @"vcSessionToken"), "integerValue");
              v21->_capabilities = (NSDictionary *)(id)[v25 objectForKeyedSubscript:@"vcSessionCapabilities"];
              MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCSession-init");
              if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
              {
                uint64_t v45 = VRTraceErrorLogLevelToCSTR();
                int v46 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v47 = [(AVCSessionParticipant *)v21->_localParticipant uuid];
                  *(_DWORD *)buf = 136316418;
                  uint64_t v66 = v45;
                  __int16 v67 = 2080;
                  v68 = "-[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:]";
                  __int16 v69 = 1024;
                  int v70 = 377;
                  __int16 v71 = 2048;
                  id v72 = v21;
                  __int16 v73 = 2112;
                  v74 = (AVCSession *)v47;
                  __int16 v75 = 2112;
                  id v76 = a3;
                  _os_log_impl(&dword_1E1EA4000, v46, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-init (%p) localParticipantID=%@, transportToken=%@", buf, 0x3Au);
                }
              }
              return v21;
            }
            localParticipant = v21->_localParticipant;
            stateQueue = v21->_stateQueue;
            connection = v21->_connection;
            *(_DWORD *)buf = 136316418;
            uint64_t v66 = v32;
            __int16 v67 = 2080;
            v68 = "-[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:]";
            __int16 v69 = 1024;
            int v70 = 366;
            __int16 v71 = 2048;
            id v72 = localParticipant;
            __int16 v73 = 2048;
            v74 = (AVCSession *)stateQueue;
            __int16 v75 = 2048;
            id v76 = connection;
            __int16 v37 = " [%s] %s:%d localParticipant [%p] has been created and stateQueue [%p] and shared xpc connection [%p] have been set";
            int v38 = v33;
            uint32_t v39 = 58;
          }
          else
          {
            if (objc_opt_respondsToSelector()) {
              uint64_t v31 = (__CFString *)[(AVCSession *)v21 performSelector:sel_logPrefix];
            }
            else {
              uint64_t v31 = &stru_1F3D3E450;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
              goto LABEL_36;
            }
            uint64_t v40 = VRTraceErrorLogLevelToCSTR();
            __int16 v41 = *MEMORY[0x1E4F47A50];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_36;
            }
            uint64_t v42 = v21->_localParticipant;
            __int16 v43 = v21->_stateQueue;
            int v44 = v21->_connection;
            *(_DWORD *)buf = 136316930;
            uint64_t v66 = v40;
            __int16 v67 = 2080;
            v68 = "-[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:]";
            __int16 v69 = 1024;
            int v70 = 366;
            __int16 v71 = 2112;
            id v72 = v31;
            __int16 v73 = 2048;
            v74 = v21;
            __int16 v75 = 2048;
            id v76 = v42;
            __int16 v77 = 2048;
            v78 = v43;
            __int16 v79 = 2048;
            v80 = v44;
            __int16 v37 = " [%s] %s:%d %@(%p) localParticipant [%p] has been created and stateQueue [%p] and shared xpc connectio"
                  "n [%p] have been set";
            int v38 = v41;
            uint32_t v39 = 78;
          }
          _os_log_impl(&dword_1E1EA4000, v38, OS_LOG_TYPE_DEFAULT, v37, buf, v39);
          goto LABEL_36;
        }
        if ((AVCSession *)objc_opt_class() == v21)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:]();
            }
          }
          goto LABEL_82;
        }
        if (objc_opt_respondsToSelector()) {
          __int16 v51 = (__CFString *)[(AVCSession *)v21 performSelector:sel_logPrefix];
        }
        else {
          __int16 v51 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v60 = VRTraceErrorLogLevelToCSTR();
          CGFloat v54 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v66 = v60;
            __int16 v67 = 2080;
            v68 = "-[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:]";
            __int16 v69 = 1024;
            int v70 = 360;
            __int16 v71 = 2112;
            id v72 = v51;
            __int16 v73 = 2048;
            v74 = v21;
            __int16 v55 = " [%s] %s:%d %@(%p) Failed to retrieve stream token mapping";
            goto LABEL_80;
          }
        }
      }
      else
      {
        if ((AVCSession *)objc_opt_class() == v21)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:]();
            }
          }
          goto LABEL_82;
        }
        if (objc_opt_respondsToSelector()) {
          v50 = (__CFString *)[(AVCSession *)v21 performSelector:sel_logPrefix];
        }
        else {
          v50 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v56 = VRTraceErrorLogLevelToCSTR();
          __int16 v57 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316418;
            uint64_t v66 = v56;
            __int16 v67 = 2080;
            v68 = "-[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:]";
            __int16 v69 = 1024;
            int v70 = 356;
            __int16 v71 = 2112;
            id v72 = v50;
            __int16 v73 = 2048;
            v74 = v21;
            __int16 v75 = 2112;
            id v76 = a3;
            __int16 v55 = " [%s] %s:%d %@(%p) failed transportToken[%@]";
            unsigned int v58 = v57;
            uint32_t v59 = 58;
LABEL_81:
            _os_log_error_impl(&dword_1E1EA4000, v58, OS_LOG_TYPE_ERROR, v55, buf, v59);
          }
        }
      }
    }
  }
  else
  {
    if ((AVCSession *)objc_opt_class() == v21)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:]();
        }
      }
      goto LABEL_82;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v49 = (__CFString *)[(AVCSession *)v21 performSelector:sel_logPrefix];
    }
    else {
      __int16 v49 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v53 = VRTraceErrorLogLevelToCSTR();
      CGFloat v54 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v66 = v53;
        __int16 v67 = 2080;
        v68 = "-[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:]";
        __int16 v69 = 1024;
        int v70 = 325;
        __int16 v71 = 2112;
        id v72 = v49;
        __int16 v73 = 2048;
        v74 = v21;
        __int16 v55 = " [%s] %s:%d %@(%p) Transport token is nil";
LABEL_80:
        unsigned int v58 = v54;
        uint32_t v59 = 48;
        goto LABEL_81;
      }
    }
  }
LABEL_82:

  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCSession-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v62 = VRTraceErrorLogLevelToCSTR();
    v63 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v66 = v62;
      __int16 v67 = 2080;
      v68 = "-[AVCSession initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:]";
      __int16 v69 = 1024;
      int v70 = 375;
      __int16 v71 = 2048;
      id v72 = 0;
      _os_log_impl(&dword_1E1EA4000, v63, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-init (%p)", buf, 0x26u);
    }
  }
  return 0;
}

- (void)setMediaState:(unsigned int)a3 forMediaType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      long long v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int16 v15 = 136316162;
        *(void *)&v15[4] = v8;
        *(_WORD *)&v15[12] = 2080;
        *(void *)&v15[14] = "-[AVCSession setMediaState:forMediaType:]";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 386;
        WORD2(v16) = 1024;
        *(_DWORD *)((char *)&v16 + 6) = v4;
        WORD5(v16) = 1024;
        HIDWORD(v16) = v5;
        long long v10 = " [%s] %s:%d Session change to media type=%d state=%d";
        uint64_t v11 = v9;
        uint32_t v12 = 40;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, v15, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __n128 v7 = (__CFString *)[(AVCSession *)self performSelector:sel_logPrefix];
    }
    else {
      __n128 v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int16 v15 = 136316674;
        *(void *)&v15[4] = v13;
        *(_WORD *)&v15[12] = 2080;
        *(void *)&v15[14] = "-[AVCSession setMediaState:forMediaType:]";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 386;
        WORD2(v16) = 2112;
        *(void *)((char *)&v16 + 6) = v7;
        HIWORD(v16) = 2048;
        __int16 v17 = self;
        LOWORD(v18) = 1024;
        *(_DWORD *)((char *)&v18 + 2) = v4;
        HIWORD(v18) = 1024;
        LODWORD(v19) = v5;
        long long v10 = " [%s] %s:%d %@(%p) Session change to media type=%d state=%d";
        uint64_t v11 = v14;
        uint32_t v12 = 60;
        goto LABEL_11;
      }
    }
  }
  -[AVCSessionParticipant setMediaState:forMediaType:](self->_localParticipant, "setMediaState:forMediaType:", v5, v4, *(_OWORD *)v15, *(void *)&v15[16], v16, v17, v18, v19);
}

- (unsigned)mediaStateForMediaType:(unsigned int)a3
{
  return [(AVCSessionParticipant *)self->_localParticipant mediaStateForMediaType:*(void *)&a3];
}

- (int64_t)streamTokenForStreamGroupID:(unsigned int)a3
{
  return [(AVCSessionParticipant *)self->_localParticipant streamTokenForStreamGroupID:*(void *)&a3];
}

- (AVCSession)initWithTransportToken:(id)a3 configuration:(id)a4 delegate:(id)a5 queue:(id)a6
{
  return (AVCSession *)[(AVCSession *)self initPrivateWithTransportToken:a3 configuration:a4 negotiationData:0 delegate:a5 queue:a6];
}

- (void)addParticipant:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v17[0] = a3;
    -[AVCSession addParticipants:](self, "addParticipants:", [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1]);
  }
  else if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCSession addParticipant:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v4 = (__CFString *)[(AVCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v4 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v7 = 136316162;
        uint64_t v8 = v5;
        __int16 v9 = 2080;
        long long v10 = "-[AVCSession addParticipant:]";
        __int16 v11 = 1024;
        int v12 = 416;
        __int16 v13 = 2112;
        uint64_t v14 = v4;
        __int16 v15 = 2048;
        long long v16 = self;
        _os_log_error_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to add nil participant", (uint8_t *)&v7, 0x30u);
      }
    }
  }
}

- (void)addParticipants:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__AVCSession_addParticipants___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(stateQueue, block);
}

void __30__AVCSession_addParticipants___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(__CFString **)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        uint64_t v41 = v3;
        __int16 v42 = 2080;
        __int16 v43 = "-[AVCSession addParticipants:]_block_invoke";
        __int16 v44 = 1024;
        int v45 = 442;
        __int16 v46 = 2112;
        uint64_t v47 = v5;
        uint64_t v6 = " [%s] %s:%d participants[%@]";
        int v7 = v4;
        uint32_t v8 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      id v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      long long v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v12 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        uint64_t v41 = v9;
        __int16 v42 = 2080;
        __int16 v43 = "-[AVCSession addParticipants:]_block_invoke";
        __int16 v44 = 1024;
        int v45 = 442;
        __int16 v46 = 2112;
        uint64_t v47 = v2;
        __int16 v48 = 2048;
        uint64_t v49 = v11;
        __int16 v50 = 2112;
        uint64_t v51 = v12;
        uint64_t v6 = " [%s] %s:%d %@(%p) participants[%@]";
        int v7 = v10;
        uint32_t v8 = 58;
        goto LABEL_11;
      }
    }
  }
  __int16 v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v14 = *(void **)(a1 + 40);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v35 count:16];
  unint64_t v17 = 0x1E4F1C000uLL;
  if (v15)
  {
    uint64_t v18 = v15;
    uint64_t v19 = &dword_1E1EA4000;
    uint64_t v32 = *(void *)v37;
    *(void *)&long long v16 = 136316162;
    long long v30 = v16;
    do
    {
      uint64_t v20 = 0;
      uint64_t v31 = v18;
      do
      {
        if (*(void *)v37 != v32) {
          objc_enumerationMutation(v14);
        }
        int v21 = *(void **)(*((void *)&v36 + 1) + 8 * v20);
        MEMORY[0x1E4E57AC0](v19, "@:@ AVCSession-addParticipants");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v22 = VRTraceErrorLogLevelToCSTR();
          int v23 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v24 = v19;
            unint64_t v25 = v17;
            unsigned int v26 = v14;
            uint64_t v27 = v13;
            id v28 = *(__CFString **)(a1 + 32);
            uint64_t v29 = [v21 description];
            *(_DWORD *)buf = v30;
            uint64_t v41 = v22;
            __int16 v42 = 2080;
            __int16 v43 = "-[AVCSession addParticipants:]_block_invoke";
            __int16 v44 = 1024;
            int v45 = 446;
            __int16 v46 = 2048;
            uint64_t v47 = v28;
            __int16 v13 = v27;
            uint64_t v14 = v26;
            unint64_t v17 = v25;
            uint64_t v19 = v24;
            uint64_t v18 = v31;
            __int16 v48 = 2112;
            uint64_t v49 = v29;
            _os_log_impl(v19, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-addParticipants (%p) %@", buf, 0x30u);
          }
        }
        objc_msgSend(v21, "setStateQueue:", *(void *)(*(void *)(a1 + 32) + 72), v30);
        if ([*(id *)(a1 + 32) validateParticipantToAdd:v21])
        {
          objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v21, objc_msgSend(v21, "uuid"));
          objc_msgSend(v13, "addObject:", objc_msgSend(*(id *)(v17 + 2536), "dictionaryWithDictionary:", objc_msgSend(v21, "config")));
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v14 countByEnumeratingWithState:&v36 objects:v35 count:16];
    }
    while (v18);
  }
  if ([v13 count])
  {
    v33 = @"vcSessionParticipantConfigs";
    uint32_t v34 = v13;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "sendMessageAsync:arguments:", "vcSessionAddParticipants", objc_msgSend(*(id *)(v17 + 2536), "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
  }
}

- (BOOL)validateParticipantToAdd:(id)a3
{
  void block[7] = *MEMORY[0x1E4F143B8];
  if (!-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteParticipants, "objectForKeyedSubscript:", [a3 uuid])&& !-[NSMutableDictionary objectForKeyedSubscript:](self->_participantsToAdd, "objectForKeyedSubscript:", objc_msgSend(a3, "uuid")))
  {
    return 1;
  }
  BOOL v5 = 1;
  id v6 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 1, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/AVCSession.m", 476), 0);
  if (v6)
  {
    delegateNotificationQueue = self->_delegateNotificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__AVCSession_validateParticipantToAdd___block_invoke;
    block[3] = &unk_1E6DB43D8;
    block[4] = self;
    void block[5] = a3;
    void block[6] = v6;
    dispatch_async(delegateNotificationQueue, block);
    return 0;
  }
  return v5;
}

uint64_t __39__AVCSession_validateParticipantToAdd___block_invoke(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);

  return [v2 session:v3 addParticipant:v4 didSucceed:0 error:v5];
}

- (BOOL)validateParticipantToRemove:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_remoteParticipants, "objectForKeyedSubscript:", [a3 uuid]);
  if (!v5)
  {
    delegateNotificationQueue = self->_delegateNotificationQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__AVCSession_validateParticipantToRemove___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = self;
    void block[5] = a3;
    dispatch_async(delegateNotificationQueue, block);
  }
  return v5 != 0;
}

uint64_t __42__AVCSession_validateParticipantToRemove___block_invoke(uint64_t a1)
{
  id v2 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 3, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/AVCSession.m", 491), 0);
  uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  return [v3 session:v4 removeParticipant:v5 didSucceed:0 error:v2];
}

- (void)removeParticipant:(id)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = a3;
  -[AVCSession removeParticipants:](self, "removeParticipants:", [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1]);
}

- (void)removeParticipants:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__AVCSession_removeParticipants___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(stateQueue, block);
}

void __33__AVCSession_removeParticipants___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(__CFString **)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        uint64_t v36 = v3;
        __int16 v37 = 2080;
        long long v38 = "-[AVCSession removeParticipants:]_block_invoke";
        __int16 v39 = 1024;
        int v40 = 505;
        __int16 v41 = 2112;
        __int16 v42 = v5;
        id v6 = " [%s] %s:%d participantIDs[%@]";
        int v7 = v4;
        uint32_t v8 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      id v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      long long v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v12 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        uint64_t v36 = v9;
        __int16 v37 = 2080;
        long long v38 = "-[AVCSession removeParticipants:]_block_invoke";
        __int16 v39 = 1024;
        int v40 = 505;
        __int16 v41 = 2112;
        __int16 v42 = v2;
        __int16 v43 = 2048;
        uint64_t v44 = v11;
        __int16 v45 = 2112;
        uint64_t v46 = v12;
        id v6 = " [%s] %s:%d %@(%p) participantIDs[%@]";
        int v7 = v10;
        uint32_t v8 = 58;
        goto LABEL_11;
      }
    }
  }
  __int16 v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v14 = *(void **)(a1 + 40);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v30 count:16];
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v27 = *(void *)v32;
    *(void *)&long long v16 = 136316162;
    long long v25 = v16;
    unsigned int v26 = v14;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v32 != v27) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCSession-removeParticipants");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v20 = VRTraceErrorLogLevelToCSTR();
          int v21 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v22 = v13;
            int v23 = *(__CFString **)(a1 + 32);
            uint64_t v24 = [v19 description];
            *(_DWORD *)buf = v25;
            uint64_t v36 = v20;
            __int16 v37 = 2080;
            long long v38 = "-[AVCSession removeParticipants:]_block_invoke";
            __int16 v39 = 1024;
            int v40 = 510;
            __int16 v41 = 2048;
            __int16 v42 = v23;
            __int16 v13 = v22;
            uint64_t v14 = v26;
            __int16 v43 = 2112;
            uint64_t v44 = v24;
            _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-removeParticipants (%p) %@", buf, 0x30u);
          }
        }
        if (objc_msgSend(*(id *)(a1 + 32), "validateParticipantToRemove:", v19, v25, v26))
        {
          objc_msgSend(v13, "addObject:", objc_msgSend(v19, "uuid"));
          [v19 setStateQueue:0];
        }
      }
      uint64_t v17 = [v14 countByEnumeratingWithState:&v31 objects:v30 count:16];
    }
    while (v17);
  }
  if ([v13 count])
  {
    id v28 = @"vcSessionParticipantIDs";
    uint64_t v29 = v13;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "sendMessageAsync:arguments:", "vcSessionRemoveParticipants", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
  }
}

- (void)start
{
  v3[5] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __19__AVCSession_start__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

void __19__AVCSession_start__block_invoke(uint64_t a1)
{
  v33[1] = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() != *(void *)(a1 + 32))
  {
    if (objc_opt_respondsToSelector()) {
      id v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      id v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_12;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)uint64_t v19 = 136316162;
    *(void *)&v19[4] = v8;
    *(_WORD *)&v19[12] = 2080;
    *(void *)&v19[14] = "-[AVCSession start]_block_invoke";
    *(_WORD *)&v19[22] = 1024;
    LODWORD(v20) = 533;
    WORD2(v20) = 2112;
    *(void *)((char *)&v20 + 6) = v2;
    HIWORD(v20) = 2048;
    *(void *)int v21 = v10;
    uint64_t v5 = " [%s] %s:%d %@(%p) ";
    id v6 = v9;
    uint32_t v7 = 48;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v19 = 136315650;
      *(void *)&v19[4] = v3;
      *(_WORD *)&v19[12] = 2080;
      *(void *)&v19[14] = "-[AVCSession start]_block_invoke";
      *(_WORD *)&v19[22] = 1024;
      LODWORD(v20) = 533;
      uint64_t v5 = " [%s] %s:%d ";
      id v6 = v4;
      uint32_t v7 = 28;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v5, v19, v7);
    }
  }
LABEL_12:
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setSharedXPCConnection:", *(void *)(*(void *)(a1 + 32) + 80), *(_OWORD *)v19, *(void *)&v19[16], v20, *(void *)v21);
  long long v32 = @"vcSessionLocalParticipantConfig";
  v33[0] = [*(id *)(*(void *)(a1 + 32) + 24) config];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "sendMessageAsync:arguments:", "vcSessionStart", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1));
  int v11 = [*(id *)(*(void *)(a1 + 32) + 24) dispatchedMediaStateForMediaType:0];
  int v12 = [*(id *)(*(void *)(a1 + 32) + 24) dispatchedMediaStateForMediaType:1];
  int v13 = [*(id *)(*(void *)(a1 + 32) + 24) dispatchedMediaStateForMediaType:2];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCSession-start");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = [*(id *)(v16 + 24) isAudioMuted];
      uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 32);
      *(_DWORD *)uint64_t v19 = 136317698;
      *(void *)&v19[4] = v14;
      *(_WORD *)&v19[12] = 2080;
      *(void *)&v19[14] = "-[AVCSession start]_block_invoke";
      *(_WORD *)&v19[22] = 1024;
      LODWORD(v20) = 540;
      WORD2(v20) = 2048;
      *(void *)((char *)&v20 + 6) = v16;
      HIWORD(v20) = 1024;
      *(_DWORD *)int v21 = v11 != 0;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = v11 == 2;
      __int16 v22 = 1024;
      int v23 = v17;
      __int16 v24 = 1024;
      BOOL v25 = v12 != 0;
      __int16 v26 = 1024;
      BOOL v27 = v12 == 2;
      __int16 v28 = 1024;
      BOOL v29 = v13 != 0;
      __int16 v30 = 2112;
      uint64_t v31 = v18;
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-start (%p) audioEnabled=%d, audioPaused=%d, audioMuted=%d, videoEnabled=%d, videoPaused=%d, screenEnabled=%d, configuration=%@", v19, 0x54u);
    }
  }
}

- (void)stop
{
}

- (void)stopWithError:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__AVCSession_stopWithError___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(stateQueue, block);
}

void __28__AVCSession_stopWithError___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_12;
    }
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    uint64_t v5 = *(__CFString **)(a1 + 40);
    *(_DWORD *)buf = 136315906;
    uint64_t v24 = v3;
    __int16 v25 = 2080;
    __int16 v26 = "-[AVCSession stopWithError:]_block_invoke";
    __int16 v27 = 1024;
    int v28 = 550;
    __int16 v29 = 2112;
    __int16 v30 = v5;
    id v6 = " [%s] %s:%d stopError:%@";
    uint32_t v7 = v4;
    uint32_t v8 = 38;
    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector()) {
    id v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
  }
  else {
    id v2 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136316418;
      uint64_t v24 = v9;
      __int16 v25 = 2080;
      __int16 v26 = "-[AVCSession stopWithError:]_block_invoke";
      __int16 v27 = 1024;
      int v28 = 550;
      __int16 v29 = 2112;
      __int16 v30 = v2;
      __int16 v31 = 2048;
      uint64_t v32 = v11;
      __int16 v33 = 2112;
      uint64_t v34 = v12;
      id v6 = " [%s] %s:%d %@(%p) stopError:%@";
      uint32_t v7 = v10;
      uint32_t v8 = 58;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
LABEL_12:
  int v13 = *(void **)(a1 + 40);
  if (v13)
  {
    v21[0] = @"ERROR_DOMAIN";
    v22[0] = [v13 domain];
    v21[1] = @"ERROR_CODE";
    v22[1] = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "code"));
    v21[2] = @"ERROR_USERINFO";
    v22[2] = [*(id *)(a1 + 40) userInfo];
    uint64_t v19 = @"vcSessionError";
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  }
  else
  {
    uint64_t v14 = 0;
  }
  [*(id *)(*(void *)(a1 + 32) + 80) sendMessageAsync:"vcSessionStop" arguments:v14];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCSession-stop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = *(__CFString **)(a1 + 32);
      uint64_t v18 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      uint64_t v24 = v15;
      __int16 v25 = 2080;
      __int16 v26 = "-[AVCSession stopWithError:]_block_invoke";
      __int16 v27 = 1024;
      int v28 = 559;
      __int16 v29 = 2048;
      __int16 v30 = v17;
      __int16 v31 = 2112;
      uint64_t v32 = v18;
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-stop (%p) error=%@", buf, 0x30u);
    }
  }
}

- (void)updateConfiguration:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__AVCSession_updateConfiguration___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a3;
  dispatch_async(stateQueue, block);
}

void __34__AVCSession_updateConfiguration___block_invoke(uint64_t a1)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() != *(void *)(a1 + 32))
  {
    if (objc_opt_respondsToSelector()) {
      id v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      id v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_12;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)uint64_t v16 = 136316162;
    *(void *)&v16[4] = v8;
    *(_WORD *)&v16[12] = 2080;
    *(void *)&v16[14] = "-[AVCSession updateConfiguration:]_block_invoke";
    *(_WORD *)&v16[22] = 1024;
    LODWORD(v17) = 565;
    WORD2(v17) = 2112;
    *(void *)((char *)&v17 + 6) = v2;
    HIWORD(v17) = 2048;
    uint64_t v18 = v10;
    uint64_t v5 = " [%s] %s:%d %@(%p) ";
    id v6 = v9;
    uint32_t v7 = 48;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v16 = 136315650;
      *(void *)&v16[4] = v3;
      *(_WORD *)&v16[12] = 2080;
      *(void *)&v16[14] = "-[AVCSession updateConfiguration:]_block_invoke";
      *(_WORD *)&v16[22] = 1024;
      LODWORD(v17) = 565;
      uint64_t v5 = " [%s] %s:%d ";
      id v6 = v4;
      uint32_t v7 = 28;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, v5, v16, v7);
    }
  }
LABEL_12:
  int v21 = @"vcSessionConfiguration";
  v22[0] = objc_msgSend(*(id *)(a1 + 40), "dictionary", *(_OWORD *)v16, *(void *)&v16[16], v17, v18);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "sendMessageAsync:arguments:", "vcSessionUpdateConfiguration", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1));
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCSession-updateConfiguration");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = *(void *)(v13 + 32);
      *(_DWORD *)uint64_t v16 = 136316418;
      *(void *)&v16[4] = v11;
      *(_WORD *)&v16[12] = 2080;
      *(void *)&v16[14] = "-[AVCSession updateConfiguration:]_block_invoke";
      *(_WORD *)&v16[22] = 1024;
      LODWORD(v17) = 569;
      WORD2(v17) = 2048;
      *(void *)((char *)&v17 + 6) = v13;
      HIWORD(v17) = 2112;
      uint64_t v18 = v15;
      __int16 v19 = 2112;
      uint64_t v20 = v14;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-updateConfiguration (%p) currentConfiguration=%@, newConfiguration=%@", v16, 0x3Au);
    }
  }
}

- (void)beginParticipantConfiguration
{
  v3[5] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __43__AVCSession_beginParticipantConfiguration__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

void __43__AVCSession_beginParticipantConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 120);
        *(_DWORD *)buf = 136315906;
        uint64_t v25 = v3;
        __int16 v26 = 2080;
        __int16 v27 = "-[AVCSession beginParticipantConfiguration]_block_invoke";
        __int16 v28 = 1024;
        int v29 = 575;
        __int16 v30 = 1024;
        LODWORD(v31) = v5;
        id v6 = " [%s] %s:%d _activeConfigurationCount=%d";
        uint32_t v7 = v4;
        uint32_t v8 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      id v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        int v12 = *(_DWORD *)(v11 + 120);
        *(_DWORD *)buf = 136316418;
        uint64_t v25 = v9;
        __int16 v26 = 2080;
        __int16 v27 = "-[AVCSession beginParticipantConfiguration]_block_invoke";
        __int16 v28 = 1024;
        int v29 = 575;
        __int16 v30 = 2112;
        __int16 v31 = v2;
        __int16 v32 = 2048;
        uint64_t v33 = v11;
        __int16 v34 = 1024;
        int v35 = v12;
        id v6 = " [%s] %s:%d %@(%p) _activeConfigurationCount=%d";
        uint32_t v7 = v10;
        uint32_t v8 = 54;
        goto LABEL_11;
      }
    }
  }
  uint64_t v13 = *(void *)(a1 + 32);
  if (!*(_DWORD *)(v13 + 120))
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v14 = (void *)[*(id *)(v13 + 8) allValues];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v19 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * i) setConfigurationInProgress:1];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v19 count:16];
      }
      while (v16);
    }
  }
  ++*(_DWORD *)(*(void *)(a1 + 32) + 120);
}

- (void)appendConfigurationToXPCArguments:(id)a3
{
  if ([(VCSessionPresentationInfo *)self->_presentationInfo hasPendingChanges])
  {
    id v5 = [(VCSessionPresentationInfo *)self->_presentationInfo serialize];
    if (v5)
    {
      [a3 setObject:v5 forKeyedSubscript:@"vcSessionPresentationInfo"];
    }
  }
}

- (void)endParticipantConfiguration
{
  v3[5] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __41__AVCSession_endParticipantConfiguration__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

void __41__AVCSession_endParticipantConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = *(_DWORD *)(*(void *)(a1 + 32) + 120);
        *(_DWORD *)buf = 136315906;
        uint64_t v30 = v3;
        __int16 v31 = 2080;
        __int16 v32 = "-[AVCSession endParticipantConfiguration]_block_invoke";
        __int16 v33 = 1024;
        int v34 = 598;
        __int16 v35 = 1024;
        LODWORD(v36) = v5;
        id v6 = " [%s] %s:%d _activeConfigurationCount=%d";
        uint32_t v7 = v4;
        uint32_t v8 = 34;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      id v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      id v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        int v12 = *(_DWORD *)(v11 + 120);
        *(_DWORD *)buf = 136316418;
        uint64_t v30 = v9;
        __int16 v31 = 2080;
        __int16 v32 = "-[AVCSession endParticipantConfiguration]_block_invoke";
        __int16 v33 = 1024;
        int v34 = 598;
        __int16 v35 = 2112;
        uint64_t v36 = v2;
        __int16 v37 = 2048;
        uint64_t v38 = v11;
        __int16 v39 = 1024;
        int v40 = v12;
        id v6 = " [%s] %s:%d %@(%p) _activeConfigurationCount=%d";
        uint32_t v7 = v10;
        uint32_t v8 = 54;
        goto LABEL_11;
      }
    }
  }
  uint64_t v13 = *(void *)(a1 + 32);
  int v14 = *(_DWORD *)(v13 + 120);
  BOOL v15 = __OFSUB__(v14, 1);
  int v16 = v14 - 1;
  if (v16 < 0 == v15)
  {
    *(_DWORD *)(v13 + 120) = v16;
    if (!v16)
    {
      [*(id *)(a1 + 32) validateParticipantConfiguration];
      uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "count"));
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v18 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) allValues];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v24 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v26 != v21) {
              objc_enumerationMutation(v18);
            }
            [*(id *)(*((void *)&v25 + 1) + 8 * i) appendConfigurationToXPCConfiguration:v17];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v24 count:16];
        }
        while (v20);
      }
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if ([v17 count]) {
        [v23 setObject:v17 forKeyedSubscript:@"vcSessionParameterParticipantConfiguration"];
      }

      [*(id *)(a1 + 32) appendConfigurationToXPCArguments:v23];
      if ([v23 count]) {
        [*(id *)(*(void *)(a1 + 32) + 80) sendMessageAsync:"vcSessionUpdateParticipantConfiguration" arguments:v23];
      }
    }
  }
}

- (void)validateParticipantConfiguration
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Multiple participants are configured with the same prominence indices", v2, v3, v4, v5, v6);
}

+ (id)configurationWithSessionMode:(int64_t)a3
{
  if (a3 == 2) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2 * (a3 == 0);
  }
  return +[VCSessionMediaStreamPresenceConfigurationProvider publicSessionConfigurationForType:v3];
}

- (void)didAddParticipantHandlerWithResult:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  int v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcSessionSucceeded"), "BOOLValue");
  uint64_t v6 = [a3 objectForKeyedSubscript:@"vcSessionParticipantID"];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v30 = v8;
        __int16 v31 = 2080;
        __int16 v32 = "-[AVCSession didAddParticipantHandlerWithResult:]";
        __int16 v33 = 1024;
        int v34 = 662;
        __int16 v35 = 1024;
        *(_DWORD *)uint64_t v36 = v5;
        *(_WORD *)&v36[4] = 2112;
        *(void *)&v36[6] = v6;
        uint64_t v10 = " [%s] %s:%d received callback for addParticipantDidSucceed %d, participantID %@";
        uint64_t v11 = v9;
        uint32_t v12 = 44;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint32_t v7 = (__CFString *)[(AVCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint32_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      int v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v30 = v13;
        __int16 v31 = 2080;
        __int16 v32 = "-[AVCSession didAddParticipantHandlerWithResult:]";
        __int16 v33 = 1024;
        int v34 = 662;
        __int16 v35 = 2112;
        *(void *)uint64_t v36 = v7;
        *(_WORD *)&v36[8] = 2048;
        *(void *)&v36[10] = self;
        __int16 v37 = 1024;
        int v38 = v5;
        __int16 v39 = 2112;
        uint64_t v40 = v6;
        uint64_t v10 = " [%s] %s:%d %@(%p) received callback for addParticipantDidSucceed %d, participantID %@";
        uint64_t v11 = v14;
        uint32_t v12 = 64;
        goto LABEL_11;
      }
    }
  }
  if (!v6)
  {
    char v23 = 0;
    int v16 = 0;
    uint64_t v21 = 32016;
    long long v22 = @"ParticipantID is nil";
    if (v5) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  id v15 = (id)[(NSMutableDictionary *)self->_participantsToAdd objectForKeyedSubscript:v6];
  int v16 = v15;
  if (v5)
  {
    if (v15)
    {
      id v17 = -[AVConferenceXPCClient newNSDictionaryFromNSDictionary:](self->_connection, "newNSDictionaryFromNSDictionary:", [a3 objectForKeyedSubscript:@"vcSessionParameterStreamTokens"]);
      if (v17)
      {
        uint64_t v18 = v17;
        id v19 = -[AVConferenceXPCClient newNSDictionaryFromNSDictionary:](self->_connection, "newNSDictionaryFromNSDictionary:", [a3 objectForKeyedSubscript:@"vcSessionSpatialSourceIDs"]);
        if (v19)
        {
          id v20 = v19;
          [(NSMutableDictionary *)self->_remoteParticipants setObject:v16 forKeyedSubscript:v6];
          [v16 setSharedXPCConnection:self->_connection];
          [v16 setStreamTokens:v18];
          objc_msgSend(v16, "setVideoToken:", objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1F3DC69F0), "unsignedIntValue"));
          objc_msgSend(v16, "setScreenToken:", objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1F3DC6A08), "unsignedIntValue"));
          [v16 setMediaTypeToSpatialSourceIDMap:v20];
          uint64_t v21 = 0;
          long long v22 = 0;
          char v23 = 1;
          goto LABEL_18;
        }
        char v23 = 0;
        long long v22 = @"Spatial source ID map is nil";
      }
      else
      {
        char v23 = 0;
        long long v22 = @"streamTokens is nil";
      }
      uint64_t v21 = 32016;
    }
    else
    {
      char v23 = 0;
      long long v22 = @"Participant is nil";
      uint64_t v21 = 32026;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCSession didAddParticipantHandlerWithResult:]();
      }
    }
    uint64_t v21 = 0;
    long long v22 = 0;
    char v23 = 0;
  }
LABEL_18:
  [(NSMutableDictionary *)self->_participantsToAdd setObject:0 forKeyedSubscript:v6];
  if (v5)
  {
LABEL_19:
    id v24 = 0;
    goto LABEL_22;
  }
LABEL_21:
  id v24 = -[AVCSession newNSErrorWithErrorDictionary:](self, "newNSErrorWithErrorDictionary:", [a3 objectForKeyedSubscript:@"vcSessionError"]);
LABEL_22:
  if (v24) {
    char v25 = 1;
  }
  else {
    char v25 = v23;
  }
  if ((v25 & 1) == 0)
  {
    id v24 = (id)[MEMORY[0x1E4F28C58] AVConferenceServiceError:v21 detailCode:0 description:v22];
    LOBYTE(v5) = 0;
  }
  delegateNotificationQueue = self->_delegateNotificationQueue;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __49__AVCSession_didAddParticipantHandlerWithResult___block_invoke;
  v27[3] = &unk_1E6DB5238;
  v27[4] = self;
  v27[5] = v16;
  char v28 = v5;
  v27[6] = v24;
  dispatch_async(delegateNotificationQueue, v27);
}

uint64_t __49__AVCSession_didAddParticipantHandlerWithResult___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCSession-didAddParticipant");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = [*(id *)(a1 + 40) uuid];
      int v6 = *(unsigned __int8 *)(a1 + 56);
      uint64_t v7 = *(void *)(a1 + 48);
      int v9 = 136316674;
      uint64_t v10 = v2;
      __int16 v11 = 2080;
      uint32_t v12 = "-[AVCSession didAddParticipantHandlerWithResult:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 693;
      __int16 v15 = 2048;
      uint64_t v16 = v4;
      __int16 v17 = 2112;
      uint64_t v18 = v5;
      __int16 v19 = 1024;
      int v20 = v6;
      __int16 v21 = 2112;
      uint64_t v22 = v7;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-didAddParticipant (%p) uuid=%@, didSucceed=%d, error=%@", (uint8_t *)&v9, 0x40u);
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:addParticipant:didSucceed:error:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 48));
}

- (id)newNSErrorWithErrorDictionary:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v5 = [a3 objectForKeyedSubscript:@"ERROR_DOMAIN"];
  uint64_t v6 = (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"ERROR_CODE"), "intValue");
  uint64_t v7 = [a3 objectForKeyedSubscript:@"ERROR_USERINFO"];

  return (id)[v4 initWithDomain:v5 code:v6 userInfo:v7];
}

- (void)registerBlocksForNotifications
{
  void v14[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke;
  v14[3] = &unk_1E6DB4338;
  v14[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcSessionDidStart" block:v14 queue:self->_stateQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_148;
  v13[3] = &unk_1E6DB4338;
  v13[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcSessionDidStop" block:v13 queue:self->_stateQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_158;
  v12[3] = &unk_1E6DB4338;
  v12[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcSessionServerDidDisconnect" block:v12 queue:self->_stateQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_161;
  v11[3] = &unk_1E6DB4338;
  v11[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcSessionAddParticipantDidSuceed" block:v11 queue:self->_stateQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_2;
  v10[3] = &unk_1E6DB4338;
  v10[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcSessionRemoveParticipantDidSucceed" block:v10 queue:self->_stateQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_165;
  v9[3] = &unk_1E6DB4338;
  v9[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcSessionDidUpdateConfiguration" block:v9 queue:self->_stateQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_168;
  v8[3] = &unk_1E6DB4338;
  v8[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcSessionDidDetectError" block:v8 queue:self->_stateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_2_171;
  _OWORD v7[3] = &unk_1E6DB4338;
  v7[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcSessionUplinkRateAdaptationInfoDidChange" block:v7 queue:self->_stateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_2_179;
  v6[3] = &unk_1E6DB4338;
  v6[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcSessionDownlinkRateAdaptationInfoDidChange" block:v6 queue:self->_stateQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_2_184;
  v5[3] = &unk_1E6DB4338;
  v5[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcSessionShouldReconnect" block:v5 queue:self->_stateQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_189;
  v4[3] = &unk_1E6DB4338;
  v4[4] = v3;
  [(AVConferenceXPCClient *)self->_connection registerBlockForService:"vcSessionSetOneToOneEnabledDidChange" block:v4 queue:self->_stateQueue];
}

void __44__AVCSession_registerBlocksForNotifications__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      if (objc_opt_class() == v5)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_15;
        }
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        int v9 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136315650;
        uint64_t v20 = v8;
        __int16 v21 = 2080;
        uint64_t v22 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
        __int16 v23 = 1024;
        int v24 = 719;
        uint64_t v10 = " [%s] %s:%d received callback for didStart";
        __int16 v11 = v9;
        uint32_t v12 = 28;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v7 = (__CFString *)[v6 performSelector:sel_logPrefix];
        }
        else {
          uint64_t v7 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_15;
        }
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        int v14 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v20 = v13;
        __int16 v21 = 2080;
        uint64_t v22 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
        __int16 v23 = 1024;
        int v24 = 719;
        __int16 v25 = 2112;
        long long v26 = v7;
        __int16 v27 = 2048;
        char v28 = v6;
        uint64_t v10 = " [%s] %s:%d %@(%p) received callback for didStart";
        __int16 v11 = v14;
        uint32_t v12 = 48;
      }
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_15:
      uint64_t v15 = [a2 objectForKeyedSubscript:@"vcSessionStarted"];
      uint64_t v16 = objc_msgSend(v6, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionError"));
      __int16 v17 = [v6 delegateNotificationQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_145;
      block[3] = &unk_1E6DB43D8;
      block[4] = v6;
      void block[5] = v15;
      void block[6] = v16;
      dispatch_async(v17, block);
    }
  }
}

uint64_t __44__AVCSession_registerBlocksForNotifications__block_invoke_145(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCSession-didStart");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = [*(id *)(a1 + 40) intValue];
      uint64_t v6 = *(void *)(a1 + 48);
      int v8 = 136316418;
      uint64_t v9 = v2;
      __int16 v10 = 2080;
      __int16 v11 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 724;
      __int16 v14 = 2048;
      uint64_t v15 = v4;
      __int16 v16 = 1024;
      int v17 = v5;
      __int16 v18 = 2112;
      uint64_t v19 = v6;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-didStart (%p) didSucceed=%d, error=%@", (uint8_t *)&v8, 0x36u);
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:didStart:error:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "BOOLValue"), *(void *)(a1 + 48));
}

void __44__AVCSession_registerBlocksForNotifications__block_invoke_148(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      if (objc_opt_class() == v5)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_15;
        }
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136315650;
        uint64_t v19 = v8;
        __int16 v20 = 2080;
        __int16 v21 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
        __int16 v22 = 1024;
        int v23 = 740;
        __int16 v10 = " [%s] %s:%d received callback for didStop";
        __int16 v11 = v9;
        uint32_t v12 = 28;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v7 = (__CFString *)[v6 performSelector:sel_logPrefix];
        }
        else {
          uint64_t v7 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_15;
        }
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        __int16 v14 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v19 = v13;
        __int16 v20 = 2080;
        __int16 v21 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
        __int16 v22 = 1024;
        int v23 = 740;
        __int16 v24 = 2112;
        __int16 v25 = v7;
        __int16 v26 = 2048;
        __int16 v27 = v6;
        __int16 v10 = " [%s] %s:%d %@(%p) received callback for didStop";
        __int16 v11 = v14;
        uint32_t v12 = 48;
      }
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_15:
      uint64_t v15 = objc_msgSend(v6, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionError"));
      __int16 v16 = [v6 delegateNotificationQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_149;
      block[3] = &unk_1E6DB43D8;
      block[4] = v6;
      void block[5] = v15;
      void block[6] = a2;
      dispatch_async(v16, block);
    }
  }
}

uint64_t __44__AVCSession_registerBlocksForNotifications__block_invoke_149(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCSession-didStop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      int v9 = 136316162;
      uint64_t v10 = v2;
      __int16 v11 = 2080;
      uint32_t v12 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 744;
      __int16 v15 = 2048;
      uint64_t v16 = v4;
      __int16 v17 = 2112;
      uint64_t v18 = v5;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-didStop (%p) error=%@", (uint8_t *)&v9, 0x30u);
    }
  }
  uint64_t v6 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"vcSessionDidStopMetadata"];
  if (v6)
  {
    uint64_t v7 = v6;
    [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector()) {
      return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:didStopWithError:metadata:", *(void *)(a1 + 32), *(void *)(a1 + 40), v7);
    }
  }
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result) {
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:didStopWithError:", *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  return result;
}

void __44__AVCSession_registerBlocksForNotifications__block_invoke_158(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"SERVERDIED"]) {
    return;
  }
  uint64_t v3 = [*(id *)(a1 + 32) strong];
  if (!v3) {
    return;
  }
  uint64_t v4 = (void *)v3;
  if (objc_opt_class() == v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_14;
    }
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v26 = v6;
    __int16 v27 = 2080;
    uint64_t v28 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
    __int16 v29 = 1024;
    int v30 = 765;
    uint64_t v8 = " [%s] %s:%d received callback for serverDidDisconnect";
    int v9 = v7;
    uint32_t v10 = 28;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[v4 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_14;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint32_t v12 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v26 = v11;
    __int16 v27 = 2080;
    uint64_t v28 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
    __int16 v29 = 1024;
    int v30 = 765;
    __int16 v31 = 2112;
    __int16 v32 = v5;
    __int16 v33 = 2048;
    int v34 = v4;
    uint64_t v8 = " [%s] %s:%d %@(%p) received callback for serverDidDisconnect";
    int v9 = v12;
    uint32_t v10 = 48;
  }
  _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_14:
  objc_msgSend((id)objc_msgSend(v4, "localParticipant"), "setSharedXPCConnection:", 0);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  __int16 v13 = (void *)[v4 remoteParticipantsMap];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v20 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "remoteParticipantsMap"), "objectForKeyedSubscript:", *(void *)(*((void *)&v21 + 1) + 8 * i)), "setSharedXPCConnection:", 0);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v20 count:16];
    }
    while (v15);
  }
  uint64_t v18 = [v4 delegateNotificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_159;
  block[3] = &unk_1E6DB3DC8;
  block[4] = v4;
  dispatch_async(v18, block);
}

uint64_t __44__AVCSession_registerBlocksForNotifications__block_invoke_159(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCSession-serverDidDisconnect");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 136315906;
      uint64_t v7 = v2;
      __int16 v8 = 2080;
      int v9 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 773;
      __int16 v12 = 2048;
      uint64_t v13 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-serverDidDisconnect (%p)", (uint8_t *)&v6, 0x26u);
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "sessionServerDidDisconnect:", *(void *)(a1 + 32));
}

id *__44__AVCSession_registerBlocksForNotifications__block_invoke_161(id *result, void *a2, uint64_t a3)
{
  if (!a3)
  {
    uint64_t v4 = result;
    uint64_t result = (id *)[a2 objectForKeyedSubscript:@"SERVERDIED"];
    if (!result)
    {
      uint64_t result = (id *)[v4[4] strong];
      if (result)
      {
        return (id *)[result didAddParticipantHandlerWithResult:a2];
      }
    }
  }
  return result;
}

void __44__AVCSession_registerBlocksForNotifications__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a3) {
    return;
  }
  if ([a2 objectForKeyedSubscript:@"SERVERDIED"]) {
    return;
  }
  uint64_t v5 = [*(id *)(a1 + 32) strong];
  if (!v5) {
    return;
  }
  int v6 = (void *)v5;
  if (objc_opt_class() != v5)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[v6 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_15;
    }
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint64_t v14 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v22 = v13;
    __int16 v23 = 2080;
    long long v24 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
    __int16 v25 = 1024;
    int v26 = 799;
    __int16 v27 = 2112;
    uint64_t v28 = v7;
    __int16 v29 = 2048;
    int v30 = v6;
    __int16 v10 = " [%s] %s:%d %@(%p) received callback for removeParticipantDidSucceed";
    int v11 = v14;
    uint32_t v12 = 48;
    goto LABEL_14;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    int v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = v8;
      __int16 v23 = 2080;
      long long v24 = "-[AVCSession registerBlocksForNotifications]_block_invoke_2";
      __int16 v25 = 1024;
      int v26 = 799;
      __int16 v10 = " [%s] %s:%d received callback for removeParticipantDidSucceed";
      int v11 = v9;
      uint32_t v12 = 28;
LABEL_14:
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    }
  }
LABEL_15:
  uint64_t v15 = [a2 objectForKeyedSubscript:@"vcSessionSucceeded"];
  uint64_t v16 = [a2 objectForKeyedSubscript:@"vcSessionParticipantID"];
  id v17 = (id)objc_msgSend((id)objc_msgSend(v6, "remoteParticipantsMap"), "objectForKeyedSubscript:", v16);
  [v17 setSharedXPCConnection:0];
  if (v15) {
    objc_msgSend((id)objc_msgSend(v6, "remoteParticipantsMap"), "setObject:forKeyedSubscript:", 0, v16);
  }
  uint64_t v18 = objc_msgSend(v6, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionError"));
  uint64_t v19 = [v6 delegateNotificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_163;
  block[3] = &unk_1E6DB6768;
  block[4] = v6;
  void block[5] = v17;
  void block[6] = v15;
  void block[7] = v18;
  void block[8] = 0;
  dispatch_async(v19, block);
}

void __44__AVCSession_registerBlocksForNotifications__block_invoke_163(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCSession-didRemoveParticipant");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = [*(id *)(a1 + 40) uuid];
      int v6 = [*(id *)(a1 + 48) intValue];
      uint64_t v7 = *(void *)(a1 + 56);
      int v8 = 136316674;
      uint64_t v9 = v2;
      __int16 v10 = 2080;
      int v11 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 811;
      __int16 v14 = 2048;
      uint64_t v15 = v4;
      __int16 v16 = 2112;
      uint64_t v17 = v5;
      __int16 v18 = 1024;
      int v19 = v6;
      __int16 v20 = 2112;
      uint64_t v21 = v7;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-didRemoveParticipant (%p) uuid=%@, didSucceed=%d, error=%@", (uint8_t *)&v8, 0x40u);
    }
  }
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:removeParticipant:didSucceed:error:", *(void *)(a1 + 32), *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "BOOLValue"), *(void *)(a1 + 64));
}

void __44__AVCSession_registerBlocksForNotifications__block_invoke_165(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a3) {
    return;
  }
  if ([a2 objectForKeyedSubscript:@"SERVERDIED"]) {
    return;
  }
  uint64_t v5 = [*(id *)(a1 + 32) strong];
  if (!v5) {
    return;
  }
  int v6 = (void *)v5;
  int v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionSucceeded"), "BOOLValue");
  if (objc_opt_class() == v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_15;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    __int16 v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v23 = v9;
    __int16 v24 = 2080;
    __int16 v25 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
    __int16 v26 = 1024;
    int v27 = 829;
    __int16 v28 = 2112;
    uint64_t v29 = [v6 uuid];
    __int16 v30 = 1024;
    LODWORD(v31) = v7;
    int v11 = " [%s] %s:%d Session[%@] received callback for didUpdateConfig didSucceed=%{BOOL}d";
    __int16 v12 = v10;
    uint32_t v13 = 44;
    goto LABEL_14;
  }
  if (objc_opt_respondsToSelector()) {
    int v8 = (__CFString *)[v6 performSelector:sel_logPrefix];
  }
  else {
    int v8 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316674;
      uint64_t v23 = v14;
      __int16 v24 = 2080;
      __int16 v25 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
      __int16 v26 = 1024;
      int v27 = 829;
      __int16 v28 = 2112;
      uint64_t v29 = (uint64_t)v8;
      __int16 v30 = 2048;
      uint64_t v31 = v6;
      __int16 v32 = 2112;
      uint64_t v33 = [v6 uuid];
      __int16 v34 = 1024;
      int v35 = v7;
      int v11 = " [%s] %s:%d %@(%p) Session[%@] received callback for didUpdateConfig didSucceed=%{BOOL}d";
      __int16 v12 = v15;
      uint32_t v13 = 64;
LABEL_14:
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    }
  }
LABEL_15:
  if (v7)
  {
    uint64_t v16 = [a2 objectForKeyedSubscript:@"vcSessionConfiguration"];
    if (v16)
    {
      uint64_t v17 = v16;
      __int16 v18 = (void *)[v6 dispatchedConfiguration];
      [v18 setUpWithDictionary:v17];
      [v6 setConfiguration:v18];
    }
  }
  int v19 = [v6 delegateNotificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_166;
  block[3] = &unk_1E6DB3E18;
  char v21 = v7;
  block[4] = v6;
  void block[5] = 0;
  dispatch_async(v19, block);
}

uint64_t __44__AVCSession_registerBlocksForNotifications__block_invoke_166(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) configuration];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVCSession-didUpdateConfiguration");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(unsigned __int8 *)(a1 + 48);
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      int v9 = 136316674;
      uint64_t v10 = v3;
      __int16 v11 = 2080;
      __int16 v12 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 841;
      __int16 v15 = 2048;
      uint64_t v16 = v6;
      __int16 v17 = 2112;
      uint64_t v18 = v2;
      __int16 v19 = 1024;
      int v20 = v5;
      __int16 v21 = 2112;
      uint64_t v22 = v7;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ AVCSession-didUpdateConfiguration (%p) configuration=%@, didSucceed=%{BOOL}d, error=%@", (uint8_t *)&v9, 0x40u);
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:didUpdate:configuration:error:", *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), v2, *(void *)(a1 + 40));
}

void __44__AVCSession_registerBlocksForNotifications__block_invoke_168(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    int v5 = (void *)[*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = (__CFString *)objc_msgSend(v5, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionError"));
      if (objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_15;
        }
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v19 = v9;
        __int16 v20 = 2080;
        __int16 v21 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
        __int16 v22 = 1024;
        int v23 = 856;
        __int16 v24 = 2112;
        __int16 v25 = v7;
        __int16 v11 = " [%s] %s:%d received callback for didDetectError:%@";
        __int16 v12 = v10;
        uint32_t v13 = 38;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          int v8 = (__CFString *)[v6 performSelector:sel_logPrefix];
        }
        else {
          int v8 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_15;
        }
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        __int16 v15 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v19 = v14;
        __int16 v20 = 2080;
        __int16 v21 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
        __int16 v22 = 1024;
        int v23 = 856;
        __int16 v24 = 2112;
        __int16 v25 = v8;
        __int16 v26 = 2048;
        int v27 = v6;
        __int16 v28 = 2112;
        uint64_t v29 = v7;
        __int16 v11 = " [%s] %s:%d %@(%p) received callback for didDetectError:%@";
        __int16 v12 = v15;
        uint32_t v13 = 58;
      }
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_15:
      uint64_t v16 = [v6 delegateNotificationQueue];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      void v17[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_169;
      v17[3] = &unk_1E6DB3E40;
      v17[4] = v6;
      v17[5] = 0;
      dispatch_async(v16, v17);
    }
  }
}

uint64_t __44__AVCSession_registerBlocksForNotifications__block_invoke_169(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 session:v3 didDetectError:v4];
}

void __44__AVCSession_registerBlocksForNotifications__block_invoke_2_171(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = [a2 objectForKeyedSubscript:@"vcSessionParameterRateAdaptationInfo"];
      if (objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_15;
        }
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v19 = v9;
        __int16 v20 = 2080;
        __int16 v21 = "-[AVCSession registerBlocksForNotifications]_block_invoke_2";
        __int16 v22 = 1024;
        int v23 = 872;
        __int16 v24 = 2112;
        uint64_t v25 = v7;
        __int16 v11 = " [%s] %s:%d received callback for didChangeUplinkRateAdaptationInfo:%@";
        __int16 v12 = v10;
        uint32_t v13 = 38;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          int v8 = (__CFString *)[v6 performSelector:sel_logPrefix];
        }
        else {
          int v8 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_15;
        }
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        __int16 v15 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v19 = v14;
        __int16 v20 = 2080;
        __int16 v21 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
        __int16 v22 = 1024;
        int v23 = 872;
        __int16 v24 = 2112;
        uint64_t v25 = (uint64_t)v8;
        __int16 v26 = 2048;
        int v27 = v6;
        __int16 v28 = 2112;
        uint64_t v29 = v7;
        __int16 v11 = " [%s] %s:%d %@(%p) received callback for didChangeUplinkRateAdaptationInfo:%@";
        __int16 v12 = v15;
        uint32_t v13 = 58;
      }
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_15:
      uint64_t v16 = [v6 delegateNotificationQueue];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      void v17[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_175;
      v17[3] = &unk_1E6DB3E40;
      v17[4] = v6;
      v17[5] = v7;
      dispatch_async(v16, v17);
    }
  }
}

uint64_t __44__AVCSession_registerBlocksForNotifications__block_invoke_175(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v3 session:v4 uplinkRateAdaptationInfoDidChange:v5];
  }
  return result;
}

void __44__AVCSession_registerBlocksForNotifications__block_invoke_2_179(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v5 = [*(id *)(a1 + 32) strong];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = [a2 objectForKeyedSubscript:@"vcSessionParameterRateAdaptationInfo"];
      if (objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_15;
        }
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v19 = v9;
        __int16 v20 = 2080;
        __int16 v21 = "-[AVCSession registerBlocksForNotifications]_block_invoke_2";
        __int16 v22 = 1024;
        int v23 = 889;
        __int16 v24 = 2112;
        uint64_t v25 = v7;
        __int16 v11 = " [%s] %s:%d received callback for didChangeDownlinkRateAdaptationInfo:%@";
        __int16 v12 = v10;
        uint32_t v13 = 38;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          int v8 = (__CFString *)[v6 performSelector:sel_logPrefix];
        }
        else {
          int v8 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_15;
        }
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        __int16 v15 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v19 = v14;
        __int16 v20 = 2080;
        __int16 v21 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
        __int16 v22 = 1024;
        int v23 = 889;
        __int16 v24 = 2112;
        uint64_t v25 = (uint64_t)v8;
        __int16 v26 = 2048;
        int v27 = v6;
        __int16 v28 = 2112;
        uint64_t v29 = v7;
        __int16 v11 = " [%s] %s:%d %@(%p) received callback for didChangeDownlinkRateAdaptationInfo:%@";
        __int16 v12 = v15;
        uint32_t v13 = 58;
      }
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_15:
      uint64_t v16 = [v6 delegateNotificationQueue];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      void v17[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_180;
      v17[3] = &unk_1E6DB3E40;
      v17[4] = v6;
      v17[5] = v7;
      dispatch_async(v16, v17);
    }
  }
}

uint64_t __44__AVCSession_registerBlocksForNotifications__block_invoke_180(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v3 session:v4 downlinkRateAdaptationInfoDidChange:v5];
  }
  return result;
}

void __44__AVCSession_registerBlocksForNotifications__block_invoke_2_184(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![a2 objectForKeyedSubscript:@"SERVERDIED"])
  {
    uint64_t v4 = [*(id *)(a1 + 32) strong];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      if (objc_opt_class() == v4)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_15;
        }
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        int v8 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136315650;
        uint64_t v17 = v7;
        __int16 v18 = 2080;
        uint64_t v19 = "-[AVCSession registerBlocksForNotifications]_block_invoke_2";
        __int16 v20 = 1024;
        int v21 = 905;
        uint64_t v9 = " [%s] %s:%d received callback for shouldReconnect";
        uint64_t v10 = v8;
        uint32_t v11 = 28;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v6 = (__CFString *)[v5 performSelector:sel_logPrefix];
        }
        else {
          uint64_t v6 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_15;
        }
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        uint32_t v13 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v17 = v12;
        __int16 v18 = 2080;
        uint64_t v19 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
        __int16 v20 = 1024;
        int v21 = 905;
        __int16 v22 = 2112;
        int v23 = v6;
        __int16 v24 = 2048;
        uint64_t v25 = v5;
        uint64_t v9 = " [%s] %s:%d %@(%p) received callback for shouldReconnect";
        uint64_t v10 = v13;
        uint32_t v11 = 48;
      }
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_15:
      uint64_t v14 = [v5 delegateNotificationQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_185;
      block[3] = &unk_1E6DB3DC8;
      block[4] = v5;
      dispatch_async(v14, block);
    }
  }
}

uint64_t __44__AVCSession_registerBlocksForNotifications__block_invoke_185(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v12, *(void *)&v12[16], v13, v14), "sessionShouldReconnect:", *(void *)(a1 + 32));
      }
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v12, *(void *)&v12[16], v13, v14), "sessionShouldReconnect:", *(void *)(a1 + 32));
      }
      *(_DWORD *)uint64_t v12 = 136315650;
      *(void *)&v12[4] = v4;
      *(_WORD *)&v12[12] = 2080;
      *(void *)&v12[14] = "-[AVCSession registerBlocksForNotifications]_block_invoke";
      *(_WORD *)&v12[22] = 1024;
      LODWORD(v13) = 908;
      uint64_t v6 = " [%s] %s:%d Calling sessionShouldReconnect on the delegate";
      uint64_t v7 = v5;
      uint32_t v8 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v3 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v12, *(void *)&v12[16], v13, v14), "sessionShouldReconnect:", *(void *)(a1 + 32));
      }
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v12, *(void *)&v12[16], v13, v14), "sessionShouldReconnect:", *(void *)(a1 + 32));
      }
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)uint64_t v12 = 136316162;
      *(void *)&v12[4] = v9;
      *(_WORD *)&v12[12] = 2080;
      *(void *)&v12[14] = "-[AVCSession registerBlocksForNotifications]_block_invoke";
      *(_WORD *)&v12[22] = 1024;
      LODWORD(v13) = 908;
      WORD2(v13) = 2112;
      *(void *)((char *)&v13 + 6) = v3;
      HIWORD(v13) = 2048;
      uint64_t v14 = v11;
      uint64_t v6 = " [%s] %s:%d %@(%p) Calling sessionShouldReconnect on the delegate";
      uint64_t v7 = v10;
      uint32_t v8 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v12, v8);
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate", *(_OWORD *)v12, *(void *)&v12[16], v13, v14), "sessionShouldReconnect:", *(void *)(a1 + 32));
  }
  return result;
}

void __44__AVCSession_registerBlocksForNotifications__block_invoke_189(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a3) {
    return;
  }
  if ([a2 objectForKeyedSubscript:@"SERVERDIED"]) {
    return;
  }
  uint64_t v5 = [*(id *)(a1 + 32) strong];
  if (!v5) {
    return;
  }
  uint64_t v6 = (void *)v5;
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionOneOnOneModeEnabled"), "BOOLValue");
  int v8 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionSucceeded"), "BOOLValue");
  if (objc_opt_class() != v6)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v9 = (__CFString *)[v6 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_15;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136316930;
    uint64_t v23 = v15;
    __int16 v24 = 2080;
    uint64_t v25 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
    __int16 v26 = 1024;
    int v27 = 925;
    __int16 v28 = 2112;
    uint64_t v29 = (uint64_t)v9;
    __int16 v30 = 2048;
    *(void *)uint64_t v31 = v6;
    *(_WORD *)&v31[8] = 2112;
    uint64_t v32 = [v6 uuid];
    __int16 v33 = 1024;
    int v34 = v7;
    __int16 v35 = 1024;
    int v36 = v8;
    uint64_t v12 = " [%s] %s:%d %@(%p) Session[%@] received callback for oneToOneModeEnabled[%d] did succeed[%d]";
    long long v13 = v16;
    uint32_t v14 = 70;
    goto LABEL_14;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v23 = v10;
      __int16 v24 = 2080;
      uint64_t v25 = "-[AVCSession registerBlocksForNotifications]_block_invoke";
      __int16 v26 = 1024;
      int v27 = 925;
      __int16 v28 = 2112;
      uint64_t v29 = [v6 uuid];
      __int16 v30 = 1024;
      *(_DWORD *)uint64_t v31 = v7;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = v8;
      uint64_t v12 = " [%s] %s:%d Session[%@] received callback for oneToOneModeEnabled[%d] did succeed[%d]";
      long long v13 = v11;
      uint32_t v14 = 50;
LABEL_14:
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }
  }
LABEL_15:
  if (v8) {
    [v6 updateOneToOneModeEnabled:v7];
  }
  uint64_t v17 = objc_msgSend(v6, "newNSErrorWithErrorDictionary:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcSessionError"));
  __int16 v18 = [v6 delegateNotificationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__AVCSession_registerBlocksForNotifications__block_invoke_190;
  block[3] = &unk_1E6DB66B8;
  char v20 = v7;
  char v21 = v8;
  block[4] = v6;
  void block[5] = v17;
  dispatch_async(v18, block);
}

uint64_t __44__AVCSession_registerBlocksForNotifications__block_invoke_190(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 49);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    return [v3 session:v6 oneToOneEnabled:v4 didSucceed:v5 error:v7];
  }
  return result;
}

- (void)deregisterFromNotifications
{
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcSessionDidStart"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcSessionDidStop"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcSessionServerDidDisconnect"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcSessionAddParticipantDidSuceed"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcSessionRemoveParticipantDidSucceed"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcSessionDidUpdateConfiguration"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcSessionDidDetectError"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcSessionUplinkRateAdaptationInfoDidChange"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcSessionDownlinkRateAdaptationInfoDidChange"];
  [(AVConferenceXPCClient *)self->_connection deregisterFromService:"vcSessionShouldReconnect"];
  connection = self->_connection;

  [(AVConferenceXPCClient *)connection deregisterFromService:"vcSessionSetOneToOneEnabledDidChange"];
}

- (void)setupNotificationQueue:(id)a3
{
  if (a3)
  {
    self->_delegateNotificationQueue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
  }
  else
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    self->_delegateNotificationQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AVCSession.notificationQueue", 0, CustomRootQueue);
  }
}

- (void)participant:(id)a3 frequencyLevelsDidChange:(id)a4
{
  void block[6] = *MEMORY[0x1E4F143B8];
  delegateNotificationQueue = self->_delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__AVCSession_participant_frequencyLevelsDidChange___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a4;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __51__AVCSession_participant_frequencyLevelsDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v3 session:v4 frequencyLevelsDidChange:v5];
  }
  return result;
}

- (void)participant:(id)a3 audioEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uuid = self->_uuid;
        *(_DWORD *)buf = 136316418;
        uint64_t v25 = v11;
        __int16 v26 = 2080;
        int v27 = "-[AVCSession participant:audioEnabled:didSucceed:error:]";
        __int16 v28 = 1024;
        int v29 = 977;
        __int16 v30 = 2112;
        uint64_t v31 = (__CFString *)uuid;
        __int16 v32 = 1024;
        *(_DWORD *)__int16 v33 = v8;
        *(_WORD *)&v33[4] = 1024;
        *(_DWORD *)&v33[6] = v7;
        uint32_t v14 = " [%s] %s:%d AVCSession[%@] received callback for audio enabled[%d] did succeed[%d]";
        uint64_t v15 = v12;
        uint32_t v16 = 50;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v10 = (__CFString *)[(AVCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      __int16 v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = self->_uuid;
        *(_DWORD *)buf = 136316930;
        uint64_t v25 = v17;
        __int16 v26 = 2080;
        int v27 = "-[AVCSession participant:audioEnabled:didSucceed:error:]";
        __int16 v28 = 1024;
        int v29 = 977;
        __int16 v30 = 2112;
        uint64_t v31 = v10;
        __int16 v32 = 2048;
        *(void *)__int16 v33 = self;
        *(_WORD *)&v33[8] = 2112;
        int v34 = v19;
        __int16 v35 = 1024;
        BOOL v36 = v8;
        __int16 v37 = 1024;
        BOOL v38 = v7;
        uint32_t v14 = " [%s] %s:%d %@(%p) AVCSession[%@] received callback for audio enabled[%d] did succeed[%d]";
        uint64_t v15 = v18;
        uint32_t v16 = 70;
        goto LABEL_11;
      }
    }
  }
  delegateNotificationQueue = self->_delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__AVCSession_participant_audioEnabled_didSucceed_error___block_invoke;
  block[3] = &unk_1E6DB66B8;
  BOOL v22 = v8;
  BOOL v23 = v7;
  block[4] = self;
  void block[5] = a6;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __56__AVCSession_participant_audioEnabled_didSucceed_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 49);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    return [v3 session:v6 audioEnabled:v4 didSucceed:v5 error:v7];
  }
  return result;
}

- (void)participant:(id)a3 videoEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uuid = self->_uuid;
        *(_DWORD *)buf = 136316418;
        uint64_t v25 = v11;
        __int16 v26 = 2080;
        int v27 = "-[AVCSession participant:videoEnabled:didSucceed:error:]";
        __int16 v28 = 1024;
        int v29 = 986;
        __int16 v30 = 2112;
        uint64_t v31 = (__CFString *)uuid;
        __int16 v32 = 1024;
        *(_DWORD *)__int16 v33 = v8;
        *(_WORD *)&v33[4] = 1024;
        *(_DWORD *)&v33[6] = v7;
        uint32_t v14 = " [%s] %s:%d AVCSession[%@] received callback for video enabled[%d] did succeed[%d]";
        uint64_t v15 = v12;
        uint32_t v16 = 50;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v10 = (__CFString *)[(AVCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      __int16 v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = self->_uuid;
        *(_DWORD *)buf = 136316930;
        uint64_t v25 = v17;
        __int16 v26 = 2080;
        int v27 = "-[AVCSession participant:videoEnabled:didSucceed:error:]";
        __int16 v28 = 1024;
        int v29 = 986;
        __int16 v30 = 2112;
        uint64_t v31 = v10;
        __int16 v32 = 2048;
        *(void *)__int16 v33 = self;
        *(_WORD *)&v33[8] = 2112;
        int v34 = v19;
        __int16 v35 = 1024;
        BOOL v36 = v8;
        __int16 v37 = 1024;
        BOOL v38 = v7;
        uint32_t v14 = " [%s] %s:%d %@(%p) AVCSession[%@] received callback for video enabled[%d] did succeed[%d]";
        uint64_t v15 = v18;
        uint32_t v16 = 70;
        goto LABEL_11;
      }
    }
  }
  delegateNotificationQueue = self->_delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__AVCSession_participant_videoEnabled_didSucceed_error___block_invoke;
  block[3] = &unk_1E6DB66B8;
  BOOL v22 = v8;
  BOOL v23 = v7;
  block[4] = self;
  void block[5] = a6;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __56__AVCSession_participant_videoEnabled_didSucceed_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 49);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    return [v3 session:v6 videoEnabled:v4 didSucceed:v5 error:v7];
  }
  return result;
}

- (void)participant:(id)a3 screenEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uuid = self->_uuid;
        *(_DWORD *)buf = 136316418;
        uint64_t v25 = v11;
        __int16 v26 = 2080;
        int v27 = "-[AVCSession participant:screenEnabled:didSucceed:error:]";
        __int16 v28 = 1024;
        int v29 = 995;
        __int16 v30 = 2112;
        uint64_t v31 = (__CFString *)uuid;
        __int16 v32 = 1024;
        *(_DWORD *)__int16 v33 = v8;
        *(_WORD *)&v33[4] = 1024;
        *(_DWORD *)&v33[6] = v7;
        uint32_t v14 = " [%s] %s:%d AVCSession[%@] received callback for screen enabled[%d] did succeed[%d]";
        uint64_t v15 = v12;
        uint32_t v16 = 50;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v10 = (__CFString *)[(AVCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      __int16 v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = self->_uuid;
        *(_DWORD *)buf = 136316930;
        uint64_t v25 = v17;
        __int16 v26 = 2080;
        int v27 = "-[AVCSession participant:screenEnabled:didSucceed:error:]";
        __int16 v28 = 1024;
        int v29 = 995;
        __int16 v30 = 2112;
        uint64_t v31 = v10;
        __int16 v32 = 2048;
        *(void *)__int16 v33 = self;
        *(_WORD *)&v33[8] = 2112;
        int v34 = v19;
        __int16 v35 = 1024;
        BOOL v36 = v8;
        __int16 v37 = 1024;
        BOOL v38 = v7;
        uint32_t v14 = " [%s] %s:%d %@(%p) AVCSession[%@] received callback for screen enabled[%d] did succeed[%d]";
        uint64_t v15 = v18;
        uint32_t v16 = 70;
        goto LABEL_11;
      }
    }
  }
  delegateNotificationQueue = self->_delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__AVCSession_participant_screenEnabled_didSucceed_error___block_invoke;
  block[3] = &unk_1E6DB66B8;
  BOOL v22 = v8;
  BOOL v23 = v7;
  block[4] = self;
  void block[5] = a6;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __57__AVCSession_participant_screenEnabled_didSucceed_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 49);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    return [v3 session:v6 screenEnabled:v4 didSucceed:v5 error:v7];
  }
  return result;
}

- (void)participant:(id)a3 audioPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uuid = self->_uuid;
        *(_DWORD *)buf = 136316418;
        uint64_t v25 = v11;
        __int16 v26 = 2080;
        int v27 = "-[AVCSession participant:audioPaused:didSucceed:error:]";
        __int16 v28 = 1024;
        int v29 = 1004;
        __int16 v30 = 2112;
        uint64_t v31 = (__CFString *)uuid;
        __int16 v32 = 1024;
        *(_DWORD *)__int16 v33 = v8;
        *(_WORD *)&v33[4] = 1024;
        *(_DWORD *)&v33[6] = v7;
        uint32_t v14 = " [%s] %s:%d AVCSession[%@] received callback for audio paused[%d] did succeed[%d]";
        uint64_t v15 = v12;
        uint32_t v16 = 50;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v10 = (__CFString *)[(AVCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      __int16 v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = self->_uuid;
        *(_DWORD *)buf = 136316930;
        uint64_t v25 = v17;
        __int16 v26 = 2080;
        int v27 = "-[AVCSession participant:audioPaused:didSucceed:error:]";
        __int16 v28 = 1024;
        int v29 = 1004;
        __int16 v30 = 2112;
        uint64_t v31 = v10;
        __int16 v32 = 2048;
        *(void *)__int16 v33 = self;
        *(_WORD *)&v33[8] = 2112;
        int v34 = v19;
        __int16 v35 = 1024;
        BOOL v36 = v8;
        __int16 v37 = 1024;
        BOOL v38 = v7;
        uint32_t v14 = " [%s] %s:%d %@(%p) AVCSession[%@] received callback for audio paused[%d] did succeed[%d]";
        uint64_t v15 = v18;
        uint32_t v16 = 70;
        goto LABEL_11;
      }
    }
  }
  delegateNotificationQueue = self->_delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__AVCSession_participant_audioPaused_didSucceed_error___block_invoke;
  block[3] = &unk_1E6DB66B8;
  BOOL v22 = v8;
  BOOL v23 = v7;
  block[4] = self;
  void block[5] = a6;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __55__AVCSession_participant_audioPaused_didSucceed_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 49);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    return [v3 session:v6 audioPaused:v4 didSucceed:v5 error:v7];
  }
  return result;
}

- (void)participant:(id)a3 videoPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uuid = self->_uuid;
        *(_DWORD *)buf = 136316418;
        uint64_t v25 = v11;
        __int16 v26 = 2080;
        int v27 = "-[AVCSession participant:videoPaused:didSucceed:error:]";
        __int16 v28 = 1024;
        int v29 = 1013;
        __int16 v30 = 2112;
        uint64_t v31 = (__CFString *)uuid;
        __int16 v32 = 1024;
        *(_DWORD *)__int16 v33 = v8;
        *(_WORD *)&v33[4] = 1024;
        *(_DWORD *)&v33[6] = v7;
        uint32_t v14 = " [%s] %s:%d AVCSession[%@] received callback for video paused[%d] did succeed[%d]";
        uint64_t v15 = v12;
        uint32_t v16 = 50;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v10 = (__CFString *)[(AVCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      __int16 v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = self->_uuid;
        *(_DWORD *)buf = 136316930;
        uint64_t v25 = v17;
        __int16 v26 = 2080;
        int v27 = "-[AVCSession participant:videoPaused:didSucceed:error:]";
        __int16 v28 = 1024;
        int v29 = 1013;
        __int16 v30 = 2112;
        uint64_t v31 = v10;
        __int16 v32 = 2048;
        *(void *)__int16 v33 = self;
        *(_WORD *)&v33[8] = 2112;
        int v34 = v19;
        __int16 v35 = 1024;
        BOOL v36 = v8;
        __int16 v37 = 1024;
        BOOL v38 = v7;
        uint32_t v14 = " [%s] %s:%d %@(%p) AVCSession[%@] received callback for video paused[%d] did succeed[%d]";
        uint64_t v15 = v18;
        uint32_t v16 = 70;
        goto LABEL_11;
      }
    }
  }
  delegateNotificationQueue = self->_delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__AVCSession_participant_videoPaused_didSucceed_error___block_invoke;
  block[3] = &unk_1E6DB66B8;
  BOOL v22 = v8;
  BOOL v23 = v7;
  block[4] = self;
  void block[5] = a6;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __55__AVCSession_participant_videoPaused_didSucceed_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 49);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    return [v3 session:v6 videoPaused:v4 didSucceed:v5 error:v7];
  }
  return result;
}

- (void)participant:(id)a3 mediaStateDidChange:(unsigned int)a4 forMediaType:(unsigned int)a5 didSucceed:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint32_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uuid = self->_uuid;
        uint64_t v16 = VCSessionMediaType_FromAVCSessionMediaType(v9);
        uint64_t v17 = VCSessionMediaType_Name(v16);
        uint64_t v18 = VCSessionMediaState_FromAVCSessionMediaState(v10);
        *(_DWORD *)buf = 136316674;
        uint64_t v34 = v13;
        __int16 v35 = 2080;
        BOOL v36 = "-[AVCSession participant:mediaStateDidChange:forMediaType:didSucceed:error:]";
        __int16 v37 = 1024;
        int v38 = 1022;
        __int16 v39 = 2112;
        uint64_t v40 = (__CFString *)uuid;
        __int16 v41 = 2112;
        __int16 v42 = (AVCSession *)v17;
        __int16 v43 = 2112;
        uint64_t v44 = VCSessionMediaState_Name(v18);
        __int16 v45 = 1024;
        LODWORD(v46) = v8;
        uint64_t v19 = " [%s] %s:%d AVCSession=%@ received mediaStateDidChange callback for mediaType=%@ mediaState=%@ did succeed[%d]";
        char v20 = v14;
        uint32_t v21 = 64;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v12 = (__CFString *)[(AVCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v12 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      BOOL v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        __int16 v24 = self->_uuid;
        uint64_t v25 = VCSessionMediaType_FromAVCSessionMediaType(v9);
        __int16 v26 = VCSessionMediaType_Name(v25);
        uint64_t v27 = VCSessionMediaState_FromAVCSessionMediaState(v10);
        *(_DWORD *)buf = 136317186;
        uint64_t v34 = v22;
        __int16 v35 = 2080;
        BOOL v36 = "-[AVCSession participant:mediaStateDidChange:forMediaType:didSucceed:error:]";
        __int16 v37 = 1024;
        int v38 = 1022;
        __int16 v39 = 2112;
        uint64_t v40 = v12;
        __int16 v41 = 2048;
        __int16 v42 = self;
        __int16 v43 = 2112;
        uint64_t v44 = (__CFString *)v24;
        __int16 v45 = 2112;
        uint64_t v46 = v26;
        __int16 v47 = 2112;
        __int16 v48 = VCSessionMediaState_Name(v27);
        __int16 v49 = 1024;
        BOOL v50 = v8;
        uint64_t v19 = " [%s] %s:%d %@(%p) AVCSession=%@ received mediaStateDidChange callback for mediaType=%@ mediaState=%@ did succeed[%d]";
        char v20 = v23;
        uint32_t v21 = 84;
        goto LABEL_11;
      }
    }
  }
  delegateNotificationQueue = self->_delegateNotificationQueue;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __76__AVCSession_participant_mediaStateDidChange_forMediaType_didSucceed_error___block_invoke;
  v29[3] = &unk_1E6DB7490;
  int v30 = v10;
  int v31 = v9;
  BOOL v32 = v8;
  v29[4] = self;
  void v29[5] = a7;
  dispatch_async(delegateNotificationQueue, v29);
}

uint64_t __76__AVCSession_participant_mediaStateDidChange_forMediaType_didSucceed_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v4 = *(unsigned int *)(a1 + 48);
    uint64_t v5 = *(unsigned int *)(a1 + 52);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    return [v2 session:v7 mediaStateDidChange:v4 forMediaType:v5 didSucceed:v6 error:v8];
  }
  return result;
}

- (void)participant:(id)a3 mediaPrioritiesDidChange:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ((AVCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uuid = self->_uuid;
        *(_DWORD *)buf = 136315906;
        uint64_t v19 = v7;
        __int16 v20 = 2080;
        uint32_t v21 = "-[AVCSession participant:mediaPrioritiesDidChange:]";
        __int16 v22 = 1024;
        int v23 = 1032;
        __int16 v24 = 2112;
        uint64_t v25 = (__CFString *)uuid;
        uint64_t v10 = " [%s] %s:%d AVCSession[%@] received callback.";
        uint64_t v11 = v8;
        uint32_t v12 = 38;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[(AVCSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint32_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = self->_uuid;
        *(_DWORD *)buf = 136316418;
        uint64_t v19 = v13;
        __int16 v20 = 2080;
        uint32_t v21 = "-[AVCSession participant:mediaPrioritiesDidChange:]";
        __int16 v22 = 1024;
        int v23 = 1032;
        __int16 v24 = 2112;
        uint64_t v25 = v6;
        __int16 v26 = 2048;
        uint64_t v27 = self;
        __int16 v28 = 2112;
        int v29 = v15;
        uint64_t v10 = " [%s] %s:%d %@(%p) AVCSession[%@] received callback.";
        uint64_t v11 = v14;
        uint32_t v12 = 58;
        goto LABEL_11;
      }
    }
  }
  delegateNotificationQueue = self->_delegateNotificationQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __51__AVCSession_participant_mediaPrioritiesDidChange___block_invoke;
  v17[3] = &unk_1E6DB3E40;
  v17[4] = self;
  v17[5] = a4;
  dispatch_async(delegateNotificationQueue, v17);
}

uint64_t __51__AVCSession_participant_mediaPrioritiesDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v3 session:v4 mediaPrioritiesDidChange:v5];
  }
  return result;
}

- (void)participant:(id)a3 mixingDidStartForMediaType:(unsigned int)a4 mixingMediaType:(unsigned int)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  delegateNotificationQueue = self->_delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__AVCSession_participant_mixingDidStartForMediaType_mixingMediaType___block_invoke;
  block[3] = &unk_1E6DB4568;
  block[4] = self;
  unsigned int v7 = a4;
  unsigned int v8 = a5;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __69__AVCSession_participant_mixingDidStartForMediaType_mixingMediaType___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(unsigned int *)(a1 + 40);
    uint64_t v6 = *(unsigned int *)(a1 + 44);
    return [v3 session:v4 mixingDidStartForMediaType:v5 mixingMediaType:v6];
  }
  return result;
}

- (void)participant:(id)a3 mixingDidStopForMediaType:(unsigned int)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  delegateNotificationQueue = self->_delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AVCSession_participant_mixingDidStopForMediaType___block_invoke;
  block[3] = &unk_1E6DB3F08;
  block[4] = self;
  unsigned int v6 = a4;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __52__AVCSession_participant_mixingDidStopForMediaType___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(unsigned int *)(a1 + 40);
    return [v3 session:v4 mixingDidStopForMediaType:v5];
  }
  return result;
}

- (void)participant:(id)a3 didReact:(id)a4
{
  void block[6] = *MEMORY[0x1E4F143B8];
  delegateNotificationQueue = self->_delegateNotificationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__AVCSession_participant_didReact___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  void block[5] = a4;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __35__AVCSession_participant_didReact___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v3 session:v4 didReact:v5];
  }
  return result;
}

- (void)participantDidStopReacting:(id)a3
{
  void v4[5] = *MEMORY[0x1E4F143B8];
  delegateNotificationQueue = self->_delegateNotificationQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__AVCSession_participantDidStopReacting___block_invoke;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = self;
  dispatch_async(delegateNotificationQueue, v4);
}

uint64_t __41__AVCSession_participantDidStopReacting___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    return [v3 sessionDidStopReacting:v4];
  }
  return result;
}

- (void)setConfiguration:(id)a3
{
}

- (OS_dispatch_queue)delegateNotificationQueue
{
  return self->_delegateNotificationQueue;
}

- (NSMutableDictionary)remoteParticipantsMap
{
  return self->_remoteParticipants;
}

- (NSData)frequencyLevels
{
  return self->_frequencyLevels;
}

- (NSMutableDictionary)participantsToAdd
{
  return self->_participantsToAdd;
}

- (AVCSessionParticipant)localParticipant
{
  return self->_localParticipant;
}

- (VCXPCClientShared)xpcConnection
{
  return self->_connection;
}

- (int64_t)sessionToken
{
  return self->_sessionToken;
}

- (NSDictionary)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (void)negotiationDataForProtocolVersion:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[AVCSession negotiationDataForProtocolVersion:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unknown protocol version=%d", v2, *(const char **)v3, (unint64_t)"-[AVCSession negotiationDataForProtocolVersion:]" >> 16, 218);
}

- (void)setPresentationInfo:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid display width=%f", v2, v3, v4, v5);
}

- (void)setPresentationInfo:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid display height=%f", v2, v3, v4, v5);
}

- (void)setPresentationInfo:.cold.3()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid state=%u", v2, v3, v4, 296);
}

- (void)setPresentationInfo:.cold.4()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid layout=%u", v2, v3, v4, 293);
}

- (void)initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Transport token is nil", v2, v3, v4, v5, v6);
}

- (void)initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to retrieve stream token mapping", v2, v3, v4, v5, v6);
}

- (void)initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d failed transportToken[%@]");
}

- (void)initPrivateWithTransportToken:configuration:negotiationData:delegate:queue:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Non-nil parentNWActivity is unactivated!", v2, v3, v4, v5, v6);
}

- (void)addParticipant:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unable to add nil participant", v2, v3, v4, v5, v6);
}

- (void)didAddParticipantHandlerWithResult:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to add the participant", v2, v3, v4, v5, v6);
}

@end