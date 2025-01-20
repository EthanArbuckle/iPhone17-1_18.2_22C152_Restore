@interface GTBaseStreamTransport_tools_diagnostics
- (BOOL)_packMessage:(id)a3 error:(id *)a4;
- (GTBaseStreamTransport_tools_diagnostics)init;
- (int64_t)_performRead:(void *)a3 size:(unint64_t)a4;
- (int64_t)_read:(void *)a3 size:(unint64_t)a4;
- (int64_t)_readAndAccumulate;
- (int64_t)_relayBuffer:(const void *)a3 size:(unint64_t)a4;
- (int64_t)_relayBufferInner:(const void *)a3 size:(unint64_t)a4;
- (int64_t)_sendMessage:(id)a3 error:(id *)a4;
- (int64_t)_syncTmuToHeader:(dy_transport_message_unpack_s *)a3 ioBlock:(id)a4;
- (int64_t)_write:(const void *)a3 size:(unint64_t)a4;
- (int64_t)_writeBuffers:(id *)a3;
- (void)_allocateMessageBuffer;
- (void)_clearBuffers;
- (void)_invalidate;
- (void)_scheduleInvalidation:(id)a3;
- (void)_unpackAndDispatchMessage;
- (void)_waitEAGAIN;
- (void)dealloc;
@end

@implementation GTBaseStreamTransport_tools_diagnostics

- (int64_t)_relayBuffer:(const void *)a3 size:(unint64_t)a4
{
  char v7 = BYTE1(self->super._interposerVersion);
  if (v7) {
    dispatch_suspend((dispatch_object_t)self->super._queue);
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  relayQueue = self->_relayQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __43__GTBaseStreamTransport__relayBuffer_size___block_invoke;
  block[3] = &unk_24C18;
  block[4] = self;
  block[5] = &v13;
  block[6] = a3;
  block[7] = a4;
  char v12 = v7;
  dispatch_sync(relayQueue, block);
  int64_t v9 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v9;
}

- (int64_t)_relayBufferInner:(const void *)a3 size:(unint64_t)a4
{
  if (LOBYTE(self->super._interposerVersion)) {
    return -1;
  }
  unint64_t v4 = a4;
  if (self->_relayTmu->var5)
  {
    uint64_t v7 = 0;
    if (!a4) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  int64_t v14 = -[GTBaseStreamTransport_tools_diagnostics _syncTmuToHeader:ioBlock:](self, "_syncTmuToHeader:ioBlock:");
  if (v14 == -1) {
    return -1;
  }
  relayTmu = self->_relayTmu;
  if (!relayTmu->var5) {
    return 0;
  }
  int64_t v16 = v14;
  *(int8x16_t *)&relayTmu->var0.var0 = vrev32q_s8(*(int8x16_t *)&relayTmu->var0.var0);
  *(int8x8_t *)&relayTmu->var0.var4 = vrev32_s8(*(int8x8_t *)&relayTmu->var0.var4);
  p_sendSema = &self->_sendSema;
  int64_t v9 = -1;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sendSema, 0xFFFFFFFFFFFFFFFFLL);
  if (LOBYTE(self->super._interposerVersion)) {
    goto LABEL_9;
  }
  self->_buffers[0] = (NSData *)[objc_alloc((Class)NSData) initWithBytesNoCopy:self->_relayTmu length:24 freeWhenDone:0];
  v17 = self->_relayTmu;
  v17->var3 += 24;
  if (!v17->var5) {
    return 0;
  }
  v4 -= v16;
  a3 = (char *)a3 + v16;
  uint64_t v7 = 1;
  if (v4) {
LABEL_4:
  }
    self->_buffers[v7] = (NSData *)[objc_alloc((Class)NSData) initWithBytesNoCopy:a3 length:v4 freeWhenDone:0];
LABEL_5:
  int64_t v8 = [(GTBaseStreamTransport_tools_diagnostics *)self _writeBuffers:0];
  int64_t v9 = v8;
  if (v8 == -1)
  {
LABEL_8:
    p_sendSema = &self->_sendSema;
LABEL_9:
    dispatch_semaphore_signal((dispatch_semaphore_t)*p_sendSema);
    return v9;
  }
  v10 = self->_relayTmu;
  unint64_t v11 = v10->var3 - v8;
  unint64_t v12 = v10->var4 + v8;
  v10->var3 = v11;
  v10->var4 = v12;
  if (!v11)
  {
    *(_OWORD *)&v10->var3 = xmmword_1A720;
    v10->var5 = 0;
    goto LABEL_8;
  }
  return v9;
}

- (int64_t)_sendMessage:(id)a3 error:(id *)a4
{
  id v7 = [a3 payload];
  id v8 = [a3 encodedAttributes];
  unsigned int v9 = [a3 kind];
  unsigned int v10 = [a3 serial];
  unsigned int v11 = [a3 replySerial];
  if (v8)
  {
    unsigned int v12 = [v8 length] | 0x80000000;
    if (v7)
    {
LABEL_3:
      unsigned int v13 = [v7 length] | 0x80000000;
      goto LABEL_6;
    }
  }
  else
  {
    unsigned int v12 = 0;
    if (v7) {
      goto LABEL_3;
    }
  }
  unsigned int v13 = 0;
LABEL_6:
  v17[0] = 1296389188;
  v17[1] = bswap32(v9);
  v17[2] = bswap32(v10);
  v17[3] = bswap32(v11);
  v17[4] = bswap32(v12);
  v17[5] = bswap32(v13);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sendSema, 0xFFFFFFFFFFFFFFFFLL);
  if (LOBYTE(self->super._interposerVersion))
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_sendSema);
    [a3 setEncodedAttributes:0];
    return -1;
  }
  self->_buffers[0] = (NSData *)[objc_alloc((Class)NSData) initWithBytes:v17 length:24];
  if (!v8)
  {
    uint64_t v14 = 1;
    if (!v7) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  self->_buffers[1] = (NSData *)v8;
  [a3 setEncodedAttributes:0];
  uint64_t v14 = 2;
  if (v7) {
LABEL_9:
  }
    self->_buffers[v14] = (NSData *)v7;
LABEL_10:
  int64_t v15 = [(GTBaseStreamTransport_tools_diagnostics *)self _writeBuffers:a4];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sendSema);
  return v15;
}

