@interface DYBaseStreamTransport
- (BOOL)_packMessage:(id)a3 error:(id *)a4;
- (DYBaseStreamTransport)init;
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

@implementation DYBaseStreamTransport

- (DYBaseStreamTransport)init
{
  v8.receiver = self;
  v8.super_class = (Class)DYBaseStreamTransport;
  id v2 = [(DYTransport *)&v8 init];
  if (v2)
  {
    v3 = malloc_type_calloc(1uLL, 0x31uLL, 0x1000040BB36FE7BuLL);
    *((void *)v2 + 13) = v3;
    if (v3)
    {
      v3[3] = 0x1000000001;
      *((_OWORD *)v3 + 2) = xmmword_24F6955A0;
      *((unsigned char *)v3 + 48) = 0;
      v4 = malloc_type_calloc(1uLL, 0x31uLL, 0x1000040BB36FE7BuLL);
      *((void *)v2 + 28) = v4;
      if (v4)
      {
        v4[3] = 0x100000001;
        *((_OWORD *)v4 + 2) = xmmword_24F6955A0;
        *((unsigned char *)v4 + 48) = 0;
        v5 = (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"gputools.%@.%p.%@", objc_msgSend(NSString, "stringWithUTF8String:", object_getClassName(v2)), v2, @"relay", "UTF8String"];
        *((void *)v2 + 27) = dispatch_queue_create_with_target_V2(v5, 0, *((dispatch_queue_t *)v2 + 2));
        *((void *)v2 + 26) = dispatch_semaphore_create(1);
        return (DYBaseStreamTransport *)v2;
      }
      v7 = "_relayTmu";
    }
    else
    {
      v7 = "_tmu";
    }
    __assert_rtn("-[DYBaseStreamTransport init]", "", 0, v7);
  }
  return (DYBaseStreamTransport *)v2;
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
  v5.super_class = (Class)DYBaseStreamTransport;
  [(DYTransport *)&v5 dealloc];
}

- (void)_invalidate
{
  free(self->_relayTmu);
  self->_relayTmu = 0;
  free(self->_tmu);
  self->_tmu = 0;

  self->_messageBuffer = 0;
  v3.receiver = self;
  v3.super_class = (Class)DYBaseStreamTransport;
  [(DYTransport *)&v3 _invalidate];
}

- (void)_scheduleInvalidation:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DYBaseStreamTransport;
  [(DYTransport *)&v4 _scheduleInvalidation:a3];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sendSema);
}

- (int64_t)_read:(void *)a3 size:(unint64_t)a4
{
  return 0;
}

- (int64_t)_write:(const void *)a3 size:(unint64_t)a4
{
  return 0;
}

- (void)_waitEAGAIN
{
}

- (int64_t)_syncTmuToHeader:(dy_transport_message_unpack_s *)a3 ioBlock:(id)a4
{
  int64_t result = (*((uint64_t (**)(id, SEL))a4 + 2))(a4, a2);
  if (result != -1 && !a3->var3)
  {
    a3->var5 = 1;
    long long v7 = *(_OWORD *)&a3->var0.var0;
    *(int8x16_t *)&a3->var0.var0 = vrev32q_s8(*(int8x16_t *)&a3->var0.var0);
    unsigned int v8 = bswap32(a3->var0.var4);
    unsigned int v9 = bswap32(a3->var0.var5);
    a3->var0.var4 = v8;
    a3->var0.var5 = v9;
    if (v7 == 1296389188)
    {
      a3->var3 = (v9 & 0x7FFFFFFF) + (v8 & 0x7FFFFFFF);
      a3->var4 = 0;
      if (self->_tmu->var3 + self->_tmu->var1 - 1 + self->_tmu->var2 - 1 < 0xF4240001) {
        return result;
      }
      v10 = (void *)MEMORY[0x253361500]();
      _DYOLog((uint64_t)self, 3, @"message buffer too large", v11, v12, v13, v14, v15, v22);
      uint64_t v16 = 261;
    }
    else
    {
      v10 = (void *)MEMORY[0x253361500]();
      _DYOLog((uint64_t)self, 3, @"bad message header received", v17, v18, v19, v20, v21, v22);
      uint64_t v16 = 259;
    }
    [(DYBaseStreamTransport *)self _scheduleInvalidation:+[DYError errorWithDomain:@"DYErrorDomain" code:v16 userInfo:0]];
    return -1;
  }
  return result;
}

