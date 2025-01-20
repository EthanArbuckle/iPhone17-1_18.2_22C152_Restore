@interface GKVoiceChatServicePrivate
+ (id)defaultVoiceChatService;
- (BOOL)acceptCallID:(unsigned int)a3 error:(id *)a4;
- (BOOL)getNSError:(id *)a3 code:(int64_t)a4 description:(id)a5 hResult:(int)a6;
- (BOOL)getNSError:(id *)a3 code:(int64_t)a4 description:(id)a5 reason:(id)a6;
- (BOOL)inviteIsValid:(id)a3;
- (BOOL)isFocus;
- (BOOL)isInputMeteringEnabled;
- (BOOL)isMicrophoneMuted;
- (BOOL)isOutputMeteringEnabled;
- (BOOL)startVoiceChatWithParticipantID:(id)a3 error:(id *)a4;
- (GKVoiceChatService)wrapperService;
- (GKVoiceChatServicePrivate)init;
- (double)localBitrate;
- (double)localFramerate;
- (double)remoteBitrate;
- (double)remoteFramerate;
- (float)inputMeterLevel;
- (float)outputMeterLevel;
- (float)remoteParticipantVolume;
- (id)client;
- (id)createInvite:(id *)a3 toParticipant:(id)a4 callID:(unsigned int *)a5;
- (id)createReplyUsingDictionary:(id)a3 replyCode:(unint64_t)a4 error:(id *)a5;
- (id)localDisplayNameForCallID:(unsigned int)a3;
- (id)remoteDisplayNameForCallID:(unsigned int)a3;
- (int)chatMode;
- (int)startICEConnectionCheck:(id)a3 isCaller:(BOOL)a4;
- (int)startICEConnectionCheck:(id)a3 isCaller:(BOOL)a4 withCallID:(unsigned int)a5;
- (int)state;
- (int64_t)outputAudioPowerSpectrumToken;
- (void)cleanup;
- (void)dealloc;
- (void)denyCallID:(unsigned int)a3;
- (void)forceNoICE:(BOOL)a3;
- (void)informClientOfInviteFromParticipant:(id)incomingCallDict;
- (void)informClientVoiceChatDidNotStart:(id)a3;
- (void)informClientVoiceChatDidNotStartMainSelector:(id)a3;
- (void)informClientVoiceChatDidStart:(id)a3;
- (void)informClientVoiceChatDidStartMainSelector:(id)a3;
- (void)informClientVoiceChatDidStop:(id)a3;
- (void)localVideoLayer;
- (void)receivedData:(id)a3 fromParticipantID:(id)a4;
- (void)remoteVideoLayer;
- (void)resetState;
- (void)setChatMode:(int)a3;
- (void)setClient:(id)a3;
- (void)setFocus:(BOOL)a3;
- (void)setInputMeteringEnabled:(BOOL)a3;
- (void)setLocalVideoLayer:(void *)a3;
- (void)setMicrophoneMuted:(BOOL)a3;
- (void)setOutputMeteringEnabled:(BOOL)a3;
- (void)setRemoteParticipantVolume:(float)a3;
- (void)setRemoteVideoLayer:(void *)a3;
- (void)setState:(int)a3;
- (void)setWrapperService:(id)a3;
- (void)stopVoiceChatProc:(id)a3;
- (void)stopVoiceChatWithParticipantID:(id)a3;
- (void)videoConference:(id)a3 didStartSession:(BOOL)a4 withCallID:(unsigned int)a5 error:(id)a6;
- (void)videoConference:(id)a3 didStopWithCallID:(unsigned int)a4 error:(id)a5;
@end

@implementation GKVoiceChatServicePrivate

- (GKVoiceChatServicePrivate)init
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)GKVoiceChatServicePrivate;
  v2 = [(GKVoiceChatServicePrivate *)&v7 init];
  VRTraceReset();
  VRTracePrintLoggingInfo();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v9 = v3;
      __int16 v10 = 2080;
      v11 = "-[GKVoiceChatServicePrivate init]";
      __int16 v12 = 1024;
      int v13 = 46;
      _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKVoiceChatServicePrivate : !!!!!!!!!!!", buf, 0x1Cu);
    }
  }
  v2->stateLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x263F08AE0]);
  v2->clientLock = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
  v5 = (VideoConference *)[objc_alloc((Class)off_2645B7B38) initWithClientPid:0];
  v2->conf = v5;
  [(VideoConference *)v5 setDelegate:v2];
  [(VideoConference *)v2->conf setPreferredCodec:9];
  [(VideoConference *)v2->conf setIsGKVoiceChat:1];
  [(VideoConference *)v2->conf setIsUsingSuppression:1];
  [(VideoConference *)v2->conf setShouldTimeoutPackets:1];
  v2->chatMode = 2;
  [(VideoConference *)v2->conf setChatMode:2];
  [(VideoConference *)v2->conf setUseCompressedConnectionData:1];
  [(VideoConference *)v2->conf setShouldPrioritizeParticipantIDForSIPInvite:1];
  return v2;
}

+ (id)defaultVoiceChatService
{
  id result = (id)defaultVoiceChatService__GKVoiceChatServicePrivate;
  if (!defaultVoiceChatService__GKVoiceChatServicePrivate)
  {
    uint64_t v3 = objc_opt_class();
    objc_sync_enter(v3);
    if (!defaultVoiceChatService__GKVoiceChatServicePrivate) {
      defaultVoiceChatService__GKVoiceChatServicePrivate = objc_alloc_init(GKVoiceChatServicePrivate);
    }
    objc_sync_exit(v3);
    return (id)defaultVoiceChatService__GKVoiceChatServicePrivate;
  }
  return result;
}

- (void)cleanup
{
  [(NSRecursiveLock *)self->stateLock lock];
  [(VideoConference *)self->conf setDelegate:0];
  stateLock = self->stateLock;
  [(NSRecursiveLock *)stateLock unlock];
}

- (void)dealloc
{
  [(VideoConference *)self->conf cleanupManager];

  self->conf = 0;
  self->stateLock = 0;

  self->clientLock = 0;
  v3.receiver = self;
  v3.super_class = (Class)GKVoiceChatServicePrivate;
  [(GKVoiceChatServicePrivate *)&v3 dealloc];
}

- (BOOL)startVoiceChatWithParticipantID:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        uint64_t v9 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      }
      else {
        uint64_t v9 = "<nil>";
      }
      int v28 = 136315906;
      uint64_t v29 = v7;
      __int16 v30 = 2080;
      v31 = "-[GKVoiceChatServicePrivate startVoiceChatWithParticipantID:error:]";
      __int16 v32 = 1024;
      int v33 = 118;
      __int16 v34 = 2080;
      v35 = v9;
      _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d startVoiceChatWithParticipantID with %s", (uint8_t *)&v28, 0x26u);
    }
  }
  [(NSRecursiveLock *)self->stateLock lock];
  if (!a3)
  {
    __int16 v12 = @"participantID is nil";
    int v13 = @"nil participantID";
    uint64_t v14 = self;
    v15 = a4;
    uint64_t v16 = 32016;
    goto LABEL_15;
  }
  if (!self->client) {
    goto LABEL_13;
  }
  int v10 = [(GKVoiceChatServicePrivate *)self state];
  client = self->client;
  if (v10)
  {
    if (client)
    {
      __int16 v12 = @"Cannot do startVoiceChatWithParticipantID:error:";
      int v13 = @"GKVoiceChatService is not idle.";
      uint64_t v14 = self;
      v15 = a4;
      uint64_t v16 = 32012;
LABEL_15:
      [(GKVoiceChatServicePrivate *)v14 getNSError:v15 code:v16 description:v12 reason:v13];
      BOOL v17 = 0;
      goto LABEL_16;
    }
LABEL_13:
    __int16 v12 = @"Client is not set.";
    int v13 = @"Client is nil.";
LABEL_14:
    uint64_t v14 = self;
    v15 = a4;
    uint64_t v16 = 32006;
    goto LABEL_15;
  }
  if (![(GKVoiceChatClient *)client participantID])
  {
    __int16 v12 = @"Client participantID is not set.";
    int v13 = @"participantID is nil.";
    goto LABEL_14;
  }
  v19 = [(GKVoiceChatServicePrivate *)self createInvite:a4 toParticipant:a3 callID:&self->curCallID];
  self->outgoingCallDict = v19;
  uint64_t v20 = [(GKVoiceChatDictionary *)v19 createBlob];
  BOOL v17 = 0;
  outgoingCallDict = self->outgoingCallDict;
  if (outgoingCallDict)
  {
    uint64_t v22 = v20;
    if (v20)
    {
      v23 = outgoingCallDict;
      [(GKVoiceChatServicePrivate *)self setState:3];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          v26 = self->outgoingCallDict;
          if (v26) {
            v27 = (const char *)objc_msgSend(-[GKVoiceChatDictionary description](v26, "description"), "UTF8String");
          }
          else {
            v27 = "<nil>";
          }
          int v28 = 136315906;
          uint64_t v29 = v24;
          __int16 v30 = 2080;
          v31 = "-[GKVoiceChatServicePrivate startVoiceChatWithParticipantID:error:]";
          __int16 v32 = 1024;
          int v33 = 162;
          __int16 v34 = 2080;
          v35 = v27;
          _os_log_impl(&dword_221563000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d OutgoingcallDict = %s", (uint8_t *)&v28, 0x26u);
        }
      }
      [(GKVoiceChatClient *)self->client voiceChatService:self->wrapperService sendData:v22 toParticipantID:a3];
      BOOL v17 = 1;
    }
  }
