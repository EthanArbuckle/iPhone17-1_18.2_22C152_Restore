@interface GKVoiceChatServiceFocus
+ (id)defaultVoiceChatService;
- (BOOL)acceptCallID:(unsigned int)a3 error:(id *)a4;
- (BOOL)hasMic;
- (BOOL)isAudioPausedToParticipantID:(id)a3;
- (BOOL)processCancelDict:(id)a3;
- (BOOL)processFocusChange:(id)a3 fromParticipantID:(id)a4;
- (BOOL)processFocusDict:(id)a3 fromParticipantID:(id)a4;
- (BOOL)processInviteDictionary:(id)a3 fromParticipantID:(id)a4;
- (BOOL)processInviteDictionaryForTie:(id)a3 fromParticipantID:(id)a4;
- (BOOL)processReplyDict:(id)a3;
- (BOOL)startVoiceChatWithParticipantID:(id)a3 error:(id *)a4;
- (GKVoiceChatServiceFocus)init;
- (NSString)currentFocus;
- (double)localBitrate;
- (double)localFramerate;
- (double)remoteBitrate;
- (double)remoteFramerate;
- (id)dictionaryForCallID:(unsigned int)a3 isIncomingDictonary:(BOOL)a4;
- (id)dictionaryForNonce:(int64_t)a3 participantID:(id)a4 isIncomingDictonary:(BOOL)a5;
- (id)dictionaryForParticipantID:(id)a3 isIncomingDictonary:(BOOL)a4;
- (id)incomingDictionaryMatchingOriginalCallID:(unsigned int)a3 participantID:(id)a4;
- (id)localDisplayNameForCallID:(unsigned int)a3;
- (id)openOutgoingDictionaryForParticipantID:(id)a3;
- (id)remoteDisplayNameForCallID:(unsigned int)a3;
- (int)packetsPerBundle;
- (void)dealloc;
- (void)denyCallID:(unsigned int)a3;
- (void)localVideoLayer;
- (void)pauseAudio:(BOOL)a3 toParticipantID:(id)a4;
- (void)receivedData:(id)a3 fromParticipantID:(id)a4;
- (void)remoteCancelled:(id)a3;
- (void)remoteCancelledProc:(id)a3;
- (void)remoteVideoLayer;
- (void)sendFocusChange:(BOOL)a3;
- (void)setChatMode:(int)a3;
- (void)setCurrentFocus:(id)a3;
- (void)setFocus:(BOOL)a3;
- (void)setHasMic:(BOOL)a3;
- (void)setIsUsingSuppression:(BOOL)a3;
- (void)setPacketsPerBundle:(int)a3;
- (void)setQualityDelegate:(id)a3;
- (void)setShouldTimeoutPackets:(BOOL)a3;
- (void)setSpeakingDelegate:(id)a3;
- (void)setTalkingPeersLimit:(unsigned int)a3;
- (void)stopVoiceChatProc:(id)a3;
- (void)stopVoiceChatProc:(id)a3 participantDidCancel:(BOOL)a4;
- (void)updatedConnectedPeers:(id)a3;
- (void)updatedMutedPeers:(id)a3 forParticipantID:(id)a4;
- (void)videoConference:(id)a3 didStartSession:(BOOL)a4 withCallID:(unsigned int)a5 error:(id)a6;
- (void)videoConference:(id)a3 didStopWithCallID:(unsigned int)a4 error:(id)a5;
@end

@implementation GKVoiceChatServiceFocus

+ (id)defaultVoiceChatService
{
  id result = (id)defaultVoiceChatService__GKVoiceChatServiceFocus;
  if (!defaultVoiceChatService__GKVoiceChatServiceFocus)
  {
    v3 = objc_opt_class();
    objc_sync_enter(v3);
    if (!defaultVoiceChatService__GKVoiceChatServiceFocus) {
      defaultVoiceChatService__GKVoiceChatServiceFocus = objc_alloc_init(GKVoiceChatServiceFocus);
    }
    objc_sync_exit(v3);
    return (id)defaultVoiceChatService__GKVoiceChatServiceFocus;
  }
  return result;
}

- (GKVoiceChatServiceFocus)init
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)GKVoiceChatServiceFocus;
  v2 = [(GKVoiceChatServicePrivate *)&v6 init];
  if (v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v8 = v3;
        __int16 v9 = 2080;
        v10 = "-[GKVoiceChatServiceFocus init]";
        __int16 v11 = 1024;
        int v12 = 49;
        _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKVoiceChatServiceFocus...", buf, 0x1Cu);
      }
    }
    v2->outgoingCallDictList = (NSMutableArray *)(id)[MEMORY[0x263EFF980] arrayWithCapacity:10];
    v2->incomingCallDictList = (NSMutableArray *)(id)[MEMORY[0x263EFF980] arrayWithCapacity:10];
    v2->incomingUID = (int)arc4random() % 10000;
    [(GKVoiceChatServiceFocus *)v2 setPacketsPerBundle:4];
    v2->hasMic = 1;
  }
  return v2;
}

- (void)dealloc
{
  self->outgoingCallDictList = 0;
  self->incomingCallDictList = 0;

  self->currentFocus = 0;
  v3.receiver = self;
  v3.super_class = (Class)GKVoiceChatServiceFocus;
  [(GKVoiceChatServicePrivate *)&v3 dealloc];
}

