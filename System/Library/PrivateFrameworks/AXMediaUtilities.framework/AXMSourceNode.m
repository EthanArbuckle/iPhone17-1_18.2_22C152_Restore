@interface AXMSourceNode
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldProcessRemotely;
- (id)resultHandlers;
- (void)_nodeQueue_addResultHandler:(id)a3;
- (void)_nodeQueue_removeAllResultHandlers;
- (void)_nodeQueue_removeResultHandler:(id)a3;
- (void)addResultHandler:(id)a3;
- (void)nodeInitialize;
- (void)removeAllResultHandlers;
- (void)removeResultHandler:(id)a3;
- (void)setShouldProcessRemotely:(BOOL)a3;
- (void)triggerWithContext:(id)a3 cacheKey:(id)a4 resultHandler:(id)a5;
@end

@implementation AXMSourceNode

- (void)nodeInitialize
{
  v5.receiver = self;
  v5.super_class = (Class)AXMSourceNode;
  [(AXMVisionEngineNode *)&v5 nodeInitialize];
  v3 = [MEMORY[0x1E4F1CA48] array];
  nodeQueue_resultHandlers = self->_nodeQueue_resultHandlers;
  self->_nodeQueue_resultHandlers = v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)resultHandlers
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__12;
  v11 = __Block_byref_object_dispose__12;
  id v12 = 0;
  v3 = [(AXMVisionEngineNode *)self nodeQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__AXMSourceNode_resultHandlers__block_invoke;
  v6[3] = &unk_1E6116EC0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __31__AXMSourceNode_resultHandlers__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)addResultHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = [(AXMVisionEngineNode *)self nodeQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __34__AXMSourceNode_addResultHandler___block_invoke;
    v6[3] = &unk_1E6116A50;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(v5, v6);
  }
}

uint64_t __34__AXMSourceNode_addResultHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_nodeQueue_addResultHandler:", *(void *)(a1 + 40));
}

- (void)_nodeQueue_addResultHandler:(id)a3
{
  nodeQueue_resultHandlers = self->_nodeQueue_resultHandlers;
  id v4 = (id)MEMORY[0x1BA9A1340](a3, a2);
  [(NSMutableArray *)nodeQueue_resultHandlers addObject:v4];
}

- (void)removeResultHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = [(AXMVisionEngineNode *)self nodeQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37__AXMSourceNode_removeResultHandler___block_invoke;
    v6[3] = &unk_1E6116A50;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(v5, v6);
  }
}

uint64_t __37__AXMSourceNode_removeResultHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_nodeQueue_removeResultHandler:", *(void *)(a1 + 40));
}

- (void)_nodeQueue_removeResultHandler:(id)a3
{
  nodeQueue_resultHandlers = self->_nodeQueue_resultHandlers;
  id v4 = (id)MEMORY[0x1BA9A1340](a3, a2);
  [(NSMutableArray *)nodeQueue_resultHandlers removeObject:v4];
}

- (void)removeAllResultHandlers
{
  uint64_t v3 = [(AXMVisionEngineNode *)self nodeQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__AXMSourceNode_removeAllResultHandlers__block_invoke;
  block[3] = &unk_1E6117090;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __40__AXMSourceNode_removeAllResultHandlers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_nodeQueue_removeAllResultHandlers");
}

- (void)_nodeQueue_removeAllResultHandlers
{
}

- (void)triggerWithContext:(id)a3 cacheKey:(id)a4 resultHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if (![(AXMVisionEngineNode *)self isConnected])
  {
    v11 = AXMediaLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[AXMSourceNode triggerWithContext:cacheKey:resultHandler:](v11);
    }
  }
  objc_msgSend(v10, "setShouldProcessRemotely:", -[AXMSourceNode shouldProcessRemotely](self, "shouldProcessRemotely"));
  [v10 setCacheKey:v9];

  [v10 addResultHandler:v8];
  id v12 = [(AXMSourceNode *)self resultHandlers];
  [v10 addResultHandlers:v12];

  v13 = [(AXMVisionEngineNode *)self delegate];
  [v13 triggerWithSource:self context:v10];
}

- (BOOL)shouldProcessRemotely
{
  return self->_shouldProcessRemotely;
}

- (void)setShouldProcessRemotely:(BOOL)a3
{
  self->_shouldProcessRemotely = a3;
}

- (void).cxx_destruct
{
}

- (void)triggerWithContext:(os_log_t)log cacheKey:resultHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B57D5000, log, OS_LOG_TYPE_FAULT, "Source node not connected to any engine", v1, 2u);
}

@end