LABEL_16:
  [(NSRecursiveLock *)self->stateLock unlock];
  return v17;
}

- (void)stopVoiceChatProc:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v6 = (os_log_t *)MEMORY[0x263F21098];
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        uint64_t v9 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      }
      else {
        uint64_t v9 = "<nil>";
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v22 = v7;
      __int16 v23 = 2080;
      uint64_t v24 = "-[GKVoiceChatServicePrivate stopVoiceChatProc:]";
      __int16 v25 = 1024;
      int v26 = 173;
      __int16 v27 = 2080;
      int v28 = v9;
      _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stopVoiceChatProc1>:P%s", buf, 0x26u);
    }
  }
  [(NSRecursiveLock *)self->stateLock lock];
  if ([(GKVoiceChatServicePrivate *)self state])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        if (a3) {
          __int16 v12 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        }
        else {
          __int16 v12 = "<nil>";
        }
        unsigned int curCallID = self->curCallID;
        int state = self->state;
        *(_DWORD *)buf = 136316418;
        uint64_t v22 = v10;
        __int16 v23 = 2080;
        uint64_t v24 = "-[GKVoiceChatServicePrivate stopVoiceChatProc:]";
        __int16 v25 = 1024;
        int v26 = 180;
        __int16 v27 = 2080;
        int v28 = v12;
        __int16 v29 = 1024;
        unsigned int v30 = curCallID;
        __int16 v31 = 1024;
        int v32 = state;
        _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stopVoiceChatProc2>:P%s, unsigned int curCallID = %d, state %d", buf, 0x32u);
      }
    }
    id v15 = objc_alloc_init(MEMORY[0x263F086B0]);
    [(VideoConference *)self->conf stopCallID:self->curCallID];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      BOOL v17 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v22 = v16;
        __int16 v23 = 2080;
        uint64_t v24 = "-[GKVoiceChatServicePrivate stopVoiceChatProc:]";
        __int16 v25 = 1024;
        int v26 = 184;
        __int16 v27 = 1024;
        LODWORD(v28) = 184;
        _os_log_impl(&dword_221563000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stopCallID:__LINE = %d", buf, 0x22u);
      }
    }
    unsigned int v18 = [(GKVoiceChatServicePrivate *)self state];
    if (v18 <= 6 && ((1 << v18) & 0x68) != 0) {
      -[GKVoiceChatClient voiceChatService:sendData:toParticipantID:](self->client, "voiceChatService:sendData:toParticipantID:", self->wrapperService, objc_msgSend(-[GKVoiceChatDictionary cancelDictionary](self->outgoingCallDict, "cancelDictionary"), "createBlob"), a3);
    }
    [(GKVoiceChatServicePrivate *)self resetState];
    v19 = @"participantID";
    id v20 = a3;
    -[GKVoiceChatServicePrivate performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_informClientVoiceChatDidStop_, [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1], 0);
    [(NSRecursiveLock *)self->stateLock unlock];
  }
  else
  {
    [(NSRecursiveLock *)self->stateLock unlock];
  }
}

- (void)stopVoiceChatWithParticipantID:(id)a3
{
  if (self->client) {
    [MEMORY[0x263F08B88] detachNewThreadSelector:sel_stopVoiceChatProc_ toTarget:self withObject:a3];
  }
}

- (BOOL)acceptCallID:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  [(NSRecursiveLock *)self->stateLock lock];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      incomingCallDict = self->incomingCallDict;
      if (incomingCallDict) {
        uint64_t v10 = (const char *)objc_msgSend(-[GKVoiceChatDictionary description](incomingCallDict, "description"), "UTF8String");
      }
      else {
        uint64_t v10 = "<nil>";
      }
      int v18 = 136315906;
      uint64_t v19 = v7;
      __int16 v20 = 2080;
      v21 = "-[GKVoiceChatServicePrivate acceptCallID:error:]";
      __int16 v22 = 1024;
      int v23 = 241;
      __int16 v24 = 2080;
      __int16 v25 = v10;
      _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d acceptCallID with dict = %s", (uint8_t *)&v18, 0x26u);
    }
  }
  if (self->client)
  {
    if (self->incomingCallDict && [(GKVoiceChatServicePrivate *)self state] == 2)
    {
      if (self->curCallID == v5)
      {
        v11 = [(GKVoiceChatServicePrivate *)self createReplyUsingDictionary:self->incomingCallDict replyCode:1 error:a4];
        self->outgoingCallDict = v11;
        uint64_t v12 = [(GKVoiceChatDictionary *)v11 createBlob];
        outgoingCallDict = self->outgoingCallDict;
        if (outgoingCallDict)
        {
          uint64_t v14 = v12;
          if (v12)
          {
            id v15 = outgoingCallDict;
            [(GKVoiceChatClient *)self->client voiceChatService:self->wrapperService sendData:v14 toParticipantID:[(GKVoiceChatDictionary *)self->outgoingCallDict participantID]];
            [(GKVoiceChatServicePrivate *)self startICEConnectionCheck:self->incomingCallDict isCaller:0];
            [(GKVoiceChatServicePrivate *)self setState:6];
            [(NSRecursiveLock *)self->stateLock unlock];
            return 1;
          }
        }
        id v17 = [(GKVoiceChatServicePrivate *)self createReplyUsingDictionary:self->incomingCallDict replyCode:2 error:a4];
        -[GKVoiceChatClient voiceChatService:sendData:toParticipantID:](self->client, "voiceChatService:sendData:toParticipantID:", self->wrapperService, [v17 createBlob], objc_msgSend(v17, "participantID"));
        [(GKVoiceChatServicePrivate *)self resetState];
      }
      else
      {
        [(GKVoiceChatServicePrivate *)self getNSError:a4 code:32004 description:@"Invalid callID." reason:@"CallID does not match current."];
      }
      [(NSRecursiveLock *)self->stateLock unlock];
    }
    else
    {
      [(GKVoiceChatServicePrivate *)self getNSError:a4 code:32012 description:@"Cannot do acceptCallID:error:" reason:@"No active call to accept."];
      [(NSRecursiveLock *)self->stateLock unlock];
      [(GKVoiceChatServicePrivate *)self resetState];
    }
    [(VideoConference *)self->conf stopCallID:v5];
  }
  else
  {
    [(GKVoiceChatServicePrivate *)self getNSError:a4 code:32006 description:@"Client is not set." reason:@"Client is nil."];
    [(NSRecursiveLock *)self->stateLock unlock];
  }
  return 0;
}

