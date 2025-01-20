@interface VCDatagramChannelIDSEmulated
- (BOOL)writeToEmulatedNetworkWithDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramInfo:(id)a5 options:(id *)a6;
- (VCDatagramChannelIDSEmulated)initWithIDSDatagramChannel:(id)a3 mode:(int64_t)a4;
- (id)connectedLinks;
- (id)defaultLink;
- (id)destination;
- (int)dataPath;
- (int)start;
- (unsigned)token;
- (void)dealloc;
- (void)invalidate;
- (void)optInStreamIDs:(id)a3;
- (void)optOutStreamIDs:(id)a3;
- (void)osChannelInfoLog;
- (void)readyToRead;
- (void)requestSessionInfoWithOptions:(id)a3;
- (void)setChannelPreferences:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setOneToOneModeEnabled:(BOOL)a3 isInitiator:(BOOL)a4;
- (void)setReadHandler:(id)a3;
- (void)setWiFiAssist:(BOOL)a3;
- (void)setupEmulatedNetwork;
- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramInfo:(id)a5 options:(id *)a6 completionHandler:(id)a7;
- (void)writeDatagrams:(const void *)a3 datagramsSize:(unsigned int *)a4 datagramsInfo:(id *)a5 datagramsCount:(int)a6 options:(id *)a7 completionHandler:(id)a8;
@end

@implementation VCDatagramChannelIDSEmulated

- (VCDatagramChannelIDSEmulated)initWithIDSDatagramChannel:(id)a3 mode:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VCDatagramChannelIDSEmulated;
  v6 = [(VCObject *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_mode = a4;
    v6->_idsChannel = (VCDatagramChannelIDS *)a3;
    v7->super._token = VCDatagramChannelIDS_Token((uint64_t)a3);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v13 = v8;
        __int16 v14 = 2080;
        v15 = "-[VCDatagramChannelIDSEmulated initWithIDSDatagramChannel:mode:]";
        __int16 v16 = 1024;
        int v17 = 31;
        __int16 v18 = 2048;
        v19 = v7;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCDatagramChannelIDSEmulated %p created", buf, 0x26u);
      }
    }
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      idsChannel = self->_idsChannel;
      network = self->_network;
      *(_DWORD *)buf = 136316418;
      uint64_t v9 = v3;
      __int16 v10 = 2080;
      objc_super v11 = "-[VCDatagramChannelIDSEmulated dealloc]";
      __int16 v12 = 1024;
      int v13 = 37;
      __int16 v14 = 2048;
      v15 = self;
      __int16 v16 = 2048;
      int v17 = idsChannel;
      __int16 v18 = 2048;
      v19 = network;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCDatagramChannelIDSEmulated %p dealloc called: _idsChannel %p, _network %p", buf, 0x3Au);
    }
  }
  [(VCDatagramChannelIDSEmulated *)self invalidate];

  self->_network = 0;
  v7.receiver = self;
  v7.super_class = (Class)VCDatagramChannelIDSEmulated;
  [(VCDatagramChannelIDS *)&v7 dealloc];
}

- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramInfo:(id)a5 options:(id *)a6 completionHandler:(id)a7
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_isStarted)
  {
    int64_t mode = self->_mode;
    if (mode == 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCDatagramChannelIDSEmulated writeDatagram:datagramSize:datagramInfo:options:completionHandler:]();
        }
      }
    }
    else if (mode)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCDatagramChannelIDSEmulated writeDatagram:datagramSize:datagramInfo:options:completionHandler:]();
        }
      }
    }
    else
    {
      -[VCDatagramChannelIDSEmulated writeToEmulatedNetworkWithDatagram:datagramSize:datagramInfo:options:](self, "writeToEmulatedNetworkWithDatagram:datagramSize:datagramInfo:options:", a3, *(void *)&a4, *(void *)&a5.var0, *(unsigned __int16 *)&a5.var4, a6, a7);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      uint64_t v11 = v8;
      __int16 v12 = 2080;
      int v13 = "-[VCDatagramChannelIDSEmulated writeDatagram:datagramSize:datagramInfo:options:completionHandler:]";
      __int16 v14 = 1024;
      int v15 = 51;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d The datagramChannel is not started!", (uint8_t *)&v10, 0x1Cu);
    }
  }
}

