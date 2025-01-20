@interface VSUnbinder
- (BOOL)isInvalid;
- (NSMapTable)bindingsByBinder;
- (VSUnbinder)init;
- (void)binder:(id)a3 didEstablishBinding:(id)a4;
- (void)binder:(id)a3 didTearDownBinding:(id)a4;
- (void)dealloc;
- (void)setBindingsByBinder:(id)a3;
- (void)setInvalid:(BOOL)a3;
@end

@implementation VSUnbinder

- (VSUnbinder)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSUnbinder;
  v2 = [(VSUnbinder *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    bindingsByBinder = v2->_bindingsByBinder;
    v2->_bindingsByBinder = (NSMapTable *)v3;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  v2->_invalid = 1;
  objc_sync_exit(v2);

  v15 = v2;
  uint64_t v3 = v2->_bindingsByBinder;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = [(NSMapTable *)v3 keyEnumerator];
  uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v9 = -[NSMapTable objectForKey:](v3, "objectForKey:", v8, v15);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        v10 = [v9 reverseObjectEnumerator];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              [v8 tearDownBinding:*(void *)(*((void *)&v18 + 1) + 8 * j)];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v12);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }

  v17.receiver = v15;
  v17.super_class = (Class)VSUnbinder;
  [(VSUnbinder *)&v17 dealloc];
}

- (void)binder:(id)a3 didEstablishBinding:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if ([(VSUnbinder *)v7 isInvalid])
  {
    [v11 tearDownBinding:v6];
  }
  else
  {
    v8 = [(VSUnbinder *)v7 bindingsByBinder];
    id v9 = [v8 objectForKey:v11];
    if (!v9)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v8 setObject:v9 forKey:v11];
    }
    v10 = (void *)[v6 copy];
    [v9 addObject:v10];
  }
  objc_sync_exit(v7);
}

- (void)binder:(id)a3 didTearDownBinding:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  if (![(VSUnbinder *)v7 isInvalid])
  {
    v8 = [(VSUnbinder *)v7 bindingsByBinder];
    id v9 = [v8 objectForKey:v11];
    v10 = v9;
    if (v9)
    {
      if ([v9 containsObject:v6]) {
        [v10 removeObject:v6];
      }
      else {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Attempt to tear down unknown binding %@", v6 format];
      }
      if (![v10 count]) {
        [v8 removeObjectForKey:v11];
      }
    }
  }
  objc_sync_exit(v7);
}

- (BOOL)isInvalid
{
  return self->_invalid;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (NSMapTable)bindingsByBinder
{
  return self->_bindingsByBinder;
}

- (void)setBindingsByBinder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end