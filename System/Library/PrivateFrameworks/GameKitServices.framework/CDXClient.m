@interface CDXClient
+ (id)sharedClient;
- (BOOL)handleHolePunchEvent;
- (BOOL)sendRaw:(id)a3;
- (CDXClient)initWithOptions:(id)a3 delegate:(id)a4;
- (CDXClientDelegate)delegate;
- (NSData)preblob;
- (NSError)error;
- (OS_dispatch_queue)queue;
- (const)currentSockAddr;
- (id)createSessionWithTicket:(id)a3 sessionKey:(id)a4;
- (id)preblobCallback;
- (unsigned)currentSockAddrLen;
- (void)dealloc;
- (void)handleFDEvent;
- (void)invalidate;
- (void)invalidateSession:(id)a3;
- (void)mapIPv4AddrToIPv6:(sockaddr_in *)a3;
- (void)networkDidChange;
- (void)resetHolepunchTimer;
- (void)restart;
- (void)sendHolePunch;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setPreblob:(id)a3;
- (void)setPreblobCallback:(id)a3;
- (void)start;
- (void)startListeningOnSockets;
- (void)stopHolePunchTimer;
- (void)stopListeningOnSockets;
@end

@implementation CDXClient

+ (id)sharedClient
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__CDXClient_sharedClient__block_invoke;
  block[3] = &unk_2645B7C20;
  block[4] = a1;
  if (sharedClient_onceToken != -1) {
    dispatch_once(&sharedClient_onceToken, block);
  }
  v2 = (void *)sharedClient_sharedClient;
  objc_sync_enter((id)sharedClient_sharedClient);
  if (!*(void *)(sharedClient_sharedClient + 136)) {
    [(id)sharedClient_sharedClient start];
  }
  objc_sync_exit(v2);
  return (id)sharedClient_sharedClient;
}

uint64_t __25__CDXClient_sharedClient__block_invoke(uint64_t a1)
{
  uint64_t result = [objc_alloc(*(Class *)(a1 + 32)) initWithOptions:0 delegate:0];
  sharedClient_sharedClient = result;
  return result;
}

- (NSError)error
{
  objc_sync_enter(self);
  v3 = self->error_;
  objc_sync_exit(self);
  return v3;
}

- (void)setError:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  error = self->error_;
  self->error_ = (NSError *)objc_msgSend(a3, "copyWithZone:", -[CDXClient zone](self, "zone"));
  v6 = error;
  objc_sync_exit(self);
  if (a3)
  {
    if (!objc_msgSend((id)objc_msgSend(a3, "domain"), "isEqual:", -[NSError domain](error, "domain"))
      || (uint64_t v7 = [a3 code], v7 != -[NSError code](error, "code")))
    {
      if ((CDXClient *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR)) {
            -[CDXClient setError:]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v8 = (__CFString *)[(CDXClient *)self performSelector:sel_logPrefix];
        }
        else {
          v8 = &stru_26D39CAC0;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x263F21098];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_ERROR))
          {
            int v17 = 136316418;
            uint64_t v18 = v9;
            __int16 v19 = 2080;
            v20 = "-[CDXClient setError:]";
            __int16 v21 = 1024;
            int v22 = 818;
            __int16 v23 = 2112;
            uint64_t v24 = (uint64_t)v8;
            __int16 v25 = 2048;
            v26 = self;
            __int16 v27 = 2080;
            uint64_t v28 = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
            _os_log_error_impl(&dword_221563000, v10, OS_LOG_TYPE_ERROR, "CDXClient [%s] %s:%d %@(%p) err = %s", (uint8_t *)&v17, 0x3Au);
          }
        }
      }
      if (self->scDynamicStore_)
      {
        v11 = (void *)[a3 domain];
        if ([v11 isEqualToString:*MEMORY[0x263F08438]])
        {
          int64_t restartCount = self->restartCount_;
          self->restartCount_ = restartCount + 1;
          double v13 = exp2((double)restartCount);
          objc_sync_enter(self);
          [(CDXClient *)self stopListeningOnSockets];
          [(CDXClient *)self stopHolePunchTimer];
          objc_sync_exit(self);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v14 = VRTraceErrorLogLevelToCSTR();
            v15 = *MEMORY[0x263F21098];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v16 = objc_msgSend((id)-[CDXClient description](self, "description"), "UTF8String");
              int v17 = 136316162;
              uint64_t v18 = v14;
              __int16 v19 = 2080;
              v20 = "-[CDXClient setError:]";
              __int16 v21 = 1024;
              int v22 = 830;
              __int16 v23 = 2080;
              uint64_t v24 = v16;
              __int16 v25 = 2048;
              v26 = *(CDXClient **)&v13;
              _os_log_impl(&dword_221563000, v15, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: Will restart in %f seconds due to POSIX error.", (uint8_t *)&v17, 0x30u);
            }
          }
          [(CDXClient *)self performSelector:sel_restart withObject:0 afterDelay:v13];
        }
      }
    }
    [(CDXClientDelegate *)self->delegate_ CDXClient:self error:a3];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"CDXClientErrorNotification", self);
  }
}