- (BOOL)writeToEmulatedNetworkWithDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramInfo:(id)a5 options:(id *)a6
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a4 < 0x5DD)
  {
    __int16 v9 = *(_WORD *)&a5.var4;
    uint64_t v10 = *(void *)&a5.var0;
    ++self->_packetCount;
    __int16 v12 = [[VCEmulatedPacket alloc] initWithPacketID:self->_packetCount datagram:a3 datagramSize:*(void *)&a4];
    if (v12)
    {
      int v13 = v12;
      memcpy(__dst, &unk_1E259ED60, sizeof(__dst));
      [(VCEmulatedPacket *)v13 metadata];
      *(_DWORD *)__dst = v6;
      *(void *)&__dst[4] = v10;
      *(_WORD *)&__dst[12] = v9;
      if (a6)
      {
        long long v14 = *(_OWORD *)&a6->var11;
        *(_OWORD *)&__dst[80] = *(_OWORD *)&a6->var9;
        *(_OWORD *)&__dst[96] = v14;
        *(_OWORD *)&__dst[112] = *(_OWORD *)a6->var13;
        *(void *)&__dst[128] = *(void *)&a6->var14;
        long long v15 = *(_OWORD *)&a6->var2;
        *(_OWORD *)&__dst[16] = *(_OWORD *)&a6->var0;
        *(_OWORD *)&__dst[32] = v15;
        long long v16 = *(_OWORD *)&a6->var8.var0;
        char v17 = 1;
        *(_OWORD *)&__dst[48] = *(_OWORD *)&a6->var5[6];
        *(_OWORD *)&__dst[64] = v16;
      }
      else
      {
        char v17 = 0;
      }
      __dst[136] = v17;
      [(VCEmulatedPacket *)v13 setSize:v6];
      memcpy(v21, __dst, sizeof(v21));
      [(VCEmulatedPacket *)v13 setMetadata:v21];
      [(VCEmulatedPacket *)v13 setArrivalTime:micro()];
      uint64_t v18 = 3;
      if (WORD1(v10) == 800) {
        uint64_t v18 = 1;
      }
      if (WORD1(v10) == 700) {
        uint64_t v19 = 2;
      }
      else {
        uint64_t v19 = v18;
      }
      [(VCEmulatedPacket *)v13 setType:v19];
      [(VCEmulatedNetwork *)self->_network push:v13];

      LOBYTE(v7) = 1;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_11;
      }
      VRTraceErrorLogLevelToCSTR();
      BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (v7)
      {
        -[VCDatagramChannelIDSEmulated writeToEmulatedNetworkWithDatagram:datagramSize:datagramInfo:options:]();
        goto LABEL_11;
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    {
LABEL_11:
      LOBYTE(v7) = 0;
      return v7;
    }
    VRTraceErrorLogLevelToCSTR();
    BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (v7)
    {
      -[VCDatagramChannelIDSEmulated writeToEmulatedNetworkWithDatagram:datagramSize:datagramInfo:options:]();
      goto LABEL_11;
    }
  }
  return v7;
}

- (void)writeDatagrams:(const void *)a3 datagramsSize:(unsigned int *)a4 datagramsInfo:(id *)a5 datagramsCount:(int)a6 options:(id *)a7 completionHandler:(id)a8
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (self->_isStarted)
  {
    p_int64_t mode = (unint64_t)&self->_mode;
    int64_t mode = self->_mode;
    if (mode == 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCDatagramChannelIDSEmulated writeDatagrams:datagramsSize:datagramsInfo:datagramsCount:options:completionHandler:]();
        }
      }
    }
    else if (mode)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCDatagramChannelIDSEmulated writeDatagrams:datagramsSize:datagramsInfo:datagramsCount:options:completionHandler:]();
        }
      }
    }
    else if (a6 >= 1)
    {
      uint64_t v14 = a6;
      p_var4 = &a5->var4;
      do
      {
        uint64_t v17 = (uint64_t)*a3++;
        uint64_t v16 = v17;
        LODWORD(v17) = *a4++;
        uint64_t v18 = v17;
        uint64_t v20 = (uint64_t)*a7++;
        uint64_t v19 = v20;
        uint64_t v21 = *((void *)p_var4 - 1);
        LODWORD(v20) = *(unsigned __int16 *)p_var4;
        p_var4 += 10;
        p_int64_t mode = p_mode & 0xFFFFFFFFFFFF0000 | v20;
        -[VCDatagramChannelIDSEmulated writeToEmulatedNetworkWithDatagram:datagramSize:datagramInfo:options:](self, "writeToEmulatedNetworkWithDatagram:datagramSize:datagramInfo:options:", v16, v18, v21, p_mode, v19, a8);
        --v14;
      }
      while (v14);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    uint64_t v23 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 136315650;
      uint64_t v25 = v22;
      __int16 v26 = 2080;
      v27 = "-[VCDatagramChannelIDSEmulated writeDatagrams:datagramsSize:datagramsInfo:datagramsCount:options:completionHandler:]";
      __int16 v28 = 1024;
      int v29 = 123;
      _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d The datagramChannel is not started!", (uint8_t *)&v24, 0x1Cu);
    }
  }
}

- (void)setEventHandler:(id)a3
{
}

- (void)setChannelPreferences:(id)a3
{
}

- (void)setWiFiAssist:(BOOL)a3
{
}

- (void)requestSessionInfoWithOptions:(id)a3
{
}

- (void)optInStreamIDs:(id)a3
{
}

