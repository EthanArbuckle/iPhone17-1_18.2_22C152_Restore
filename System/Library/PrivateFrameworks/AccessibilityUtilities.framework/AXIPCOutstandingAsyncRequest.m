@interface AXIPCOutstandingAsyncRequest
+ (id)lookupByPort:(unsigned int)a3;
+ (void)initialize;
+ (void)registerOutstandingRequest:(id)a3;
+ (void)unregisterByPort:(unsigned int)a3;
- (AXIPCOutstandingAsyncRequest)initWithReplyPort:(unsigned int)a3 handlerQueue:(id)a4 handler:(id)a5;
- (OS_dispatch_queue)replyQueue;
- (__CFRunLoopSource)replyMachPortSource;
- (id)replyHandler;
- (unsigned)replyPort;
- (void)_responseReceived:(id)a3;
- (void)dealloc;
- (void)initialSendAborted;
- (void)rawResponseReceived:(id)a3;
- (void)registerAndListenForResponse;
- (void)sendOnceRightDestroyed;
@end

@implementation AXIPCOutstandingAsyncRequest

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___AXIPCOutstandingAsyncRequest;
  objc_msgSendSuper2(&v2, sel_initialize);
  if (initialize_token != -1) {
    dispatch_once(&initialize_token, &__block_literal_global_18);
  }
}

uint64_t __42__AXIPCOutstandingAsyncRequest_initialize__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  v1 = (void *)OutstandingAsyncRequestsLock;
  OutstandingAsyncRequestsLock = (uint64_t)v0;

  AllOutstandingAsyncRequests = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);

  return MEMORY[0x1F41817F8]();
}

+ (id)lookupByPort:(unsigned int)a3
{
  [(id)OutstandingAsyncRequestsLock lock];
  v4 = (void *)AllOutstandingAsyncRequests;
  v5 = [NSNumber numberWithUnsignedInteger:a3];
  v6 = [v4 objectForKey:v5];

  id v7 = AXRetainAutorelease(v6);
  [(id)OutstandingAsyncRequestsLock unlock];

  return v6;
}

+ (void)unregisterByPort:(unsigned int)a3
{
  [(id)OutstandingAsyncRequestsLock lock];
  v4 = (void *)AllOutstandingAsyncRequests;
  v5 = [NSNumber numberWithUnsignedInteger:a3];
  [v4 removeObjectForKey:v5];

  v6 = (void *)OutstandingAsyncRequestsLock;

  [v6 unlock];
}

+ (void)registerOutstandingRequest:(id)a3
{
  v3 = (void *)OutstandingAsyncRequestsLock;
  id v4 = a3;
  [v3 lock];
  v5 = (void *)AllOutstandingAsyncRequests;
  unsigned int v6 = [v4 replyPort];
  id v7 = [NSNumber numberWithUnsignedInteger:v6];
  [v5 setObject:v4 forKey:v7];

  v8 = (void *)OutstandingAsyncRequestsLock;

  [v8 unlock];
}

- (AXIPCOutstandingAsyncRequest)initWithReplyPort:(unsigned int)a3 handlerQueue:(id)a4 handler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AXIPCOutstandingAsyncRequest;
  v11 = [(AXIPCOutstandingAsyncRequest *)&v16 init];
  if (v11)
  {
    if (a3 - 1 >= 0xFFFFFFFE) {
      _AXAssert();
    }
    uint64_t v12 = MSHCreateMIGServerSource();
    v11->_replyMachPortSource = (__CFRunLoopSource *)v12;
    if (v12)
    {
      MSHMIGSourceSetSendOnceCallback();
      v11->_replyPort = a3;
      objc_storeStrong((id *)&v11->_replyQueue, a4);
      uint64_t v13 = [v10 copy];
      replyHandler = v11->_replyHandler;
      v11->_replyHandler = (id)v13;
    }
    else
    {
      replyHandler = v11;
      v11 = 0;
    }
  }
  return v11;
}

