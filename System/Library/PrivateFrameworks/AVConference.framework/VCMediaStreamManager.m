@interface VCMediaStreamManager
+ (id)defaultManager;
+ (void)addNSError:(id)a3 toXPCArgumentDictionary:(id)a4;
- (BOOL)addSyncSourceToVideoStreamConfig:(id)a3 sourceStreamToken:(int64_t)a4 error:(id *)a5;
- (VCMediaStreamManager)allocWithZone:(_NSZone *)a3;
- (VCMediaStreamManager)init;
- (id)textStreamWithStreamToken:(int64_t)a3;
- (id)videoStreamWithSyncToken:(int64_t)a3;
- (unint64_t)retainCount;
- (void)cleanupStreamSyncSourceForVideoStream:(id)a3 andAudioStream:(id)a4;
- (void)dealloc;
- (void)deregisterBlocksForService;
- (void)pauseStreams:(BOOL)a3;
- (void)registerBlocksForService;
- (void)stopStream:(id)a3;
- (void)vcMediaStream:(id)a3 didReceiveDTMFEventWithDigit:(char)a4;
- (void)vcMediaStream:(id)a3 didReceiveRTCPPackets:(id)a4;
- (void)vcMediaStream:(id)a3 didReceiveTTYCharacter:(unsigned __int16)a4;
- (void)vcMediaStream:(id)a3 didReceiveText:(id)a4;
- (void)vcMediaStream:(id)a3 didUpdateVideoConfiguration:(BOOL)a4 error:(id)a5 dictionary:(id)a6;
- (void)vcMediaStream:(id)a3 downlinkQualityDidChange:(id)a4;
- (void)vcMediaStream:(id)a3 uplinkQualityDidChange:(id)a4;
- (void)vcMediaStreamDidInterruptionBegin:(id)a3;
- (void)vcMediaStreamDidInterruptionEnd:(id)a3;
- (void)vcMediaStreamDidRTCPTimeOut:(id)a3;
- (void)vcMediaStreamDidRTPTimeOut:(id)a3;
- (void)vcMediaStreamDidRecoverFromRTCPTimeOut:(id)a3;
- (void)vcMediaStreamServerDidDie:(id)a3;
@end

@implementation VCMediaStreamManager

+ (id)defaultManager
{
  if (defaultManager_onceToken_1 != -1) {
    dispatch_once(&defaultManager_onceToken_1, &__block_literal_global_24);
  }
  return (id)_vcStreamManagerManager;
}

void __38__VCMediaStreamManager_defaultManager__block_invoke()
{
  if (!_vcStreamManagerManager) {
    _vcStreamManagerManager = objc_alloc_init(VCMediaStreamManager);
  }
}

+ (void)addNSError:(id)a3 toXPCArgumentDictionary:(id)a4
{
  if (a3)
  {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    if ([a3 domain]) {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "domain"), @"ERROR_DOMAIN");
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "code")), @"ERROR_CODE");
    if ([a3 userInfo]) {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "userInfo"), @"ERROR_USERINFO");
    }
    [a4 setObject:v6 forKeyedSubscript:@"vcMediaStreamError"];
  }
}

- (VCMediaStreamManager)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCMediaStreamManager;
  v2 = [(VCMediaStreamManager *)&v5 init];
  if (v2)
  {
    v2->streamArray = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    v2->_vcMomentsCollectorDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->xpcQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCMediaStreamManager.xpcQueue", 0, CustomRootQueue);
    pthread_mutex_init(&v2->stateLock, 0);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCMediaStreamManager *)self deregisterBlocksForService];

  dispatch_release((dispatch_object_t)self->xpcQueue);
  pthread_mutex_destroy(&self->stateLock);
  v3.receiver = self;
  v3.super_class = (Class)VCMediaStreamManager;
  [(VCMediaStreamManager *)&v3 dealloc];
}

- (VCMediaStreamManager)allocWithZone:(_NSZone *)a3
{
  return (VCMediaStreamManager *)_vcStreamManagerManager;
}

- (unint64_t)retainCount
{
  return -1;
}

- (void)pauseStreams:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v5 = (void *)MEMORY[0x1E4E589F0](self, a2);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v6;
      __int16 v13 = 2080;
      v14 = "-[VCMediaStreamManager pauseStreams:]";
      __int16 v15 = 1024;
      int v16 = 125;
      __int16 v17 = 1024;
      BOOL v18 = v3;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d isPause[%d] begin", buf, 0x22u);
    }
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__VCMediaStreamManager_pauseStreams___block_invoke;
  v9[3] = &unk_1E6DB3DF0;
  v9[4] = self;
  BOOL v10 = v3;
  dispatch_async(global_queue, v9);
}

void __37__VCMediaStreamManager_pauseStreams___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 8));
  id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 72) copy];
  pthread_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 8));
  size_t v3 = [v2 count];
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__VCMediaStreamManager_pauseStreams___block_invoke_2;
  block[3] = &unk_1E6DB5FD0;
  block[4] = v2;
  char v6 = *(unsigned char *)(a1 + 40);
  dispatch_apply(v3, global_queue, block);
}

uint64_t __37__VCMediaStreamManager_pauseStreams___block_invoke_2(uint64_t a1, uint64_t a2)
{
  size_t v3 = (void *)[*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);

  return [v3 setPause:v4];
}

- (void)vcMediaStreamServerDidDie:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    char v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      uint64_t v12 = "-[VCMediaStreamManager vcMediaStreamServerDidDie:]";
      __int16 v13 = 1024;
      int v14 = 150;
      __int16 v15 = 2048;
      id v16 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Server process died reported by stream=%p", buf, 0x26u);
    }
  }
  xpcQueue = self->xpcQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__VCMediaStreamManager_vcMediaStreamServerDidDie___block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = self;
  dispatch_async(xpcQueue, block);
}

uint64_t __50__VCMediaStreamManager_vcMediaStreamServerDidDie___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v1 = *(void **)(*(void *)(a1 + 32) + 72);
  uint64_t result = [v1 countByEnumeratingWithState:&v7 objects:v6 count:16];
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamDidServerDie", 0, *(void *)(*((void *)&v7 + 1) + 8 * v5++));
      }
      while (v3 != v5);
      uint64_t result = [v1 countByEnumeratingWithState:&v7 objects:v6 count:16];
      uint64_t v3 = result;
    }
    while (result);
  }
  return result;
}