- (void)optOutStreamIDs:(id)a3
{
}

- (void)setupEmulatedNetwork
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Not supported yet for mode %d", v2, v3, v4, v5);
}

void __52__VCDatagramChannelIDSEmulated_setupEmulatedNetwork__block_invoke(uint64_t a1, void *a2)
{
  if (a2 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    int v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __52__VCDatagramChannelIDSEmulated_setupEmulatedNetwork__block_invoke_cold_1(v3, a2, v4);
    }
  }
}

uint64_t __52__VCDatagramChannelIDSEmulated_setupEmulatedNetwork__block_invoke_6(uint64_t result, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = result;
    memcpy(v7, &unk_1E259ED60, sizeof(v7));
    [a2 metadata];
    result = [a2 isLost];
    if ((result & 1) == 0)
    {
      result = [a2 size];
      if (result == v7[0])
      {
        if (LOBYTE(v7[34])) {
          int v4 = &v7[4];
        }
        else {
          int v4 = 0;
        }
        int v5 = *(void **)(*(void *)(v3 + 32) + 224);
        uint64_t v6 = [a2 datagram];
        return objc_msgSend(v5, "writeDatagram:datagramSize:datagramInfo:options:completionHandler:", v6, v7[0], *(void *)&v7[1], LOWORD(v7[3]), v4, *(void *)(v3 + 40));
      }
    }
  }
  return result;
}

- (int)start
{
  [(VCObject *)self lock];
  if (self->_isStarted)
  {
    [(VCObject *)self unlock];
    return 0;
  }
  else
  {
    [+[VCNetworkSimulator sharedInstance] start];
    [(VCDatagramChannelIDSEmulated *)self setupEmulatedNetwork];
    self->_isStarted = 1;
    [(VCObject *)self unlock];
    idsChannel = self->_idsChannel;
    return [(VCDatagramChannelIDS *)idsChannel start];
  }
}

- (void)invalidate
{
  self->_isStarted = 0;
  [(VCObject *)self unlock];
  [(VCEmulatedNetwork *)self->_network setPopCompletionHandler:0];
  [+[VCNetworkSimulator sharedInstance] stop];
  [(VCDatagramChannelIDS *)self->_idsChannel invalidate];

  self->_idsChannel = 0;
}

- (void)setReadHandler:(id)a3
{
}

- (void)readyToRead
{
}

- (void)osChannelInfoLog
{
}

- (id)connectedLinks
{
  return [(VCDatagramChannelIDS *)self->_idsChannel connectedLinks];
}

- (id)defaultLink
{
  return [(VCDatagramChannelIDS *)self->_idsChannel defaultLink];
}

- (unsigned)token
{
  return VCDatagramChannelIDS_Token((uint64_t)self->_idsChannel);
}

- (id)destination
{
  return [(VCDatagramChannelIDS *)self->_idsChannel destination];
}

- (int)dataPath
{
  return [(VCDatagramChannelIDS *)self->_idsChannel dataPath];
}

- (void)setOneToOneModeEnabled:(BOOL)a3 isInitiator:(BOOL)a4
{
}

- (void)writeDatagram:datagramSize:datagramInfo:options:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d unknown mode %d", v2, v3, v4, v5);
}

- (void)writeDatagram:datagramSize:datagramInfo:options:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Not supported yet for mode %d", v2, v3, v4, v5);
}

- (void)writeToEmulatedNetworkWithDatagram:datagramSize:datagramInfo:options:.cold.1()
{
  OUTLINED_FUNCTION_2();
  *(_WORD *)&v4[4] = v0;
  *(void *)&v4[6] = "-[VCDatagramChannelIDSEmulated writeToEmulatedNetworkWithDatagram:datagramSize:datagramInfo:options:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v1, v2, " [%s] %s:%d datagram size too large %d", v3, *(const char **)v4, (unint64_t)"-[VCDatagramChannelIDSEmulated writeToEmulatedNetworkWithDatagram:datagramSize:datagramInfo:options:]" >> 16, 72);
}

- (void)writeToEmulatedNetworkWithDatagram:datagramSize:datagramInfo:options:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 81;
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d Cannot create VCEmulatedPacket!", v1, 0x1Cu);
}

- (void)writeDatagrams:datagramsSize:datagramsInfo:datagramsCount:options:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d unknown mode %d", v2, v3, v4, v5);
}

- (void)writeDatagrams:datagramsSize:datagramsInfo:datagramsCount:options:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Not supported yet for mode %d", v2, v3, v4, v5);
}

void __52__VCDatagramChannelIDSEmulated_setupEmulatedNetwork__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
  int v7 = 136315906;
  uint64_t v8 = a1;
  __int16 v9 = 2080;
  OUTLINED_FUNCTION_8();
  int v10 = 174;
  __int16 v11 = v5;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to write to ids datagram channel with error %s", (uint8_t *)&v7, 0x26u);
}

@end