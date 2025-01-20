@interface VCAudioRelayIOController
+ (id)sharedInstanceClientFacing;
+ (id)sharedInstanceRemoteFacing;
+ (id)sharedInstanceSafeViewClientFacing;
+ (id)sharedInstanceSafeViewRemoteFacing;
+ (void)initializeStateStrings;
- (BOOL)addClient:(id)a3;
- (BOOL)handleTransitionPrepareToStarting;
- (BOOL)removeClient:(id)a3;
- (BOOL)startRelayIO:(id)a3;
- (BOOL)stateIdleWithControllerSettings:(id)a3 client:(id)a4 newState:(unsigned int *)a5;
- (BOOL)statePrepareWithControllerSettings:(id)a3 client:(id)a4 newState:(unsigned int *)a5;
- (BOOL)stateRunningWithControllerSettings:(id)a3 client:(id)a4 newState:(unsigned int *)a5;
- (BOOL)stateStartingWithControllerSettings:(id)a3 client:(id)a4 newState:(unsigned int *)a5;
- (BOOL)supportsVoiceActivityDetection;
- (BOOL)updateStateWithClient:(id)a3;
- (NSString)description;
- (VCAudioRelayIOController)initWithRelayType:(unsigned int)a3 relayIOType:(unsigned int)a4;
- (_VCAudioIOControllerIOState)sinkIO;
- (_VCAudioIOControllerIOState)sourceIO;
- (id)newControllerSettingsWithNewClient:(id)a3;
- (id)newRelayIOWithCompletionHandler:(id)a3;
- (unint64_t)retainCount;
- (unsigned)channelsPerFrame;
- (unsigned)computeSamplePerFrameWithControllerSampleRate:(unsigned int)a3;
- (void)_cleanupDeadClients;
- (void)addStartingClient:(id)a3 controllerSettings:(id)a4;
- (void)dealloc;
- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3;
- (void)flushEventQueue:(opaqueCMSimpleQueue *)a3;
- (void)handleTransitionPrepareToStarting;
- (void)loadRelay;
- (void)processEventQueue:(AudioEventQueue_t *)a3 clientList:(id)a4;
- (void)registerClientIO:(_VCAudioIOControllerClientIO *)a3 controllerIO:(_VCAudioIOControllerIOState *)a4;
- (void)removeAllClientsForIO:(_VCAudioIOControllerIOState *)a3;
- (void)resetAudioTimestamps;
- (void)startClient:(id)a3;
- (void)stopClient:(id)a3;
- (void)unloadRelay;
- (void)unregisterClientIO:(_VCAudioIOControllerClientIO *)a3 controllerIO:(_VCAudioIOControllerIOState *)a4;
- (void)updateClient:(id)a3 settings:(const tagVCAudioIOControllerClientSettings *)a4;
@end

@implementation VCAudioRelayIOController

+ (void)initializeStateStrings
{
  if (!_stateStrings) {
    _stateStrings = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"NOT SET", @"IDLE", @"PREPARE", @"STARTING", @"RUNNING", 0);
  }
}

+ (id)sharedInstanceRemoteFacing
{
  id result = (id)sharedInstanceRemoteFacing__VCAudioRelayIOControllerRemoteFacing;
  if (!sharedInstanceRemoteFacing__VCAudioRelayIOControllerRemoteFacing)
  {
    v3 = objc_opt_class();
    objc_sync_enter(v3);
    if (!sharedInstanceRemoteFacing__VCAudioRelayIOControllerRemoteFacing)
    {
      sharedInstanceRemoteFacing__VCAudioRelayIOControllerRemoteFacing = [[VCAudioRelayIOController alloc] initWithRelayType:0 relayIOType:1];
      +[VCAudioRelayIOController initializeStateStrings];
    }
    objc_sync_exit(v3);
    return (id)sharedInstanceRemoteFacing__VCAudioRelayIOControllerRemoteFacing;
  }
  return result;
}

+ (id)sharedInstanceClientFacing
{
  if (sharedInstanceClientFacing_onceToken != -1) {
    dispatch_once(&sharedInstanceClientFacing_onceToken, &__block_literal_global_52);
  }
  return (id)sharedInstanceClientFacing__VCAudioRelayIOControllerClientFacing;
}

void __54__VCAudioRelayIOController_sharedInstanceClientFacing__block_invoke()
{
  if (!sharedInstanceClientFacing__VCAudioRelayIOControllerClientFacing)
  {
    sharedInstanceClientFacing__VCAudioRelayIOControllerClientFacing = [[VCAudioRelayIOController alloc] initWithRelayType:0 relayIOType:0];
    +[VCAudioRelayIOController initializeStateStrings];
  }
}

+ (id)sharedInstanceSafeViewRemoteFacing
{
  if (sharedInstanceSafeViewRemoteFacing_onceToken != -1) {
    dispatch_once(&sharedInstanceSafeViewRemoteFacing_onceToken, &__block_literal_global_16_0);
  }
  return (id)sharedInstanceSafeViewRemoteFacing__VCAudioRelayIOControllerSafeViewRemoteFacing;
}

