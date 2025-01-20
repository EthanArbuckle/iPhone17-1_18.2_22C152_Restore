@interface VCXPCConnection
+ (void)selfTerminateDueToTimeout:(id)a3;
- (BOOL)isPersistent;
- (NSData)tokenData;
- (NSString)lastCalledApiName;
- (OS_xpc_object)connection;
- (VCXPCConnection)init;
- (id)context;
- (id)description;
- (int)pid;
- (void)createTimeoutTimer;
- (void)dealloc;
- (void)destroyTimeoutTimer;
- (void)setConnection:(id)a3;
- (void)setContext:(id)a3;
- (void)setLastCalledApiName:(id)a3;
- (void)setPersistent:(BOOL)a3;
- (void)setPid:(int)pid;
- (void)setTokenData:(id)a3;
- (void)startTimeoutTimer;
- (void)stopTimeoutTimer;
@end

@implementation VCXPCConnection

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)stopTimeoutTimer
{
  if (self->_timeoutTimerStarted)
  {
    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      dispatch_source_set_timer(timeoutTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0x1DCD6500uLL);
      self->_timeoutTimerStarted = 0;
    }
  }
}

- (void)startTimeoutTimer
{
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    dispatch_time_t v4 = dispatch_time(0, 11000000000);
    dispatch_source_set_timer(timeoutTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
    self->_timeoutTimerStarted = 1;
  }
}

- (void)setPersistent:(BOOL)a3
{
  self->_isPersistent = a3;
  if (a3)
  {
    transaction = self->_transaction;
    if (transaction)
    {

      self->_transaction = 0;
    }
  }
}

- (void)setLastCalledApiName:(id)a3
{
}

- (NSData)tokenData
{
  return self->tokenData;
}

- (void)setTokenData:(id)a3
{
}

- (id)context
{
  return self->context;
}

- (void)setPid:(int)pid
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  self->_pid = pid;
  p_pid = &self->_pid;
  transaction = self->_transaction;
  if (transaction)
  {

    self->_transaction = 0;
    pid = self->_pid;
  }
  memset(buffer, 0, sizeof(buffer));
  proc_name(pid, buffer, 0x20u);
  v6 = 0;
  asprintf(&v6, "AVConference %d %s", *p_pid, (const char *)buffer);
  if (v6)
  {
    self->_transaction = (OS_os_transaction *)FigOSTransactionCreate();
    free(v6);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCXPCConnection setPid:]();
    }
  }
}

- (void)setConnection:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  connection = self->_connection;
  if (connection == a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315650;
        uint64_t v9 = v6;
        __int16 v10 = 2080;
        v11 = "-[VCXPCConnection setConnection:]";
        __int16 v12 = 1024;
        int v13 = 211;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVConferenceXPCServer [%s] %s:%d setting connection again with same value", (uint8_t *)&v8, 0x1Cu);
      }
    }
  }
  else
  {
    if (connection)
    {
      xpc_connection_cancel(connection);
      xpc_release(self->_connection);
    }
    if (a3) {
      xpc_retain(a3);
    }
    self->_connection = (OS_xpc_object *)a3;
  }
}

- (VCXPCConnection)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCXPCConnection;
  v2 = [(VCXPCConnection *)&v4 init];
  if (v2) {
    v2->_lastCalledApiName = (NSString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
  }
  return v2;
}

- (void)createTimeoutTimer
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "AVConferenceXPCServer [%s] %s:%d Failed to create timeoutQueueLabel for PID %d", v2, v3, v4, 124);
}

- (void)setContext:(id)a3
{
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [(VCXPCConnection *)self destroyTimeoutTimer];
  [(VCXPCConnection *)self setConnection:0];
  [(VCXPCConnection *)self setContext:0];
  [(VCXPCConnection *)self setTokenData:0];
  [(VCXPCConnection *)self setLastCalledApiName:0];
  transaction = self->_transaction;
  if (transaction)
  {

    self->_transaction = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VCXPCConnection;
  [(VCXPCConnection *)&v4 dealloc];
}

- (void)destroyTimeoutTimer
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  LODWORD(v6) = 145;
  WORD2(v6) = 2048;
  HIWORD(v6) = v0;
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v1, v2, "AVConferenceXPCServer [%s] %s:%d [%p] timer has been cancelled", v3, v4, v5, v6);
}

+ (void)selfTerminateDueToTimeout:(id)a3
{
  *(void *)&v12[1021] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 pid];
  bzero(v12, 0x3FDuLL);
  memset(buffer, 63, sizeof(buffer));
  proc_name(v4, buffer, 0x400u);
  uint64_t v5 = getpid();
  bzero(v10, 0x3FDuLL);
  memset(v9, 63, sizeof(v9));
  proc_name(v5, v9, 0x400u);
  uint64_t v6 = NSString;
  v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = [v6 stringWithFormat:@"%s: Terminating %s [%d] due to timeout (client %s [%d]) (API NAME: %@)", class_getName(v7), v9, v5, buffer, v4, objc_msgSend(a3, "lastCalledApiName")];
  VCTerminateProcess(v8, @"AVConferenceXPCServer", 0);
}

- (int)pid
{
  return self->_pid;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<VCXPCConnection connection: %p client pid: %d, context: %@>\n", self->_connection, self->_pid, self->context];
}

- (BOOL)isPersistent
{
  return self->_isPersistent;
}

- (NSString)lastCalledApiName
{
  return self->_lastCalledApiName;
}

- (void)setPid:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "AVConferenceXPCServer [%s] %s:%d Failed to create description for PID %d", v2, v3, v4, 182);
}

@end