- (BOOL)startVoiceChatWithParticipantID:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  [(NSRecursiveLock *)self->super.stateLock lock];
  if (!self->super.client)
  {
LABEL_5:
    v10 = @"Client is not set.";
    __int16 v9 = @"Client is nil.";
LABEL_6:
    __int16 v11 = self;
    int v12 = a4;
    uint64_t v13 = 32006;
    goto LABEL_7;
  }
  int v7 = [(VideoConference *)self->super.conf matchesOpenSessionForParticipantID:a3];
  client = self->super.client;
  if (v7)
  {
    if (client)
    {
      __int16 v9 = (__CFString *)[NSString stringWithFormat:@"Already in conference with %@", a3];
      v10 = @"Cannot do startVoiceChatWithParticipantID:error:";
      __int16 v11 = self;
      int v12 = a4;
      uint64_t v13 = 32012;
LABEL_7:
      [(GKVoiceChatServicePrivate *)v11 getNSError:v12 code:v13 description:v10 reason:v9];
      [(NSRecursiveLock *)self->super.stateLock unlock];
      return 0;
    }
    goto LABEL_5;
  }
  if (![(GKVoiceChatClient *)client participantID])
  {
    v10 = @"Client participantID is not set.";
    __int16 v9 = @"participantID is nil.";
    goto LABEL_6;
  }
  int v23 = 0;
  id v16 = [(GKVoiceChatServicePrivate *)self createInvite:a4 toParticipant:a3 callID:&v23];
  uint64_t v17 = [v16 createBlob];
  if (v16) {
    BOOL v18 = v17 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  BOOL v14 = !v18;
  if (!v18)
  {
    uint64_t v19 = v17;
    [(GKVoiceChatServicePrivate *)self setState:3];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = objc_msgSend((id)objc_msgSend(v16, "description"), "UTF8String");
        *(_DWORD *)buf = 136315906;
        uint64_t v25 = v20;
        __int16 v26 = 2080;
        v27 = "-[GKVoiceChatServiceFocus startVoiceChatWithParticipantID:error:]";
        __int16 v28 = 1024;
        int v29 = 106;
        __int16 v30 = 2080;
        uint64_t v31 = v22;
        _os_log_impl(&dword_221563000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d OutgoingcallDict = %s", buf, 0x26u);
      }
    }
    [(GKVoiceChatClient *)self->super.client voiceChatService:self->super.wrapperService sendData:v19 toParticipantID:a3];
    [(NSMutableArray *)self->outgoingCallDictList addObject:v16];
  }
  [(NSRecursiveLock *)self->super.stateLock unlock];
  return v14;
}

- (id)dictionaryForNonce:(int64_t)a3 participantID:(id)a4 isIncomingDictonary:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x263EF8340];
  [(NSRecursiveLock *)self->super.stateLock lock];
  __int16 v9 = &OBJC_IVAR___GKVoiceChatServiceFocus_outgoingCallDictList;
  if (v5) {
    __int16 v9 = &OBJC_IVAR___GKVoiceChatServiceFocus_incomingCallDictList;
  }
  v10 = *(Class *)((char *)&self->super.super.isa + *v9);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
LABEL_5:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v19 != v13) {
        objc_enumerationMutation(v10);
      }
      v15 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
      if ([v15 matchesNonce:a3])
      {
        id v16 = (void *)(v5 ? [v15 fromParticipantID] : objc_msgSend(v15, "participantID"));
        if ([v16 isEqualToString:a4]) {
          break;
        }
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12) {
          goto LABEL_5;
        }
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    v15 = 0;
  }
  [(NSRecursiveLock *)self->super.stateLock unlock];
  return v15;
}

- (id)dictionaryForParticipantID:(id)a3 isIncomingDictonary:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  [(NSRecursiveLock *)self->super.stateLock lock];
  int v7 = &OBJC_IVAR___GKVoiceChatServiceFocus_outgoingCallDictList;
  if (v4) {
    int v7 = &OBJC_IVAR___GKVoiceChatServiceFocus_incomingCallDictList;
  }
  uint64_t v8 = *(Class *)((char *)&self->super.super.isa + *v7);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
LABEL_5:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v17 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
      uint64_t v14 = (void *)(v4 ? [v13 fromParticipantID] : objc_msgSend(v13, "participantID"));
      if ([v14 isEqualToString:a3]) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          goto LABEL_5;
        }
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    uint64_t v13 = 0;
  }
  [(NSRecursiveLock *)self->super.stateLock unlock];
  return v13;
}

- (id)dictionaryForCallID:(unsigned int)a3 isIncomingDictonary:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  [(NSRecursiveLock *)self->super.stateLock lock];
  int v7 = &OBJC_IVAR___GKVoiceChatServiceFocus_outgoingCallDictList;
  if (v4) {
    int v7 = &OBJC_IVAR___GKVoiceChatServiceFocus_incomingCallDictList;
  }
  uint64_t v8 = *(Class *)((char *)&self->super.super.isa + *v7);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
LABEL_5:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
      if ([v13 callID] == a3) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    uint64_t v13 = 0;
  }
  [(NSRecursiveLock *)self->super.stateLock unlock];
  return v13;
}

- (void)remoteCancelled:(id)a3
{
  if (self->super.client) {
    [MEMORY[0x263F08B88] detachNewThreadSelector:sel_remoteCancelledProc_ toTarget:self withObject:a3];
  }
}

- (void)remoteCancelledProc:(id)a3
{
}

- (void)stopVoiceChatProc:(id)a3
{
}

- (void)stopVoiceChatProc:(id)a3 participantDidCancel:(BOOL)a4
{
  *(void *)&v29[5] = *MEMORY[0x263EF8340];
  id v7 = objc_alloc_init(MEMORY[0x263F086B0]);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (a3) {
        uint64_t v10 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      }
      else {
        uint64_t v10 = "<nil>";
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v23 = v8;
      __int16 v24 = 2080;
      uint64_t v25 = "-[GKVoiceChatServiceFocus stopVoiceChatProc:participantDidCancel:]";
      __int16 v26 = 1024;
      int v27 = 218;
      __int16 v28 = 2080;
      *(void *)int v29 = v10;
      _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stopVoiceChatProc1>:P%s", buf, 0x26u);
    }
  }
  [(NSRecursiveLock *)self->super.stateLock lock];
  id v11 = [(GKVoiceChatServiceFocus *)self openOutgoingDictionaryForParticipantID:a3];
  if (v11)
  {
    uint64_t v12 = v11;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int curCallID = self->super.curCallID;
        int state = self->super.state;
        *(_DWORD *)buf = 136316162;
        uint64_t v23 = v13;
        __int16 v24 = 2080;
        uint64_t v25 = "-[GKVoiceChatServiceFocus stopVoiceChatProc:participantDidCancel:]";
        __int16 v26 = 1024;
        int v27 = 230;
        __int16 v28 = 1024;
        *(_DWORD *)int v29 = curCallID;
        v29[2] = 1024;
        *(_DWORD *)&v29[3] = state;
        _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d stopVoiceChatProc2>: unsigned int curCallID = %d, state %d", buf, 0x28u);
      }
    }
    uint64_t v17 = [v12 callID];
    unsigned int v18 = [(VideoConference *)self->super.conf stateForCallID:v17];
    conf = self->super.conf;
    if (a4) {
      [(VideoConference *)conf remoteCancelledCallID:v17];
    }
    else {
      [(VideoConference *)conf stopCallID:v17];
    }
    if (v18 <= 6 && ((1 << v18) & 0x68) != 0)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __66__GKVoiceChatServiceFocus_stopVoiceChatProc_participantDidCancel___block_invoke;
      block[3] = &unk_2645B7C90;
      block[4] = self;
      block[5] = v12;
      block[6] = a3;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    [(GKVoiceChatServicePrivate *)self resetState];
  }
  [(NSRecursiveLock *)self->super.stateLock unlock];
}