- (NSData)preblob
{
  objc_sync_enter(self);
  v3 = self->preblob_;
  objc_sync_exit(self);
  return v3;
}

- (void)setPreblob:(id)a3
{
  objc_sync_enter(self);

  v5 = (NSData *)objc_msgSend(a3, "copyWithZone:", -[CDXClient zone](self, "zone"));
  self->preblob_ = v5;
  [(CDXClientDelegate *)self->delegate_ CDXClient:self preblob:v5];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"CDXClientDidUpdatePreblobNotification", self);
  objc_sync_exit(self);
}

- (void)sendHolePunch
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  int v20 = 0;
  int v18 = 8;
  unint64_t holePunchSID = self->holePunchSID_;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v26 = v3;
      __int16 v27 = 2080;
      uint64_t v28 = "-[CDXClient sendHolePunch]";
      __int16 v29 = 1024;
      int v30 = 878;
      _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d requesting-hole-punch", buf, 0x1Cu);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = objc_msgSend((id)-[CDXClient description](self, "description"), "UTF8String");
      int64_t holePunchAttemptCount = self->holePunchAttemptCount_;
      *(_DWORD *)buf = 136316162;
      uint64_t v26 = v5;
      __int16 v27 = 2080;
      uint64_t v28 = "-[CDXClient sendHolePunch]";
      __int16 v29 = 1024;
      int v30 = 880;
      __int16 v31 = 2080;
      uint64_t v32 = v7;
      __int16 v33 = 1024;
      int v34 = holePunchAttemptCount;
      _os_log_impl(&dword_221563000, v6, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: Poking hole to CDX server... (Try #%d)", buf, 0x2Cu);
    }
  }
  objc_sync_enter(self);
  if (sendto(self->fd_, &v18, 0x10uLL, 0, [(CDXClient *)self currentSockAddr], [(CDXClient *)self currentSockAddrLen]) <= 0)
  {
    if (*__error() == 12)
    {
      objc_sync_exit(self);
      return;
    }
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *__error();
    uint64_t v23 = *MEMORY[0x263F08338];
    v11 = NSString;
    v12 = __error();
    uint64_t v24 = [v11 stringWithFormat:@"Call to send() failed, \"%s\".", strerror(*v12)];
    uint64_t v13 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    -[CDXClient setError:](self, "setError:", [v9 errorWithDomain:*MEMORY[0x263F08438] code:v10 userInfo:v13]);
  }
  objc_sync_exit(self);
  *(_DWORD *)buf = 0;
  socklen_t v17 = 4;
  getsockopt(self->fd_, 0xFFFF, 4103, buf, &v17);
  uint64_t v14 = *(int *)buf;
  if (*(_DWORD *)buf)
  {
    v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F08338];
    uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"Socket has async error. %s", strerror(*(int *)buf));
    uint64_t v16 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    -[CDXClient setError:](self, "setError:", [v15 errorWithDomain:*MEMORY[0x263F08438] code:v14 userInfo:v16]);
  }
}

- (BOOL)handleHolePunchEvent
{
  objc_sync_enter(self);
  if (self->holePunchTimer_ && ([(CDXClient *)self sendHolePunch], self->holePunchTimer_))
  {
    if (!self->preblobIsUpToDate_)
    {
      int64_t holePunchAttemptCount = self->holePunchAttemptCount_;
      self->holePunchAttemptCount_ = holePunchAttemptCount + 1;
      double holePunchInterval = self->holePunchInterval_;
      uint32_t v5 = arc4random();
      float v6 = pow(1.33333333, (double)(int)holePunchAttemptCount) * 0.1;
      float v7 = holePunchInterval;
      if (v6 > v7) {
        float v6 = holePunchInterval;
      }
      float v8 = ((float)((float)(v5 & 0xFFFFFF) / 16777000.0) * 0.2 + 0.9) * v6;
      holePunchTimer = self->holePunchTimer_;
      dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
      dispatch_source_set_timer(holePunchTimer, v10, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(self->holePunchInterval_ * 1000000000.0));
    }
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }
  objc_sync_exit(self);
  return v11;
}

