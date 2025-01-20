@interface VCCoreMotionManager
- (CMMotionActivity)motionActivity;
- (VCCoreMotionManager)initWithDelegate:(id)a3;
- (id)coreMotionManagerDelegate;
- (unsigned)getMotionActivityValueForMotionActivity:(id)a3;
- (void)dealloc;
- (void)setCoreMotionManagerDelegate:(id)a3;
- (void)setMotionActivity:(id)a3;
- (void)startMonitoringMotionActivity;
- (void)stopMonitoringMotionActivity;
@end

@implementation VCCoreMotionManager

- (VCCoreMotionManager)initWithDelegate:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)VCCoreMotionManager;
  v4 = [(VCCoreMotionManager *)&v12 init];
  if (v4)
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v4->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.vcCoreMotion.delegateQueue", 0, CustomRootQueue);
    v6 = VCDispatchQueue_GetCustomRootQueue(37);
    v7 = dispatch_queue_create_with_target_V2("com.apple.AVConference.vcCoreMotion.serialQueue", 0, v6);
    v4->_motionActivityManager = 0;
    v4->_motionActivity = 0;
    [(VCCoreMotionManager *)v4 setCoreMotionManagerDelegate:a3];
    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    v4->_motionActivityQueue = v8;
    [(NSOperationQueue *)v8 setUnderlyingQueue:v7];
    if (v7) {
      dispatch_release(v7);
    }
    [(NSOperationQueue *)v4->_motionActivityQueue setMaxConcurrentOperationCount:1];
    if ([MEMORY[0x1E4F22220] isActivityAvailable])
    {
      v4->_motionActivityManager = (CMMotionActivityManager *)objc_alloc_init(MEMORY[0x1E4F22220]);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCoreMotionManager initWithDelegate:](v9, v10);
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    dispatch_release(delegateQueue);
    self->_delegateQueue = 0;
  }
  objc_storeWeak((id *)&self->_coreMotionManagerDelegate, 0);
  [(VCCoreMotionManager *)self stopMonitoringMotionActivity];

  v4.receiver = self;
  v4.super_class = (Class)VCCoreMotionManager;
  [(VCCoreMotionManager *)&v4 dealloc];
}

- (id)coreMotionManagerDelegate
{
  return objc_loadWeak((id *)&self->_coreMotionManagerDelegate);
}

- (void)setCoreMotionManagerDelegate:(id)a3
{
}

- (void)setMotionActivity:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];

  self->_motionActivity = (CMMotionActivity *)[a3 copy];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [(VCCoreMotionManager *)self getMotionActivityValueForMotionActivity:self->_motionActivity];
      CMMotionActivityConfidence v8 = [(CMMotionActivity *)self->_motionActivity confidence];
      *(_DWORD *)buf = 136316162;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      v14 = "-[VCCoreMotionManager setMotionActivity:]";
      __int16 v15 = 1024;
      int v16 = 85;
      __int16 v17 = 1024;
      int v18 = v7;
      __int16 v19 = 2048;
      CMMotionActivityConfidence v20 = v8;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d CoreMotion: Updated motion activity value=%d confidence=%ld", buf, 0x2Cu);
    }
  }
  delegateQueue = self->_delegateQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__VCCoreMotionManager_setMotionActivity___block_invoke;
  v10[3] = &unk_1E6DB3E40;
  v10[4] = self;
  v10[5] = a3;
  dispatch_async(delegateQueue, v10);
}

uint64_t __41__VCCoreMotionManager_setMotionActivity___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) coreMotionManagerDelegate];
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 didUpdateMotionActivity:v3];
}

- (void)startMonitoringMotionActivity
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  if (self->_motionActivityManager)
  {
    uint64_t v4 = v3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v11 = v5;
        __int16 v12 = 2080;
        __int16 v13 = "-[VCCoreMotionManager startMonitoringMotionActivity]";
        __int16 v14 = 1024;
        int v15 = 98;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d CoreMotion: Starting motion activity monitor", buf, 0x1Cu);
      }
    }
    motionActivityManager = self->_motionActivityManager;
    motionActivityQueue = self->_motionActivityQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__VCCoreMotionManager_startMonitoringMotionActivity__block_invoke;
    v9[3] = &unk_1E6DB5A50;
    v9[4] = v4;
    [(CMMotionActivityManager *)motionActivityManager startActivityUpdatesToQueue:motionActivityQueue withHandler:v9];
  }
}

void *__52__VCCoreMotionManager_startMonitoringMotionActivity__block_invoke(uint64_t a1, uint64_t a2)
{
  result = (void *)[*(id *)(a1 + 32) strong];
  if (a2)
  {
    return (void *)[result setMotionActivity:a2];
  }
  return result;
}

- (void)stopMonitoringMotionActivity
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_motionActivityManager)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315650;
        uint64_t v6 = v3;
        __int16 v7 = 2080;
        CMMotionActivityConfidence v8 = "-[VCCoreMotionManager stopMonitoringMotionActivity]";
        __int16 v9 = 1024;
        int v10 = 112;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d CoreMotion: Stopping motion activity monitor", (uint8_t *)&v5, 0x1Cu);
      }
    }
    [(CMMotionActivityManager *)self->_motionActivityManager stopActivityUpdates];
  }
}

- (unsigned)getMotionActivityValueForMotionActivity:(id)a3
{
  if ([a3 stationary])
  {
    LOBYTE(v4) = 1;
  }
  else if (([a3 walking] & 1) != 0 {
         || ([a3 running] & 1) != 0
  }
         || ([a3 automotive] & 1) != 0
         || (int v4 = [a3 cycling]) != 0)
  {
    LOBYTE(v4) = 2;
  }
  return v4;
}

- (CMMotionActivity)motionActivity
{
  return self->_motionActivity;
}

- (void)initWithDelegate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  int v5 = "-[VCCoreMotionManager initWithDelegate:]";
  __int16 v6 = 1024;
  int v7 = 52;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d CoreMotion: CMMotionActivity unavailable", (uint8_t *)&v2, 0x1Cu);
}

@end