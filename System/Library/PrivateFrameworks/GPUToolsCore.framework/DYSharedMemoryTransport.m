@interface DYSharedMemoryTransport
- (BOOL)_clientConnect:(id *)a3;
- (BOOL)_createAndRunSources:(id *)a3;
- (BOOL)_initializeSMRegion:(sm_region_header *)a3 size:(unint64_t)a4 name:(const char *)a5 error:(id *)a6;
- (BOOL)_openSMRegion:(sm_region_header *)a3 size:(unint64_t)a4 name:(const char *)a5 error:(id *)a6;
- (BOOL)_serverConnect:(id *)a3;
- (BOOL)connected;
- (BOOL)deferred;
- (BOOL)send:(id)a3 inReplyTo:(id)a4 error:(id *)a5 replyQueue:(id)a6 timeout:(unint64_t)a7 handler:(id)a8;
- (DYSharedMemoryTransport)init;
- (DYSharedMemoryTransport)initWithMode:(int)a3 initialMessageSerial:(unsigned int)a4 uniqueIdentifier:(id)a5;
- (DYSharedMemoryTransport)initWithMode:(int)a3 uniqueIdentifier:(id)a4;
- (id)_getSharedMemoryNameWithSuffix:(id)a3;
- (id)connect;
- (int64_t)_read:(void *)a3 size:(unint64_t)a4;
- (int64_t)_write:(const void *)a3 size:(unint64_t)a4;
- (unint64_t)_calculateVMRegionMapSize:(unint64_t)a3;
- (unint64_t)_computeBytesAvailableToRead;
- (unint64_t)_computeBytesAvailableToWrite;
- (unsigned)_nextMessageSerial;
- (void)_accumulateMessageBytes;
- (void)_copyFromSM:(void *)a3 size:(unint64_t)a4;
- (void)_copyToSM:(const void *)a3 size:(int64_t)a4;
- (void)_dequeueIncomingMessages;
- (void)_dequeuePacket;
- (void)_invalidate;
- (void)_mapSharedMemoryFile:(int)a3 size:(unint64_t)a4 error:(id *)a5;
- (void)_relayPacket;
- (void)_setupIOBuffers;
- (void)_tearDownSharedMemory;
- (void)_updateReaderOffset:(unint64_t)a3;
- (void)_waitEAGAIN;
- (void)dealloc;
- (void)setRelayTransport:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation DYSharedMemoryTransport

- (DYSharedMemoryTransport)init
{
  return 0;
}

- (DYSharedMemoryTransport)initWithMode:(int)a3 uniqueIdentifier:(id)a4
{
  return [(DYSharedMemoryTransport *)self initWithMode:*(void *)&a3 initialMessageSerial:0 uniqueIdentifier:a4];
}