- (BOOL)_packMessage:(id)a3 error:(id *)a4
{
  if ([a3 attributes])
  {
    id v14 = 0;
    id v7 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", [a3 attributes], 200, 0, &v14);
    id v8 = v7;
    id v9 = v14;
    if (!v7)
    {
      if (a4)
      {
        unsigned int v13 = +[NSDictionary dictionaryWithObject:v14 forKey:NSUnderlyingErrorKey];

        *a4 = +[GTError_tools_diagnostics errorWithDomain:@"DYErrorDomain" code:36 userInfo:v13];
      }
      return 0;
    }
    [a3 setEncodedAttributes:v7];
  }
  else
  {
    id v7 = 0;
  }
  unsigned int v10 = [(NSData *)v7 length];
  if (v10 + objc_msgSend(objc_msgSend(a3, "payload"), "length") + 24 < 0xF4240001uLL)
  {
    objc_msgSend(a3, "_setTransportSize:");
    return 1;
  }
  [a3 setEncodedAttributes:0];
  if (a4)
  {
    id v12 = +[GTError_tools_diagnostics errorWithDomain:@"DYErrorDomain" code:261 userInfo:0];
    BOOL result = 0;
    *a4 = v12;
    return result;
  }
  return 0;
}

- (int64_t)_writeBuffers:(id *)a3
{
  uint64_t v5 = 0;
  int64_t v6 = 0;
  int v7 = 0;
  buffers = self->_buffers;
  do
  {
    id v9 = buffers[v5];
    if (v9)
    {
      unsigned int v10 = &self->_iov[v7];
      v10->iov_base = (void *)[(NSData *)v9 bytes];
      NSUInteger v11 = [(NSData *)buffers[v5] length];
      v10->iov_len = v11;
      v6 += v11;
      ++v7;
    }
    ++v5;
  }
  while (v5 != 3);
  if (v6)
  {
    uint64_t v12 = 0;
    iov = self->_iov;
    int v14 = v7;
    while (1)
    {
      do
      {
        while (1)
        {
          unint64_t v15 = [(GTBaseStreamTransport_tools_diagnostics *)self _write:iov->iov_base size:iov->iov_len];
          int64_t v16 = __error();
          if (v15 == -1) {
            break;
          }
          v12 += v15;
          if (v12 == v6) {
            goto LABEL_25;
          }
          if (v14 < 1)
          {
            LODWORD(v18) = 0;
          }
          else
          {
            uint64_t v18 = 0;
            p_iov_len = &iov->iov_len;
            while (1)
            {
              size_t v20 = *p_iov_len;
              unint64_t v21 = v15 - *p_iov_len;
              if (v15 < *p_iov_len) {
                break;
              }
              ++v18;
              p_iov_len += 2;
              unint64_t v15 = v21;
              if (v14 == v18)
              {
                LODWORD(v18) = v14;
                goto LABEL_20;
              }
            }
            iov[v18].iov_base = (char *)iov[v18].iov_base + v15;
            size_t *p_iov_len = v20 - v15;
          }
LABEL_20:
          iov += v18;
          int v14 = v7 - ((unint64_t)((char *)iov - (char *)self->_iov) >> 4);
        }
        int v17 = *v16;
      }
      while (*v16 == 4);
      if (v17 != 35) {
        break;
      }
      if (LOBYTE(self->super._interposerVersion))
      {
        if (a3) {
          *a3 = [(GTTransport_tools_diagnostics *)self error];
        }
        goto LABEL_24;
      }
      [(GTBaseStreamTransport_tools_diagnostics *)self _waitEAGAIN];
    }
    v22 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v17 userInfo:0];
    [(GTBaseStreamTransport_tools_diagnostics *)self _scheduleInvalidation:v22];
    if (a3) {
      *a3 = v22;
    }
    *__error() = v17;
LABEL_24:
    int64_t v6 = -1;
  }