- (void)dealloc
{
  id replyHandler = self->_replyHandler;
  self->_id replyHandler = 0;

  replyMachPortSource = self->_replyMachPortSource;
  if (replyMachPortSource)
  {
    CFRunLoopSourceInvalidate(replyMachPortSource);
    v5 = self->_replyMachPortSource;
    if (v5)
    {
      CFRelease(v5);
      self->_replyMachPortSource = 0;
    }
  }
  mach_port_name_t replyPort = self->_replyPort;
  if (replyPort + 1 >= 2)
  {
    uint64_t v7 = mach_port_mod_refs(*MEMORY[0x1E4F14960], replyPort, 1u, -1);
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = mach_error_string(v7);
      uint64_t v12 = "-[AXIPCOutstandingAsyncRequest dealloc]";
      uint64_t v13 = self->_replyPort;
      uint64_t v10 = v8;
      v11 = v9;
      _AXAssert();
    }
    self->_mach_port_name_t replyPort = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)AXIPCOutstandingAsyncRequest;
  [(AXIPCOutstandingAsyncRequest *)&v14 dealloc];
}

- (void)registerAndListenForResponse
{
  [(id)objc_opt_class() registerOutstandingRequest:self];
  Main = CFRunLoopGetMain();
  id v4 = [(AXIPCOutstandingAsyncRequest *)self replyMachPortSource];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D410];

  CFRunLoopAddSource(Main, v4, v5);
}

- (void)_responseReceived:(id)a3
{
  id v4 = a3;
  [(AXIPCOutstandingAsyncRequest *)self replyMachPortSource];
  MSHMIGSourceSetSendOnceCallback();
  objc_msgSend((id)objc_opt_class(), "unregisterByPort:", -[AXIPCOutstandingAsyncRequest replyPort](self, "replyPort"));
  CFStringRef v5 = [(AXIPCOutstandingAsyncRequest *)self replyQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__AXIPCOutstandingAsyncRequest__responseReceived___block_invoke;
  v7[3] = &unk_1E5586470;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__AXIPCOutstandingAsyncRequest__responseReceived___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) replyHandler];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 40), 0);
}

- (void)rawResponseReceived:(id)a3
{
  id v4 = +[AXIPCMessage archivedMessageFromData:a3];
  [(AXIPCOutstandingAsyncRequest *)self _responseReceived:v4];
}

- (void)sendOnceRightDestroyed
{
  objc_msgSend((id)objc_opt_class(), "unregisterByPort:", -[AXIPCOutstandingAsyncRequest replyPort](self, "replyPort"));
  v3 = [(AXIPCOutstandingAsyncRequest *)self replyQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__AXIPCOutstandingAsyncRequest_sendOnceRightDestroyed__block_invoke;
  block[3] = &unk_1E5585F48;
  block[4] = self;
  dispatch_async(v3, block);
}

void __54__AXIPCOutstandingAsyncRequest_sendOnceRightDestroyed__block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F48360] errorWithDescription:@"reply send-once right was destroyed, so this async request (%@) will never receive a reply.", *(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 32) replyHandler];
  ((void (**)(void, void, id))v2)[2](v2, 0, v3);
}

- (void)initialSendAborted
{
  id v3 = objc_opt_class();
  uint64_t v4 = [(AXIPCOutstandingAsyncRequest *)self replyPort];

  [v3 unregisterByPort:v4];
}

- (OS_dispatch_queue)replyQueue
{
  return self->_replyQueue;
}

- (unsigned)replyPort
{
  return self->_replyPort;
}

- (id)replyHandler
{
  return self->_replyHandler;
}

- (__CFRunLoopSource)replyMachPortSource
{
  return self->_replyMachPortSource;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_replyHandler, 0);

  objc_storeStrong((id *)&self->_replyQueue, 0);
}

@end