- (DYSharedMemoryTransport)initWithMode:(int)a3 initialMessageSerial:(unsigned int)a4 uniqueIdentifier:(id)a5
{
  v19.receiver = self;
  v19.super_class = (Class)DYSharedMemoryTransport;
  v8 = [(DYBaseStreamTransport *)&v19 init];
  v9 = v8;
  if (v8)
  {
    v8->_mode = a3;
    if ((a3 - 3) <= 0xFFFFFFFD)
    {
      v17 = "_mode == kDYSharedMemoryTransportModeClient || _mode == kDYSharedMemoryTransportModeServer";
    }
    else
    {
      atomic_store(a4, &v8->super.super._messageCounter);
      if (a5)
      {
        id v10 = objc_alloc(NSURL);
        v9->super.super._url = (NSURL *)[v10 initWithString:objc_msgSend(NSString, "stringWithFormat:", @"dysmt://localhost/%lx", objc_msgSend(a5, "unsignedLongValue"))];
      }
      else
      {
        std::random_device::random_device[abi:ne180100](&v18);
        unsigned int v11 = MEMORY[0x253360D00](&v18);
        id v12 = objc_alloc(NSURL);
        v9->super.super._url = (NSURL *)[v12 initWithString:objc_msgSend(NSString, "stringWithFormat:", @"dysmt://localhost/%lx%d", v11, getpid())];
        std::random_device::~random_device(&v18);
      }
      p_consumeBytesSEL = &v9->_consumeBytesSEL;
      if (sel__accumulateMessageBytes)
      {
        SEL *p_consumeBytesSEL = sel__accumulateMessageBytes;
        v14 = sel__accumulateMessageBytes;
      }
      else
      {
        v14 = 0;
        SEL *p_consumeBytesSEL = 0;
      }
      uint64_t v15 = [(DYSharedMemoryTransport *)v9 methodForSelector:v14];
      v9->_consumeBytesIMP = (void *)v15;
      if (v15)
      {
        v9->_bufferedMessages = (NSMutableArray *)objc_opt_new();
        return v9;
      }
      v17 = "_consumeBytesIMP";
    }
    __assert_rtn("-[DYSharedMemoryTransport initWithMode:initialMessageSerial:uniqueIdentifier:]", "", 0, v17);
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DYSharedMemoryTransport;
  [(DYBaseStreamTransport *)&v3 dealloc];
}

- (void)setUrl:(id)a3
{
  if (!a3) {
    __assert_rtn("-[DYSharedMemoryTransport setUrl:]", ", 0, "newUrl != nil"");
  }
  if ([(DYSharedMemoryTransport *)self connected]) {
    dy_abort("tried to set URL on connected transport");
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "scheme"), "isEqualToString:", @"dysmt") & 1) == 0
    && (objc_msgSend((id)objc_msgSend(a3, "scheme"), "isEqualToString:", @"dysmtdeferred") & 1) == 0)
  {
    dy_abort("url scheme has to be dysmt: %s", (const char *)objc_msgSend((id)objc_msgSend(a3, "absoluteString"), "UTF8String"));
  }
  if (!objc_msgSend((id)objc_msgSend(a3, "path"), "length")) {
    dy_abort("url path cannot be nil or empty: %s", (const char *)objc_msgSend((id)objc_msgSend(a3, "absoluteString"), "UTF8String"));
  }
  queue = self->super.super._queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__DYSharedMemoryTransport_setUrl___block_invoke;
  block[3] = &unk_265335F20;
  block[4] = a3;
  block[5] = self;
  dispatch_sync(queue, block);
}

uint64_t __34__DYSharedMemoryTransport_setUrl___block_invoke(uint64_t result)
{
  v1 = *(void **)(*(void *)(result + 40) + 8);
  if (*(void **)(result + 32) != v1)
  {
    uint64_t v2 = result;

    *(void *)(*(void *)(v2 + 40) + 8) = *(id *)(v2 + 32);
    result = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(v2 + 40) + 8), "scheme"), "isEqualToString:", @"dysmtdeferred");
    uint64_t v3 = *(void *)(v2 + 40);
    if (result) {
      BOOL v4 = *(_DWORD *)(v3 + 300) != 2;
    }
    else {
      BOOL v4 = 0;
    }
    *(unsigned char *)(v3 + 304) = v4;
  }
  return result;
}

- (void)setRelayTransport:(id)a3
{
  queue = self->super.super._queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__DYSharedMemoryTransport_setRelayTransport___block_invoke;
  v4[3] = &unk_265335F20;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __45__DYSharedMemoryTransport_setRelayTransport___block_invoke(uint64_t result)
{
  v1 = *(void **)(*(void *)(result + 32) + 272);
  if (v1 != *(void **)(result + 40))
  {
    uint64_t v2 = result;

    *(void *)(*(void *)(v2 + 32) + 272) = *(id *)(v2 + 40);
    uint64_t v3 = *(void *)(v2 + 32);
    uint64_t v4 = *(void *)(v3 + 272);
    v5 = (char **)(v3 + 288);
    if (v4) {
      v6 = sel__relayPacket;
    }
    else {
      v6 = sel__accumulateMessageBytes;
    }
    *v5 = v6;
    v7 = *(void **)(v2 + 32);
    if (v7[36]) {
      uint64_t v8 = v7[36];
    }
    else {
      uint64_t v8 = 0;
    }
    result = [v7 methodForSelector:v8];
    *(void *)(*(void *)(v2 + 32) + 280) = result;
    if (!*(void *)(*(void *)(v2 + 32) + 280)) {
      __assert_rtn("-[DYSharedMemoryTransport setRelayTransport:]_block_invoke", ", 0, "_consumeBytesIMP"");
    }
  }
  return result;
}

- (BOOL)send:(id)a3 inReplyTo:(id)a4 error:(id *)a5 replyQueue:(id)a6 timeout:(unint64_t)a7 handler:(id)a8
{
  if (self->_deferred)
  {
    v13 = objc_alloc_init(BufferedSendOperation);
    [(BufferedSendOperation *)v13 setMessage:a3];
    [(BufferedSendOperation *)v13 setReplyTo:a4];
    [(BufferedSendOperation *)v13 setQueue:a6];
    [(BufferedSendOperation *)v13 setReplyBlock:a8];
    [(NSMutableArray *)self->_bufferedMessages addObject:v13];
    return 1;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)DYSharedMemoryTransport;
    return [(DYTransport *)&v15 send:a3 inReplyTo:a4 error:a5 replyQueue:a6 timeout:a7 handler:a8];
  }
}

