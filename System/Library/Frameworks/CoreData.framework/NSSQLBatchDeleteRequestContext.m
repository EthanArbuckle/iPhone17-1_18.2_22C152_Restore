@interface NSSQLBatchDeleteRequestContext
- (BOOL)executeRequestCore:(id *)a3;
- (BOOL)isWritingRequest;
- (NSBatchDeleteRequest)request;
- (uint64_t)_createFetchRequestContextForObjectsToDelete;
- (uint64_t)fetchRequestForObjectsToDelete;
- (void)_createDeleteStatements;
- (void)dealloc;
- (void)executePrologue;
@end

@implementation NSSQLBatchDeleteRequestContext

- (BOOL)isWritingRequest
{
  return 1;
}

- (BOOL)executeRequestCore:(id *)a3
{
  [(NSSQLStoreRequestContext *)self setResult:_executeBatchDeleteRequest((uint64_t *)self, (uint64_t *)a3)];
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
  if ([(NSBatchDeleteRequest *)[(NSSQLBatchDeleteRequestContext *)self request] resultType] == NSBatchDeleteResultTypeObjectIDs)
  {
    if (self)
    {
      fetchContext = self->_fetchContext;
      if (!fetchContext)
      {
        fetchContext = (NSSQLFetchRequestContext *)-[NSSQLBatchDeleteRequestContext _createFetchRequestContextForObjectsToDelete]((uint64_t)self);
        self->_fetchContext = fetchContext;
      }
    }
    else
    {
      fetchContext = 0;
    }
    [(NSSQLFetchRequestContext *)fetchContext fetchStatement];
  }
  else
  {
    -[NSSQLBatchDeleteRequestContext _createDeleteStatements]((uint64_t)self);
  }
}

- (NSBatchDeleteRequest)request
{
  v3.receiver = self;
  v3.super_class = (Class)NSSQLBatchDeleteRequestContext;
  return (NSBatchDeleteRequest *)[(NSSQLStoreRequestContext *)&v3 persistentStoreRequest];
}

- (uint64_t)_createFetchRequestContextForObjectsToDelete
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = -[NSSQLBatchDeleteRequestContext fetchRequestForObjectsToDelete](result);
    objc_super v3 = [NSSQLFetchRequestContext alloc];
    uint64_t v4 = *(void *)(v1 + 32);
    uint64_t v5 = *(void *)(v1 + 8);
    return (uint64_t)[(NSSQLFetchRequestContext *)v3 initWithRequest:v2 context:v4 sqlCore:v5];
  }
  return result;
}

- (void)_createDeleteStatements
{
  if (a1)
  {
    if (!*(void *)(a1 + 104))
    {
      id newValue = 0;
      *(void *)(a1 + 104) = (id)-[NSSQLiteAdapter generateDeleteStatementsForRequest:error:]([*(id *)(a1 + 8) adapter], a1, (uint64_t *)&newValue);
      objc_setProperty_nonatomic((id)a1, v2, newValue, 40);
    }
  }
}

- (uint64_t)fetchRequestForObjectsToDelete
{
  if (result)
  {
    uint64_t v1 = result;
    result = *(void *)(result + 96);
    if (!result)
    {
      SEL v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v1, "request"), "fetchRequest"), "copy");
      *(void *)(v1 + 96) = v2;
      [v2 _resolveEntityWithContext:*(void *)(v1 + 32)];
      [*(id *)(v1 + 96) setIncludesPropertyValues:0];
      [*(id *)(v1 + 96) setResultType:1];
      [*(id *)(v1 + 96) setPropertiesToFetch:0];
      [*(id *)(v1 + 96) setRelationshipKeyPathsForPrefetching:0];
      [*(id *)(v1 + 96) setShouldRefreshRefetchedObjects:0];
      [*(id *)(v1 + 96) setFetchBatchSize:0];
      [*(id *)(v1 + 96) setIncludesPendingChanges:0];
      return *(void *)(v1 + 96);
    }
  }
  return result;
}

- (void)dealloc
{
  self->_deleteStatements = 0;
  self->_fetchRequestForObjectsToDelete = 0;

  self->_deletedObjectIDs = 0;
  self->_fetchContext = 0;

  self->_externalDataReferenceTriggerStatements = 0;
  self->super._tempTableName = 0;

  self->_externalDataReferencesToDelete = 0;
  self->_fileBackedFuturesToDelete = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLBatchDeleteRequestContext;
  [(NSSQLBatchOperationRequestContext *)&v3 dealloc];
}

@end