uint64_t __66__GKVoiceChatServiceFocus_stopVoiceChatProc_participantDidCancel___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(v2 + 8);
  uint64_t v4 = *(void *)(v2 + 384);
  uint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "cancelDictionary"), "createBlob");
  uint64_t v6 = *(void *)(a1 + 48);
  return [v3 voiceChatService:v4 sendData:v5 toParticipantID:v6];
}

- (BOOL)acceptCallID:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  [(NSRecursiveLock *)self->super.stateLock lock];
  id v7 = [(GKVoiceChatServiceFocus *)self dictionaryForCallID:v5 isIncomingDictonary:1];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (v7) {
        uint64_t v10 = (const char *)objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
      }
      else {
        uint64_t v10 = "<nil>";
      }
      int v16 = 136315906;
      uint64_t v17 = v8;
      __int16 v18 = 2080;
      long long v19 = "-[GKVoiceChatServiceFocus acceptCallID:error:]";
      __int16 v20 = 1024;
      int v21 = 281;
      __int16 v22 = 2080;
      uint64_t v23 = v10;
      _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d acceptCallID with dict = %s", (uint8_t *)&v16, 0x26u);
    }
  }
  if (!self->super.client)
  {
    [(GKVoiceChatServicePrivate *)self getNSError:a4 code:32006 description:@"Client is not set." reason:@"Client is nil."];
LABEL_15:
    [(NSRecursiveLock *)self->super.stateLock unlock];
    return 0;
  }
  if (v7)
  {
    id v11 = [(GKVoiceChatServicePrivate *)self createReplyUsingDictionary:v7 replyCode:1 error:a4];
    uint64_t v12 = [v11 createBlob];
    if (v11)
    {
      uint64_t v13 = v12;
      if (v12)
      {
        [(NSMutableArray *)self->outgoingCallDictList addObject:v11];
        -[GKVoiceChatClient voiceChatService:sendData:toParticipantID:](self->super.client, "voiceChatService:sendData:toParticipantID:", self->super.wrapperService, v13, [v11 participantID]);
        -[GKVoiceChatServicePrivate startICEConnectionCheck:isCaller:withCallID:](self, "startICEConnectionCheck:isCaller:withCallID:", v7, 0, [v11 callID]);
        [(NSRecursiveLock *)self->super.stateLock unlock];
        return 1;
      }
    }
    id v15 = [(GKVoiceChatServicePrivate *)self createReplyUsingDictionary:v7 replyCode:2 error:a4];
    -[GKVoiceChatClient voiceChatService:sendData:toParticipantID:](self->super.client, "voiceChatService:sendData:toParticipantID:", self->super.wrapperService, [v15 createBlob], objc_msgSend(v15, "participantID"));
    [(GKVoiceChatServicePrivate *)self resetState];
    goto LABEL_15;
  }
  [(GKVoiceChatServicePrivate *)self getNSError:a4 code:32012 description:@"Cannot do acceptCallID:error:" reason:@"No active call to accept."];
  [(NSRecursiveLock *)self->super.stateLock unlock];
  [(GKVoiceChatServicePrivate *)self resetState];
  [(VideoConference *)self->super.conf stopCallID:v5];
  return 0;
}

- (void)denyCallID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  [(NSRecursiveLock *)self->super.stateLock lock];
  id v5 = [(GKVoiceChatServiceFocus *)self dictionaryForCallID:v3 isIncomingDictonary:1];
  if (self->super.client) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    stateLock = self->super.stateLock;
    [(NSRecursiveLock *)stateLock unlock];
  }
  else
  {
    uint64_t v8 = v5;
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      id v11 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        incomingCallDict = self->super.incomingCallDict;
        if (incomingCallDict) {
          uint64_t v13 = (const char *)objc_msgSend(-[GKVoiceChatDictionary description](incomingCallDict, "description"), "UTF8String");
        }
        else {
          uint64_t v13 = "<nil>";
        }
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = v10;
        __int16 v18 = 2080;
        long long v19 = "-[GKVoiceChatServiceFocus denyCallID:]";
        __int16 v20 = 1024;
        int v21 = 331;
        __int16 v22 = 2080;
        uint64_t v23 = v13;
        _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d denyCallID with dict = %s", buf, 0x26u);
      }
    }
    *(void *)buf = 0;
    id v14 = [(GKVoiceChatServicePrivate *)self createReplyUsingDictionary:v8 replyCode:2 error:buf];
    -[GKVoiceChatClient voiceChatService:sendData:toParticipantID:](self->super.client, "voiceChatService:sendData:toParticipantID:", self->super.wrapperService, [v14 createBlob], objc_msgSend(v14, "participantID"));
    uint64_t v16 = objc_msgSend(v8, "fromParticipantID", @"participantID");
    -[GKVoiceChatServicePrivate informClientVoiceChatDidNotStart:](self, "informClientVoiceChatDidNotStart:", [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1]);
    [(GKVoiceChatServicePrivate *)self resetState];
    [(NSMutableArray *)self->incomingCallDictList removeObject:v8];
    [(NSRecursiveLock *)self->super.stateLock unlock];
  }
}

- (void)receivedData:(id)a3 fromParticipantID:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (self->super.client)
  {
    [(NSRecursiveLock *)self->super.stateLock lock];
    id v7 = +[GKVoiceChatDictionary dictionaryFromData:a3];
    if (v7)
    {
      uint64_t v8 = v7;
      if ([v7 isInviteDictionary])
      {
        [(GKVoiceChatServiceFocus *)self processInviteDictionary:v8 fromParticipantID:a4];
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          uint64_t v10 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
          {
            int v14 = 136315650;
            uint64_t v15 = v9;
            __int16 v16 = 2080;
            uint64_t v17 = "-[GKVoiceChatServiceFocus receivedData:fromParticipantID:]";
            __int16 v18 = 1024;
            int v19 = 364;
            _os_log_impl(&dword_221563000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Finished processing Invite Dictionary...", (uint8_t *)&v14, 0x1Cu);
          }
        }
      }
      else if ([v8 isReplyDictionary])
      {
        [(GKVoiceChatServiceFocus *)self processReplyDict:v8];
      }
      else if ([v8 isCancelDictionary])
      {
        [(GKVoiceChatServiceFocus *)self processCancelDict:v8];
      }
      else if ([v8 isFocusDictionary])
      {
        [(GKVoiceChatServiceFocus *)self processFocusDict:v8 fromParticipantID:a4];
      }
      [(NSRecursiveLock *)self->super.stateLock unlock];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        uint64_t v13 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 136315650;
          uint64_t v15 = v12;
          __int16 v16 = 2080;
          uint64_t v17 = "-[GKVoiceChatServiceFocus receivedData:fromParticipantID:]";
          __int16 v18 = 1024;
          int v19 = 380;
          _os_log_impl(&dword_221563000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Finished receivedData...", (uint8_t *)&v14, 0x1Cu);
        }
      }
    }
    else
    {
      stateLock = self->super.stateLock;
      [(NSRecursiveLock *)stateLock unlock];
    }
  }
}

