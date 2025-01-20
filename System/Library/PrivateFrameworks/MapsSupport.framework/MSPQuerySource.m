@interface MSPQuerySource
- (id)_container;
- (id)_initWithOwningContainer:(id)a3;
- (id)_initWithParentSource:(id)a3 preprocessingBlock:(id)a4 mappingBlock:(id)a5;
- (id)newEditableQuery;
- (id)newQuery;
- (id)sourceByMappingContentsUsingBlock:(id)a3;
- (id)sourceByMappingContentsUsingPreprocessingBlock:(id)a3 mappingBlock:(id)a4;
- (void)_addObserver:(id)a3;
- (void)_didChangeSourceWithNewState:(id)a3 context:(id)a4 inContainer:(id)a5;
- (void)_didReceiveContainerContents:(id)a3 context:(id)a4;
- (void)_removeObserver:(id)a3;
- (void)container:(id)a3 didEditWithNewContents:(id)a4 orderedEdits:(id)a5 cause:(int64_t)a6 context:(id)a7;
@end

@implementation MSPQuerySource

- (id)_initWithOwningContainer:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MSPQuerySource;
  v5 = [(MSPQuerySource *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_owningContainer, v4);
    uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    id v9 = v4;
    [v9 addObserver:v6];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __43__MSPQuerySource__initWithOwningContainer___block_invoke;
    v11[3] = &unk_1E617DDE0;
    v12 = v6;
    [v9 accessContentsUsingConcurrentBlock:v11];
  }
  return v6;
}

uint64_t __43__MSPQuerySource__initWithOwningContainer___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _didReceiveContainerContents:a2 context:0];
}

- (id)_initWithParentSource:(id)a3 preprocessingBlock:(id)a4 mappingBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MSPQuerySource;
  v12 = [(MSPQuerySource *)&v21 init];
  objc_super v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_parentSource, a3);
    uint64_t v14 = [v10 copy];
    id preprocessingBlock = v13->_preprocessingBlock;
    v13->_id preprocessingBlock = (id)v14;

    uint64_t v16 = [v11 copy];
    id mappingBlock = v13->_mappingBlock;
    v13->_id mappingBlock = (id)v16;

    uint64_t v18 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v18;

    [(MSPQuerySource *)v13->_parentSource _addObserver:v13];
  }

  return v13;
}

- (void)_addObserver:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_observers addObject:v7];
  v5 = v4->_state;
  objc_sync_exit(v4);

  if (v5)
  {
    v6 = [(MSPQuerySource *)v4 _container];
    [v7 _didChangeSourceWithNewState:v5 context:0 inContainer:v6];
  }
}

- (id)_container
{
  parentSource = self->_parentSource;
  if (parentSource)
  {
    WeakRetained = [(MSPQuerySource *)parentSource _container];
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_owningContainer);
  }

  return WeakRetained;
}

- (void)_removeObserver:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_observers removeObject:v5];
  objc_sync_exit(v4);
}

- (void)container:(id)a3 didEditWithNewContents:(id)a4 orderedEdits:(id)a5 cause:(int64_t)a6 context:(id)a7
{
}

- (void)_didReceiveContainerContents:(id)a3 context:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  id v9 = [[_MSPQueryState alloc] initWithContainerContents:v6];
  objc_storeStrong((id *)&v8->_state, v9);
  id v10 = [(NSHashTable *)v8->_observers allObjects];
  id v11 = (void *)[v10 copy];

  objc_sync_exit(v8);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void **)(*((void *)&v18 + 1) + 8 * v15);
        v17 = [(MSPQuerySource *)v8 _container];
        [v16 _didChangeSourceWithNewState:v9 context:v7 inContainer:v17];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
}

- (void)_didChangeSourceWithNewState:(id)a3 context:(id)a4 inContainer:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  objc_sync_enter(v11);
  id v12 = [v8 stateByInvokingPreprocessingBlock:v11->_preprocessingBlock mappingBlock:v11->_mappingBlock];
  objc_storeStrong((id *)&v11->_state, v12);
  uint64_t v13 = [(NSHashTable *)v11->_observers allObjects];
  uint64_t v14 = (void *)[v13 copy];

  objc_sync_exit(v11);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18++), "_didChangeSourceWithNewState:context:inContainer:", v12, v9, v10, (void)v19);
      }
      while (v16 != v18);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v16);
  }
}

- (id)sourceByMappingContentsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [MSPQuerySource alloc];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__MSPQuerySource_sourceByMappingContentsUsingBlock___block_invoke;
  v9[3] = &unk_1E617DE08;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(MSPQuerySource *)v5 _initWithParentSource:self preprocessingBlock:0 mappingBlock:v9];

  return v7;
}

uint64_t __52__MSPQuerySource_sourceByMappingContentsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)sourceByMappingContentsUsingPreprocessingBlock:(id)a3 mappingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[MSPQuerySource alloc] _initWithParentSource:self preprocessingBlock:v7 mappingBlock:v6];

  return v8;
}

- (id)newQuery
{
  v3 = [MSPQuery alloc];

  return [(MSPQuery *)v3 _initWithSource:self];
}

- (id)newEditableQuery
{
  v3 = [MSPEditableQuery alloc];

  return [(MSPEditableQuery *)v3 _initWithSource:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong(&self->_preprocessingBlock, 0);
  objc_storeStrong(&self->_mappingBlock, 0);
  objc_storeStrong((id *)&self->_parentSource, 0);

  objc_destroyWeak((id *)&self->_owningContainer);
}

@end