- (id)_getSharedMemoryNameWithSuffix:(id)a3
{
  return (id)[NSString stringWithFormat:@"gdt-%@-%@", -[NSString substringFromIndex:](-[NSURL path](self->super.super._url, "path"), "substringFromIndex:", 1), a3];
}

- (unint64_t)_calculateVMRegionMapSize:(unint64_t)a3
{
  return 2 * a3;
}

- (void)_mapSharedMemoryFile:(int)a3 size:(unint64_t)a4 error:(id *)a5
{
  size_t v8 = [(DYSharedMemoryTransport *)self _calculateVMRegionMapSize:a4];
  v9 = (char *)mmap(0, v8, 0, 4098, -1, 0);
  if (v9 == (char *)-1)
  {
    if (!a5) {
      return 0;
    }
    id v10 = 0;
    *a5 = +[DYError errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
  }
  else
  {
    id v10 = v9;
    if (mmap(v9, a4, 3, 17, a3, 0) != v9 || mmap(&v10[a4], a4 - 0x4000, 3, 17, a3, 0x4000) != &v10[a4])
    {
      if (a5) {
        *a5 = +[DYError errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
      }
      munmap(v10, v8);
      return 0;
    }
  }
  return v10;
}

- (void)_tearDownSharedMemory
{
  incomingShmem = self->_incomingShmem;
  if (incomingShmem)
  {
    munmap(incomingShmem, [(DYSharedMemoryTransport *)self _calculateVMRegionMapSize:incomingShmem->var6]);
    self->_incomingShmem = 0;
    self->_incomingBuffer = 0;
  }
  outgoingShmem = self->_outgoingShmem;
  if (outgoingShmem)
  {
    munmap(outgoingShmem, [(DYSharedMemoryTransport *)self _calculateVMRegionMapSize:outgoingShmem->var6]);
    self->_outgoingShmem = 0;
    self->_outgoingBuffer = 0;
  }
  self->_masterSMRegion = 0;
  if (self->_sendName[0]) {
    shm_unlink(self->_sendName);
  }
  if (self->_receiveName[0])
  {
    shm_unlink(self->_receiveName);
  }
}

- (BOOL)_initializeSMRegion:(sm_region_header *)a3 size:(unint64_t)a4 name:(const char *)a5 error:(id *)a6
{
  if (((a4 + *MEMORY[0x263EF8AF8] - 1) & -*MEMORY[0x263EF8AF8]) <= 0x8000) {
    unint64_t v9 = 0x8000;
  }
  else {
    unint64_t v9 = (a4 + *MEMORY[0x263EF8AF8] - 1) & -*MEMORY[0x263EF8AF8];
  }
  uint64_t v10 = shm_open(a5, 2562, 390);
  if (v10 == -1 || (uint64_t v11 = v10, ftruncate(v10, v9) == -1))
  {
    if (a6)
    {
      objc_super v15 = +[DYError errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
      LOBYTE(v12) = 0;
      *a6 = v15;
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    id v12 = [(DYSharedMemoryTransport *)self _mapSharedMemoryFile:v11 size:v9 error:a6];
    if (v12)
    {
      v13 = v12;
      close(v11);
      memset_pattern16(v13, &-[DYSharedMemoryTransport _initializeSMRegion:size:name:error:]::pattern, v9);
      atomic_store(0, &v13->var0);
      atomic_store(0, &v13->var1);
      atomic_store(0, &v13->var2);
      unsigned int v14 = atomic_load(&self->super.super._messageCounter);
      atomic_store(v14, &v13->var3);
      atomic_store(0, &v13->var4);
      atomic_store(0, &v13->var5);
      v13->var6 = v9;
      v13->var7 = v9 - 0x4000;
      *a3 = v13;
      LOBYTE(v12) = 1;
    }
  }
  return (char)v12;
}

- (BOOL)_openSMRegion:(sm_region_header *)a3 size:(unint64_t)a4 name:(const char *)a5 error:(id *)a6
{
  uint64_t v11 = shm_open(a5, 2, 6);
  if (v11 == -1)
  {
    unsigned int v12 = 0;
    do
    {
      if (*__error() == 4)
      {
        if (v12 >= 3) {
          goto LABEL_18;
        }
      }
      else if (*__error() != 2 || v12 >= 3)
      {
        goto LABEL_18;
      }
      ++v12;
      sleep(1u);
      uint64_t v14 = shm_open(a5, 2, 6);
    }
    while (v14 == -1);
    uint64_t v11 = v14;
  }
  if (((a4 + *MEMORY[0x263EF8AF8] - 1) & -*MEMORY[0x263EF8AF8]) <= 0x8000) {
    unint64_t v15 = 0x8000;
  }
  else {
    unint64_t v15 = (a4 + *MEMORY[0x263EF8AF8] - 1) & -*MEMORY[0x263EF8AF8];
  }
  v16 = [(DYSharedMemoryTransport *)self _mapSharedMemoryFile:v11 size:v15 error:a6];
  if (v16)
  {
    v17 = v16;
    close(v11);
    if (shm_unlink(a5) == -1)
    {
LABEL_18:
      if (a6)
      {
        std::random_device v18 = +[DYError errorWithDomain:*MEMORY[0x263F08438] code:*__error() userInfo:0];
        LOBYTE(v16) = 0;
        *a6 = v18;
      }
      else
      {
        LOBYTE(v16) = 0;
      }
    }
    else
    {
      *a3 = v17;
      LOBYTE(v16) = 1;
    }
  }
  return (char)v16;
}

- (void)_setupIOBuffers
{
  self->_outgoingBuffer = &self->_outgoingShmem[512];
  self->_incomingBuffer = &self->_incomingShmem[512];
}

- (BOOL)_createAndRunSources:(id *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  pthread_attr_init(&v16);
  pthread_attr_setdetachstate(&v16, 2);
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  uint64_t v15 = 0;
  uint64_t v4 = [DYContinuation alloc];
  queue = self->super.super._queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__DYSharedMemoryTransport__createAndRunSources___block_invoke;
  v9[3] = &unk_265335F70;
  v9[4] = self;
  v9[5] = &v10;
  v6 = [(DYContinuation *)v4 initWithQueue:queue block:v9];
  v11[5] = (uint64_t)v6;
  pthread_t v8 = 0;
  pthread_create(&v8, &v16, (void *(__cdecl *)(void *))smt_poll_thread_entry, v6);
  pthread_attr_destroy(&v16);
  _Block_object_dispose(&v10, 8);
  return 1;
}

uint64_t __48__DYSharedMemoryTransport__createAndRunSources___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 52))
  {
    *(unsigned char *)(*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) + 24) = 1;
  }
  else
  {
    unsigned int v2 = atomic_load((unsigned int *)(v1 + 48));
    atomic_store(v2, *(unsigned int **)(*(void *)(result + 32) + 232));
    return [*(id *)(result + 32) _dequeueIncomingMessages];
  }
  return result;
}