- (void)resetHolepunchTimer
{
  v11[2] = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  if (self->holePunchTimer_)
  {
    self->holePunchAttemptCount_ = 0;
    self->preblobIsUpToDate_ = 0;
    self->prevHolePunchSID_ = self->holePunchSID_;
    v11[0] = 0xAAAAAAAAAAAAAAAALL;
    v11[1] = 0xAAAAAAAAAAAAAAAALL;
    MEMORY[0x223C859D0](v11);
    self->holePunchSID_ = v11[0];
    int64_t holePunchAttemptCount = self->holePunchAttemptCount_;
    self->holePunchAttemptCount_ = holePunchAttemptCount + 1;
    double holePunchInterval = self->holePunchInterval_;
    uint32_t v5 = arc4random();
    float v6 = pow(1.33333333, (double)(int)holePunchAttemptCount) * 0.1;
    float v7 = holePunchInterval;
    if (v6 > v7) {
      float v6 = holePunchInterval;
    }
    float v8 = ((float)((float)(v5 & 0xFFFFFF) / 16777000.0) * 0.2 + 0.9) * v6;
    holePunchTimer = self->holePunchTimer_;
    dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
    dispatch_source_set_timer(holePunchTimer, v10, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(self->holePunchInterval_ * 1000000000.0));
  }
  objc_sync_exit(self);
}

- (void)handleFDEvent
{
  OUTLINED_FUNCTION_5();
  objc_msgSend((id)OUTLINED_FUNCTION_10(v0, *MEMORY[0x263EF8340]), "UTF8String");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(&dword_221563000, v1, v2, "CDXClient [%s] %s:%d %s: Received hole punch, no change from previous.", v3, v4, v5, v6, v7);
}

- (void)networkDidChange
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        uint64_t v5 = (const char *)objc_msgSend((id)-[CDXClient description](self, "description"), "UTF8String");
      }
      else {
        uint64_t v5 = "<nil>";
      }
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      uint64_t v9 = "-[CDXClient networkDidChange]";
      __int16 v10 = 1024;
      int v11 = 1080;
      __int16 v12 = 2080;
      uint64_t v13 = v5;
      _os_log_impl(&dword_221563000, v4, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: Processing network change. . .", (uint8_t *)&v6, 0x26u);
    }
  }
  [(CDXClient *)self setError:0];
  [(CDXClient *)self resetHolepunchTimer];
  self->willReconfigureShortly_ = 0;
  [(CDXClient *)self restart];
}

- (void)stopListeningOnSockets
{
  source = self->source_;
  if (source)
  {
    dispatch_source_cancel(source);
    uint64_t v4 = self->source_;
    if (!dispatch_source_testcancel(v4))
    {
      while (1)
        ;
    }
    if (v4)
    {
      dispatch_release(v4);
      self->source_ = 0;
    }
  }
}

- (void)startListeningOnSockets
{
  uint64_t v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83E8], self->fd_, 0, (dispatch_queue_t)self->queue_);
  self->source_ = v3;
  if (v3)
  {
    int fd = self->fd_;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __36__CDXClient_startListeningOnSockets__block_invoke;
    handler[3] = &__block_descriptor_36_e5_v8__0l;
    int v9 = fd;
    dispatch_source_set_cancel_handler((dispatch_source_t)v3, handler);
    source = self->source_;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __36__CDXClient_startListeningOnSockets__block_invoke_2;
    v7[3] = &unk_2645B7C20;
    v7[4] = self;
    dispatch_source_set_event_handler(source, v7);
    dispatch_resume((dispatch_object_t)self->source_);
  }
  else
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"CDXClient", 4, objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"Unable to create dispatch read source for file descriptor.", *MEMORY[0x263F08338], 0));
    [(CDXClient *)self setError:v6];
  }
}

uint64_t __36__CDXClient_startListeningOnSockets__block_invoke(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

uint64_t __36__CDXClient_startListeningOnSockets__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleFDEvent];
}

