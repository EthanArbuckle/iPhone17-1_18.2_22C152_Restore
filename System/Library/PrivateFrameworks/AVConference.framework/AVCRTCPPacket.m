@interface AVCRTCPPacket
+ (id)newPacketWithRTCPPacket:(tagRTCPPACKET *)a3 packetLength:(unint64_t)a4;
- (AVCRTCPPacket)initWithRTCPPacket:(tagRTCPPACKET *)a3;
- (id)description;
- (unsigned)SSRC;
- (unsigned)packetType;
- (void)setPacketType:(unsigned __int8)a3;
- (void)setSSRC:(unsigned int)a3;
@end

@implementation AVCRTCPPacket

+ (id)newPacketWithRTCPPacket:(tagRTCPPACKET *)a3 packetLength:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  tagRTCPCOMMON var0 = a3->var0;
  switch(*(unsigned int *)&var0 >> 8)
  {
    case 0xC8u:
      if (24 * (unint64_t)(*(unsigned char *)&var0 & 0x1F) + 28 > a4) {
        goto LABEL_2;
      }
      v8 = AVCRTCPSenderReport;
      goto LABEL_9;
    case 0xC9u:
      if (24 * (*(unsigned char *)&var0 & 0x1Fu) + 8 > a4) {
        goto LABEL_2;
      }
      v8 = AVCRTCPReceiverReport;
      goto LABEL_9;
    case 0xCAu:
      if (a3->var0.var4 - 67 < 0xFFFFFFBE) {
        goto LABEL_2;
      }
      v8 = AVCRTCPSourceDescription;
LABEL_9:
      id v9 = [v8 alloc];
      id result = (id)[v9 initWithRTCPPacket:a3];
      break;
    case 0xCCu:
    case 0xCDu:
    case 0xCEu:
      goto LABEL_2;
    default:
      if ((id)objc_opt_class() == a1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            +[AVCRTCPPacket newPacketWithRTCPPacket:packetLength:]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v10 = (__CFString *)[a1 performSelector:sel_logPrefix];
        }
        else {
          v10 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            int v13 = *((unsigned __int8 *)&a3->var0 + 1);
            int v14 = 136316418;
            uint64_t v15 = v11;
            __int16 v16 = 2080;
            v17 = "+[AVCRTCPPacket newPacketWithRTCPPacket:packetLength:]";
            __int16 v18 = 1024;
            int v19 = 54;
            __int16 v20 = 2112;
            v21 = v10;
            __int16 v22 = 2048;
            id v23 = a1;
            __int16 v24 = 1024;
            int v25 = v13;
            _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid packet type: %d", (uint8_t *)&v14, 0x36u);
          }
        }
      }
LABEL_2:
      id result = 0;
      break;
  }
  return result;
}

- (AVCRTCPPacket)initWithRTCPPacket:(tagRTCPPACKET *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)AVCRTCPPacket;
  v4 = [(AVCRTCPPacket *)&v20 init];
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      int v6 = *((unsigned __int8 *)&a3->var0 + 1);
      if (v6 == 202 || v6 == 201 || v6 == 200)
      {
        v4->_packetType = v6;
        v4->_SSRC = a3->var1.var0.var0;
        return v5;
      }
      if ((AVCRTCPPacket *)objc_opt_class() == v4)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCRTCPPacket initWithRTCPPacket:]();
          }
        }
        goto LABEL_26;
      }
      if (objc_opt_respondsToSelector()) {
        v8 = (__CFString *)[(AVCRTCPPacket *)v5 performSelector:sel_logPrefix];
      }
      else {
        v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (uint64_t v16 = VRTraceErrorLogLevelToCSTR(),
            v17 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
      {
LABEL_26:

        return 0;
      }
      int v19 = *((unsigned __int8 *)&a3->var0 + 1);
      *(_DWORD *)buf = 136316418;
      uint64_t v22 = v16;
      __int16 v23 = 2080;
      __int16 v24 = "-[AVCRTCPPacket initWithRTCPPacket:]";
      __int16 v25 = 1024;
      int v26 = 85;
      __int16 v27 = 2112;
      v28 = v8;
      __int16 v29 = 2048;
      v30 = v5;
      __int16 v31 = 1024;
      int v32 = v19;
      int v13 = " [%s] %s:%d %@(%p) Invalid packet type: %d";
      int v14 = v17;
      uint32_t v15 = 54;
    }
    else
    {
      if ((AVCRTCPPacket *)objc_opt_class() == v4)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVCRTCPPacket initWithRTCPPacket:](v9, v10);
          }
        }
        goto LABEL_26;
      }
      if (objc_opt_respondsToSelector()) {
        v7 = (__CFString *)[(AVCRTCPPacket *)v5 performSelector:sel_logPrefix];
      }
      else {
        v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_26;
      }
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v22 = v11;
      __int16 v23 = 2080;
      __int16 v24 = "-[AVCRTCPPacket initWithRTCPPacket:]";
      __int16 v25 = 1024;
      int v26 = 66;
      __int16 v27 = 2112;
      v28 = v7;
      __int16 v29 = 2048;
      v30 = v5;
      int v13 = " [%s] %s:%d %@(%p) RTPC Packet is nil";
      int v14 = v12;
      uint32_t v15 = 48;
    }
    _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
    goto LABEL_26;
  }
  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"packetType:%u, SSRC:%u", -[AVCRTCPPacket packetType](self, "packetType"), -[AVCRTCPPacket SSRC](self, "SSRC")];
}

- (unsigned)packetType
{
  return self->_packetType;
}

- (void)setPacketType:(unsigned __int8)a3
{
  self->_packetType = a3;
}

- (unsigned)SSRC
{
  return self->_SSRC;
}

- (void)setSSRC:(unsigned int)a3
{
  self->_SSRC = a3;
}

+ (void)newPacketWithRTCPPacket:packetLength:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  *(void *)&v3[6] = "+[AVCRTCPPacket newPacketWithRTCPPacket:packetLength:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid packet type: %d", v2, *(const char **)v3, (unint64_t)"+[AVCRTCPPacket newPacketWithRTCPPacket:packetLength:]" >> 16, 54);
}

- (void)initWithRTCPPacket:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  v5 = "-[AVCRTCPPacket initWithRTCPPacket:]";
  __int16 v6 = 1024;
  int v7 = 66;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d RTPC Packet is nil", (uint8_t *)&v2, 0x1Cu);
}

- (void)initWithRTCPPacket:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  *(void *)&v3[6] = "-[AVCRTCPPacket initWithRTCPPacket:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid packet type: %d", v2, *(const char **)v3, (unint64_t)"-[AVCRTCPPacket initWithRTCPPacket:]" >> 16, 85);
}

@end