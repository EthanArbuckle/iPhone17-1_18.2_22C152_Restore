@interface VCTransportSessionProxy
- (BOOL)isIPv6;
- (VCTransportSessionProxy)initWithTransportSessionID:(unsigned int)a3;
- (int)createVFD:(int *)a3 forStreamType:(unsigned int)a4;
- (int)networkInterfaceType;
- (unsigned)networkMTU;
- (void)start;
@end

@implementation VCTransportSessionProxy

- (VCTransportSessionProxy)initWithTransportSessionID:(unsigned int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCTransportSessionProxy;
  result = [(VCTransportSession *)&v5 initWithNotificationQueue:0 reportingAgent:0];
  if (result)
  {
    if (a3)
    {
      *(_DWORD *)(&result->super._shouldIgnoreConnectionRefusedError + 2) = a3;
    }
    else
    {

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCTransportSessionProxy initWithTransportSessionID:]();
        }
      }
      return 0;
    }
  }
  return result;
}

- (void)start
{
}

- (int)createVFD:(int *)a3 forStreamType:(unsigned int)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unsigned int v9 = -1;
  if (a3)
  {
    int v6 = +[VCTransportSession vtpPacketTypeForStreamType:*(void *)&a4];
    if (v6)
    {
      int v7 = VCCreateVFDForIDS(v6, 43, (int *)&v9);
      if ((v7 & 0x80000000) == 0)
      {
        if (VTP_SetTransportSessionID(v9, *(_DWORD *)(&self->super._shouldIgnoreConnectionRefusedError + 2)) == -1)
        {
          int v7 = *__error() | 0xC02B0000;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCTransportSessionProxy createVFD:forStreamType:]();
            }
          }
        }
        else
        {
          *a3 = v9;
          unsigned int v9 = -1;
        }
      }
    }
    else
    {
      int v7 = -2144665599;
    }
  }
  else
  {
    int v7 = -2144665599;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCTransportSessionProxy createVFD:forStreamType:]();
      }
    }
  }
  VCCloseVFDIfValid(v9);
  return v7;
}

- (int)networkInterfaceType
{
  return 3;
}

- (unsigned)networkMTU
{
  return 1280;
}

- (BOOL)isIPv6
{
  return 1;
}

- (void)initWithTransportSessionID:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 28;
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid transportSessionID", v1, 0x1Cu);
}

- (void)createVFD:forStreamType:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 44;
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d NULL vfd", v1, 0x1Cu);
}

- (void)createVFD:forStreamType:.cold.2()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  objc_super v5 = "-[VCTransportSessionProxy createVFD:forStreamType:]";
  __int16 v6 = 1024;
  int v7 = 53;
  __int16 v8 = 1024;
  int v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d VTP_SetTransportSessionID failed %x", v3, 0x22u);
}

@end