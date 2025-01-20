@interface _SYInputStreamer
- (_SYInputStreamer)initWithCompressedFileURL:(id)a3 callbackQueue:(id)a4;
- (id)streamPropertyForKey:(id)a3;
- (void)_completeAllItemsWithError:(id)a3;
- (void)_tryToReadData;
- (void)close;
- (void)readDataOfLength:(unint64_t)a3 completion:(id)a4;
- (void)setStreamProperty:(id)a3 forKey:(id)a4;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)whenComplete:(id)a3;
@end

@implementation _SYInputStreamer

- (_SYInputStreamer)initWithCompressedFileURL:(id)a3 callbackQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)_SYInputStreamer;
  id v8 = [(_SYInputStreamer *)&v33 init];
  if (v8
    && (v9 = [[SYCompressedFileInputStream alloc] initWithCompressedFileAtURL:v6], v10 = (void *)*((void *)v8 + 1), *((void *)v8 + 1) = v9, v10, *((void *)v8 + 1)))
  {
    id v11 = [NSString alloc];
    v12 = [v6 lastPathComponent];
    v13 = (void *)[v11 initWithFormat:@"_SYOutputStreamer: %@", v12];

    id v14 = v13;
    v15 = (const char *)[v14 UTF8String];
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create(v15, v16);
    v18 = (void *)*((void *)v8 + 4);
    *((void *)v8 + 4) = v17;

    objc_storeStrong((id *)v8 + 6, a4);
    [*((id *)v8 + 1) setDelegate:v8];
    objc_initWeak(&location, v8);
    v19 = (void *)*((void *)v8 + 1);
    uint64_t v20 = *((void *)v8 + 4);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __60___SYInputStreamer_initWithCompressedFileURL_callbackQueue___block_invoke;
    v30[3] = &unk_264423EF8;
    objc_copyWeak(&v31, &location);
    objc_msgSend(v19, "_SY_notifyOnQueue:handler:", v20, v30);
    uint64_t v21 = objc_opt_new();
    v22 = (void *)*((void *)v8 + 2);
    *((void *)v8 + 2) = v21;

    dispatch_source_t v23 = dispatch_source_create(MEMORY[0x263EF83B8], 0, 0, *((dispatch_queue_t *)v8 + 4));
    v24 = (void *)*((void *)v8 + 5);
    *((void *)v8 + 5) = v23;

    v25 = *((void *)v8 + 5);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __60___SYInputStreamer_initWithCompressedFileURL_callbackQueue___block_invoke_171;
    handler[3] = &unk_264422C90;
    objc_copyWeak(&v29, &location);
    dispatch_source_set_event_handler(v25, handler);
    [*((id *)v8 + 1) open];
    dispatch_resume(*((dispatch_object_t *)v8 + 5));
    v26 = (_SYInputStreamer *)v8;
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)readDataOfLength:(unint64_t)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = (void *)[a4 copy];
  if ([(SYCompressedFileInputStream *)self->_stream streamStatus] == 5)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v7 = qword_26AB047B0;
    if (os_log_type_enabled((os_log_t)qword_26AB047B0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C7C9000, v7, OS_LOG_TYPE_INFO, "Reached end of input stream.", buf, 2u);
    }
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __48___SYInputStreamer_readDataOfLength_completion___block_invoke;
    block[3] = &unk_264423590;
    id v24 = v6;
    dispatch_async(callbackQueue, block);
    v9 = v24;
LABEL_13:

    goto LABEL_22;
  }
  if ([(SYCompressedFileInputStream *)self->_stream streamStatus] == 6)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    v10 = qword_26AB047B0;
    if (os_log_type_enabled((os_log_t)qword_26AB047B0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C7C9000, v10, OS_LOG_TYPE_INFO, "Stream is closed.", buf, 2u);
    }
    id v11 = self->_callbackQueue;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __48___SYInputStreamer_readDataOfLength_completion___block_invoke_172;
    v21[3] = &unk_264423590;
    id v22 = v6;
    dispatch_async(v11, v21);
    v9 = v22;
    goto LABEL_13;
  }
  if ([(SYCompressedFileInputStream *)self->_stream streamStatus] == 7)
  {
    v12 = [(SYCompressedFileInputStream *)self->_stream streamError];
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    v13 = (void *)qword_26AB047B0;
    if (os_log_type_enabled((os_log_t)qword_26AB047B0, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v13;
      v15 = _SYObfuscate(v12);
      *(_DWORD *)buf = 138543362;
      v26 = v15;
      _os_log_impl(&dword_21C7C9000, v14, OS_LOG_TYPE_DEFAULT, "Stream is in error state: %{public}@", buf, 0xCu);
    }
    v16 = self->_callbackQueue;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __48___SYInputStreamer_readDataOfLength_completion___block_invoke_173;
    v18[3] = &unk_2644235B8;
    id v19 = v12;
    id v20 = v6;
    dispatch_queue_t v17 = v12;
    dispatch_async(v16, v18);
  }
  else
  {
    dispatch_queue_t v17 = [[_SYInputDataItem alloc] initWithLength:a3 callback:v6];
    [(NSMutableArray *)self->_items addObject:v17];
    dispatch_source_merge_data((dispatch_source_t)self->_source, 1uLL);
  }

LABEL_22:
}

