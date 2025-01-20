@interface AVCPacketRelayDriver
+ (AVCPacketRelayDriver)sharedInstance;
- (AVCPacketRelayDriver)init;
- (void)dealloc;
- (void)init;
- (void)startMonitoringFileDescriptor:(int)a3 forConnection:(id)a4;
- (void)stopMonitoringFileDescriptor:(int)a3;
@end

@implementation AVCPacketRelayDriver

+ (AVCPacketRelayDriver)sharedInstance
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  Weak = (AVCPacketRelayDriver *)objc_loadWeak(&sharedInstance_sharedInstance_2);
  if (!Weak)
  {
    v4 = objc_alloc_init(AVCPacketRelayDriver);
    objc_storeWeak(&sharedInstance_sharedInstance_2, v4);
    Weak = v4;
  }
  objc_sync_exit(v2);
  return Weak;
}

- (void)startMonitoringFileDescriptor:(int)a3 forConnection:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316162;
      uint64_t v10 = v6;
      __int16 v11 = 2080;
      v12 = "-[AVCPacketRelayDriver startMonitoringFileDescriptor:forConnection:]";
      __int16 v13 = 1024;
      int v14 = 32;
      __int16 v15 = 1024;
      int v16 = a3;
      __int16 v17 = 2112;
      id v18 = a4;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d fileDescriptor=%d, connection=%@", (uint8_t *)&v9, 0x2Cu);
    }
  }
  if (a3 == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCPacketRelayDriver startMonitoringFileDescriptor:forConnection:](v8);
      }
    }
  }
  else
  {
    AVCPacketRelayDriverThreadAddFileDescriptorWithConnection(a3, (uint64_t)a4);
  }
}

- (void)stopMonitoringFileDescriptor:(int)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v4;
      __int16 v9 = 2080;
      uint64_t v10 = "-[AVCPacketRelayDriver stopMonitoringFileDescriptor:]";
      __int16 v11 = 1024;
      int v12 = 42;
      __int16 v13 = 1024;
      int v14 = a3;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d fileDescriptor=%d", (uint8_t *)&v7, 0x22u);
    }
  }
  if (a3 == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCPacketRelayDriver stopMonitoringFileDescriptor:](v6);
      }
    }
  }
  else
  {
    AVCPacketRelayDriverThreadRemoveFileDescriptor(a3);
  }
}

- (AVCPacketRelayDriver)init
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)AVCPacketRelayDriver;
  v2 = [(AVCPacketRelayDriver *)&v10 init];
  if (v2)
  {
    int v3 = AVCPacketRelayDriverThreadStart();
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v3 == -1)
    {
      if (ErrorLogLevelForModule >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          [(AVCPacketRelayDriver *)v7 init];
        }
      }

      return 0;
    }
    else if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v12 = v5;
        __int16 v13 = 2080;
        int v14 = "-[AVCPacketRelayDriver init]";
        __int16 v15 = 1024;
        int v16 = 60;
        __int16 v17 = 2048;
        id v18 = v2;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelayDriver init %p", buf, 0x26u);
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  AVCPacketRelayDriverThreadStop();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      __int16 v9 = "-[AVCPacketRelayDriver dealloc]";
      __int16 v10 = 1024;
      int v11 = 68;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketRelayDriver dealloc", buf, 0x1Cu);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)AVCPacketRelayDriver;
  [(AVCPacketRelayDriver *)&v5 dealloc];
}

- (void)startMonitoringFileDescriptor:(uint64_t)a1 forConnection:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 34;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d AVCPacketRelayDriver: invalid file descriptor to drive", (uint8_t *)&v2, 0x1Cu);
}

- (void)stopMonitoringFileDescriptor:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 44;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d AVCPacketRelayDriver: invalid file descriptor to stop", (uint8_t *)&v2, 0x1Cu);
}

- (void)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v4 = *__error();
  int v5 = 136315906;
  uint64_t v6 = a1;
  __int16 v7 = 2080;
  __int16 v8 = "-[AVCPacketRelayDriver init]";
  __int16 v9 = 1024;
  int v10 = 56;
  __int16 v11 = 1024;
  int v12 = v4;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d AVCPacketRelayDriver init failed: unable to start driver thread with errno %d", (uint8_t *)&v5, 0x22u);
}

@end