- (void)vcMediaStreamDidInterruptionBegin:(id)a3
{
  id v4 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v4 sendMessageAsync:"vcMediaStreamDidInterruptionBegin" arguments:0 context:a3];
}

- (void)vcMediaStreamDidInterruptionEnd:(id)a3
{
  id v4 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v4 sendMessageAsync:"vcMediaStreamDidInterruptionEnd" arguments:0 context:a3];
}

- (void)vcMediaStream:(id)a3 didReceiveDTMFEventWithDigit:(char)a4
{
  uint64_t v4 = a4;
  id v6 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v7 = (id)objc_msgSend(v6, "initWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithChar:", v4), @"vcMediaStreamDTMFDigitReceived", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamDTMFDigitReceived", v7, a3);
}

- (void)vcMediaStream:(id)a3 didReceiveTTYCharacter:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = objc_alloc(MEMORY[0x1E4F1CA60]);
  id v7 = (id)objc_msgSend(v6, "initWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", v4), @"vcMediaStreamTTYCharacterReceived", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamTTYCharacterReceived", v7, a3);
}

- (void)vcMediaStream:(id)a3 didReceiveText:(id)a4
{
  id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", a4, @"vcMediaStreamTextReceived", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamTextReceived", v5, a3);
}

- (void)vcMediaStreamDidRTPTimeOut:(id)a3
{
  id v4 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v4 sendMessageAsync:"vcMediaStreamRTPPacketTimeout" arguments:0 context:a3];
}

- (void)vcMediaStreamDidRTCPTimeOut:(id)a3
{
  id v4 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v4 sendMessageAsync:"vcMediaStreamRTCPPacketTimeout" arguments:0 context:a3];
}

- (void)vcMediaStreamDidRecoverFromRTCPTimeOut:(id)a3
{
  id v4 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v4 sendMessageAsync:"vcMediaStreamDidRecoverFromRTCPTimeout" arguments:0 context:a3];
}

- (void)vcMediaStream:(id)a3 didReceiveRTCPPackets:(id)a4
{
  id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", a4, @"vcMediaStreamRTCPPackets", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamRTCPPacketsReceived", v5, a3);
}

- (void)vcMediaStream:(id)a3 downlinkQualityDidChange:(id)a4
{
  id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", a4, @"vcMediaStreamDownlinkQualityInfo", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamDownlinkQualityDidChange", v5, a3);
}

- (void)vcMediaStream:(id)a3 uplinkQualityDidChange:(id)a4
{
  id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", a4, @"vcMediaStreamUplinkQualityInfo", 0);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamUplinkQualityDidChange", v5, a3);
}

- (void)vcMediaStream:(id)a3 didUpdateVideoConfiguration:(BOOL)a4 error:(id)a5 dictionary:(id)a6
{
  BOOL v8 = a4;
  id v10 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v11 = objc_msgSend(v10, "initWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithBool:", v8), @"vcMediaStreamDidUpdateVideoConfiguration", 0);
  +[VCMediaStreamManager addNSError:a5 toXPCArgumentDictionary:v11];
  if (v8)
  {
    if (a6)
    {
      [v11 setObject:a6 forKeyedSubscript:@"vcMediaStreamUpdatedVideoConfiguration"];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaStreamManager vcMediaStream:didUpdateVideoConfiguration:error:dictionary:]();
      }
    }
  }
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamDidUpdateVideoConfiguration", v11, a3);
}

- (id)videoStreamWithSyncToken:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  streamArray = self->streamArray;
  uint64_t v5 = [(NSMutableArray *)streamArray countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v15;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v15 != v7) {
      objc_enumerationMutation(streamArray);
    }
    long long v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v9 conformsToProtocol:&unk_1F3DF1BB0])
      {
        uint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "defaultStreamConfig"), "syncSource");
        if (v10)
        {
          uint64_t v11 = (void *)v10;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 streamToken] == a3) {
            return v9;
          }
        }
      }
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)streamArray countByEnumeratingWithState:&v14 objects:v13 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)cleanupStreamSyncSourceForVideoStream:(id)a3 andAudioStream:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [a3 stopSynchronization];
    objc_msgSend((id)objc_msgSend(a3, "defaultStreamConfig"), "setSyncSource:", 0);
    [a4 setMomentsCollectorDelegate:0];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (a4) {
          uint64_t v8 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
        }
        else {
          uint64_t v8 = "<nil>";
        }
        int v9 = 136316162;
        uint64_t v10 = v6;
        __int16 v11 = 2080;
        uint64_t v12 = "-[VCMediaStreamManager cleanupStreamSyncSourceForVideoStream:andAudioStream:]";
        __int16 v13 = 1024;
        int v14 = 278;
        __int16 v15 = 2080;
        long long v16 = v8;
        __int16 v17 = 2080;
        uint64_t v18 = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Removed stream=%s as sync source for stream=%s delegates", (uint8_t *)&v9, 0x30u);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaStreamManager cleanupStreamSyncSourceForVideoStream:andAudioStream:]();
    }
  }
}

