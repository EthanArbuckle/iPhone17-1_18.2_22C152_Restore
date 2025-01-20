@interface ObjectAnalytics
- (ObjectAnalytics)initWithWorkspace:(id)a3 entityName:(id)a4 withCache:(BOOL)a5;
- (id)_fetch:(id)a3 sortDesc:(id)a4;
- (id)_fetch:(id)a3 sortDesc:(id)a4 limit:(unint64_t)a5;
- (id)_firstLastHappened:(BOOL)a3;
- (id)createEntity;
- (id)createEntityForEntityName:(id)a3;
- (id)createTemporaryEntity;
- (id)createTemporaryEntityForEntityName:(id)a3;
- (id)fetchAllEntityDictionariesWithProperties:(id)a3;
- (id)fetchEntitiesFreeForm:(id)a3 sortDesc:(id)a4;
- (id)fetchEntityDictionariesWithProperties:(id)a3 predicate:(id)a4;
- (id)fetchEntityDictionariesWithProperties:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5;
- (id)fetchEntityDictionariesWithProperties:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 limit:(unint64_t)a6;
- (id)firstHappened;
- (id)getDescriptionForName:(id)a3;
- (id)lastHappened;
- (int64_t)removeEntitiesMatching:(id)a3;
- (unint64_t)countEntitiesMatching:(id)a3;
- (unint64_t)updateEntitiesMatching:(id)a3 properties:(id)a4;
- (void)moveTemporaryEntityToMainContext:(id)a3;
- (void)refresh:(id)a3;
- (void)removeEntities:(id)a3;
- (void)save;
@end

@implementation ObjectAnalytics

- (ObjectAnalytics)initWithWorkspace:(id)a3 entityName:(id)a4 withCache:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ObjectAnalytics;
  v10 = [(ObjectAnalytics *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->wspace, a3);
    v11->managedCache = 0;
    objc_storeStrong((id *)&v11->entityName, a4);
  }

  return v11;
}

- (id)fetchEntitiesFreeForm:(id)a3 sortDesc:(id)a4
{
  return [(ObjectAnalytics *)self _fetch:a3 sortDesc:a4 limit:0];
}

- (id)fetchAllEntityDictionariesWithProperties:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF248]);
  [v5 setName:@"objectID"];
  v6 = [MEMORY[0x263F087F0] expressionForEvaluatedObject];
  [v5 setExpression:v6];

  [v5 setExpressionResultType:2000];
  v7 = [MEMORY[0x263EFF980] arrayWithObject:v5];
  if ([v4 count]) {
    [v7 addObjectsFromArray:v4];
  }
  id v8 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:self->entityName];
  [v8 setResultType:2];
  [v8 setAllocationType:1];
  [v8 setPropertiesToFetch:v7];
  id v9 = [(AnalyticsWorkspace *)self->wspace mainObjectContext];
  id v15 = 0;
  v10 = [v9 executeFetchRequest:v8 error:&v15];
  id v11 = v15;

  if (v11)
  {
    v12 = objectanalyticsHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v11;
      _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_ERROR, "Failure to fetch object IDs %@", buf, 0xCu);
    }

    id v13 = 0;
  }
  else
  {
    id v13 = v10;
  }

  return v13;
}

- (id)fetchEntityDictionariesWithProperties:(id)a3 predicate:(id)a4
{
  return [(ObjectAnalytics *)self fetchEntityDictionariesWithProperties:a3 predicate:a4 sortDescriptors:0];
}

- (id)fetchEntityDictionariesWithProperties:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  return [(ObjectAnalytics *)self fetchEntityDictionariesWithProperties:a3 predicate:a4 sortDescriptors:a5 limit:0];
}

- (id)fetchEntityDictionariesWithProperties:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 limit:(unint64_t)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init(MEMORY[0x263EFF248]);
  [v13 setName:@"objectID"];
  v14 = [MEMORY[0x263F087F0] expressionForEvaluatedObject];
  [v13 setExpression:v14];

  [v13 setExpressionResultType:2000];
  id v15 = [MEMORY[0x263EFF980] arrayWithObject:v13];
  if ([v10 count]) {
    [v15 addObjectsFromArray:v10];
  }
  v16 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:self->entityName];
  [v16 setResultType:2];
  [v16 setAllocationType:1];
  [v16 setPropertiesToFetch:v15];
  if (v11) {
    [v16 setPredicate:v11];
  }
  if (v12) {
    [v16 setSortDescriptors:v12];
  }
  if (a6) {
    [v16 setFetchLimit:a6];
  }
  id v17 = [(AnalyticsWorkspace *)self->wspace mainObjectContext];
  id v23 = 0;
  uint64_t v18 = [v17 executeFetchRequest:v16 error:&v23];
  id v19 = v23;

  if (v19)
  {
    v20 = objectanalyticsHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v19;
      _os_log_impl(&dword_209DBA000, v20, OS_LOG_TYPE_ERROR, "Failure to fetch object IDs %@", buf, 0xCu);
    }

    id v21 = 0;
  }
  else
  {
    id v21 = v18;
  }

  return v21;
}