- (CDXClient)initWithOptions:(id)a3 delegate:(id)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  v48.receiver = self;
  v48.super_class = (Class)CDXClient;
  uint64_t v6 = [(CDXClient *)&v48 init];
  uint64_t v7 = v6;
  if (!v6) {
    return v7;
  }
  v6->delegate_ = (CDXClientDelegate *)a4;
  if (IsGarbageCollectionEnabled_cachedValue == -1)
  {
    IsGarbageCollectionEnabled_cachedValue = objc_msgSend((id)objc_msgSend((id)-[objc_class performSelector:](NSClassFromString(&cfstr_Nsgarbagecolle.isa), "performSelector:", sel_defaultCollector), "valueForKey:", @"isEnabled"), "BOOLValue");
    if (IsGarbageCollectionEnabled_cachedValue) {
      goto LABEL_4;
    }
  }
  else if (IsGarbageCollectionEnabled_cachedValue)
  {
LABEL_4:
    CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)(id)[NSClassFromString(&cfstr_Nsmaptable.isa) performSelector:sel_mapTableWithStrongToWeakObjects];
    goto LABEL_7;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], 0);
LABEL_7:
  v7->sessionLookup_ = (NSMutableDictionary *)Mutable;
  int v9 = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"CDXOverrideServer");
  v7->server_ = v9;
  if (v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      int v11 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = objc_msgSend((id)-[CDXClient description](v7, "description"), "UTF8String");
        server = v7->server_;
        if (server) {
          uint64_t v14 = [[(NSString *)server description] UTF8String];
        }
        else {
          uint64_t v14 = "<nil>";
        }
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v10;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[CDXClient initWithOptions:delegate:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 1203;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = v12;
        *(_WORD *)&buf[38] = 2080;
        *(void *)&buf[40] = v14;
        _os_log_impl(&dword_221563000, v11, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: Using CDXOverrideServer: %s", buf, 0x30u);
      }
    }
  }
  unsigned __int16 v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"CDXOverridePort"), "integerValue");
  v7->port_ = v15;
  if (v15)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      socklen_t v17 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = objc_msgSend((id)-[CDXClient description](v7, "description"), "UTF8String");
        int port = v7->port_;
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v16;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[CDXClient initWithOptions:delegate:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 1206;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = v18;
        *(_WORD *)&buf[38] = 1024;
        *(_DWORD *)&buf[40] = port;
        _os_log_impl(&dword_221563000, v17, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: Using CDXOverridePort: %d", buf, 0x2Cu);
      }
    }
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"CDXOverrideHolePunchInterval"), "doubleValue");
  v7->holePunchInterval_ = v20;
  if (v20 != 0.0 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    uint64_t v22 = *MEMORY[0x263F21098];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = objc_msgSend((id)-[CDXClient description](v7, "description"), "UTF8String");
      double holePunchInterval = v7->holePunchInterval_;
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[CDXClient initWithOptions:delegate:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 1209;
      *(_WORD *)&buf[28] = 2080;
      *(void *)&buf[30] = v23;
      *(_WORD *)&buf[38] = 2048;
      *(double *)&buf[40] = holePunchInterval;
      _os_log_impl(&dword_221563000, v22, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: Using CDXOverrideHolePunchInterval: %f", buf, 0x30u);
    }
  }
  __int16 v25 = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"CDXIP");
  v7->server_ = v25;
  if (v25)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      __int16 v27 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = objc_msgSend((id)-[CDXClient description](v7, "description"), "UTF8String");
        __int16 v29 = v7->server_;
        if (v29) {
          int v30 = [[(NSString *)v29 description] UTF8String];
        }
        else {
          int v30 = "<nil>";
        }
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v26;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[CDXClient initWithOptions:delegate:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 1214;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = v28;
        *(_WORD *)&buf[38] = 2080;
        *(void *)&buf[40] = v30;
        _os_log_impl(&dword_221563000, v27, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: Using CDXIP(deprecated, please use CDXOverrideServer instead): %s", buf, 0x30u);
      }
    }
  }
  unsigned __int16 v31 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"CDXPort"), "integerValue");
  v7->port_ = v31;
  if (v31)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v32 = VRTraceErrorLogLevelToCSTR();
      __int16 v33 = *MEMORY[0x263F21098];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F21098], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = objc_msgSend((id)-[CDXClient description](v7, "description"), "UTF8String");
        int v35 = v7->port_;
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v32;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[CDXClient initWithOptions:delegate:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 1217;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = v34;
        *(_WORD *)&buf[38] = 1024;
        *(_DWORD *)&buf[40] = v35;
        _os_log_impl(&dword_221563000, v33, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d %s: Using CDXPort(deprecated, please use CDXOverridePort instead): %d", buf, 0x2Cu);
      }
    }
  }
  if (![(NSString *)v7->server_ length]) {
    v7->server_ = (NSString *)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"server"), "copyWithZone:", -[CDXClient zone](v7, "zone"));
  }
  if (!v7->port_) {
    v7->port_ = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"port"), "integerValue");
  }
  if (v7->holePunchInterval_ == 0.0)
  {
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"holePunchInterval"), "doubleValue");
    v7->holePunchInterval_ = v36;
  }
  uint64_t v37 = [off_2645B7A10 getIPPortForService:*(void *)off_2645B7910];
  if (v37)
  {
    uint64_t v38 = v37;
    if (![(NSString *)v7->server_ length])
    {
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v54 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      memset(buf, 0, sizeof(buf));
      unsigned int v47 = bswap32(*(_DWORD *)(v38 + 20));
      inet_ntop(2, &v47, (char *)buf, 0xFFu);
      v7->server_ = (NSString *)[[NSString alloc] initWithUTF8String:buf];
    }
    if (!v7->port_) {
      v7->port_ = *(_WORD *)(v38 + 36);
    }
    free((void *)v38);
  }
  if (![(NSString *)v7->server_ length]) {
    v7->server_ = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"CDXDefaultServer");
  }
  if (!v7->port_) {
    v7->port_ = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"CDXDefaultPort"), "integerValue");
  }
  if (v7->holePunchInterval_ == 0.0)
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"CDXDefaultHolePunchInterval"), "doubleValue");
    v7->holePunchInterval_ = v39;
  }
  if (![(NSString *)v7->server_ length]) {
    v7->server_ = (NSString *)@"17.155.5.253";
  }
  if (!v7->port_) {
    v7->port_ = 4398;
  }
  double v40 = v7->holePunchInterval_;
  if (v40 == 0.0)
  {
    v7->holePunchInterval_ = 30.0;
    double v40 = 30.0;
  }
  v41 = (int *)MEMORY[0x263F21080];
  int v42 = *MEMORY[0x263F21080];
  v43 = (unsigned char *)MEMORY[0x263F21090];
  if ((int)*MEMORY[0x263F21080] > 6 || (int v44 = *MEMORY[0x263F21090], *MEMORY[0x263F21090]))
  {
    *(double *)buf = v40;
    VRTraceVariable_();
    int v42 = *v41;
    int v44 = *v43 != 0;
  }
  if (v42 > 6 || v44)
  {
    *(_WORD *)buf = v7->port_;
    VRTraceVariable_();
    int v42 = *v41;
    int v44 = *v43 != 0;
  }
  if (v42 > 6 || v44)
  {
    [(NSString *)v7->server_ UTF8String];
    strlen([(NSString *)v7->server_ UTF8String]);
    VRTraceVariable_();
  }
  v45 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"queue", v40), "pointerValue");
  v7->queue_ = (OS_dispatch_queue *)v45;
  if (v45) {
    dispatch_retain(v45);
  }
  else {
    v7->queue_ = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"com.apple.cdx.%p", v7), "UTF8String"), 0);
  }
  [(CDXClient *)v7 start];
  return v7;
}

