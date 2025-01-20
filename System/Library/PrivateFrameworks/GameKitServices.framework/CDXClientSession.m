@interface CDXClientSession
- (BOOL)retransmitEvent;
- (BOOL)sendData:(id)a3;
- (BOOL)sendData:(id)a3 toParticipants:(id)a4;
- (BOOL)sendRaw:(id)a3 toParticipants:(id)a4;
- (CDXClient)CDXClient;
- (CDXClientSession)initWithCDXClient:(id)a3 ticket:(id)a4 sessionKey:(id)a5;
- (CDXClientSessionDelegate)delegate;
- (NSData)sessionKey;
- (NSData)ticket;
- (NSIndexSet)participantsInFlight;
- (id)decrypt:(id)a3 ticket:(id)a4;
- (id)encrypt:(id)a3;
- (id)inboundHandler;
- (void)dealloc;
- (void)invalidate;
- (void)recvRaw:(id)a3 ticket:(id)a4;
- (void)resetRetransmitTimer;
- (void)retransmitEvent;
- (void)setDelegate:(id)a3;
- (void)setInboundHandler:(id)a3;
- (void)setTicket:(id)a3;
- (void)stopRetransmitTimer;
@end

@implementation CDXClientSession

- (CDXClientSession)initWithCDXClient:(id)a3 ticket:(id)a4 sessionKey:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)CDXClientSession;
  v8 = [(CDXClientSession *)&v16 init];
  if (v8)
  {
    v8->CDXClient_ = (CDXClient *)a3;
    v9 = (unsigned __int16 *)malloc_type_malloc(2 * [a4 CDXTicketPCNT], 0xACD95CE2uLL);
    v8->ack_ = v9;
    bzero(v9, 2 * [a4 CDXTicketPCNT]);
    v8->ticket_ = (NSData *)objc_msgSend(a4, "copyWithZone:", -[CDXClientSession zone](v8, "zone"));
    v10 = (NSData *)objc_msgSend(a5, "copyWithZone:", -[CDXClientSession zone](v8, "zone"));
    v11 = v10;
    v8->sessionKey_ = v10;
    memset(md, 170, 16);
    if (v10 && [(NSData *)v10 length] != 16)
    {
      CC_MD5([(NSData *)v11 bytes], [(NSData *)v11 length], md);
      v11 = (NSData *)[MEMORY[0x263EFF8F8] dataWithBytes:md length:16];
    }
    v8->sessionKeyPrepped_ = v11;
    v8->pid_ = [(NSData *)v8->ticket_ CDXTicketPID];
    if (!v8->sessionKey_ && (int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = objc_msgSend((id)-[CDXClientSession description](v8, "description"), "UTF8String");
        *(_DWORD *)md = 136315906;
        *(void *)&md[4] = v12;
        *(_WORD *)&md[12] = 2080;
        *(void *)&md[14] = "-[CDXClientSession initWithCDXClient:ticket:sessionKey:]";
        __int16 v18 = 1024;
        int v19 = 293;
        __int16 v20 = 2080;
        uint64_t v21 = v14;
        _os_log_impl(&dword_221563000, v13, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: No session key provided. Contents of CDX session will be unencrypted!", md, 0x26u);
      }
    }
  }
  return v8;
}

- (void)stopRetransmitTimer
{
  OUTLINED_FUNCTION_5();
  objc_msgSend((id)OUTLINED_FUNCTION_10(v0, *MEMORY[0x263EF8340]), "UTF8String");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(&dword_221563000, v1, v2, "CDXClient [%s] %s:%d %s: Turning off retransmit timer.", v3, v4, v5, v6, v7);
}

- (void)invalidate
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7_0(&dword_221563000, v0, v1, "CDXClient [%s] %s:%d ", v2, v3, v4, v5, v6);
}

