@interface GKVoiceChatSession
- (BOOL)didReceiveVoiceChatData:(id)a3 fromPeerID:(id)a4;
- (BOOL)getMuteStateForPeer:(id)a3;
- (BOOL)isActiveSession;
- (GKVoiceChatSession)initWithGKSession:(id)a3 sessionName:(id)a4;
- (GKVoiceChatSession)initWithGameStateSession:(id)a3 sessionName:(id)a4;
- (GKVoiceChatSessionDelegate)delegate;
- (NSArray)peerList;
- (NSString)sessionName;
- (float)inputMeter;
- (float)outputMeterForPeer:(id)a3;
- (float)sessionVolume;
- (void)dealloc;
- (void)peer:(id)a3 didChangeState:(unsigned int)a4;
- (void)setActiveSession:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setMute:(BOOL)a3 forPeer:(id)a4;
- (void)setSessionVolume:(float)a3;
- (void)startSession;
- (void)stopSession;
@end

@implementation GKVoiceChatSession

- (GKVoiceChatSession)initWithGKSession:(id)a3 sessionName:(id)a4
{
  uint64_t v6 = [a3 privateImpl];
  return [(GKVoiceChatSession *)self initWithGameStateSession:v6 sessionName:a4];
}

- (GKVoiceChatSession)initWithGameStateSession:(id)a3 sessionName:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)GKVoiceChatSession;
  uint64_t v6 = [(GKVoiceChatSession *)&v22 init];
  if (v6)
  {
    v6->opaqueSession = [[GKVoiceChatSessionInternal alloc] initWithGameStateSession:a3 publicWrapper:v6 sessionName:a4];
    if ((GKVoiceChatSession *)objc_opt_class() == v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          opaqueSession = (__CFString *)v6->opaqueSession;
          v11 = (objc_class *)objc_opt_class();
          Name = class_getName(v11);
          *(_DWORD *)buf = 136316418;
          uint64_t v24 = v8;
          __int16 v25 = 2080;
          v26 = "-[GKVoiceChatSession initWithGameStateSession:sessionName:]";
          __int16 v27 = 1024;
          int v28 = 41;
          __int16 v29 = 2048;
          v30 = opaqueSession;
          __int16 v31 = 2080;
          v32 = (void *)Name;
          __int16 v33 = 2112;
          id v34 = a4;
          v13 = " [%s] %s:%d [%p] GKVoiceChatSession init'd using session=%s with sessionName=%@";
          v14 = v9;
          uint32_t v15 = 58;
LABEL_12:
          _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v7 = (__CFString *)[(GKVoiceChatSession *)v6 performSelector:sel_logPrefix];
      }
      else {
        v7 = &stru_26D39CAC0;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          id v18 = v6->opaqueSession;
          v19 = (objc_class *)objc_opt_class();
          v20 = class_getName(v19);
          *(_DWORD *)buf = 136316930;
          uint64_t v24 = v16;
          __int16 v25 = 2080;
          v26 = "-[GKVoiceChatSession initWithGameStateSession:sessionName:]";
          __int16 v27 = 1024;
          int v28 = 41;
          __int16 v29 = 2112;
          v30 = v7;
          __int16 v31 = 2048;
          v32 = v6;
          __int16 v33 = 2048;
          id v34 = v18;
          __int16 v35 = 2080;
          v36 = v20;
          __int16 v37 = 2112;
          id v38 = a4;
          v13 = " [%s] %s:%d %@(%p) [%p] GKVoiceChatSession init'd using session=%s with sessionName=%@";
          v14 = v17;
          uint32_t v15 = 78;
          goto LABEL_12;
        }
      }
    }
  }
  return v6;
}

- (BOOL)didReceiveVoiceChatData:(id)a3 fromPeerID:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ((GKVoiceChatSession *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      v7 = (__CFString *)[(GKVoiceChatSession *)self performSelector:sel_logPrefix];
    }
    else {
      v7 = &stru_26D39CAC0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_12;
    }
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x263F21098];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)v19 = 136316418;
    *(void *)&v19[4] = v13;
    *(_WORD *)&v19[12] = 2080;
    *(void *)&v19[14] = "-[GKVoiceChatSession didReceiveVoiceChatData:fromPeerID:]";
    *(_WORD *)&v19[22] = 1024;
    LODWORD(v20) = 47;
    WORD2(v20) = 2112;
    *(void *)((char *)&v20 + 6) = v7;
    HIWORD(v20) = 2048;
    v21 = self;
    LOWORD(v22) = 2112;
    *(void *)((char *)&v22 + 2) = a4;
    v10 = " [%s] %s:%d %@(%p) GKVoiceChatSession receive data from peerID=%@";
    v11 = v14;
    uint32_t v12 = 58;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v19 = 136315906;
      *(void *)&v19[4] = v8;
      *(_WORD *)&v19[12] = 2080;
      *(void *)&v19[14] = "-[GKVoiceChatSession didReceiveVoiceChatData:fromPeerID:]";
      *(_WORD *)&v19[22] = 1024;
      LODWORD(v20) = 47;
      WORD2(v20) = 2112;
      *(void *)((char *)&v20 + 6) = a4;
      v10 = " [%s] %s:%d GKVoiceChatSession receive data from peerID=%@";
      v11 = v9;
      uint32_t v12 = 38;
