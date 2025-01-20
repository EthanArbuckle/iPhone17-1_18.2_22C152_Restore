@interface DYBaseSocketTransport
- (BOOL)connected;
- (BOOL)relayMessageOverSecondarySharedMemoryTransport:(id)a3 error:(id *)a4;
- (BOOL)relayMessageOverSharedMemoryTransport:(id)a3 error:(id *)a4;
- (DYBaseSocketTransport)init;
- (DYBaseSocketTransportSharedMemoryURLs)createNewSharedMemoryTransportWithURLs:(DYBaseSocketTransportSharedMemoryURLs)a3 uniqueIdentifier:(id)a4 loadCapture:(BOOL)a5 loadDiagnostics:(BOOL)a6;
- (DYBaseSocketTransportSharedMemoryURLs)createNewSharedMemoryTransportWithUniqueIdentifier:(id)a3 loadCapture:(BOOL)a4 loadDiagnostics:(BOOL)a5;
- (DYSharedMemoryTransport)smTransportCapture;
- (DYSharedMemoryTransport)smTransportDiagnostics;
- (int64_t)_read:(void *)a3 size:(unint64_t)a4;
- (int64_t)_write:(const void *)a3 size:(unint64_t)a4;
- (unsigned)_nextMessageSerial;
- (void)_destroySharedMemoryTransport;
- (void)_invalidate;
- (void)_readAndAccumulateLoop;
- (void)_waitEAGAIN;
- (void)closeSocketDescriptor;
- (void)destroySharedMemoryTransport;
- (void)runWithSocket:(int)a3;
- (void)scheduleReadOnWritableSocket;
- (void)setPrioritizeOutgoingMessages:(BOOL)a3;
@end

@implementation DYBaseSocketTransport

- (DYBaseSocketTransport)init
{
  v3.receiver = self;
  v3.super_class = (Class)DYBaseSocketTransport;
  return [(DYBaseStreamTransport *)&v3 init];
}

- (int64_t)_read:(void *)a3 size:(unint64_t)a4
{
  int handle = dispatch_source_get_handle((dispatch_source_t)self->_readSource);

  return recv(handle, a3, a4, 0);
}

- (void)_waitEAGAIN
{
  pollfd v2 = (pollfd)0x400000000;
  v2.fd = dispatch_source_get_handle((dispatch_source_t)self->_readSource);
  poll(&v2, 1u, 1);
}

- (int64_t)_write:(const void *)a3 size:(unint64_t)a4
{
  int handle = dispatch_source_get_handle((dispatch_source_t)self->_readSource);

  return send(handle, a3, a4, 0);
}

- (void)closeSocketDescriptor
{
  int handle = dispatch_source_get_handle((dispatch_source_t)self->_readSource);

  close(handle);
}

- (void)_readAndAccumulateLoop
{
  self->_scheduledReadOnWritableSocket = 0;
  objc_super v3 = (void *)MEMORY[0x253361500]();
  while ([(DYBaseStreamTransport *)self _readAndAccumulate] > 0)
    ;
}

- (void)runWithSocket:(int)a3
{
  if (self->_readSource)
  {
    v14 = "_readSource == nullptr";
    goto LABEL_17;
  }
  if (self->_writeSource)
  {
    v14 = "_writeSource == nullptr";
    goto LABEL_17;
  }
  if (LOBYTE(self->super.super._interposerVersion))
  {
    v14 = "_invalid == NO";
    goto LABEL_17;
  }
  int v5 = fcntl(a3, 3);
  fcntl(a3, 4, v5 | 4u);
  self->_readSource = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83E8], a3, 0, (dispatch_queue_t)self->super.super._queue);
  v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8418], a3, 0, (dispatch_queue_t)self->super.super._queue);
  self->_writeSource = v6;
  readSource = self->_readSource;
  if (!readSource)
  {
    v14 = "_readSource";
    goto LABEL_17;
  }
  if (!v6)
  {
    v14 = "_writeSource";
LABEL_17:
    __assert_rtn("-[DYBaseSocketTransport runWithSocket:]", "", 0, v14);
  }
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __39__DYBaseSocketTransport_runWithSocket___block_invoke;
  handler[3] = &unk_265335F98;
  handler[4] = self;
  dispatch_source_set_cancel_handler(readSource, handler);
  writeSource = self->_writeSource;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __39__DYBaseSocketTransport_runWithSocket___block_invoke_2;
  v17[3] = &unk_265335F98;
  v17[4] = self;
  dispatch_source_set_cancel_handler(writeSource, v17);
  v9 = self->_readSource;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __39__DYBaseSocketTransport_runWithSocket___block_invoke_3;
  v16[3] = &unk_265335F98;
  v16[4] = self;
  dispatch_source_set_event_handler(v9, v16);
  v10 = self->_writeSource;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __39__DYBaseSocketTransport_runWithSocket___block_invoke_4;
  v15[3] = &unk_265335F98;
  v15[4] = self;
  dispatch_source_set_event_handler(v10, v15);
  dispatch_resume((dispatch_object_t)self->_readSource);
  self->_scheduledReadOnWritableSocket = 0;
  self->_writeSourceIsSuspended = 1;
  smTransportCapture = self->_smTransportCapture;
  if (smTransportCapture
    && (id v12 = [(DYSharedMemoryTransport *)smTransportCapture connect],
        ![v12 BOOLResult])
    || (smTransportDiagnostics = self->_smTransportDiagnostics) != 0
    && (id v12 = [(DYSharedMemoryTransport *)smTransportDiagnostics connect],
        ([v12 BOOLResult] & 1) == 0))
  {
    -[DYBaseStreamTransport _scheduleInvalidation:](self, "_scheduleInvalidation:", [v12 error]);
  }
}