- (BOOL)_serverConnect:(id *)a3
{
  objc_msgSend(-[DYSharedMemoryTransport _getSharedMemoryNameWithSuffix:](self, "_getSharedMemoryNameWithSuffix:", @"s"), "getCString:maxLength:encoding:", self->_sendName, 64, 1);
  objc_msgSend(-[DYSharedMemoryTransport _getSharedMemoryNameWithSuffix:](self, "_getSharedMemoryNameWithSuffix:", @"c"), "getCString:maxLength:encoding:", self->_receiveName, 64, 1);
  if (![(DYSharedMemoryTransport *)self _initializeSMRegion:&self->_outgoingShmem size:0x4000 name:self->_sendName error:a3]|| ![(DYSharedMemoryTransport *)self _initializeSMRegion:&self->_incomingShmem size:0x40000 name:self->_receiveName error:a3])
  {
    return 0;
  }
  [(DYSharedMemoryTransport *)self _setupIOBuffers];
  BOOL result = [(DYSharedMemoryTransport *)self _createAndRunSources:a3];
  self->_masterSMRegion = self->_incomingShmem;
  return result;
}

- (BOOL)_clientConnect:(id *)a3
{
  objc_msgSend(-[DYSharedMemoryTransport _getSharedMemoryNameWithSuffix:](self, "_getSharedMemoryNameWithSuffix:", @"c"), "getCString:maxLength:encoding:", self->_sendName, 64, 1);
  objc_msgSend(-[DYSharedMemoryTransport _getSharedMemoryNameWithSuffix:](self, "_getSharedMemoryNameWithSuffix:", @"s"), "getCString:maxLength:encoding:", self->_receiveName, 64, 1);
  if (![(DYSharedMemoryTransport *)self _openSMRegion:&self->_incomingShmem size:0x4000 name:self->_receiveName error:a3]|| ![(DYSharedMemoryTransport *)self _openSMRegion:&self->_outgoingShmem size:0x40000 name:self->_sendName error:a3])
  {
    return 0;
  }
  [(DYSharedMemoryTransport *)self _setupIOBuffers];
  BOOL result = [(DYSharedMemoryTransport *)self _createAndRunSources:a3];
  self->_masterSMRegion = self->_outgoingShmem;
  return result;
}