- (BOOL)processInviteDictionaryForTie:(id)a3 fromParticipantID:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = objc_msgSend((id)-[GKVoiceChatClient participantID](self->super.client, "participantID"), "localizedCompare:", a4) == -1;
      uint64_t v10 = objc_msgSend((id)-[GKVoiceChatClient participantID](self->super.client, "participantID"), "localizedCompare:", a4);
      *(_DWORD *)__int16 v22 = 136316162;
      *(void *)&v22[4] = v7;
      __int16 v23 = 2080;
      uint64_t v24 = "-[GKVoiceChatServiceFocus processInviteDictionaryForTie:fromParticipantID:]";
      __int16 v25 = 1024;
      int v26 = 387;
      __int16 v27 = 1024;
      BOOL v28 = v9;
      __int16 v29 = 1024;
      BOOL v30 = v10 == 1;
      _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [self inviteIsValid:calleeResponse] is YES:isCaller=%d, %d", v22, 0x28u);
    }
  }
  id v11 = -[GKVoiceChatServiceFocus openOutgoingDictionaryForParticipantID:](self, "openOutgoingDictionaryForParticipantID:", a4, *(void *)v22);
  if (v11)
  {
    uint64_t v12 = v11;
    if (objc_msgSend((id)-[GKVoiceChatClient participantID](self->super.client, "participantID"), "localizedCompare:", a4) == -1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        __int16 v18 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v22 = 136315650;
          *(void *)&v22[4] = v17;
          __int16 v23 = 2080;
          uint64_t v24 = "-[GKVoiceChatServiceFocus processInviteDictionaryForTie:fromParticipantID:]";
          __int16 v25 = 1024;
          int v26 = 398;
          _os_log_impl(&dword_221563000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d I am the caller starting ice check", v22, 0x1Cu);
        }
      }
      [(GKVoiceChatServicePrivate *)self setState:5];
      -[GKVoiceChatServicePrivate startICEConnectionCheck:isCaller:withCallID:](self, "startICEConnectionCheck:isCaller:withCallID:", a3, 1, [v12 callID]);
      uint64_t v15 = [v12 nonce];
      id v16 = a3;
      goto LABEL_19;
    }
    if (objc_msgSend((id)-[GKVoiceChatClient participantID](self->super.client, "participantID"), "localizedCompare:", a4) == 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        int v14 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int16 v22 = 136315650;
          *(void *)&v22[4] = v13;
          __int16 v23 = 2080;
          uint64_t v24 = "-[GKVoiceChatServiceFocus processInviteDictionaryForTie:fromParticipantID:]";
          __int16 v25 = 1024;
          int v26 = 408;
          _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d I am the callee starting ice check", v22, 0x1Cu);
        }
      }
      [(GKVoiceChatServicePrivate *)self setState:6];
      -[GKVoiceChatServicePrivate startICEConnectionCheck:isCaller:withCallID:](self, "startICEConnectionCheck:isCaller:withCallID:", a3, 0, [v12 callID]);
      uint64_t v15 = [a3 nonce];
      id v16 = v12;
      goto LABEL_19;
    }
    uint64_t v19 = [a3 nonce];
    uint64_t v20 = [v12 nonce];
    ++self->incomingUID;
    objc_msgSend(a3, "setCallID:");
    if (v20 < v19)
    {
      -[GKVoiceChatServicePrivate startICEConnectionCheck:isCaller:withCallID:](self, "startICEConnectionCheck:isCaller:withCallID:", a3, 1, [v12 callID]);
      id v16 = a3;
      uint64_t v15 = v20;
LABEL_19:
      [v16 setNonce:v15];
      [(NSMutableArray *)self->incomingCallDictList addObject:a3];
      LOBYTE(v11) = 1;
      return (char)v11;
    }
    if (v20 > v19)
    {
      -[GKVoiceChatServicePrivate startICEConnectionCheck:isCaller:withCallID:](self, "startICEConnectionCheck:isCaller:withCallID:", a3, 0, [v12 callID]);
      id v16 = v12;
      uint64_t v15 = v19;
      goto LABEL_19;
    }
    LOBYTE(v11) = 0;
  }
  return (char)v11;
}

- (id)openOutgoingDictionaryForParticipantID:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(NSRecursiveLock *)self->super.stateLock lock];
  outgoingCallDictList = self->outgoingCallDictList;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(NSMutableArray *)outgoingCallDictList countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(outgoingCallDictList);
      }
      uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
      if (objc_msgSend((id)objc_msgSend(v10, "participantID"), "isEqualToString:", a3))
      {
        if (-[VideoConference stateForCallID:](self->super.conf, "stateForCallID:", [v10 callID]) != 7&& -[VideoConference stateForCallID:](self->super.conf, "stateForCallID:", objc_msgSend(v10, "callID")) != 8)
        {
          break;
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)outgoingCallDictList countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    uint64_t v10 = 0;
  }
  [(NSRecursiveLock *)self->super.stateLock unlock];
  return v10;
}