void __39__DYBaseSocketTransport_runWithSocket___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 232) = 0;
}

void __39__DYBaseSocketTransport_runWithSocket___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 240) = 0;
}

uint64_t __39__DYBaseSocketTransport_runWithSocket___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _readAndAccumulateLoop];
}

unsigned char *__39__DYBaseSocketTransport_runWithSocket___block_invoke_4(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 240));
  *(unsigned char *)(*(void *)(a1 + 32) + 264) = 1;
  result = *(unsigned char **)(a1 + 32);
  if (result[265])
  {
    return (unsigned char *)[result _readAndAccumulateLoop];
  }
  return result;
}

- (void)scheduleReadOnWritableSocket
{
  if (!LOBYTE(self->super.super._interposerVersion) && !self->_scheduledReadOnWritableSocket)
  {
    self->_scheduledReadOnWritableSocket = 1;
    if (self->_writeSourceIsSuspended)
    {
      dispatch_resume((dispatch_object_t)self->_writeSource);
      self->_writeSourceIsSuspended = 0;
    }
  }
}

- (BOOL)connected
{
  readSource = self->_readSource;
  if (readSource) {
    LOBYTE(readSource) = dispatch_source_testcancel(readSource) == 0;
  }
  return (char)readSource;
}

- (void)setPrioritizeOutgoingMessages:(BOOL)a3
{
  BOOL v3 = a3;
  queue = self->super.super._queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__DYBaseSocketTransport_setPrioritizeOutgoingMessages___block_invoke;
  block[3] = &unk_2653364C0;
  block[4] = self;
  BOOL v8 = a3;
  dispatch_sync(queue, block);
  v6.receiver = self;
  v6.super_class = (Class)DYBaseSocketTransport;
  [(DYTransport *)&v6 setPrioritizeOutgoingMessages:v3];
}

uint64_t __55__DYBaseSocketTransport_setPrioritizeOutgoingMessages___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 248) setPrioritizeOutgoingMessages:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 256);

  return [v3 setPrioritizeOutgoingMessages:v2];
}

- (void)_invalidate
{
  writeSource = self->_writeSource;
  if (writeSource)
  {
    if (!self->_readSource) {
      __assert_rtn("-[DYBaseSocketTransport _invalidate]", ", 0, "_readSource"");
    }
    dispatch_source_cancel(writeSource);
    if (self->_writeSourceIsSuspended) {
      dispatch_resume((dispatch_object_t)self->_writeSource);
    }
  }
  [(DYBaseSocketTransport *)self _destroySharedMemoryTransport];
  v4.receiver = self;
  v4.super_class = (Class)DYBaseSocketTransport;
  [(DYBaseStreamTransport *)&v4 _invalidate];
}

