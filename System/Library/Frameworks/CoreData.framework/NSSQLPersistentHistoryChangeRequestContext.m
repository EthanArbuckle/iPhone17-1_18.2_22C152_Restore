@interface NSSQLPersistentHistoryChangeRequestContext
- (BOOL)executeRequestUsingConnection:(id)a3;
- (BOOL)isWritingRequest;
- (BOOL)shouldUseBatches;
- (NSPersistentHistoryChangeRequest)request;
- (NSSQLPersistentHistoryChangeRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5;
- (id)createCountRequestContextForChanges;
- (id)createDeleteTransactionsRequestContext;
- (id)createRequestContextForChangesWithTransactionIDs:(id)a3;
- (id)fetchRequestContextForChanges;
- (id)fetchRequestDescribingChanges;
- (void)dealloc;
- (void)executePrologue;
@end

@implementation NSSQLPersistentHistoryChangeRequestContext

- (void)dealloc
{
  self->_fetchRequest = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLPersistentHistoryChangeRequestContext;
  [(NSSQLStoreRequestContext *)&v3 dealloc];
}

- (BOOL)executeRequestUsingConnection:(id)a3
{
  id newValue = 0;
  v5 = (void *)MEMORY[0x18C127630](self, a2);
  -[NSSQLStoreRequestContext setConnection:]((uint64_t)self, a3);
  -[NSSQLiteConnection connect]((uint64_t)a3);
  v7 = _executeChangeRequest(self, &newValue);
  if (v7)
  {
    v8 = [(NSSQLPersistentHistoryChangeRequestContext *)self request];
    if (self) {
      sqlCore = self->super._sqlCore;
    }
    else {
      sqlCore = 0;
    }
    [(NSSQLStoreRequestContext *)self setResult:+[NSPersistentHistoryResult _processResult:v7 forRequest:v8 withProvider:sqlCore]];
  }
  BOOL v10 = newValue == 0;
  if (self && newValue) {
    objc_setProperty_nonatomic(self, v6, newValue, 40);
  }
  -[NSSQLStoreRequestContext setConnection:]((uint64_t)self, 0);
  return v10;
}

- (id)createRequestContextForChangesWithTransactionIDs:(id)a3
{
  v4 = [[NSPersistentHistoryChangeRequest alloc] initWithTransactionIDs:a3];
  v5 = [NSSQLPersistentHistoryChangeRequestContext alloc];
  if (self)
  {
    context = self->super._context;
    sqlCore = self->super._sqlCore;
  }
  else
  {
    context = 0;
    sqlCore = 0;
  }
  v8 = [(NSSQLPersistentHistoryChangeRequestContext *)v5 initWithRequest:v4 context:context sqlCore:sqlCore];

  [(NSSQLPersistentHistoryChangeRequestContext *)v8 executePrologue];

  return v8;
}

- (NSSQLPersistentHistoryChangeRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)NSSQLPersistentHistoryChangeRequestContext;
  v6 = [(NSSQLStoreRequestContext *)&v9 initWithRequest:a3 context:a4 sqlCore:a5];
  if (v6)
  {
    if ([a3 fetchBatchSize]) {
      BOOL v7 = [a3 resultType] > 2;
    }
    else {
      BOOL v7 = 0;
    }
    v6->_shouldUseBatches = v7;
  }
  return v6;
}

- (void)executePrologue
{
  if ([(NSPersistentHistoryChangeRequest *)[(NSSQLPersistentHistoryChangeRequestContext *)self request] fetchRequest])
  {
    id v3 = [(NSPersistentHistoryChangeRequest *)[(NSSQLPersistentHistoryChangeRequestContext *)self request] entityNameToFetch];
    if (self) {
      sqlCore = self->super._sqlCore;
    }
    else {
      sqlCore = 0;
    }
    if (!objc_msgSend((id)objc_msgSend(-[NSSQLCore ancillarySQLModels](sqlCore, "ancillarySQLModels"), "objectForKey:", @"NSPersistentHistoryTrackingKey"), "entityNamed:", v3))
    {
      v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = [NSString stringWithFormat:@"Invalid entity for NSPersistentHistoryChangeRequest: %@", v3];
      objc_exception_throw((id)[v5 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v6 userInfo:0]);
    }
  }
}

