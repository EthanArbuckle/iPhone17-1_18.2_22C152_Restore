@interface GKVoiceChatSessionMessage
- (BOOL)_checkSize:(unint64_t)a3;
- (BOOL)_checkType:(unsigned __int16)a3;
- (GKVoiceChatSessionMessage)init;
- (GKVoiceChatSessionMessage)initWithBytes:(const void *)a3 length:(unint64_t)a4;
- (GKVoiceChatSessionMessage)initWithPayload:(id)a3 conferenceID:(unsigned int)a4 subtype:(unsigned int)a5;
- (id)data;
- (id)payload;
- (unsigned)conferenceID;
- (unsigned)subtype;
- (void)dealloc;
@end

@implementation GKVoiceChatSessionMessage

- (GKVoiceChatSessionMessage)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKVoiceChatSessionMessage;
  result = [(GKVoiceChatSessionMessage *)&v3 init];
  if (result)
  {
    result->super._type = 1600;
    result->_data = 0;
  }
  return result;
}

- (GKVoiceChatSessionMessage)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)GKVoiceChatSessionMessage;
  v6 = -[GKOOBMessage initWithBytes:length:](&v10, sel_initWithBytes_length_);
  v7 = v6;
  if (v6)
  {
    if (a3)
    {
      if (a4 <= 0xB)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
            -[GKVoiceChatSessionMessage initWithBytes:length:]();
          }
        }
      }
      else
      {
        v6->super._type = bswap32(*(unsigned __int16 *)a3) >> 16;
        v6->_conferenceID = *((_DWORD *)a3 + 1);
        v6->_subtype = bswap32(*((_DWORD *)a3 + 2));
        uint64_t v8 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:a3 length:a4];
        v7->_data = (NSData *)v8;
        if (v8) {
          return v7;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
            -[GKVoiceChatSessionMessage initWithBytes:length:]();
          }
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
        -[GKVoiceChatSessionMessage initWithBytes:length:]();
      }
    }

    return 0;
  }
  return v7;
}

- (GKVoiceChatSessionMessage)initWithPayload:(id)a3 conferenceID:(unsigned int)a4 subtype:(unsigned int)a5
{
  v13.receiver = self;
  v13.super_class = (Class)GKVoiceChatSessionMessage;
  uint64_t v8 = [(GKVoiceChatSessionMessage *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->super._type = 1600;
    v8->_conferenceID = a4;
    v8->_subtype = a5;
    v12[0] = -1431683066;
    v12[1] = v8->_conferenceID;
    v12[2] = bswap32(a5);
    objc_super v10 = (NSData *)[objc_alloc(MEMORY[0x263EFF990]) initWithBytes:v12 length:12];
    [(NSData *)v10 appendData:a3];
    v9->_data = v10;
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GKVoiceChatSessionMessage;
  [(GKVoiceChatSessionMessage *)&v3 dealloc];
}

- (id)data
{
  return self->_data;
}

- (id)payload
{
  objc_super v3 = (void *)MEMORY[0x263EFF8F8];
  v4 = [(NSData *)self->_data bytes] + 12;
  NSUInteger v5 = [(NSData *)self->_data length] - 12;
  return (id)[v3 dataWithBytes:v4 length:v5];
}

- (unsigned)subtype
{
  return self->_subtype;
}

- (BOOL)_checkType:(unsigned __int16)a3
{
  return a3 == 1600;
}

- (BOOL)_checkSize:(unint64_t)a3
{
  return a3 > 5;
}

- (unsigned)conferenceID
{
  return self->_conferenceID;
}

- (void)initWithBytes:length:.cold.1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d Buffer is NULL", v2, v3, v4, v5, v6);
}

- (void)initWithBytes:length:.cold.2()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d Size is too small", v2, v3, v4, v5, v6);
}

- (void)initWithBytes:length:.cold.3()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_8(&dword_221563000, v0, v1, " [%s] %s:%d Failed to allocate data buffer", v2, v3, v4, v5, v6);
}

@end