void __62__VCAudioRelayIOController_sharedInstanceSafeViewRemoteFacing__block_invoke()
{
  if (!sharedInstanceSafeViewRemoteFacing__VCAudioRelayIOControllerSafeViewRemoteFacing)
  {
    sharedInstanceSafeViewRemoteFacing__VCAudioRelayIOControllerSafeViewRemoteFacing = [[VCAudioRelayIOController alloc] initWithRelayType:1 relayIOType:1];
    +[VCAudioRelayIOController initializeStateStrings];
  }
}

+ (id)sharedInstanceSafeViewClientFacing
{
  if (sharedInstanceSafeViewClientFacing_onceToken != -1) {
    dispatch_once(&sharedInstanceSafeViewClientFacing_onceToken, &__block_literal_global_18_0);
  }
  return (id)sharedInstanceSafeViewClientFacing__VCAudioRelayIOControllerSafeViewClientFacing;
}

void __62__VCAudioRelayIOController_sharedInstanceSafeViewClientFacing__block_invoke()
{
  if (!sharedInstanceSafeViewClientFacing__VCAudioRelayIOControllerSafeViewClientFacing)
  {
    sharedInstanceSafeViewClientFacing__VCAudioRelayIOControllerSafeViewClientFacing = [[VCAudioRelayIOController alloc] initWithRelayType:1 relayIOType:0];
    +[VCAudioRelayIOController initializeStateStrings];
  }
}

- (VCAudioRelayIOController)initWithRelayType:(unsigned int)a3 relayIOType:(unsigned int)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VCAudioRelayIOController;
  v6 = [(VCAudioRelayIOController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_relayType = a3;
    v6->_relayIOType = a4;
    v6->_startingIOClients = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7->_allClients = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(62);
    v7->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.AudioIORelayControllerQueue", 0, CustomRootQueue);
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 100, &v7->_sourceData.eventQueue);
    CMSimpleQueueCreate(v9, 100, &v7->_sinkData.eventQueue);
    VCSingleLinkedListInitialize((uint64_t)&v7->_sourceData.clientIOList, (uint64_t)_VCAudioRelayIOController_CompareControllerEntries);
    VCSingleLinkedListInitialize((uint64_t)&v7->_sinkData.clientIOList, (uint64_t)_VCAudioRelayIOController_CompareControllerEntries);
    v7->_state = 1;
  }
  return v7;
}

- (NSString)description
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)VCAudioRelayIOController;
  v4 = [(VCAudioRelayIOController *)&v10 description];
  v5 = "Unknown";
  v6 = "Safeview";
  uint64_t relayType = self->_relayType;
  uint64_t relayIOType = self->_relayIOType;
  if (relayType != 1) {
    v6 = "Unknown";
  }
  if (!relayType) {
    v6 = "FaceTime";
  }
  if (relayIOType == 1) {
    v5 = "RemoteFacing";
  }
  if (!relayIOType) {
    v5 = "ClientFacing";
  }
  return (NSString *)[v3 stringWithFormat:@"{ %@ relayType=%s(%u) relayIOType=%s(%u) }", v4, v6, relayType, v5, relayIOType];
}

- (unint64_t)retainCount
{
  return -1;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.secondarySampleBuffer);
  eventQueue = self->_sourceData.eventQueue;
  if (eventQueue) {
    CFRelease(eventQueue);
  }
  v4 = self->_sinkData.eventQueue;
  if (v4) {
    CFRelease(v4);
  }

  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  v5.receiver = self;
  v5.super_class = (Class)VCAudioRelayIOController;
  [(VCAudioRelayIOController *)&v5 dealloc];
}

- (void)loadRelay
{
  v3 = objc_opt_class();
  objc_sync_enter(v3);
  if (self->_relayType == 1) {
    v4 = (id *)&_relaySafeView;
  }
  else {
    v4 = (id *)&_relayFaceTime;
  }
  Weak = (VCAudioRelay *)objc_loadWeak(v4);
  self->_relay = Weak;
  if (Weak)
  {
    uint64_t v6 = Weak;
  }
  else
  {
    v7 = objc_alloc_init(VCAudioRelay);
    self->_relay = v7;
    objc_storeWeak(v4, v7);
  }

  objc_sync_exit(v3);
}

- (void)unloadRelay
{
  self->_relay = 0;
}

- (_VCAudioIOControllerIOState)sinkIO
{
  return &self->_sinkData;
}

- (_VCAudioIOControllerIOState)sourceIO
{
  return &self->_sourceData;
}

- (void)removeAllClientsForIO:(_VCAudioIOControllerIOState *)a3
{
  p_clientIOList = (uint64_t *)&a3->clientIOList;
  while (1)
  {
    v4 = VCSingleLinkedListPop(p_clientIOList);
    if (!v4) {
      break;
    }
    free(v4);
  }
}

