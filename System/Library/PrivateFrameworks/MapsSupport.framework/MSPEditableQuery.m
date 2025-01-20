@interface MSPEditableQuery
- (id)_initWithSource:(id)a3;
- (id)_visibleState;
- (void)_didChangeSourceWithNewState:(id)a3 context:(id)a4 inContainer:(id)a5;
- (void)_performEditWithStateTransformation:(id)a3 containerEdit:(id)a4;
- (void)deleteContentsObjectAtIndex:(unint64_t)a3;
- (void)deleteContentsObjectAtIndexes:(id)a3;
- (void)moveContentsObjectAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
@end

@implementation MSPEditableQuery

- (id)_initWithSource:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MSPEditableQuery;
  v3 = [(MSPQuery *)&v10 _initWithSource:a3];
  if (v3)
  {
    v4 = NSString;
    v5 = [MEMORY[0x1E4F29128] UUID];
    v6 = [v5 UUIDString];
    uint64_t v7 = [v4 stringWithFormat:@"%@%@", @"com.apple.MapsSupport.MSPEditableQuery.context-", v6];
    v8 = (void *)v3[8];
    v3[8] = v7;
  }
  return v3;
}

- (id)_visibleState
{
  v2 = self;
  objc_sync_enter(v2);
  editedState = v2->_editedState;
  if (editedState)
  {
    v4 = editedState;
  }
  else
  {
    v7.receiver = v2;
    v7.super_class = (Class)MSPEditableQuery;
    v4 = [(MSPQuery *)&v7 _visibleState];
  }
  v5 = v4;
  objc_sync_exit(v2);

  return v5;
}

- (void)_didChangeSourceWithNewState:(id)a3 context:(id)a4 inContainer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v9 isEqual:self->_context] & 1) == 0)
  {
    v11 = self;
    objc_sync_enter(v11);
    editedState = v11->_editedState;
    v11->_editedState = 0;

    objc_storeStrong((id *)&v11->_container, a5);
    objc_sync_exit(v11);

    v13.receiver = v11;
    v13.super_class = (Class)MSPEditableQuery;
    [(MSPQuery *)&v13 _didChangeSourceWithNewState:v8 context:v9 inContainer:v10];
  }
}

- (void)_performEditWithStateTransformation:(id)a3 containerEdit:(id)a4
{
  v6 = (void (**)(id, void *))a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = [(MSPEditableQuery *)v8 _visibleState];
  uint64_t v10 = v6[2](v6, v9);
  editedState = v8->_editedState;
  v8->_editedState = (_MSPQueryState *)v10;

  objc_sync_exit(v8);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  objc_initWeak(&location, v8);
  container = v8->_container;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __70__MSPEditableQuery__performEditWithStateTransformation_containerEdit___block_invoke;
  v18[3] = &unk_1E617DE58;
  v20 = v22;
  id v13 = v7;
  id v19 = v13;
  context = v8->_context;
  v15 = [(MSPQuery *)v8 changeHandlerQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __70__MSPEditableQuery__performEditWithStateTransformation_containerEdit___block_invoke_2;
  v16[3] = &unk_1E617DE80;
  objc_copyWeak(&v17, &location);
  v16[4] = v22;
  [(MSPContainer *)container editContentsUsingBarrierBlock:v18 context:context completionQueue:v15 completion:v16];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(v22, 8);
}

uint64_t __70__MSPEditableQuery__performEditWithStateTransformation_containerEdit___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __70__MSPEditableQuery__performEditWithStateTransformation_containerEdit___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3 || !*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      v6 = WeakRetained;
      objc_sync_enter(v6);
      id v7 = (void *)v6[6];
      v6[6] = 0;

      id v8 = [v6 _lastState];
      [v6 _didChangeSourceWithNewState:v8 context:0 inContainer:v6[7]];

      objc_sync_exit(v6);
    }
  }
  else
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      v11 = "-[MSPEditableQuery _performEditWithStateTransformation:containerEdit:]_block_invoke_2";
      __int16 v12 = 1024;
      int v13 = 370;
      _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v10, 0x12u);
    }
  }
}

- (void)deleteContentsObjectAtIndexes:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__2;
  v10[4] = __Block_byref_object_dispose__2;
  id v11 = [MEMORY[0x1E4F1CA48] array];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__MSPEditableQuery_deleteContentsObjectAtIndexes___block_invoke;
  v7[3] = &unk_1E617DED0;
  id v5 = v4;
  id v8 = v5;
  id v9 = v10;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__MSPEditableQuery_deleteContentsObjectAtIndexes___block_invoke_3;
  v6[3] = &unk_1E617DF20;
  v6[4] = v10;
  [(MSPEditableQuery *)self _performEditWithStateTransformation:v7 containerEdit:v6];

  _Block_object_dispose(v10, 8);
}

id __50__MSPEditableQuery_deleteContentsObjectAtIndexes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __50__MSPEditableQuery_deleteContentsObjectAtIndexes___block_invoke_2;
  __int16 v12 = &unk_1E617DEA8;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v13 = v3;
  uint64_t v14 = v4;
  id v6 = v3;
  [v5 enumerateIndexesUsingBlock:&v9];
  id v7 = objc_msgSend(v6, "stateByDeletingObjectsAtIndexes:", *(void *)(a1 + 32), v9, v10, v11, v12);

  return v7;
}