- (const)currentSockAddr
{
  cdxMappedIPv4Addr = self->cdxMappedIPv4Addr;
  if (cdxMappedIPv4Addr) {
    return cdxMappedIPv4Addr->ai_addr;
  }
  else {
    return (const sockaddr *)&self->cdxaddr_ipv4;
  }
}

- (unsigned)currentSockAddrLen
{
  cdxMappedIPv4Addr = self->cdxMappedIPv4Addr;
  if (cdxMappedIPv4Addr) {
    return cdxMappedIPv4Addr->ai_addrlen;
  }
  else {
    LOBYTE(v3) = self->cdxaddr_ipv4.sin_len;
  }
  return v3;
}

- (void)mapIPv4AddrToIPv6:(sockaddr_in *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  p_cdxMappedIPv4Addr = &self->cdxMappedIPv4Addr;
  cdxMappedIPv4Addr = self->cdxMappedIPv4Addr;
  if (cdxMappedIPv4Addr)
  {
    freeaddrinfo(cdxMappedIPv4Addr);
    *p_cdxMappedIPv4Addr = 0;
  }
  *(void *)uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v7 = inet_ntop(2, &a3->sin_addr, v14, 0x10u);
  memset(&v11, 0, sizeof(v11));
  v11.ai_socktype = 2;
  v11.ai_flags = 1536;
  int v8 = getaddrinfo(v7, 0, &v11, p_cdxMappedIPv4Addr);
  if (v8)
  {
    int v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = v8;
    uint64_t v12 = *MEMORY[0x263F08338];
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Call to getaddrinfo() failed for hostname \"%s\". Error %s.", v7, gai_strerror(v8));
    -[CDXClient setError:](self, "setError:", objc_msgSend(v9, "errorWithDomain:code:userInfo:", @"error", v10, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1)));
  }
  else
  {
    *(_WORD *)self->cdxMappedIPv4Addr->ai_addr->sa_data = bswap32(self->port_) >> 16;
  }
}

