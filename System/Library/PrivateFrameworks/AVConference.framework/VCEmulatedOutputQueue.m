@interface VCEmulatedOutputQueue
- (id)copyPacketFromPop;
- (unsigned)numberOfPacketsInOutputQueue;
- (void)connectFrom:(id)a3;
- (void)runUntilTime:(double)a3;
@end

@implementation VCEmulatedOutputQueue

- (void)runUntilTime:(double)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCEmulatedOutputQueue runUntilTime:](v3);
    }
  }
}

- (void)connectFrom:(id)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCEmulatedOutputQueue connectFrom:](v3);
    }
  }
}

- (unsigned)numberOfPacketsInOutputQueue
{
  unsigned int result = CMSimpleQueueGetCount(self->super._networkElementQueue);
  self->_numberOfPacketsInOutputQueue = result;
  return result;
}

- (id)copyPacketFromPop
{
  return (id)CMSimpleQueueDequeue(self->super._networkElementQueue);
}

- (void)runUntilTime:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 17;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d No processing should be run for the output queue!", (uint8_t *)&v2, 0x1Cu);
}

- (void)connectFrom:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 21;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Cannot not call connect from for the output queue!", (uint8_t *)&v2, 0x1Cu);
}

@end