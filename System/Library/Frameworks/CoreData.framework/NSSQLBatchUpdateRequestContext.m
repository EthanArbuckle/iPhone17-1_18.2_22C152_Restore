@interface NSSQLBatchUpdateRequestContext
- (BOOL)executeRequestCore:(id *)a3;
- (BOOL)isWritingRequest;
- (NSBatchUpdateRequest)request;
- (NSSQLBatchUpdateRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5;
- (id)createFetchRequestContextForObjectsToUpdate;
- (void)dealloc;
- (void)executePrologue;
@end

@implementation NSSQLBatchUpdateRequestContext

- (BOOL)executeRequestCore:(id *)a3
{
  [(NSSQLStoreRequestContext *)self setResult:_executeBatchUpdateRequest(self, (uint64_t *)a3)];
  if (a3 && *a3)
  {
    if (!self) {
      return [(NSSQLStoreRequestContext *)self result] != 0;
    }
    objc_setProperty_nonatomic(self, v5, *a3, 40);
  }
  else if (!self)
  {
    return [(NSSQLStoreRequestContext *)self result] != 0;
  }
  if (self->super.super._exception || self->super.super._error) {
    return 0;
  }
  return [(NSSQLStoreRequestContext *)self result] != 0;
}

- (void)executePrologue
{
  if (self)
  {
    v3 = [[NSSQLGenerator alloc] initWithPersistentStore:self->super.super._sqlCore];
    v4 = [(NSSQLBatchUpdateRequestContext *)self request];
    if (v3) {
      v5 = (NSSQLiteStatement *)-[NSSQLGenerator newSQLStatementForRequest:ignoreInheritance:countOnly:nestingLevel:nestIsWhereScoped:requestContext:]((uint64_t)v3, v4, 0, 0, 0, 0, 0);
    }
    else {
      v5 = 0;
    }
    self->_updateStatement = v5;
  }
}

- (NSBatchUpdateRequest)request
{
  v3.receiver = self;
  v3.super_class = (Class)NSSQLBatchUpdateRequestContext;
  return (NSBatchUpdateRequest *)[(NSSQLStoreRequestContext *)&v3 persistentStoreRequest];
}

- (BOOL)isWritingRequest
{
  return 1;
}

- (void)dealloc
{
  self->_updateStatement = 0;
  self->_fetchRequest = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLBatchUpdateRequestContext;
  [(NSSQLBatchOperationRequestContext *)&v3 dealloc];
}

- (NSSQLBatchUpdateRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)NSSQLBatchUpdateRequestContext;
  v7 = [(NSSQLStoreRequestContext *)&v9 initWithRequest:a3 context:a4 sqlCore:a5];
  if (v7) {
    [a3 _resolveEntityWithContext:a4];
  }
  return v7;
}

- (id)createFetchRequestContextForObjectsToUpdate
{
  if (self)
  {
    fetchRequest = self->_fetchRequest;
    if (!fetchRequest)
    {
      v4 = objc_alloc_init(NSFetchRequest);
      self->_fetchRequest = v4;
      [(NSFetchRequest *)v4 setEntity:[(NSBatchUpdateRequest *)[(NSSQLBatchUpdateRequestContext *)self request] entity]];
      [(NSFetchRequest *)self->_fetchRequest setIncludesSubentities:[(NSBatchUpdateRequest *)[(NSSQLBatchUpdateRequestContext *)self request] includesSubentities]];
      [(NSFetchRequest *)self->_fetchRequest setPredicate:[(NSBatchUpdateRequest *)[(NSSQLBatchUpdateRequestContext *)self request] predicate]];
      [(NSFetchRequest *)self->_fetchRequest setIncludesPropertyValues:0];
      [(NSFetchRequest *)self->_fetchRequest setIncludesPendingChanges:0];
      [(NSFetchRequest *)self->_fetchRequest setResultType:1];
      fetchRequest = self->_fetchRequest;
    }
    v5 = [NSSQLFetchRequestContext alloc];
    context = self->super.super._context;
    sqlCore = self->super.super._sqlCore;
  }
  else
  {
    v5 = [NSSQLFetchRequestContext alloc];
    context = 0;
    fetchRequest = 0;
    sqlCore = 0;
  }

  return [(NSSQLFetchRequestContext *)v5 initWithRequest:fetchRequest context:context sqlCore:sqlCore];
}

@end