- (void)dealloc
{
  source = self->source_;
  if (source) {
    dispatch_release(source);
  }
  holePunchTimer = self->holePunchTimer_;
  if (holePunchTimer) {
    dispatch_release(holePunchTimer);
  }
  queue = self->queue_;
  if (queue) {
    dispatch_release(queue);
  }

  cdxMappedIPv4Addr = self->cdxMappedIPv4Addr;
  if (cdxMappedIPv4Addr) {
    freeaddrinfo(cdxMappedIPv4Addr);
  }

  v7.receiver = self;
  v7.super_class = (Class)CDXClient;
  [(CDXClient *)&v7 dealloc];
}

- (void)start
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  int v3 = gethostbyname2([(NSString *)self->server_ UTF8String], 2);
  *(_WORD *)&self->cdxaddr_ipv4.sin_len = 528;
  unsigned int v4 = bswap32(self->port_) >> 16;
  self->cdxaddr_ipv4.sin_int port = v4;
  self->cdxaddr_ipv4.sin_addr.s_addr = 16777343;
  uint64_t v5 = (int)*MEMORY[0x263EF88E8];
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v3 == 0;
  }
  if (v6)
  {
    uint64_t v18 = (void *)MEMORY[0x263F087E8];
    __int16 v19 = NSDictionary;
    uint64_t v20 = [NSString stringWithFormat:@"Call to gethostbyname2() failed for hostname \"%@\". Error %d.", self->server_, v5];
    uint64_t v21 = objc_msgSend(v19, "dictionaryWithObjectsAndKeys:", v20, *MEMORY[0x263F08338], 0);
    uint64_t v22 = @"h_errno";
    uint64_t v23 = v18;
    uint64_t v24 = v5;
  }
  else
  {
    if (v3->h_length > 1)
    {
      self->cdxaddr_ipv4.sin_addr.s_addr = **(_DWORD **)v3->h_addr_list;
      self->cdxaddr_ipv4.sin_int port = v4;
      objc_sync_enter(self);
      [(CDXClient *)self mapIPv4AddrToIPv6:&self->cdxaddr_ipv4];
      cdxMappedIPv4Addr = self->cdxMappedIPv4Addr;
      if (cdxMappedIPv4Addr) {
        int ai_family = cdxMappedIPv4Addr->ai_family;
      }
      else {
        int ai_family = 2;
      }
      int v9 = socket(ai_family, 2, 17);
      self->fd_ = v9;
      if (v9 <= 0)
      {
        __int16 v29 = (void *)MEMORY[0x263F087E8];
        uint64_t v30 = *__error();
        unsigned __int16 v31 = NSDictionary;
        uint64_t v32 = NSString;
        __int16 v33 = __error();
        -[CDXClient setError:](self, "setError:", [v29 errorWithDomain:*MEMORY[0x263F08438], v30, objc_msgSend(v31, "dictionaryWithObjectsAndKeys:", objc_msgSend(v32, "stringWithFormat:", @"Unable to create FD to CDX. %s", strerror(*v33)), *MEMORY[0x263F08338], 0) code userInfo]);
      }
      else
      {
        LODWORD(v40.version) = 1;
        setsockopt(v9, 0xFFFF, 4130, &v40, 4u);
        uint64_t v10 = self->cdxMappedIPv4Addr;
        if (v10 && v10->ai_family == 30)
        {
          memset((char *)&v40.version + 4, 0, 24);
          LOWORD(v40.version) = 7708;
          WORD1(v40.version) = bswap32(self->localPort_) >> 16;
          *(_OWORD *)&v40.info = *MEMORY[0x263EF88F0];
          int v11 = bind(self->fd_, (const sockaddr *)&v40, 0x1Cu);
        }
        else
        {
          v40.info = 0;
          LOWORD(v40.version) = 528;
          WORD1(v40.version) = bswap32(self->localPort_) >> 16;
          HIDWORD(v40.version) = 0;
          int v11 = bind(self->fd_, (const sockaddr *)&v40, 0x10u);
        }
        if (!v11)
        {
          objc_sync_exit(self);
          [(CDXClient *)self startListeningOnSockets];
          uint64_t v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->queue_);
          self->holePunchTimer_ = v12;
          if (v12)
          {
            handler[0] = MEMORY[0x263EF8330];
            handler[1] = 3221225472;
            handler[2] = __18__CDXClient_start__block_invoke;
            handler[3] = &unk_2645B7C20;
            void handler[4] = self;
            dispatch_source_set_event_handler((dispatch_source_t)v12, handler);
            holePunchTimer = self->holePunchTimer_;
            dispatch_time_t v14 = dispatch_time(0, (uint64_t)(self->holePunchInterval_ * 1000000000.0));
            dispatch_source_set_timer(holePunchTimer, v14, 0xFFFFFFFFFFFFFFFFLL, 0);
            dispatch_resume((dispatch_object_t)self->holePunchTimer_);
            [(CDXClient *)self resetHolepunchTimer];
            [(CDXClient *)self sendHolePunch];
            v40.version = 0;
            v40.info = self;
            v40.retain = (const void *(__cdecl *)(const void *))MEMORY[0x263EFF3B8];
            v40.release = (void (__cdecl *)(const void *))MEMORY[0x263EFF3B0];
            v40.copyDescription = 0;
            uint64_t v15 = SCDynamicStoreCreate(0, (CFStringRef)objc_msgSend(NSString, "stringWithFormat:", @"com.apple.cdx.%p", self), (SCDynamicStoreCallBack)CDX_SCDynamicStoreCallBack, &v40);
            self->scDynamicStore_ = v15;
            if (v15)
            {
              RunLoopSource = SCDynamicStoreCreateRunLoopSource(0, v15, 0);
              self->scDynamicStoreRunLoopSource_ = RunLoopSource;
              if (RunLoopSource)
              {
                Main = CFRunLoopGetMain();
                CFRunLoopAddSource(Main, self->scDynamicStoreRunLoopSource_, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
                SCDynamicStoreSetNotificationKeys(self->scDynamicStore_, 0, (CFArrayRef)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"State:/Network/Interface/[^/]+/IPv4", 0));
              }
            }
          }
          else
          {
            -[CDXClient setError:](self, "setError:", objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"CDXClient", 5, objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"Unable to create dispatch timer source holePunchTimer.", *MEMORY[0x263F08338], 0)));
          }
          return;
        }
        uint64_t v34 = (void *)MEMORY[0x263F087E8];
        uint64_t v35 = *__error();
        double v36 = NSDictionary;
        uint64_t v37 = NSString;
        uint64_t v38 = __error();
        -[CDXClient setError:](self, "setError:", [v34 errorWithDomain:*MEMORY[0x263F08438], v35, objc_msgSend(v36, "dictionaryWithObjectsAndKeys:", objc_msgSend(v37, "stringWithFormat:", @"Unable to bind FD to sockaddr. %s", strerror(*v38)), *MEMORY[0x263F08338], 0) code userInfo]);
      }
      objc_sync_exit(self);
      return;
    }
    __int16 v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = NSDictionary;
    uint64_t v27 = [NSString stringWithFormat:@"gethostbyname2() did not return any addresses for hostname \"%@\".", self->server_];
    uint64_t v21 = objc_msgSend(v26, "dictionaryWithObjectsAndKeys:", v27, *MEMORY[0x263F08338], 0);
    uint64_t v22 = @"CDXClient";
    uint64_t v23 = v25;
    uint64_t v24 = 3;
  }
  uint64_t v28 = [v23 errorWithDomain:v22 code:v24 userInfo:v21];
  [(CDXClient *)self setError:v28];
}

