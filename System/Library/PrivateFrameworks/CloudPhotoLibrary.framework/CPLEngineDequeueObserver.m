@interface CPLEngineDequeueObserver
- (CPLEngineDequeueObserver)initWithClientDidAcknowledgeBatchBlock:(id)a3;
- (CPLEngineDequeueObserver)initWithClientWillAcknowledgeBatchBlock:(id)a3 clientDidAcknowledgeBatchBlock:(id)a4 changePipeDidRemoveChanges:(id)a5;
- (CPLEngineDequeueObserver)initWithDequeueSignalBlock:(id)a3;
- (id)changePipeDidRemoveChanges;
- (id)clientDidAcknowledgeBatchBlock;
- (id)clientWillAcknowledgeBatchBlock;
@end

@implementation CPLEngineDequeueObserver

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changePipeDidRemoveChanges, 0);
  objc_storeStrong(&self->_clientDidAcknowledgeBatchBlock, 0);
  objc_storeStrong(&self->_clientWillAcknowledgeBatchBlock, 0);
}

- (id)changePipeDidRemoveChanges
{
  return self->_changePipeDidRemoveChanges;
}

- (id)clientDidAcknowledgeBatchBlock
{
  return self->_clientDidAcknowledgeBatchBlock;
}

- (id)clientWillAcknowledgeBatchBlock
{
  return self->_clientWillAcknowledgeBatchBlock;
}

- (CPLEngineDequeueObserver)initWithDequeueSignalBlock:(id)a3
{
  id v4 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__CPLEngineDequeueObserver_initWithDequeueSignalBlock___block_invoke;
  v12[3] = &unk_1E60A7E18;
  id v13 = v4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__CPLEngineDequeueObserver_initWithDequeueSignalBlock___block_invoke_2;
  v10[3] = &unk_1E60A7E18;
  id v11 = v13;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__CPLEngineDequeueObserver_initWithDequeueSignalBlock___block_invoke_3;
  v8[3] = &unk_1E60A7E40;
  id v9 = v11;
  id v5 = v11;
  v6 = [(CPLEngineDequeueObserver *)self initWithClientWillAcknowledgeBatchBlock:v12 clientDidAcknowledgeBatchBlock:v10 changePipeDidRemoveChanges:v8];

  return v6;
}

uint64_t __55__CPLEngineDequeueObserver_initWithDequeueSignalBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__CPLEngineDequeueObserver_initWithDequeueSignalBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__CPLEngineDequeueObserver_initWithDequeueSignalBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CPLEngineDequeueObserver)initWithClientDidAcknowledgeBatchBlock:(id)a3
{
  return [(CPLEngineDequeueObserver *)self initWithClientWillAcknowledgeBatchBlock:&__block_literal_global_8544 clientDidAcknowledgeBatchBlock:a3 changePipeDidRemoveChanges:&__block_literal_global_88];
}

- (CPLEngineDequeueObserver)initWithClientWillAcknowledgeBatchBlock:(id)a3 clientDidAcknowledgeBatchBlock:(id)a4 changePipeDidRemoveChanges:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CPLEngineDequeueObserver;
  id v11 = [(CPLEngineDequeueObserver *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    id clientWillAcknowledgeBatchBlock = v11->_clientWillAcknowledgeBatchBlock;
    v11->_id clientWillAcknowledgeBatchBlock = (id)v12;

    uint64_t v14 = [v9 copy];
    id clientDidAcknowledgeBatchBlock = v11->_clientDidAcknowledgeBatchBlock;
    v11->_id clientDidAcknowledgeBatchBlock = (id)v14;

    uint64_t v16 = [v10 copy];
    id changePipeDidRemoveChanges = v11->_changePipeDidRemoveChanges;
    v11->_id changePipeDidRemoveChanges = (id)v16;
  }
  return v11;
}

@end