LABEL_25:
  [(GTBaseStreamTransport_tools_diagnostics *)self _clearBuffers];
  return v6;
}

- (void)_clearBuffers
{
  uint64_t v2 = 0;
  buffers = self->_buffers;
  do
  {

    buffers[v2++] = 0;
  }
  while (v2 != 3);
}

- (int64_t)_readAndAccumulate
{
  if (LOBYTE(self->super._interposerVersion)) {
    return -1;
  }
  tmu = self->_tmu;
  if (tmu->var5)
  {
    int64_t v4 = 0;
  }
  else
  {
    int64_t v4 = -[GTBaseStreamTransport_tools_diagnostics _syncTmuToHeader:ioBlock:](self, "_syncTmuToHeader:ioBlock:");
    if (v4 == -1) {
      return v4;
    }
    id v8 = self->_tmu;
    if (!v8->var5) {
      return v4;
    }
    if (!v8->var3)
    {
LABEL_16:
      [(GTBaseStreamTransport_tools_diagnostics *)self _unpackAndDispatchMessage];
      return v4;
    }
    [(GTBaseStreamTransport_tools_diagnostics *)self _allocateMessageBuffer];
    id v9 = [(GTVMBuffer *)self->_messageBuffer mutableBytes];
    uint64_t var1 = self->_tmu->var1;
    self->_messageBufferWritePtr = (void *)(((unint64_t)v9 + var1 - 1) & -var1);
    tmu = self->_tmu;
    if (!tmu->var5) {
      return v4;
    }
  }
  unint64_t var4 = tmu->var4;
  unint64_t v6 = tmu->var0.var4 & 0x7FFFFFFF;
  unint64_t var3 = v6 - var4;
  if (v6 <= var4)
  {
    if (v6 == var4)
    {
      self->_messageBufferWritePtr = (void *)(((uint64_t)self->_messageBufferWritePtr + tmu->var2 - 1) & -(uint64_t)tmu->var2);
      unint64_t var3 = self->_tmu->var3;
    }
    else
    {
      unint64_t var3 = tmu->var3;
    }
  }
  int64_t v11 = [(GTBaseStreamTransport_tools_diagnostics *)self _performRead:self->_messageBufferWritePtr size:var3];
  if (v11 == -1) {
    return -1;
  }
  v4 += v11;
  self->_messageBufferWritePtr = (char *)self->_messageBufferWritePtr + v11;
  if (!self->_tmu->var3) {
    goto LABEL_16;
  }
  return v4;
}

- (int64_t)_performRead:(void *)a3 size:(unint64_t)a4
{
  if (!self->_bytesToRead) {
    self->_bytesToRead = a4;
  }
  do
  {
    int64_t result = [(GTBaseStreamTransport_tools_diagnostics *)self _read:a3 size:self->_bytesToRead];
    if (result != -1)
    {
      if (result)
      {
        tmu = self->_tmu;
        int64_t v11 = tmu->var4 + result;
        tmu->var3 -= result;
        tmu->unint64_t var4 = v11;
        self->_bytesToRead = 0;
      }
      else
      {
        [(GTBaseStreamTransport_tools_diagnostics *)self _scheduleInvalidation:+[GTError_tools_diagnostics errorWithDomain:@"DYErrorDomain" code:31 userInfo:0]];
        return 0;
      }
      return result;
    }
    int v7 = *__error();
  }
  while (v7 == 4);
  if (v7 != 35)
  {
    [(GTBaseStreamTransport_tools_diagnostics *)self _scheduleInvalidation:+[GTError_tools_diagnostics errorWithDomain:@"DYErrorDomain" code:31 userInfo:0]];
  }
  *__error() = v7;
  return -1;
}

