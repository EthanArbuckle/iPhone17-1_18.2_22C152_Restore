@interface VCCannedVideoPacketSource
+ (BOOL)createFileAtPath:(id)a3;
+ (BOOL)overwriteFileAtPath:(id)a3;
+ (BOOL)removeFileAtPath:(id)a3;
- (BOOL)setUpSourceFileWithMode:(unsigned __int8)a3;
- (VCCannedVideoPacketSource)initWithMode:(unsigned __int8)a3 filePath:(id)a4;
- (int)startCannedInjection;
- (int)stopCannedInjection;
- (void)dealloc;
- (void)startCannedInjection;
@end

@implementation VCCannedVideoPacketSource

- (VCCannedVideoPacketSource)initWithMode:(unsigned __int8)a3 filePath:(id)a4
{
  uint64_t v5 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)VCCannedVideoPacketSource;
  v6 = [(VCCannedVideoPacketSource *)&v14 init];
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCannedVideoPacketSource initWithMode:filePath:]();
      }
    }
    goto LABEL_35;
  }
  uint64_t v7 = [a4 copy];
  v6->_filePath = (NSString *)v7;
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCannedVideoPacketSource initWithMode:filePath:]();
      }
    }
    goto LABEL_35;
  }
  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6->_rtpCallbacks = v8;
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCannedVideoPacketSource initWithMode:filePath:]();
      }
    }
    goto LABEL_35;
  }
  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v6->_rtcpCallbacks = v9;
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCannedVideoPacketSource initWithMode:filePath:].cold.4();
      }
    }
    goto LABEL_35;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(58);
  dispatch_queue_t v11 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCCannedVideoPacketSource.writequeue", 0, CustomRootQueue);
  v6->_writeQueue = (OS_dispatch_queue *)v11;
  if (!v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCannedVideoPacketSource initWithMode:filePath:].cold.5();
      }
    }
    goto LABEL_35;
  }
  CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (VCAllocatorFirstCome_Create((const __CFAllocator *)*MEMORY[0x1E4F1CF80], (uint64_t)"com.apple.AVConference.VCCannedVideoPacketSource.CannedVideoPacketBlockBufferHeaderAllocator", &v6->_blockBufferHeaderAllocator))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCannedVideoPacketSource initWithMode:filePath:].cold.8();
      }
    }
    goto LABEL_35;
  }
  if (VCAllocatorFirstCome_Create(v12, (uint64_t)"com.apple.AVConference.VCCannedVideoPacketSource.CannedRTCPPacketAllocator", &v6->_rtcpPacketAllocator))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCannedVideoPacketSource initWithMode:filePath:].cold.7();
      }
    }
    goto LABEL_35;
  }
  if (![(VCCannedVideoPacketSource *)v6 setUpSourceFileWithMode:v5])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCannedVideoPacketSource initWithMode:filePath:].cold.6();
      }
    }
LABEL_35:

    return 0;
  }
  pthread_mutex_init(&v6->_replayMutex, 0);
  pthread_cond_init(&v6->_replayCondition, 0);
  v6->_stateLock._os_unfair_lock_opaque = 0;
  return v6;
}

- (BOOL)setUpSourceFileWithMode:(unsigned __int8)a3
{
  self->_mode = a3;
  if (a3 == 2)
  {
    if (!+[VCCannedVideoPacketSource overwriteFileAtPath:self->_filePath])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v5) {
          return v5;
        }
        -[VCCannedVideoPacketSource setUpSourceFileWithMode:].cold.4();
      }
      goto LABEL_21;
    }
    v6 = (NSFileHandle *)(id)[MEMORY[0x1E4F28CB0] fileHandleForWritingAtPath:self->_filePath];
    self->_fileHandle = v6;
    if (!v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v5) {
          return v5;
        }
        -[VCCannedVideoPacketSource setUpSourceFileWithMode:]();
      }
      goto LABEL_21;
    }
