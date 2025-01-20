@interface DYTransport
- (BOOL)_activateSource:(id)a3;
- (BOOL)_packMessage:(id)a3 error:(id *)a4;
- (BOOL)connected;
- (BOOL)invalid;
- (BOOL)prioritizeOutgoingMessages;
- (BOOL)relayMessage:(id)a3 error:(id *)a4;
- (BOOL)send:(id)a3 error:(id *)a4;
- (BOOL)send:(id)a3 error:(id *)a4 replyQueue:(id)a5 timeout:(unint64_t)a6 handler:(id)a7;
- (BOOL)send:(id)a3 inReplyTo:(id)a4 error:(id *)a5;
- (BOOL)send:(id)a3 inReplyTo:(id)a4 error:(id *)a5 replyQueue:(id)a6 timeout:(unint64_t)a7 handler:(id)a8;
- (BOOL)sendNewMessage:(int)a3 error:(id *)a4;
- (BOOL)sendNewMessage:(int)a3 error:(id *)a4 replyQueue:(id)a5 timeout:(unint64_t)a6 handler:(id)a7;
- (BOOL)synchronous;
- (DYTransport)init;
- (NSError)error;
- (NSString)identifier;
- (NSURL)url;
- (id)connect;
- (id)debugDescription;
- (id)description;
- (id)newSourceWithQueue:(id)a3;
- (int64_t)_sendMessage:(id)a3 error:(id *)a4;
- (unsigned)_nextMessageSerial;
- (unsigned)interposerVersion;
- (void)_cancelSource:(id)a3;
- (void)_dispatchMessage:(id)a3;
- (void)_handleReplyTimeout:(unsigned int)a3 count:(unsigned int)a4;
- (void)_invalidate;
- (void)_scheduleInvalidation:(id)a3;
- (void)dealloc;
- (void)drainQueue;
- (void)invalidate;
- (void)setIdentifier:(id)a3;
- (void)setInterposerVersion:(unsigned int)a3;
- (void)setPrioritizeOutgoingMessages:(BOOL)a3;
- (void)setSynchronous:(BOOL)a3;
- (void)setTargetQueue:(id)a3;
@end

@implementation DYTransport

- (DYTransport)init
{
  v11.receiver = self;
  v11.super_class = (Class)DYTransport;
  id v2 = [(DYTransport *)&v11 init];
  if (v2)
  {
    id v3 = [NSString alloc];
    *((void *)v2 + 12) = [v3 initWithFormat:@"<%@ %p>", objc_msgSend(NSString, "stringWithUTF8String:", object_getClassName(v2)), v2];
    v4 = (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"gputools.%@.%p", objc_msgSend(NSString, "stringWithUTF8String:", object_getClassName(v2)), v2), "UTF8String"];
    v5 = dispatch_queue_attr_make_with_overcommit();
    *((void *)v2 + 2) = dispatch_queue_create(v4, v5);
    v6 = (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"gputools.%@.%p.%@", objc_msgSend(NSString, "stringWithUTF8String:", object_getClassName(v2)), v2, @"default", "UTF8String"];
    *((void *)v2 + 3) = dispatch_queue_create_with_target_V2(v6, 0, *((dispatch_queue_t *)v2 + 2));
    v7 = (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"gputools.%@.%p.%@", objc_msgSend(NSString, "stringWithUTF8String:", object_getClassName(v2)), v2, @"send", "UTF8String"];
    *((void *)v2 + 4) = dispatch_queue_create_with_target_V2(v7, 0, *((dispatch_queue_t *)v2 + 2));
    *((void *)v2 + 10) = objc_opt_new();
    uint64_t v8 = objc_opt_new();
    uint64_t v9 = MEMORY[0x263EF8838];
    *((void *)v2 + 8) = v8;
    *((void *)v2 + 9) = v9;
    *((unsigned char *)v2 + 52) = 0;
  }
  return (DYTransport *)v2;
}

- (void)dealloc
{
  sendQueue = self->_sendQueue;
  if (sendQueue)
  {
    dispatch_release(sendQueue);
    self->_sendQueue = 0;
  }
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  rootQueue = self->_rootQueue;
  if (rootQueue)
  {
    dispatch_release(rootQueue);
    self->_rootQueue = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)DYTransport;
  [(DYTransport *)&v6 dealloc];
}

- (id)description
{
  return self[1].super.isa;
}