- (id)connect
{
  id v3 = +[DYFuture future];
  queue = self->super.super._queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__DYSharedMemoryTransport_connect__block_invoke;
  v6[3] = &unk_265335F20;
  v6[4] = self;
  v6[5] = v3;
  dispatch_async(queue, v6);
  return v3;
}

uint64_t __34__DYSharedMemoryTransport_connect__block_invoke(uint64_t a1)
{
  unsigned int v2 = *(unsigned char **)(a1 + 32);
  if (!v2[52])
  {
    int v8 = [v2 connected];
    uint64_t v9 = *(void *)(a1 + 32);
    if (v8 && !*(unsigned char *)(v9 + 304))
    {
      id v3 = NSNumber;
      uint64_t v4 = 1;
      goto LABEL_3;
    }
    uint64_t v14 = 0;
    if (*(_DWORD *)(v9 + 300) == 2)
    {
      if (([(id)v9 _serverConnect:&v14] & 1) == 0)
      {
        uint64_t v10 = *(unsigned char **)(a1 + 32);
LABEL_15:
        [v10 _tearDownSharedMemory];
        uint64_t v12 = 0;
        goto LABEL_16;
      }
    }
    else if (([(id)v9 _clientConnect:&v14] & 1) == 0)
    {
      uint64_t v10 = *(unsigned char **)(a1 + 32);
      if (!v10[304]) {
        goto LABEL_15;
      }
      uint64_t v14 = 0;
      global_queue = dispatch_get_global_queue(0, 0);
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __34__DYSharedMemoryTransport_connect__block_invoke_2;
      v13[3] = &unk_265335F98;
      v13[4] = v10;
      dispatch_async(global_queue, v13);
      uint64_t v10 = *(unsigned char **)(a1 + 32);
      if (!v10[304]) {
        goto LABEL_15;
      }
    }
    uint64_t v12 = 1;
LABEL_16:
    [*(id *)(a1 + 40) setError:v14];
    return objc_msgSend(*(id *)(a1 + 40), "setResult:", objc_msgSend(NSNumber, "numberWithBool:", v12));
  }
  objc_msgSend(*(id *)(a1 + 40), "setError:", +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", @"DYErrorDomain", 32, 0));
  id v3 = NSNumber;
  uint64_t v4 = 0;
LABEL_3:
  uint64_t v5 = [v3 numberWithBool:v4];
  v6 = *(void **)(a1 + 40);

  return [v6 setResult:v5];
}

unint64_t __34__DYSharedMemoryTransport_connect__block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _clientConnect:0] & 1) == 0)
  {
    do
      usleep(0x3D090u);
    while (![*(id *)(a1 + 32) _clientConnect:0]);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 304) = 0;
  unint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) count];
  if (result)
  {
    uint64_t v3 = 0;
    unsigned int v4 = 1;
    do
    {
      uint64_t v5 = (void *)[*(id *)(*(void *)(a1 + 32) + 312) objectAtIndex:v3];
      v6 = *(void **)(a1 + 32);
      uint64_t v7 = [v5 message];
      uint64_t v8 = [v5 replyTo];
      uint64_t v9 = [v5 queue];
      uint64_t v10 = [v5 timeout];
      uint64_t v11 = [v5 replyBlock];
      v13.receiver = v6;
      v13.super_class = (Class)DYSharedMemoryTransport;
      objc_msgSendSuper2(&v13, sel_send_inReplyTo_error_replyQueue_timeout_handler_, v7, v8, 0, v9, v10, v11);
      uint64_t v3 = v4;
      unint64_t result = [*(id *)(*(void *)(a1 + 32) + 312) count];
    }
    while (result > v4++);
  }
  return result;
}