- (id)fetchRequestDescribingChanges
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    if (!result[11])
    {
      uint64_t v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(result[1], "ancillarySQLModels"), "objectForKey:", @"NSPersistentHistoryTrackingKey"), "entityNamed:", objc_msgSend((id)objc_msgSend(result, "request"), "entityNameToFetch"));
      if (v2)
      {
        id v3 = (void *)v2;
        v4 = objc_alloc_init(NSFetchRequest);
        v1[11] = v4;
        -[NSFetchRequest setEntity:](v4, "setEntity:", [v3 entityDescription]);
        [v1[11] setIncludesSubentities:0];
        objc_msgSend(v1[11], "setPredicate:", objc_msgSend((id)objc_msgSend(v1, "request"), "predicateForStoreIdentifier:", objc_msgSend(v1[1], "identifier")));
        [v1[11] setIncludesPropertyValues:1];
        [v1[11] setIncludesPendingChanges:0];
        if (objc_msgSend((id)objc_msgSend(v1, "request"), "fetchLimit"))
        {
          objc_msgSend(v1[11], "setFetchLimit:", objc_msgSend((id)objc_msgSend(v1, "request"), "fetchLimit"));
          if (objc_msgSend((id)objc_msgSend(v1, "request"), "fetchOffset")) {
            objc_msgSend(v1[11], "setFetchOffset:", objc_msgSend((id)objc_msgSend(v1, "request"), "fetchOffset"));
          }
        }
        if (objc_msgSend((id)objc_msgSend(v1, "request"), "fetchRequest")
          && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v1, "request"), "fetchRequest"), "sortDescriptors"), "count"))
        {
          objc_msgSend(v1[11], "setSortDescriptors:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v1, "request"), "fetchRequest"), "sortDescriptors"));
        }
        if (objc_msgSend((id)objc_msgSend(v1, "request"), "fetchBatchSize"))
        {
          objc_msgSend(v1[11], "setFetchBatchSize:", objc_msgSend((id)objc_msgSend(v1, "request"), "fetchBatchSize"));
          if (!objc_msgSend((id)objc_msgSend(v1[11], "sortDescriptors"), "count"))
          {
            id v5 = v1[11];
            v6[0] = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
            objc_msgSend(v5, "setSortDescriptors:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v6, 1));
          }
        }
      }
    }
    return (id *)v1[11];
  }
  return result;
}

- (BOOL)shouldUseBatches
{
  return self->_shouldUseBatches;
}

- (id)createDeleteTransactionsRequestContext
{
  id v3 = -[NSBatchDeleteRequest initWithFetchRequest:]([NSBatchDeleteRequest alloc], "initWithFetchRequest:", -[NSSQLPersistentHistoryChangeRequestContext fetchRequestDescribingChanges]((id *)&self->super.super.isa));
  [(NSBatchDeleteRequest *)v3 setResultType:2* ([(NSPersistentHistoryChangeRequest *)[(NSSQLPersistentHistoryChangeRequestContext *)self request] resultType] != NSPersistentHistoryResultTypeStatusOnly)];
  v4 = [NSSQLBatchDeleteRequestContext alloc];
  if (self)
  {
    context = self->super._context;
    sqlCore = self->super._sqlCore;
  }
  else
  {
    context = 0;
    sqlCore = 0;
  }
  BOOL v7 = [(NSSQLStoreRequestContext *)v4 initWithRequest:v3 context:context sqlCore:sqlCore];

  return v7;
}

- (BOOL)isWritingRequest
{
  if ([(NSPersistentHistoryChangeRequest *)[(NSSQLPersistentHistoryChangeRequestContext *)self request] isDelete])
  {
    return 1;
  }
  v4 = [(NSSQLPersistentHistoryChangeRequestContext *)self request];

  return [(NSPersistentHistoryChangeRequest *)v4 isPercentageDelete];
}

