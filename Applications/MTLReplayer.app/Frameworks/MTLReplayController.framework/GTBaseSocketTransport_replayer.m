@interface GTBaseSocketTransport_replayer
- (BOOL)connected;
- (BOOL)relayMessageOverSharedMemoryTransport:(id)a3 error:(id *)a4;
- (GTBaseSocketTransport_replayer)init;
- (GTSharedMemoryTransport_replayer)smTransport;
- (id)createNewSharedMemoryTransport;
- (id)createNewSharedMemoryTransportWithURL:(id)a3;
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

@implementation GTBaseSocketTransport_replayer

- (GTSharedMemoryTransport_replayer)smTransport
{
  return self->_smTransport;
}

- (unsigned)_nextMessageSerial
{
  smTransport = self->_smTransport;
  if (smTransport)
  {
    unsigned int result = [(GTSharedMemoryTransport_replayer *)smTransport _nextMessageSerial];
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
    v8.super_class = (Class)GTBaseSocketTransport_replayer;
    return [(GTTransport_replayer *)&v8 _nextMessageSerial];
  }
  return result;
}

- (BOOL)relayMessageOverSharedMemoryTransport:(id)a3 error:(id *)a4
{
  return [(GTTransport_replayer *)self->_smTransport relayMessage:a3 error:a4];
}

- (void)destroySharedMemoryTransport
{
  queue = self->super.super._queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __53__GTBaseSocketTransport_destroySharedMemoryTransport__block_invoke;
  block[3] = &unk_746170;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_destroySharedMemoryTransport
{
  self->_smTransport = 0;
}

- (id)createNewSharedMemoryTransportWithURL:(id)a3
{
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__1487;
  v11 = __Block_byref_object_dispose__1488;
  uint64_t v12 = 0;
  queue = self->super.super._queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __63__GTBaseSocketTransport_createNewSharedMemoryTransportWithURL___block_invoke;
  block[3] = &unk_7467E8;
  block[4] = self;
  void block[5] = a3;
  block[6] = &v7;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)createNewSharedMemoryTransport
{
  return [(GTBaseSocketTransport_replayer *)self createNewSharedMemoryTransportWithURL:0];
}

- (void)_invalidate
{
  writeSource = self->_writeSource;
  if (writeSource)
  {
    if (!self->_readSource) {
      __assert_rtn("-[GTBaseSocketTransport _invalidate]", ", 0, "_readSource"");
    }
    dispatch_source_cancel(writeSource);
    if (self->_writeSourceIsSuspended) {
      dispatch_resume((dispatch_object_t)self->_writeSource);
    }
  }
  [(GTBaseSocketTransport_replayer *)self _destroySharedMemoryTransport];
  v4.receiver = self;
  v4.super_class = (Class)GTBaseSocketTransport_replayer;
  [(GTBaseStreamTransport_replayer *)&v4 _invalidate];
}

- (void)setPrioritizeOutgoingMessages:(BOOL)a3
{
  BOOL v3 = a3;
  queue = self->super.super._queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __55__GTBaseSocketTransport_setPrioritizeOutgoingMessages___block_invoke;
  block[3] = &unk_745250;
  block[4] = self;
  BOOL v8 = a3;
  dispatch_sync(queue, block);
  v6.receiver = self;
  v6.super_class = (Class)GTBaseSocketTransport_replayer;
  [(GTTransport_replayer *)&v6 setPrioritizeOutgoingMessages:v3];
}

- (BOOL)connected
{
  readSource = self->_readSource;
  if (readSource) {
    LOBYTE(readSource) = dispatch_source_testcancel(readSource) == 0;
  }
  return (char)readSource;
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

- (void)runWithSocket:(int)a3
{
  if (self->_readSource)
  {
    v13 = "_readSource == nullptr";
    goto LABEL_15;
  }
  if (self->_writeSource)
  {
    v13 = "_writeSource == nullptr";
    goto LABEL_15;
  }
  if (LOBYTE(self->super.super._interposerVersion))
  {
    v13 = "_invalid == NO";
    goto LABEL_15;
  }
  int v5 = fcntl(a3, 3);
  fcntl(a3, 4, v5 | 4u);
  self->_readSource = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, a3, 0, (dispatch_queue_t)self->super.super._queue);
  objc_super v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_write, a3, 0, (dispatch_queue_t)self->super.super._queue);
  self->_writeSource = v6;
  readSource = self->_readSource;
  if (!readSource)
  {
    v13 = "_readSource";
    goto LABEL_15;
  }
  if (!v6)
  {
    v13 = "_writeSource";
LABEL_15:
    __assert_rtn("-[GTBaseSocketTransport runWithSocket:]", "", 0, v13);
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __39__GTBaseSocketTransport_runWithSocket___block_invoke;
  handler[3] = &unk_746170;
  handler[4] = self;
  dispatch_source_set_cancel_handler(readSource, handler);
  writeSource = self->_writeSource;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __39__GTBaseSocketTransport_runWithSocket___block_invoke_2;
  v16[3] = &unk_746170;
  v16[4] = self;
  dispatch_source_set_cancel_handler(writeSource, v16);
  uint64_t v9 = self->_readSource;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __39__GTBaseSocketTransport_runWithSocket___block_invoke_3;
  v15[3] = &unk_746170;
  v15[4] = self;
  dispatch_source_set_event_handler(v9, v15);
  v10 = self->_writeSource;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __39__GTBaseSocketTransport_runWithSocket___block_invoke_4;
  v14[3] = &unk_746170;
  v14[4] = self;
  dispatch_source_set_event_handler(v10, v14);
  dispatch_resume((dispatch_object_t)self->_readSource);
  self->_scheduledReadOnWritableSocket = 0;
  self->_writeSourceIsSuspended = 1;
  smTransport = self->_smTransport;
  if (smTransport)
  {
    id v12 = [(GTSharedMemoryTransport_replayer *)smTransport connect];
    if (([v12 BOOLResult] & 1) == 0) {
      -[GTBaseStreamTransport_replayer _scheduleInvalidation:](self, "_scheduleInvalidation:", [v12 error]);
    }
  }
}

- (void)_readAndAccumulateLoop
{
  self->_scheduledReadOnWritableSocket = 0;
  while ([(GTBaseStreamTransport_replayer *)self _readAndAccumulate] > 0)
    ;
}

- (void)closeSocketDescriptor
{
  int handle = dispatch_source_get_handle((dispatch_source_t)self->_readSource);

  close(handle);
}

- (int64_t)_write:(const void *)a3 size:(unint64_t)a4
{
  int handle = dispatch_source_get_handle((dispatch_source_t)self->_readSource);

  return send(handle, a3, a4, 0);
}

- (void)_waitEAGAIN
{
  pollfd v2 = (pollfd)0x400000000;
  v2.fd = dispatch_source_get_handle((dispatch_source_t)self->_readSource);
  poll(&v2, 1u, 1);
}

- (int64_t)_read:(void *)a3 size:(unint64_t)a4
{
  int handle = dispatch_source_get_handle((dispatch_source_t)self->_readSource);

  return recv(handle, a3, a4, 0);
}

- (GTBaseSocketTransport_replayer)init
{
  v3.receiver = self;
  v3.super_class = (Class)GTBaseSocketTransport_replayer;
  return [(GTBaseStreamTransport_replayer *)&v3 init];
}

@end