- (BOOL)processInviteDictionary:(id)a3 fromParticipantID:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = [(GKVoiceChatServiceFocus *)self openOutgoingDictionaryForParticipantID:a4];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (v7) {
        uint64_t v10 = (const char *)objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
      }
      else {
        uint64_t v10 = "<nil>";
      }
      int v11 = -[VideoConference stateForCallID:](self->super.conf, "stateForCallID:", [v7 callID]);
      *(_DWORD *)uint64_t v17 = 136316162;
      *(void *)&v17[4] = v8;
      __int16 v18 = 2080;
      uint64_t v19 = "-[GKVoiceChatServiceFocus processInviteDictionary:fromParticipantID:]";
      __int16 v20 = 1024;
      int v21 = 465;
      __int16 v22 = 2080;
      __int16 v23 = v10;
      __int16 v24 = 1024;
      int v25 = v11;
      _os_log_impl(&dword_221563000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d processInviteDictionary:outDict = %s, int state = %d", v17, 0x2Cu);
    }
  }
  if (v7)
  {
    if (-[VideoConference stateForCallID:](self->super.conf, "stateForCallID:", [v7 callID]) == 3&& -[GKVoiceChatServiceFocus processInviteDictionaryForTie:fromParticipantID:](self, "processInviteDictionaryForTie:fromParticipantID:", a3, a4))
    {
      return 1;
    }
LABEL_18:
    *(void *)uint64_t v17 = 0;
    -[GKVoiceChatClient voiceChatService:sendData:toParticipantID:](self->super.client, "voiceChatService:sendData:toParticipantID:", self->super.wrapperService, objc_msgSend(-[GKVoiceChatServicePrivate createReplyUsingDictionary:replyCode:error:](self, "createReplyUsingDictionary:replyCode:error:", a3, 3, v17), "createBlob"), a4);
    return 0;
  }
  id v12 = [(GKVoiceChatServiceFocus *)self dictionaryForParticipantID:a4 isIncomingDictonary:1];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    long long v14 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (v12) {
        long long v15 = (const char *)objc_msgSend((id)objc_msgSend(v12, "description"), "UTF8String");
      }
      else {
        long long v15 = "<nil>";
      }
      *(_DWORD *)uint64_t v17 = 136315906;
      *(void *)&v17[4] = v13;
      __int16 v18 = 2080;
      uint64_t v19 = "-[GKVoiceChatServiceFocus processInviteDictionary:fromParticipantID:]";
      __int16 v20 = 1024;
      int v21 = 485;
      __int16 v22 = 2080;
      __int16 v23 = v15;
      _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d processInviteDictionary:otherDict = %s", v17, 0x26u);
    }
  }
  if (v12) {
    goto LABEL_18;
  }
  ++self->incomingUID;
  objc_msgSend(a3, "setCallID:");
  [(NSMutableArray *)self->incomingCallDictList addObject:a3];
  [(GKVoiceChatServiceFocus *)self performSelectorOnMainThread:sel_informClientOfInviteFromParticipant_ withObject:a3 waitUntilDone:0];
  return 1;
}

- (BOOL)processReplyDict:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  id v5 = -[GKVoiceChatServiceFocus dictionaryForNonce:participantID:isIncomingDictonary:](self, "dictionaryForNonce:participantID:isIncomingDictonary:", [a3 nonce], objc_msgSend(a3, "fromParticipantID"), 0);
  if (v5)
  {
    -[VideoConference matchesOpenSessionForParticipantID:](self->super.conf, "matchesOpenSessionForParticipantID:", [a3 fromParticipantID]);
    uint64_t v12 = 0;
    uint64_t v6 = [a3 fromParticipantID];
    uint64_t v7 = [a3 response];
    if (v7 == 2)
    {
      uint64_t v8 = @"%@ has declined your request.";
      uint64_t v9 = 32011;
    }
    else
    {
      if (v7 != 3) {
        goto LABEL_8;
      }
      uint64_t v8 = @"%@ is currently busy in another call.";
      uint64_t v9 = 32008;
    }
    -[VideoConference stopCallID:](self->super.conf, "stopCallID:", [v5 callID]);
    -[GKVoiceChatServicePrivate getNSError:code:description:reason:](self, "getNSError:code:description:reason:", &v12, v9, objc_msgSend(NSString, "stringWithFormat:", v8, v6), @"Request declined.");
    if (v12)
    {
      v13[0] = @"participantID";
      v13[1] = @"error";
      v14[0] = v6;
      v14[1] = v12;
      -[GKVoiceChatServicePrivate informClientVoiceChatDidNotStart:](self, "informClientVoiceChatDidNotStart:", [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2]);
      [(GKVoiceChatServicePrivate *)self resetState];
      [(NSMutableArray *)self->outgoingCallDictList removeObject:v5];
      LOBYTE(v5) = 0;
      return (char)v5;
    }
LABEL_8:
    uint64_t v10 = [v5 callID];
    LOBYTE(v5) = 1;
    [(GKVoiceChatServicePrivate *)self startICEConnectionCheck:a3 isCaller:1 withCallID:v10];
    [(NSMutableArray *)self->incomingCallDictList addObject:a3];
  }
  return (char)v5;
}

- (id)incomingDictionaryMatchingOriginalCallID:(unsigned int)a3 participantID:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  [(NSRecursiveLock *)self->super.stateLock lock];
  incomingCallDictList = self->incomingCallDictList;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [(NSMutableArray *)incomingCallDictList countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(incomingCallDictList);
      }
      uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
      if (objc_msgSend((id)objc_msgSend(v12, "fromParticipantID"), "isEqualToString:", a4))
      {
        if ([v12 originalCallID] == a3) {
          break;
        }
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [(NSMutableArray *)incomingCallDictList countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    uint64_t v12 = 0;
  }
  [(NSRecursiveLock *)self->super.stateLock unlock];
  return v12;
}

- (BOOL)processCancelDict:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = [a3 fromParticipantID];
  id v6 = -[GKVoiceChatServiceFocus dictionaryForNonce:participantID:isIncomingDictonary:](self, "dictionaryForNonce:participantID:isIncomingDictonary:", [a3 nonce], v5, 0);
  if (!v6) {
    id v6 = [(GKVoiceChatServiceFocus *)self openOutgoingDictionaryForParticipantID:v5];
  }
  id v7 = -[GKVoiceChatServiceFocus dictionaryForNonce:participantID:isIncomingDictonary:](self, "dictionaryForNonce:participantID:isIncomingDictonary:", [a3 nonce], v5, 1);
  if (v7
    || (id v8 = -[GKVoiceChatServiceFocus incomingDictionaryMatchingOriginalCallID:participantID:](self, "incomingDictionaryMatchingOriginalCallID:participantID:", [a3 callID], v5), (v7 = v8) != 0))
  {
    if (v6)
    {
      [(NSMutableArray *)self->outgoingCallDictList removeObject:v6];
      -[VideoConference remoteCancelledCallID:](self->super.conf, "remoteCancelledCallID:", [v6 callID]);
    }
    uint64_t v10 = 0;
    [(NSMutableArray *)self->incomingCallDictList removeObject:v7];
    -[GKVoiceChatServicePrivate getNSError:code:description:reason:](self, "getNSError:code:description:reason:", &v10, 32009, [NSString stringWithFormat:@"%@ has cancelled this request.", v5], @"This request was cancelled.");
    v11[0] = @"participantID";
    v11[1] = @"error";
    v12[0] = v5;
    v12[1] = v10;
    -[GKVoiceChatServicePrivate informClientVoiceChatDidNotStart:](self, "informClientVoiceChatDidNotStart:", [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2]);
    [(GKVoiceChatServicePrivate *)self resetState];
    LOBYTE(v8) = 1;
  }
  return (char)v8;
}