uint64_t __18__CDXClient_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleHolePunchEvent];
}

- (void)restart
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7_0(&dword_221563000, v0, v1, "CDXClient [%s] %s:%d ", v2, v3, v4, v5, v6);
}

- (void)stopHolePunchTimer
{
  holePunchTimer = self->holePunchTimer_;
  if (holePunchTimer)
  {
    dispatch_source_cancel(holePunchTimer);
    uint64_t v4 = self->holePunchTimer_;
    if (v4)
    {
      dispatch_release(v4);
      self->holePunchTimer_ = 0;
    }
  }
}

- (void)invalidate
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7_0(&dword_221563000, v0, v1, "CDXClient [%s] %s:%d ", v2, v3, v4, v5, v6);
}

- (BOOL)sendRaw:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_sync_enter(self);
  ssize_t v5 = sendto(self->fd_, (const void *)[a3 bytes], objc_msgSend(a3, "length"), 0, -[CDXClient currentSockAddr](self, "currentSockAddr"), -[CDXClient currentSockAddrLen](self, "currentSockAddrLen"));
  objc_sync_exit(self);
  if (*__error() == 12) {
    return 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    int v8 = *MEMORY[0x263F21098];
    int v9 = *MEMORY[0x263F21098];
    if (*MEMORY[0x263F21088])
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        if (a3) {
          uint64_t v10 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        }
        else {
          uint64_t v10 = "<nil>";
        }
        int v11 = 136315906;
        uint64_t v12 = v7;
        __int16 v13 = 2080;
        dispatch_time_t v14 = "-[CDXClient sendRaw:]";
        __int16 v15 = 1024;
        int v16 = 1639;
        __int16 v17 = 2080;
        uint64_t v18 = v10;
        _os_log_impl(&dword_221563000, v8, OS_LOG_TYPE_DEFAULT, "CDXClient [%s] %s:%d sendRaw:%s", (uint8_t *)&v11, 0x26u);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[CDXClient sendRaw:]();
    }
  }
  return v5 == [a3 length];
}