- (id)textStreamWithStreamToken:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  streamArray = self->streamArray;
  uint64_t v5 = [(NSMutableArray *)streamArray countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v13;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v13 != v7) {
      objc_enumerationMutation(streamArray);
    }
    int v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 streamToken] == a3) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)streamArray countByEnumeratingWithState:&v12 objects:v11 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (BOOL)addSyncSourceToVideoStreamConfig:(id)a3 sourceStreamToken:(int64_t)a4 error:(id *)a5
{
  uint64_t v8 = self;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  streamArray = self->streamArray;
  uint64_t v10 = [(NSMutableArray *)streamArray countByEnumeratingWithState:&v33 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    v21 = v8;
    char v12 = 0;
    uint64_t v13 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(streamArray);
        }
        long long v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && [v15 conformsToProtocol:&unk_1F3DE0EB8]
          && [v15 streamToken] == a4)
        {
          [a3 setSyncSource:v15];
          char v12 = 1;
        }
      }
      uint64_t v11 = [(NSMutableArray *)streamArray countByEnumeratingWithState:&v33 objects:v32 count:16];
    }
    while (v11);
    uint64_t v8 = v21;
    if (v12) {
      return 1;
    }
  }
  if ((VCMediaStreamManager *)objc_opt_class() == v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaStreamManager addSyncSourceToVideoStreamConfig:sourceStreamToken:error:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[VCMediaStreamManager addSyncSourceToVideoStreamConfig:sourceStreamToken:error:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = (__CFString *)[(VCMediaStreamManager *)v8 performSelector:sel_logPrefix];
    }
    else {
      __int16 v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      v20 = *MEMORY[0x1E4F47A50];
      if (IsOSFaultDisabled)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v23 = v18;
          __int16 v24 = 2080;
          v25 = "-[VCMediaStreamManager addSyncSourceToVideoStreamConfig:sourceStreamToken:error:]";
          __int16 v26 = 1024;
          int v27 = 307;
          __int16 v28 = 2112;
          v29 = v17;
          __int16 v30 = 2048;
          v31 = v8;
          _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed configure stream synchronization", buf, 0x30u);
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v23 = v18;
        __int16 v24 = 2080;
        v25 = "-[VCMediaStreamManager addSyncSourceToVideoStreamConfig:sourceStreamToken:error:]";
        __int16 v26 = 1024;
        int v27 = 307;
        __int16 v28 = 2112;
        v29 = v17;
        __int16 v30 = 2048;
        v31 = v8;
        _os_log_fault_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_FAULT, " [%s] %s:%d %@(%p) Failed configure stream synchronization", buf, 0x30u);
      }
    }
  }
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a5, 32016, 105, objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamManager.m", 311), @"Invalid synchronization source token", @"Failed to set synchronization source");
  return 0;
}

- (void)stopStream:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->xpcQueue);
  [a3 stop];
  id v4 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v4 sendMessageAsync:"vcMediaStreamDidStopConnection" arguments:0 context:a3];
}

- (void)registerBlocksForService
{
  v15[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__VCMediaStreamManager_registerBlocksForService__block_invoke;
  v15[3] = &unk_1E6DB5478;
  v15[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamInitializeAudio", v15, self->xpcQueue);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__VCMediaStreamManager_registerBlocksForService__block_invoke_177;
  v14[3] = &unk_1E6DB5FF8;
  v14[4] = v3;
  v14[5] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcVirtualTTYDeviceInitialize", v14, self->xpcQueue);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__VCMediaStreamManager_registerBlocksForService__block_invoke_180;
  v13[3] = &unk_1E6DB5FF8;
  v13[4] = v3;
  v13[5] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcVirtualRTTDeviceInitialize", v13, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcVirtualTTYDeviceSendCharacter", &__block_literal_global_186, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcVirtualTTYDeviceSendText", &__block_literal_global_189, self->xpcQueue);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__VCMediaStreamManager_registerBlocksForService__block_invoke_3;
  v12[3] = &unk_1E6DB5478;
  v12[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcVirtualTTYDeviceTerminate", v12, self->xpcQueue);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__VCMediaStreamManager_registerBlocksForService__block_invoke_4;
  v11[3] = &unk_1E6DB5478;
  v11[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamTerminateAudio", v11, self->xpcQueue);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__VCMediaStreamManager_registerBlocksForService__block_invoke_198;
  v10[3] = &unk_1E6DB5FF8;
  v10[4] = v3;
  v10[5] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetSessionConfig", v10, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSendDTMFEvent", &__block_literal_global_229, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamStopSendDTMFEvent", &__block_literal_global_233, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetVolume", &__block_literal_global_237, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamStartConference", &__block_literal_global_244, self->xpcQueue);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_250;
  v9[3] = &unk_1E6DB5478;
  v9[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamStopConference", v9, self->xpcQueue);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__VCMediaStreamManager_registerBlocksForService__block_invoke_3_252;
  v8[3] = &unk_1E6DB5478;
  v8[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamStartSynchronization", v8, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetPause", &__block_literal_global_260, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamUpdateVideoConfig", &__block_literal_global_275, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetStreamDirection", &__block_literal_global_279, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetJitterBufferMode", &__block_literal_global_286, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetRTCPEnabled", &__block_literal_global_293, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetRTPTimeoutEnabled", &__block_literal_global_300, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetRTCPTimeoutEnabled", &__block_literal_global_307, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetRTPTimeoutInterval", &__block_literal_global_314, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetRTCPTimeoutInterval", &__block_literal_global_321, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetRTCPSendInterval", &__block_literal_global_328, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamGetInputFrequencyMeteringEnabled", &__block_literal_global_335, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetInputFrequencyMeteringEnabled", &__block_literal_global_342, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamGetOutputFrequencyMeteringEnabled", &__block_literal_global_346, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamSetOutputFrequencyMeteringEnabled", &__block_literal_global_353, self->xpcQueue);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__VCMediaStreamManager_registerBlocksForService__block_invoke_355;
  v7[3] = &unk_1E6DB5478;
  v7[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamInitializeVideo", v7, self->xpcQueue);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__VCMediaStreamManager_registerBlocksForService__block_invoke_358;
  v6[3] = &unk_1E6DB5478;
  v6[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamTerminateVideo", v6, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamRequestLastDecodedFrame", &__block_literal_global_362, self->xpcQueue);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_364;
  v5[3] = &unk_1E6DB5478;
  v5[4] = self;
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "registerBlockForService:block:queue:", "vcMediaStreamInitializeText", v5, self->xpcQueue);
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton", MEMORY[0x1E4F143A8], 3221225472, __48__VCMediaStreamManager_registerBlocksForService__block_invoke_367, &unk_1E6DB5478, self), "registerBlockForService:block:queue:", "vcMediaStreamTerminateText", &v4, self->xpcQueue);
}

id __48__VCMediaStreamManager_registerBlocksForService__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v7 = [a2 objectForKeyedSubscript:@"vcMediaStreamDictionary"];
  uint64_t v8 = -[VCAudioStream initWithClientPid:]([VCAudioStream alloc], "initWithClientPid:", objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CLIENTPID"), "intValue"));
  [*(id *)(*(void *)(a1 + 32) + 72) addObject:v8];
  [(VCMediaStream *)v8 setDelegate:*(void *)(a1 + 32)];
  [(VCMediaStream *)v8 setDelegateFunctions:_VCMediaStreamManager_UpdateFrequencyLevel];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v17 = v9;
      __int16 v18 = 2080;
      uint64_t v19 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 346;
      __int16 v22 = 2048;
      uint64_t v23 = v8;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMediaStream allocated new VCAudioStream %p", buf, 0x26u);
    }
  }
  uint64_t v11 = -[VCAudioStream setLocalParticipantInfo:networkSockets:withError:](v8, "setLocalParticipantInfo:networkSockets:withError:", v7, [a2 objectForKeyedSubscript:@"USERXPCARGUMENTS"], a3);
  id v6 = 0;
  if (v8)
  {
    uint64_t v12 = v11;
    if (v11)
    {
      v15[0] = v8;
      v15[1] = objc_msgSend(NSNumber, "numberWithInteger:", -[VCMediaStream streamToken](v8, "streamToken", @"CONTEXT", @"vcMediaStreamToken"));
      v14[2] = @"vcMediaStreamTokenUplink";
      v15[2] = objc_msgSend(NSNumber, "numberWithInteger:", -[VCMediaStream streamTokenUplink](v8, "streamTokenUplink"));
      v14[3] = @"vcMediaStreamTokenDownlink";
      v14[4] = @"vcMediaStreamStreamCapabilities";
      v15[3] = objc_msgSend(NSNumber, "numberWithInteger:", -[VCMediaStream streamTokenDownlink](v8, "streamTokenDownlink"));
      v15[4] = v12;
      id v6 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];
    }
  }

  return v6;
}

id __48__VCMediaStreamManager_registerBlocksForService__block_invoke_177(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) strong];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v6 = (int)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcMediaStreamDictionary"), "intValue");
  uint64_t v7 = -[VCVirtualTTYDevice initWithMode:clientPid:]([VCVirtualTTYDevice alloc], "initWithMode:clientPid:", v6, objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CLIENTPID"), "intValue"));
  [*(id *)(*(void *)(a1 + 40) + 72) addObject:v7];
  [(VCVirtualTTYDevice *)v7 setDelegate:v4];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v13 = v8;
      __int16 v14 = 2080;
      long long v15 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 374;
      __int16 v18 = 2048;
      uint64_t v19 = v7;
      __int16 v20 = 2048;
      uint64_t v21 = v6;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMediaStream allocated new virtual TTY device %p with mode %ld", buf, 0x30u);
    }
  }
  if (v7) {
    id v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"CONTEXT", 0);
  }
  else {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  }
  id v5 = v10;

  return v5;
}

