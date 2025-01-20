@interface VCMockIDSDatagramChannelSocket
- (id)initRequiresOptions:(BOOL)a3 localIP:(id)a4 localPort:(signed __int16)a5 remoteIP:(id)a6 remotePort:(signed __int16)a7;
- (int)readyToRead;
- (void)dealloc;
- (void)readyToRead;
- (void)setAllSubscribedStreamIDsOnOptions:(id *)a3;
- (void)setIsHopByHopEncryptedOnOptions:(id *)a3;
- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4;
- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramInfo:(id)a5 options:(id *)a6 completionHandler:(id)a7;
- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 flags:(id)a5 completionHandler:(id)a6;
- (void)writeDatagrams:(const void *)a3 datagramsSize:(unsigned int *)a4 datagramsInfo:(id *)a5 datagramsCount:(int)a6 options:(id *)a7 completionHandler:(id)a8;
@end

@implementation VCMockIDSDatagramChannelSocket

- (id)initRequiresOptions:(BOOL)a3 localIP:(id)a4 localPort:(signed __int16)a5 remoteIP:(id)a6 remotePort:(signed __int16)a7
{
  unsigned int v7 = a7;
  uint64_t v9 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)VCMockIDSDatagramChannelSocket;
  id v11 = [(VCMockIDSDatagramChannel *)&v18 initRequiresOptions:a3];
  if (!v11) {
    return v11;
  }
  *((unsigned char *)v11 + 3322388) = VCDefaults_GetBoolValueForKey(@"twoWayFaceTimeTestUsingSocketsEnabled", 0);
  if (!a4)
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMockIDSDatagramChannelSocket initRequiresOptions:localIP:localPort:remoteIP:remotePort:]();
      }
    }
    return 0;
  }
  if (!a6)
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMockIDSDatagramChannelSocket initRequiresOptions:localIP:localPort:remoteIP:remotePort:]();
      }
    }
    return 0;
  }
  if (!v9)
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMockIDSDatagramChannelSocket initRequiresOptions:localIP:localPort:remoteIP:remotePort:]();
      }
    }
    return 0;
  }
  if (!v7)
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMockIDSDatagramChannelSocket initRequiresOptions:localIP:localPort:remoteIP:remotePort:].cold.4();
      }
    }
    return 0;
  }
  int v12 = +[NetworkUtils socketWithIPAddress:a4 srcPort:v9 shouldConnect:0 error:0];
  *((_DWORD *)v11 + 8) = v12;
  if (v12 == -1)
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMockIDSDatagramChannelSocket initRequiresOptions:localIP:localPort:remoteIP:remotePort:].cold.5(v16, v17);
      }
    }
    return 0;
  }
  *((unsigned char *)v11 + 3322357) = 2;
  *((_DWORD *)v11 + 830590) = inet_addr((const char *)[a6 UTF8String]);
  *((_WORD *)v11 + 1661179) = bswap32(v7) >> 16;
  *((unsigned char *)v11 + 3322373) = 2;
  *((_DWORD *)v11 + 830594) = inet_addr((const char *)[a4 UTF8String]);
  *((_WORD *)v11 + 1661187) = bswap32(v9) >> 16;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316674;
      uint64_t v20 = v13;
      __int16 v21 = 2080;
      v22 = "-[VCMockIDSDatagramChannelSocket initRequiresOptions:localIP:localPort:remoteIP:remotePort:]";
      __int16 v23 = 1024;
      int v24 = 1322;
      __int16 v25 = 2112;
      id v26 = a4;
      __int16 v27 = 1024;
      int v28 = v9;
      __int16 v29 = 2112;
      id v30 = a6;
      __int16 v31 = 1024;
      unsigned int v32 = v7;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setup socket %@:%d to %@:%d", buf, 0x3Cu);
    }
  }
  return v11;
}

- (void)dealloc
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = self;
  v2.super_class = (Class)VCMockIDSDatagramChannelSocket;
  [(VCMockIDSDatagramChannel *)&v2 dealloc];
}

- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 flags:(id)a5 completionHandler:(id)a6
{
}

- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4 datagramInfo:(id)a5 options:(id *)a6 completionHandler:(id)a7
{
  -[VCMockIDSDatagramChannelSocket writeDatagram:datagramSize:](self, "writeDatagram:datagramSize:", a3, *(void *)&a4, *(void *)&a5.var0, *(void *)&a5.var4, a6);

  [(VCMockIDSDatagramChannel *)self processWriteCompletionCallback:a7 forDatagramWithSize:a4 error:0];
}