- (BOOL)retransmitEvent
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v3 = self;
  if ((CDXClientSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint8_t v6 = *MEMORY[0x263F21098];
      uint8_t v7 = *MEMORY[0x263F21098];
      if (*MEMORY[0x263F21088])
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int64_t retransmitAttempts = self->retransmitAttempts_;
          *(_DWORD *)v26 = 136315906;
          *(void *)&v26[4] = v5;
          *(_WORD *)&v26[12] = 2080;
          *(void *)&v26[14] = "-[CDXClientSession retransmitEvent]";
          *(_WORD *)&v26[22] = 1024;
          LODWORD(v27) = 338;
          WORD2(v27) = 1024;
          *(_DWORD *)((char *)&v27 + 6) = retransmitAttempts;
          v9 = "CDXClient [%s] %s:%d int64_t retransmitAttempts = %d";
          v10 = v6;
          uint32_t v11 = 34;
LABEL_13:
          _os_log_impl(&dword_221563000, v10, OS_LOG_TYPE_DEFAULT, v9, v26, v11);
        }
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        -[CDXClientSession retransmitEvent](v5);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v4 = (__CFString *)[(CDXClientSession *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v4 = &stru_26D39CAC0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      goto LABEL_18;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x263F21098];
    uint64_t v14 = *MEMORY[0x263F21098];
    if (*MEMORY[0x263F21088])
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v15 = self->retransmitAttempts_;
        *(_DWORD *)v26 = 136316418;
        *(void *)&v26[4] = v12;
        *(_WORD *)&v26[12] = 2080;
        *(void *)&v26[14] = "-[CDXClientSession retransmitEvent]";
        *(_WORD *)&v26[22] = 1024;
        LODWORD(v27) = 338;
        WORD2(v27) = 2112;
        *(void *)((char *)&v27 + 6) = v4;
        HIWORD(v27) = 2048;
        v28 = self;
        LOWORD(v29) = 1024;
        *(_DWORD *)((char *)&v29 + 2) = v15;
        v9 = "CDXClient [%s] %s:%d %@(%p) int64_t retransmitAttempts = %d";
        v10 = v13;
        uint32_t v11 = 54;
        goto LABEL_13;
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int64_t v16 = self->retransmitAttempts_;
      *(_DWORD *)v26 = 136316418;
      *(void *)&v26[4] = v12;
      *(_WORD *)&v26[12] = 2080;
      *(void *)&v26[14] = "-[CDXClientSession retransmitEvent]";
      *(_WORD *)&v26[22] = 1024;
      LODWORD(v27) = 338;
      WORD2(v27) = 2112;
      *(void *)((char *)&v27 + 6) = v4;
      HIWORD(v27) = 2048;
      v28 = self;
      LOWORD(v29) = 1024;
      *(_DWORD *)((char *)&v29 + 2) = v16;
      _os_log_debug_impl(&dword_221563000, v13, OS_LOG_TYPE_DEBUG, "CDXClient [%s] %s:%d %@(%p) int64_t retransmitAttempts = %d", v26, 0x36u);
    }
  }
LABEL_18:
  if ([(NSMutableIndexSet *)self->participantsInFlight_ count]&& [(CDXClientSession *)self sendRaw:self->lastSent_ toParticipants:self->participantsInFlight_]&& (int64_t v17 = self->retransmitAttempts_, self->retransmitAttempts_ = v17 + 1, v17 <= 65))
  {
    float v18 = pow(1.33333333, (double)((int)v17 + 1)) * 0.1;
    if (v18 <= 1.0) {
      float v19 = v18;
    }
    else {
      float v19 = 1.0;
    }
    float v20 = ((float)((float)(arc4random() & 0xFFFFFF) / 16777000.0) * 0.2 + 0.9) * v19;
    retransmitTimer = self->retransmitTimer_;
    double v22 = v20 * 1000000000.0;
    dispatch_time_t v23 = dispatch_time(0, (uint64_t)v22);
    dispatch_source_set_timer(retransmitTimer, v23, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)v22);
    BOOL v24 = 1;
  }
  else
  {
    [(CDXClientSession *)self stopRetransmitTimer];
    BOOL v24 = 0;
  }

  return v24;
}

- (void)resetRetransmitTimer
{
  if (!self->retransmitTimer_)
  {
    uint64_t v3 = [self->CDXClient_ queue];
    uint64_t v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v3);
    self->retransmitTimer_ = v4;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __40__CDXClientSession_resetRetransmitTimer__block_invoke;
    handler[3] = &unk_2645B7C20;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)v4, handler);
    retransmitTimer = self->retransmitTimer_;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __40__CDXClientSession_resetRetransmitTimer__block_invoke_2;
    v10[3] = &unk_2645B7C20;
    v10[4] = self;
    dispatch_source_set_cancel_handler(retransmitTimer, v10);
    dispatch_resume((dispatch_object_t)self->retransmitTimer_);
  }
  self->retransmitAttempts_ = 0;
  float v6 = ((float)((float)(arc4random() & 0xFFFFFF) / 16777000.0) * 0.2 + 0.9) * 0.100000001;
  uint8_t v7 = self->retransmitTimer_;
  double v8 = v6 * 1000000000.0;
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)v8);
  dispatch_source_set_timer(v7, v9, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)v8);
}

