@interface IPLocalStateUpdateStream
- (IPLocalStateUpdateStream)initWithSourceDeliveryQueue:(id)a3;
- (id)sink;
- (id)source;
- (void)sink:(id)a3 sendMessage:(id)a4;
@end

@implementation IPLocalStateUpdateStream

- (IPLocalStateUpdateStream)initWithSourceDeliveryQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IPLocalStateUpdateStream;
  v6 = [(IPLocalStateUpdateStream *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_asyncDeliveryQueue, a3);
    v8 = [[IPLocalStateUpdateStreamSource alloc] initWithUpdateStream:v7];
    source = v7->_source;
    v7->_source = v8;

    v10 = [[IPLocalStateUpdateStreamSink alloc] initWithUpdateStream:v7];
    sink = v7->_sink;
    v7->_sink = v10;
  }
  return v7;
}

- (id)sink
{
  return self->_sink;
}

- (id)source
{
  return self->_source;
}

- (void)sink:(id)a3 sendMessage:(id)a4
{
  id v5 = a4;
  asyncDeliveryQueue = self->_asyncDeliveryQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__IPLocalStateUpdateStream_sink_sendMessage___block_invoke;
  v8[3] = &unk_26538F700;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(asyncDeliveryQueue, v8);
}

uint64_t __45__IPLocalStateUpdateStream_sink_sendMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) stream:*(void *)(a1 + 32) receiveMessage:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_asyncDeliveryQueue, 0);
}

@end