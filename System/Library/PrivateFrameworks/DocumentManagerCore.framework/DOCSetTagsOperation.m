@interface DOCSetTagsOperation
- (DOCSetTagsOperation)initWithItems:(id)a3 tagsLists:(id)a4 isUndoable:(BOOL)a5 shouldClearUndoStack:(BOOL)a6 undoManager:(id)a7;
- (DOCUndoManager)undoManager;
- (NSArray)oldTagsLists;
- (NSArray)updatedTagsLists;
- (NSString)actionNameForUndoing;
- (id)currentItems;
- (id)currentTagsLists;
- (id)itemIDsFromItems:(id)a3;
- (id)itemsFromItemIDs:(id)a3;
- (id)operationForRedoing;
- (id)operationForUndoing;
- (id)operationItemIDs;
- (id)tagsListsFromItems:(id)a3;
- (void)clearUndoStack;
- (void)registerUndo;
@end

@implementation DOCSetTagsOperation

- (DOCSetTagsOperation)initWithItems:(id)a3 tagsLists:(id)a4 isUndoable:(BOOL)a5 shouldClearUndoStack:(BOOL)a6 undoManager:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v13 = a4;
  id v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)DOCSetTagsOperation;
  v15 = [(FPSetTagsOperation *)&v20 initWithItems:a3 tagsLists:v13];
  v16 = v15;
  if (v15)
  {
    uint64_t v17 = [(DOCSetTagsOperation *)v15 currentTagsLists];
    oldTagsLists = v16->_oldTagsLists;
    v16->_oldTagsLists = (NSArray *)v17;

    objc_storeStrong((id *)&v16->_updatedTagsLists, a4);
    objc_storeStrong((id *)&v16->_undoManager, a7);
    if (v9)
    {
      [(DOCSetTagsOperation *)v16 registerUndo];
    }
    else if (v8)
    {
      [(DOCSetTagsOperation *)v16 clearUndoStack];
    }
  }

  return v16;
}

- (NSString)actionNameForUndoing
{
  v3 = _DocumentManagerBundle();
  v4 = [v3 localizedStringForKey:@"Edit Tags of “%@” [undo / redo command]" value:@"Edit Tags of “%@”" table:@"Localizable"];

  v5 = _DocumentManagerBundle();
  v6 = [v5 localizedStringForKey:@"Edit Tags of %lu Items [undo / redo command]" value:@"Edit Tags of %lu Items [undo / redo command]" table:@"Localizable"];

  v7 = [(FPTransformOperation *)self items];
  uint64_t v8 = [v7 count];

  BOOL v9 = [(FPTransformOperation *)self items];
  v10 = [v9 firstObject];
  v11 = [v10 displayName];

  if (v8 == 1) {
    objc_msgSend(NSString, "localizedStringWithFormat:", v4, v11);
  }
  else {
  v12 = objc_msgSend(NSString, "localizedStringWithFormat:", v6, v8);
  }

  return (NSString *)v12;
}

- (id)operationForRedoing
{
  v3 = [(DOCSetTagsOperation *)self currentItems];
  if ([v3 count]
    && (uint64_t v4 = [v3 count],
        [(FPTransformOperation *)self items],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v4 == v6))
  {
    v7 = [DOCSetTagsOperation alloc];
    uint64_t v8 = [(DOCSetTagsOperation *)self updatedTagsLists];
    BOOL v9 = [(DOCSetTagsOperation *)self undoManager];
    v10 = [(DOCSetTagsOperation *)v7 initWithItems:v3 tagsLists:v8 isUndoable:1 shouldClearUndoStack:0 undoManager:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)operationForUndoing
{
  v3 = [(DOCSetTagsOperation *)self currentItems];
  if ([v3 count]
    && (uint64_t v4 = [v3 count],
        [(FPTransformOperation *)self items],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v4 == v6))
  {
    v7 = [DOCSetTagsOperation alloc];
    uint64_t v8 = [(DOCSetTagsOperation *)self oldTagsLists];
    BOOL v9 = [(DOCSetTagsOperation *)self undoManager];
    v10 = [(DOCSetTagsOperation *)v7 initWithItems:v3 tagsLists:v8 isUndoable:1 shouldClearUndoStack:0 undoManager:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)registerUndo
{
  id v3 = [(DOCSetTagsOperation *)self undoManager];
  [v3 registerUndoOperationForSender:self];
}

- (void)clearUndoStack
{
  id v2 = [(DOCSetTagsOperation *)self undoManager];
  [v2 removeAllActions];
}

- (id)currentItems
{
  id v3 = [(DOCSetTagsOperation *)self operationItemIDs];
  uint64_t v4 = [(DOCSetTagsOperation *)self itemsFromItemIDs:v3];

  return v4;
}

- (id)operationItemIDs
{
  id v3 = [(FPTransformOperation *)self items];
  uint64_t v4 = [(DOCSetTagsOperation *)self itemIDsFromItems:v3];

  return v4;
}

- (id)itemIDsFromItems:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "itemID", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)itemsFromItemIDs:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v10 = [(FPActionOperation *)self itemManager];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __40__DOCSetTagsOperation_itemsFromItemIDs___block_invoke;
        v16[3] = &unk_2641B5B78;
        v18 = &v23;
        v11 = v5;
        uint64_t v17 = v11;
        [v10 fetchItemForItemID:v9 completionHandler:v16];

        dispatch_time_t v12 = dispatch_time(0, 1000000000);
        dispatch_semaphore_wait(v11, v12);
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v6);
  }

  id v13 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v13;
}

intptr_t __40__DOCSetTagsOperation_itemsFromItemIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:a2];
  }
  id v3 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v3);
}

- (id)currentTagsLists
{
  id v3 = [(FPTransformOperation *)self items];
  id v4 = [(DOCSetTagsOperation *)self tagsListsFromItems:v3];

  return v4;
}

- (id)tagsListsFromItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    uint64_t v9 = MEMORY[0x263EFFA68];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        dispatch_time_t v12 = objc_msgSend(v11, "tags", (void)v15);

        if (v12)
        {
          id v13 = [v11 tags];
          [v4 addObject:v13];
        }
        else
        {
          [v4 addObject:v9];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSArray)oldTagsLists
{
  return self->_oldTagsLists;
}

- (NSArray)updatedTagsLists
{
  return self->_updatedTagsLists;
}

- (DOCUndoManager)undoManager
{
  return self->_undoManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_updatedTagsLists, 0);
  objc_storeStrong((id *)&self->_oldTagsLists, 0);
}

@end