- (BOOL)addClient:(id)a3
{
  char v5 = -[NSMutableArray containsObject:](self->_allClients, "containsObject:");
  if ((v5 & 1) == 0) {
    [(NSMutableArray *)self->_allClients addObject:a3];
  }
  return v5 ^ 1;
}

- (BOOL)removeClient:(id)a3
{
  int v5 = -[NSMutableArray containsObject:](self->_allClients, "containsObject:");
  if (v5)
  {
    -[VCAudioRelayIOController unregisterClientIO:controllerIO:](self, "unregisterClientIO:controllerIO:", [a3 sinkIO], &self->_sinkData);
    -[VCAudioRelayIOController unregisterClientIO:controllerIO:](self, "unregisterClientIO:controllerIO:", [a3 sourceIO], &self->_sourceData);
    [(NSMutableArray *)self->_allClients removeObject:a3];
    [(NSMutableArray *)self->_startingIOClients removeObject:a3];
  }
  return v5;
}

- (void)_cleanupDeadClients
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  allClients = self->_allClients;
  uint64_t v5 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v34 objects:v33 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v35;
    *(void *)&long long v6 = 136315906;
    long long v20 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(allClients);
        }
        objc_super v10 = *(__CFString **)(*((void *)&v34 + 1) + 8 * v9);
        if (![(__CFString *)v10 delegate])
        {
          if ((VCAudioRelayIOController *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v17 = VRTraceErrorLogLevelToCSTR();
              v18 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v20;
                uint64_t v22 = v17;
                __int16 v23 = 2080;
                v24 = "-[VCAudioRelayIOController _cleanupDeadClients]";
                __int16 v25 = 1024;
                int v26 = 385;
                __int16 v27 = 2048;
                v28 = v10;
                v14 = v18;
                v15 = " [%s] %s:%d Removing dead client (%p)!";
                uint32_t v16 = 38;
LABEL_19:
                _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, v15, buf, v16);
              }
            }
          }
          else
          {
            uint64_t v11 = &stru_1F3D3E450;
            if (objc_opt_respondsToSelector()) {
              uint64_t v11 = (__CFString *)[(VCAudioRelayIOController *)self performSelector:sel_logPrefix];
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v12 = VRTraceErrorLogLevelToCSTR();
              v13 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316418;
                uint64_t v22 = v12;
                __int16 v23 = 2080;
                v24 = "-[VCAudioRelayIOController _cleanupDeadClients]";
                __int16 v25 = 1024;
                int v26 = 385;
                __int16 v27 = 2112;
                v28 = v11;
                __int16 v29 = 2048;
                v30 = self;
                __int16 v31 = 2048;
                v32 = v10;
                v14 = v13;
                v15 = " [%s] %s:%d %@(%p) Removing dead client (%p)!";
                uint32_t v16 = 58;
                goto LABEL_19;
              }
            }
          }
          objc_msgSend(v3, "setObject:atIndexedSubscript:", v10, objc_msgSend(v3, "count"));
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v19 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v34 objects:v33 count:16];
      uint64_t v7 = v19;
    }
    while (v19);
  }
  [(NSMutableArray *)self->_allClients removeObjectsInArray:v3];
}

- (unsigned)channelsPerFrame
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  allClients = self->_allClients;
  uint64_t v3 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (!v3) {
    return 1;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v12;
  unsigned int v6 = 1;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v12 != v5) {
        objc_enumerationMutation(allClients);
      }
      unsigned int v8 = *(_DWORD *)([*(id *)(*((void *)&v11 + 1) + 8 * i) clientFormat] + 28);
      if (v8 > v6) {
        unsigned int v6 = v8;
      }
    }
    uint64_t v4 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v11 objects:v10 count:16];
  }
  while (v4);
  return v6;
}

- (unsigned)computeSamplePerFrameWithControllerSampleRate:(unsigned int)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  allClients = self->_allClients;
  uint64_t v5 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (!v5) {
    return -1;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v17;
  double v8 = (double)a3;
  unsigned int v9 = -1;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v17 != v7) {
        objc_enumerationMutation(allClients);
      }
      uint64_t v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) clientFormat];
      LODWORD(v12) = *(_DWORD *)(v11 + 40);
      unsigned int v13 = vcvtad_u64_f64(v8 * (double)v12 / *(double *)v11);
      if (v9 >= v13) {
        unsigned int v9 = v13;
      }
    }
    uint64_t v6 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v16 objects:v15 count:16];
  }
  while (v6);
  return v9;
}