- (void)invalidateSession:(id)a3
{
  ssize_t v5 = [(CDXClient *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__CDXClient_invalidateSession___block_invoke;
  v6[3] = &unk_2645B7C68;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async((dispatch_queue_t)v5, v6);
}

uint64_t __31__CDXClient_invalidateSession___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "ticket"), "CDXTicketSID"));
  return [v1 removeObjectForKey:v2];
}

- (id)createSessionWithTicket:(id)a3 sessionKey:(id)a4
{
  if (![a3 CDXTicketWellFormed]) {
    return 0;
  }
  uint64_t v7 = [+[CDXClientSession allocWithZone:[(CDXClient *)self zone]] initWithCDXClient:self ticket:a3 sessionKey:a4];
  int v8 = [(CDXClient *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__CDXClient_createSessionWithTicket_sessionKey___block_invoke;
  block[3] = &unk_2645B7C90;
  block[4] = self;
  void block[5] = a3;
  block[6] = v7;
  dispatch_async((dispatch_queue_t)v8, block);
  return v7;
}

uint64_t __48__CDXClient_createSessionWithTicket_sessionKey___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 40), "CDXTicketSID"));
  return [v2 setObject:v1 forKeyedSubscript:v3];
}

- (OS_dispatch_queue)queue
{
  return self->queue_;
}

- (id)preblobCallback
{
  return self->preblobCallback_;
}

- (void)setPreblobCallback:(id)a3
{
}

- (CDXClientDelegate)delegate
{
  return self->delegate_;
}

- (void)setDelegate:(id)a3
{
  self->delegate_ = (CDXClientDelegate *)a3;
}

- (void)setError:.cold.1()
{
  OUTLINED_FUNCTION_5();
  objc_msgSend((id)OUTLINED_FUNCTION_10(v1, *MEMORY[0x263EF8340]), "UTF8String");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(&dword_221563000, v0, OS_LOG_TYPE_ERROR, "CDXClient [%s] %s:%d err = %s", v2, 0x26u);
}

- (void)sendRaw:.cold.1()
{
  OUTLINED_FUNCTION_5();
  if (v0) {
    objc_msgSend((id)objc_msgSend(v0, "description"), "UTF8String");
  }
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(&dword_221563000, v1, v2, "CDXClient [%s] %s:%d sendRaw:%s", v3, v4, v5, v6, v7);
}

@end