id __48__VCMediaStreamManager_registerBlocksForService__block_invoke_180(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[*(id *)(a1 + 32) strong];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v6 = objc_msgSend(v4, "textStreamWithStreamToken:", (int)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcMediaStreamToken"), "intValue"));
    v12[0] = _VCMediaStreamManager_UpdateFrequencyLevel;
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      uint64_t v8 = -[VCVirtualTextDevice initWithSendDelegate:clientPid:delegate:delegateFunctions:delegateQueue:]([VCVirtualTextDevice alloc], "initWithSendDelegate:clientPid:delegate:delegateFunctions:delegateQueue:", v6, objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CLIENTPID"), "intValue"), v4, v12, *(void *)(*(void *)(a1 + 40) + 80));
      if (v8)
      {
        uint64_t v9 = v8;
        [v7 setReceiveDelegate:v8];
        [*(id *)(*(void *)(a1 + 40) + 72) addObject:v9];
        id v10 = objc_alloc(MEMORY[0x1E4F1C9E8]);
        id v5 = (id)objc_msgSend(v10, "initWithObjectsAndKeys:", v9, @"CONTEXT", 0, v12[0]);
LABEL_13:

        return v5;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __48__VCMediaStreamManager_registerBlocksForService__block_invoke_180_cold_2();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_180_cold_1();
      }
    }
    id v5 = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    uint64_t v9 = 0;
    goto LABEL_13;
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_184(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), "sendCharacter:", (unsigned __int16)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"vcMediaStreamDictionary"), "intValue"));
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), "sendText:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcMediaStreamDictionary"));
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_3(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v4 = objc_msgSend(v5, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"CONTEXT", 0);
  }
  uint64_t v6 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [v6 stop];
    [*(id *)(*(void *)(a1 + 32) + 72) removeObject:v6];
  }
  return v4;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a2 objectForKeyedSubscript:@"CLIENTDIED"];
  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v5 = objc_msgSend(v6, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"CONTEXT", 0);
  }
  uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v14 = v8;
        __int16 v15 = 2080;
        __int16 v16 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke_4";
        __int16 v17 = 1024;
        int v18 = 470;
        __int16 v19 = 2048;
        __int16 v20 = v7;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMediaStream releasing old VCAudioStream[%p]", buf, 0x26u);
      }
    }
    uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "videoStreamWithSyncToken:", objc_msgSend(v7, "streamToken"));
    if (v4) {
      uint64_t v11 = [MEMORY[0x1E4F28C58] AVConferenceServiceError:32039 detailCode:0 description:@"Client Died"];
    }
    else {
      uint64_t v11 = 0;
    }
    [v7 stopWithError:v11];
    [*(id *)(a1 + 32) cleanupStreamSyncSourceForVideoStream:v10 andAudioStream:v7];
    [v7 startDeallocTimer];
    [*(id *)(*(void *)(a1 + 32) + 72) removeObject:v7];
  }
  return v5;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_198(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    id v6 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v7 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamDictionary"];
    uint64_t v8 = (void *)[*(id *)(a1 + 32) strong];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = off_1E6DB2FE8;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v10 = [+[VCDefaults sharedInstance] forceVideoStreamPayload];
        uint64_t v11 = v10;
        if (v10 == 123 || v10 == 100)
        {
          uint64_t v12 = (void *)[v7 mutableCopy];
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", v11)), @"vcMediaStreamTXCodecType");
          objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", v11)), @"vcMediaStreamRXCodecType");
          uint64_t v13 = [[VCVideoStreamConfig alloc] initWithClientDictionary:v12];
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v14 = VRTraceErrorLogLevelToCSTR();
            __int16 v15 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              uint64_t v38 = v14;
              __int16 v39 = 2080;
              v40 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
              __int16 v41 = 1024;
              int v42 = 503;
              __int16 v43 = 1024;
              LODWORD(v44) = v11;
              _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing video payload to %d", buf, 0x22u);
            }
          }
        }
        else
        {
          uint64_t v13 = [[VCVideoStreamConfig alloc] initWithClientDictionary:v7];
        }
        if ([v7 objectForKeyedSubscript:@"vcMediaStreamSyncStreamToken"]
          && objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", @"vcMediaStreamSyncStreamToken"), "integerValue")&& (objc_msgSend(v8, "addSyncSourceToVideoStreamConfig:sourceStreamToken:error:", v13, objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", @"vcMediaStreamSyncStreamToken"), "integerValue"), a3) & 1) == 0)
        {
          goto LABEL_16;
        }
        goto LABEL_14;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (objc_opt_class() == *(void *)(a1 + 40))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
          {
            VRTraceErrorLogLevelToCSTR();
            if (VRTraceIsOSFaultDisabled())
            {
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                __48__VCMediaStreamManager_registerBlocksForService__block_invoke_198_cold_3();
              }
            }
            else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
            {
              __48__VCMediaStreamManager_registerBlocksForService__block_invoke_198_cold_4();
            }
          }
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            __int16 v17 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
          }
          else {
            __int16 v17 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
          {
            uint64_t v23 = VRTraceErrorLogLevelToCSTR();
            char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
            v25 = *MEMORY[0x1E4F47A50];
            if (IsOSFaultDisabled)
            {
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
              {
                uint64_t v26 = *(void *)(a1 + 40);
                int v27 = (objc_class *)objc_opt_class();
                *(_DWORD *)buf = 136316418;
                uint64_t v38 = v23;
                __int16 v39 = 2080;
                v40 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
                __int16 v41 = 1024;
                int v42 = 522;
                __int16 v43 = 2112;
                v44 = v17;
                __int16 v45 = 2048;
                uint64_t v46 = v26;
                __int16 v47 = 2080;
                Name = class_getName(v27);
                _os_log_error_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected stream type [%s]", buf, 0x3Au);
              }
            }
            else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
            {
              uint64_t v33 = *(void *)(a1 + 40);
              long long v34 = (objc_class *)objc_opt_class();
              *(_DWORD *)buf = 136316418;
              uint64_t v38 = v23;
              __int16 v39 = 2080;
              v40 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
              __int16 v41 = 1024;
              int v42 = 522;
              __int16 v43 = 2112;
              v44 = v17;
              __int16 v45 = 2048;
              uint64_t v46 = v33;
              __int16 v47 = 2080;
              Name = class_getName(v34);
              _os_log_fault_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_FAULT, " [%s] %s:%d %@(%p) Unexpected stream type [%s]", buf, 0x3Au);
            }
          }
        }
        uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamManager.m", 526);
        v29 = @"Unexpected stream type";
        __int16 v30 = @"setStreamConfig called on an unsupported object";
        uint64_t v31 = a3;
        uint64_t v32 = 32016;
        goto LABEL_56;
      }
      uint64_t v9 = off_1E6DB3070;
    }
    uint64_t v13 = (VCVideoStreamConfig *)[objc_alloc(*v9) initWithClientDictionary:v7];