- (BOOL)connected
{
  return self->_masterSMRegion != 0;
}

- (void)_invalidate
{
  atomic_store(0xFFFFFFFF, &self->_outgoingShmem->var4);
  [(DYSharedMemoryTransport *)self _tearDownSharedMemory];
  v3.receiver = self;
  v3.super_class = (Class)DYSharedMemoryTransport;
  [(DYBaseStreamTransport *)&v3 _invalidate];
}

- (unint64_t)_computeBytesAvailableToWrite
{
  unsigned int v2 = atomic_load(&self->_outgoingShmem->var5);
  unsigned int v3 = atomic_load(&self->_outgoingShmem->var4);
  outgoingShmem = self->_outgoingShmem;
  if (v2 >= v3)
  {
    unsigned int v8 = atomic_load(&outgoingShmem->var4);
    uint64_t v9 = self->_outgoingShmem;
    if (v2 == v8)
    {
      unsigned int v10 = atomic_load(&v9->var2);
      unsigned int v11 = atomic_load(&self->_outgoingShmem->var1);
      if (v10 == v11) {
        return self->_outgoingShmem->var7;
      }
      else {
        return 0;
      }
    }
    else
    {
      unsigned int v12 = atomic_load(&v9->var4);
      return v2 - v12;
    }
  }
  else
  {
    unsigned int var7 = outgoingShmem->var7;
    unsigned int v6 = atomic_load(&outgoingShmem->var4);
    return var7 + v2 - v6;
  }
}

- (unint64_t)_computeBytesAvailableToRead
{
  unsigned int v2 = atomic_load(&self->_incomingShmem->var4);
  unsigned int v3 = atomic_load(&self->_incomingShmem->var5);
  unsigned int v4 = atomic_load(&self->_incomingShmem->var5);
  if (v3 >= v2)
  {
    incomingShmem = self->_incomingShmem;
    if (v2 == v4)
    {
      unsigned int v7 = atomic_load(&incomingShmem->var2);
      unsigned int v8 = atomic_load(&self->_incomingShmem->var1);
      if (v7 == v8) {
        return 0;
      }
      else {
        return self->_incomingShmem->var7;
      }
    }
    else
    {
      unsigned int var7 = incomingShmem->var7;
      unsigned int v10 = atomic_load(&incomingShmem->var5);
      return var7 + v2 - v10;
    }
  }
  else
  {
    return v2 - v4;
  }
}