- (void)denyCallID:(unsigned int)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  [(NSRecursiveLock *)self->stateLock lock];
  if (self->client && [(GKVoiceChatServicePrivate *)self state] == 2 && self->curCallID == a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        incomingCallDict = self->incomingCallDict;
        if (incomingCallDict) {
          v8 = (const char *)objc_msgSend(-[GKVoiceChatDictionary description](incomingCallDict, "description"), "UTF8String");
        }
        else {
          v8 = "<nil>";
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v17 = v5;
        __int16 v18 = 2080;
        uint64_t v19 = "-[GKVoiceChatServicePrivate denyCallID:]";
        __int16 v20 = 1024;
        int v21 = 299;
        __int16 v22 = 2080;
        int v23 = v8;
        _os_log_impl(&dword_221563000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d denyCallID with dict = %s", buf, 0x26u);
      }
    }
    uint64_t v13 = 0;
    [(VideoConference *)self->conf stopCallID:self->curCallID];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v17 = v10;
        __int16 v18 = 2080;
        uint64_t v19 = "-[GKVoiceChatServicePrivate denyCallID:]";
        __int16 v20 = 1024;
        int v21 = 302;
        __int16 v22 = 1024;
        LODWORD(v23) = 302;
        _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stopCallID:__LINE = %d", buf, 0x22u);
      }
    }
    id v12 = [(GKVoiceChatServicePrivate *)self createReplyUsingDictionary:self->incomingCallDict replyCode:2 error:&v13];
    -[GKVoiceChatClient voiceChatService:sendData:toParticipantID:](self->client, "voiceChatService:sendData:toParticipantID:", self->wrapperService, [v12 createBlob], objc_msgSend(v12, "participantID"));
    uint64_t v14 = @"participantID";
    id v15 = [(GKVoiceChatDictionary *)self->incomingCallDict fromParticipantID];
    -[GKVoiceChatServicePrivate informClientVoiceChatDidNotStart:](self, "informClientVoiceChatDidNotStart:", [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1]);
    [(GKVoiceChatServicePrivate *)self resetState];
    [(NSRecursiveLock *)self->stateLock unlock];
  }
  else
  {
    stateLock = self->stateLock;
    [(NSRecursiveLock *)stateLock unlock];
  }
}

- (void)setClient:(id)a3
{
  [(NSRecursiveLock *)self->stateLock lock];
  [(VideoConference *)self->conf setRequiresWifi:1];
  [(NSLock *)self->clientLock lock];
  self->client = (GKVoiceChatClient *)a3;
  [(NSLock *)self->clientLock unlock];
  stateLock = self->stateLock;
  [(NSRecursiveLock *)stateLock unlock];
}

- (void)informClientOfInviteFromParticipant:(id)incomingCallDict
{
  [(NSLock *)self->clientLock lock];
  uint64_t v5 = self->client;
  client = self->client;
  [(NSLock *)self->clientLock unlock];
  if (!incomingCallDict) {
    incomingCallDict = self->incomingCallDict;
  }
  if (objc_opt_respondsToSelector())
  {
    -[GKVoiceChatClient voiceChatService:didReceiveInvitationFromParticipantID:callID:](client, "voiceChatService:didReceiveInvitationFromParticipantID:callID:", self->wrapperService, [incomingCallDict fromParticipantID], objc_msgSend(incomingCallDict, "callID"));
  }
  else
  {

    uint64_t v6 = [(GKVoiceChatDictionary *)self->incomingCallDict callID];
    [(GKVoiceChatServicePrivate *)self acceptCallID:v6 error:0];
  }
}

- (void)informClientVoiceChatDidStart:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    id v5 = a3;
    [(GKVoiceChatServicePrivate *)self performSelectorOnMainThread:sel_informClientVoiceChatDidStartMainSelector_ withObject:v5 waitUntilDone:0];
  }
}

- (void)informClientVoiceChatDidStartMainSelector:(id)a3
{
  [(NSLock *)self->clientLock lock];
  id v5 = self->client;
  client = self->client;
  [(NSLock *)self->clientLock unlock];
  [(GKVoiceChatClient *)client voiceChatService:self->wrapperService didStartWithParticipantID:a3];
}

- (void)informClientVoiceChatDidNotStart:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    [(GKVoiceChatServicePrivate *)self performSelectorOnMainThread:sel_informClientVoiceChatDidNotStartMainSelector_ withObject:a3 waitUntilDone:0];
  }
}

- (void)informClientVoiceChatDidNotStartMainSelector:(id)a3
{
  [(NSLock *)self->clientLock lock];
  id v5 = self->client;
  client = self->client;
  [(NSLock *)self->clientLock unlock];
  -[GKVoiceChatClient voiceChatService:didNotStartWithParticipantID:error:](client, "voiceChatService:didNotStartWithParticipantID:error:", self->wrapperService, [a3 objectForKeyedSubscript:@"participantID"], objc_msgSend(a3, "objectForKeyedSubscript:", @"error"));
}

- (void)informClientVoiceChatDidStop:(id)a3
{
  [(NSLock *)self->clientLock lock];
  id v5 = self->client;
  client = self->client;
  [(NSLock *)self->clientLock unlock];
  if (objc_opt_respondsToSelector()) {
    -[GKVoiceChatClient voiceChatService:didStopWithParticipantID:error:](client, "voiceChatService:didStopWithParticipantID:error:", self->wrapperService, [a3 objectForKeyedSubscript:@"participantID"], objc_msgSend(a3, "objectForKeyedSubscript:", @"error"));
  }
}

- (void)resetState
{
  [(NSRecursiveLock *)self->stateLock lock];
  [(GKVoiceChatServicePrivate *)self setState:0];

  self->incomingCallDict = 0;
  self->outgoingCallDict = 0;
  self->unsigned int curCallID = -1;
  *(_OWORD *)&self->currentConnResult.dwCallID = 0u;
  *(_OWORD *)&self->currentConnResult.proto = 0u;
  *(_OWORD *)self->currentConnResult.mbLocal.szIfName = 0u;
  self->currentConnResult.mbLocal.IP = 0u;
  *(_OWORD *)&self->currentConnResult.mbLocal.wPort = 0u;
  *(_OWORD *)&self->currentConnResult.mbRemote.szIfName[8] = 0u;
  *($F769FFECAE4F2CBB6DC47B20A73030F6 *)((char *)&self->currentConnResult.mbRemote.IP + 8) = 0u;
  *(_OWORD *)self->currentConnResult.mbSrc.szIfName = 0u;
  self->currentConnResult.mbSrc.IP = 0u;
  *(_OWORD *)&self->currentConnResult.mbSrc.wPort = 0u;
  *(_OWORD *)&self->currentConnResult.mbDst.szIfName[8] = 0u;
  *($F769FFECAE4F2CBB6DC47B20A73030F6 *)((char *)&self->currentConnResult.mbDst.IP + 8) = 0u;
  *(_OWORD *)self->currentConnResult.mbRemoteSrc.szIfName = 0u;
  self->currentConnResult.mbRemoteSrc.IP = 0u;
  *(_OWORD *)&self->currentConnResult.mbRemoteSrc.wPort = 0u;
  *(_OWORD *)&self->currentConnResult.mbRelayExt.szIfName[8] = 0u;
  *($F769FFECAE4F2CBB6DC47B20A73030F6 *)((char *)&self->currentConnResult.mbRelayExt.IP + 8) = 0u;
  *(_OWORD *)&self->currentConnResult.bIfLocalCellularQoS = 0u;
  *(_OWORD *)&self->currentConnResult.wCellularMTU = 0u;
  *(_OWORD *)&self->currentConnResult.next = 0u;
  stateLock = self->stateLock;
  [(NSRecursiveLock *)stateLock unlock];
}