- (void)_unpackAndDispatchMessage
{
  objc_super v3 = (void *)MEMORY[0x253361500](self, a2);
  uint64_t v4 = self->_tmu->var0.var4 & 0x7FFFFFFF;
  objc_super v5 = [(DYVMBuffer *)self->_messageBuffer mutableBytes];
  tmu = self->_tmu;
  uint64_t v7 = ((unint64_t)v5 + tmu->var1 - 1) & -(uint64_t)tmu->var1;
  if ((tmu->var0.var4 & 0x80000000) == 0)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 24;
LABEL_5:
    unsigned int var5 = tmu->var0.var5;
    if ((var5 & 0x80000000) != 0)
    {
      int v19 = var5 & 0x7FFFFFFF;
      uint64_t v18 = objc_msgSend(-[DYVMBuffer subdataWithRange:](self->_messageBuffer, "subdataWithRange:", ((v7 + v4 + tmu->var2 - 1) & -(uint64_t)tmu->var2)- (unint64_t)-[DYVMBuffer mutableBytes](self->_messageBuffer, "mutableBytes"), var5 & 0x7FFFFFFF), "DYGPUToolsData");
      uint64_t v9 = (v19 + v9);
      tmu = self->_tmu;
    }
    else
    {
      uint64_t v18 = 0;
    }
    uint64_t v20 = [[DYTransportMessage alloc] initWithKind:tmu->var0.var1 attributes:v8 payload:v18];
    [(DYTransportMessage *)v20 _setSerial:self->_tmu->var0.var2 replySerial:self->_tmu->var0.var3 transport:self];
    [(DYTransportMessage *)v20 _setTransportSize:v9];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      GPUTools::VMBuffer::protect_readonly((GPUTools::VMBuffer *)[(DYVMBuffer *)self->_messageBuffer vmBuffer]);
    }

    self->_messageBuffer = 0;
    [(DYTransport *)self _dispatchMessage:v20];

    uint64_t v21 = self->_tmu;
    *(_OWORD *)&v21->var3 = xmmword_24F6955A0;
    v21->unsigned int var5 = 0;
    return;
  }
  uint64_t v10 = objc_msgSend(-[DYVMBuffer subdataWithRange:](self->_messageBuffer, "subdataWithRange:", v7 - (unint64_t)-[DYVMBuffer mutableBytes](self->_messageBuffer, "mutableBytes"), v4), "DYGPUToolsData");
  uint64_t v11 = [MEMORY[0x263F08AC0] propertyListWithData:v10 options:0 format:0 error:0];
  if (v11)
  {
    uint64_t v8 = v11;
    uint64_t v9 = (v4 + 24);
    tmu = self->_tmu;
    goto LABEL_5;
  }
  _DYOLog((uint64_t)self, 3, @"failed to unpack message attributes", v12, v13, v14, v15, v16, v22);
  [(DYBaseStreamTransport *)self _scheduleInvalidation:+[DYError errorWithDomain:@"DYErrorDomain" code:260 userInfo:0]];
}

- (void)_allocateMessageBuffer
{
  tmu = self->_tmu;
  if (!tmu->var5)
  {
    uint64_t v7 = "_tmu->hasHeader";
    goto LABEL_11;
  }
  unint64_t v3 = tmu->var3 + tmu->var1 - 1 + tmu->var2 - 1;
  if (v3 >= 0xF4240001)
  {
    uint64_t v7 = "size_aligned <= MAXIMUM_MESSAGE_SIZE";
    goto LABEL_11;
  }

  if (v3 >= 3 * *MEMORY[0x263EF8AF8]) {
    objc_super v5 = (Class *)&off_265335980;
  }
  else {
    objc_super v5 = (Class *)0x263EFF990;
  }
  v6 = (DYVMBuffer *)[objc_alloc(*v5) initWithLength:v3];
  self->_messageBuffer = v6;
  if (!v6)
  {
    uint64_t v7 = "_messageBuffer != nil";
LABEL_11:
    __assert_rtn("-[DYBaseStreamTransport _allocateMessageBuffer]", "", 0, v7);
  }
}

