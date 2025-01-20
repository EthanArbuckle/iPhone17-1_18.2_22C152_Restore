@interface NSBatchDeleteRequest
+ (id)decodeFromXPCArchive:(id)a3 withContext:(id)a4 withPolicy:(id)a5;
- (BOOL)_secureOperation;
- (NSBatchDeleteRequest)initWithFetchRequest:(NSFetchRequest *)fetch;
- (NSBatchDeleteRequest)initWithObjectIDs:(NSArray *)objects;
- (NSBatchDeleteRequestResultType)resultType;
- (NSFetchRequest)fetchRequest;
- (id)description;
- (id)encodeForXPC;
- (unint64_t)requestType;
- (void)_resolveEntityWithContext:(id)a3;
- (void)_setSecureOperation:(BOOL)a3;
- (void)dealloc;
- (void)setResultType:(NSBatchDeleteRequestResultType)resultType;
@end

@implementation NSBatchDeleteRequest

- (void)dealloc
{
  self->_deleteTarget = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSBatchDeleteRequest;
  [(NSPersistentStoreRequest *)&v3 dealloc];
}

- (unint64_t)requestType
{
  return 7;
}

- (void)_resolveEntityWithContext:(id)a3
{
}

- (void)setResultType:(NSBatchDeleteRequestResultType)resultType
{
  self->_resultType = resultType;
}

- (NSBatchDeleteRequest)initWithFetchRequest:(NSFetchRequest *)fetch
{
  if (!fetch || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    v10 = @"Must supply a fetch request during initialization";
    goto LABEL_9;
  }
  if (![(NSFetchRequest *)fetch entityName])
  {

    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    v10 = @"Fetch must have an entity";
LABEL_9:
    objc_exception_throw((id)[v8 exceptionWithName:v9 reason:v10 userInfo:0]);
  }
  v11.receiver = self;
  v11.super_class = (Class)NSBatchDeleteRequest;
  v5 = [(NSBatchDeleteRequest *)&v11 init];
  if (v5)
  {
    v6 = (NSFetchRequest *)[(NSFetchRequest *)fetch copy];
    v5->_deleteTarget = v6;
    [(NSFetchRequest *)v6 setIncludesPropertyValues:0];
    [(NSFetchRequest *)v5->_deleteTarget setResultType:1];
    [(NSFetchRequest *)v5->_deleteTarget setPropertiesToFetch:0];
    [(NSFetchRequest *)v5->_deleteTarget setRelationshipKeyPathsForPrefetching:0];
    [(NSFetchRequest *)v5->_deleteTarget setShouldRefreshRefetchedObjects:0];
    [(NSFetchRequest *)v5->_deleteTarget setFetchBatchSize:0];
    [(NSFetchRequest *)v5->_deleteTarget setIncludesPendingChanges:0];
    [(NSFetchRequest *)v5->_deleteTarget _incrementInUseCounter];
  }
  return v5;
}

- (NSBatchDeleteRequestResultType)resultType
{
  return self->_resultType;
}

- (NSFetchRequest)fetchRequest
{
  v2 = self->_deleteTarget;

  return v2;
}

- (BOOL)_secureOperation
{
  return self->_flags != 0;
}

- (id)encodeForXPC
{
  id v2 = [[NSBatchDeleteRequestEncodingToken alloc] initForRequest:self];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v3 setDelegate:objc_opt_class()];
  [v3 encodeObject:v2 forKey:@"root"];
  [v3 finishEncoding];
  id v4 = (id)[v3 encodedData];

  return v4;
}

+ (id)decodeFromXPCArchive:(id)a3 withContext:(id)a4 withPolicy:(id)a5
{
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:a3 error:0];
  [v7 setDelegate:a4];
  v8 = (void *)[v7 decodeObjectOfClass:objc_opt_class() forKey:@"root"];

  uint64_t v9 = -[NSBatchDeleteRequest initWithFetchRequest:]([NSBatchDeleteRequest alloc], "initWithFetchRequest:", +[NSFetchRequest decodeFromXPCArchive:withContext:andPolicy:](NSFetchRequest, "decodeFromXPCArchive:withContext:andPolicy:", [v8 fetchData], a4, a5));
  -[NSBatchDeleteRequest setResultType:](v9, "setResultType:", [v8 resultType]);
  -[NSBatchDeleteRequest _setSecureOperation:](v9, "_setSecureOperation:", [v8 secure]);

  return v9;
}

- (NSBatchDeleteRequest)initWithObjectIDs:(NSArray *)objects
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (![(NSArray *)objects count])
  {

    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    v16 = @"Must supply a non-zero number of objectIDs to request during initialization";
    uint64_t v15 = 0;
LABEL_17:
    objc_exception_throw((id)[v17 exceptionWithName:v18 reason:v16 userInfo:v15]);
  }
  uint64_t v5 = objc_msgSend(-[NSArray lastObject](objects, "lastObject"), "entity");
  if (v5)
  {
    if ((*(unsigned char *)(v5 + 120) & 4) != 0)
    {
      uint64_t v6 = *(void *)(v5 + 72);
    }
    else
    {
      do
      {
        uint64_t v6 = v5;
        uint64_t v5 = [(id)v5 superentity];
      }
      while (v5);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [(NSArray *)objects countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(objects);
        }
        if ((objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v10), "entity"), "isKindOfEntity:", v6) & 1) == 0)
        {

          v13 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v14 = *MEMORY[0x1E4F1C3C8];
          v23 = @"objectIDs";
          v24 = objects;
          uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
          v16 = @"mismatched objectIDs in batch delete initializer";
          v17 = v13;
          uint64_t v18 = v14;
          goto LABEL_17;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)objects countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v8);
  }
  objc_super v11 = objc_alloc_init(NSFetchRequest);
  [(NSFetchRequest *)v11 setEntity:v6];
  -[NSFetchRequest setPredicate:](v11, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF IN %@", objects]);
  [(NSFetchRequest *)v11 setIncludesPendingChanges:0];
  [(NSFetchRequest *)v11 setResultType:1];
  [(NSFetchRequest *)v11 _incrementInUseCounter];
  return [(NSBatchDeleteRequest *)self initWithFetchRequest:v11];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<NSBatchDeleteRequest : resultType : %ld, fetch :%@ >", self->_resultType, self->_deleteTarget];
}

- (void)_setSecureOperation:(BOOL)a3
{
  self->_flags = a3;
}

@end