- (void)receivedData:(id)a3 fromParticipantID:(id)a4
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  if (self->client)
  {
    [(NSRecursiveLock *)self->stateLock lock];
    id v7 = +[GKVoiceChatDictionary dictionaryFromData:a3];
    if (v7)
    {
      v8 = v7;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int curCallID = self->curCallID;
          int state = self->state;
          *(_DWORD *)buf = 136316418;
          *(void *)&uint8_t buf[4] = v9;
          __int16 v98 = 2080;
          v99 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
          __int16 v100 = 1024;
          int v101 = 427;
          __int16 v102 = 1024;
          *(_DWORD *)v103 = state;
          *(_WORD *)&v103[4] = 1024;
          *(_DWORD *)&v103[6] = curCallID;
          *(_WORD *)v104 = 2080;
          *(void *)&v104[2] = objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
          _os_log_impl(&dword_221563000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d State = %d, unsigned int curCallID = %d, recevied dict = {%s}", buf, 0x32u);
        }
      }
      switch(self->state)
      {
        case 0:
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v25 = VRTraceErrorLogLevelToCSTR();
            uint64_t v26 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              if (a4) {
                __int16 v27 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
              }
              else {
                __int16 v27 = "<nil>";
              }
              uint64_t v66 = objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
              int v67 = [v8 isInviteDictionary];
              *(_DWORD *)buf = 136316418;
              *(void *)&uint8_t buf[4] = v25;
              __int16 v98 = 2080;
              v99 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
              __int16 v100 = 1024;
              int v101 = 431;
              __int16 v102 = 2080;
              *(void *)v103 = v27;
              *(_WORD *)&v103[8] = 2080;
              *(void *)v104 = v66;
              *(_WORD *)&v104[8] = 1024;
              int v105 = v67;
              _os_log_impl(&dword_221563000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d switch - GKVoiceChatServiceStateIdle from = %s: inviteIsValid = %s, %d", buf, 0x36u);
            }
          }
          if ([(GKVoiceChatServicePrivate *)self inviteIsValid:v8])
          {
            self->incomingCallDict = (GKVoiceChatDictionary *)v8;
            [(GKVoiceChatServicePrivate *)self setState:2];
            self->unsigned int curCallID = [v8 callID];
            [(GKVoiceChatServicePrivate *)self performSelectorOnMainThread:sel_informClientOfInviteFromParticipant_ withObject:0 waitUntilDone:0];
          }
          else
          {
            [(GKVoiceChatServicePrivate *)self resetState];
          }
          goto LABEL_94;
        case 1:
        case 5:
        case 6:
          if ([(GKVoiceChatServicePrivate *)self inviteIsValid:v8]
            && (!objc_msgSend(a4, "isEqualToString:", -[GKVoiceChatDictionary fromParticipantID](self->incomingCallDict, "fromParticipantID"))|| (objc_msgSend(v8, "matchesNonce:", -[GKVoiceChatDictionary nonce](self->incomingCallDict, "nonce")) & 1) == 0))
          {
            v86 = 0;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
            {
              uint64_t v18 = VRTraceErrorLogLevelToCSTR();
              uint64_t v19 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                unsigned int v21 = self->curCallID;
                int v20 = self->state;
                *(_DWORD *)buf = 136316162;
                *(void *)&uint8_t buf[4] = v18;
                __int16 v98 = 2080;
                v99 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
                __int16 v100 = 1024;
                int v101 = 601;
                __int16 v102 = 1024;
                *(_DWORD *)v103 = v20;
                *(_WORD *)&v103[4] = 1024;
                *(_DWORD *)&v103[6] = v21;
                _os_log_impl(&dword_221563000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d State = %d: GOT INVITE AND WE ARE BUSY BUSY with callID %d", buf, 0x28u);
              }
            }
            __int16 v22 = &v86;
            goto LABEL_24;
          }
          if (objc_msgSend(a4, "isEqualToString:", -[GKVoiceChatDictionary fromParticipantID](self->incomingCallDict, "fromParticipantID"))&& objc_msgSend(v8, "isCancelDictionary")&& objc_msgSend(v8, "matchesNonce:", -[GKVoiceChatDictionary nonce](self->outgoingCallDict, "nonce")))
          {
            v86 = 0;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
            {
              uint64_t v13 = VRTraceErrorLogLevelToCSTR();
              uint64_t v14 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                unsigned int v15 = self->curCallID;
                *(_DWORD *)buf = 136315906;
                *(void *)&uint8_t buf[4] = v13;
                __int16 v98 = 2080;
                v99 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
                __int16 v100 = 1024;
                int v101 = 613;
                __int16 v102 = 1024;
                *(_DWORD *)v103 = v15;
                _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Cancelling call from the remote user... for callID %d", buf, 0x22u);
              }
            }
            [(VideoConference *)self->conf remoteCancelledCallID:self->curCallID];
            [(GKVoiceChatServicePrivate *)self resetState];
            uint64_t v16 = [NSString stringWithFormat:objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", @"%@ has cancelled this request.", &stru_26D39CAC0, @"GKSessionEvent", a4];
            -[GKVoiceChatServicePrivate getNSError:code:description:reason:](self, "getNSError:code:description:reason:", &v86, 32009, v16, [GCKGameConnectivityKitBundle() localizedStringForKey:@"This request was cancelled." value:&stru_26D39CAC0 table:@"GKSessionEvent"]);
            v87[0] = @"participantID";
            v87[1] = @"error";
            v88[0] = a4;
            v88[1] = v86;
            -[GKVoiceChatServicePrivate informClientVoiceChatDidNotStart:](self, "informClientVoiceChatDidNotStart:", [NSDictionary dictionaryWithObjects:v88 forKeys:v87 count:2]);
            goto LABEL_92;
          }
          goto LABEL_94;
        case 2:
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v28 = VRTraceErrorLogLevelToCSTR();
            __int16 v29 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v30 = self->curCallID;
              *(_DWORD *)buf = 136315906;
              *(void *)&uint8_t buf[4] = v28;
              __int16 v98 = 2080;
              v99 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
              __int16 v100 = 1024;
              int v101 = 449;
              __int16 v102 = 1024;
              *(_DWORD *)v103 = v30;
              _os_log_impl(&dword_221563000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d switch - GKVoiceChatServiceStateWaitingForClientResponse callID = %d", buf, 0x22u);
            }
          }
          if (objc_msgSend(a4, "isEqualToString:", -[GKVoiceChatDictionary fromParticipantID](self->incomingCallDict, "fromParticipantID")))
          {
            if ([v8 isCancelDictionary])
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v31 = VRTraceErrorLogLevelToCSTR();
                int v32 = *MEMORY[0x263F21098];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                {
                  unsigned int v33 = self->curCallID;
                  *(_DWORD *)buf = 136315906;
                  *(void *)&uint8_t buf[4] = v31;
                  __int16 v98 = 2080;
                  v99 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
                  __int16 v100 = 1024;
                  int v101 = 467;
                  __int16 v102 = 1024;
                  *(_DWORD *)v103 = v33;
                  _os_log_impl(&dword_221563000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKVoiceChatServiceStateWaitingForClientResponse: Cancelling call is working... for callID %d", buf, 0x22u);
                }
              }
              *(void *)buf = 0;
              [(VideoConference *)self->conf remoteCancelledCallID:self->curCallID];
              uint64_t v34 = [NSString stringWithFormat:objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", @"%@ has cancelled this request.", &stru_26D39CAC0, @"GKSessionEvent", a4];
              -[GKVoiceChatServicePrivate getNSError:code:description:reason:](self, "getNSError:code:description:reason:", buf, 32009, v34, [GCKGameConnectivityKitBundle() localizedStringForKey:@"This request was cancelled." value:&stru_26D39CAC0 table:@"GKSessionEvent"]);
              v95[0] = @"participantID";
              v95[1] = @"error";
              v96[0] = a4;
              v96[1] = *(void *)buf;
              v35 = NSDictionary;
              uint64_t v36 = v96;
              v37 = v95;
              goto LABEL_38;
            }
          }
          else if ([(GKVoiceChatServicePrivate *)self inviteIsValid:v8])
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v43 = VRTraceErrorLogLevelToCSTR();
              v44 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                unsigned int v45 = self->curCallID;
                *(_DWORD *)buf = 136315906;
                *(void *)&uint8_t buf[4] = v43;
                __int16 v98 = 2080;
                v99 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
                __int16 v100 = 1024;
                int v101 = 455;
                __int16 v102 = 1024;
                *(_DWORD *)v103 = v45;
                _os_log_impl(&dword_221563000, v44, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKVoiceChatServiceStateWaitingForClientResponse: GOT INVITE AND WE ARE BUSY BUSY callID %d", buf, 0x22u);
              }
            }
            *(void *)buf = 0;
            __int16 v22 = (void **)buf;