uint64_t __40__CDXClientSession_resetRetransmitTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) retransmitEvent];
}

void __40__CDXClientSession_resetRetransmitTimer__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  if (v2)
  {
    dispatch_release(v2);
    *(void *)(*(void *)(a1 + 32) + 88) = 0;
  }
}

- (void)dealloc
{
  [(CDXClientSession *)self invalidate];

  free(self->ack_);
  v3.receiver = self;
  v3.super_class = (Class)CDXClientSession;
  [(CDXClientSession *)&v3 dealloc];
}

- (void)setTicket:(id)a3
{
  if ([a3 CDXTicketWellFormed]
    && [(NSData *)self->ticket_ CDXTicketIsRelatedToTicket:a3])
  {
    ticket = self->ticket_;
    self->ticket_ = (NSData *)objc_msgSend(a3, "copyWithZone:", -[CDXClientSession zone](self, "zone"));
  }
}

- (id)decrypt:(id)a3 ticket:(id)a4
{
  id v4 = a3;
  iv[2] = *MEMORY[0x263EF8340];
  size_t v18 = 0;
  if (self->sessionKey_)
  {
    uint8_t v7 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", objc_msgSend(a3, "length") + 16);
    iv[0] = *(void *)([a4 bytes] + 4);
    iv[1] = *(void *)([a4 bytes] + 4);
    LOBYTE(iv[0]) |= [a4 CDXTicketPID];
    uint64_t v8 = CCCrypt(1u, 0, 1u, -[NSData bytes](self->sessionKeyPrepped_, "bytes"), -[NSData length](self->sessionKeyPrepped_, "length"), iv, (const void *)[v4 bytes], objc_msgSend(v4, "length"), objc_msgSend(v7, "mutableBytes"), objc_msgSend(v7, "length"), &v18);
    if (v8)
    {
      uint64_t v9 = v8;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        uint32_t v11 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = objc_msgSend((id)-[CDXClientSession description](self, "description"), "UTF8String");
          *(_DWORD *)buf = 136316162;
          uint64_t v22 = v10;
          __int16 v23 = 2080;
          BOOL v24 = "-[CDXClientSession decrypt:ticket:]";
          __int16 v25 = 1024;
          int v26 = 471;
          __int16 v27 = 2080;
          uint64_t v28 = v17;
          __int16 v29 = 1024;
          int v30 = v9;
          _os_log_error_impl(&dword_221563000, v11, OS_LOG_TYPE_ERROR, "CDXClient [%s] %s:%d %s: Decryption failed: CCCrypt() returned error %d", buf, 0x2Cu);
        }
      }
      uint64_t v12 = [(CDXClientSession *)self CDXClient];
      v13 = (void *)MEMORY[0x263F087E8];
      uint64_t v14 = *MEMORY[0x263F08410];
      v19[0] = *MEMORY[0x263F08320];
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"Decryption failed. (CCCrypt error %d)", v9);
      v19[1] = @"CDXTicket";
      v20[0] = v15;
      v20[1] = a4;
      -[CDXClient setError:](v12, "setError:", objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, (int)v9, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2)));
      return 0;
    }
    else
    {
      [v7 setLength:v18];
      return v7;
    }
  }
  return v4;
}