- (id)debugDescription
{
  id v3 = NSString;
  id v4 = [(DYTransport *)self description];
  v5 = [(DYTransport *)self url];
  BOOL v6 = [(DYTransport *)self connected];
  BOOL v7 = [(DYTransport *)self invalid];
  uint64_t v8 = [(DYTransport *)self error];
  uint64_t v9 = atomic_load(&self->_messageCounter);
  uint64_t v10 = atomic_load((unsigned int *)&self->_invalid);
  return (id)[v3 stringWithFormat:@"%@: url=%@, connected=%d, invalid=%d, error=%@, messageCounter=%u, messageSendQueueDepth=%u, sources=%@", v4, v5, v6, v7, v8, v9, v10, self->_error];
}

- (NSURL)url
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__1;
  uint64_t v10 = __Block_byref_object_dispose__1;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __18__DYTransport_url__block_invoke;
  v5[3] = &unk_2653367C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (NSURL *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __18__DYTransport_url__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 8);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setTargetQueue:(id)a3
{
}

- (id)newSourceWithQueue:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__1;
  uint64_t v11 = __Block_byref_object_dispose__1;
  uint64_t v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__DYTransport_newSourceWithQueue___block_invoke;
  block[3] = &unk_2653367E8;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(queue, block);
  id v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void *__34__DYTransport_newSourceWithQueue___block_invoke(void *result)
{
  if (!*(unsigned char *)(result[4] + 52))
  {
    v1 = result;
    id result = [[DYTransportSource alloc] _initWithQueue:v1[5] transport:v1[4]];
    *(void *)(*(void *)(v1[6] + 8) + 40) = result;
  }
  return result;
}

- (BOOL)_activateSource:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__DYTransport__activateSource___block_invoke;
  block[3] = &unk_265336810;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  dispatch_sync(queue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __31__DYTransport__activateSource___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 52))
  {
    uint64_t v2 = result;
    id result = [*(id *)(v1 + 80) addObject:*(void *)(result + 40)];
    *(unsigned char *)(*(void *)(*(void *)(v2 + 48) + 8) + 24) = 1;
  }
  return result;
}

- (void)_cancelSource:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__DYTransport__cancelSource___block_invoke;
  v4[3] = &unk_265335F20;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __29__DYTransport__cancelSource___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) removeObject:*(void *)(a1 + 40)];
}

- (id)connect
{
  return 0;
}

- (BOOL)connected
{
  return 0;
}

- (void)_invalidate
{
  [(NSError *)self->_error makeObjectsPerformSelector:sel_cancel];
  dispatch_send = self->_dispatch_send;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __26__DYTransport__invalidate__block_invoke;
  v4[3] = &unk_265336838;
  v4[4] = self;
  [dispatch_send enumerateKeysAndObjectsUsingBlock:v4];
  [(NSError *)self->_error removeAllObjects];
  [self->_dispatch_send removeAllObjects];
}

uint64_t __26__DYTransport__invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 dispatchError:*(void *)(*(void *)(a1 + 32) + 88)];
}

- (void)_handleReplyTimeout:(unsigned int)a3 count:(unsigned int)a4
{
  uint64_t v6 = a3;
  uint64_t v7 = (_DWORD *)[self->_dispatch_send objectForIntKey:a3];
  if (v7 && v7[10] <= a4)
  {
    id v9 = v7;
    uint64_t v8 = v7;
    [self->_dispatch_send removeObjectForIntKey:v6];
    objc_msgSend(v9, "dispatchError:", +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", @"DYErrorDomain", 5, 0));
  }
}

- (void)_dispatchMessage:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!LOBYTE(self->_interposerVersion))
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    error = self->_error;
    uint64_t v6 = [(NSError *)error countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(error);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * i) _dispatch:a3];
        }
        uint64_t v7 = [(NSError *)error countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }
    unsigned int v10 = [a3 replySerial];
    if (v10 != -1)
    {
      unsigned int v11 = v10;
      uint64_t v12 = [self->_dispatch_send objectForIntKey:v10];
      if (v12)
      {
        int v13 = *(_DWORD *)(v12 + 40) + 1;
        *(_DWORD *)(v12 + 40) = v13;
        v14 = *(NSObject **)(v12 + 8);
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __32__DYTransport__dispatchMessage___block_invoke;
        v15[3] = &unk_265336888;
        v15[4] = v12;
        v15[5] = a3;
        v15[6] = self;
        unsigned int v16 = v11;
        int v17 = v13;
        dispatch_async(v14, v15);
      }
    }
  }
}