- (BOOL)processFocusDict:(id)a3 fromParticipantID:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v7 = -[GKVoiceChatServiceFocus dictionaryForNonce:participantID:isIncomingDictonary:](self, "dictionaryForNonce:participantID:isIncomingDictonary:", [a3 nonce], a4, 0);
  if (!v7) {
    unint64_t v7 = [(GKVoiceChatServiceFocus *)self openOutgoingDictionaryForParticipantID:a4];
  }
  if (-[GKVoiceChatServiceFocus dictionaryForNonce:participantID:isIncomingDictonary:](self, "dictionaryForNonce:participantID:isIncomingDictonary:", [a3 nonce], a4, 1)|| (unint64_t)-[GKVoiceChatServiceFocus incomingDictionaryMatchingOriginalCallID:participantID:](self, "incomingDictionaryMatchingOriginalCallID:participantID:", objc_msgSend(a3, "callID"), a4) | v7)
  {
    return [(GKVoiceChatServiceFocus *)self processFocusChange:a3 fromParticipantID:a4];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if (a4) {
          uint64_t v11 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
        }
        else {
          uint64_t v11 = "<nil>";
        }
        int v12 = 136315906;
        uint64_t v13 = v9;
        __int16 v14 = 2080;
        long long v15 = "-[GKVoiceChatServiceFocus processFocusDict:fromParticipantID:]";
        __int16 v16 = 1024;
        int v17 = 612;
        __int16 v18 = 2080;
        uint64_t v19 = v11;
        _os_log_impl(&dword_221563000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Got focus dict from %s but not in call with them!", (uint8_t *)&v12, 0x26u);
      }
    }
    return 0;
  }
}

- (BOOL)processFocusChange:(id)a3 fromParticipantID:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if ([a3 isFocus]
    && ![(NSString *)self->currentFocus isEqualToString:a4])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_23;
    }
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x263F21098];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    currentFocus = self->currentFocus;
    if (currentFocus)
    {
      uint64_t v13 = [[(NSString *)currentFocus description] UTF8String];
      if (a4)
      {
LABEL_13:
        __int16 v14 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
LABEL_22:
        int v24 = 136316162;
        uint64_t v25 = v10;
        __int16 v26 = 2080;
        __int16 v27 = "-[GKVoiceChatServiceFocus processFocusChange:fromParticipantID:]";
        __int16 v28 = 1024;
        int v29 = 621;
        __int16 v30 = 2080;
        uint64_t v31 = v13;
        __int16 v32 = 2080;
        v33 = v14;
        _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting currentFocus from %s to %s", (uint8_t *)&v24, 0x30u);
LABEL_23:
        int v21 = self->currentFocus;
        __int16 v22 = (NSString *)[[NSString alloc] initWithString:a4];
        self->currentFocus = v22;
        [(VideoConference *)self->super.conf setCurrentFocus:v22];
        if ([(GKVoiceChatServicePrivate *)self isFocus]) {
          [(GKVoiceChatServiceFocus *)self setFocus:0];
        }

        return 1;
      }
    }
    else
    {
      uint64_t v13 = "<nil>";
      if (a4) {
        goto LABEL_13;
      }
    }
    __int16 v14 = "<nil>";
    goto LABEL_22;
  }
  if ([(NSString *)self->currentFocus isEqualToString:a4]
    && ([a3 isFocus] & 1) == 0)
  {
    [(VideoConference *)self->super.conf setCurrentFocus:0];

    self->currentFocus = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      __int16 v16 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        if (a4) {
          int v17 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
        }
        else {
          int v17 = "<nil>";
        }
        int v24 = 136315906;
        uint64_t v25 = v15;
        __int16 v26 = 2080;
        __int16 v27 = "-[GKVoiceChatServiceFocus processFocusChange:fromParticipantID:]";
        __int16 v28 = 1024;
        int v29 = 636;
        __int16 v30 = 2080;
        uint64_t v31 = v17;
        __int16 v18 = " [%s] %s:%d Setting currentFocus from %s to none";
        uint64_t v19 = v16;
        uint32_t v20 = 38;
        goto LABEL_28;
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    id v8 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (a4) {
        uint64_t v9 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      }
      else {
        uint64_t v9 = "<nil>";
      }
      int v24 = 136316162;
      uint64_t v25 = v7;
      __int16 v26 = 2080;
      __int16 v27 = "-[GKVoiceChatServiceFocus processFocusChange:fromParticipantID:]";
      __int16 v28 = 1024;
      int v29 = 638;
      __int16 v30 = 2080;
      uint64_t v31 = v9;
      __int16 v32 = 1024;
      LODWORD(v33) = [a3 isFocus];
      __int16 v18 = " [%s] %s:%d Focus dict from %s is %d";
      uint64_t v19 = v8;
      uint32_t v20 = 44;
LABEL_28:
      _os_log_impl(&dword_221563000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v24, v20);
    }
  }
  return 1;
}

- (void)sendFocusChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  outgoingCallDictList = self->outgoingCallDictList;
  uint64_t v6 = [(NSMutableArray *)outgoingCallDictList countByEnumeratingWithState:&v17 objects:v31 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v18;
    *(void *)&long long v7 = 136316162;
    long long v16 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(outgoingCallDictList);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend((id)objc_msgSend(v11, "focusDictionary:", v3, v16), "createBlob");
        if (v12)
        {
          -[GKVoiceChatClient voiceChatService:sendData:toParticipantID:](self->super.client, "voiceChatService:sendData:toParticipantID:", self->super.wrapperService, v12, [v11 participantID]);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v13 = VRTraceErrorLogLevelToCSTR();
            __int16 v14 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              if ([v11 participantID]) {
                uint64_t v15 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "participantID"), "description"), "UTF8String");
              }
              else {
                uint64_t v15 = "<nil>";
              }
              *(_DWORD *)buf = v16;
              uint64_t v22 = v13;
              __int16 v23 = 2080;
              int v24 = "-[GKVoiceChatServiceFocus sendFocusChange:]";
              __int16 v25 = 1024;
              int v26 = 649;
              __int16 v27 = 1024;
              BOOL v28 = v3;
              __int16 v29 = 2080;
              __int16 v30 = v15;
              _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Sending focus changed to %d to %s", buf, 0x2Cu);
            }
          }
        }
      }
      uint64_t v8 = [(NSMutableArray *)outgoingCallDictList countByEnumeratingWithState:&v17 objects:v31 count:16];
    }
    while (v8);
  }
}