- (id)encrypt:(id)a3
{
  id v3 = a3;
  iv[2] = *MEMORY[0x263EF8340];
  size_t v16 = 0;
  if (self->sessionKey_)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", objc_msgSend(a3, "length") + 16);
    iv[0] = *(void *)([(NSData *)self->ticket_ bytes] + 4);
    iv[1] = *(void *)([(NSData *)self->ticket_ bytes] + 4);
    LOBYTE(iv[0]) |= [(NSData *)self->ticket_ CDXTicketPID];
    uint64_t v6 = CCCrypt(0, 0, 1u, -[NSData bytes](self->sessionKeyPrepped_, "bytes"), -[NSData length](self->sessionKeyPrepped_, "length"), iv, (const void *)[v3 bytes], objc_msgSend(v3, "length"), objc_msgSend(v5, "mutableBytes"), objc_msgSend(v5, "length"), &v16);
    if (v6)
    {
      uint64_t v7 = v6;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
        {
          uint64_t v15 = objc_msgSend((id)-[CDXClientSession description](self, "description"), "UTF8String");
          *(_DWORD *)buf = 136316162;
          uint64_t v20 = v8;
          __int16 v21 = 2080;
          uint64_t v22 = "-[CDXClientSession encrypt:]";
          __int16 v23 = 1024;
          int v24 = 531;
          __int16 v25 = 2080;
          uint64_t v26 = v15;
          __int16 v27 = 1024;
          int v28 = v7;
          _os_log_error_impl(&dword_221563000, v9, OS_LOG_TYPE_ERROR, "CDXClient [%s] %s:%d %s: Encryption failed: CCCrypt() returned error %d", buf, 0x2Cu);
        }
      }
      uint64_t v10 = [(CDXClientSession *)self CDXClient];
      uint32_t v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = *MEMORY[0x263F08410];
      v17[0] = *MEMORY[0x263F08320];
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Encryption failed. (CCCrypt error %d)", v7);
      v17[1] = @"CDXTicket";
      v18[0] = v13;
      v18[1] = [(CDXClientSession *)self ticket];
      -[CDXClient setError:](v10, "setError:", objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, (int)v7, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2)));
      return 0;
    }
    else
    {
      [v5 setLength:v16];
      return v5;
    }
  }
  return v3;
}

- (BOOL)sendRaw:(id)a3 toParticipants:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v7 = (void *)[MEMORY[0x263EFF990] data];
  id v8 = [(CDXClientSession *)self encrypt:a3];
  if (v8)
  {
    id v9 = v8;
    [v7 appendData:self->ticket_];
    if (a4)
    {
      uint64_t v10 = [v7 mutableBytes];
      uint32_t v11 = (void *)(v10 + [v7 length]);
      int v12 = [(NSData *)self->ticket_ CDXTicketPCNT];
      uint64_t v13 = (unsigned char *)[v7 mutableCDXTicket];
      *v13 |= 2u;
      int v14 = v12 + 7;
      if (v12 < -7) {
        int v14 = v12 + 14;
      }
      size_t v15 = (uint64_t)v14 >> 3;
      [v7 increaseLengthBy:v15];
      bzero(v11, v15);
      if (v12 >= 1)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if ([a4 containsIndex:i]) {
            *((unsigned char *)v11 + (i >> 3)) |= 0x80u >> (i & 7);
          }
        }
      }
    }
    [v7 appendData:v9];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      size_t v18 = *MEMORY[0x263F21098];
      float v19 = *MEMORY[0x263F21098];
      if (*MEMORY[0x263F21088])
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v25 = 136315906;
          uint64_t v26 = v17;
          __int16 v27 = 2080;
          int v28 = "-[CDXClientSession sendRaw:toParticipants:]";
          __int16 v29 = 1024;
          int v30 = 583;
          __int16 v31 = 2048;
          uint64_t v32 = [v7 length];
          _os_log_impl(&dword_221563000, v18, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d packet length before CDXClientSession sendData. length=%lu", (uint8_t *)&v25, 0x26u);
        }
      }
      else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        -[CDXClientSession sendRaw:toParticipants:]();
      }
    }
    if ((unint64_t)[v7 length] >= 0x5DC)
    {
      if ((CDXClientSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
            -[CDXClientSession sendRaw:toParticipants:]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v20 = (__CFString *)[(CDXClientSession *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v20 = &stru_26D39CAC0;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v21 = VRTraceErrorLogLevelToCSTR();
          uint64_t v22 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
          {
            uint64_t v23 = [v7 length];
            int v25 = 136316674;
            uint64_t v26 = v21;
            __int16 v27 = 2080;
            int v28 = "-[CDXClientSession sendRaw:toParticipants:]";
            __int16 v29 = 1024;
            int v30 = 585;
            __int16 v31 = 2112;
            uint64_t v32 = (uint64_t)v20;
            __int16 v33 = 2048;
            v34 = self;
            __int16 v35 = 2048;
            uint64_t v36 = v23;
            __int16 v37 = 1024;
            int v38 = 1500;
            _os_log_error_impl(&dword_221563000, v22, OS_LOG_TYPE_ERROR, "CDXClient [%s] %s:%d %@(%p) packet length is over kCDXMTU_SIZE when CDXClientSession sendData. length=%lu. Data will not be sent! kCDXMTU_SIZE=%d", (uint8_t *)&v25, 0x40u);
          }
        }
      }
    }
    LOBYTE(v8) = (unint64_t)[v7 length] <= 0x5DB
              && [self->CDXClient_ sendRaw:v7];
  }
  return (char)v8;
}