- (id)_firstLastHappened:(BOOL)a3
{
  id v4 = [(ObjectAnalytics *)self _fetch:0 sortDesc:0];
  id v5 = v4;
  if (v4 && [v4 count])
  {
    if (a3) {
      [v5 objectAtIndex:0];
    }
    else {
    v6 = [v5 lastObject];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)firstHappened
{
  return [(ObjectAnalytics *)self _firstLastHappened:1];
}

- (id)lastHappened
{
  return [(ObjectAnalytics *)self _firstLastHappened:0];
}

- (id)createEntity
{
  return [(ObjectAnalytics *)self createEntityForEntityName:self->entityName];
}

- (id)createEntityForEntityName:(id)a3
{
  id v4 = (NSString *)a3;
  id v5 = [(AnalyticsWorkspace *)self->wspace mainObjectContext];
  if (v5)
  {
    if (!v4) {
      id v4 = self->entityName;
    }
    v6 = [MEMORY[0x263EFF240] insertNewObjectForEntityForName:v4 inManagedObjectContext:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)createTemporaryEntity
{
  return [(ObjectAnalytics *)self createTemporaryEntityForEntityName:self->entityName];
}

- (id)createTemporaryEntityForEntityName:(id)a3
{
  id v4 = (NSString *)a3;
  id v5 = [(AnalyticsWorkspace *)self->wspace mainObjectContext];
  if (v5)
  {
    if (!v4) {
      id v4 = self->entityName;
    }
    v6 = [MEMORY[0x263EFF240] entityForName:v4 inManagedObjectContext:v5];
    v7 = (void *)[objc_alloc(MEMORY[0x263EFF280]) initWithEntity:v6 insertIntoManagedObjectContext:0];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)moveTemporaryEntityToMainContext:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = [(AnalyticsWorkspace *)self->wspace mainObjectContext];
    [v5 insertObject:v4];
  }
  else
  {
    id v5 = objectanalyticsHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [v4 description];
      int v7 = 136315138;
      uint64_t v8 = [v6 UTF8String];
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_ERROR, "Invalid object %s", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (id)getDescriptionForName:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF240];
  wspace = self->wspace;
  id v5 = a3;
  id v6 = [(AnalyticsWorkspace *)wspace mainObjectContext];
  int v7 = [v3 entityForName:v5 inManagedObjectContext:v6];

  return v7;
}

- (void)refresh:(id)a3
{
  id v4 = a3;
  id v5 = [(AnalyticsWorkspace *)self->wspace mainObjectContext];
  id v6 = v5;
  if (v5)
  {
    if (v4) {
      [v5 refreshObject:v4 mergeChanges:0];
    }
  }
  else
  {
    int v7 = objectanalyticsHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_ERROR, "moc is nil", v8, 2u);
    }
  }
}

- (void)save
{
}

- (void)removeEntities:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(AnalyticsWorkspace *)self->wspace mainObjectContext];
  if (v5)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
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
          objc_msgSend(v5, "deleteObject:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v8);
    }

    [(AnalyticsWorkspace *)self->wspace save];
  }
  else
  {
    id v11 = objectanalyticsHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_ERROR, "moc is nil", buf, 2u);
    }
  }
}

- (unint64_t)countEntitiesMatching:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->entityName)
  {
    id v5 = [(AnalyticsWorkspace *)self->wspace mainObjectContext];
    if (!v5)
    {
      uint64_t v9 = objectanalyticsHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_ERROR, "moc is nil", buf, 2u);
      }
      unint64_t v8 = 0;
      goto LABEL_17;
    }
    id v6 = objc_alloc_init(MEMORY[0x263EFF260]);
    uint64_t v7 = [MEMORY[0x263EFF240] entityForName:self->entityName inManagedObjectContext:v5];
    [v6 setEntity:v7];

    [v6 setPredicate:v4];
    id v15 = 0;
    unint64_t v8 = [v5 countForFetchRequest:v6 error:&v15];
    uint64_t v9 = v15;
    if (v9)
    {
      id v10 = objectanalyticsHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = [v9 description];
        uint64_t v12 = [v11 UTF8String];
        *(_DWORD *)buf = 136315138;
        unint64_t v17 = v12;
        _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_ERROR, "error counting entities: %s", buf, 0xCu);
      }
    }
    else
    {
      long long v13 = objectanalyticsHandle();
      id v10 = v13;
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v17 = v8;
          _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEFAULT, "counted %ld entities", buf, 0xCu);
        }
        goto LABEL_16;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v17 = (unint64_t)v4;
        _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_ERROR, "an error occrred counting entities matching: %@", buf, 0xCu);
      }
    }
    unint64_t v8 = 0;
LABEL_16:

LABEL_17:
    goto LABEL_18;
  }
  id v5 = objectanalyticsHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_ERROR, "entityName is nil", buf, 2u);
  }
  unint64_t v8 = 0;
LABEL_18:

  return v8;
}