- (void)_tryToReadData
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_21C7C9000, v0, v1, "Orphaned data-available event found a stream error.", v2, v3, v4, v5, v6);
}

- (void)_completeAllItemsWithError:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v5 = (void *)qword_26AB047B0;
  if (os_log_type_enabled((os_log_t)qword_26AB047B0, OS_LOG_TYPE_DEFAULT))
  {
    uint8_t v6 = v5;
    id v7 = _SYObfuscate(v4);
    *(_DWORD *)buf = 138543362;
    v26 = v7;
    _os_log_impl(&dword_21C7C9000, v6, OS_LOG_TYPE_DEFAULT, "Completing all stream read items with error '%{public}@'", buf, 0xCu);
  }
  id v8 = (void *)[(NSMutableArray *)self->_items copy];
  [(NSMutableArray *)self->_items removeAllObjects];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        callbackQueue = self->_callbackQueue;
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __47___SYInputStreamer__completeAllItemsWithError___block_invoke;
        v18[3] = &unk_264422990;
        void v18[4] = v14;
        id v19 = v4;
        dispatch_async(callbackQueue, v18);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  id onComplete = self->_onComplete;
  if (onComplete)
  {
    dispatch_async((dispatch_queue_t)self->_callbackQueue, onComplete);
    id v17 = self->_onComplete;
    self->_id onComplete = 0;
  }
}

- (void)whenComplete:(id)a3
{
  dispatch_block_t block = a3;
  if ([(NSMutableArray *)self->_items count])
  {
    id v4 = self;
    objc_sync_enter(v4);
    uint64_t v5 = [block copy];
    id onComplete = v4->_onComplete;
    v4->_id onComplete = (id)v5;

    objc_sync_exit(v4);
  }
  else
  {
    dispatch_async((dispatch_queue_t)self->_callbackQueue, block);
  }
}

- (void)close
{
}

- (void)setStreamProperty:(id)a3 forKey:(id)a4
{
}

- (id)streamPropertyForKey:(id)a3
{
  return [(SYCompressedFileInputStream *)self->_stream propertyForKey:a3];
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 0x10uLL:
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v7 = qword_26AB047B0;
      if (os_log_type_enabled((os_log_t)qword_26AB047B0, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C7C9000, v7, OS_LOG_TYPE_INFO, "Input stream end encountered", buf, 2u);
      }
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __39___SYInputStreamer_stream_handleEvent___block_invoke_175;
      block[3] = &unk_264422AB0;
      void block[4] = self;
      dispatch_async(queue, block);
      break;
    case 8uLL:
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v9 = (void *)qword_26AB047B0;
      if (os_log_type_enabled((os_log_t)qword_26AB047B0, OS_LOG_TYPE_ERROR)) {
        -[_SYInputStreamer stream:handleEvent:](v9, v6);
      }
      uint64_t v10 = self->_queue;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __39___SYInputStreamer_stream_handleEvent___block_invoke;
      v13[3] = &unk_264422990;
      v13[4] = self;
      id v14 = v6;
      dispatch_async(v10, v13);

      break;
    case 2uLL:
      dispatch_source_merge_data((dispatch_source_t)self->_source, 1uLL);
      break;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_onComplete, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

- (void)stream:(void *)a1 handleEvent:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 streamError];
  OUTLINED_FUNCTION_3(&dword_21C7C9000, v5, v6, "Input stream encountered error: %{public}@", v7, v8, v9, v10, 2u);
}

@end