- (void)_allocateMessageBuffer
{
  tmu = self->_tmu;
  if (!tmu->var5)
  {
    int v7 = "_tmu->hasHeader";
    goto LABEL_11;
  }
  vm_size_t v3 = tmu->var3 + tmu->var1 - 1 + tmu->var2 - 1;
  if (v3 >= 0xF4240001)
  {
    int v7 = "size_aligned <= MAXIMUM_MESSAGE_SIZE";
    goto LABEL_11;
  }

  if (v3 >= 3 * vm_page_size) {
    uint64_t v5 = (Class *)&off_245C0;
  }
  else {
    uint64_t v5 = (Class *)NSMutableData_ptr;
  }
  unint64_t v6 = (GTVMBuffer *)[objc_alloc(*v5) initWithLength:v3];
  self->_messageBuffer = v6;
  if (!v6)
  {
    int v7 = "_messageBuffer != nil";
LABEL_11:
    __assert_rtn("-[GTBaseStreamTransport _allocateMessageBuffer]", "", 0, v7);
  }
}

- (void)_unpackAndDispatchMessage
{
  uint64_t v4 = self->_tmu->var0.var4 & 0x7FFFFFFF;
  id v5 = [(GTVMBuffer *)self->_messageBuffer mutableBytes];
  tmu = self->_tmu;
  uint64_t v7 = ((unint64_t)v5 + tmu->var1 - 1) & -(uint64_t)tmu->var1;
  if ((tmu->var0.var4 & 0x80000000) == 0)
  {
    id v8 = 0;
    uint64_t v9 = 24;
LABEL_5:
    unsigned int var5 = tmu->var0.var5;
    if ((var5 & 0x80000000) != 0)
    {
      int v13 = var5 & 0x7FFFFFFF;
      id v12 = objc_msgSend(-[GTVMBuffer subdataWithRange:](self->_messageBuffer, "subdataWithRange:", ((v7 + v4 + tmu->var2 - 1) & -(uint64_t)tmu->var2)- (void)-[GTVMBuffer mutableBytes](self->_messageBuffer, "mutableBytes"), var5 & 0x7FFFFFFF), "GTGPUToolsData");
      uint64_t v9 = (v13 + v9);
      tmu = self->_tmu;
    }
    else
    {
      id v12 = 0;
    }
    int v14 = [[GTTransportMessage_tools_diagnostics alloc] initWithKind:tmu->var0.var1 attributes:v8 payload:v12];
    [(GTTransportMessage_tools_diagnostics *)v14 _setSerial:self->_tmu->var0.var2 replySerial:self->_tmu->var0.var3 transport:self];
    [(GTTransportMessage_tools_diagnostics *)v14 _setTransportSize:v9];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v15 = (vm_address_t *)[(GTVMBuffer *)self->_messageBuffer vmBuffer];
      vm_protect(mach_task_self_, *v15, v15[2] * v15[1], 0, 1);
    }

    self->_messageBuffer = 0;
    [(GTTransport_tools_diagnostics *)self _dispatchMessage:v14];

    int64_t v16 = self->_tmu;
    *(_OWORD *)&v16->unint64_t var3 = xmmword_1A720;
    v16->unsigned int var5 = 0;
    return;
  }
  id v10 = +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", objc_msgSend(-[GTVMBuffer subdataWithRange:](self->_messageBuffer, "subdataWithRange:", v7 - (void)-[GTVMBuffer mutableBytes](self->_messageBuffer, "mutableBytes"), v4), "GTGPUToolsData"), 0, 0, 0);
  if (v10)
  {
    id v8 = v10;
    uint64_t v9 = (v4 + 24);
    tmu = self->_tmu;
    goto LABEL_5;
  }
  [(GTBaseStreamTransport_tools_diagnostics *)self _scheduleInvalidation:+[GTError_tools_diagnostics errorWithDomain:@"DYErrorDomain" code:260 userInfo:0]];
}