- (BOOL)sendData:(id)a3
{
  return [(CDXClientSession *)self sendData:a3 toParticipants:0];
}

- (BOOL)sendData:(id)a3 toParticipants:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (!a3)
  {
LABEL_40:
    LOBYTE(v7) = 0;
    return v7;
  }
  if (a4)
  {
    uint64_t v7 = [a4 count];
    if (!v7) {
      return v7;
    }
  }
  id v8 = (void *)[MEMORY[0x263EFF990] data];
  [v8 increaseLengthBy:8];
  [v8 appendData:a3];
  uint64_t v9 = [v8 mutableBytes];
  *(_WORD *)uint64_t v9 = 512;
  unsigned __int16 v10 = self->seq_ + 1;
  self->seq_ = v10;
  *(_DWORD *)(v9 + 4) = v10;
  *(_WORD *)(v9 + 2) = bswap32([v8 length] - 8) >> 16;
  if (!a4) {
    self->ack_[self->pid_] = self->seq_;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    int v12 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 136315650;
      uint64_t v33 = v11;
      __int16 v34 = 2080;
      __int16 v35 = "-[CDXClientSession sendData:toParticipants:]";
      __int16 v36 = 1024;
      int v37 = 626;
      _os_log_impl(&dword_221563000, v12, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d send-data", (uint8_t *)&v32, 0x1Cu);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    int v14 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = objc_msgSend((id)-[CDXClientSession description](self, "description"), "UTF8String");
      int v16 = *(unsigned __int16 *)(v9 + 4);
      if (a4) {
        uint64_t v17 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      }
      else {
        uint64_t v17 = "everyone-who-isn't-me";
      }
      int v32 = 136316418;
      uint64_t v33 = v13;
      __int16 v34 = 2080;
      __int16 v35 = "-[CDXClientSession sendData:toParticipants:]";
      __int16 v36 = 1024;
      int v37 = 628;
      __int16 v38 = 2080;
      uint64_t v39 = v15;
      __int16 v40 = 1024;
      *(_DWORD *)v41 = v16;
      *(_WORD *)&v41[4] = 2080;
      *(void *)&v41[6] = v17;
      _os_log_impl(&dword_221563000, v14, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: Sending out packet seq=%d. toParticipants:%s", (uint8_t *)&v32, 0x36u);
    }
  }
  if ([a4 count] == 1)
  {
    uint64_t v18 = [a4 firstIndex];
    if (v18 < [(NSData *)self->ticket_ CDXTicketPCNT])
    {
      *(unsigned char *)(v9 + 1) |= 1u;
      ack = self->ack_;
      *(_WORD *)(v9 + 6) = ack[[a4 firstIndex]];
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    uint64_t v21 = *MEMORY[0x263F21098];
    uint64_t v22 = *MEMORY[0x263F21098];
    if (*MEMORY[0x263F21088])
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = [v8 length];
        int v32 = 136315906;
        uint64_t v33 = v20;
        __int16 v34 = 2080;
        __int16 v35 = "-[CDXClientSession sendData:toParticipants:]";
        __int16 v36 = 1024;
        int v37 = 637;
        __int16 v38 = 2048;
        uint64_t v39 = v23;
        _os_log_impl(&dword_221563000, v21, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d data length before CDXClient sendData. length=%lu", (uint8_t *)&v32, 0x26u);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      -[CDXClientSession sendData:toParticipants:]();
    }
  }
  if ((unint64_t)[v8 length] >= 0x5DC)
  {
    if ((CDXClientSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        LODWORD(v7) = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR);
        if (!v7) {
          return v7;
        }
        -[CDXClientSession sendData:toParticipants:]();
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v27 = (__CFString *)[(CDXClientSession *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v27 = &stru_26D39CAC0;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v28 = VRTraceErrorLogLevelToCSTR();
        __int16 v29 = *MEMORY[0x263F21098];
        LODWORD(v7) = os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR);
        if (!v7) {
          return v7;
        }
        uint64_t v30 = [v8 length];
        int v32 = 136316674;
        uint64_t v33 = v28;
        __int16 v34 = 2080;
        __int16 v35 = "-[CDXClientSession sendData:toParticipants:]";
        __int16 v36 = 1024;
        int v37 = 638;
        __int16 v38 = 2112;
        uint64_t v39 = (uint64_t)v27;
        __int16 v40 = 2048;
        *(void *)v41 = self;
        *(_WORD *)&v41[8] = 2048;
        *(void *)&v41[10] = v30;
        __int16 v42 = 1024;
        int v43 = 1500;
        _os_log_error_impl(&dword_221563000, v29, OS_LOG_TYPE_ERROR, "CDXClient [%s] %s:%d %@(%p) MTU LIMIT HIT! data length is over kCDXMTU_SIZE while CDXClient sendData. length=%lu. Data will not be sent. kCDXMTU_SIZE=%d", (uint8_t *)&v32, 0x40u);
      }
    }
    goto LABEL_40;
  }
  int v24 = self->lastSent_;
  self->lastSent_ = (NSData *)objc_msgSend(v8, "copyWithZone:", -[CDXClientSession zone](self, "zone"));
  [(CDXClientSession *)self resetRetransmitTimer];
  participantsInFlight = self->participantsInFlight_;
  if (a4) {
    uint64_t v26 = (NSMutableIndexSet *)objc_msgSend(a4, "mutableCopyWithZone:", -[CDXClientSession zone](self, "zone"));
  }
  else {
    uint64_t v26 = (NSMutableIndexSet *)(id)objc_msgSend(MEMORY[0x263F089C8], "indexSetWithIndexesInRange:", 0, -[NSData CDXTicketPCNT](self->ticket_, "CDXTicketPCNT"));
  }
  self->participantsInFlight_ = v26;

  LOBYTE(v7) = [(CDXClientSession *)self sendRaw:v8 toParticipants:a4];
  return v7;
}

- (void)recvRaw:(id)a3 ticket:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  unsigned __int8 v8 = [a4 CDXTicketPID];
  id v9 = [(CDXClientSession *)self decrypt:a3 ticket:a4];
  if (v9)
  {
    unsigned __int16 v10 = v9;
    if ((unint64_t)[v9 length] >= 8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        int v12 = *MEMORY[0x263F21098];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
        {
          if (self) {
            uint64_t v13 = (const char *)objc_msgSend((id)-[CDXClientSession description](self, "description"), "UTF8String");
          }
          else {
            uint64_t v13 = "<nil>";
          }
          *(_DWORD *)buf = 136316674;
          uint64_t v49 = v11;
          __int16 v50 = 2080;
          v51 = "-[CDXClientSession recvRaw:ticket:]";
          __int16 v52 = 1024;
          int v53 = 671;
          __int16 v54 = 2080;
          uint64_t v55 = (uint64_t)v13;
          __int16 v56 = 2080;
          *(void *)v57 = sel_getName(a2);
          *(_WORD *)&v57[8] = 1024;
          int v58 = v8;
          __int16 v59 = 2080;
          uint64_t v60 = objc_msgSend((id)objc_msgSend(v10, "description"), "UTF8String");
          _os_log_impl(&dword_221563000, v12, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: %s PID=%d, %s", buf, 0x40u);
        }
      }
      int v14 = (unsigned char *)[v10 bytes];
      if (!*v14)
      {
        uint64_t v15 = v14;
        if (v14[1])
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v16 = VRTraceErrorLogLevelToCSTR();
            uint64_t v17 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              if (self) {
                uint64_t v18 = (const char *)objc_msgSend((id)-[CDXClientSession description](self, "description"), "UTF8String");
              }
              else {
                uint64_t v18 = "<nil>";
              }
              Name = sel_getName(a2);
              int v20 = *((unsigned __int16 *)v15 + 3);
              int seq = self->seq_;
              *(_DWORD *)buf = 136316674;
              uint64_t v49 = v16;
              __int16 v50 = 2080;
              v51 = "-[CDXClientSession recvRaw:ticket:]";
              __int16 v52 = 1024;
              int v53 = 679;
              __int16 v54 = 2080;
              uint64_t v55 = (uint64_t)v18;
              __int16 v56 = 2080;
              *(void *)v57 = Name;
              *(_WORD *)&v57[8] = 1024;
              int v58 = v20;
              __int16 v59 = 1024;
              LODWORD(v60) = seq;
              _os_log_impl(&dword_221563000, v17, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: %s  Received ACK. header->ack=%d, seq_=%d", buf, 0x3Cu);
            }
          }
          if (*((unsigned __int16 *)v15 + 3) == self->seq_)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
            {
              uint64_t v22 = VRTraceErrorLogLevelToCSTR();
              uint64_t v23 = *MEMORY[0x263F21098];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v24 = objc_msgSend((id)-[CDXClientSession description](self, "description"), "UTF8String");
                int v25 = sel_getName(a2);
                *(_DWORD *)buf = 136316418;
                uint64_t v49 = v22;
                __int16 v50 = 2080;
                v51 = "-[CDXClientSession recvRaw:ticket:]";
                __int16 v52 = 1024;
                int v53 = 681;
                __int16 v54 = 2080;
                uint64_t v55 = v24;
                __int16 v56 = 2080;
                *(void *)v57 = v25;
                *(_WORD *)&v57[8] = 1024;
                int v58 = v8;
                _os_log_impl(&dword_221563000, v23, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: %s Removing %d from in-flight list", buf, 0x36u);
              }
            }
            [(NSMutableIndexSet *)self->participantsInFlight_ removeIndex:v8];
            if (![(NSMutableIndexSet *)self->participantsInFlight_ count]) {
              [(CDXClientSession *)self stopRetransmitTimer];
            }
          }
        }
        if ((v15[1] & 2) != 0)
        {
          unint64_t v26 = (bswap32(*((unsigned __int16 *)v15 + 1)) >> 16) + 8;
          if (v26 <= [v10 length])
          {
            unsigned int v27 = *((unsigned __int16 *)v15 + 2);
            ack = self->ack_;
            uint64_t v29 = v8;
            if (v27 <= ack[v8])
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
              {
                uint64_t v35 = VRTraceErrorLogLevelToCSTR();
                __int16 v36 = *MEMORY[0x263F21098];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v37 = objc_msgSend((id)-[CDXClientSession description](self, "description"), "UTF8String");
                  int v38 = *((unsigned __int16 *)v15 + 2);
                  *(_DWORD *)buf = 136316418;
                  uint64_t v49 = v35;
                  __int16 v50 = 2080;
                  v51 = "-[CDXClientSession recvRaw:ticket:]";
                  __int16 v52 = 1024;
                  int v53 = 705;
                  __int16 v54 = 2080;
                  uint64_t v55 = v37;
                  __int16 v56 = 1024;
                  *(_DWORD *)v57 = v38;
                  *(_WORD *)&v57[4] = 1024;
                  *(_DWORD *)&v57[6] = v8;
                  _os_log_impl(&dword_221563000, v36, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: Received DUPLICATE packet %d from participant %d.", buf, 0x32u);
                }
              }
            }
            else
            {
              ack[v8] = v27;
              inboundHandler = (void (**)(id, void, void *))self->inboundHandler_;
              if (inboundHandler) {
                inboundHandler[2](inboundHandler, v8, v10);
              }
              if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
              {
                uint64_t v31 = VRTraceErrorLogLevelToCSTR();
                int v32 = *MEMORY[0x263F21098];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v33 = objc_msgSend((id)-[CDXClientSession description](self, "description"), "UTF8String");
                  int v34 = *((unsigned __int16 *)v15 + 2);
                  *(_DWORD *)buf = 136316418;
                  uint64_t v49 = v31;
                  __int16 v50 = 2080;
                  v51 = "-[CDXClientSession recvRaw:ticket:]";
                  __int16 v52 = 1024;
                  int v53 = 702;
                  __int16 v54 = 2080;
                  uint64_t v55 = v33;
                  __int16 v56 = 1024;
                  *(_DWORD *)v57 = v34;
                  *(_WORD *)&v57[4] = 1024;
                  *(_DWORD *)&v57[6] = v8;
                  _os_log_impl(&dword_221563000, v32, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: Received packet %d from participant %d.", buf, 0x32u);
                }
              }
              -[CDXClientSessionDelegate CDXClientSession:receivedData:from:](self->delegate_, "CDXClientSession:receivedData:from:", self, objc_msgSend(v10, "subdataWithRange:", 8, objc_msgSend(v10, "length") - 8), v8);
            }
            int v45 = 256;
            unsigned __int16 v46 = self->seq_;
            unsigned __int16 v47 = self->ack_[v8];
            if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
            {
              uint64_t v39 = VRTraceErrorLogLevelToCSTR();
              __int16 v40 = *MEMORY[0x263F21098];
              v41 = *MEMORY[0x263F21098];
              if (*MEMORY[0x263F21088])
              {
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v42 = objc_msgSend((id)-[CDXClientSession description](self, "description"), "UTF8String");
                  *(_DWORD *)buf = 136316162;
                  uint64_t v49 = v39;
                  __int16 v50 = 2080;
                  v51 = "-[CDXClientSession recvRaw:ticket:]";
                  __int16 v52 = 1024;
                  int v53 = 714;
                  __int16 v54 = 2080;
                  uint64_t v55 = v42;
                  __int16 v56 = 1024;
                  *(_DWORD *)v57 = v8;
                  _os_log_impl(&dword_221563000, v40, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: Sending ACK to %d.", buf, 0x2Cu);
                }
              }
              else if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v44 = objc_msgSend((id)-[CDXClientSession description](self, "description"), "UTF8String");
                *(_DWORD *)buf = 136316162;
                uint64_t v49 = v39;
                __int16 v50 = 2080;
                v51 = "-[CDXClientSession recvRaw:ticket:]";
                __int16 v52 = 1024;
                int v53 = 714;
                __int16 v54 = 2080;
                uint64_t v55 = v44;
                __int16 v56 = 1024;
                *(_DWORD *)v57 = v8;
                _os_log_debug_impl(&dword_221563000, v40, OS_LOG_TYPE_DEBUG, "CDXClient [%s] %s:%d %s: Sending ACK to %d.", buf, 0x2Cu);
              }
            }
            uint64_t v43 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:&v45 length:8 freeWhenDone:0];
            -[CDXClientSession sendRaw:toParticipants:](self, "sendRaw:toParticipants:", v43, [MEMORY[0x263F088D0] indexSetWithIndex:v29]);
          }
        }
      }
    }
  }
}