LABEL_10:
    LOBYTE(v5) = 1;
    return v5;
  }
  if (a3 != 1) {
    goto LABEL_10;
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", self->_filePath) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v5) {
        return v5;
      }
      -[VCCannedVideoPacketSource setUpSourceFileWithMode:]();
    }
    goto LABEL_21;
  }
  v4 = (NSFileHandle *)(id)[MEMORY[0x1E4F28CB0] fileHandleForReadingAtPath:self->_filePath];
  self->_fileHandle = v4;
  if (v4) {
    goto LABEL_10;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v5) {
      return v5;
    }
    -[VCCannedVideoPacketSource setUpSourceFileWithMode:]();
  }
LABEL_21:
  LOBYTE(v5) = 0;
  return v5;
}

- (void)dealloc
{
  block[5] = *MEMORY[0x1E4F143B8];
  [(VCCannedVideoPacketSource *)self stopCannedInjection];
  writeQueue = self->_writeQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__VCCannedVideoPacketSource_dealloc__block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = self;
  dispatch_sync(writeQueue, block);

  blockBufferHeaderAllocator = self->_blockBufferHeaderAllocator;
  if (blockBufferHeaderAllocator) {
    CFRelease(blockBufferHeaderAllocator);
  }
  rtcpPacketAllocator = self->_rtcpPacketAllocator;
  if (rtcpPacketAllocator) {
    CFRelease(rtcpPacketAllocator);
  }
  v6 = self->_writeQueue;
  if (v6)
  {
    dispatch_release(v6);
    self->_writeQueue = 0;
  }
  pthread_mutex_destroy(&self->_replayMutex);
  pthread_cond_destroy(&self->_replayCondition);
  v7.receiver = self;
  v7.super_class = (Class)VCCannedVideoPacketSource;
  [(VCCannedVideoPacketSource *)&v7 dealloc];
}

uint64_t __36__VCCannedVideoPacketSource_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) closeFile];
}

- (int)startCannedInjection
{
  values[1] = *(void **)MEMORY[0x1E4F143B8];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_mode != 1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCannedVideoPacketSource startCannedInjection]();
      }
    }
    int v4 = 4;
    goto LABEL_6;
  }
  if (self->_cannedReplayThread)
  {
    int v4 = 0;
LABEL_6:
    os_unfair_lock_unlock(p_stateLock);
    return v4;
  }
  self->_cannedReplayThreadCanceled = 0;
  values[0] = @"com.apple.AVConference.VCCannedVideoPacketSource.CannedVideoPacketInjectionThread";
  CFDictionaryRef v5 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], MEMORY[0x1E4F21EA8], (const void **)values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (v5)
  {
    CFDictionaryRef v6 = v5;
    int v4 = FigThreadCreate();
    CFRelease(v6);
    if (!v4) {
      goto LABEL_6;
    }
    v4 |= 0xA01D0000;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCannedVideoPacketSource startCannedInjection]();
      }
    }
    os_unfair_lock_unlock(p_stateLock);
    [(VCCannedVideoPacketSource *)self stopCannedInjection];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCannedVideoPacketSource startCannedInjection]();
      }
    }
    os_unfair_lock_unlock(p_stateLock);
    return 4;
  }
  return v4;
}

- (int)stopCannedInjection
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  pthread_mutex_lock(&self->_replayMutex);
  self->_cannedReplayThreadCanceled = 1;
  pthread_cond_signal(&self->_replayCondition);
  pthread_mutex_unlock(&self->_replayMutex);
  if (self->_cannedReplayThread)
  {
    FigThreadJoin();
    self->_cannedReplayThread = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      CFDictionaryRef v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315650;
        uint64_t v8 = v4;
        __int16 v9 = 2080;
        v10 = "-[VCCannedVideoPacketSource stopCannedInjection]";
        __int16 v11 = 1024;
        int v12 = 204;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Canned video packet injection thread stopped", (uint8_t *)&v7, 0x1Cu);
      }
    }
  }
  os_unfair_lock_unlock(p_stateLock);
  return 0;
}