- (id)newControllerSettingsWithNewClient:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!a3) {
    id v5 = (id)[(NSMutableArray *)self->_allClients lastObject];
  }
  uint64_t v6 = (double *)[v5 clientFormat];
  uint64_t v18 = 0;
  long long v10 = xmmword_1E25A0110;
  int v17 = 0;
  v11[1] = 0x296C70636DLL;
  if (v6) {
    double v7 = *v6;
  }
  else {
    double v7 = 24000.0;
  }
  *(double *)uint64_t v11 = v7;
  unsigned int v15 = [(VCAudioRelayIOController *)self channelsPerFrame];
  int v16 = 32;
  int v13 = 1;
  int v14 = 4 * (v15 & 0x7FFFFFF);
  int v12 = v14;
  LODWORD(v18) = [(VCAudioRelayIOController *)self computeSamplePerFrameWithControllerSampleRate:v7];
  if (v5)
  {
    LODWORD(v10) = [a3 remoteCodecType];
    objc_msgSend(a3, "remoteCodecSampleRate", (void)v10);
    *((void *)&v10 + 1) = v8;
  }
  return [[VCAudioRelayIOControllerSettings alloc] initWithAudioFormat:v11 remoteCodecInfo:&v10];
}

- (BOOL)startRelayIO:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v11[0] = 0;
  unsigned int relayIOType = self->_relayIOType;
  relay = self->_relay;
  if (relayIOType == 1) {
    [(VCAudioRelay *)relay setRemoteIO:a3 withError:v11];
  }
  else {
    [(VCAudioRelay *)relay setClientIO:a3 withError:v11];
  }
  uint64_t v6 = v11[0];
  if (v11[0])
  {
    global_queue = dispatch_get_global_queue(2, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__VCAudioRelayIOController_startRelayIO___block_invoke;
    v10[3] = &unk_1E6DB3E40;
    v10[4] = self;
    v10[5] = v6;
    dispatch_async(global_queue, v10);
  }
  uint64_t v8 = self->_relay;
  if (self->_relayIOType == 1) {
    [(VCAudioRelay *)v8 startRemoteIO];
  }
  else {
    [(VCAudioRelay *)v8 startClientIO];
  }
  return v11[0] == 0;
}

uint64_t __41__VCAudioRelayIOController_startRelayIO___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 48);
  if (*(_DWORD *)(v2 + 12) == 1)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(v3, "clientIO"), "startCompletionHandler");
    if (!result) {
      return result;
    }
    id v5 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) clientIO];
  }
  else
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(v3, "remoteIO"), "startCompletionHandler");
    if (!result) {
      return result;
    }
    id v5 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) remoteIO];
  }
  uint64_t v6 = *(uint64_t (**)(void))([v5 startCompletionHandler] + 16);

  return v6();
}

- (id)newRelayIOWithCompletionHandler:(id)a3
{
  id v5 = objc_alloc_init(VCAudioRelayIO);
  [(VCAudioRelayIO *)v5 setClientFormat:[(VCAudioRelayIOControllerSettings *)self->_currentSettings audioFormat]];
  [(VCAudioRelayIO *)v5 setMicCallback:VCAudioRelayIOController_PushAudioSamples];
  [(VCAudioRelayIO *)v5 setMicCallbackContext:&self->_sinkData];
  [(VCAudioRelayIO *)v5 setSpeakerCallback:VCAudioRelayIOController_PullAudioSamples];
  [(VCAudioRelayIO *)v5 setSpeakerCallbackContext:&self->_sourceData];
  [(VCAudioRelayIO *)v5 setUsePacketThread:1];
  [(VCAudioRelayIO *)v5 setStartCompletionHandler:a3];
  [(VCAudioRelayIO *)v5 setUpdateRemoteCodecInfoContext:self];
  [(VCAudioRelayIO *)v5 setUpdateRemoteCodecInfoCallback:VCAudioRelayIOController_UpdateRemoteCodecInfo];
  return v5;
}

- (void)resetAudioTimestamps
{
  VCAudioIOControllerIOState_ResetControllerTime(&self->_sinkData.timestampInitialized);

  VCAudioIOControllerIOState_ResetControllerTime(&self->_sourceData.timestampInitialized);
}

- (void)registerClientIO:(_VCAudioIOControllerClientIO *)a3 controllerIO:(_VCAudioIOControllerIOState *)a4
{
  double v7 = malloc_type_calloc(1uLL, 0x20uLL, 0x10A00405C5CD52DuLL);
  v7[4] = 0;
  *((void *)v7 + 1) = a3;
  if (self->_state == 4)
  {
    if (CMSimpleQueueEnqueue(a4->eventQueue, v7))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioRelayIOController registerClientIO:controllerIO:](v8);
        }
      }
      free(v7);
    }
  }
  else
  {
    _VCAudioRelayIOController_RegisterClientIO((uint64_t)a4, v7);
  }
}

- (void)unregisterClientIO:(_VCAudioIOControllerClientIO *)a3 controllerIO:(_VCAudioIOControllerIOState *)a4
{
  double v7 = malloc_type_calloc(1uLL, 0x20uLL, 0x10A00405C5CD52DuLL);
  v7[4] = 1;
  *((void *)v7 + 1) = a3;
  if (self->_state == 4)
  {
    if (CMSimpleQueueEnqueue(a4->eventQueue, v7))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioRelayIOController unregisterClientIO:controllerIO:](v8);
        }
      }
      free(v7);
    }
  }
  else
  {
    _VCAudioRelayIOController_UnregisterClientIO((uint64_t)a4, v7);
  }
}

