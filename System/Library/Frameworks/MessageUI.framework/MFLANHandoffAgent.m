@interface MFLANHandoffAgent
- (BOOL)serverRunning;
- (MFLANHandoffAgent)init;
- (MFLANHandoffContext)handoffContext;
- (id)_getDeviceHostname;
- (id)startServerWithCompletion:(id)a3;
- (void)_cleanupRunLoopSource;
- (void)_cleanupSocket;
- (void)_socketListenerRunLoop;
- (void)connectToServerWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)stopServer;
@end

@implementation MFLANHandoffAgent

- (MFLANHandoffAgent)init
{
  v3.receiver = self;
  v3.super_class = (Class)MFLANHandoffAgent;
  return [(MFLANHandoffAgent *)&v3 init];
}

- (void)dealloc
{
  _Block_release(self->_connectCallbackBlock);
  [(MFLANHandoffAgent *)self stopServer];
  v3.receiver = self;
  v3.super_class = (Class)MFLANHandoffAgent;
  [(MFLANHandoffAgent *)&v3 dealloc];
}

- (id)_getDeviceHostname
{
  v9 = 0;
  int v2 = getifaddrs(&v9);
  objc_super v3 = 0;
  v4 = v9;
  if (!v2 && v9)
  {
    v5 = v9;
    while (1)
    {
      ifa_addr = v5->ifa_addr;
      if (ifa_addr->sa_family == 2 && !strcmp(v5->ifa_name, "en0")) {
        break;
      }
      v5 = v5->ifa_next;
      if (!v5)
      {
        objc_super v3 = 0;
        goto LABEL_9;
      }
    }
    v7.s_addr = *(_DWORD *)&ifa_addr->sa_data[2];
    objc_super v3 = (void *)[NSString stringWithUTF8String:inet_ntoa(v7)];
    v4 = v9;
  }
LABEL_9:
  MEMORY[0x1B3E86C10](v4);
  return v3;
}

- (void)_socketListenerRunLoop
{
  objc_super v3 = (void *)MEMORY[0x1B3E86D20](self, a2);
  if (!self->_serverRunLoopSource) {
    self->_serverRunLoopSource = CFSocketCreateRunLoopSource(0, self->_socket, 0);
  }
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, self->_serverRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
  CFRunLoopRun();
  self->_serverRunning = 0;
  [(MFLANHandoffAgent *)self _cleanupRunLoopSource];
}

- (void)_cleanupRunLoopSource
{
  if (self->_serverRunLoopSource)
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, self->_serverRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
    CFRelease(self->_serverRunLoopSource);
    self->_serverRunLoopSource = 0;
  }
}

- (void)_cleanupSocket
{
  socket = self->_socket;
  if (socket)
  {
    CFSocketInvalidate(socket);
    CFRelease(self->_socket);
    self->_socket = 0;
  }
}

- (void)stopServer
{
  self->_serverRunning = 0;

  self->_handoffContext = 0;
}

- (id)startServerWithCompletion:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (self->_serverRunning) {
    return self->_handoffContext;
  }
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = self;
  v6 = CFSocketCreate(0, 2, 1, 6, 2uLL, (CFSocketCallBack)_serverSocketConnectCallback, &context);
  self->_socket = v6;
  if (!v6)
  {
    v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MFLANHandoffAgent startServerWithCompletion:](v11);
    }
    return self->_handoffContext;
  }
  CFSocketNativeHandle Native = CFSocketGetNative(v6);
  int v20 = 1;
  setsockopt(Native, 0xFFFF, 4, &v20, 1u);
  socklen_t v19 = 16;
  *(void *)bytes = 528;
  uint64_t v28 = 0;
  CFDataRef v8 = CFDataCreate(0, bytes, 16);
  CFSocketError v9 = CFSocketSetAddress(self->_socket, v8);
  CFRelease(v8);
  if (v9)
  {
    v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MFLANHandoffAgent startServerWithCompletion:](v9, v10);
    }
    return self->_handoffContext;
  }
  id v12 = [(MFLANHandoffAgent *)self _getDeviceHostname];
  if (v12)
  {
    id v13 = v12;
    *(void *)&v26.sa_len = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&v26.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
    CFSocketNativeHandle v14 = CFSocketGetNative(self->_socket);
    getsockname(v14, &v26, &v19);
    uint64_t v15 = bswap32(*(unsigned __int16 *)v26.sa_data) >> 16;
    v16 = objc_alloc_init(MFLANHandoffContext);
    self->_handoffContext = v16;
    [(MFLANHandoffContext *)v16 setHost:v13];
    [(MFLANHandoffContext *)self->_handoffContext setPort:v15];
    v17 = MFLogGeneral();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v13;
      __int16 v24 = 1024;
      int v25 = v15;
      _os_log_impl(&dword_1AF945000, v17, OS_LOG_TYPE_INFO, "#Hand-Off [LAN] Successfully created server socket (%@:%d).", buf, 0x12u);
    }
    self->_connectCallbackBlock = _Block_copy(a3);
    [MEMORY[0x1E4F29060] detachNewThreadSelector:sel__socketListenerRunLoop toTarget:self withObject:0];
    return self->_handoffContext;
  }
  v18 = MFLogGeneral();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[MFLANHandoffAgent startServerWithCompletion:](v18);
  }
  return 0;
}

- (void)connectToServerWithContext:(id)a3 completion:(id)a4
{
  CFStringRef v6 = (const __CFString *)[a3 host];
  UInt32 v7 = [a3 port];
  if (v6)
  {
    int v8 = v7;
    if (v7)
    {
      unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
      CFReadStreamRef readStream = (CFReadStreamRef)0xAAAAAAAAAAAAAAAALL;
      CFStreamCreatePairWithSocketToHost((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v6, v7, &readStream, (CFWriteStreamRef *)&v10);
      if (readStream && v10)
      {
        (*((void (**)(id))a4 + 2))(a4);
      }
      else
      {
        CFSocketError v9 = MFLogGeneral();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[MFLANHandoffAgent connectToServerWithContext:completion:]((uint64_t)v6, v8, v9);
        }
      }
    }
  }
}

- (BOOL)serverRunning
{
  return self->_serverRunning;
}

- (MFLANHandoffContext)handoffContext
{
  return self->_handoffContext;
}

- (void)startServerWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "#Hand-Off [LAN] Failed to create server socket.", v1, 2u);
}

- (void)startServerWithCompletion:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "#Hand-Off [LAN] LAN handoff only works over WiFi/ethernet", v1, 2u);
}

- (void)startServerWithCompletion:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF945000, a2, OS_LOG_TYPE_ERROR, "#Hand-Off [LAN] Failed to bind server socket [%ld]", (uint8_t *)&v2, 0xCu);
}

- (void)connectToServerWithContext:(os_log_t)log completion:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "#Hand-Off [LAN] Error creating read/write streams for host: %@:%d", (uint8_t *)&v3, 0x12u);
}

@end