void __32__DYTransport__dispatchMessage___block_invoke(void *a1)
{
  uint64_t v1 = a1[4];
  if (!*(unsigned char *)(v1 + 24))
  {
    char v3 = (*(uint64_t (**)(void))(*(void *)(v1 + 16) + 16))();
    uint64_t v4 = a1[4];
    if (v3)
    {
      int64_t v5 = *(void *)(v4 + 32);
      if (v5)
      {
        dispatch_time_t v6 = dispatch_time(0, v5);
        uint64_t v7 = a1[6];
        uint64_t v8 = *(NSObject **)(v7 + 24);
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __32__DYTransport__dispatchMessage___block_invoke_3;
        v11[3] = &unk_265336860;
        v11[4] = v7;
        v11[5] = a1[7];
        dispatch_after(v6, v8, v11);
      }
    }
    else
    {
      *(unsigned char *)(v4 + 24) = 1;
      uint64_t v9 = a1[6];
      unsigned int v10 = *(NSObject **)(v9 + 24);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __32__DYTransport__dispatchMessage___block_invoke_2;
      block[3] = &unk_265336768;
      block[4] = v9;
      int v13 = *((_DWORD *)a1 + 14);
      dispatch_async(v10, block);
    }
  }
}

uint64_t __32__DYTransport__dispatchMessage___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) removeObjectForIntKey:*(unsigned int *)(a1 + 40)];
}

uint64_t __32__DYTransport__dispatchMessage___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleReplyTimeout:*(unsigned int *)(a1 + 40) count:*(unsigned int *)(a1 + 44)];
}

- (unsigned)_nextMessageSerial
{
  return atomic_fetch_add((atomic_uint *volatile)&self->_messageCounter, 1u);
}

- (BOOL)_packMessage:(id)a3 error:(id *)a4
{
  return 0;
}

- (int64_t)_sendMessage:(id)a3 error:(id *)a4
{
  return -1;
}

- (void)invalidate
{
  char v3 = +[DYError errorWithDomain:@"DYErrorDomain" code:6 userInfo:0];

  [(DYTransport *)self _scheduleInvalidation:v3];
}

- (void)_scheduleInvalidation:(id)a3
{
  if (!LOBYTE(self->_interposerVersion))
  {
    if (a3) {
      objc_msgSend((id)objc_msgSend(a3, "localizedDescription"), "UTF8String");
    }
    DYLog(5, "schedule invalidation <DYTransport %p, error: %s>", (uint64_t)a3, v3, v4, v5, v6, v7, (char)self);
    LOBYTE(self->_interposerVersion) = 1;
    rootQueue = self->_rootQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__DYTransport__scheduleInvalidation___block_invoke;
    block[3] = &unk_265335F20;
    block[4] = self;
    void block[5] = a3;
    dispatch_barrier_async(rootQueue, block);
  }
}

uint64_t __37__DYTransport__scheduleInvalidation___block_invoke(uint64_t result)
{
  if (!*(void *)(*(void *)(result + 32) + 88))
  {
    uint64_t v1 = result;
    *(void *)(*(void *)(result + 32) + 88) = *(id *)(result + 40);
    uint64_t v2 = *(void **)(v1 + 32);
    return [v2 _invalidate];
  }
  return result;
}

- (BOOL)invalid
{
  return self->_interposerVersion;
}

- (BOOL)synchronous
{
  return self->_sources == (NSMutableSet *)MEMORY[0x263EF8868];
}

- (void)setSynchronous:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__DYTransport_setSynchronous___block_invoke;
  v4[3] = &unk_2653364C0;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

uint64_t __30__DYTransport_setSynchronous___block_invoke(uint64_t result)
{
  uint64_t v1 = MEMORY[0x263EF8868];
  if (!*(unsigned char *)(result + 40)) {
    uint64_t v1 = MEMORY[0x263EF8838];
  }
  *(void *)(*(void *)(result + 32) + 72) = v1;
  return result;
}