- (BOOL)stateIdleWithControllerSettings:(id)a3 client:(id)a4 newState:(unsigned int *)a5
{
  *a5 = 1;
  if ([(NSMutableArray *)self->_allClients count])
  {
    [(VCAudioRelayIOController *)self loadRelay];
    *a5 = 2;
  }
  else
  {
    [(VCAudioRelayIOController *)self resetAudioTimestamps];
  }
  return 1;
}

- (BOOL)handleTransitionPrepareToStarting
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VCAudioRelayIOControllerSettings *)self->_currentSettings audioFormat];
  int samplesPerFrame = v3->samplesPerFrame;
  long long v5 = *(_OWORD *)&v3->format.mSampleRate;
  long long v6 = *(_OWORD *)&v3->format.mBytesPerPacket;
  uint64_t v17 = *(void *)&v3->format.mBitsPerChannel;
  v16[0] = v5;
  v16[1] = v6;
  if (VCAudioBufferList_Allocate(v16, samplesPerFrame, &self->_sourceData.secondarySampleBuffer))
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    allClients = self->_allClients;
    uint64_t v8 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v19 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(allClients);
          }
          [(VCAudioRelayIOController *)self addStartingClient:*(void *)(*((void *)&v19 + 1) + 8 * i) controllerSettings:self->_currentSettings];
        }
        uint64_t v9 = [(NSMutableArray *)allClients countByEnumeratingWithState:&v19 objects:v18 count:16];
      }
      while (v9);
    }
    int v12 = (opaqueVCAudioLimiter *)VCAudioLimiter_Allocate((long long *)v3);
    self->_sourceData.audioLimiter = v12;
    if (v12)
    {
      if (VCAudioLimiter_Start((uint64_t)v12))
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __61__VCAudioRelayIOController_handleTransitionPrepareToStarting__block_invoke;
        v15[3] = &unk_1E6DB5838;
        v15[4] = self;
        id v13 = [(VCAudioRelayIOController *)self newRelayIOWithCompletionHandler:v15];
        if (v13)
        {
          if (self->_relayIOType == 1) {
            objc_msgSend(v13, "setRemoteCodecInfo:", -[VCAudioRelayIOControllerSettings remoteCodecInfo](self->_currentSettings, "remoteCodecInfo"));
          }
          if ([(VCAudioRelayIOController *)self startRelayIO:v13])
          {

            return 1;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCAudioRelayIOController handleTransitionPrepareToStarting]();
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCAudioRelayIOController handleTransitionPrepareToStarting]();
          }
        }

        VCAudioLimiter_Stop((uint64_t)self->_sourceData.audioLimiter);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAudioRelayIOController handleTransitionPrepareToStarting].cold.4();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioRelayIOController handleTransitionPrepareToStarting]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAudioRelayIOController handleTransitionPrepareToStarting].cold.5();
    }
  }
  VCAudioDucker_Destroy((void **)&self->_sourceData.audioLimiter);
  VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.secondarySampleBuffer);
  return 0;
}

void __61__VCAudioRelayIOController_handleTransitionPrepareToStarting__block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 24);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__VCAudioRelayIOController_handleTransitionPrepareToStarting__block_invoke_2;
  v5[3] = &unk_1E6DB3E18;
  char v6 = a2;
  v5[4] = v3;
  v5[5] = a3;
  dispatch_async(v4, v5);
}

uint64_t __61__VCAudioRelayIOController_handleTransitionPrepareToStarting__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 16) = 4;
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 40);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "delegate"), "didStart:error:", *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
      }
      while (v4);
    }
    [*(id *)(a1 + 32) flushEventQueue:*(void *)(*(void *)(a1 + 32) + 328)];
    [*(id *)(a1 + 32) flushEventQueue:*(void *)(*(void *)(a1 + 32) + 128)];
    [*(id *)(a1 + 32) removeAllClientsForIO:*(void *)(a1 + 32) + 56];
    [*(id *)(a1 + 32) removeAllClientsForIO:*(void *)(a1 + 32) + 256];
    [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
    [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
  }
  return [*(id *)(a1 + 32) updateStateWithClient:0];
}

- (BOOL)statePrepareWithControllerSettings:(id)a3 client:(id)a4 newState:(unsigned int *)a5
{
  if (![(NSMutableArray *)self->_allClients count])
  {
    [(VCAudioRelayIOController *)self unloadRelay];
    unsigned int v8 = 1;
    goto LABEL_5;
  }

  self->_currentSettings = (VCAudioRelayIOControllerSettings *)a3;
  if ([(VCAudioRelayIOController *)self handleTransitionPrepareToStarting])
  {
    unsigned int v8 = 3;
LABEL_5:
    *a5 = v8;
    return 1;
  }
  return 0;
}

