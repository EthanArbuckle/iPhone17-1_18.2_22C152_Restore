@interface LoopbackSocketTunnel
- (LoopbackSocketTunnel)initWithPort:(unsigned __int16)a3 delegate:(id)a4 error:(id *)a5;
- (NSObject)optionalArg;
- (int)sendPacketToVTP:(id)a3;
- (int)serverLoopProc;
- (void)getIPPort:(tagIPPORT *)a3;
- (void)getVTPIPPort:(tagIPPORT *)a3;
- (void)setOptionalArg:(id)a3;
- (void)setVTPIP:(tagIPPORT *)a3;
- (void)shutdownSocket;
@end

@implementation LoopbackSocketTunnel

- (LoopbackSocketTunnel)initWithPort:(unsigned __int16)a3 delegate:(id)a4 error:(id *)a5
{
  unsigned int v7 = a3;
  keys[2] = *(void **)MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)LoopbackSocketTunnel;
  v8 = [(LoopbackSocketTunnel *)&v18 init];
  v9 = v8;
  if (v8)
  {
    v8->_port = v7;
    int v10 = socket(2, 2, 17);
    *(void *)&v9->sa.sin_len = 0;
    v9->sockFD = v10;
    v9->foundVTPIP = 0;
    *(void *)v9->sa.sin_zero = 0;
    *(_WORD *)&v9->sa.sin_len = 528;
    inet_aton("127.0.0.1", &v9->sa.sin_addr);
    if (v7 > 0xFDE7)
    {
      if (v7 != 65000)
      {
        v16 = v9;
        return 0;
      }
    }
    else
    {
      do
      {
        v9->sa.sin_port = bswap32(v7) >> 16;
        if (!bind(v9->sockFD, (const sockaddr *)&v9->sa, 0x10u)) {
          break;
        }
      }
      while ((unsigned __int16)v7++ < 0xFDE7u);
    }
    v9->_delegate = (LoopbackSocketTunnelDelegate *)a4;
    v12 = (void *)*MEMORY[0x1E4F21EB0];
    keys[0] = *(void **)MEMORY[0x1E4F21EA8];
    keys[1] = v12;
    v13 = (void *)*MEMORY[0x1E4F1CFC8];
    values[0] = @"com.apple.AVConference.LoopbackSocketTunnel.ReceiveProc";
    values[1] = v13;
    CFDictionaryRef v14 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)keys, (const void **)values, 2, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    int v15 = FigThreadCreate();
    if (v14) {
      CFRelease(v14);
    }
    if (v15)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if (VRTraceIsOSFaultDisabled())
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[LoopbackSocketTunnel initWithPort:delegate:error:]();
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          -[LoopbackSocketTunnel initWithPort:delegate:error:]();
        }
      }
      +[GKVoiceChatError getNSError:a5 code:32002 detailedCode:1 returnCode:v15 filePath:0 description:@"LoopbackSocketTunnel init failed" reason:@"FigThreadCreate failed"];
      close(v9->sockFD);

      return 0;
    }
  }
  return v9;
}

- (int)sendPacketToVTP:(id)a3
{
  if (!self->foundVTPIP) {
    return -1;
  }
  int v3 = sendto(self->sockFD, (const void *)[a3 bytes], objc_msgSend(a3, "length"), 0, (const sockaddr *)&self->vtpSA, 0x10u);
  kdebug_trace();
  return v3;
}

- (void)getIPPort:(tagIPPORT *)a3
{
}

- (void)getVTPIPPort:(tagIPPORT *)a3
{
}

- (void)setVTPIP:(tagIPPORT *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  *(void *)&self->vtpSA.sin_len = 0;
  *(void *)self->vtpSA.sin_zero = 0;
  self->foundVTPIP = 1;
  IPPORTToSA();
  IPPORTToStringWithSize();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      v8 = "-[LoopbackSocketTunnel setVTPIP:]";
      __int16 v9 = 1024;
      int v10 = 117;
      __int16 v11 = 2080;
      v12 = &setVTPIP__ip;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d vtpIP = %s", buf, 0x26u);
    }
  }
}

- (void)shutdownSocket
{
}

- (int)serverLoopProc
{
  v9[7] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  memset(&v9[4], 170, 24);
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__int16 v9 = v4;
  *(_OWORD *)&v9[2] = v4;
  for (i = malloc_type_malloc(0x5DCuLL, 0xDB2A6191uLL);
        ;
        -[LoopbackSocketTunnelDelegate loopbackSocketTunnel:receivedData:from:](self->_delegate, "loopbackSocketTunnel:receivedData:from:", self, [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:i length:v6 freeWhenDone:0], v9))
  {
    socklen_t v8 = 16;
    int v6 = recvfrom(self->sockFD, i, 0x5DCuLL, 0, (sockaddr *)&v9[5], &v8);
    SAToIPPORT();
    kdebug_trace();
    if (v6 < 1) {
      break;
    }
  }
  free(i);

  return 0;
}

- (NSObject)optionalArg
{
  return self->optionalArg;
}

- (void)setOptionalArg:(id)a3
{
  self->optionalArg = a3;
}

- (void)initWithPort:delegate:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d FigThreadCreate(LoopbackTunnelReceiveProc) failed %d", v1, 0x22u);
}

- (void)initWithPort:delegate:error:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1();
  _os_log_fault_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d FigThreadCreate(LoopbackTunnelReceiveProc) failed %d", v1, 0x22u);
}

@end