- (id)fetchRequestContextForChanges
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = -[NSSQLPersistentHistoryChangeRequestContext fetchRequestDescribingChanges]((id *)&self->super.super.isa);
  unint64_t v4 = [(NSPersistentHistoryChangeRequest *)[(NSSQLPersistentHistoryChangeRequestContext *)self request] fetchBatchSize];
  fetchRequest = self->_fetchRequest;
  if (v4)
  {
    [(NSFetchRequest *)fetchRequest setResultType:0];
  }
  else
  {
    [(NSFetchRequest *)fetchRequest setResultType:2];
    [(NSFetchRequest *)self->_fetchRequest setAllocationType:1];
  }
  if ([(NSPersistentHistoryChangeRequest *)[(NSSQLPersistentHistoryChangeRequestContext *)self request] resultType] == NSPersistentHistoryResultTypeTransactionsAndChanges)
  {
    v13[0] = @"CHANGES";
    objc_msgSend(v3, "setRelationshipKeyPathsForPrefetching:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v13, 1));
  }
  BOOL v6 = [(NSPersistentHistoryChangeRequest *)[(NSSQLPersistentHistoryChangeRequestContext *)self request] resultType] == NSPersistentHistoryResultTypeStatusOnly|| [(NSPersistentHistoryChangeRequest *)[(NSSQLPersistentHistoryChangeRequestContext *)self request] resultType] == NSPersistentHistoryResultTypeCount|| [(NSPersistentHistoryChangeRequest *)[(NSSQLPersistentHistoryChangeRequestContext *)self request] resultType] == (NSPersistentHistoryResultTypeChangesOnly|NSPersistentHistoryResultTypeCount);
  if ([(NSPersistentHistoryChangeRequest *)[(NSSQLPersistentHistoryChangeRequestContext *)self request] propertiesToFetch])
  {
    id v7 = [(NSPersistentHistoryChangeRequest *)[(NSSQLPersistentHistoryChangeRequestContext *)self request] propertiesToFetch];
LABEL_12:
    [v3 setPropertiesToFetch:v7];
    goto LABEL_13;
  }
  if (!v6)
  {
    v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", -[NSPersistentHistoryChangeRequest propertiesToFetchForEntity:includeTransactionStrings:](-[NSSQLPersistentHistoryChangeRequestContext request](self, "request"), "propertiesToFetchForEntity:includeTransactionStrings:", objc_msgSend(v3, "entity"), -[NSSQLiteConnection _hasHistoryTransactionStringTable]((uint64_t)self->super._connection)));
    id v7 = v11;
    context = self->super._context;
    if (context && (*((unsigned char *)&context->_flags + 3) & 1) != 0) {
      [v11 removeObject:@"QUERYGEN"];
    }
    goto LABEL_12;
  }
LABEL_13:
  if ([(NSArray *)[(NSPersistentStoreRequest *)[(NSSQLPersistentHistoryChangeRequestContext *)self request] affectedStores] count])
  {
    objc_msgSend(v3, "setAffectedStores:", -[NSPersistentStoreRequest affectedStores](-[NSSQLPersistentHistoryChangeRequestContext request](self, "request"), "affectedStores"));
  }
  v8 = [[NSSQLFetchRequestContext alloc] initWithRequest:v3 context:self->super._context sqlCore:self->super._sqlCore];
  objc_super v9 = v8;
  if (v8) {
    v8 = (NSSQLFetchRequestContext *)v8->super._context;
  }
  [(NSSQLFetchRequestContext *)v8 _setAllowAncillaryEntities:1];
  return v9;
}

- (NSPersistentHistoryChangeRequest)request
{
  v3.receiver = self;
  v3.super_class = (Class)NSSQLPersistentHistoryChangeRequestContext;
  return (NSPersistentHistoryChangeRequest *)[(NSSQLStoreRequestContext *)&v3 persistentStoreRequest];
}

- (id)createCountRequestContextForChanges
{
  objc_super v3 = -[NSSQLPersistentHistoryChangeRequestContext fetchRequestDescribingChanges]((id *)&self->super.super.isa);
  [v3 setResultType:4];
  unint64_t v4 = [NSSQLCountRequestContext alloc];
  if (self)
  {
    context = self->super._context;
    sqlCore = self->super._sqlCore;
  }
  else
  {
    context = 0;
    sqlCore = 0;
  }
  id v7 = [(NSSQLFetchRequestContext *)v4 initWithRequest:v3 context:context sqlCore:sqlCore];

  return v7;
}

@end