LABEL_24:
            int v23 = self;
            uint64_t v24 = v8;
            goto LABEL_57;
          }
          goto LABEL_94;
        case 3:
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v39 = VRTraceErrorLogLevelToCSTR();
            v40 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v41 = self->curCallID;
              *(_DWORD *)buf = 136315906;
              *(void *)&uint8_t buf[4] = v39;
              __int16 v98 = 2080;
              v99 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
              __int16 v100 = 1024;
              int v101 = 480;
              __int16 v102 = 1024;
              *(_DWORD *)v103 = v41;
              _os_log_impl(&dword_221563000, v40, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d switch - GKVoiceChatServiceStateWaitingForInviteResponse callID %d", buf, 0x22u);
            }
          }
          if (!objc_msgSend(a4, "isEqualToString:", -[GKVoiceChatDictionary participantID](self->outgoingCallDict, "participantID")))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v46 = VRTraceErrorLogLevelToCSTR();
              v47 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                unsigned int v48 = self->curCallID;
                *(_DWORD *)buf = 136315906;
                *(void *)&uint8_t buf[4] = v46;
                __int16 v98 = 2080;
                v99 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
                __int16 v100 = 1024;
                int v101 = 584;
                __int16 v102 = 1024;
                *(_DWORD *)v103 = v48;
                _os_log_impl(&dword_221563000, v47, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKVoiceChatServiceStateWaitingForInviteResponse: GOT INVITE AND WE ARE BUSY BUSY with callID %d", buf, 0x22u);
              }
            }
            int v23 = self;
            uint64_t v24 = v8;
            __int16 v22 = 0;
LABEL_57:
            -[GKVoiceChatClient voiceChatService:sendData:toParticipantID:](self->client, "voiceChatService:sendData:toParticipantID:", self->wrapperService, objc_msgSend(-[GKVoiceChatServicePrivate createReplyUsingDictionary:replyCode:error:](v23, "createReplyUsingDictionary:replyCode:error:", v24, 3, v22), "createBlob"), a4);
            goto LABEL_94;
          }
          if ([(GKVoiceChatDictionary *)self->outgoingCallDict matchesResponse:v8])
          {
            self->incomingCallDict = (GKVoiceChatDictionary *)v8;
            v86 = 0;
            uint64_t v42 = [v8 response];
            if (v42 == 3)
            {
              [(VideoConference *)self->conf stopCallID:self->curCallID];
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v68 = VRTraceErrorLogLevelToCSTR();
                v69 = *MEMORY[0x263F21098];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315906;
                  *(void *)&uint8_t buf[4] = v68;
                  __int16 v98 = 2080;
                  v99 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
                  __int16 v100 = 1024;
                  int v101 = 502;
                  __int16 v102 = 1024;
                  *(_DWORD *)v103 = 502;
                  _os_log_impl(&dword_221563000, v69, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stopCallID:__LINE = %d", buf, 0x22u);
                }
              }
              uint64_t v70 = [NSString stringWithFormat:objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", @"%@ is currently busy in another call.", &stru_26D39CAC0, @"GKSessionEvent", a4];
              uint64_t v71 = [GCKGameConnectivityKitBundle() localizedStringForKey:@"Request declined." value:&stru_26D39CAC0 table:@"GKSessionEvent"];
              v72 = self;
              uint64_t v73 = 32008;
            }
            else
            {
              if (v42 != 2)
              {
                if (v42 == 1)
                {
                  [(GKVoiceChatServicePrivate *)self setState:5];
                  [(GKVoiceChatServicePrivate *)self startICEConnectionCheck:v8 isCaller:1];
                }
                goto LABEL_89;
              }
              [(VideoConference *)self->conf stopCallID:self->curCallID];
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v74 = VRTraceErrorLogLevelToCSTR();
                v75 = *MEMORY[0x263F21098];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315906;
                  *(void *)&uint8_t buf[4] = v74;
                  __int16 v98 = 2080;
                  v99 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
                  __int16 v100 = 1024;
                  int v101 = 497;
                  __int16 v102 = 1024;
                  *(_DWORD *)v103 = 497;
                  _os_log_impl(&dword_221563000, v75, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stopCallID:__LINE = %d", buf, 0x22u);
                }
              }
              uint64_t v70 = [NSString stringWithFormat:objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", @"%@ has declined your request.", &stru_26D39CAC0, @"GKSessionEvent", a4];
              uint64_t v71 = [GCKGameConnectivityKitBundle() localizedStringForKey:@"Request declined." value:&stru_26D39CAC0 table:@"GKSessionEvent"];
              v72 = self;
              uint64_t v73 = 32011;
            }
            [(GKVoiceChatServicePrivate *)v72 getNSError:&v86 code:v73 description:v70 reason:v71];
LABEL_89:
            if (!v86)
            {
LABEL_94:
              [(NSRecursiveLock *)self->stateLock unlock];
              return;
            }
            v93[0] = @"participantID";
            v93[1] = @"error";
            v94[0] = a4;
            v94[1] = v86;
            v63 = NSDictionary;
            v64 = v94;
            v65 = v93;
            goto LABEL_91;
          }
          BOOL v49 = [(GKVoiceChatServicePrivate *)self inviteIsValid:v8];
          int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
          if (!v49)
          {
            if (ErrorLogLevelForModule >= 7)
            {
              uint64_t v57 = VRTraceErrorLogLevelToCSTR();
              v58 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v59 = objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
                *(_DWORD *)buf = 136315906;
                *(void *)&uint8_t buf[4] = v57;
                __int16 v98 = 2080;
                v99 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
                __int16 v100 = 1024;
                int v101 = 565;
                __int16 v102 = 2080;
                *(void *)v103 = v59;
                _os_log_impl(&dword_221563000, v58, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [self inviteIsValid:calleeResponse] is NO {%s}", buf, 0x26u);
              }
            }
            if ([v8 isReplyDictionary]) {
              goto LABEL_94;
            }
            v86 = 0;
            [(VideoConference *)self->conf stopCallID:self->curCallID];
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v60 = VRTraceErrorLogLevelToCSTR();
              v61 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                *(void *)&uint8_t buf[4] = v60;
                __int16 v98 = 2080;
                v99 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
                __int16 v100 = 1024;
                int v101 = 573;
                __int16 v102 = 1024;
                *(_DWORD *)v103 = 573;
                _os_log_impl(&dword_221563000, v61, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stopCallID:__LINE = %d", buf, 0x22u);
              }
            }
            uint64_t v62 = [NSString stringWithFormat:objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", @"%@ has declined your request.", &stru_26D39CAC0, @"GKSessionEvent", a4];
            -[GKVoiceChatServicePrivate getNSError:code:description:reason:](self, "getNSError:code:description:reason:", &v86, 32011, v62, [GCKGameConnectivityKitBundle() localizedStringForKey:@"Request declined." value:&stru_26D39CAC0 table:@"GKSessionEvent"]);
            v89[0] = @"participantID";
            v89[1] = @"error";
            v90[0] = a4;
            v90[1] = v86;
            v63 = NSDictionary;
            v64 = v90;
            v65 = v89;
LABEL_91:
            -[GKVoiceChatServicePrivate informClientVoiceChatDidNotStart:](self, "informClientVoiceChatDidNotStart:", [v63 dictionaryWithObjects:v64 forKeys:v65 count:2]);
            [(GKVoiceChatServicePrivate *)self resetState];
LABEL_92:
            v38 = v86;
LABEL_93:

            goto LABEL_94;
          }
          if (ErrorLogLevelForModule >= 7)
          {
            uint64_t v51 = VRTraceErrorLogLevelToCSTR();
            v52 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              BOOL v53 = objc_msgSend((id)-[GKVoiceChatClient participantID](self->client, "participantID"), "localizedCompare:", a4) == -1;
              uint64_t v54 = objc_msgSend((id)-[GKVoiceChatClient participantID](self->client, "participantID"), "localizedCompare:", a4);
              *(_DWORD *)buf = 136316162;
              *(void *)&uint8_t buf[4] = v51;
              __int16 v98 = 2080;
              v99 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
              __int16 v100 = 1024;
              int v101 = 516;
              __int16 v102 = 1024;
              *(_DWORD *)v103 = v53;
              *(_WORD *)&v103[4] = 1024;
              *(_DWORD *)&v103[6] = v54 == 1;
              _os_log_impl(&dword_221563000, v52, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [self inviteIsValid:calleeResponse] is YES:isCaller=%d, %d", buf, 0x28u);
            }
          }
          self->incomingCallDict = (GKVoiceChatDictionary *)v8;
          if (objc_msgSend((id)-[GKVoiceChatClient participantID](self->client, "participantID"), "localizedCompare:", a4) == -1)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              uint64_t v76 = VRTraceErrorLogLevelToCSTR();
              v77 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                *(void *)&uint8_t buf[4] = v76;
                __int16 v98 = 2080;
                v99 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
                __int16 v100 = 1024;
                int v101 = 524;
                _os_log_impl(&dword_221563000, v77, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d I am the caller starting ice check", buf, 0x1Cu);
              }
            }
          }
          else
          {
            if (objc_msgSend((id)-[GKVoiceChatClient participantID](self->client, "participantID"), "localizedCompare:", a4) == 1)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                uint64_t v55 = VRTraceErrorLogLevelToCSTR();
                v56 = *MEMORY[0x263F21098];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315650;
                  *(void *)&uint8_t buf[4] = v55;
                  __int16 v98 = 2080;
                  v99 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
                  __int16 v100 = 1024;
                  int v101 = 531;
                  _os_log_impl(&dword_221563000, v56, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d I am the callee starting ice check", buf, 0x1Cu);
                }
              }