- (CDXClient)CDXClient
{
  return self->CDXClient_;
}

- (CDXClientSessionDelegate)delegate
{
  return self->delegate_;
}

- (void)setDelegate:(id)a3
{
  self->delegate_ = (CDXClientSessionDelegate *)a3;
}

- (NSData)ticket
{
  return self->ticket_;
}

- (NSData)sessionKey
{
  return self->sessionKey_;
}

- (NSIndexSet)participantsInFlight
{
  return &self->participantsInFlight_->super;
}

- (id)inboundHandler
{
  return self->inboundHandler_;
}

- (void)setInboundHandler:(id)a3
{
}

- (void)retransmitEvent
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  OUTLINED_FUNCTION_3();
  int v7 = 338;
  __int16 v8 = v1;
  int v9 = v2;
  _os_log_debug_impl(&dword_221563000, v3, OS_LOG_TYPE_DEBUG, "CDXClient [%s] %s:%d int64_t retransmitAttempts = %d", (uint8_t *)&v4, 0x22u);
}

- (void)sendRaw:toParticipants:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v0, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9(&dword_221563000, v1, v2, "CDXClient [%s] %s:%d packet length is over kCDXMTU_SIZE when CDXClientSession sendData. length=%lu. Data will not be sent! kCDXMTU_SIZE=%d", v3, v4, v5, v6, 2u);
}

- (void)sendRaw:toParticipants:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v0, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_1_1(&dword_221563000, v1, v2, "CDXClient [%s] %s:%d packet length before CDXClientSession sendData. length=%lu", v3, v4, v5, v6, v7);
}

- (void)sendData:toParticipants:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v0, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9(&dword_221563000, v1, v2, "CDXClient [%s] %s:%d MTU LIMIT HIT! data length is over kCDXMTU_SIZE while CDXClient sendData. length=%lu. Data will not be sent. kCDXMTU_SIZE=%d", v3, v4, v5, v6, 2u);
}

- (void)sendData:toParticipants:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v0, *MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_1_1(&dword_221563000, v1, v2, "CDXClient [%s] %s:%d data length before CDXClient sendData. length=%lu", v3, v4, v5, v6, v7);
}

@end