- (BOOL)send:(id)a3 inReplyTo:(id)a4 error:(id *)a5 replyQueue:(id)a6 timeout:(unint64_t)a7 handler:(id)a8
{
  if ([a3 hasBeenSent])
  {
    if (!a5) {
      goto LABEL_32;
    }
    uint64_t v26 = 34;
LABEL_31:
    v27 = +[DYError errorWithDomain:@"DYErrorDomain" code:v26 userInfo:0];
    LOBYTE(v15) = 0;
    *a5 = v27;
    return v15;
  }
  if (a4 && ([a4 hasBeenSent] & 1) == 0)
  {
    if (a5)
    {
      uint64_t v26 = 35;
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if (![(DYTransport *)self connected])
  {
    if (!a5) {
      goto LABEL_32;
    }
    uint64_t v26 = 33;
    goto LABEL_31;
  }
  if (LOBYTE(self->_interposerVersion))
  {
    if (a5)
    {
      uint64_t v26 = 32;
      goto LABEL_31;
    }
LABEL_32:
    LOBYTE(v15) = 0;
    return v15;
  }
  BOOL v15 = [(DYTransport *)self _packMessage:a3 error:a5];
  if (v15)
  {
    uint64_t v16 = [(DYTransport *)self _nextMessageSerial];
    if (a4) {
      uint64_t v17 = [a4 serial];
    }
    else {
      uint64_t v17 = 0xFFFFFFFFLL;
    }
    [a3 _setSerial:v16 replySerial:v17 transport:self];
    if (a8)
    {
      long long v18 = [(DYContinuation *)[DYTransportMessageReplyContinuation alloc] initWithQueue:a6 block:a8];
      a8 = v18;
      atomic_fetch_add((atomic_uint *volatile)&self->_invalid, 1u);
      sources = self->_sources;
      int v20 = BYTE1(self->_interposerVersion);
      if (v18)
      {
        if (a7)
        {
          v18->timeout = a7;
          dispatch_time_t v21 = dispatch_time(0, a7);
          queue = self->_queue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __63__DYTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke;
          block[3] = &unk_265336768;
          block[4] = self;
          int v35 = v16;
          dispatch_after(v21, queue, block);
        }
        uint64_t v23 = self->_queue;
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __63__DYTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_2;
        v32[3] = &unk_265335F48;
        v32[4] = self;
        v32[5] = a8;
        int v33 = v16;
        dispatch_sync(v23, v32);
        if (!v20) {
          goto LABEL_20;
        }
      }
      else if (!BYTE1(self->_interposerVersion))
      {
LABEL_20:
        char v24 = 0;
        goto LABEL_21;
      }
    }
    else
    {
      atomic_fetch_add((atomic_uint *volatile)&self->_invalid, 1u);
      sources = self->_sources;
      char v24 = BYTE1(self->_interposerVersion);
      if (!v24) {
        goto LABEL_21;
      }
    }
    dispatch_suspend((dispatch_object_t)self->_queue);
    char v24 = 1;
LABEL_21:
    sendQueue = self->_sendQueue;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __63__DYTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_3;
    v29[3] = &unk_2653368D8;
    char v31 = v24;
    v29[4] = self;
    v29[5] = a8;
    v29[6] = a3;
    int v30 = v16;
    ((void (*)(OS_dispatch_queue *, void *))sources)(sendQueue, v29);

    LOBYTE(v15) = 1;
  }
  return v15;
}

uint64_t __63__DYTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleReplyTimeout:*(unsigned int *)(a1 + 40) count:0];
}

uint64_t __63__DYTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) setObject:*(void *)(a1 + 40) forIntKey:*(unsigned int *)(a1 + 48)];
}

void __63__DYTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 60)) {
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 52))
  {
    uint64_t v9 = (void *)MEMORY[0x253361500]();
    objc_msgSend(*(id *)(a1 + 40), "dispatchError:", +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", @"DYErrorDomain", 32, 0));
    atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1 + 32) + 48), 0xFFFFFFFF);
    unsigned int v10 = *(void **)(a1 + 48);
    [v10 setEncodedAttributes:0];
  }
  else
  {
    id v13 = 0;
    uint64_t v2 = (void *)MEMORY[0x253361500]();
    if (*(void *)(a1 + 40)) {
      uint64_t v3 = &v13;
    }
    else {
      uint64_t v3 = 0;
    }
    uint64_t v4 = [*(id *)(a1 + 32) _sendMessage:*(void *)(a1 + 48) error:v3];
    id v5 = v13;
    atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1 + 32) + 48), 0xFFFFFFFF);
    if (v4 == -1)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      if (v6)
      {
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = *(NSObject **)(v7 + 24);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __63__DYTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_4;
        block[3] = &unk_2653368B0;
        int v12 = *(_DWORD *)(a1 + 56);
        block[4] = v7;
        void block[5] = v6;
        void block[6] = v13;
        dispatch_async(v8, block);
      }
    }
  }
}