LABEL_14:
    if (v13)
    {
      long long v36 = v13;
      objc_msgSend(v6, "setStreamConfig:withError:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v36, 1), a3);
LABEL_16:

      return 0;
    }
    if (objc_opt_class() == *(void *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if (VRTraceIsOSFaultDisabled())
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __48__VCMediaStreamManager_registerBlocksForService__block_invoke_198_cold_1();
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          __48__VCMediaStreamManager_registerBlocksForService__block_invoke_198_cold_2();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v16 = (__CFString *)[*(id *)(a1 + 40) performSelector:sel_logPrefix];
      }
      else {
        __int16 v16 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        char v19 = VRTraceIsOSFaultDisabled();
        __int16 v20 = *MEMORY[0x1E4F47A50];
        if (v19)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            uint64_t v21 = *(void *)(a1 + 40);
            *(_DWORD *)buf = 136316162;
            uint64_t v38 = v18;
            __int16 v39 = 2080;
            v40 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
            __int16 v41 = 1024;
            int v42 = 534;
            __int16 v43 = 2112;
            v44 = v16;
            __int16 v45 = 2048;
            uint64_t v46 = v21;
            _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate stream config", buf, 0x30u);
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          uint64_t v22 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 136316162;
          uint64_t v38 = v18;
          __int16 v39 = 2080;
          v40 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
          __int16 v41 = 1024;
          int v42 = 534;
          __int16 v43 = 2112;
          v44 = v16;
          __int16 v45 = 2048;
          uint64_t v46 = v22;
          _os_log_fault_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_FAULT, " [%s] %s:%d %@(%p) Failed to allocate stream config", buf, 0x30u);
        }
      }
    }
    uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamManager.m", 538);
    v29 = @"Stream config allocation failure";
    __int16 v30 = @"Failed to allocate the stream configuration";
    uint64_t v31 = a3;
    uint64_t v32 = 32015;