- (int64_t)_syncTmuToHeader:(dy_transport_message_unpack_s *)a3 ioBlock:(id)a4
{
  int64_t result = (*((uint64_t (**)(id, SEL))a4 + 2))(a4, a2);
  if (result != -1 && !a3->var3)
  {
    a3->unsigned int var5 = 1;
    long long v7 = *(_OWORD *)&a3->var0.var0;
    *(int8x16_t *)&a3->var0.var0 = vrev32q_s8(*(int8x16_t *)&a3->var0.var0);
    unsigned int v8 = bswap32(a3->var0.var4);
    unsigned int v9 = bswap32(a3->var0.var5);
    a3->var0.unint64_t var4 = v8;
    a3->var0.unsigned int var5 = v9;
    if (v7 == 1296389188)
    {
      a3->unint64_t var3 = (v9 & 0x7FFFFFFF) + (v8 & 0x7FFFFFFF);
      a3->unint64_t var4 = 0;
      if (self->_tmu->var3 + self->_tmu->var1 - 1 + self->_tmu->var2 - 1 < 0xF4240001) {
        return result;
      }
      uint64_t v11 = 261;
    }
    else
    {
      uint64_t v11 = 259;
    }
    [(GTBaseStreamTransport_tools_diagnostics *)self _scheduleInvalidation:+[GTError_tools_diagnostics errorWithDomain:@"DYErrorDomain" code:v11 userInfo:0]];
    return -1;
  }
  return result;
}

- (void)_waitEAGAIN
{
}

- (int64_t)_write:(const void *)a3 size:(unint64_t)a4
{
  return 0;
}

- (int64_t)_read:(void *)a3 size:(unint64_t)a4
{
  return 0;
}

- (void)_scheduleInvalidation:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GTBaseStreamTransport_tools_diagnostics;
  [(GTTransport_tools_diagnostics *)&v4 _scheduleInvalidation:a3];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sendSema);
}

- (void)_invalidate
{
  if (self)
  {
    vm_deallocate(mach_task_self_, (vm_address_t)self->_relayTmu, 0x31uLL);
    self->_relayTmu = 0;
    vm_deallocate(mach_task_self_, (vm_address_t)self->_tmu, 0x31uLL);
    self->_tmu = 0;
  }

  self->_messageBuffer = 0;
  v3.receiver = self;
  v3.super_class = (Class)GTBaseStreamTransport_tools_diagnostics;
  [(GTTransport_tools_diagnostics *)&v3 _invalidate];
}

- (void)dealloc
{
  sendSema = self->_sendSema;
  if (sendSema)
  {
    dispatch_release(sendSema);
    self->_sendSema = 0;
  }
  relayQueue = self->_relayQueue;
  if (relayQueue)
  {
    dispatch_release(relayQueue);
    self->_relayQueue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)GTBaseStreamTransport_tools_diagnostics;
  [(GTTransport_tools_diagnostics *)&v5 dealloc];
}

- (GTBaseStreamTransport_tools_diagnostics)init
{
  v9.receiver = self;
  v9.super_class = (Class)GTBaseStreamTransport_tools_diagnostics;
  uint64_t v2 = [(GTTransport_tools_diagnostics *)&v9 init];
  objc_super v3 = v2;
  if (v2)
  {
    vm_address_t v4 = GTCoreAlloc((uint64_t)v2, 0x31uLL);
    v3->_tmu = (dy_transport_message_unpack_s *)v4;
    if (v4)
    {
      *(void *)(v4 + 24) = 0x1000000001;
      *(_OWORD *)(v4 + 32) = xmmword_1A720;
      *(unsigned char *)(v4 + 48) = 0;
      vm_address_t v5 = GTCoreAlloc(v4, 0x31uLL);
      v3->_relayTmu = (dy_transport_message_unpack_s *)v5;
      if (v5)
      {
        *(void *)(v5 + 24) = 0x100000001;
        *(_OWORD *)(v5 + 32) = xmmword_1A720;
        *(unsigned char *)(v5 + 48) = 0;
        unint64_t v6 = [+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"gputools.%@.%p.%@", +[NSString stringWithUTF8String:object_getClassName(v3)], v3, @"relay") UTF8String];
        v3->_relayQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2(v6, 0, (dispatch_queue_t)v3->super._rootQueue);
        v3->_sendSema = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
        return v3;
      }
      unsigned int v8 = "_relayTmu";
    }
    else
    {
      unsigned int v8 = "_tmu";
    }
    __assert_rtn("-[GTBaseStreamTransport init]", "", 0, v8);
  }
  return v3;
}

@end