LABEL_102:
              [(GKVoiceChatServicePrivate *)self setState:6];
              incomingCallDict = self->incomingCallDict;
              v81 = self;
              uint64_t v82 = 0;
              goto LABEL_103;
            }
            int64_t v78 = [(GKVoiceChatDictionary *)self->incomingCallDict nonce];
            int64_t v79 = [(GKVoiceChatDictionary *)self->outgoingCallDict nonce];
            if (v79 >= v78)
            {
              if (v79 <= v78)
              {
                [(VideoConference *)self->conf stopCallID:self->curCallID];
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  uint64_t v83 = VRTraceErrorLogLevelToCSTR();
                  v84 = *MEMORY[0x263F21098];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315906;
                    *(void *)&uint8_t buf[4] = v83;
                    __int16 v98 = 2080;
                    v99 = "-[GKVoiceChatServicePrivate receivedData:fromParticipantID:]";
                    __int16 v100 = 1024;
                    int v101 = 552;
                    __int16 v102 = 1024;
                    *(_DWORD *)v103 = 552;
                    _os_log_impl(&dword_221563000, v84, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stopCallID:__LINE = %d", buf, 0x22u);
                  }
                }
                *(void *)buf = 0;
                uint64_t v85 = [NSString stringWithFormat:objc_msgSend(GCKGameConnectivityKitBundle(), "localizedStringForKey:value:table:", @"%@ has declined your request.", &stru_26D39CAC0, @"GKSessionEvent", a4];
                -[GKVoiceChatServicePrivate getNSError:code:description:reason:](self, "getNSError:code:description:reason:", buf, 32011, v85, [GCKGameConnectivityKitBundle() localizedStringForKey:@"Request declined." value:&stru_26D39CAC0 table:@"GKSessionEvent"]);
                v91[0] = @"participantID";
                v91[1] = @"error";
                v92[0] = a4;
                v92[1] = *(void *)buf;
                v35 = NSDictionary;
                uint64_t v36 = v92;
                v37 = v91;
LABEL_38:
                -[GKVoiceChatServicePrivate informClientVoiceChatDidNotStart:](self, "informClientVoiceChatDidNotStart:", [v35 dictionaryWithObjects:v36 forKeys:v37 count:2]);
                [(GKVoiceChatServicePrivate *)self resetState];
                v38 = *(void **)buf;
                goto LABEL_93;
              }
              goto LABEL_102;
            }
          }
          [(GKVoiceChatServicePrivate *)self setState:5];
          incomingCallDict = self->incomingCallDict;
          v81 = self;
          uint64_t v82 = 1;
LABEL_103:
          [(GKVoiceChatServicePrivate *)v81 startICEConnectionCheck:incomingCallDict isCaller:v82];
          goto LABEL_94;
        default:
          goto LABEL_94;
      }
    }
    stateLock = self->stateLock;
    [(NSRecursiveLock *)stateLock unlock];
  }
}

- (BOOL)inviteIsValid:(id)a3
{
  return [a3 isInviteDictionary];
}

- (id)createReplyUsingDictionary:(id)a3 replyCode:(unint64_t)a4 error:(id *)a5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unsigned int v11 = 0;
  if (a4 == 1)
  {
    uint64_t v8 = [(VideoConference *)self->conf connectionBlobForParticipantID:[(GKVoiceChatClient *)self->client participantID] callID:&v11 error:a5];
    if (!v8) {
      return 0;
    }
    uint64_t v9 = v11;
    self->unsigned int curCallID = v11;
  }
  else
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", "empty", 5, a5);
    uint64_t v9 = 0;
  }
  return (id)objc_msgSend(a3, "replyDictionary:connectionData:callID:focus:", a4, v8, v9, -[GKVoiceChatServicePrivate isFocus](self, "isFocus"));
}

- (id)createInvite:(id *)a3 toParticipant:(id)a4 callID:(unsigned int *)a5
{
  unsigned int v9 = *a5;
  id result = (id)[(VideoConference *)self->conf connectionBlobForParticipantID:[(GKVoiceChatClient *)self->client participantID] callID:&v9 error:a3];
  *a5 = v9;
  if (result) {
    return +[GKVoiceChatDictionary inviteDictionaryToParticipantID:a4 fromParticipantID:[(GKVoiceChatClient *)self->client participantID] connectionData:result callID:*a5 focus:[(GKVoiceChatServicePrivate *)self isFocus]];
  }
  return result;
}

- (int)startICEConnectionCheck:(id)a3 isCaller:(BOOL)a4
{
  return [(GKVoiceChatServicePrivate *)self startICEConnectionCheck:a3 isCaller:a4 withCallID:self->curCallID];
}

- (int)startICEConnectionCheck:(id)a3 isCaller:(BOOL)a4 withCallID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  uint64_t v34 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
    goto LABEL_12;
  }
  uint64_t v9 = VRTraceErrorLogLevelToCSTR();
  uint64_t v10 = *MEMORY[0x263F21098];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_12;
  }
  if (!self)
  {
    unsigned int v11 = "<nil>";
    if (a3) {
      goto LABEL_5;
    }
LABEL_7:
    uint64_t v12 = "<nil>";
    goto LABEL_8;
  }
  unsigned int v11 = (const char *)objc_msgSend((id)-[GKVoiceChatServicePrivate description](self, "description"), "UTF8String");
  if (!a3) {
    goto LABEL_7;
  }