LABEL_56:
    +[GKVoiceChatError getNSError:v31 code:v32 detailedCode:105 filePath:v28 description:v29 reason:v30];
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_227(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), "sendDTMFEvent:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcMediaStreamDictionary"));
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_231(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), "stopSendDTMFEvent");
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_3_235(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamDictionary"];
    if (v4)
    {
      objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"vcMediaStreamVolume"), "floatValue");
      objc_msgSend(v3, "setVolume:");
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_3_235_cold_1();
      }
    }
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_242(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = [v3 start];
    id v5 = objc_alloc(MEMORY[0x1E4F1CA60]);
    id v6 = objc_msgSend(v5, "initWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithBool:", v4 == 0), @"vcMediaStreamConnectionStarted", 0);
    +[VCMediaStreamManager addNSError:v4 toXPCArgumentDictionary:v6];
    objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamDidStartConnection", v6, v3);
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_250(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    if ([v4 conformsToProtocol:&unk_1F3DE0EB8])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(*(id *)(a1 + 32), "cleanupStreamSyncSourceForVideoStream:andAudioStream:", objc_msgSend(*(id *)(a1 + 32), "videoStreamWithSyncToken:", objc_msgSend(v4, "streamToken")), v4);
      }
    }
    [*(id *)(a1 + 32) stopStream:v4];
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_3_252(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    if ([v4 conformsToProtocol:&unk_1F3DE0EB8]
      && (id v5 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamToken"],
          long long v36 = 0u,
          long long v37 = 0u,
          long long v38 = 0u,
          long long v39 = 0u,
          id v6 = *(void **)(*(void *)(a1 + 32) + 72),
          (uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v35 count:16]) != 0))
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v37;
LABEL_5:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v36 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v11 conformsToProtocol:&unk_1F3DF1BB0])
          {
            uint64_t v12 = [v11 streamToken];
            if (v12 == [v5 integerValue]) {
              break;
            }
          }
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v35 count:16];
          if (v8) {
            goto LABEL_5;
          }
          goto LABEL_17;
        }
      }
      int v13 = [v11 startSynchronization:v4];
      objc_msgSend(v4, "setMomentsCollectorDelegate:", objc_msgSend(v11, "momentsCollectorDelegate"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7
        && (uint64_t v14 = VRTraceErrorLogLevelToCSTR(),
            __int16 v15 = *MEMORY[0x1E4F47A50],
            os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v24 = v14;
        __int16 v25 = 2080;
        uint64_t v26 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke_3";
        __int16 v27 = 1024;
        int v28 = 638;
        __int16 v29 = 2048;
        __int16 v30 = (const char *)v4;
        __int16 v31 = 2048;
        uint64_t v32 = v11;
        __int16 v33 = 2048;
        uint64_t v34 = [v11 momentsCollectorDelegate];
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMediaStream setMomentsCollectorDelegate for audioStream=%p: videostream=%p, delegate=%p", buf, 0x3Au);
        if ((v13 & 1) == 0) {
          goto LABEL_17;
        }
      }
      else if (!v13)
      {
        goto LABEL_17;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        uint64_t v21 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          if (v4) {
            uint64_t v22 = (const char *)objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
          }
          else {
            uint64_t v22 = "<nil>";
          }
          *(_DWORD *)buf = 136315906;
          uint64_t v24 = v20;
          __int16 v25 = 2080;
          uint64_t v26 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
          __int16 v27 = 1024;
          int v28 = 645;
          __int16 v29 = 2080;
          __int16 v30 = v22;
          _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s startSynchronization succeeded", buf, 0x26u);
        }
      }
      uint64_t v16 = 1;
    }
    else
    {
LABEL_17:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __48__VCMediaStreamManager_registerBlocksForService__block_invoke_3_252_cold_1();
        }
      }
      uint64_t v16 = 0;
    }
    id v17 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v18 = objc_msgSend(v17, "initWithObjectsAndKeys:", objc_msgSend(NSNumber, "numberWithBool:", v16), @"vcMediaStreamSynchronizationStarted", 0);
    objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", "vcMediaStreamDidStartSynchronization", v18, v4);
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_258(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamDictionary"];
    if (v4)
    {
      uint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"vcMediaStreamPauseState"), "BOOLValue");
      uint64_t v6 = [v3 setPause:v5];
      id v7 = objc_alloc(MEMORY[0x1E4F1CA60]);
      uint64_t v8 = [NSNumber numberWithBool:v6 == 0];
      uint64_t v9 = @"vcMediaStreamResumed";
      if (v5)
      {
        uint64_t v9 = @"vcMediaStreamPaused";
        uint64_t v10 = "vcMediaStreamDidPause";
      }
      else
      {
        uint64_t v10 = "vcMediaStreamDidResume";
      }
      uint64_t v11 = objc_msgSend(v7, "initWithObjectsAndKeys:", v8, v9, 0);
      +[VCMediaStreamManager addNSError:v6 toXPCArgumentDictionary:v11];
      objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "sendMessageAsync:arguments:context:", v10, v11, v3);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_258_cold_1();
      }
    }
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_273(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), "updateVideoConfig:", objc_msgSend(a2, "objectForKeyedSubscript:", @"vcMediaStreamDictionary"));
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_277(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamDictionary"];
    if (v4)
    {
      objc_msgSend(v3, "setStreamDirection:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"vcMediaStreamDirection"), "integerValue"));
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_277_cold_1();
      }
    }
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_284(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamDictionary"];
    if (v4)
    {
      objc_msgSend(v3, "setJitterBufferMode:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"vcMediaStreamJitterBufferMode"), "integerValue"));
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_284_cold_1();
      }
    }
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_291(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamDictionary"];
    if (v4)
    {
      objc_msgSend(v3, "setRtcpEnabled:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"vcMediaStreamRTCPEnabled"), "BOOLValue"));
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_291_cold_1();
      }
    }
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_298(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamDictionary"];
    if (v4)
    {
      objc_msgSend(v3, "setRtpTimeOutEnabled:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"vcMediaStreamRTPTimeoutEnabled"), "BOOLValue"));
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_298_cold_1();
      }
    }
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_305(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamDictionary"];
    if (v4)
    {
      objc_msgSend(v3, "setRtcpTimeOutEnabled:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"vcMediaStreamRTCPTimeoutEnabled"), "BOOLValue"));
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_305_cold_1();
      }
    }
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_312(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamDictionary"];
    if (v4)
    {
      objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"vcMediaStreamRTPTimeoutInterval"), "doubleValue");
      objc_msgSend(v3, "setRtpTimeOutInterval:");
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_312_cold_1();
      }
    }
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_319(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamDictionary"];
    if (v4)
    {
      objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"vcMediaStreamRTCPTimeoutInterval"), "doubleValue");
      objc_msgSend(v3, "setRtcpTimeOutInterval:");
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_319_cold_1();
      }
    }
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_326(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamDictionary"];
    if (v4)
    {
      objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"vcMediaStreamRTCPSendInterval"), "doubleValue");
      objc_msgSend(v3, "setRtcpSendInterval:");
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_326_cold_1();
      }
    }
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_333(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isFrequencyMeteringEnabled:", 0));
  return objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v5, @"vcMediaStreamInputFreqMeterEnabled", 0);
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_340(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamDictionary"];
    if (v4)
    {
      objc_msgSend(v3, "setFrequencyMeteringEnabled:meterType:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"vcMediaStreamInputFreqMeterEnabled"), "BOOLValue"), 0);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_340_cold_1();
      }
    }
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_344(uint64_t a1, void *a2)
{
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isFrequencyMeteringEnabled:", 1));
  return objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v5, @"vcMediaStreamOutputFreqMeterEnabled", 0);
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_351(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v3 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
    uint64_t v4 = (void *)[a2 objectForKeyedSubscript:@"vcMediaStreamDictionary"];
    if (v4)
    {
      objc_msgSend(v3, "setFrequencyMeteringEnabled:meterType:", objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"vcMediaStreamOutputFreqMeterEnabled"), "BOOLValue"), 1);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_351_cold_1();
      }
    }
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_355(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    return 0;
  }
  id v7 = objc_alloc_init(VCVideoStream);
  [*(id *)(*(void *)(a1 + 32) + 72) addObject:v7];
  [(VCMediaStream *)v7 setDelegate:*(void *)(a1 + 32)];
  [(VCMediaStream *)v7 setDelegateFunctions:_VCMediaStreamManager_UpdateFrequencyLevel];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v9 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v20 = v10;
      __int16 v21 = 2080;
      uint64_t v22 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
      __int16 v23 = 1024;
      int v24 = 879;
      __int16 v25 = 2048;
      uint64_t v26 = (uint64_t)v7;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMediaStream allocated new VCVideoStream %p", buf, 0x26u);
    }
  }
  uint64_t v12 = -[VCMediaStream setLocalParticipantInfo:networkSockets:withError:](v7, "setLocalParticipantInfo:networkSockets:withError:", [a2 objectForKeyedSubscript:@"vcMediaStreamDictionary"], objc_msgSend(a2, "objectForKeyedSubscript:", @"USERXPCARGUMENTS"), a3);
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[VCMediaStream streamToken](v7, "streamToken"));
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"CONTEXT", v13, @"vcMediaStreamToken", v12, @"vcMediaStreamStreamCapabilities", 0);
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    __int16 v15 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [(VCMediaStream *)v7 streamToken];
      uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 88);
      *(_DWORD *)buf = 136316162;
      uint64_t v20 = v14;
      __int16 v21 = 2080;
      uint64_t v22 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
      __int16 v23 = 1024;
      int v24 = 894;
      __int16 v25 = 2048;
      uint64_t v26 = v16;
      __int16 v27 = 2112;
      uint64_t v28 = v17;
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMediaStream created momentsCollector for video stream %ld. vcMomentsCollectorDictionary=%@", buf, 0x30u);
    }
  }

  return v6;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_358(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a2 objectForKeyedSubscript:@"CLIENTDIED"];
  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v5 = objc_msgSend(v6, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"CONTEXT", 0);
  }
  id v7 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "setObject:forKeyedSubscript:", 0, objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "streamToken")));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [v7 streamToken];
        uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 88);
        *(_DWORD *)buf = 136316418;
        uint64_t v15 = v8;
        __int16 v16 = 2080;
        uint64_t v17 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
        __int16 v18 = 1024;
        int v19 = 919;
        __int16 v20 = 2048;
        __int16 v21 = v7;
        __int16 v22 = 2048;
        uint64_t v23 = v10;
        __int16 v24 = 2112;
        uint64_t v25 = v11;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCMediaStream releasing old VCVideoStream %p. Removed momentsCollector for video stream %ld, vcMomentsCollectorDictionary=%@", buf, 0x3Au);
      }
    }
    if (v4) {
      uint64_t v12 = [MEMORY[0x1E4F28C58] AVConferenceServiceError:32039 detailCode:0 description:@"Client Died"];
    }
    else {
      uint64_t v12 = 0;
    }
    [v7 stopWithError:v12];
    [v7 startDeallocTimer];
    [*(id *)(*(void *)(a1 + 32) + 72) removeObject:v7];
  }
  return v5;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_360(uint64_t a1, void *a2)
{
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"]) {
    objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"CONTEXT"), "requestLastDecodedFrame");
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_364(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    id v7 = objc_alloc_init(VCTextStream);
    [*(id *)(*(void *)(a1 + 32) + 72) addObject:v7];
    [(VCMediaStream *)v7 setDelegate:*(void *)(a1 + 32)];
    [(VCMediaStream *)v7 setDelegateFunctions:_VCMediaStreamManager_UpdateFrequencyLevel];
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_14;
      }
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      uint64_t v11 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 136316162;
      uint64_t v23 = v9;
      __int16 v24 = 2080;
      uint64_t v25 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke_2";
      __int16 v26 = 1024;
      int v27 = 955;
      __int16 v28 = 2080;
      Name = class_getName(v11);
      __int16 v30 = 2048;
      __int16 v31 = v7;
      uint64_t v12 = " [%s] %s:%d Allocated new %s(%p)";
      uint64_t v13 = v10;
      uint32_t v14 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v8 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_14;
      }
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      __int16 v16 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      uint64_t v17 = *(VCTextStream **)(a1 + 32);
      __int16 v18 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 136316674;
      uint64_t v23 = v15;
      __int16 v24 = 2080;
      uint64_t v25 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
      __int16 v26 = 1024;
      int v27 = 955;
      __int16 v28 = 2112;
      Name = (const char *)v8;
      __int16 v30 = 2048;
      __int16 v31 = v17;
      __int16 v32 = 2080;
      __int16 v33 = class_getName(v18);
      __int16 v34 = 2048;
      long long v35 = v7;
      uint64_t v12 = " [%s] %s:%d %@(%p) Allocated new %s(%p)";
      uint64_t v13 = v16;
      uint32_t v14 = 68;
    }
    _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