- (DYBaseSocketTransportSharedMemoryURLs)createNewSharedMemoryTransportWithUniqueIdentifier:(id)a3 loadCapture:(BOOL)a4 loadDiagnostics:(BOOL)a5
{
  int v5 = (void *)-[DYBaseSocketTransport createNewSharedMemoryTransportWithURLs:uniqueIdentifier:loadCapture:loadDiagnostics:](self, "createNewSharedMemoryTransportWithURLs:uniqueIdentifier:loadCapture:loadDiagnostics:", 0, 0, a3, a4, a5);
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (DYBaseSocketTransportSharedMemoryURLs)createNewSharedMemoryTransportWithURLs:(DYBaseSocketTransportSharedMemoryURLs)a3 uniqueIdentifier:(id)a4 loadCapture:(BOOL)a5 loadDiagnostics:(BOOL)a6
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  uint64_t v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  uint64_t v20 = 0;
  queue = self->super.super._queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __109__DYBaseSocketTransport_createNewSharedMemoryTransportWithURLs_uniqueIdentifier_loadCapture_loadDiagnostics___block_invoke;
  block[3] = &unk_2653364E8;
  BOOL v13 = a5;
  block[4] = self;
  void block[5] = a4;
  BOOL v14 = a6;
  DYBaseSocketTransportSharedMemoryURLs v12 = a3;
  block[6] = &v21;
  block[7] = &v15;
  dispatch_sync(queue, block);
  id v7 = (id)v22[5];
  id v8 = (id)v16[5];
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  v9 = v7;
  v10 = v8;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

unsigned char *__109__DYBaseSocketTransport_createNewSharedMemoryTransportWithURLs_uniqueIdentifier_loadCapture_loadDiagnostics___block_invoke(uint64_t a1)
{
  DYBaseSocketTransportSharedMemoryURLs result = *(unsigned char **)(a1 + 32);
  if (!result[52])
  {
    [result _destroySharedMemoryTransport];
    if (*(unsigned char *)(a1 + 80))
    {
      BOOL v3 = [DYSharedMemoryTransport alloc];
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 40));
      *(void *)(*(void *)(a1 + 32) + 248) = [(DYSharedMemoryTransport *)v3 initWithMode:2 initialMessageSerial:v5 uniqueIdentifier:v4];
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "setRelayTransport:");
      [*(id *)(*(void *)(a1 + 32) + 248) setPrioritizeOutgoingMessages:*(unsigned __int8 *)(*(void *)(a1 + 32) + 53)];
    }
    if (*(unsigned char *)(a1 + 81))
    {
      objc_super v6 = [DYSharedMemoryTransport alloc];
      uint64_t v7 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 40));
      *(void *)(*(void *)(a1 + 32) + 256) = [(DYSharedMemoryTransport *)v6 initWithMode:2 initialMessageSerial:v7 uniqueIdentifier:0];
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 256), "setRelayTransport:");
      [*(id *)(*(void *)(a1 + 32) + 256) setPrioritizeOutgoingMessages:*(unsigned __int8 *)(*(void *)(a1 + 32) + 53)];
    }
    if (*(void *)(a1 + 64)) {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "setUrl:");
    }
    if (*(void *)(a1 + 72)) {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 256), "setUrl:");
    }
    if ([*(id *)(a1 + 32) connected])
    {
      if (*(unsigned char *)(a1 + 80)) {
        objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 248), "connect"), "waitUntilResolved");
      }
      if (*(unsigned char *)(a1 + 81)) {
        objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 256), "connect"), "waitUntilResolved");
      }
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = (id)[*(id *)(*(void *)(a1 + 32) + 248) url];
    DYBaseSocketTransportSharedMemoryURLs result = (id)[*(id *)(*(void *)(a1 + 32) + 256) url];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
  }
  return result;
}

- (void)_destroySharedMemoryTransport
{
  smTransportCapture = self->_smTransportCapture;
  if (smTransportCapture)
  {
    [(DYTransport *)smTransportCapture invalidate];

    self->_smTransportCapture = 0;
  }
  smTransportDiagnostics = self->_smTransportDiagnostics;
  if (smTransportDiagnostics)
  {
    [(DYTransport *)smTransportDiagnostics invalidate];

    self->_smTransportDiagnostics = 0;
  }
}

- (void)destroySharedMemoryTransport
{
  queue = self->super.super._queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__DYBaseSocketTransport_destroySharedMemoryTransport__block_invoke;
  block[3] = &unk_265335F98;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __53__DYBaseSocketTransport_destroySharedMemoryTransport__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _destroySharedMemoryTransport];
}

- (BOOL)relayMessageOverSharedMemoryTransport:(id)a3 error:(id *)a4
{
  return [(DYTransport *)self->_smTransportCapture relayMessage:a3 error:a4];
}

- (BOOL)relayMessageOverSecondarySharedMemoryTransport:(id)a3 error:(id *)a4
{
  return [(DYTransport *)self->_smTransportDiagnostics relayMessage:a3 error:a4];
}

- (unsigned)_nextMessageSerial
{
  smTransportCapture = self->_smTransportCapture;
  if (smTransportCapture || (smTransportCapture = self->_smTransportDiagnostics) != 0)
  {
    unsigned int result = [(DYSharedMemoryTransport *)smTransportCapture _nextMessageSerial];
    unsigned int v5 = atomic_exchange((atomic_uint *volatile)&self->super.super._messageCounter, result);
    if (v5 > result)
    {
      do
      {
        unsigned int v6 = atomic_exchange((atomic_uint *volatile)&self->super.super._messageCounter, v5);
        BOOL v7 = v6 > v5;
        unsigned int v5 = v6;
      }
      while (v7);
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)DYBaseSocketTransport;
    return [(DYTransport *)&v8 _nextMessageSerial];
  }
  return result;
}

- (DYSharedMemoryTransport)smTransportCapture
{
  return self->_smTransportCapture;
}

- (DYSharedMemoryTransport)smTransportDiagnostics
{
  return self->_smTransportDiagnostics;
}

@end