LABEL_5:
  uint64_t v12 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
LABEL_8:
  conf = self->conf;
  if (conf) {
    uint64_t v14 = (const char *)objc_msgSend((id)-[VideoConference description](conf, "description"), "UTF8String");
  }
  else {
    uint64_t v14 = "<nil>";
  }
  *(_DWORD *)buf = 136316930;
  *(void *)&uint8_t buf[4] = v9;
  __int16 v20 = 2080;
  unsigned int v21 = "-[GKVoiceChatServicePrivate startICEConnectionCheck:isCaller:withCallID:]";
  __int16 v22 = 1024;
  int v23 = 711;
  __int16 v24 = 2080;
  uint64_t v25 = v11;
  __int16 v26 = 2080;
  __int16 v27 = v12;
  __int16 v28 = 1024;
  BOOL v29 = v6;
  __int16 v30 = 1024;
  int v31 = v5;
  __int16 v32 = 2080;
  unsigned int v33 = v14;
  _os_log_impl(&dword_221563000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s startICEConnectionCheck: %s, isCaller = %d, callID = %d, conf = %s", buf, 0x46u);
LABEL_12:
  *(void *)buf = 0;
  unsigned int v15 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", objc_msgSend(a3, "connectionData"), *(void *)off_2645B78F0, 0);
  LODWORD(v18) = -1;
  int v16 = -[VideoConference startConnectionWithParticipantID:callID:usingInviteData:isCaller:relayResponseDict:didOriginateRelayRequest:capabilities:idsSocket:destination:error:](self->conf, "startConnectionWithParticipantID:callID:usingInviteData:isCaller:relayResponseDict:didOriginateRelayRequest:capabilities:idsSocket:destination:error:", [a3 fromParticipantID], v5, v15, v6, 0, 0, objc_msgSend(off_2645B7B30, "AudioOnlyVCCapabilities"), v18, 0, buf);

  return v16;
}

- (BOOL)getNSError:(id *)a3 code:(int64_t)a4 description:(id)a5 hResult:(int)a6
{
  switch((__int16)a6)
  {
    case 14:
      uint64_t v8 = @"Data size too large";
      break;
    case 15:
      uint64_t v8 = @"Invalid payload";
      break;
    case 16:
      uint64_t v8 = @"Unsupported";
      break;
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 31:
    case 32:
      goto LABEL_6;
    case 22:
      uint64_t v8 = @"Not found";
      break;
    case 23:
      uint64_t v8 = @"Timed out";
      break;
    case 30:
      uint64_t v8 = @"Cancelled";
      break;
    case 33:
      uint64_t v8 = @"Connection closed";
      break;
    case 34:
      uint64_t v8 = @"Bad message";
      break;
    case 35:
      uint64_t v8 = @"No transaction";
      break;
    default:
      if ((unsigned __int16)a6 == 3)
      {
        uint64_t v8 = @"Out of memory";
      }
      else if ((unsigned __int16)a6 == 47)
      {
        uint64_t v8 = @"Declined";
      }
      else
      {
LABEL_6:
        uint64_t v8 = @"Internal error";
      }
      break;
  }
  -[GKVoiceChatServicePrivate getNSError:code:description:reason:](self, "getNSError:code:description:reason:", a3, a4, a5, v8, v6, v7);
  return 1;
}

- (BOOL)getNSError:(id *)a3 code:(int64_t)a4 description:(id)a5 reason:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v9 = 0;
    if (a5 && a6)
    {
      id v11 = objc_alloc(NSDictionary);
      uint64_t v9 = objc_msgSend(v11, "initWithObjectsAndKeys:", a5, *MEMORY[0x263F08320], a6, *MEMORY[0x263F08338], 0);
    }
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:*(void *)off_2645B79B0 code:a4 userInfo:v9];
    *a3 = v12;
    id v13 = v12;
    id v14 = *a3;

    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      int v16 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if (*a3) {
          uint64_t v17 = (const char *)objc_msgSend((id)objc_msgSend(*a3, "description"), "UTF8String");
        }
        else {
          uint64_t v17 = "<nil>";
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v20 = v15;
        __int16 v21 = 2080;
        __int16 v22 = "-[GKVoiceChatServicePrivate getNSError:code:description:reason:]";
        __int16 v23 = 1024;
        int v24 = 804;
        __int16 v25 = 1024;
        int v26 = a4;
        __int16 v27 = 2080;
        __int16 v28 = v17;
        _os_log_impl(&dword_221563000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Error: %d -- %s.", buf, 0x2Cu);
      }
    }
  }
  return a3 != 0;
}

- (BOOL)isOutputMeteringEnabled
{
  return self->outputMeteringEnabled;
}

- (void)setOutputMeteringEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->outputMeteringEnabled = a3;
  [(NSRecursiveLock *)self->stateLock lock];
  [(VideoConference *)self->conf setOutputMeteringEnabled:v3];
  stateLock = self->stateLock;
  [(NSRecursiveLock *)stateLock unlock];
}

- (BOOL)isInputMeteringEnabled
{
  return self->inputMeteringEnabled;
}

- (void)setInputMeteringEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->inputMeteringEnabled = a3;
  [(NSRecursiveLock *)self->stateLock lock];
  [(VideoConference *)self->conf setInputMeteringEnabled:v3];
  stateLock = self->stateLock;
  [(NSRecursiveLock *)stateLock unlock];
}

- (float)outputMeterLevel
{
  [(VideoConference *)self->conf outputMeterLevel];
  return result;
}

- (float)inputMeterLevel
{
  [(VideoConference *)self->conf inputMeterLevel];
  return result;
}

- (void)setMicrophoneMuted:(BOOL)a3
{
  [(NSRecursiveLock *)self->stateLock lock];
  self->BOOL microphoneMuted = a3;
  [(NSRecursiveLock *)self->stateLock unlock];
  BOOL microphoneMuted = self->microphoneMuted;
  conf = self->conf;
  [(VideoConference *)conf setMicrophoneMuted:microphoneMuted];
}

- (BOOL)isMicrophoneMuted
{
  return self->microphoneMuted;
}

- (float)remoteParticipantVolume
{
  [(VideoConference *)self->conf conferenceVolume];
  return result;
}

- (void)setRemoteParticipantVolume:(float)a3
{
}

- (void)setChatMode:(int)a3
{
  self->chatMode = a3;
}

- (int)chatMode
{
  return self->chatMode;
}

- (void)setFocus:(BOOL)a3
{
  self->focus = a3;
}

- (BOOL)isFocus
{
  return self->focus;
}

- (void)forceNoICE:(BOOL)a3
{
  self->forceNoICE = a3;
  -[VideoConference forceNoICE:](self->conf, "forceNoICE:");
}

- (void)videoConference:(id)a3 didStartSession:(BOOL)a4 withCallID:(unsigned int)a5 error:(id)a6
{
  BOOL v8 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    id v11 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int curCallID = self->curCallID;
      *(_DWORD *)buf = 136316418;
      uint64_t v19 = v10;
      __int16 v20 = 2080;
      __int16 v21 = "-[GKVoiceChatServicePrivate videoConference:didStartSession:withCallID:error:]";
      __int16 v22 = 1024;
      int v23 = 885;
      __int16 v24 = 1024;
      unsigned int v25 = a5;
      __int16 v26 = 1024;
      unsigned int v27 = curCallID;
      __int16 v28 = 1024;
      BOOL v29 = curCallID == a5;
      _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d videoConference: didStopWithCallID:%d == %d ? %d", buf, 0x2Eu);
    }
  }
  [(NSRecursiveLock *)self->stateLock lock];
  if (self->curCallID == a5 && self->state)
  {
    if (v8)
    {
      self->int state = 1;
      [(GKVoiceChatServicePrivate *)self informClientVoiceChatDidStart:[(GKVoiceChatDictionary *)self->outgoingCallDict participantID]];
    }
    else
    {
      id v15 = [(GKVoiceChatDictionary *)self->outgoingCallDict participantID];
      v16[1] = @"error";
      v17[0] = v15;
      v17[1] = a6;
      -[GKVoiceChatServicePrivate informClientVoiceChatDidNotStart:](self, "informClientVoiceChatDidNotStart:", [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2]);
      [(GKVoiceChatServicePrivate *)self resetState];
    }
  }
  else
  {
    -[VideoConference stopCallID:](self->conf, "stopCallID:");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      id v14 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v19 = v13;
        __int16 v20 = 2080;
        __int16 v21 = "-[GKVoiceChatServicePrivate videoConference:didStartSession:withCallID:error:]";
        __int16 v22 = 1024;
        int v23 = 902;
        __int16 v24 = 1024;
        unsigned int v25 = 902;
        _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stopCallID:__LINE = %d", buf, 0x22u);
      }
    }
  }
  [(NSRecursiveLock *)self->stateLock unlock];
}