uint64_t __63__DYTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) removeObjectForIntKey:*(unsigned int *)(a1 + 56)];
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 dispatchError:v3];
}

- (BOOL)send:(id)a3 inReplyTo:(id)a4 error:(id *)a5
{
  return [(DYTransport *)self send:a3 inReplyTo:a4 error:a5 replyQueue:0 timeout:0 handler:0];
}

- (BOOL)send:(id)a3 error:(id *)a4 replyQueue:(id)a5 timeout:(unint64_t)a6 handler:(id)a7
{
  return [(DYTransport *)self send:a3 inReplyTo:0 error:a4 replyQueue:a5 timeout:a6 handler:a7];
}

- (BOOL)send:(id)a3 error:(id *)a4
{
  return [(DYTransport *)self send:a3 inReplyTo:0 error:a4 replyQueue:0 timeout:0 handler:0];
}

- (BOOL)sendNewMessage:(int)a3 error:(id *)a4 replyQueue:(id)a5 timeout:(unint64_t)a6 handler:(id)a7
{
  int v12 = [[DYTransportMessage alloc] initWithKind:*(void *)&a3 attributes:0 payload:0];
  LOBYTE(a7) = [(DYTransport *)self send:v12 inReplyTo:0 error:a4 replyQueue:a5 timeout:a6 handler:a7];

  return (char)a7;
}

- (BOOL)sendNewMessage:(int)a3 error:(id *)a4
{
  return [(DYTransport *)self sendNewMessage:*(void *)&a3 error:a4 replyQueue:0 timeout:0 handler:0];
}

- (BOOL)relayMessage:(id)a3 error:(id *)a4
{
  if ((DYTransport *)[a3 transport] == self)
  {
    if (!a4) {
      goto LABEL_16;
    }
    uint64_t v11 = 40;
LABEL_15:
    int v12 = +[DYError errorWithDomain:@"DYErrorDomain" code:v11 userInfo:0];
    LOBYTE(v7) = 0;
    *a4 = v12;
    return v7;
  }
  if (![(DYTransport *)self connected])
  {
    if (!a4) {
      goto LABEL_16;
    }
    uint64_t v11 = 33;
    goto LABEL_15;
  }
  if (LOBYTE(self->_interposerVersion))
  {
    if (a4)
    {
      uint64_t v11 = 32;
      goto LABEL_15;
    }
LABEL_16:
    LOBYTE(v7) = 0;
    return v7;
  }
  BOOL v7 = [(DYTransport *)self _packMessage:a3 error:a4];
  if (v7)
  {
    sources = self->_sources;
    char v9 = BYTE1(self->_interposerVersion);
    if (v9) {
      dispatch_suspend((dispatch_object_t)self->_queue);
    }
    sendQueue = self->_sendQueue;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __34__DYTransport_relayMessage_error___block_invoke;
    v14[3] = &unk_265336900;
    char v15 = v9;
    v14[4] = self;
    v14[5] = a3;
    ((void (*)(OS_dispatch_queue *, void *))sources)(sendQueue, v14);
    LOBYTE(v7) = 1;
  }
  return v7;
}

void __34__DYTransport_relayMessage_error___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
  }
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 52))
  {
    uint64_t v2 = (void *)MEMORY[0x253361500]();
    [*(id *)(a1 + 32) _sendMessage:*(void *)(a1 + 40) error:0];
  }
}

- (void)drainQueue
{
}

- (NSError)error
{
  return (NSError *)self->_identifier;
}

- (BOOL)prioritizeOutgoingMessages
{
  return BYTE1(self->_interposerVersion);
}

- (void)setPrioritizeOutgoingMessages:(BOOL)a3
{
  BYTE1(self->_interposerVersion) = a3;
}

- (NSString)identifier
{
  return (NSString *)self[1].super.isa;
}

- (void)setIdentifier:(id)a3
{
}

- (unsigned)interposerVersion
{
  return self->_replyHandlersMap;
}

- (void)setInterposerVersion:(unsigned int)a3
{
  LODWORD(self->_replyHandlersMap) = a3;
}

@end