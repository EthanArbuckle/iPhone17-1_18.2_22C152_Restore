@interface AVEventManager
- (AVEventManager)initWithOwner:(id)a3;
- (void)_addActionIfPossible:(id)a3;
- (void)_ensureActionStorage;
- (void)addAction:(SEL)a3 withTarget:(id)a4 forEvent:(id)a5;
- (void)addAction:(id)a3 forEvent:(id)a4;
- (void)removeAction:(SEL)a3 withTarget:(id)a4 forEvent:(id)a5;
- (void)sendActionsForEvent:(id)a3;
@end

@implementation AVEventManager

- (void)addAction:(SEL)a3 withTarget:(id)a4 forEvent:(id)a5
{
  id v6 = +[AVEventManagerAction actionWithTarget:a4 selector:a3 event:a5];
  [(AVEventManager *)self _addActionIfPossible:v6];
}

- (void)_addActionIfPossible:(id)a3
{
  id v4 = a3;
  [(AVEventManager *)self _ensureActionStorage];
  if (([(NSMutableArray *)self->_actionStorage containsObject:v4] & 1) == 0) {
    [(NSMutableArray *)self->_actionStorage addObject:v4];
  }
}

- (void)_ensureActionStorage
{
  if (!self->_actionStorage)
  {
    v3 = (NSMutableArray *)objc_opt_new();
    actionStorage = self->_actionStorage;
    self->_actionStorage = v3;
    MEMORY[0x1F41817F8](v3, actionStorage);
  }
}

- (AVEventManager)initWithOwner:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AVEventManager;
  v5 = [(AVEventManager *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak(&v5->_owner, v4);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionStorage, 0);

  objc_destroyWeak(&self->_owner);
}

- (void)sendActionsForEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_owner);
  if (WeakRetained)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_actionStorage;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v11, "hasMatchingEvent:", v4, (void)v12)) {
            [v11 sendAction:WeakRetained];
          }
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)removeAction:(SEL)a3 withTarget:(id)a4 forEvent:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", self->_actionStorage, 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v15 hasMatchingTarget:v8 withSelector:a3 forEvent:v9]) {
          [(NSMutableArray *)self->_actionStorage removeObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (void)addAction:(id)a3 forEvent:(id)a4
{
  id v5 = +[AVEventManagerAction actionWithBlock:a3 event:a4];
  [(AVEventManager *)self _addActionIfPossible:v5];
}

@end