- (void)videoConference:(id)a3 didStopWithCallID:(unsigned int)a4 error:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int curCallID = self->curCallID;
      *(_DWORD *)buf = 136316418;
      uint64_t v15 = v8;
      __int16 v16 = 2080;
      uint64_t v17 = "-[GKVoiceChatServicePrivate videoConference:didStopWithCallID:error:]";
      __int16 v18 = 1024;
      int v19 = 911;
      __int16 v20 = 1024;
      unsigned int v21 = a4;
      __int16 v22 = 1024;
      unsigned int v23 = curCallID;
      __int16 v24 = 1024;
      BOOL v25 = curCallID == a4;
      _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d videoConference: didStopWithCallID:%d == %d ? %d", buf, 0x2Eu);
    }
  }
  [(NSRecursiveLock *)self->stateLock lock];
  if (self->curCallID == a4 && self->state)
  {
    id v11 = [(GKVoiceChatDictionary *)self->outgoingCallDict participantID];
    v12[1] = @"error";
    v13[0] = v11;
    v13[1] = a5;
    -[GKVoiceChatServicePrivate performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_informClientVoiceChatDidStop_, [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2], 0);
    [(GKVoiceChatServicePrivate *)self resetState];
  }
  [(NSRecursiveLock *)self->stateLock unlock];
}

- (void)setLocalVideoLayer:(void *)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136316162;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint64_t v8 = "-[GKVoiceChatServicePrivate setLocalVideoLayer:]";
      __int16 v9 = 1024;
      int v10 = 928;
      __int16 v11 = 2080;
      uint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GKVoiceChatServicePrivate.m";
      __int16 v13 = 1024;
      int v14 = 928;
      _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d STUB:%s: %d", (uint8_t *)&v5, 0x2Cu);
    }
  }
}

- (void)localVideoLayer
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136316162;
      uint64_t v6 = v2;
      __int16 v7 = 2080;
      uint64_t v8 = "-[GKVoiceChatServicePrivate localVideoLayer]";
      __int16 v9 = 1024;
      int v10 = 933;
      __int16 v11 = 2080;
      uint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GKVoiceChatServicePrivate.m";
      __int16 v13 = 1024;
      int v14 = 933;
      _os_log_impl(&dword_221563000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d STUB:%s: %d", (uint8_t *)&v5, 0x2Cu);
    }
  }
  return 0;
}

- (void)setRemoteVideoLayer:(void *)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136316162;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint64_t v8 = "-[GKVoiceChatServicePrivate setRemoteVideoLayer:]";
      __int16 v9 = 1024;
      int v10 = 938;
      __int16 v11 = 2080;
      uint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GKVoiceChatServicePrivate.m";
      __int16 v13 = 1024;
      int v14 = 938;
      _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d STUB:%s: %d", (uint8_t *)&v5, 0x2Cu);
    }
  }
}

- (void)remoteVideoLayer
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136316162;
      uint64_t v6 = v2;
      __int16 v7 = 2080;
      uint64_t v8 = "-[GKVoiceChatServicePrivate remoteVideoLayer]";
      __int16 v9 = 1024;
      int v10 = 943;
      __int16 v11 = 2080;
      uint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GKVoiceChatServicePrivate.m";
      __int16 v13 = 1024;
      int v14 = 943;
      _os_log_impl(&dword_221563000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d STUB:%s: %d", (uint8_t *)&v5, 0x2Cu);
    }
  }
  return 0;
}

- (double)localFramerate
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136316162;
      uint64_t v6 = v2;
      __int16 v7 = 2080;
      uint64_t v8 = "-[GKVoiceChatServicePrivate localFramerate]";
      __int16 v9 = 1024;
      int v10 = 948;
      __int16 v11 = 2080;
      uint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GKVoiceChatServicePrivate.m";
      __int16 v13 = 1024;
      int v14 = 948;
      _os_log_impl(&dword_221563000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d STUB:%s: %d", (uint8_t *)&v5, 0x2Cu);
    }
  }
  return 0.0;
}

- (double)localBitrate
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136316162;
      uint64_t v6 = v2;
      __int16 v7 = 2080;
      uint64_t v8 = "-[GKVoiceChatServicePrivate localBitrate]";
      __int16 v9 = 1024;
      int v10 = 953;
      __int16 v11 = 2080;
      uint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GKVoiceChatServicePrivate.m";
      __int16 v13 = 1024;
      int v14 = 953;
      _os_log_impl(&dword_221563000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d STUB:%s: %d", (uint8_t *)&v5, 0x2Cu);
    }
  }
  return 0.0;
}

- (double)remoteFramerate
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136316162;
      uint64_t v6 = v2;
      __int16 v7 = 2080;
      uint64_t v8 = "-[GKVoiceChatServicePrivate remoteFramerate]";
      __int16 v9 = 1024;
      int v10 = 958;
      __int16 v11 = 2080;
      uint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GKVoiceChatServicePrivate.m";
      __int16 v13 = 1024;
      int v14 = 958;
      _os_log_impl(&dword_221563000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d STUB:%s: %d", (uint8_t *)&v5, 0x2Cu);
    }
  }
  return 0.0;
}

- (double)remoteBitrate
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136316162;
      uint64_t v6 = v2;
      __int16 v7 = 2080;
      uint64_t v8 = "-[GKVoiceChatServicePrivate remoteBitrate]";
      __int16 v9 = 1024;
      int v10 = 963;
      __int16 v11 = 2080;
      uint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/AVConference/GameKitServices.subproj/Sources/Gecko/GKVoiceChatServicePrivate.m";
      __int16 v13 = 1024;
      int v14 = 963;
      _os_log_impl(&dword_221563000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d STUB:%s: %d", (uint8_t *)&v5, 0x2Cu);
    }
  }
  return 0.0;
}

- (id)localDisplayNameForCallID:(unsigned int)a3
{
  return (id)[(GKVoiceChatClient *)self->client participantID];
}

- (id)remoteDisplayNameForCallID:(unsigned int)a3
{
  return [(GKVoiceChatDictionary *)self->outgoingCallDict participantID];
}

- (int64_t)outputAudioPowerSpectrumToken
{
  return [(VideoConference *)self->conf outputAudioPowerSpectrumToken];
}

- (id)client
{
  return self->client;
}

- (int)state
{
  return self->state;
}

- (void)setState:(int)a3
{
  self->int state = a3;
}

- (GKVoiceChatService)wrapperService
{
  return self->wrapperService;
}

- (void)setWrapperService:(id)a3
{
  self->wrapperService = (GKVoiceChatService *)a3;
}

- (void)createReplyUsingDictionary:(uint64_t)a3 replyCode:(os_log_t)log error:.cold.1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 136315906;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = "-[GKVoiceChatServicePrivate createReplyUsingDictionary:replyCode:error:]";
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = 675;
  *((_WORD *)buf + 14) = 2080;
  *(void *)(buf + 30) = a1;
  _os_log_error_impl(&dword_221563000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Caught exception: %s", buf, 0x26u);
}

@end