@interface NSSQLStoreRequestContext
- (BOOL)executeRequestCore:(id *)a3;
- (BOOL)executeRequestUsingConnection:(id)a3;
- (BOOL)isWritingRequest;
- (NSPersistentStoreRequest)persistentStoreRequest;
- (NSSQLRowCache)rowCache;
- (NSSQLStoreRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5;
- (id)result;
- (uint64_t)createNestedObjectFaultContextForObjectWithID:(uint64_t)result;
- (uint64_t)debugLogLevel;
- (void)dealloc;
- (void)setConnection:(uint64_t)a1;
- (void)setQueryGenerationToken:(id *)a1;
- (void)setResult:(id)a3;
@end

@implementation NSSQLStoreRequestContext

- (NSPersistentStoreRequest)persistentStoreRequest
{
  return self->_persistentStoreRequest;
}

- (void)setQueryGenerationToken:(id *)a1
{
  if (a1
    && ([a1 isWritingRequest] & 1) == 0
    && [a1[1] supportsGenerationalQuerying])
  {
    if ([a2 _isEnabled])
    {
      a1[8] = -[_NSQueryGenerationToken _generationalComponentForStore:]((uint64_t)a2, a1[1]);
    }
    else
    {

      a1[8] = 0;
    }
  }
}

- (BOOL)isWritingRequest
{
  return 0;
}

- (NSSQLStoreRequestContext)initWithRequest:(id)a3 context:(id)a4 sqlCore:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)NSSQLStoreRequestContext;
  v8 = [(NSSQLStoreRequestContext *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_sqlCore = (NSSQLCore *)a5;
    v8->_persistentStoreRequest = (NSPersistentStoreRequest *)a3;
    v9->_context = (NSManagedObjectContext *)a4;
    v9->_useColoredLogging = +[NSSQLCore coloredLoggingDefault];
    v9->_useConcurrentFetching = +[NSSQLCore useConcurrentFetching];
    if (a5)
    {
      v9->_hasHistoryTracking = (*((_DWORD *)a5 + 50) & 0x400) != 0;
      int v10 = (*((unsigned __int8 *)a5 + 201) >> 6) & 1;
    }
    else
    {
      LOBYTE(v10) = 0;
      v9->_hasHistoryTracking = 0;
    }
    v9->_storeIsInMemory = v10;
    -[NSSQLStoreRequestContext setQueryGenerationToken:]((id *)&v9->super.isa, (void *)[(NSManagedObjectContext *)v9->_context _queryGenerationToken]);
  }
  return v9;
}

- (void)dealloc
{
  if (self->_connection)
  {
    NSLog((NSString *)@"API misuse: there shouldn't be a connection here", a2);
    __break(1u);
  }
  else
  {
    self->_sqlCore = 0;

    self->_queryGeneration = 0;
    self->_persistentStoreRequest = 0;

    self->_context = 0;
    self->_error = 0;

    self->_exception = 0;
    self->_result = 0;

    self->_connection = 0;
    v3.receiver = self;
    v3.super_class = (Class)NSSQLStoreRequestContext;
    [(NSSQLStoreRequestContext *)&v3 dealloc];
  }
}

- (id)result
{
  return self->_result;
}

- (uint64_t)debugLogLevel
{
  if (result) {
    return +[NSSQLCore debugDefault];
  }
  return result;
}

- (NSSQLRowCache)rowCache
{
  return (NSSQLRowCache *)-[NSSQLCore rowCacheForGeneration:](&self->_sqlCore->super.super.isa, self->_queryGeneration);
}

- (BOOL)executeRequestUsingConnection:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id newValue = 0;
  BOOL v5 = [(NSSQLStoreRequestContext *)self isWritingRequest];
  if (self) {
    queryGeneration = self->_queryGeneration;
  }
  else {
    queryGeneration = 0;
  }
  -[NSSQLStoreRequestContext setConnection:]((uint64_t)self, a3);
  -[NSSQLiteConnection connect]((uint64_t)a3);
  int64x2_t v19 = 0u;
  if (self && (context = self->_context) != 0 && (*((unsigned char *)&context->_flags + 3) & 0x40) != 0)
  {
    [(NSSQLiteConnection *)(uint64_t)a3 currentStats];
    int64x2_t v19 = v24;
    uint64_t v8 = v25;
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (queryGeneration) {
    char v9 = v5;
  }
  else {
    char v9 = 1;
  }
  if (v9)
  {
    int v10 = 0;
  }
  else
  {
    -[NSSQLiteConnection beginReadTransaction]((uint64_t)a3);
    uint64_t v11 = -[NSSQLiteConnection adoptQueryGenerationWithIdentifier:]((uint64_t)a3, (uint64_t)queryGeneration[3].super.isa);
    if (v11)
    {
      v27 = @"NSSQLiteErrorDomain";
      v28[0] = [NSNumber numberWithInt:v11];
      v17 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      id v18 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3A8], (int)v11, @"Database connection failed to adopt query generation", v17);
      -[_NSCoreDataException _setDomain:]((uint64_t)v18, @"NSSQLiteErrorDomain");
      objc_exception_throw(v18);
    }
    int v10 = 1;
  }
  BOOL v13 = -[NSSQLStoreRequestContext executeRequestCore:](self, "executeRequestCore:", &newValue, *(_OWORD *)&v19);
  if ((v9 & 1) == 0)
  {
    -[NSSQLiteConnection commitTransaction]((uint64_t)a3);
    int v10 = 0;
  }
  if (self)
  {
    v14 = self->_context;
    if (v14)
    {
      if ((*((unsigned char *)&v14->_flags + 3) & 0x40) != 0)
      {
        int64x2_t v24 = 0u;
        long long v25 = 0u;
        [(NSSQLiteConnection *)(uint64_t)a3 currentStats];
        v15 = self->_context;
        int64x2_t v21 = vsubq_s64(v24, v20);
        uint64_t v22 = v25 - v8;
        uint64_t v23 = *((void *)&v25 + 1);
        -[NSManagedObjectContext _updateDatabaseStaticsWithCacheStats:]((uint64_t)v15, (int8x16_t *)&v21);
      }
    }
  }
  if (v10)
  {
    -[NSSQLiteConnection endFetchAndRecycleStatement:]((uint64_t)a3, 0);
    -[NSSQLiteConnection rollbackTransaction]((uint64_t)a3);
  }
  if (self && newValue) {
    objc_setProperty_nonatomic(self, v12, newValue, 40);
  }
  -[NSSQLStoreRequestContext setConnection:]((uint64_t)self, 0);
  return v13;
}

- (void)setConnection:(uint64_t)a1
{
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    if (v4 != a2)
    {
      if (a2)
      {
        if (v4) {
          objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"*RequestContext connection may not be reset" userInfo:0]);
        }
      }
      id v5 = a2;

      *(void *)(a1 + 24) = a2;
    }
  }
}

- (void)setResult:(id)a3
{
}

- (uint64_t)createNestedObjectFaultContextForObjectWithID:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    v4 = [NSSQLObjectFaultRequestContext alloc];
    uint64_t v5 = *(void *)(v3 + 32);
    uint64_t v6 = *(void *)(v3 + 8);
    return (uint64_t)[(NSSQLObjectFaultRequestContext *)v4 initWithObjectID:a2 context:v5 sqlCore:v6];
  }
  return result;
}

- (BOOL)executeRequestCore:(id *)a3
{
  return 0;
}

@end