@interface CADGroupedAccountAccessHandler
- (BOOL)isActionAllowed:(unint64_t)a3 forStore:(void *)a4 inDatabase:(CalDatabase *)a5;
- (CADGroupedAccountAccessHandler)initWithDatabaseDataProvider:(id)a3;
- (NSMutableArray)accessHandlers;
- (id)restrictedCalendarRowIDsForAction:(unint64_t)a3 inDatabase:(CalDatabase *)a4;
- (id)restrictedStoreRowIDsForAction:(unint64_t)a3 inDatabase:(CalDatabase *)a4;
- (void)addAccountAccessHandler:(id)a3;
- (void)gatherRestrictedCalendarRowIDs:(id)a3 forAction:(unint64_t)a4 inDatabase:(CalDatabase *)a5;
- (void)reset;
@end

@implementation CADGroupedAccountAccessHandler

- (id)restrictedCalendarRowIDsForAction:(unint64_t)a3 inDatabase:(CalDatabase *)a4
{
  v7 = [(CADAccountAccessHandler *)self dataProvider];
  uint64_t v8 = [v7 databaseID:a4];

  v9 = [MEMORY[0x1E4F28ED0] numberWithInt:v8];
  os_unfair_lock_lock(&self->_lock);
  v10 = [(NSMutableArray *)self->_restrictedCalendarReadCache objectAtIndexedSubscript:a3];
  uint64_t v11 = [v10 objectForKeyedSubscript:v9];
  if (v11)
  {
    id v12 = (id)v11;
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(CADGroupedAccountAccessHandler *)self gatherRestrictedCalendarRowIDs:v13 forAction:a3 inDatabase:a4];
    id v12 = v13;
    if (!self->_restrictedCalendarReadCache)
    {
      v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      restrictedCalendarReadCache = self->_restrictedCalendarReadCache;
      self->_restrictedCalendarReadCache = v14;

      v16 = self->_restrictedCalendarReadCache;
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(NSMutableArray *)v16 addObject:v17];

      v18 = self->_restrictedCalendarReadCache;
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(NSMutableArray *)v18 addObject:v19];

      uint64_t v20 = [(NSMutableArray *)self->_restrictedCalendarReadCache objectAtIndexedSubscript:a3];

      v10 = (void *)v20;
    }
    [v10 setObject:v12 forKeyedSubscript:v9];
  }
  os_unfair_lock_unlock(&self->_lock);

  return v12;
}

- (void)gatherRestrictedCalendarRowIDs:(id)a3 forAction:(unint64_t)a4 inDatabase:(CalDatabase *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v9 = self->_accessHandlers;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "gatherRestrictedCalendarRowIDs:forAction:inDatabase:", v8, a4, a5, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)addAccountAccessHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CADGroupedAccountAccessHandler *)self accessHandlers];
  [v5 addObject:v4];
}

- (CADGroupedAccountAccessHandler)initWithDatabaseDataProvider:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CADGroupedAccountAccessHandler;
  v3 = [(CADAccountAccessHandler *)&v7 initWithDatabaseDataProvider:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    accessHandlers = v3->_accessHandlers;
    v3->_accessHandlers = (NSMutableArray *)v4;

    v3->_lock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (BOOL)isActionAllowed:(unint64_t)a3 forStore:(void *)a4 inDatabase:(CalDatabase *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = [(CADGroupedAccountAccessHandler *)self accessHandlers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if (![*(id *)(*((void *)&v15 + 1) + 8 * i) isActionAllowed:a3 forStore:a4 inDatabase:a5])
        {
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (NSMutableArray)accessHandlers
{
  return self->_accessHandlers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessHandlers, 0);
  objc_storeStrong((id *)&self->_restrictedStoreReadCache, 0);
  objc_storeStrong((id *)&self->_restrictedCalendarReadCache, 0);
}

- (id)restrictedStoreRowIDsForAction:(unint64_t)a3 inDatabase:(CalDatabase *)a4
{
  objc_super v7 = [(CADAccountAccessHandler *)self dataProvider];
  uint64_t v8 = [v7 databaseID:a4];

  uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInt:v8];
  os_unfair_lock_lock(&self->_lock);
  uint64_t v10 = [(NSMutableArray *)self->_restrictedStoreReadCache objectAtIndexedSubscript:a3];
  uint64_t v11 = [v10 objectForKeyedSubscript:v9];
  if (v11)
  {
    id v12 = (id)v11;
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(CADAccountAccessHandler *)self gatherRestrictedStoreRowIDs:v13 forAction:a3 inDatabase:a4];
    id v12 = v13;
    if (!self->_restrictedStoreReadCache)
    {
      long long v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      restrictedStoreReadCache = self->_restrictedStoreReadCache;
      self->_restrictedStoreReadCache = v14;

      long long v16 = self->_restrictedStoreReadCache;
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(NSMutableArray *)v16 addObject:v17];

      long long v18 = self->_restrictedStoreReadCache;
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(NSMutableArray *)v18 addObject:v19];

      uint64_t v20 = [(NSMutableArray *)self->_restrictedStoreReadCache objectAtIndexedSubscript:a3];

      uint64_t v10 = (void *)v20;
    }
    [v10 setObject:v12 forKeyedSubscript:v9];
  }
  os_unfair_lock_unlock(&self->_lock);

  return v12;
}

- (void)reset
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(CADGroupedAccountAccessHandler *)self accessHandlers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) reset];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  os_unfair_lock_lock(&self->_lock);
  restrictedCalendarReadCache = self->_restrictedCalendarReadCache;
  self->_restrictedCalendarReadCache = 0;

  os_unfair_lock_unlock(&self->_lock);
}

@end