+ (BOOL)createFileAtPath:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  if ([v4 fileExistsAtPath:a3]) {
    return 1;
  }
  uint64_t v11 = 0;
  uint64_t v5 = [a3 stringByDeletingLastPathComponent];
  if ([v4 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v11])BOOL v6 = v11 == 0; {
  else
  }
    BOOL v6 = 0;
  if (v6)
  {
    if (([v4 createFileAtPath:a3 contents:0 attributes:0] & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          +[VCCannedVideoPacketSource createFileAtPath:]();
        }
      }
      return 0;
    }
    return 1;
  }
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (ErrorLogLevelForModule >= 3)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v13 = v9;
      __int16 v14 = 2080;
      uint64_t v15 = "+[VCCannedVideoPacketSource createFileAtPath:]";
      __int16 v16 = 1024;
      int v17 = 262;
      __int16 v18 = 2112;
      uint64_t v19 = v5;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create directory=%@ error=%@", buf, 0x30u);
    }
  }
  return 0;
}

+ (BOOL)removeFileAtPath:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  if (![v4 fileExistsAtPath:a3]) {
    return 1;
  }
  uint64_t v10 = 0;
  if ([v4 removeItemAtPath:a3 error:&v10] && v10 == 0) {
    return 1;
  }
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (ErrorLogLevelForModule >= 3)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v12 = v8;
      __int16 v13 = 2080;
      __int16 v14 = "+[VCCannedVideoPacketSource removeFileAtPath:]";
      __int16 v15 = 1024;
      int v16 = 278;
      __int16 v17 = 2112;
      id v18 = a3;
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to remove file at path=%@ error=%@", buf, 0x30u);
    }
  }
  return 0;
}

+ (BOOL)overwriteFileAtPath:(id)a3
{
  BOOL v4 = +[VCCannedVideoPacketSource removeFileAtPath:](VCCannedVideoPacketSource, "removeFileAtPath:");
  if (v4)
  {
    LOBYTE(v4) = +[VCCannedVideoPacketSource createFileAtPath:a3];
  }
  return v4;
}

uint64_t ___VCCannedVideoPacketSource_RegisterCannedReplayWriteCallbacks_block_invoke(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v5 + 8) == 2)
    {
      char v7 = 1;
      _VCCannedVideoPacketSource_WriteBytes(v5, (uint64_t)&v7, 1);
      _VCCannedVideoPacketSource_WriteBytes(v5, (uint64_t)a3, 6064);
      if (!*a3)
      {
        _VCCannedVideoPacketSource_WriteBlockBuffer(v5, (uint64_t)(a3 + 32));
        _VCCannedVideoPacketSource_WriteBlockBuffer(v5, (uint64_t)(a3 + 38));
        _VCCannedVideoPacketSource_WriteBlockBuffer(v5, (uint64_t)(a3 + 44));
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        ___VCCannedVideoPacketSource_RegisterCannedReplayWriteCallbacks_block_invoke_cold_2();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      ___VCCannedVideoPacketSource_RegisterCannedReplayWriteCallbacks_block_invoke_cold_1();
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t ___VCCannedVideoPacketSource_RegisterCannedReplayWriteCallbacks_block_invoke_49(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v5 + 8) == 2)
    {
      char v12 = *(unsigned char *)(*(void *)(a1 + 32) + 8);
      _VCCannedVideoPacketSource_WriteBytes(v5, (uint64_t)&v12, 1);
      _VCCannedVideoPacketSource_WriteBytes(v5, a3, 1640);
      if (*(unsigned char *)(a3 + 8))
      {
        unint64_t v6 = 0;
        do
          _VCCannedVideoPacketSource_WriteBytes(v5, *(void *)(a3 + 16 + 8 * v6++), 1036);
        while (v6 < *(unsigned __int8 *)(a3 + 8));
      }
      char v7 = *(OpaqueCMBlockBuffer **)(a3 + 96);
      size_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v9 = v7;
      CMBlockBufferGetDataPointer(v7, 0, 0, &v10, &v11);
      _VCCannedVideoPacketSource_WriteBlockBuffer(v5, (uint64_t)&v9);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        ___VCCannedVideoPacketSource_RegisterCannedReplayWriteCallbacks_block_invoke_49_cold_2();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      ___VCCannedVideoPacketSource_RegisterCannedReplayWriteCallbacks_block_invoke_49_cold_1();
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void ___VCCannedVideoPacketSource_WriteBytes_block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if ([*(id *)(*(void *)(a1 + 32) + 16) writeData:*(void *)(a1 + 40) error:v3]) {
    BOOL v2 = v3[0] == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      ___VCCannedVideoPacketSource_WriteBytes_block_invoke_cold_1();
    }
  }
}