void __50__MSPEditableQuery_deleteContentsObjectAtIndexes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) identifiers];
  id v5 = [v4 objectAtIndexedSubscript:a2];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v5];
}

BOOL __50__MSPEditableQuery_deleteContentsObjectAtIndexes___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__MSPEditableQuery_deleteContentsObjectAtIndexes___block_invoke_4;
  v7[3] = &unk_1E617DEF8;
  void v7[4] = *(void *)(a1 + 32);
  uint64_t v4 = [v3 indexesOfObjectsPassingTest:v7];
  uint64_t v5 = [v4 count];
  if (v5) {
    [v3 removeObjectsAtIndexes:v4];
  }

  return v5 != 0;
}

uint64_t __50__MSPEditableQuery_deleteContentsObjectAtIndexes___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 storageIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (void)deleteContentsObjectAtIndex:(unint64_t)a3
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__2;
  v5[4] = __Block_byref_object_dispose__2;
  id v6 = 0;
  v3[4] = v5;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__MSPEditableQuery_deleteContentsObjectAtIndex___block_invoke;
  v4[3] = &unk_1E617DF48;
  v4[4] = v5;
  v4[5] = a3;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__MSPEditableQuery_deleteContentsObjectAtIndex___block_invoke_2;
  v3[3] = &unk_1E617DF20;
  [(MSPEditableQuery *)self _performEditWithStateTransformation:v4 containerEdit:v3];
  _Block_object_dispose(v5, 8);
}

id __48__MSPEditableQuery_deleteContentsObjectAtIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 identifiers];
  uint64_t v5 = [v4 objectAtIndexedSubscript:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = [v3 stateByDeletingObjectAtIndex:*(void *)(a1 + 40)];

  return v8;
}

BOOL __48__MSPEditableQuery_deleteContentsObjectAtIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__MSPEditableQuery_deleteContentsObjectAtIndex___block_invoke_3;
  v7[3] = &unk_1E617DEF8;
  void v7[4] = *(void *)(a1 + 32);
  uint64_t v4 = [v3 indexesOfObjectsPassingTest:v7];
  uint64_t v5 = [v4 count];
  if (v5) {
    [v3 removeObjectsAtIndexes:v4];
  }

  return v5 != 0;
}

uint64_t __48__MSPEditableQuery_deleteContentsObjectAtIndex___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 storageIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

  return v4;
}

- (void)moveContentsObjectAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__2;
  v8[4] = __Block_byref_object_dispose__2;
  id v9 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__2;
  v6[4] = __Block_byref_object_dispose__2;
  id v7 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__MSPEditableQuery_moveContentsObjectAtIndex_toIndex___block_invoke;
  v5[3] = &unk_1E617DF70;
  v5[4] = v8;
  void v5[5] = v6;
  v5[6] = a3;
  v5[7] = a4;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__MSPEditableQuery_moveContentsObjectAtIndex_toIndex___block_invoke_2;
  v4[3] = &unk_1E617DF98;
  v4[4] = v8;
  v4[5] = v6;
  [(MSPEditableQuery *)self _performEditWithStateTransformation:v5 containerEdit:v4];
  _Block_object_dispose(v6, 8);

  _Block_object_dispose(v8, 8);
}

id __54__MSPEditableQuery_moveContentsObjectAtIndex_toIndex___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 identifiers];
  uint64_t v5 = [v4 objectAtIndexedSubscript:a1[6]];
  uint64_t v6 = *(void *)(a1[4] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = [v3 identifiers];
  uint64_t v9 = [v8 objectAtIndexedSubscript:a1[7]];
  uint64_t v10 = *(void *)(a1[5] + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  __int16 v12 = [v3 stateByMovingObjectAtIndex:a1[6] toIndex:a1[7]];

  return v12;
}

uint64_t __54__MSPEditableQuery_moveContentsObjectAtIndex_toIndex___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    id obj = v3;
    uint64_t v20 = *(void *)v22;
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    while (2)
    {
      uint64_t v9 = 0;
      uint64_t v18 = v5 + v6;
      do
      {
        if (*(void *)v22 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
        id v11 = [v10 storageIdentifier];
        char v12 = [v11 isEqual:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

        if (v12)
        {
          uint64_t v8 = v6 + v9;
        }
        else
        {
          id v13 = [v10 storageIdentifier];
          int v14 = [v13 isEqual:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

          if (v14) {
            uint64_t v7 = v6 + v9;
          }
        }
        if (v8 != 0x7FFFFFFFFFFFFFFFLL && v7 != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v3 = obj;

          v16 = [obj objectAtIndexedSubscript:v8];
          [obj removeObjectAtIndex:v8];
          [obj insertObject:v16 atIndex:v7];
          uint64_t v15 = 1;
          goto LABEL_16;
        }
        ++v9;
      }
      while (v5 != v9);
      id v3 = obj;
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      uint64_t v6 = v18;
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v15 = 0;
  v16 = v3;
LABEL_16:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_container, 0);

  objc_storeStrong((id *)&self->_editedState, 0);
}

@end