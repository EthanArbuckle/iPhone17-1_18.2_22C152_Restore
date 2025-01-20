@interface _SYOutputStreamer
- (BOOL)hasWrittenData;
- (_SYOutputStreamer)initWithCompressedFileURL:(id)a3 callbackQueue:(id)a4;
- (id)_getCompletionBlock;
- (id)streamPropertyForKey:(id)a3;
- (void)_completeAllItemsWithError:(id)a3;
- (void)_tryToSendData;
- (void)close;
- (void)setStreamProperty:(id)a3 forKey:(id)a4;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)whenComplete:(id)a3;
- (void)writeData:(id)a3 completion:(id)a4;
@end

@implementation _SYOutputStreamer

- (_SYOutputStreamer)initWithCompressedFileURL:(id)a3 callbackQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)_SYOutputStreamer;
  id v8 = [(_SYOutputStreamer *)&v33 init];
  if (v8
    && (id v9 = [[SYCompressedFileOutputStream alloc] initToCompressedFileAtURL:v6 shouldAppend:0], v10 = (void *)*((void *)v8 + 1), *((void *)v8 + 1) = v9, v10, *((void *)v8 + 1)))
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
    v30[2] = __61___SYOutputStreamer_initWithCompressedFileURL_callbackQueue___block_invoke;
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
    handler[2] = __61___SYOutputStreamer_initWithCompressedFileURL_callbackQueue___block_invoke_56;
    handler[3] = &unk_264422C90;
    objc_copyWeak(&v29, &location);
    dispatch_source_set_event_handler(v25, handler);
    [*((id *)v8 + 1) open];
    dispatch_resume(*((dispatch_object_t *)v8 + 5));
    v26 = (_SYOutputStreamer *)v8;
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

- (id)_getCompletionBlock
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x21D4B17C0](v2->_onComplete);
  id onComplete = v2->_onComplete;
  v2->_id onComplete = 0;

  objc_sync_exit(v2);
  v5 = (void *)MEMORY[0x21D4B17C0](v3);

  return v5;
}

- (void)writeData:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a4;
  stream = self->_stream;
  id v8 = a3;
  if ([(SYCompressedFileOutputStream *)stream streamStatus] == 6)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v9 = qword_26AB047B0;
    if (os_log_type_enabled((os_log_t)qword_26AB047B0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = self;
      _os_log_impl(&dword_21C7C9000, v9, OS_LOG_TYPE_DEFAULT, "Streamer %{public}@ writing to a closed stream", buf, 0xCu);
    }
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __42___SYOutputStreamer_writeData_completion___block_invoke;
    block[3] = &unk_264423590;
    id v24 = v6;
    dispatch_async(callbackQueue, block);
    id v11 = v24;
LABEL_13:

    goto LABEL_14;
  }
  if ([(SYCompressedFileOutputStream *)self->_stream streamStatus] == 7)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    v12 = (void *)qword_26AB047B0;
    if (os_log_type_enabled((os_log_t)qword_26AB047B0, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_stream;
      id v14 = v12;
      v15 = [(SYCompressedFileOutputStream *)v13 streamError];
      v16 = _SYObfuscate(v15);
      *(_DWORD *)buf = 138543618;
      v26 = self;
      __int16 v27 = 2114;
      v28 = v16;
      _os_log_impl(&dword_21C7C9000, v14, OS_LOG_TYPE_DEFAULT, "Streamer %{public}@ writing to a stream in error state. Error = %{public}@", buf, 0x16u);
    }
    dispatch_queue_t v17 = [(SYCompressedFileOutputStream *)self->_stream streamError];
    v18 = self->_callbackQueue;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __42___SYOutputStreamer_writeData_completion___block_invoke_59;
    v20[3] = &unk_2644235B8;
    id v21 = v17;
    id v22 = v6;
    id v11 = v17;
    dispatch_async(v18, v20);

    goto LABEL_13;
  }
LABEL_14:
  v19 = objc_opt_new();
  [v19 setData:v8];

  [v19 setCallback:v6];
  [(NSMutableArray *)self->_items addObject:v19];
  dispatch_source_merge_data((dispatch_source_t)self->_source, 1uLL);
}

- (void)_tryToSendData
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  _os_log_debug_impl(&dword_21C7C9000, log, OS_LOG_TYPE_DEBUG, "Wrote %ld bytes to stream %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)_completeAllItemsWithError:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  __int16 v5 = self->_items;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        callbackQueue = self->_callbackQueue;
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __48___SYOutputStreamer__completeAllItemsWithError___block_invoke;
        v13[3] = &unk_264422990;
        v13[4] = v10;
        id v14 = v4;
        dispatch_async(callbackQueue, v13);
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_items removeAllObjects];
  v12 = [(_SYOutputStreamer *)self _getCompletionBlock];
  if (v12)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB047B0, OS_LOG_TYPE_DEBUG)) {
      -[_SYOutputStreamer _tryToSendData]();
    }
    dispatch_async((dispatch_queue_t)self->_callbackQueue, v12);
  }
}

- (void)whenComplete:(id)a3
{
  items = self->_items;
  id block = a3;
  if ([(NSMutableArray *)items count])
  {
    __int16 v5 = (void *)[block copy];

    id onComplete = self->_onComplete;
    self->_id onComplete = v5;
  }
  else
  {
    dispatch_async((dispatch_queue_t)self->_callbackQueue, block);
    id onComplete = block;
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
  return [(SYCompressedFileOutputStream *)self->_stream propertyForKey:a3];
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4 == 8)
  {
    queue = self->_queue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __40___SYOutputStreamer_stream_handleEvent___block_invoke;
    v9[3] = &unk_264422990;
    v9[4] = self;
    id v10 = v6;
    dispatch_async(queue, v9);
  }
  else if (a4 == 4)
  {
    dispatch_source_merge_data((dispatch_source_t)self->_source, 1uLL);
  }
}

- (BOOL)hasWrittenData
{
  return self->_hasWrittenData;
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

@end