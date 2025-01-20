@interface GKOOBMessage
- (BOOL)_checkSize:(unint64_t)a3;
- (BOOL)_checkType:(unsigned __int16)a3;
- (GKOOBMessage)initWithBytes:(const void *)a3 length:(unint64_t)a4;
- (GKOOBMessage)initWithMessageType:(unsigned __int16)a3;
- (id)data;
- (unsigned)type;
@end

@implementation GKOOBMessage

- (GKOOBMessage)initWithMessageType:(unsigned __int16)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKOOBMessage;
  result = [(GKOOBMessage *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (GKOOBMessage)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v20 = v7;
      __int16 v21 = 2080;
      v22 = "-[GKOOBMessage initWithBytes:length:]";
      __int16 v23 = 1024;
      int v24 = 25;
      __int16 v25 = 2048;
      v26 = a3;
      __int16 v27 = 1024;
      int v28 = a4;
      _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKOOBMessage initWithBytes (%p, %d)", buf, 0x2Cu);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)GKOOBMessage;
  v9 = [(GKOOBMessage *)&v18 init];
  v10 = v9;
  if (v9)
  {
    if (!a3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 4)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
          -[GKOOBMessage initWithBytes:length:](v11, v12);
        }
      }
      goto LABEL_25;
    }
    if (a4 <= 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 4)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
          -[GKOOBMessage initWithBytes:length:]();
        }
      }
LABEL_25:

      return 0;
    }
    unsigned int v13 = bswap32(*(unsigned __int16 *)a3) >> 16;
    if (![(GKOOBMessage *)v9 _checkType:v13])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x263F21098];
        v16 = *MEMORY[0x263F21098];
        if (*MEMORY[0x263F21088])
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v20 = v14;
            __int16 v21 = 2080;
            v22 = "-[GKOOBMessage initWithBytes:length:]";
            __int16 v23 = 1024;
            int v24 = 53;
            __int16 v25 = 1024;
            LODWORD(v26) = v13;
            _os_log_impl(&dword_221563000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d GKOOBMessage init: Message type mismatch - type = %d", buf, 0x22u);
          }
        }
        else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          -[GKOOBMessage initWithBytes:length:].cold.4(v14, v13, v15);
        }
      }
      goto LABEL_25;
    }
    if (![(GKOOBMessage *)v10 _checkSize:(int)a4])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 4)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
          -[GKOOBMessage initWithBytes:length:]();
        }
      }
      goto LABEL_25;
    }
    v10->_type = v13;
  }
  return v10;
}

- (id)data
{
  __int16 v3 = bswap32(self->_type) >> 16;
  return (id)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v3 length:2];
}

- (BOOL)_checkType:(unsigned __int16)a3
{
  return a3 == 1500;
}

- (BOOL)_checkSize:(unint64_t)a3
{
  return a3 == 2;
}

- (unsigned)type
{
  return self->_type;
}

- (void)initWithBytes:(uint64_t)a1 length:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  objc_super v5 = "-[GKOOBMessage initWithBytes:length:]";
  __int16 v6 = 1024;
  int v7 = 30;
  _os_log_error_impl(&dword_221563000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d GKOOBMessage init: null buffer", (uint8_t *)&v2, 0x1Cu);
}

- (void)initWithBytes:length:.cold.2()
{
  OUTLINED_FUNCTION_0();
  *(void *)&v3[6] = "-[GKOOBMessage initWithBytes:length:]";
  OUTLINED_FUNCTION_1(&dword_221563000, v0, v1, " [%s] %s:%d GKOOBMessage init: size is too small %d", v2, *(const char **)v3, (unint64_t)"-[GKOOBMessage initWithBytes:length:]" >> 16, 36);
}

- (void)initWithBytes:length:.cold.3()
{
  OUTLINED_FUNCTION_0();
  *(void *)&v3[6] = "-[GKOOBMessage initWithBytes:length:]";
  OUTLINED_FUNCTION_1(&dword_221563000, v0, v1, " [%s] %s:%d GKOOBMessage is the wrong size: %u", v2, *(const char **)v3, (unint64_t)"-[GKOOBMessage initWithBytes:length:]" >> 16, 46);
}

- (void)initWithBytes:(os_log_t)log length:.cold.4(uint64_t a1, unsigned __int16 a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = 136315906;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  __int16 v6 = "-[GKOOBMessage initWithBytes:length:]";
  __int16 v7 = 1024;
  int v8 = 53;
  __int16 v9 = 1024;
  int v10 = a2;
  _os_log_debug_impl(&dword_221563000, log, OS_LOG_TYPE_DEBUG, " [%s] %s:%d GKOOBMessage init: Message type mismatch - type = %d", (uint8_t *)&v3, 0x22u);
}

@end