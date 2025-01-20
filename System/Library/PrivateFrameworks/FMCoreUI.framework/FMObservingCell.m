@interface FMObservingCell
- (NSMutableDictionary)kvoObservationTokens;
- (NSMutableSet)notificationTokens;
- (id)representedObject;
- (void)addKVOObservationToken:(id)a3 forObject:(id)a4;
- (void)addNotificationToken:(id)a3;
- (void)prepareForReuse;
- (void)removeKVOObservationTokens;
- (void)removeNotificationTokens;
- (void)setKvoObservationTokens:(id)a3;
- (void)setNotificationTokens:(id)a3;
- (void)setRepresentedObject:(id)a3;
@end

@implementation FMObservingCell

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)FMObservingCell;
  [(FMObservingCell *)&v3 prepareForReuse];
  [(FMObservingCell *)self removeKVOObservationTokens];
  [(FMObservingCell *)self removeNotificationTokens];
  [(FMObservingCell *)self setRepresentedObject:0];
}

- (void)setRepresentedObject:(id)a3
{
  id obj = a3;
  [(FMObservingCell *)self removeKVOObservationTokens];
  [(FMObservingCell *)self removeNotificationTokens];
  objc_storeWeak(&self->_representedObject, obj);
  if (obj)
  {
    -[FMObservingCell addObserversForRepresentedObject:](self, "addObserversForRepresentedObject:");
  }
  else
  {
    [(FMObservingCell *)self removeKVOObservationTokens];
    [(FMObservingCell *)self removeNotificationTokens];
  }
  [(FMObservingCell *)self setNeedsLayout];
}

- (void)addKVOObservationToken:(id)a3 forObject:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = [(FMObservingCell *)self kvoObservationTokens];

    if (!v9)
    {
      v10 = [MEMORY[0x263EFF9A0] dictionary];
      [(FMObservingCell *)self setKvoObservationTokens:v10];
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v11 = [(FMObservingCell *)self kvoObservationTokens];
    v12 = [v11 allKeys];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
LABEL_7:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v23 + 1) + 8 * v16);
        v18 = [v17 object];

        if (v18 == v8) {
          break;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v14) {
            goto LABEL_7;
          }
          goto LABEL_13;
        }
      }
      id v20 = v17;

      if (v20) {
        goto LABEL_18;
      }
    }
    else
    {
LABEL_13:
    }
    id v20 = (id)[objc_alloc(MEMORY[0x263F3BA00]) initWithObject:v8];
LABEL_18:
    v21 = [(FMObservingCell *)self kvoObservationTokens];
    v19 = [v21 objectForKeyedSubscript:v20];

    if (!v19)
    {
      v19 = [MEMORY[0x263EFF9C0] set];
      v22 = [(FMObservingCell *)self kvoObservationTokens];
      [v22 setObject:v19 forKeyedSubscript:v20];
    }
    [v19 addObject:v6];
  }
  else
  {
    v19 = LogCategory_Unspecified();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[FMObservingCell addKVOObservationToken:forObject:](v19);
    }
  }
}

- (void)removeKVOObservationTokens
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(FMObservingCell *)self kvoObservationTokens];
  uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v23;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v22 + 1) + 8 * v6);
        v8 = [(FMObservingCell *)self kvoObservationTokens];
        v9 = [v8 objectForKeyedSubscript:v7];

        v10 = [v7 object];
        if (v10)
        {
          long long v20 = 0u;
          long long v21 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          id v11 = v9;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v19;
            do
            {
              uint64_t v15 = 0;
              do
              {
                if (*(void *)v19 != v14) {
                  objc_enumerationMutation(v11);
                }
                [v10 removeKVOBlockForToken:*(void *)(*((void *)&v18 + 1) + 8 * v15++)];
              }
              while (v13 != v15);
              uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
            }
            while (v13);
          }
        }
        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v4);
  }

  uint64_t v16 = [(FMObservingCell *)self kvoObservationTokens];
  [v16 removeAllObjects];
}

- (void)addNotificationToken:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"FMObservingCell.m", 106, @"Invalid parameter not satisfying: %@", @"[[inToken class] respondsToSelector:@selector(isAnObserver:)]" object file lineNumber description];
  }
  uint64_t v6 = [(FMObservingCell *)self notificationTokens];

  if (!v6)
  {
    id v7 = [MEMORY[0x263EFF9C0] set];
    [(FMObservingCell *)self setNotificationTokens:v7];
  }
  id v9 = [(FMObservingCell *)self notificationTokens];
  [v9 addObject:v5];
}

- (void)removeNotificationTokens
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(FMObservingCell *)self notificationTokens];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 removeObserver:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  id v9 = [(FMObservingCell *)self notificationTokens];
  [v9 removeAllObjects];
}

- (id)representedObject
{
  id WeakRetained = objc_loadWeakRetained(&self->_representedObject);
  return WeakRetained;
}

- (NSMutableDictionary)kvoObservationTokens
{
  return self->_kvoObservationTokens;
}

- (void)setKvoObservationTokens:(id)a3
{
}

- (NSMutableSet)notificationTokens
{
  return self->_notificationTokens;
}

- (void)setNotificationTokens:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationTokens, 0);
  objc_storeStrong((id *)&self->_kvoObservationTokens, 0);
  objc_destroyWeak(&self->_representedObject);
}

- (void)addKVOObservationToken:(os_log_t)log forObject:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218714000, log, OS_LOG_TYPE_ERROR, "Attempted to add nil KVO token!", v1, 2u);
}

@end