@interface SnapshotTimer
+ (void)takeSnapshotForTask:(id)a3;
- (BOOL)taskIsComplete;
- (SnapshotTimer)init;
- (void)checkinWithTimeout:(double)a3 forTask:(id)a4;
- (void)checkout;
- (void)setTaskIsComplete:(BOOL)a3;
@end

@implementation SnapshotTimer

- (SnapshotTimer)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)SnapshotTimer;
  result = [(SnapshotTimer *)&v3 init];
  if (result) {
    result->taskIsComplete = 0;
  }
  return result;
}

+ (void)takeSnapshotForTask:(id)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      +[SnapshotTimer takeSnapshotForTask:](v3, v4);
    }
  }
}

- (void)checkinWithTimeout:(double)a3 forTask:(id)a4
{
  block[6] = *MEMORY[0x1E4F143B8];
  if (a3 == 0.0)
  {
    +[SnapshotTimer takeSnapshotForTask:](SnapshotTimer, "takeSnapshotForTask:");
  }
  else
  {
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__SnapshotTimer_checkinWithTimeout_forTask___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = self;
    block[5] = a4;
    dispatch_after(v6, global_queue, block);
  }
}

void __44__SnapshotTimer_checkinWithTimeout_forTask___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) taskIsComplete])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v2 = VRTraceErrorLogLevelToCSTR();
      uint64_t v3 = *MEMORY[0x1E4F47A50];
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v5 = [*(id *)(a1 + 40) UTF8String];
          int v7 = 136315906;
          uint64_t v8 = v2;
          __int16 v9 = 2080;
          v10 = "-[SnapshotTimer checkinWithTimeout:forTask:]_block_invoke";
          __int16 v11 = 1024;
          int v12 = 44;
          __int16 v13 = 2080;
          uint64_t v14 = v5;
          _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SnapshotTimer: %s complete before deadline, ignored", (uint8_t *)&v7, 0x26u);
        }
      }
      else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        __44__SnapshotTimer_checkinWithTimeout_forTask___block_invoke_cold_1(v2, a1, v3);
      }
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    +[SnapshotTimer takeSnapshotForTask:v6];
  }
}

- (void)checkout
{
}

- (BOOL)taskIsComplete
{
  return self->taskIsComplete;
}

- (void)setTaskIsComplete:(BOOL)a3
{
  self->taskIsComplete = a3;
}

+ (void)takeSnapshotForTask:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "+[SnapshotTimer takeSnapshotForTask:]";
  __int16 v6 = 1024;
  int v7 = 29;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d MarcoPerformSnapshot no longer in use", (uint8_t *)&v2, 0x1Cu);
}

void __44__SnapshotTimer_checkinWithTimeout_forTask___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a2 + 40) UTF8String];
  int v6 = 136315906;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  __int16 v9 = "-[SnapshotTimer checkinWithTimeout:forTask:]_block_invoke";
  __int16 v10 = 1024;
  int v11 = 44;
  __int16 v12 = 2080;
  uint64_t v13 = v5;
  _os_log_debug_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_DEBUG, " [%s] %s:%d SnapshotTimer: %s complete before deadline, ignored", (uint8_t *)&v6, 0x26u);
}

@end