- (void)setChatMode:(int)a3
{
  if (self->super.chatMode != a3)
  {
    self->super.chatMode = a3;
    -[VideoConference setChatMode:](self->super.conf, "setChatMode:");
  }
}

- (void)setCurrentFocus:(id)a3
{
  [(NSRecursiveLock *)self->super.stateLock lock];
  if ((objc_msgSend(a3, "isEqualToString:", -[VideoConference currentFocus](self->super.conf, "currentFocus")) & 1) == 0)
  {

    uint64_t v5 = (NSString *)[a3 copy];
    self->currentFocus = v5;
    [(VideoConference *)self->super.conf setCurrentFocus:v5];
  }
  stateLock = self->super.stateLock;
  [(NSRecursiveLock *)stateLock unlock];
}

- (void)setFocus:(BOOL)a3
{
  if (self->super.focus != a3)
  {
    BOOL v3 = a3;
    self->super.focus = a3;
    if (a3)
    {
      [(VideoConference *)self->super.conf setCurrentFocus:0];

      self->currentFocus = 0;
    }
    conf = self->super.conf;
    [(VideoConference *)conf setIsFocus:v3];
  }
}

- (void)setPacketsPerBundle:(int)a3
{
  self->packetsPerBundle = a3;
  -[VideoConference setPacketsPerBundle:](self->super.conf, "setPacketsPerBundle:");
}

- (int)packetsPerBundle
{
  return self->packetsPerBundle;
}

- (void)setHasMic:(BOOL)a3
{
  self->hasMic = a3;
  -[VideoConference setHasMic:](self->super.conf, "setHasMic:");
}

- (BOOL)hasMic
{
  BOOL result = [(VideoConference *)self->super.conf hasMic];
  self->hasMic = result;
  return result;
}

- (void)updatedMutedPeers:(id)a3 forParticipantID:(id)a4
{
}

- (void)updatedConnectedPeers:(id)a3
{
}

- (void)setSpeakingDelegate:(id)a3
{
}

- (void)setQualityDelegate:(id)a3
{
}

- (void)setTalkingPeersLimit:(unsigned int)a3
{
}

- (void)setIsUsingSuppression:(BOOL)a3
{
}

- (void)setShouldTimeoutPackets:(BOOL)a3
{
}

- (void)videoConference:(id)a3 didStartSession:(BOOL)a4 withCallID:(unsigned int)a5 error:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  BOOL v8 = a4;
  uint64_t v36 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int curCallID = self->super.curCallID;
      *(_DWORD *)buf = 136316418;
      uint64_t v25 = v10;
      __int16 v26 = 2080;
      __int16 v27 = "-[GKVoiceChatServiceFocus videoConference:didStartSession:withCallID:error:]";
      __int16 v28 = 1024;
      int v29 = 739;
      __int16 v30 = 1024;
      int v31 = v7;
      __int16 v32 = 1024;
      unsigned int v33 = curCallID;
      __int16 v34 = 1024;
      BOOL v35 = curCallID == v7;
      _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d videoConference: didStartWithCallID:%d == %d ? %d", buf, 0x2Eu);
    }
  }
  [(NSRecursiveLock *)self->super.stateLock lock];
  id v13 = [(GKVoiceChatServiceFocus *)self dictionaryForCallID:v7 isIncomingDictonary:0];
  if (v13)
  {
    __int16 v14 = v13;
    id v15 = -[GKVoiceChatServiceFocus dictionaryForNonce:participantID:isIncomingDictonary:](self, "dictionaryForNonce:participantID:isIncomingDictonary:", [v13 nonce], objc_msgSend(v13, "participantID"), 1);
    if (v8)
    {
      -[GKVoiceChatServicePrivate informClientVoiceChatDidStart:](self, "informClientVoiceChatDidStart:", [v14 participantID]);
    }
    else
    {
      if (v15) {
        [(NSMutableArray *)self->incomingCallDictList removeObject:v15];
      }
      [(NSMutableArray *)self->outgoingCallDictList removeObject:v14];
      if (a6)
      {
        v22[0] = @"participantID";
        v22[1] = @"error";
        v23[0] = [v14 participantID];
        v23[1] = a6;
        long long v16 = NSDictionary;
        long long v17 = v23;
        long long v18 = v22;
        uint64_t v19 = 2;
      }
      else
      {
        uint64_t v21 = objc_msgSend(v14, "participantID", @"participantID");
        long long v16 = NSDictionary;
        long long v17 = &v21;
        long long v18 = &v20;
        uint64_t v19 = 1;
      }
      -[GKVoiceChatServicePrivate informClientVoiceChatDidNotStart:](self, "informClientVoiceChatDidNotStart:", [v16 dictionaryWithObjects:v17 forKeys:v18 count:v19]);
      [(GKVoiceChatServicePrivate *)self resetState];
    }
  }
  [(NSRecursiveLock *)self->super.stateLock unlock];
}