uint64_t ___VCCannedVideoPacketSource_RegisterRTPCallback_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), a2);
}

uint64_t ___VCCannedVideoPacketSource_RegisterRTCPCallback_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), a2);
}

- (void)initWithMode:filePath:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize self", v2, v3, v4, v5, v6);
}

- (void)initWithMode:filePath:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Received nil file path", v2, v3, v4, v5, v6);
}

- (void)initWithMode:filePath:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create RTP callback map", v2, v3, v4, v5, v6);
}

- (void)initWithMode:filePath:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create RTCP callback map", v2, v3, v4, v5, v6);
}

- (void)initWithMode:filePath:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create write queue", v2, v3, v4, v5, v6);
}

- (void)initWithMode:filePath:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to set up source file", v2, v3, v4, v5, v6);
}

- (void)initWithMode:filePath:.cold.7()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCCannedVideoPacketSource initWithMode:filePath:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create RTCP packet allocator. Err=%d", v2, *(const char **)v3, (unint64_t)"-[VCCannedVideoPacketSource initWithMode:filePath:]" >> 16, v4);
}

- (void)initWithMode:filePath:.cold.8()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCCannedVideoPacketSource initWithMode:filePath:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create block buffer allocator. Err=%d", v2, *(const char **)v3, (unint64_t)"-[VCCannedVideoPacketSource initWithMode:filePath:]" >> 16, v4);
}

- (void)setUpSourceFileWithMode:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate file handle for reading", v2, v3, v4, v5, v6);
}

- (void)setUpSourceFileWithMode:.cold.2()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d File does not exist at path=%@");
}

- (void)setUpSourceFileWithMode:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate file handle for writing", v2, v3, v4, v5, v6);
}

- (void)setUpSourceFileWithMode:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create file for writing", v2, v3, v4, v5, v6);
}

- (void)startCannedInjection
{
  OUTLINED_FUNCTION_12_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Attempting to start canned injection while in mode=%d", v2, v3, v4, v5);
}

+ (void)createFileAtPath:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create file at path=%@");
}

void ___VCCannedVideoPacketSource_RegisterCannedReplayWriteCallbacks_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Attempting to write NULL packet", v2, v3, v4, v5, v6);
}

void ___VCCannedVideoPacketSource_RegisterCannedReplayWriteCallbacks_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_12_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Attempting to write canned video packet while in mode=%d", v2, v3, v4, v5);
}

void ___VCCannedVideoPacketSource_RegisterCannedReplayWriteCallbacks_block_invoke_49_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Attempting to write NULL packet list", v2, v3, v4, v5, v6);
}

void ___VCCannedVideoPacketSource_RegisterCannedReplayWriteCallbacks_block_invoke_49_cold_2()
{
  OUTLINED_FUNCTION_12_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Attempting to write canned video packet while in mode=%d", v2, v3, v4, v5);
}

void ___VCCannedVideoPacketSource_WriteBytes_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to write data. error=%@");
}

@end