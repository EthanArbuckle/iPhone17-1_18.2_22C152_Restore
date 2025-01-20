@interface IPXPCEventStateUpdateStreamSource
- (IPStateUpdateStreamSourceDelegate)delegate;
- (IPXPCEventStateUpdateStreamSource)initWithQueue:(id)a3 streamName:(id)a4;
- (void)_queue_handleEvent:(id)a3;
- (void)resume;
- (void)setDelegate:(id)a3;
@end

@implementation IPXPCEventStateUpdateStreamSource

- (IPXPCEventStateUpdateStreamSource)initWithQueue:(id)a3 streamName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IPXPCEventStateUpdateStreamSource;
  v9 = [(IPXPCEventStateUpdateStreamSource *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    streamName = v9->_streamName;
    v9->_streamName = (NSString *)v10;

    objc_storeStrong((id *)&v9->_queue, a3);
  }

  return v9;
}

- (void)resume
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  self->_resumed = 1;
  v3 = _IPServerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    streamName = self->_streamName;
    *(_DWORD *)buf = 138412290;
    v11 = streamName;
    _os_log_impl(&dword_252AA9000, v3, OS_LOG_TYPE_DEFAULT, "Resuming event source for %@, setting handlers", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  [(NSString *)self->_streamName UTF8String];
  xpc_set_event();
  v6 = [(NSString *)self->_streamName UTF8String];
  queue = self->_queue;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __43__IPXPCEventStateUpdateStreamSource_resume__block_invoke;
  handler[3] = &unk_26538F908;
  objc_copyWeak(&v9, (id *)buf);
  xpc_set_event_stream_handler(v6, queue, handler);
  objc_destroyWeak(&v9);

  objc_destroyWeak((id *)buf);
}

void __43__IPXPCEventStateUpdateStreamSource_resume__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_queue_handleEvent:", v3);
}

- (void)_queue_handleEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  xpc_object_t v5 = _IPClientLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (IPStateUpdateMessage *)IPXPCCopyDescription((uint64_t)v4);
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl(&dword_252AA9000, v5, OS_LOG_TYPE_DEFAULT, "event: %@", buf, 0xCu);
  }
  if (MEMORY[0x2533C83D0](v4) == MEMORY[0x263EF8708])
  {
    if (xpc_dictionary_get_uint64(v4, (const char *)[@"type" UTF8String]) == -1)
    {
      reply = xpc_dictionary_create_reply(v4);
      xpc_dictionary_send_reply();
      v11 = _IPClientLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_252AA9000, v11, OS_LOG_TYPE_DEFAULT, "Sent reply message to ping event.", buf, 2u);
      }
    }
    else
    {
      id v12 = 0;
      id v8 = [[IPStateUpdateMessage alloc] initWithXPCDictionaryRepresentation:v4 error:&v12];
      reply = v12;
      id v9 = _IPClientLog();
      id WeakRetained = v9;
      if (v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v14 = v8;
          _os_log_impl(&dword_252AA9000, WeakRetained, OS_LOG_TYPE_DEFAULT, "handling: %@", buf, 0xCu);
        }

        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained stateUpdateStreamSource:self updateMessageReceived:v8];
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[IPXPCEventStateUpdateStreamSource _queue_handleEvent:]((uint64_t)reply, WeakRetained);
      }
    }
  }
  else
  {
    reply = _IPClientLog();
    if (os_log_type_enabled(reply, OS_LOG_TYPE_ERROR)) {
      -[IPXPCEventStateUpdateStreamSource _queue_handleEvent:](reply);
    }
  }
}

- (IPStateUpdateStreamSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IPStateUpdateStreamSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_streamName, 0);
}

- (void)_queue_handleEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_252AA9000, a2, OS_LOG_TYPE_ERROR, "Could not decode IPStateUpdateMessage: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_queue_handleEvent:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_252AA9000, log, OS_LOG_TYPE_ERROR, "Could not handle event of bogus type.", v1, 2u);
}

@end