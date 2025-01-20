@interface GTTransport_tools_diagnostics
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
- (GTTransport_tools_diagnostics)init;
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

@implementation GTTransport_tools_diagnostics

- (void)setInterposerVersion:(unsigned int)a3
{
  LODWORD(self->_sources) = a3;
}

- (unsigned)interposerVersion
{
  return self->_sources;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)self->_dispatch_send;
}

- (void)setPrioritizeOutgoingMessages:(BOOL)a3
{
  BYTE1(self->_interposerVersion) = a3;
}

- (BOOL)prioritizeOutgoingMessages
{
  return BYTE1(self->_interposerVersion);
}

- (NSError)error
{
  return (NSError *)self->_identifier;
}

- (void)drainQueue
{
}

- (BOOL)relayMessage:(id)a3 error:(id *)a4
{
  if ([a3 transport] == self)
  {
    if (!a4) {
      goto LABEL_16;
    }
    uint64_t v11 = 40;
LABEL_15:
    id v12 = +[GTError_tools_diagnostics errorWithDomain:@"DYErrorDomain" code:v11 userInfo:0];
    LOBYTE(v7) = 0;
    *a4 = v12;
    return v7;
  }
  if (![(GTTransport_tools_diagnostics *)self connected])
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
  BOOL v7 = [(GTTransport_tools_diagnostics *)self _packMessage:a3 error:a4];
  if (v7)
  {
    Class isa = self[1].super.isa;
    char v9 = BYTE1(self->_interposerVersion);
    if (v9) {
      dispatch_suspend((dispatch_object_t)self->_queue);
    }
    sendQueue = self->_sendQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __34__GTTransport_relayMessage_error___block_invoke;
    v14[3] = &unk_24B78;
    char v15 = v9;
    v14[4] = self;
    v14[5] = a3;
    ((void (*)(OS_dispatch_queue *, void *))isa)(sendQueue, v14);
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (BOOL)sendNewMessage:(int)a3 error:(id *)a4
{
  return [(GTTransport_tools_diagnostics *)self sendNewMessage:*(void *)&a3 error:a4 replyQueue:0 timeout:0 handler:0];
}

- (BOOL)sendNewMessage:(int)a3 error:(id *)a4 replyQueue:(id)a5 timeout:(unint64_t)a6 handler:(id)a7
{
  id v12 = [[GTTransportMessage_tools_diagnostics alloc] initWithKind:*(void *)&a3 attributes:0 payload:0];
  LOBYTE(a7) = [(GTTransport_tools_diagnostics *)self send:v12 inReplyTo:0 error:a4 replyQueue:a5 timeout:a6 handler:a7];

  return (char)a7;
}

- (BOOL)send:(id)a3 error:(id *)a4
{
  return [(GTTransport_tools_diagnostics *)self send:a3 inReplyTo:0 error:a4 replyQueue:0 timeout:0 handler:0];
}

- (BOOL)send:(id)a3 error:(id *)a4 replyQueue:(id)a5 timeout:(unint64_t)a6 handler:(id)a7
{
  return [(GTTransport_tools_diagnostics *)self send:a3 inReplyTo:0 error:a4 replyQueue:a5 timeout:a6 handler:a7];
}

- (BOOL)send:(id)a3 inReplyTo:(id)a4 error:(id *)a5
{
  return [(GTTransport_tools_diagnostics *)self send:a3 inReplyTo:a4 error:a5 replyQueue:0 timeout:0 handler:0];
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
    id v27 = +[GTError_tools_diagnostics errorWithDomain:@"DYErrorDomain" code:v26 userInfo:0];
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
  if (![(GTTransport_tools_diagnostics *)self connected])
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
  BOOL v15 = [(GTTransport_tools_diagnostics *)self _packMessage:a3 error:a5];
  if (v15)
  {
    uint64_t v16 = [(GTTransport_tools_diagnostics *)self _nextMessageSerial];
    if (a4) {
      uint64_t v17 = (uint64_t)[a4 serial];
    }
    else {
      uint64_t v17 = 0xFFFFFFFFLL;
    }
    [a3 _setSerial:v16 replySerial:v17 transport:self];
    if (a8)
    {
      v18 = [(GTContinuation_tools_diagnostics *)[GTTransportMessageReplyContinuation_tools_diagnostics alloc] initWithQueue:a6 block:a8];
      a8 = v18;
      atomic_fetch_add((atomic_uint *volatile)&self->_invalid, 1u);
      Class isa = self[1].super.isa;
      int v20 = BYTE1(self->_interposerVersion);
      if (v18)
      {
        if (a7)
        {
          v18->timeout = a7;
          dispatch_time_t v21 = dispatch_time(0, a7);
          queue = self->_queue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = __63__GTTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke;
          block[3] = &unk_24A60;
          block[4] = self;
          int v35 = v16;
          dispatch_after(v21, queue, block);
        }
        v23 = self->_queue;
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = __63__GTTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_2;
        v32[3] = &unk_24B00;
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
      Class isa = self[1].super.isa;
      char v24 = BYTE1(self->_interposerVersion);
      if (!v24) {
        goto LABEL_21;
      }
    }
    dispatch_suspend((dispatch_object_t)self->_queue);
    char v24 = 1;
LABEL_21:
    sendQueue = self->_sendQueue;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __63__GTTransport_send_inReplyTo_error_replyQueue_timeout_handler___block_invoke_3;
    v29[3] = &unk_24B50;
    char v31 = v24;
    v29[4] = self;
    v29[5] = a8;
    v29[6] = a3;
    int v30 = v16;
    ((void (*)(OS_dispatch_queue *, void *))isa)(sendQueue, v29);

    LOBYTE(v15) = 1;
  }
  return v15;
}

- (void)setSynchronous:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __30__GTTransport_setSynchronous___block_invoke;
  v4[3] = &unk_24AD8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(queue, v4);
}

- (BOOL)synchronous
{
  return self[1].super.isa == (Class)&_dispatch_sync;
}

- (BOOL)invalid
{
  return self->_interposerVersion;
}

- (void)_scheduleInvalidation:(id)a3
{
  if (!LOBYTE(self->_interposerVersion))
  {
    LOBYTE(self->_interposerVersion) = 1;
    rootQueue = self->_rootQueue;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = __37__GTTransport__scheduleInvalidation___block_invoke;
    v4[3] = &unk_249E8;
    v4[4] = self;
    void v4[5] = a3;
    dispatch_barrier_async(rootQueue, v4);
  }
}

- (void)invalidate
{
  id v3 = +[GTError_tools_diagnostics errorWithDomain:@"DYErrorDomain" code:6 userInfo:0];

  [(GTTransport_tools_diagnostics *)self _scheduleInvalidation:v3];
}

- (int64_t)_sendMessage:(id)a3 error:(id *)a4
{
  return -1;
}

- (BOOL)_packMessage:(id)a3 error:(id *)a4
{
  return 0;
}

- (unsigned)_nextMessageSerial
{
  return atomic_fetch_add((atomic_uint *volatile)&self->_messageCounter, 1u) + 1;
}

- (void)_dispatchMessage:(id)a3
{
  if (!LOBYTE(self->_interposerVersion))
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    replyHandlersMap = self->_replyHandlersMap;
    id v6 = [(GTIntKeyedDictionary_tools_diagnostics *)replyHandlersMap countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(replyHandlersMap);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * i) _dispatch:a3];
        }
        id v7 = [(GTIntKeyedDictionary_tools_diagnostics *)replyHandlersMap countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }
    unsigned int v10 = [a3 replySerial];
    if (v10 != -1)
    {
      unsigned int v11 = v10;
      id v12 = [(NSError *)self->_error objectForIntKey:v10];
      if (v12)
      {
        int v13 = *((_DWORD *)v12 + 10) + 1;
        *((_DWORD *)v12 + 10) = v13;
        v14 = *((void *)v12 + 1);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = __32__GTTransport__dispatchMessage___block_invoke;
        v15[3] = &unk_24AB0;
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

- (void)_handleReplyTimeout:(unsigned int)a3 count:(unsigned int)a4
{
  uint64_t v6 = a3;
  id v7 = [(NSError *)self->_error objectForIntKey:a3];
  if (v7 && v7[10] <= a4)
  {
    id v9 = v7;
    uint64_t v8 = v7;
    [(NSError *)self->_error removeObjectForIntKey:v6];
    objc_msgSend(v9, "dispatchError:", +[GTError_tools_diagnostics errorWithDomain:code:userInfo:](GTError_tools_diagnostics, "errorWithDomain:code:userInfo:", @"DYErrorDomain", 5, 0));
  }
}

- (void)_invalidate
{
  [(GTIntKeyedDictionary_tools_diagnostics *)self->_replyHandlersMap makeObjectsPerformSelector:"cancel"];
  error = self->_error;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __26__GTTransport__invalidate__block_invoke;
  v4[3] = &unk_24900;
  v4[4] = self;
  [(NSError *)error enumerateKeysAndObjectsUsingBlock:v4];
  [(GTIntKeyedDictionary_tools_diagnostics *)self->_replyHandlersMap removeAllObjects];
  [(NSError *)self->_error removeAllObjects];
}

- (BOOL)connected
{
  return 0;
}

- (id)connect
{
  return 0;
}

- (void)_cancelSource:(id)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __29__GTTransport__cancelSource___block_invoke;
  v4[3] = &unk_249E8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (BOOL)_activateSource:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __31__GTTransport__activateSource___block_invoke;
  block[3] = &unk_24A38;
  block[4] = self;
  void block[5] = a3;
  block[6] = &v7;
  dispatch_sync(queue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)newSourceWithQueue:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  char v10 = __Block_byref_object_copy__80;
  unsigned int v11 = __Block_byref_object_dispose__81;
  uint64_t v12 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __34__GTTransport_newSourceWithQueue___block_invoke;
  block[3] = &unk_24A38;
  void block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(queue, block);
  char v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setTargetQueue:(id)a3
{
}

- (NSURL)url
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__80;
  char v10 = __Block_byref_object_dispose__81;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __18__GTTransport_url__block_invoke;
  v5[3] = &unk_24C40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (NSURL *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)debugDescription
{
  id v3 = [(GTTransport_tools_diagnostics *)self description];
  char v4 = [(GTTransport_tools_diagnostics *)self url];
  unsigned int v5 = [(GTTransport_tools_diagnostics *)self connected];
  unsigned int v6 = [(GTTransport_tools_diagnostics *)self invalid];
  uint64_t v7 = [(GTTransport_tools_diagnostics *)self error];
  uint64_t v8 = atomic_load(&self->_messageCounter.__a_.__a_value);
  uint64_t v9 = atomic_load((unsigned int *)&self->_invalid);
  return +[NSString stringWithFormat:@"%@: url=%@, connected=%d, invalid=%d, error=%@, messageCounter=%u, messageSendQueueDepth=%u, sources=%@", v3, v4, v5, v6, v7, v8, v9, self->_replyHandlersMap];
}

- (id)description
{
  return self->_dispatch_send;
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
  v6.super_class = (Class)GTTransport_tools_diagnostics;
  [(GTTransport_tools_diagnostics *)&v6 dealloc];
}

- (GTTransport_tools_diagnostics)init
{
  v8.receiver = self;
  v8.super_class = (Class)GTTransport_tools_diagnostics;
  id v2 = [(GTTransport_tools_diagnostics *)&v8 init];
  if (v2)
  {
    *((void *)v2 + 11) = [objc_alloc((Class)NSString) initWithFormat:@"<%@ %p>", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", object_getClassName(v2)), v2];
    id v3 = [+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"gputools.%@.%p", +[NSString stringWithUTF8String:object_getClassName(v2)], v2) UTF8String];
    char v4 = dispatch_queue_attr_make_with_overcommit();
    *((void *)v2 + 2) = dispatch_queue_create(v3, v4);
    unsigned int v5 = [+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"gputools.%@.%p.%@", +[NSString stringWithUTF8String:object_getClassName(v2)], v2, @"default") UTF8String];
    *((void *)v2 + 3) = dispatch_queue_create_with_target_V2(v5, 0, *((dispatch_queue_t *)v2 + 2));
    objc_super v6 = [+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"gputools.%@.%p.%@", +[NSString stringWithUTF8String:object_getClassName(v2)], v2, @"send") UTF8String];
    *((void *)v2 + 4) = dispatch_queue_create_with_target_V2(v6, 0, *((dispatch_queue_t *)v2 + 2));
    *((void *)v2 + 8) = objc_opt_new();
    *((void *)v2 + 9) = objc_opt_new();
    *((void *)v2 + 12) = &_dispatch_async;
    *((unsigned char *)v2 + 52) = 0;
  }
  return (GTTransport_tools_diagnostics *)v2;
}

@end