@interface IPLocalStateUpdateStreamSink
- (IPLocalStateUpdateStreamSink)initWithUpdateStream:(id)a3;
- (void)resume;
- (void)sendUpdateMessage:(id)a3;
@end

@implementation IPLocalStateUpdateStreamSink

- (IPLocalStateUpdateStreamSink)initWithUpdateStream:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IPLocalStateUpdateStreamSink;
  v5 = [(IPLocalStateUpdateStreamSink *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_weakStream, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    queuedUpdateMessages = v6->_queuedUpdateMessages;
    v6->_queuedUpdateMessages = v7;

    v6->_resumptionLock._os_unfair_lock_opaque = 0;
    v6->_resumed = 0;
  }

  return v6;
}

- (void)resume
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __38__IPLocalStateUpdateStreamSink_resume__block_invoke;
  v2[3] = &unk_26538F930;
  v2[4] = self;
  IPDoWithLock(&self->_resumptionLock, v2);
}

void __38__IPLocalStateUpdateStreamSink_resume__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * v6);
        id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
        objc_msgSend(WeakRetained, "sink:sendMessage:", *(void *)(a1 + 32), v7, (void)v11);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  objc_super v10 = *(void **)(v9 + 16);
  *(void *)(v9 + 16) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 28) = 1;
}

- (void)sendUpdateMessage:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__IPLocalStateUpdateStreamSink_sendUpdateMessage___block_invoke;
  v7[3] = &unk_26538F700;
  p_resumptionLock = &self->_resumptionLock;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  IPDoWithLock(p_resumptionLock, v7);
}

void __50__IPLocalStateUpdateStreamSink_sendUpdateMessage___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 28))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 8));
    [WeakRetained sink:*(void *)(a1 + 32) sendMessage:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v3 = *(void **)(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 addObject:v4];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedUpdateMessages, 0);

  objc_destroyWeak((id *)&self->_weakStream);
}

@end