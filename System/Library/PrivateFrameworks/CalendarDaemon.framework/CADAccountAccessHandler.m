@interface CADAccountAccessHandler
- (BOOL)isActionAllowed:(unint64_t)a3 forStore:(void *)a4 inDatabase:(CalDatabase *)a5;
- (CADAccountAccessHandler)initWithDatabaseDataProvider:(id)a3;
- (CADCalendarDatabaseDataProvider)dataProvider;
- (id)restrictedCalendarRowIDsForAction:(unint64_t)a3 inDatabase:(CalDatabase *)a4;
- (id)restrictedStoreRowIDsForAction:(unint64_t)a3 inDatabase:(CalDatabase *)a4;
- (void)gatherRestrictedCalendarRowIDs:(id)a3 forAction:(unint64_t)a4 inDatabase:(CalDatabase *)a5;
- (void)gatherRestrictedStoreRowIDs:(id)a3 forAction:(unint64_t)a4 inDatabase:(CalDatabase *)a5;
@end

@implementation CADAccountAccessHandler

- (CADCalendarDatabaseDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void).cxx_destruct
{
}

- (void)gatherRestrictedCalendarRowIDs:(id)a3 forAction:(unint64_t)a4 inDatabase:(CalDatabase *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = [(CADCalendarDatabaseDataProvider *)self->_dataProvider storesInDatabase:a5];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (![(CADAccountAccessHandler *)self isActionAllowed:a4 forStore:v14 inDatabase:a5])[(CADCalendarDatabaseDataProvider *)self->_dataProvider gatherCalendarRowIDs:v8 inStore:v14 inDatabase:a5]; {
      }
        }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (CADAccountAccessHandler)initWithDatabaseDataProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADAccountAccessHandler;
  v6 = [(CADAccountAccessHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dataProvider, a3);
  }

  return v7;
}

- (BOOL)isActionAllowed:(unint64_t)a3 forStore:(void *)a4 inDatabase:(CalDatabase *)a5
{
  return 1;
}

- (id)restrictedStoreRowIDsForAction:(unint64_t)a3 inDatabase:(CalDatabase *)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [(CADAccountAccessHandler *)self gatherRestrictedStoreRowIDs:v7 forAction:a3 inDatabase:a4];
  return v7;
}

- (void)gatherRestrictedStoreRowIDs:(id)a3 forAction:(unint64_t)a4 inDatabase:(CalDatabase *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  objc_super v9 = [(CADCalendarDatabaseDataProvider *)self->_dataProvider storesInDatabase:a5];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (![(CADAccountAccessHandler *)self isActionAllowed:a4 forStore:v14 inDatabase:a5])
        {
          long long v15 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[CADCalendarDatabaseDataProvider storeUIDForStore:inDatabase:](self->_dataProvider, "storeUIDForStore:inDatabase:", v14, a5));
          [v8 addObject:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (id)restrictedCalendarRowIDsForAction:(unint64_t)a3 inDatabase:(CalDatabase *)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [(CADAccountAccessHandler *)self gatherRestrictedCalendarRowIDs:v7 forAction:a3 inDatabase:a4];
  return v7;
}

@end