- (void)_copyToSM:(const void *)a3 size:(int64_t)a4
{
  uint64_t v6 = atomic_load(&self->_outgoingShmem->var4);
  memcpy((char *)self->_outgoingBuffer + v6, a3, a4);
  outgoingShmem = self->_outgoingShmem;
  unint64_t var7 = outgoingShmem->var7;
  if (v6 + a4 < var7) {
    LODWORD(var7) = 0;
  }
  atomic_store(v6 + a4 - var7, &outgoingShmem->var4);
}

- (void)_waitEAGAIN
{
  unsigned int v3 = 0;
  do
  {
    usleep(0xC8u);
    if ([(DYSharedMemoryTransport *)self _computeBytesAvailableToRead] > 4) {
      break;
    }
  }
  while (v3++ < 4);
}

- (int64_t)_write:(const void *)a3 size:(unint64_t)a4
{
  unint64_t v4 = a4;
  if (a4)
  {
    unsigned int v7 = atomic_load((unsigned int *)&self->super.super._invalid);
    atomic_store(v7, &self->_outgoingShmem->var0);
    unint64_t v8 = [(DYSharedMemoryTransport *)self _computeBytesAvailableToWrite];
    if (v8 > 4)
    {
      if (v8 - 4 < v4) {
        unint64_t v4 = v8 - 4;
      }
      int v10 = v4 + 4;
      [(DYSharedMemoryTransport *)self _copyToSM:&v10 size:4];
      [(DYSharedMemoryTransport *)self _copyToSM:a3 size:v4];
      atomic_fetch_add((atomic_uint *volatile)&self->_outgoingShmem->var1, 1u);
    }
    else
    {
      *__error() = 35;
      return -1;
    }
  }
  return v4;
}

- (unsigned)_nextMessageSerial
{
  return atomic_fetch_add((atomic_uint *volatile)&self->_masterSMRegion->var3, 1u) + 1;
}

- (void)_updateReaderOffset:(unint64_t)a3
{
  incomingShmem = self->_incomingShmem;
  unint64_t var7 = incomingShmem->var7;
  if (var7 > a3) {
    LODWORD(var7) = 0;
  }
  atomic_store(a3 - var7, &incomingShmem->var5);
}

- (void)_copyFromSM:(void *)a3 size:(unint64_t)a4
{
  uint64_t v6 = atomic_load(&self->_incomingShmem->var5);
  memcpy(a3, (char *)self->_incomingBuffer + v6, a4);

  [(DYSharedMemoryTransport *)self _updateReaderOffset:v6 + a4];
}

- (int64_t)_read:(void *)a3 size:(unint64_t)a4
{
  if (!a4) {
    return 0;
  }
  unint64_t currentPacketBytesLeft = self->_currentPacketBytesLeft;
  if (currentPacketBytesLeft)
  {
    if (currentPacketBytesLeft >= a4) {
      int64_t v6 = a4;
    }
    else {
      int64_t v6 = self->_currentPacketBytesLeft;
    }
    [(DYSharedMemoryTransport *)self _copyFromSM:a3 size:v6];
    self->_currentPacketBytesLeft -= v6;
  }
  else
  {
    *__error() = 35;
    return -1;
  }
  return v6;
}

- (void)_accumulateMessageBytes
{
  while (self->_currentPacketBytesLeft && [(DYBaseStreamTransport *)self _readAndAccumulate] > 0)
    ;
}

- (void)_relayPacket
{
  if (-[DYSharedMemoryTransport _relayPacket]::once_token != -1) {
    dispatch_once(&-[DYSharedMemoryTransport _relayPacket]::once_token, &__block_literal_global_1);
  }
  pthread_mutex_lock(&-[DYSharedMemoryTransport _relayPacket]::relayPacketMutex);
  incomingBuffer = (char *)self->_incomingBuffer;
  uint64_t v4 = atomic_load(&self->_incomingShmem->var5);
  [(DYBaseStreamTransport *)self->_relayTransport _relayBuffer:&incomingBuffer[v4] size:self->_currentPacketBytesLeft];
  unsigned int v5 = atomic_load(&self->_incomingShmem->var5);
  [(DYSharedMemoryTransport *)self _updateReaderOffset:self->_currentPacketBytesLeft + v5];
  self->_unint64_t currentPacketBytesLeft = 0;

  pthread_mutex_unlock(&-[DYSharedMemoryTransport _relayPacket]::relayPacketMutex);
}