- (void)addStartingClient:(id)a3 controllerSettings:(id)a4
{
  if (a3 && (-[NSMutableArray containsObject:](self->_startingIOClients, "containsObject:") & 1) == 0)
  {
    objc_msgSend((id)objc_msgSend(a3, "delegate"), "controllerFormatChanged:", objc_msgSend(a4, "audioFormat"));
    if ([a3 direction]) {
      -[VCAudioRelayIOController registerClientIO:controllerIO:](self, "registerClientIO:controllerIO:", [a3 sourceIO], &self->_sourceData);
    }
    if (([a3 direction] & 2) != 0) {
      -[VCAudioRelayIOController registerClientIO:controllerIO:](self, "registerClientIO:controllerIO:", [a3 sinkIO], &self->_sinkData);
    }
    [(NSMutableArray *)self->_startingIOClients addObject:a3];
  }
  if (self->_relayIOType == 1)
  {
    uint64_t v7 = [(VCAudioRelayIOControllerSettings *)self->_currentSettings remoteCodecInfo];
    unsigned int v8 = [(VCAudioRelay *)self->_relay remoteIO];
    [(VCAudioRelayIO *)v8 setRemoteCodecInfo:v7];
  }
}

- (BOOL)stateStartingWithControllerSettings:(id)a3 client:(id)a4 newState:(unsigned int *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  *a5 = 3;
  if (!memcmp(-[VCAudioRelayIOControllerSettings audioFormat](self->_currentSettings, "audioFormat"), (const void *)[a3 audioFormat], 0x28uLL)&& -[NSMutableArray count](self->_allClients, "count"))
  {
    [(VCAudioRelayIOController *)self addStartingClient:a4 controllerSettings:a3];
  }
  else
  {
    relay = self->_relay;
    if (self->_relayIOType == 1) {
      [(VCAudioRelay *)relay stopRemoteIO];
    }
    else {
      [(VCAudioRelay *)relay stopClientIO];
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      long long v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        BOOL v12 = self->_relayIOType == 0;
        int v14 = 136315906;
        uint64_t v15 = v10;
        __int16 v16 = 2080;
        uint64_t v17 = "-[VCAudioRelayIOController stateStartingWithControllerSettings:client:newState:]";
        __int16 v18 = 1024;
        int v19 = 667;
        __int16 v20 = 1024;
        BOOL v21 = v12;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Client facing:%d relay stopped", (uint8_t *)&v14, 0x22u);
      }
    }
    [(VCAudioRelayIOController *)self flushEventQueue:self->_sourceData.eventQueue];
    [(VCAudioRelayIOController *)self flushEventQueue:self->_sinkData.eventQueue];
    [(VCAudioRelayIOController *)self removeAllClientsForIO:&self->_sinkData];
    [(VCAudioRelayIOController *)self removeAllClientsForIO:&self->_sourceData];
    [(NSMutableArray *)self->_startingIOClients removeAllObjects];
    VCAudioLimiter_Stop((uint64_t)self->_sourceData.audioLimiter);
    VCAudioDucker_Destroy((void **)&self->_sourceData.audioLimiter);
    VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.secondarySampleBuffer);
    *a5 = 2;
  }
  return 1;
}

- (BOOL)stateRunningWithControllerSettings:(id)a3 client:(id)a4 newState:(unsigned int *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  *a5 = 4;
  if (!memcmp(-[VCAudioRelayIOControllerSettings audioFormat](self->_currentSettings, "audioFormat"), (const void *)[a3 audioFormat], 0x28uLL)&& -[NSMutableArray count](self->_allClients, "count"))
  {
    [(VCAudioRelayIOController *)self addStartingClient:a4 controllerSettings:a3];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    startingIOClients = self->_startingIOClients;
    uint64_t v10 = [(NSMutableArray *)startingIOClients countByEnumeratingWithState:&v16 objects:v15 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(startingIOClients);
          }
          objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "delegate"), "didStart:error:", 1, 0);
        }
        uint64_t v11 = [(NSMutableArray *)startingIOClients countByEnumeratingWithState:&v16 objects:v15 count:16];
      }
      while (v11);
    }
    [(NSMutableArray *)self->_startingIOClients removeAllObjects];
  }
  else
  {
    *a5 = 3;
  }
  return 1;
}