LABEL_14:
    uint64_t v19 = -[VCMediaStream setLocalParticipantInfo:networkSockets:withError:](v7, "setLocalParticipantInfo:networkSockets:withError:", [a2 objectForKeyedSubscript:@"vcMediaStreamDictionary"], objc_msgSend(a2, "objectForKeyedSubscript:", @"USERXPCARGUMENTS"), a3);
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithInteger:", -[VCMediaStream streamToken](v7, "streamToken"));
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v7, @"CONTEXT", v20, @"vcMediaStreamToken", v19, @"vcMediaStreamStreamCapabilities", 0);

    return v6;
  }
  return 0;
}

uint64_t __48__VCMediaStreamManager_registerBlocksForService__block_invoke_367(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ([a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v4 = objc_msgSend(v5, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"CONTEXT", 0);
  }
  uint64_t v6 = (void *)[a2 objectForKeyedSubscript:@"CONTEXT"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_16;
      }
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      uint64_t v10 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 136316418;
      uint64_t v20 = v8;
      __int16 v21 = 2080;
      __int16 v22 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
      __int16 v23 = 1024;
      int v24 = 984;
      __int16 v25 = 2080;
      Name = class_getName(v10);
      __int16 v27 = 2048;
      __int16 v28 = v6;
      __int16 v29 = 2048;
      __int16 v30 = (const char *)[v6 streamToken];
      uint64_t v11 = " [%s] %s:%d Releasing old %s(%p) stream:%ld ";
      uint64_t v12 = v9;
      uint32_t v13 = 58;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        id v7 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        id v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_16;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      __int16 v16 = *(void **)(a1 + 32);
      uint64_t v17 = (objc_class *)objc_opt_class();
      *(_DWORD *)buf = 136316930;
      uint64_t v20 = v14;
      __int16 v21 = 2080;
      __int16 v22 = "-[VCMediaStreamManager registerBlocksForService]_block_invoke";
      __int16 v23 = 1024;
      int v24 = 984;
      __int16 v25 = 2112;
      Name = (const char *)v7;
      __int16 v27 = 2048;
      __int16 v28 = v16;
      __int16 v29 = 2080;
      __int16 v30 = class_getName(v17);
      __int16 v31 = 2048;
      __int16 v32 = v6;
      __int16 v33 = 2048;
      uint64_t v34 = [v6 streamToken];
      uint64_t v11 = " [%s] %s:%d %@(%p) Releasing old %s(%p) stream:%ld ";
      uint64_t v12 = v15;
      uint32_t v13 = 78;
    }
    _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_16:
    [v6 stop];
    [v6 startDeallocTimer];
    [*(id *)(*(void *)(a1 + 32) + 72) removeObject:v6];
  }
  return v4;
}

