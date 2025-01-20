@interface MSPQuery
- (NSArray)contents;
- (NSArray)unmappedContents;
- (OS_dispatch_queue)changeHandlerQueue;
- (_MSPQueryState)_lastState;
- (id)_initWithSource:(id)a3;
- (id)changeHandler;
- (id)originalIdentifierForObject:(id)a3;
- (id)originalIdentifierForObjectAtIndex:(unint64_t)a3;
- (void)_didChangeSourceWithNewState:(id)a3 context:(id)a4 inContainer:(id)a5;
- (void)_setLastState:(id)a3;
- (void)setChangeHandler:(id)a3 queue:(id)a4;
@end

@implementation MSPQuery

- (id)_initWithSource:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSPQuery;
  v6 = [(MSPQuery *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_source, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.MSPQuery.SerialQueue", v8);
    changeHandlerQueue = v7->_changeHandlerQueue;
    v7->_changeHandlerQueue = (OS_dispatch_queue *)v9;

    [(MSPQuerySource *)v7->_source _addObserver:v7];
  }

  return v7;
}

- (void)_didChangeSourceWithNewState:(id)a3 context:(id)a4 inContainer:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  dispatch_queue_t v9 = self;
  objc_sync_enter(v9);
  v10 = v9->_changeHandlerQueue;
  v11 = (void *)MEMORY[0x1BA9C2AF0](v9->_changeHandler);
  objc_sync_exit(v9);

  if (v11)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__MSPQuery__didChangeSourceWithNewState_context_inContainer___block_invoke;
    v12[3] = &unk_1E617DE30;
    v12[4] = v9;
    id v13 = v7;
    id v15 = v11;
    id v14 = v8;
    dispatch_async(v10, v12);
  }
  else
  {
    [(MSPQuery *)v9 _setLastState:v7];
  }
}

void __61__MSPQuery__didChangeSourceWithNewState_context_inContainer___block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  [*(id *)(a1 + 32) _setLastState:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 32), *(void *)(a1 + 48));
  }
  objc_sync_exit(obj);
}

- (_MSPQueryState)_lastState
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_lastState;
  objc_sync_exit(v2);

  return v3;
}

- (void)_setLastState:(id)a3
{
  v4 = (_MSPQueryState *)a3;
  id obj = self;
  objc_sync_enter(obj);
  lastState = obj->_lastState;
  obj->_lastState = v4;

  objc_sync_exit(obj);
}

- (NSArray)contents
{
  uint64_t v2 = [(MSPQuery *)self _visibleState];
  v3 = [v2 contents];

  return (NSArray *)v3;
}

- (id)originalIdentifierForObject:(id)a3
{
  id v4 = a3;
  id v5 = [(MSPQuery *)self _visibleState];
  v6 = v5;
  if (v5
    && ([v5 contents],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 indexOfObject:v4],
        v7,
        v8 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v10 = [v6 identifiers];
    dispatch_queue_t v9 = [v10 objectAtIndexedSubscript:v8];
  }
  else
  {
    dispatch_queue_t v9 = 0;
  }

  return v9;
}

- (id)originalIdentifierForObjectAtIndex:(unint64_t)a3
{
  id v4 = [(MSPQuery *)self _visibleState];
  id v5 = [v4 identifiers];
  v6 = [v5 objectAtIndexedSubscript:a3];

  return v6;
}

- (void)setChangeHandler:(id)a3 queue:(id)a4
{
  id v6 = a3;
  dispatch_queue_t v7 = (dispatch_queue_t)a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  uint64_t v9 = [v6 copy];
  id changeHandler = v8->_changeHandler;
  v8->_id changeHandler = (id)v9;

  if (!v6)
  {
    changeHandlerQueue = v8->_changeHandlerQueue;
    v8->_changeHandlerQueue = 0;
    goto LABEL_7;
  }
  if (!v7)
  {
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.MSPQuery.SerialQueue", v11);
  }
  objc_storeStrong((id *)&v8->_changeHandlerQueue, v7);
  if (v7)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __35__MSPQuery_setChangeHandler_queue___block_invoke;
    v13[3] = &unk_1E617D7A0;
    v13[4] = v8;
    id v14 = (OS_dispatch_queue *)v6;
    dispatch_async(v7, v13);
    changeHandlerQueue = v14;
LABEL_7:
  }
  objc_sync_exit(v8);
}

uint64_t __35__MSPQuery_setChangeHandler_queue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (OS_dispatch_queue)changeHandlerQueue
{
  return self->_changeHandlerQueue;
}

- (NSArray)unmappedContents
{
  return self->_unmappedContents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unmappedContents, 0);
  objc_storeStrong((id *)&self->_changeHandlerQueue, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_lastState, 0);
}

@end