- (void)videoConference:(id)a3 didStopWithCallID:(unsigned int)a4 error:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v40 = *MEMORY[0x263EF8340];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v9 = (os_log_t *)MEMORY[0x263F21098];
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int curCallID = self->super.curCallID;
      *(_DWORD *)buf = 136316418;
      uint64_t v31 = v10;
      __int16 v32 = 2080;
      unsigned int v33 = "-[GKVoiceChatServiceFocus videoConference:didStopWithCallID:error:]";
      __int16 v34 = 1024;
      int v35 = 770;
      __int16 v36 = 1024;
      *(_DWORD *)v37 = v6;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = curCallID;
      __int16 v38 = 1024;
      BOOL v39 = curCallID == v6;
      _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d videoConference: didStopWithCallID:%d == %d ? %d", buf, 0x2Eu);
    }
  }
  [(NSRecursiveLock *)self->super.stateLock lock];
  id v13 = [(GKVoiceChatServiceFocus *)self dictionaryForCallID:v6 isIncomingDictonary:0];
  if (v13)
  {
    __int16 v14 = v13;
    id v15 = -[GKVoiceChatServiceFocus dictionaryForNonce:participantID:isIncomingDictonary:](self, "dictionaryForNonce:participantID:isIncomingDictonary:", [v13 nonce], objc_msgSend(v13, "participantID"), 1);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      long long v17 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        if (v15) {
          long long v18 = (const char *)objc_msgSend((id)objc_msgSend(v15, "description"), "UTF8String");
        }
        else {
          long long v18 = "<nil>";
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v31 = v16;
        __int16 v32 = 2080;
        unsigned int v33 = "-[GKVoiceChatServiceFocus videoConference:didStopWithCallID:error:]";
        __int16 v34 = 1024;
        int v35 = 782;
        __int16 v36 = 2080;
        *(void *)v37 = v18;
        _os_log_impl(&dword_221563000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d didStopWithCallID:inDict = %s", buf, 0x26u);
      }
    }
    if (v15) {
      [(NSMutableArray *)self->incomingCallDictList removeObject:v15];
    }
    [(NSMutableArray *)self->outgoingCallDictList removeObject:v14];
    if (-[NSString isEqualToString:](self->currentFocus, "isEqualToString:", [v14 participantID]))
    {
      [(VideoConference *)self->super.conf setCurrentFocus:0];

      self->currentFocus = 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        if ([v14 participantID]) {
          uint64_t v21 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "participantID"), "description"), "UTF8String");
        }
        else {
          uint64_t v21 = "<nil>";
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v31 = v19;
        __int16 v32 = 2080;
        unsigned int v33 = "-[GKVoiceChatServiceFocus videoConference:didStopWithCallID:error:]";
        __int16 v34 = 1024;
        int v35 = 795;
        __int16 v36 = 2080;
        *(void *)v37 = v21;
        _os_log_impl(&dword_221563000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d didStopWithCallID: outDict participantID %s", buf, 0x26u);
      }
    }
    if (a5)
    {
      v28[0] = @"participantID";
      v28[1] = @"error";
      v29[0] = [v14 participantID];
      v29[1] = a5;
      uint64_t v22 = NSDictionary;
      __int16 v23 = v29;
      int v24 = v28;
      uint64_t v25 = 2;
    }
    else
    {
      uint64_t v27 = objc_msgSend(v14, "participantID", @"participantID");
      uint64_t v22 = NSDictionary;
      __int16 v23 = &v27;
      int v24 = &v26;
      uint64_t v25 = 1;
    }
    -[GKVoiceChatServiceFocus performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_informClientVoiceChatDidStop_, [v22 dictionaryWithObjects:v23 forKeys:v24 count:v25], 0);
    [(GKVoiceChatServicePrivate *)self resetState];
  }
  [(NSRecursiveLock *)self->super.stateLock unlock];
}

- (void)localVideoLayer
{
  return 0;
}

- (void)remoteVideoLayer
{
  return 0;
}

- (double)localFramerate
{
  return 0.0;
}

- (double)localBitrate
{
  return 0.0;
}

- (double)remoteFramerate
{
  return 0.0;
}

- (double)remoteBitrate
{
  return 0.0;
}

- (id)localDisplayNameForCallID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  [(NSRecursiveLock *)self->super.stateLock lock];
  id v5 = [(GKVoiceChatServiceFocus *)self dictionaryForCallID:v3 isIncomingDictonary:0];
  [(NSRecursiveLock *)self->super.stateLock unlock];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (v5) {
        BOOL v8 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
      }
      else {
        BOOL v8 = "<nil>";
      }
      int v10 = 136315906;
      uint64_t v11 = v6;
      __int16 v12 = 2080;
      id v13 = "-[GKVoiceChatServiceFocus localDisplayNameForCallID:]";
      __int16 v14 = 1024;
      int v15 = 854;
      __int16 v16 = 2080;
      long long v17 = v8;
      _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d localDisplayNameForCallID: outDict = %s", (uint8_t *)&v10, 0x26u);
    }
  }
  if ([v5 localVCPartyID]) {
    return (id)[v5 localVCPartyID];
  }
  else {
    return (id)[v5 fromParticipantID];
  }
}

- (id)remoteDisplayNameForCallID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  [(NSRecursiveLock *)self->super.stateLock lock];
  id v5 = [(GKVoiceChatServiceFocus *)self dictionaryForCallID:v3 isIncomingDictonary:0];
  [(NSRecursiveLock *)self->super.stateLock unlock];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (v5) {
        BOOL v8 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
      }
      else {
        BOOL v8 = "<nil>";
      }
      int v10 = 136315906;
      uint64_t v11 = v6;
      __int16 v12 = 2080;
      id v13 = "-[GKVoiceChatServiceFocus remoteDisplayNameForCallID:]";
      __int16 v14 = 1024;
      int v15 = 866;
      __int16 v16 = 2080;
      long long v17 = v8;
      _os_log_impl(&dword_221563000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d remoteDisplayNameForCallID: outDict = %s", (uint8_t *)&v10, 0x26u);
    }
  }
  if ([v5 remoteVCPartyID]) {
    return (id)[v5 remoteVCPartyID];
  }
  else {
    return (id)[v5 participantID];
  }
}

- (BOOL)isAudioPausedToParticipantID:(id)a3
{
  [(NSRecursiveLock *)self->super.stateLock lock];
  uint64_t v5 = objc_msgSend(-[GKVoiceChatServiceFocus openOutgoingDictionaryForParticipantID:](self, "openOutgoingDictionaryForParticipantID:", a3), "callID");
  uint64_t v6 = self->super.conf;
  [(NSRecursiveLock *)self->super.stateLock unlock];
  LOBYTE(v5) = [(VideoConference *)self->super.conf shouldSendAudioForCallID:v5];

  return v5 ^ 1;
}

- (void)pauseAudio:(BOOL)a3 toParticipantID:(id)a4
{
  BOOL v5 = a3;
  [(NSRecursiveLock *)self->super.stateLock lock];
  id v7 = [(GKVoiceChatServiceFocus *)self openOutgoingDictionaryForParticipantID:a4];
  BOOL v8 = self->super.conf;
  uint64_t v9 = [v7 callID];
  [(NSRecursiveLock *)self->super.stateLock unlock];

  conf = self->super.conf;
  [(VideoConference *)conf setSendAudio:!v5 forCallID:v9];
}

- (NSString)currentFocus
{
  return self->currentFocus;
}

@end