- (void)deregisterBlocksForService
{
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetVolume");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamTerminateText");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamInitializeText");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamRequestLastDecodedFrame");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamTerminateVideo");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamInitializeVideo");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetOutputFrequencyMeteringEnabled");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamGetOutputFrequencyMeteringEnabled");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetInputFrequencyMeteringEnabled");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamGetInputFrequencyMeteringEnabled");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetRTCPEnabled");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetRTCPSendInterval");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetRTPTimeoutEnabled");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetRTCPTimeoutEnabled");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetRTPTimeoutInterval");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetRTCPTimeoutInterval");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamTerminateText");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamTerminateText");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamTerminateText");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetStreamDirection");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamUpdateVideoConfig");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetPause");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamStartSynchronization");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamStopConference");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamStartConference");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamStopSendDTMFEvent");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSendDTMFEvent");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamSetSessionConfig");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamTerminateAudio");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcVirtualTTYDeviceTerminate");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcVirtualTTYDeviceSendCharacter");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcVirtualTTYDeviceSendText");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcVirtualRTTDeviceInitialize");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcVirtualTTYDeviceInitialize");
  objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton"), "deregisterFromService:", "vcMediaStreamInitializeAudio");
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v2 deregisterFromService:"vcMediaStreamSetJitterBufferMode"];
}

- (void)vcMediaStream:didUpdateVideoConfiguration:error:dictionary:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCMediaStream didUpdateVideoConfiguration configDict is nil", v2, v3, v4, v5, v6);
}

- (void)cleanupStreamSyncSourceForVideoStream:andAudioStream:.cold.1()
{
  OUTLINED_FUNCTION_11_0();
  [v0 streamToken];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Unable to clean up video stream for audio sync token=%ld", v3, v4, v5, v6, v7);
}

- (void)addSyncSourceToVideoStreamConfig:sourceStreamToken:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed configure stream synchronization", v2, v3, v4, v5, v6);
}

- (void)addSyncSourceToVideoStreamConfig:sourceStreamToken:error:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_5();
  _os_log_fault_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d Failed configure stream synchronization", v1, 0x1Cu);
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_180_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Couldn't find text stream for stream token %ld", v2, v3, v4, v5);
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_180_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Text device for stream token %ld", v2, v3, v4, v5);
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_198_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_7();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate stream config", v2, v3, v4, v5, v6);
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_198_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_7();
  _os_log_fault_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d Failed to allocate stream config", v1, 0x1Cu);
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_198_cold_3()
{
  OUTLINED_FUNCTION_11_0();
  os_log_t v0 = (objc_class *)objc_opt_class();
  class_getName(v0);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Unexpected stream type [%s]", v3, v4, v5, v6, v7);
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_198_cold_4()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (objc_class *)objc_opt_class();
  class_getName(v1);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_4_4();
  _os_log_fault_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d Unexpected stream type [%s]", v2, 0x26u);
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_3_235_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCMediaStream failed to set volume nil xpcDict", v2, v3, v4, v5, v6);
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_3_252_cold_1()
{
  OUTLINED_FUNCTION_11_0();
  if (v0) {
    objc_msgSend((id)objc_msgSend(v0, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d %s startSynchronization failed", v3, v4, v5, v6, v7);
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_258_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCMediaStream failed to set PAUSE state, nil xpcDict", v2, v3, v4, v5, v6);
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_277_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCMediaStream failed to set stream direction nil xpcDict", v2, v3, v4, v5, v6);
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_284_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCMediaStream failed to set stream jitter buffer mode nil xpcDict", v2, v3, v4, v5, v6);
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_291_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCMediaStream failed to set rtcpEnabled nil xpcDict", v2, v3, v4, v5, v6);
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_298_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCMediaStream failed to set rtpTimeOutEnabled nil xpcDict", v2, v3, v4, v5, v6);
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_305_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCMediaStream failed to set rtcpTimeOutEnabled nil xpcDict", v2, v3, v4, v5, v6);
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_312_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCMediaStream failed to set rtpTimeOutInterval nil xpcDict", v2, v3, v4, v5, v6);
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_319_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCMediaStream failed to set rtcpTimeOutInterval nil xpcDict", v2, v3, v4, v5, v6);
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_326_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCMediaStream failed to set rtcpSendInterval nil xpcDict", v2, v3, v4, v5, v6);
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_340_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCMediaStream failed to set 'input frequency meter enabled' nil xpcDict", v2, v3, v4, v5, v6);
}

void __48__VCMediaStreamManager_registerBlocksForService__block_invoke_2_351_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCMediaStream failed to set 'output frequency meter enabled' nil xpcDict", v2, v3, v4, v5, v6);
}

@end