LABEL_11:
      _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, v10, v19, v12);
    }
  }
LABEL_12:
  id v15 = +[GKOOBMessageFactory newMessageFromData:](GKOOBMessageFactory, "newMessageFromData:", a3, *(_OWORD *)v19, *(void *)&v19[16], v20, v21, v22);
  int v16 = [self->opaqueSession conferenceID];
  int v17 = [v15 conferenceID];
  if (v16 == v17) {
    [self->opaqueSession session:0 didReceiveOOBAudioPacket:v15 fromPeerID:a4];
  }

  return v16 == v17;
}

- (void)peer:(id)a3 didChangeState:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ((GKVoiceChatSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v15 = 136316162;
        *(void *)&v15[4] = v8;
        *(_WORD *)&v15[12] = 2080;
        *(void *)&v15[14] = "-[GKVoiceChatSession peer:didChangeState:]";
        *(_WORD *)&v15[22] = 1024;
        *(_DWORD *)int v16 = 59;
        *(_WORD *)&v16[4] = 1024;
        *(_DWORD *)&v16[6] = v4;
        *(_WORD *)&v16[10] = 2112;
        *(void *)&v16[12] = a3;
        v10 = " [%s] %s:%d GKVoiceChatSession connection state=%d change for peerID=%@";
        v11 = v9;
        uint32_t v12 = 44;
LABEL_11:
        _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, v10, v15, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v7 = (__CFString *)[(GKVoiceChatSession *)self performSelector:sel_logPrefix];
    }
    else {
      v7 = &stru_26D39CAC0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v15 = 136316674;
        *(void *)&v15[4] = v13;
        *(_WORD *)&v15[12] = 2080;
        *(void *)&v15[14] = "-[GKVoiceChatSession peer:didChangeState:]";
        *(_WORD *)&v15[22] = 1024;
        *(_DWORD *)int v16 = 59;
        *(_WORD *)&v16[4] = 2112;
        *(void *)&v16[6] = v7;
        *(_WORD *)&v16[14] = 2048;
        *(void *)&v16[16] = self;
        LOWORD(v17) = 1024;
        *(_DWORD *)((char *)&v17 + 2) = v4;
        HIWORD(v17) = 2112;
        id v18 = a3;
        v10 = " [%s] %s:%d %@(%p) GKVoiceChatSession connection state=%d change for peerID=%@";
        v11 = v14;
        uint32_t v12 = 64;
        goto LABEL_11;
      }
    }
  }
  objc_msgSend(self->opaqueSession, "session:peer:didChangeState:", 0, a3, v4, *(_OWORD *)v15, *(void *)&v15[16], *(_OWORD *)v16, *(void *)&v16[16], v17, v18);
}

- (void)dealloc
{
  id opaqueSession = self->opaqueSession;
  [opaqueSession cleanup];

  self->id opaqueSession = 0;
  v4.receiver = self;
  v4.super_class = (Class)GKVoiceChatSession;
  [(GKVoiceChatSession *)&v4 dealloc];
}

- (void)startSession
{
}

- (void)stopSession
{
}

- (void)setMute:(BOOL)a3 forPeer:(id)a4
{
}

- (BOOL)getMuteStateForPeer:(id)a3
{
  return [self->opaqueSession getMuteStateForPeer:a3];
}

- (float)outputMeterForPeer:(id)a3
{
  return 0.0;
}

- (GKVoiceChatSessionDelegate)delegate
{
  return (GKVoiceChatSessionDelegate *)[self->opaqueSession delegate];
}

- (void)setDelegate:(id)a3
{
}

- (NSString)sessionName
{
  return (NSString *)[self->opaqueSession sessionName];
}

- (NSArray)peerList
{
  return (NSArray *)[self->opaqueSession peerList];
}

- (BOOL)isActiveSession
{
  return [self->opaqueSession isActiveSession];
}

- (void)setActiveSession:(BOOL)a3
{
}

- (float)inputMeter
{
  return 0.0;
}

- (float)sessionVolume
{
  [self->opaqueSession sessionVolume];
  return result;
}

- (void)setSessionVolume:(float)a3
{
}

@end