uint64_t __39__DYSharedMemoryTransport__relayPacket__block_invoke()
{
  return pthread_mutex_init(&-[DYSharedMemoryTransport _relayPacket]::relayPacketMutex, 0);
}

- (void)_dequeuePacket
{
  unint64_t v3 = [(DYSharedMemoryTransport *)self _computeBytesAvailableToRead];
  if (v3 <= 3)
  {
    int64_t v6 = (void *)MEMORY[0x253361500]();
    _DYOLog((uint64_t)self, 3, @"not enough bytes available for packet header", v7, v8, v9, v10, v11, v18);
    [(DYBaseStreamTransport *)self _scheduleInvalidation:+[DYError errorWithDomain:@"DYErrorDomain" code:259 userInfo:0]];
  }
  else
  {
    unint64_t v4 = v3;
    unsigned int v19 = 0;
    uint64_t v5 = [(DYSharedMemoryTransport *)self _copyFromSM:&v19 size:4];
    if (v4 < v19)
    {
      unsigned int v12 = (void *)MEMORY[0x253361500](v5);
      _DYOLog((uint64_t)self, 3, @"not enough bytes available for packet payload (%u < %u)", v13, v14, v15, v16, v17, v4);
      [(DYBaseStreamTransport *)self _scheduleInvalidation:+[DYError errorWithDomain:@"DYErrorDomain" code:259 userInfo:0]];
    }
    else
    {
      self->_unint64_t currentPacketBytesLeft = v19 - 4;
    }
  }
}

- (void)_dequeueIncomingMessages
{
  unsigned int v2 = self;
  unsigned int v3 = 0;
  int v4 = 3;
  while (1)
  {
    unsigned int v5 = atomic_load(&v2->_incomingShmem->var2);
    unsigned int v6 = atomic_load(&v2->_incomingShmem->var1);
    if (v5 != v6) {
      break;
    }
LABEL_13:
    unsigned int v12 = atomic_load(&v2->_incomingShmem->var0);
    BOOL v14 = v4-- != 0;
    if (v12) {
      BOOL v15 = !v14;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15) {
      goto LABEL_21;
    }
    self = (DYSharedMemoryTransport *)usleep(0xAu);
  }
  while (1)
  {
    unsigned int v7 = atomic_load((unsigned int *)&v2->super.super._invalid);
    if (v7 && v3 > 9) {
      break;
    }
    [(DYSharedMemoryTransport *)v2 _dequeuePacket];
    if (!v2->_currentPacketBytesLeft) {
      return;
    }
    if (v2->_consumeBytesSEL) {
      SEL consumeBytesSEL = v2->_consumeBytesSEL;
    }
    else {
      SEL consumeBytesSEL = 0;
    }
    self = (DYSharedMemoryTransport *)((uint64_t (*)(DYSharedMemoryTransport *, SEL))v2->_consumeBytesIMP)(v2, consumeBytesSEL);
    if (v2->_currentPacketBytesLeft)
    {
      uint64_t v18 = (void *)MEMORY[0x253361500](self);
      _DYOLog((uint64_t)v2, 3, @"did not consume all available bytes", v19, v20, v21, v22, v23, v24);
      uint64_t v17 = 3;
      goto LABEL_24;
    }
    atomic_fetch_add((atomic_uint *volatile)&v2->_incomingShmem->var2, 1u);
    ++v3;
    unsigned int v10 = atomic_load(&v2->_incomingShmem->var2);
    unsigned int v11 = atomic_load(&v2->_incomingShmem->var1);
    if (v10 == v11) {
      goto LABEL_13;
    }
  }
LABEL_21:
  unsigned int v16 = atomic_load(&v2->_incomingShmem->var4);
  if (v16 == -1)
  {
    uint64_t v17 = 31;
    uint64_t v18 = (void *)MEMORY[0x253361500](self, a2);
LABEL_24:
    [(DYBaseStreamTransport *)v2 _scheduleInvalidation:+[DYError errorWithDomain:@"DYErrorDomain" code:v17 userInfo:0]];
  }
}

- (BOOL)deferred
{
  return self->_deferred;
}

@end