- (BOOL)updateStateWithClient:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  unsigned int v41 = 0;
  [(VCAudioRelayIOController *)self _cleanupDeadClients];
  id v40 = a3;
  id v5 = [(VCAudioRelayIOController *)self newControllerSettingsWithNewClient:a3];
  id v39 = v5;
  do
  {
    if ((VCAudioRelayIOController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        uint64_t v15 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = [(id)_stateStrings objectAtIndexedSubscript:self->_state];
          unsigned int state = self->_state;
          *(_DWORD *)buf = 136316418;
          uint64_t v43 = v14;
          __int16 v44 = 2080;
          v45 = "-[VCAudioRelayIOController updateStateWithClient:]";
          __int16 v46 = 1024;
          int v47 = 720;
          __int16 v48 = 2112;
          v49 = self;
          __int16 v50 = 2112;
          v51 = (VCAudioRelayIOController *)v16;
          __int16 v52 = 1024;
          *(_DWORD *)v53 = state;
          uint64_t v11 = v15;
          uint64_t v12 = " [%s] %s:%d %@ Process state: %@ (%d)";
          uint32_t v13 = 54;
          goto LABEL_11;
        }
      }
    }
    else
    {
      char v6 = &stru_1F3D3E450;
      if (objc_opt_respondsToSelector()) {
        char v6 = (__CFString *)[(VCAudioRelayIOController *)self performSelector:sel_logPrefix];
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        unsigned int v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = [(id)_stateStrings objectAtIndexedSubscript:self->_state];
          unsigned int v10 = self->_state;
          *(_DWORD *)buf = 136316930;
          uint64_t v43 = v7;
          __int16 v44 = 2080;
          v45 = "-[VCAudioRelayIOController updateStateWithClient:]";
          __int16 v46 = 1024;
          int v47 = 720;
          __int16 v48 = 2112;
          v49 = (VCAudioRelayIOController *)v6;
          __int16 v50 = 2048;
          v51 = self;
          __int16 v52 = 2112;
          *(void *)v53 = self;
          *(_WORD *)&v53[8] = 2112;
          *(void *)&v53[10] = v9;
          *(_WORD *)&v53[18] = 1024;
          unsigned int v54 = v10;
          uint64_t v11 = v8;
          uint64_t v12 = " [%s] %s:%d %@(%p) %@ Process state: %@ (%d)";
          uint32_t v13 = 74;
LABEL_11:
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, v13);
        }
      }
    }
    switch(self->_state)
    {
      case 1u:
        BOOL v18 = [(VCAudioRelayIOController *)self stateIdleWithControllerSettings:v5 client:v40 newState:&v41];
        goto LABEL_17;
      case 2u:
        BOOL v18 = [(VCAudioRelayIOController *)self statePrepareWithControllerSettings:v5 client:v40 newState:&v41];
        goto LABEL_17;
      case 3u:
        BOOL v18 = [(VCAudioRelayIOController *)self stateStartingWithControllerSettings:v5 client:v40 newState:&v41];
        goto LABEL_17;
      case 4u:
        BOOL v18 = [(VCAudioRelayIOController *)self stateRunningWithControllerSettings:v5 client:v40 newState:&v41];
LABEL_17:
        BOOL v19 = v18;
        break;
      default:
        BOOL v19 = 1;
        break;
    }
    unsigned int v20 = v41;
    unsigned int v21 = self->_state;
    unsigned int v22 = v41;
    if (v41 != v21)
    {
      if ((VCAudioRelayIOController *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v31 = VRTraceErrorLogLevelToCSTR();
          v32 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v33 = [(id)_stateStrings objectAtIndexedSubscript:self->_state];
            unsigned int v38 = self->_state;
            uint64_t v34 = [(id)_stateStrings objectAtIndexedSubscript:v41];
            *(_DWORD *)buf = 136316930;
            uint64_t v43 = v31;
            __int16 v44 = 2080;
            v45 = "-[VCAudioRelayIOController updateStateWithClient:]";
            __int16 v46 = 1024;
            int v47 = 739;
            __int16 v48 = 2112;
            v49 = self;
            __int16 v50 = 2112;
            v51 = (VCAudioRelayIOController *)v33;
            __int16 v52 = 1024;
            *(_DWORD *)v53 = v38;
            id v5 = v39;
            *(_WORD *)&v53[4] = 2112;
            *(void *)&v53[6] = v34;
            *(_WORD *)&v53[14] = 1024;
            *(_DWORD *)&v53[16] = v41;
            v28 = v32;
            __int16 v29 = " [%s] %s:%d %@ State change: %@ (%d) -> %@ (%d)";
            uint32_t v30 = 70;
LABEL_29:
            _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, v30);
          }
        }
      }
      else
      {
        uint64_t v23 = &stru_1F3D3E450;
        if (objc_opt_respondsToSelector()) {
          uint64_t v23 = (__CFString *)[(VCAudioRelayIOController *)self performSelector:sel_logPrefix];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v24 = VRTraceErrorLogLevelToCSTR();
          __int16 v25 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v26 = [(id)_stateStrings objectAtIndexedSubscript:self->_state];
            unsigned int v37 = self->_state;
            uint64_t v27 = [(id)_stateStrings objectAtIndexedSubscript:v41];
            *(_DWORD *)buf = 136317442;
            uint64_t v43 = v24;
            __int16 v44 = 2080;
            v45 = "-[VCAudioRelayIOController updateStateWithClient:]";
            __int16 v46 = 1024;
            int v47 = 739;
            __int16 v48 = 2112;
            v49 = (VCAudioRelayIOController *)v23;
            __int16 v50 = 2048;
            v51 = self;
            __int16 v52 = 2112;
            *(void *)v53 = self;
            *(_WORD *)&v53[8] = 2112;
            *(void *)&v53[10] = v26;
            id v5 = v39;
            *(_WORD *)&v53[18] = 1024;
            unsigned int v54 = v37;
            __int16 v55 = 2112;
            uint64_t v56 = v27;
            __int16 v57 = 1024;
            unsigned int v58 = v41;
            v28 = v25;
            __int16 v29 = " [%s] %s:%d %@(%p) %@ State change: %@ (%d) -> %@ (%d)";
            uint32_t v30 = 90;
            goto LABEL_29;
          }
        }
      }
      unsigned int v22 = v41;
    }
    self->_unsigned int state = v22;
  }
  while (v20 != v21 && v19);

  return v19;
}