- (void)writeDatagrams:(const void *)a3 datagramsSize:(unsigned int *)a4 datagramsInfo:(id *)a5 datagramsCount:(int)a6 options:(id *)a7 completionHandler:(id)a8
{
  if (a6 < 1)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = a6;
    do
    {
      uint64_t v14 = (uint64_t)*a3++;
      -[VCMockIDSDatagramChannelSocket writeDatagram:datagramSize:](self, "writeDatagram:datagramSize:", v14, *a4, a5);
      LODWORD(v14) = *a4++;
      v12 += v14;
      --v13;
    }
    while (v13);
  }

  [(VCMockIDSDatagramChannel *)self processWriteCompletionCallback:a8 forDatagramWithSize:v12 error:0];
}

- (void)writeDatagram:(const void *)a3 datagramSize:(unsigned int)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    int v6 = 3322356;
    size_t v7 = a4;
    if (!self->_localAddress.sin_zero[4]
      && ![(VCMockIDSDatagramChannel *)self isMediaPacket:a3 length:a4])
    {
      int v6 = 3322372;
    }
    if ((sendto(self->super._socket, a3, v7, 0, (const sockaddr *)((char *)self + v6), 0x10u) & 0x80000000) != 0
      && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMockIDSDatagramChannelSocket writeDatagram:datagramSize:]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315906;
      uint64_t v11 = v8;
      __int16 v12 = 2080;
      uint64_t v13 = "-[VCMockIDSDatagramChannelSocket writeDatagram:datagramSize:]";
      __int16 v14 = 1024;
      int v15 = 1365;
      __int16 v16 = 1024;
      int v17 = 0;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Ignoring datagram with size %d", (uint8_t *)&v10, 0x22u);
    }
  }
}

- (int)readyToRead
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  memset(__b, 170, sizeof(__b));
  ssize_t v3 = recv(self->super._socket, __b, 0x5C0uLL, 0);
  if ((v3 & 0x80000000) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMockIDSDatagramChannelSocket readyToRead]();
      }
    }
  }
  else
  {
    if (-[VCMockIDSDatagramChannel isMediaPacket:length:](self, "isMediaPacket:length:", __b, 1472, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0))
    {
      [(VCMockIDSDatagramChannelSocket *)self setAllSubscribedStreamIDsOnOptions:&v5];
      [(VCMockIDSDatagramChannelSocket *)self setIsHopByHopEncryptedOnOptions:&v5];
    }
    else
    {
      [(VCMockIDSDatagramChannel *)self setParticipantIDOnOptions:&v5];
    }
    [(VCMockIDSDatagramChannel *)self readDatagram:__b datagramSize:v3 datagramOptions:&v5];
  }
  return 0;
}

- (void)setAllSubscribedStreamIDsOnOptions:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v4 = [(NSDictionary *)self->super._subscribedStreamsByParticipantID allValues];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v26 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v27;
    v19 = v4;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v4);
        }
        int v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v20 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v22;
          while (2)
          {
            uint64_t v14 = 0;
            int v15 = v7;
            if (v7 <= 11) {
              int v16 = 11;
            }
            else {
              int v16 = v7;
            }
            uint64_t v17 = (v16 - v7);
            do
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(v10);
              }
              a3->var5[v15 + v14] = [*(id *)(*((void *)&v21 + 1) + 8 * v14) intValue];
              if (v17 == v14)
              {
                LOBYTE(v7) = v15 + v14 + 1;
                goto LABEL_23;
              }
              ++v14;
            }
            while (v12 != v14);
            int v7 = v15 + v14;
            uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v20 count:16];
            if (v12) {
              continue;
            }
            break;
          }
          int v7 = v15 + v14;
          uint64_t v8 = v18;
          v4 = v19;
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v26 objects:v25 count:16];
    }
    while (v6);
  }
  else
  {
    LOBYTE(v7) = 0;
  }
LABEL_23:
  a3->var4 = v7;
  a3->var0 |= 2u;
}

- (void)setIsHopByHopEncryptedOnOptions:(id *)a3
{
  a3->var11 = 1;
  a3->var0 |= 0x400u;
}

- (void)initRequiresOptions:localIP:localPort:remoteIP:remotePort:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d nil localIP", v2, v3, v4, v5, v6);
}

- (void)initRequiresOptions:localIP:localPort:remoteIP:remotePort:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d nil remoteIP", v2, v3, v4, v5, v6);
}

- (void)initRequiresOptions:localIP:localPort:remoteIP:remotePort:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d 0 localPort", v2, v3, v4, v5, v6);
}

- (void)initRequiresOptions:localIP:localPort:remoteIP:remotePort:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d 0 remotePort", v2, v3, v4, v5, v6);
}

- (void)initRequiresOptions:(uint64_t)a1 localIP:(NSObject *)a2 localPort:remoteIP:remotePort:.cold.5(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  __error();
  int v4 = 136315906;
  uint64_t v5 = a1;
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Create socket failed %d", (uint8_t *)&v4, 0x22u);
}

- (void)writeDatagram:datagramSize:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Send failed %d", v2, v3, v4, 1381);
}

- (void)readyToRead
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d recv failed %d", v2, v3, v4, 1391);
}

@end