- (int64_t)removeEntitiesMatching:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->entityName)
  {
    id v5 = [(AnalyticsWorkspace *)self->wspace mainObjectContext];
    if (v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x263EFF260]);
      uint64_t v7 = [MEMORY[0x263EFF240] entityForName:self->entityName inManagedObjectContext:v5];
      [v6 setEntity:v7];

      [v6 setPredicate:v4];
      unint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFF1D0]) initWithFetchRequest:v6];
      [v8 setResultType:2];
      id v18 = 0;
      uint64_t v9 = [v5 executeRequest:v8 error:&v18];
      id v10 = v18;
      if (v10)
      {
        id v11 = objectanalyticsHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          id v12 = [v10 description];
          uint64_t v13 = [v12 UTF8String];
          *(_DWORD *)buf = 136315138;
          uint64_t v20 = v13;
          _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_ERROR, "error batch deleting: %s", buf, 0xCu);
        }
        int64_t v14 = 0;
      }
      else
      {
        id v15 = [v9 result];
        int64_t v14 = [v15 integerValue];

        v16 = objectanalyticsHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v20 = v14;
          _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_DEFAULT, "batch deleted %ld entities", buf, 0xCu);
        }

        [(AnalyticsWorkspace *)self->wspace save];
      }
    }
    else
    {
      id v10 = objectanalyticsHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_ERROR, "moc is nil", buf, 2u);
      }
      int64_t v14 = 0;
    }
  }
  else
  {
    id v5 = objectanalyticsHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_ERROR, "entityName is nil", buf, 2u);
    }
    int64_t v14 = 0;
  }

  return v14;
}

- (unint64_t)updateEntitiesMatching:(id)a3 properties:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (self->entityName)
  {
    unint64_t v8 = [(AnalyticsWorkspace *)self->wspace mainObjectContext];
    if (!v8)
    {
      uint64_t v9 = objectanalyticsHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_ERROR, "moc is nil", buf, 2u);
      }
      unint64_t v15 = 0;
      goto LABEL_18;
    }
    uint64_t v9 = [MEMORY[0x263EFF1E0] batchUpdateRequestWithEntityName:self->entityName];
    [v9 setPropertiesToUpdate:v7];
    [v9 setPredicate:v6];
    [v9 setResultType:2];
    id v20 = 0;
    id v10 = [v8 executeRequest:v9 error:&v20];
    id v11 = v20;
    if (v11)
    {
      id v12 = objectanalyticsHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = [v11 description];
        uint64_t v14 = [v13 UTF8String];
        *(_DWORD *)buf = 136315138;
        uint64_t v22 = v14;
        _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_ERROR, "batch update return error: %s", buf, 0xCu);
      }
    }
    else
    {
      id v12 = [v10 result];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = [v10 result];
        uint64_t v17 = [v16 count];

        if (v17 != 1)
        {
          unint64_t v15 = 0;
          goto LABEL_17;
        }
        id v12 = [v10 result];
        id v18 = [v12 objectAtIndex:0];
        unint64_t v15 = [v18 unsignedIntegerValue];

LABEL_16:
LABEL_17:

LABEL_18:
        goto LABEL_19;
      }
    }
    unint64_t v15 = 0;
    goto LABEL_16;
  }
  unint64_t v8 = objectanalyticsHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_ERROR, "entityName is nil", buf, 2u);
  }
  unint64_t v15 = 0;
LABEL_19:

  return v15;
}

- (id)_fetch:(id)a3 sortDesc:(id)a4
{
  return [(ObjectAnalytics *)self _fetch:a3 sortDesc:a4 limit:0];
}

- (id)_fetch:(id)a3 sortDesc:(id)a4 limit:(unint64_t)a5
{
  v23[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(AnalyticsWorkspace *)self->wspace mainObjectContext];
  if (!v10)
  {
    unint64_t v15 = 0;
    goto LABEL_17;
  }
  if (!v9) {
    id v9 = (id)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"timeStamp" ascending:1];
  }
  if (self->managedCache)
  {
    id v11 = 0;
  }
  else
  {
    v16 = [MEMORY[0x263EFF240] entityForName:self->entityName inManagedObjectContext:v10];
    id v17 = objc_alloc_init(MEMORY[0x263EFF260]);
    [v17 setEntity:v16];
    if (v8) {
      [v17 setPredicate:v8];
    }
    else {
      [v17 setReturnsObjectsAsFaults:0];
    }
    v23[0] = v9;
    id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    [v17 setSortDescriptors:v18];

    if (a5) {
      [v17 setFetchLimit:a5];
    }
    id v20 = 0;
    unint64_t v15 = [v10 executeFetchRequest:v17 error:&v20];
    id v11 = v20;

    if (v15) {
      goto LABEL_16;
    }
  }
  id v12 = objectanalyticsHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v13 = [v11 description];
    uint64_t v14 = [v13 UTF8String];
    *(_DWORD *)buf = 136315138;
    uint64_t v22 = v14;
    _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_ERROR, "fetch failed, err %s", buf, 0xCu);
  }
  unint64_t v15 = 0;
LABEL_16:

LABEL_17:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->entityName, 0);

  objc_storeStrong((id *)&self->wspace, 0);
}

@end