- (void)processEventQueue:(AudioEventQueue_t *)a3 clientList:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  BOOL v18 = 0;
  double v6 = 0.0;
  if (VRTraceIsInternalOSInstalled()) {
    double v6 = micro();
  }
  uint64_t v7 = VCAudioEventQueue_Dequeue((int *)a3, (uint64_t)&v17);
  for (int i = 0; v7; ++i)
  {
    uint64_t v16 = v18;
    if (v18)
    {
      if (v17 == 2)
      {
        [a4 removeObject:v18];
        goto LABEL_9;
      }
      if (v17 == 1)
      {
        [a4 addObject:v18];
LABEL_9:
      }
    }
    LODWORD(v17) = 0;
    BOOL v18 = 0;
    uint64_t v7 = VCAudioEventQueue_Dequeue((int *)a3, (uint64_t)&v17);
  }
  LogProfileTimeOverLimit(v6, v7, v8, v9, v10, v11, v12, v13, v14, (char)"-[VCAudioRelayIOController processEventQueue:clientList:]");
}

- (void)flushEventQueue:(opaqueCMSimpleQueue *)a3
{
  double v4 = 0.0;
  if (VRTraceIsInternalOSInstalled()) {
    double v4 = micro();
  }
  id v5 = (void *)CMSimpleQueueDequeue(a3);
  for (i = 0; v5; id v5 = (void *)CMSimpleQueueDequeue(a3))
  {
    ++i;
    free(v5);
  }
  LogProfileTimeOverLimit(v4, (uint64_t)v5, v6, v7, v8, v9, v10, v11, v12, (char)"-[VCAudioRelayIOController flushEventQueue:]");
}

- (void)startClient:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__VCAudioRelayIOController_startClient___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = self;
    block[5] = a3;
    dispatch_async(dispatchQueue, block);
  }
}

uint64_t __40__VCAudioRelayIOController_startClient___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) addClient:*(void *)(a1 + 40)])
  {
    uint64_t result = [*(id *)(a1 + 32) updateStateWithClient:*(void *)(a1 + 40)];
    if (result) {
      return result;
    }
    [*(id *)(a1 + 32) removeClient:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) updateStateWithClient:0];
  }
  uint64_t v3 = (void *)[*(id *)(a1 + 40) delegate];

  return [v3 didStart:0 error:0];
}

- (void)stopClient:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__VCAudioRelayIOController_stopClient___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = self;
    block[5] = a3;
    dispatch_async(dispatchQueue, block);
  }
}

uint64_t __39__VCAudioRelayIOController_stopClient___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) removeClient:*(void *)(a1 + 40)] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "delegate"), "didStop:error:", 0, 0);
  }
  uint64_t v2 = [*(id *)(a1 + 32) updateStateWithClient:0];
  uint64_t v3 = (void *)[*(id *)(a1 + 40) delegate];

  return [v3 didStop:v2 error:0];
}

- (void)updateClient:(id)a3 settings:(const tagVCAudioIOControllerClientSettings *)a4
{
  [a3 setDirection:a4->var0];
  [a3 setSpatialAudioDisabled:a4->var1];
  [a3 setIsVoiceActivityEnabled:a4->var2];
  BOOL var3 = a4->var3;

  [a3 setIsMediaPriorityEnabled:var3];
}

- (BOOL)supportsVoiceActivityDetection
{
  return 0;
}

- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__VCAudioRelayIOController_didUpdateBasebandCodec___block_invoke;
  v4[3] = &unk_1E6DB4518;
  v4[4] = self;
  _VCRemoteCodecInfo v5 = *a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __51__VCAudioRelayIOController_didUpdateBasebandCodec___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v10;
    uint64_t v6 = a1 + 40;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "delegate"), "didUpdateBasebandCodec:", v6);
      }
      while (v4 != v7);
      uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)registerClientIO:(uint64_t)a1 controllerIO:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 504;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d CMSimpleQueueEnqueue Full", (uint8_t *)&v2, 0x1Cu);
}

- (void)unregisterClientIO:(uint64_t)a1 controllerIO:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 521;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d CMSimpleQueueEnqueue Full", (uint8_t *)&v2, 0x1Cu);
}

- (void)handleTransitionPrepareToStarting
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioRelayIOController.m:%d: Failed to allocate secondary buffer", v2, v3, v4, v5, v6);
}

@end