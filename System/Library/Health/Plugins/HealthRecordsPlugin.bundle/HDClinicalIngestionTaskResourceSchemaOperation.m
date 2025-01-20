@interface HDClinicalIngestionTaskResourceSchemaOperation
+ (id)new;
- (HDClinicalIngestionTaskAccountContext)accountContext;
- (HDClinicalIngestionTaskResourceSchemaOperation)init;
- (HDClinicalIngestionTaskResourceSchemaOperation)initWithResourceSchema:(id)a3 accountContext:(id)a4;
- (HDFHIRResourceSchema)schema;
- (NSNumber)atLeastOneFetchSucceeded;
- (id)initialWorkItem;
- (id)newResourceFetchOperationWithPredefinedURL:(id)a3;
- (id)runResourceFetchOperationForURL:(id)a3;
- (void)main;
@end

@implementation HDClinicalIngestionTaskResourceSchemaOperation

+ (id)new
{
  v2 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v2, objc_opt_class() format];

  return 0;
}

- (HDClinicalIngestionTaskResourceSchemaOperation)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (HDClinicalIngestionTaskResourceSchemaOperation)initWithResourceSchema:(id)a3 accountContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDClinicalIngestionTaskResourceSchemaOperation;
  v8 = [(HDClinicalIngestionTaskResourceSchemaOperation *)&v14 init];
  if (v8)
  {
    v9 = (HDFHIRResourceSchema *)[v6 copy];
    schema = v8->_schema;
    v8->_schema = v9;

    objc_storeStrong((id *)&v8->_accountContext, a4);
    v8->_resourceFetchOperationsByURLsLock._os_unfair_lock_opaque = 0;
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    resourceFetchOperationsByURLs = v8->_resourceFetchOperationsByURLs;
    v8->_resourceFetchOperationsByURLs = v11;
  }
  return v8;
}

- (void)main
{
  id v15 = objc_alloc_init((Class)NSMutableArray);
  v3 = [(HDClinicalIngestionTaskResourceSchemaOperation *)self initialWorkItem];
  [v15 addObject:v3];
  LOBYTE(v4) = 0;
  do
  {
    id v6 = objc_msgSend(v15, "hk_dequeue");
    [v6 start];
    id v7 = [v6 outcome];
    v8 = v7;
    if (v4) {
      unsigned int v4 = 1;
    }
    else {
      unsigned int v4 = [v7 fetchSuccess];
    }
    v9 = [v8 followUpWorkItems];
    id v10 = [v9 count];

    if (v10)
    {
      v11 = [v8 followUpWorkItems];
      [v15 addObjectsFromArray:v11];
    }
    accountContext = self->_accountContext;
    v13 = [v8 saveableResources];
    [(HDClinicalIngestionTaskAccountContext *)accountContext saveResourceObjects:v13];
  }
  while ([v15 count]);
  if (v4) {
    objc_super v14 = &__kCFBooleanTrue;
  }
  else {
    objc_super v14 = &__kCFBooleanFalse;
  }
  objc_storeStrong((id *)&self->_atLeastOneFetchSucceeded, v14);
}

- (id)initialWorkItem
{
  id v3 = [(HDClinicalIngestionTaskResourceSchemaOperation *)self newResourceFetchOperationWithPredefinedURL:0];
  unsigned int v4 = [[HDClinicalIngestionTaskWorkItem alloc] initWithResourceFetchOperation:v3 schemaContext:self];

  return v4;
}

- (id)runResourceFetchOperationForURL:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HDClinicalIngestionTaskResourceSchemaOperation.m", 74, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];
  }
  if ([(HDClinicalIngestionTaskAccountContext *)self->_accountContext mayMakeRequests])
  {
    os_unfair_lock_lock(&self->_resourceFetchOperationsByURLsLock);
    uint64_t v6 = [(NSMutableDictionary *)self->_resourceFetchOperationsByURLs objectForKeyedSubscript:v5];
    if (v6)
    {
      id v7 = (id)v6;
      os_unfair_lock_unlock(&self->_resourceFetchOperationsByURLsLock);
    }
    else
    {
      id v7 = [(HDClinicalIngestionTaskResourceSchemaOperation *)self newResourceFetchOperationWithPredefinedURL:v5];
      if (!v7)
      {
        id v10 = +[NSAssertionHandler currentHandler];
        [v10 handleFailureInMethod:a2, self, @"HDClinicalIngestionTaskResourceSchemaOperation.m", 86, @"Invalid parameter not satisfying: %@", @"operation" object file lineNumber description];
      }
      [(NSMutableDictionary *)self->_resourceFetchOperationsByURLs setObject:v7 forKeyedSubscript:v5];
      os_unfair_lock_unlock(&self->_resourceFetchOperationsByURLsLock);
      [v7 start];
    }
    [v7 waitUntilFinished];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)newResourceFetchOperationWithPredefinedURL:(id)a3
{
  id v4 = a3;
  id v5 = [HDFHIRIngestionResourceFetchOperation alloc];
  uint64_t v6 = [(HDClinicalIngestionTaskAccountContext *)self->_accountContext task];
  id v7 = [(HDClinicalIngestionTaskAccountContext *)self->_accountContext account];
  v8 = [(HDClinicalIngestionTaskAccountContext *)self->_accountContext session];
  v9 = [(HDFHIRIngestionResourceFetchOperation *)v5 initWithTask:v6 account:v7 nextOperation:0 session:v8 queryMode:[(HDClinicalIngestionTaskAccountContext *)self->_accountContext queryMode] resourceSchema:self->_schema];

  [(HDFHIRIngestionResourceFetchOperation *)v9 setFullRequestURL:v4];
  return v9;
}

- (HDClinicalIngestionTaskAccountContext)accountContext
{
  return self->_accountContext;
}

- (HDFHIRResourceSchema)schema
{
  return self->_schema;
}

- (NSNumber)atLeastOneFetchSucceeded
{
  return self->_atLeastOneFetchSucceeded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atLeastOneFetchSucceeded, 0);
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_accountContext, 0);

  objc_storeStrong((id *)&self->_resourceFetchOperationsByURLs, 0);
}

@end