- (int64_t)_performRead:(void *)a3 size:(unint64_t)a4
{
  if (!self->_bytesToRead) {
    self->_bytesToRead = a4;
  }
  do
  {
    int64_t v6 = [(DYBaseStreamTransport *)self _read:a3 size:self->_bytesToRead];
    int64_t v7 = v6;
    if (v6 != -1)
    {
      if (v6)
      {
        tmu = self->_tmu;
        unint64_t v18 = tmu->var4 + v6;
        tmu->var3 -= v6;
        tmu->var4 = v18;
        self->_bytesToRead = 0;
      }
      else
      {
        uint64_t v16 = (void *)MEMORY[0x253361500]();
        [(DYBaseStreamTransport *)self _scheduleInvalidation:+[DYError errorWithDomain:@"DYErrorDomain" code:31 userInfo:0]];
      }
      return v7;
    }
    int v8 = *__error();
  }
  while (v8 == 4);
  if (v8 != 35)
  {
    uint64_t v9 = (void *)MEMORY[0x253361500]();
    uint64_t v10 = [NSString stringWithUTF8String:strerror(v8)];
    _DYOLog((uint64_t)self, 3, @"read io failure: %@ (%d)", v11, v12, v13, v14, v15, v10);
    [(DYBaseStreamTransport *)self _scheduleInvalidation:+[DYError errorWithDomain:@"DYErrorDomain" code:31 userInfo:0]];
  }
  *__error() = v8;
  return v7;
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
    int64_t v4 = -[DYBaseStreamTransport _syncTmuToHeader:ioBlock:](self, "_syncTmuToHeader:ioBlock:");
    if (v4 == -1) {
      return v4;
    }
    int v8 = self->_tmu;
    if (!v8->var5) {
      return v4;
    }
    if (!v8->var3)
    {
LABEL_16:
      [(DYBaseStreamTransport *)self _unpackAndDispatchMessage];
      return v4;
    }
    [(DYBaseStreamTransport *)self _allocateMessageBuffer];
    uint64_t v9 = [(DYVMBuffer *)self->_messageBuffer mutableBytes];
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
  int64_t v11 = [(DYBaseStreamTransport *)self _performRead:self->_messageBufferWritePtr size:var3];
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

uint64_t __43__DYBaseStreamTransport__readAndAccumulate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performRead:*(void *)(*(void *)(*(void *)(a1 + 32) + 104) + 40) + *(void *)(*(void *)(a1 + 32) + 104) size:*(void *)(*(void *)(*(void *)(a1 + 32) + 104) + 32)];
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

- (int64_t)_writeBuffers:(id *)a3
{
  uint64_t v5 = 0;
  int64_t v6 = 0;
  int v7 = 0;
  buffers = self->_buffers;
  do
  {
    uint64_t v9 = buffers[v5];
    if (v9)
    {
      uint64_t v10 = &self->_iov[v7];
      v10->iov_base = (void *)[(NSData *)v9 bytes];
      uint64_t v11 = [(NSData *)buffers[v5] length];
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
          unint64_t v15 = [(DYBaseStreamTransport *)self _write:iov->iov_base size:iov->iov_len];
          uint64_t v16 = __error();
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
            *(p_iov_len - 1) += v15;
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
          *a3 = [(DYTransport *)self error];
        }
        goto LABEL_24;
      }
      [(DYBaseStreamTransport *)self _waitEAGAIN];
    }
    uint64_t v22 = [NSString stringWithUTF8String:strerror(*v16)];
    _DYOLog((uint64_t)self, 3, @"io failure writing message: %@ (%d)", v23, v24, v25, v26, v27, v22);
    v28 = +[DYError errorWithDomain:*MEMORY[0x263F08438] code:v17 userInfo:0];
    [(DYBaseStreamTransport *)self _scheduleInvalidation:v28];
    if (a3) {
      *a3 = v28;
    }
    *__error() = v17;
LABEL_24:
    int64_t v6 = -1;
  }
LABEL_25:
  [(DYBaseStreamTransport *)self _clearBuffers];
  return v6;
}

- (BOOL)_packMessage:(id)a3 error:(id *)a4
{
  if ([a3 attributes])
  {
    id v21 = 0;
    int v7 = (void *)MEMORY[0x253361500]();
    int v8 = objc_msgSend(MEMORY[0x263F08AC0], "dataWithPropertyList:format:options:error:", objc_msgSend(a3, "attributes"), 200, 0, &v21);
    id v9 = v8;
    id v10 = v21;
    if (!v8)
    {
      if (a4)
      {
        uint64_t v19 = [NSDictionary dictionaryWithObject:v21 forKey:*MEMORY[0x263F08608]];

        *a4 = +[DYError errorWithDomain:@"DYErrorDomain" code:36 userInfo:v19];
      }
      return 0;
    }
    [a3 setEncodedAttributes:v8];
  }
  else
  {
    int v8 = 0;
  }
  int v11 = [v8 length];
  if (v11 + objc_msgSend((id)objc_msgSend(a3, "payload"), "length") + 24 < 0xF4240001uLL)
  {
    objc_msgSend(a3, "_setTransportSize:");
    return 1;
  }
  [a3 setEncodedAttributes:0];
  _DYOLog((uint64_t)self, 3, @"message buffer too large", v13, v14, v15, v16, v17, v20);
  if (a4)
  {
    uint64_t v18 = +[DYError errorWithDomain:@"DYErrorDomain" code:261 userInfo:0];
    BOOL result = 0;
    *a4 = v18;
    return result;
  }
  return 0;
}

