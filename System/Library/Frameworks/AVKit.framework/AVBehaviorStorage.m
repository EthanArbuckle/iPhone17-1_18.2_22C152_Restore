@interface AVBehaviorStorage
- (AVBehaviorStorage)initWithAVKitOwner:(id)a3;
- (NSMapTable)behaviorsAndBehaviorContexts;
- (id)AVKitOwner;
- (id)behaviorContextOfClass:(Class)a3;
- (id)behaviorOfClass:(Class)a3;
- (id)behaviors;
- (void)addBehavior:(id)a3;
- (void)enumerateAllBehaviorContextsConformingToProtocol:(id)a3 usingBlock:(id)a4;
- (void)enumerateAllBehaviorContextsImplementingSelector:(SEL)a3 forProtocol:(id)a4 usingBlock:(id)a5;
- (void)enumerateAllBehaviorContextsUsingBlock:(id)a3;
- (void)enumerateAllBehaviorsConformingToProtocol:(id)a3 usingBlock:(id)a4;
- (void)enumerateAllBehaviorsUsingBlock:(id)a3;
- (void)removeBehavior:(id)a3;
- (void)setAVKitOwner:(id)a3;
@end

@implementation AVBehaviorStorage

- (AVBehaviorStorage)initWithAVKitOwner:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AVBehaviorStorage;
  v5 = [(AVBehaviorStorage *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(&v5->_AVKitOwner, v4);
    uint64_t v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    behaviorsAndBehaviorContexts = v6->_behaviorsAndBehaviorContexts;
    v6->_behaviorsAndBehaviorContexts = (NSMapTable *)v7;
  }
  return v6;
}

- (void)enumerateAllBehaviorContextsImplementingSelector:(SEL)a3 forProtocol:(id)a4 usingBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __93__AVBehaviorStorage_enumerateAllBehaviorContextsImplementingSelector_forProtocol_usingBlock___block_invoke;
  v10[3] = &unk_1E5FC3E60;
  id v11 = v8;
  SEL v12 = a3;
  id v9 = v8;
  [(AVBehaviorStorage *)self enumerateAllBehaviorContextsConformingToProtocol:a4 usingBlock:v10];
}

- (void)enumerateAllBehaviorContextsConformingToProtocol:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__AVBehaviorStorage_enumerateAllBehaviorContextsConformingToProtocol_usingBlock___block_invoke;
  v10[3] = &unk_1E5FC3E38;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(AVBehaviorStorage *)self enumerateAllBehaviorContextsUsingBlock:v10];
}

- (void)enumerateAllBehaviorContextsUsingBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(AVBehaviorStorage *)self behaviorsAndBehaviorContexts];
  id v6 = [v5 objectEnumerator];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

void __81__AVBehaviorStorage_enumerateAllBehaviorContextsConformingToProtocol_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __93__AVBehaviorStorage_enumerateAllBehaviorContextsImplementingSelector_forProtocol_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)addBehavior:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v16 = v4;
    v5 = [(AVBehaviorStorage *)self behaviorsAndBehaviorContexts];
    id v6 = [v5 objectForKey:v16];

    id v4 = v16;
    if (!v6)
    {
      if ([v16 conformsToProtocol:&unk_1F0966310])
      {
        id v7 = v16;
        id v8 = objc_alloc((Class)[(id)objc_opt_class() behaviorContextClass]);
        uint64_t v9 = [(AVBehaviorStorage *)self AVKitOwner];
        uint64_t v10 = (void *)[v8 initWithAVKitOwner:v9];

        if (v10)
        {
          long long v11 = v10;
          long long v12 = v11;
LABEL_8:
          [(AVDefaultBehaviorContext *)v12 willAddBehavior:v16];
          [v16 willMoveToContext:v11];
          v15 = [(AVBehaviorStorage *)self behaviorsAndBehaviorContexts];
          [v15 setObject:v11 forKey:v16];

          [(AVDefaultBehaviorContext *)v12 setBehavior:v16];
          [v7 setBehaviorContext:v11];
          [(AVDefaultBehaviorContext *)v12 didAddBehavior:v16];

          id v4 = v16;
          goto LABEL_9;
        }
      }
      else
      {
        id v7 = 0;
      }
      long long v13 = [AVDefaultBehaviorContext alloc];
      long long v14 = [(AVBehaviorStorage *)self AVKitOwner];
      long long v11 = [(AVDefaultBehaviorContext *)v13 initWithAVKitOwner:v14];

      long long v12 = 0;
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (NSMapTable)behaviorsAndBehaviorContexts
{
  return self->_behaviorsAndBehaviorContexts;
}

- (id)AVKitOwner
{
  id WeakRetained = objc_loadWeakRetained(&self->_AVKitOwner);

  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviorsAndBehaviorContexts, 0);

  objc_destroyWeak(&self->_AVKitOwner);
}

- (void)setAVKitOwner:(id)a3
{
}

- (id)behaviorContextOfClass:(Class)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [(AVBehaviorStorage *)self behaviorsAndBehaviorContexts];
  id v4 = [v3 objectEnumerator];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)behaviorOfClass:(Class)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [(AVBehaviorStorage *)self behaviorsAndBehaviorContexts];
  id v4 = [v3 keyEnumerator];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)enumerateAllBehaviorsConformingToProtocol:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__AVBehaviorStorage_enumerateAllBehaviorsConformingToProtocol_usingBlock___block_invoke;
  v10[3] = &unk_1E5FC3E10;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(AVBehaviorStorage *)self enumerateAllBehaviorsUsingBlock:v10];
}

void __74__AVBehaviorStorage_enumerateAllBehaviorsConformingToProtocol_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)enumerateAllBehaviorsUsingBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(AVBehaviorStorage *)self behaviorsAndBehaviorContexts];
  id v6 = [v5 keyEnumerator];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)removeBehavior:(id)a3
{
  id v8 = a3;
  id v4 = [(AVBehaviorStorage *)self behaviorsAndBehaviorContexts];
  uint64_t v5 = [v4 objectForKey:v8];

  if ([v5 conformsToProtocol:&unk_1F0964710])
  {
    id v6 = v5;
    [v6 willRemoveBehavior:v8];
    uint64_t v7 = [(AVBehaviorStorage *)self behaviorsAndBehaviorContexts];
    [v7 removeObjectForKey:v8];

    [v6 setBehavior:0];
    if ([v8 conformsToProtocol:&unk_1F0966310]) {
      [v8 setBehaviorContext:0];
    }
    [v6 didRemoveBehavior:v8];
  }
  else
  {
    id v6 = [(AVBehaviorStorage *)self behaviorsAndBehaviorContexts];
    [v6 removeObjectForKey:v8];
  }
}

- (id)behaviors
{
  v2 = [(AVBehaviorStorage *)self behaviorsAndBehaviorContexts];
  id v3 = [v2 keyEnumerator];
  id v4 = [v3 allObjects];

  return v4;
}

@end