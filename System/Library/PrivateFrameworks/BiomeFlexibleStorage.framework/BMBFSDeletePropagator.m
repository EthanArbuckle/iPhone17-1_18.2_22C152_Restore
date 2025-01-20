@interface BMBFSDeletePropagator
- (BMBFSDeletePropagator)initWithStreamId:(id)a3;
- (BMBFSDeletePropagator)initWithStreamId:(id)a3 registrar:(id)a4;
- (BMRegistrar)registrar;
- (BOOL)shouldHandleDeletions;
- (NSMutableArray)prunedIdentifiables;
- (NSString)streamId;
- (OS_dispatch_queue)queue;
- (void)didPruneEvents;
- (void)setPrunedIdentifiables:(id)a3;
- (void)shouldHandleDeletions;
- (void)willPruneEvent:(id)a3;
@end

@implementation BMBFSDeletePropagator

- (BMBFSDeletePropagator)initWithStreamId:(id)a3
{
  return [(BMBFSDeletePropagator *)self initWithStreamId:a3 registrar:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prunedIdentifiables, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_streamId, 0);
  objc_storeStrong((id *)&self->_registrar, 0);
}

- (BMBFSDeletePropagator)initWithStreamId:(id)a3 registrar:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BMBFSDeletePropagator;
  v9 = [(BMBFSDeletePropagator *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_streamId, a3);
    objc_storeStrong((id *)&v10->_registrar, a4);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.Biome.BFS.BMBFSDeletePropagator", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;
  }
  if ([(BMBFSDeletePropagator *)v10 shouldHandleDeletions]) {
    v14 = v10;
  }
  else {
    v14 = 0;
  }

  return v14;
}

- (BOOL)shouldHandleDeletions
{
  v3 = +[BMRegistrar managedStreamIdentifiers];
  char v4 = [v3 containsObject:self->_streamId];

  if (v4)
  {
    v5 = [(BMBFSDeletePropagator *)self registrar];

    if (v5)
    {
      v6 = [(BMBFSDeletePropagator *)self registrar];
      id v7 = [v6 streamRegistrationCounts];
      id v8 = [(BMBFSDeletePropagator *)self streamId];
      v9 = [v7 objectForKey:v8];

      if (v9) {
        return 1;
      }
      v11 = __biome_log_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[BMBFSDeletePropagator shouldHandleDeletions](self);
      }
    }
    else
    {
      v11 = __biome_log_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[BMBFSDeletePropagator shouldHandleDeletions](self);
      }
    }
  }
  else
  {
    v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[BMBFSDeletePropagator shouldHandleDeletions](self);
    }
  }

  return 0;
}

- (BMRegistrar)registrar
{
  registrar = self->_registrar;
  if (!registrar)
  {
    char v4 = +[BMRegistrar centralRegistrar];
    v5 = self->_registrar;
    self->_registrar = v4;

    registrar = self->_registrar;
  }
  return registrar;
}

- (NSString)streamId
{
  return self->_streamId;
}

- (void)willPruneEvent:(id)a3
{
  id v4 = a3;
  v5 = [(BMBFSDeletePropagator *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__BMBFSDeletePropagator_willPruneEvent___block_invoke;
  v7[3] = &unk_1E617A2A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __40__BMBFSDeletePropagator_willPruneEvent___block_invoke(uint64_t a1)
{
  v2 = __biome_log_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __40__BMBFSDeletePropagator_willPruneEvent___block_invoke_cold_1(a1);
  }

  v3 = [*(id *)(a1 + 32) prunedIdentifiables];

  if (!v3)
  {
    id v4 = objc_opt_new();
    [*(id *)(a1 + 32) setPrunedIdentifiables:v4];
  }
  uint64_t v5 = [*(id *)(a1 + 40) eventBody];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [*(id *)(a1 + 40) eventBody];
    int v8 = [v7 conformsToProtocol:&unk_1F11F5470];

    if (v8)
    {
      v9 = [*(id *)(a1 + 40) eventBody];
      v10 = [v9 identifier];

      v11 = [*(id *)(a1 + 32) prunedIdentifiables];
      [v11 addObject:v10];
    }
  }
  dispatch_queue_t v12 = [*(id *)(a1 + 32) prunedIdentifiables];
  unint64_t v13 = [v12 count];

  if (v13 >= 0x3E9)
  {
    v14 = [*(id *)(a1 + 32) registrar];
    v15 = [*(id *)(a1 + 32) streamId];
    objc_super v16 = [*(id *)(a1 + 32) prunedIdentifiables];
    [v14 propagateDeletionOfEventsInStream:v15 withIdentifiers:v16];

    [*(id *)(a1 + 32) setPrunedIdentifiables:0];
  }
}

- (void)didPruneEvents
{
  v3 = [(BMBFSDeletePropagator *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__BMBFSDeletePropagator_didPruneEvents__block_invoke;
  block[3] = &unk_1E617A278;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __39__BMBFSDeletePropagator_didPruneEvents__block_invoke(uint64_t a1)
{
  v2 = __biome_log_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __39__BMBFSDeletePropagator_didPruneEvents__block_invoke_cold_1(a1);
  }

  v3 = [*(id *)(a1 + 32) prunedIdentifiables];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) registrar];
    id v6 = [*(id *)(a1 + 32) streamId];
    id v7 = [*(id *)(a1 + 32) prunedIdentifiables];
    [v5 propagateDeletionOfEventsInStream:v6 withIdentifiers:v7];
  }
  return [*(id *)(a1 + 32) setPrunedIdentifiables:0];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableArray)prunedIdentifiables
{
  return self->_prunedIdentifiables;
}

- (void)setPrunedIdentifiables:(id)a3
{
}

- (void)shouldHandleDeletions
{
  v1 = [a1 streamId];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1B87BE000, v2, v3, "Not propagating deletions of %@ via BMRegistrar it is not a BFS-managed stream", v4, v5, v6, v7, v8);
}

void __40__BMBFSDeletePropagator_willPruneEvent___block_invoke_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) streamId];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1B87BE000, v2, v3, "Received willPruneEvent for stream: %@ with event: %@", v4, v5, v6, v7, v8);
}

void __39__BMBFSDeletePropagator_didPruneEvents__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) streamId];
  v9 = [*(id *)(a1 + 32) prunedIdentifiables];
  OUTLINED_FUNCTION_1_0(&dword_1B87BE000, v3, v4, "Received didPruneEvents for stream: %@ with identifiables: %@", v5, v6, v7, v8, 2u);
}

@end