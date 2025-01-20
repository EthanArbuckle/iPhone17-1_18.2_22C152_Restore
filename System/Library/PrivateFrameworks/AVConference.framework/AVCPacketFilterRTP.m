@interface AVCPacketFilterRTP
- (AVCPacketFilterRTP)initWithIncomingSSRC:(unsigned int)a3 acceptPacketType:(unsigned __int8)a4;
- (BOOL)isMatchedPacket:(const void *)a3 size:(int)a4;
- (BOOL)isPayloadTypeMatched:(BOOL)a3;
- (BOOL)isRTCPPayload:(unsigned __int16)a3;
- (unsigned)type;
@end

@implementation AVCPacketFilterRTP

- (AVCPacketFilterRTP)initWithIncomingSSRC:(unsigned int)a3 acceptPacketType:(unsigned __int8)a4
{
  int v4 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v16 = v7;
      __int16 v17 = 2080;
      v18 = "-[AVCPacketFilterRTP initWithIncomingSSRC:acceptPacketType:]";
      __int16 v19 = 1024;
      int v20 = 37;
      __int16 v21 = 1024;
      unsigned int v22 = a3;
      __int16 v23 = 1024;
      int v24 = v4;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SSRC=%u, type=%hhu", buf, 0x28u);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)AVCPacketFilterRTP;
  v9 = [(AVCPacketFilterRTP *)&v14 init];
  v10 = v9;
  if (v9)
  {
    *((_DWORD *)&v9->super._isRTPFilter + 1) = a3;
    LOBYTE(v9->_SSRC) = v4;
    v9->super._isRTPFilter = 1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v16 = v11;
        __int16 v17 = 2080;
        v18 = "-[AVCPacketFilterRTP initWithIncomingSSRC:acceptPacketType:]";
        __int16 v19 = 1024;
        int v20 = 42;
        __int16 v21 = 1024;
        unsigned int v22 = a3;
        __int16 v23 = 1024;
        int v24 = v4;
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCPacketFilterRTP: init filter with SSRC %08X, type %d", buf, 0x28u);
      }
    }
  }
  return v10;
}

- (BOOL)isRTCPPayload:(unsigned __int16)a3
{
  return (a3 - 200) < 5 || (a3 - 192) < 3;
}

- (BOOL)isPayloadTypeMatched:(BOOL)a3
{
  int SSRC_low = LOBYTE(self->_SSRC);
  if (!LOBYTE(self->_SSRC)) {
    return 1;
  }
  if (SSRC_low != 2) {
    return SSRC_low == 1 && !a3;
  }
  return a3;
}

- (BOOL)isMatchedPacket:(const void *)a3 size:(int)a4
{
  if (a4 < 2) {
    return 0;
  }
  BOOL v7 = [(AVCPacketFilterRTP *)self isRTCPPayload:*((unsigned __int8 *)a3 + 1)];
  if (v7)
  {
    if (a4 >= 8)
    {
      uint64_t v8 = 4;
      goto LABEL_7;
    }
    return 0;
  }
  if (a4 < 0xC) {
    return 0;
  }
  uint64_t v8 = 8;
LABEL_7:
  if (bswap32(*(_DWORD *)((char *)a3 + v8)) != *((_DWORD *)&self->super._isRTPFilter + 1)) {
    return 0;
  }

  return [(AVCPacketFilterRTP *)self isPayloadTypeMatched:v7];
}

- (unsigned)type
{
  return self->_SSRC;
}

@end