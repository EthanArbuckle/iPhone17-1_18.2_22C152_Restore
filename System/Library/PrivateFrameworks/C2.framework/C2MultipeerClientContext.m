@interface C2MultipeerClientContext
- (BOOL)hadFailedToDiscover;
- (BOOL)hasReplied;
- (C2MultipeerClientContext)init;
- (NSMutableSet)discoveryPeers;
- (NSString)chunkDataRequestedFromPeer;
- (OS_dispatch_source)timeoutTrigger;
- (OS_os_activity)osActivity;
- (id)chunkDataCallback;
- (unint64_t)startTimestamp;
- (void)resetTimerForChunkData;
- (void)resetTimerForDiscovery;
- (void)setChunkDataCallback:(id)a3;
- (void)setChunkDataRequestedFromPeer:(id)a3;
- (void)setDiscoveryPeers:(id)a3;
- (void)setHasReplied:(BOOL)a3;
- (void)setOsActivity:(id)a3;
- (void)setStartTimestamp:(unint64_t)a3;
- (void)setTimeoutTrigger:(id)a3;
- (void)startTimerOnQueue:(id)a3;
- (void)stopTimer;
@end

@implementation C2MultipeerClientContext

- (C2MultipeerClientContext)init
{
  v10.receiver = self;
  v10.super_class = (Class)C2MultipeerClientContext;
  v2 = [(C2MultipeerClientContext *)&v10 init];
  if (v2)
  {
    os_activity_t v3 = _os_activity_create(&dword_1DD523000, "c2-chunk-client", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    osActivity = v2->_osActivity;
    v2->_osActivity = (OS_os_activity *)v3;

    v2->_startTimestamp = mach_continuous_time();
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    discoveryPeers = v2->_discoveryPeers;
    v2->_discoveryPeers = v5;

    chunkDataRequestedFromPeer = v2->_chunkDataRequestedFromPeer;
    v2->_chunkDataRequestedFromPeer = 0;

    id chunkDataCallback = v2->_chunkDataCallback;
    v2->_id chunkDataCallback = 0;
  }
  return v2;
}

- (void)startTimerOnQueue:(id)a3
{
  v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)a3);
  timeoutTrigger = self->_timeoutTrigger;
  self->_timeoutTrigger = v4;

  v6 = self->_timeoutTrigger;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __46__C2MultipeerClientContext_startTimerOnQueue___block_invoke;
  handler[3] = &unk_1E6CCBF00;
  handler[4] = self;
  dispatch_source_set_event_handler(v6, handler);
  v7 = self->_timeoutTrigger;
  dispatch_time_t v8 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume((dispatch_object_t)self->_timeoutTrigger);
}

void __46__C2MultipeerClientContext_startTimerOnQueue___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 40))
  {
    if (C2_MULTIPEER_LOG_BLOCK != -1) {
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK, &__block_literal_global_0);
    }
    v2 = C2_MULTIPEER_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1DD523000, v2, OS_LOG_TYPE_INFO, "timeout triggered while waiting for chunk data response.", v11, 2u);
    }
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 56);
    if (v3)
    {
      v4 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F28568];
      v15[0] = @"timeout triggered while waiting for chunk data response.";
      v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      v6 = v4;
      uint64_t v7 = 201;
LABEL_14:
      objc_super v10 = [v6 errorWithDomain:@"C2MultipeerErrorDomain" code:v7 userInfo:v5];
      (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v10);
    }
  }
  else
  {
    if (C2_MULTIPEER_LOG_BLOCK != -1) {
      dispatch_once(&C2_MULTIPEER_LOG_BLOCK, &__block_literal_global_11);
    }
    dispatch_time_t v8 = C2_MULTIPEER_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)C2_MULTIPEER_LOG_INTERNAL, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1DD523000, v8, OS_LOG_TYPE_INFO, "timeout triggered while waiting for discovery response.", v11, 2u);
    }
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 56);
    if (v3)
    {
      v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F28568];
      v13 = @"timeout triggered while waiting for discovery response.";
      v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      v6 = v9;
      uint64_t v7 = 200;
      goto LABEL_14;
    }
  }
}

uint64_t __46__C2MultipeerClientContext_startTimerOnQueue___block_invoke_2()
{
  C2_MULTIPEER_LOG_INTERNAL = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

uint64_t __46__C2MultipeerClientContext_startTimerOnQueue___block_invoke_9()
{
  C2_MULTIPEER_LOG_INTERNAL = (uint64_t)os_log_create("com.apple.c2", "multipeer");
  return MEMORY[0x1F41817F8]();
}

- (void)resetTimerForDiscovery
{
  timeoutTrigger = self->_timeoutTrigger;
  dispatch_time_t v3 = dispatch_time(0, 200000000);
  dispatch_source_set_timer(timeoutTrigger, v3, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)resetTimerForChunkData
{
  timeoutTrigger = self->_timeoutTrigger;
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(timeoutTrigger, v3, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)stopTimer
{
  timeoutTrigger = self->_timeoutTrigger;
  if (timeoutTrigger) {
    dispatch_source_cancel(timeoutTrigger);
  }
}

- (BOOL)hadFailedToDiscover
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_discoveryPeers count] || self->_chunkDataRequestedFromPeer) {
    return 0;
  }
  id chunkDataCallback = (void (**)(id, void, void *))self->_chunkDataCallback;
  if (!chunkDataCallback) {
    return 1;
  }
  v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v10[0] = @"no peers had requested chunk data.";
  BOOL v3 = 1;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  dispatch_time_t v8 = [v6 errorWithDomain:@"C2MultipeerErrorDomain" code:101 userInfo:v7];
  chunkDataCallback[2](chunkDataCallback, 0, v8);

  return v3;
}

- (OS_os_activity)osActivity
{
  return self->_osActivity;
}

- (void)setOsActivity:(id)a3
{
}

- (unint64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(unint64_t)a3
{
  self->_startTimestamp = a3;
}

- (NSMutableSet)discoveryPeers
{
  return self->_discoveryPeers;
}

- (void)setDiscoveryPeers:(id)a3
{
}

- (NSString)chunkDataRequestedFromPeer
{
  return self->_chunkDataRequestedFromPeer;
}

- (void)setChunkDataRequestedFromPeer:(id)a3
{
}

- (OS_dispatch_source)timeoutTrigger
{
  return self->_timeoutTrigger;
}

- (void)setTimeoutTrigger:(id)a3
{
}

- (BOOL)hasReplied
{
  return self->_hasReplied;
}

- (void)setHasReplied:(BOOL)a3
{
  self->_hasReplied = a3;
}

- (id)chunkDataCallback
{
  return self->_chunkDataCallback;
}

- (void)setChunkDataCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_chunkDataCallback, 0);
  objc_storeStrong((id *)&self->_timeoutTrigger, 0);
  objc_storeStrong((id *)&self->_chunkDataRequestedFromPeer, 0);
  objc_storeStrong((id *)&self->_discoveryPeers, 0);
  objc_storeStrong((id *)&self->_osActivity, 0);
}

@end