- (int64_t)_sendMessage:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v7 = (void *)[a3 payload];
  int v8 = (void *)[a3 encodedAttributes];
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
  v19[0] = 1296389188;
  v19[1] = bswap32(v9);
  v19[2] = bswap32(v10);
  v19[3] = bswap32(v11);
  v19[4] = bswap32(v12);
  v19[5] = bswap32(v13);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sendSema, 0xFFFFFFFFFFFFFFFFLL);
  if (LOBYTE(self->super._interposerVersion))
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_sendSema);
    [a3 setEncodedAttributes:0];
    return -1;
  }
  self->_buffers[0] = (NSData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v19 length:24];
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
  uint64_t v15 = g_signpostLog;
  if (os_signpost_enabled((os_log_t)g_signpostLog))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_24F657000, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "GPUTools-TransportWriteBuffers", "", buf, 2u);
  }
  int64_t v16 = [(DYBaseStreamTransport *)self _writeBuffers:a4];
  uint64_t v17 = g_signpostLog;
  if (os_signpost_enabled((os_log_t)g_signpostLog))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v21 = v16;
    _os_signpost_emit_with_name_impl(&dword_24F657000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "GPUTools-TransportWriteBuffers", "Bytes written: %lu", buf, 0xCu);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sendSema);
  return v16;
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
  int64_t v14 = -[DYBaseStreamTransport _syncTmuToHeader:ioBlock:](self, "_syncTmuToHeader:ioBlock:");
  if (v14 == -1) {
    return -1;
  }
  relayTmu = self->_relayTmu;
  if (!relayTmu->var5) {
    return 0;
  }
  int64_t v16 = v14;
  *(int8x16_t *)&relayTmu->var0.var0 = vrev32q_s8(*(int8x16_t *)&relayTmu->var0.var0);
  *(int8x8_t *)&relayTmu->var0.unint64_t var4 = vrev32_s8(*(int8x8_t *)&relayTmu->var0.var4);
  p_sendSema = &self->_sendSema;
  int64_t v9 = -1;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sendSema, 0xFFFFFFFFFFFFFFFFLL);
  if (LOBYTE(self->super._interposerVersion)) {
    goto LABEL_9;
  }
  self->_buffers[0] = (NSData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:self->_relayTmu length:24 freeWhenDone:0];
  uint64_t v17 = self->_relayTmu;
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
    self->_buffers[v7] = (NSData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a3 length:v4 freeWhenDone:0];
LABEL_5:
  int64_t v8 = [(DYBaseStreamTransport *)self _writeBuffers:0];
  int64_t v9 = v8;
  if (v8 == -1)
  {
LABEL_8:
    p_sendSema = &self->_sendSema;
LABEL_9:
    dispatch_semaphore_signal((dispatch_semaphore_t)*p_sendSema);
    return v9;
  }
  unsigned int v10 = self->_relayTmu;
  unint64_t v11 = v10->var3 - v8;
  unint64_t v12 = v10->var4 + v8;
  v10->unint64_t var3 = v11;
  v10->unint64_t var4 = v12;
  if (!v11)
  {
    *(_OWORD *)&v10->unint64_t var3 = xmmword_24F6955A0;
    v10->unsigned int var5 = 0;
    goto LABEL_8;
  }
  return v9;
}

size_t __48__DYBaseStreamTransport__relayBufferInner_size___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 224);
  if (*(void *)(v2 + 32) >= *(void *)(a1 + 40)) {
    size_t v3 = *(void *)(a1 + 40);
  }
  else {
    size_t v3 = *(void *)(v2 + 32);
  }
  memcpy((void *)(*(void *)(v2 + 40) + v2), *(const void **)(a1 + 48), v3);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 224) + 40) += v3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 224) + 32) -= v3;
  return v3;
}

- (int64_t)_relayBuffer:(const void *)a3 size:(unint64_t)a4
{
  char v7 = BYTE1(self->super._interposerVersion);
  if (v7) {
    dispatch_suspend((dispatch_object_t)self->super._queue);
  }
  uint64_t v13 = 0;
  int64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  relayQueue = self->_relayQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__DYBaseStreamTransport__relayBuffer_size___block_invoke;
  block[3] = &unk_265336F50;
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

void __43__DYBaseStreamTransport__relayBuffer_size___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x253361500]();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _relayBufferInner:*(void *)(a1 + 48) size:*(void *)(a1 + 56)];
  if (*(unsigned char *)(a1 + 64))
  {
    size_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    dispatch_resume(v3);
  }
}

@end