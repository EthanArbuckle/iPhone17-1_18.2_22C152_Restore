@interface IPXPCEventStateUpdateStream
- (IPXPCEventStateUpdateStream)initWithStreamName:(id)a3 queue:(id)a4;
- (id)sink;
- (id)source;
@end

@implementation IPXPCEventStateUpdateStream

- (IPXPCEventStateUpdateStream)initWithStreamName:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IPXPCEventStateUpdateStream;
  v8 = [(IPXPCEventStateUpdateStream *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    streamName = v8->_streamName;
    v8->_streamName = (NSString *)v9;

    objc_storeStrong((id *)&v8->_queue, a4);
    v8->_lock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (id)sink
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  uint64_t v9 = __Block_byref_object_dispose__1;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__IPXPCEventStateUpdateStream_sink__block_invoke;
  v4[3] = &unk_26538F890;
  v4[4] = self;
  v4[5] = &v5;
  IPDoWithLock(&self->_lock, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __35__IPXPCEventStateUpdateStream_sink__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v2)
  {
    v3 = [[IPXPCEventStateUpdateStreamSink alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 32) streamName:*(void *)(*(void *)(a1 + 32) + 8)];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 24);
  }
  id v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v6, v2);
}

- (id)source
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  uint64_t v9 = __Block_byref_object_dispose__1;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__IPXPCEventStateUpdateStream_source__block_invoke;
  v4[3] = &unk_26538F890;
  v4[4] = self;
  v4[5] = &v5;
  IPDoWithLock(&self->_lock, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __37__IPXPCEventStateUpdateStream_source__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    v3 = [[IPXPCEventStateUpdateStreamSource alloc] initWithQueue:*(void *)(*(void *)(a1 + 32) + 32) streamName:*(void *)(*(void *)(a1 + 32) + 8)];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  id v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v6, v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_streamName, 0);
}

@end