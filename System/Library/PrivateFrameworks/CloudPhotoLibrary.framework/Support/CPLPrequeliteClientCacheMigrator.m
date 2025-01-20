@interface CPLPrequeliteClientCacheMigrator
+ (id)platformImplementationProtocol;
- (CPLEngineStore)engineStore;
- (CPLPlatformObject)platformObject;
- (CPLPrequeliteClientCacheMigrator)initWithStore:(id)a3;
- (CPLPrequeliteStore)store;
- (NSString)description;
- (NSString)name;
@end

@implementation CPLPrequeliteClientCacheMigrator

- (CPLPrequeliteClientCacheMigrator)initWithStore:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPLPrequeliteClientCacheMigrator;
  v6 = [(CPLPrequeliteClientCacheMigrator *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_store, v5);
    v8 = +[CPLPlatform currentPlatform];
    v9 = (CPLPlatformObject *)[v8 newPlatformImplementationForObject:v7];
    platformObject = v7->_platformObject;
    v7->_platformObject = v9;

    if (!v7->_platformObject) {
      sub_1001D3178((uint64_t)v7, (uint64_t)a2);
    }
  }

  return v7;
}

+ (id)platformImplementationProtocol
{
  return &OBJC_PROTOCOL___CPLEngineClientCacheImplementation;
}

- (CPLEngineStore)engineStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  v3 = [WeakRetained abstractObject];

  return (CPLEngineStore *)v3;
}

- (NSString)name
{
  return (NSString *)@"clientCache";
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(CPLPrequeliteClientCacheMigrator *)self name];
  id v5 = +[NSString stringWithFormat:@"[%@ %@]", v3, v4];

  return (NSString *)v5;
}

- (CPLPlatformObject)platformObject
{
  return self->_platformObject;
}

- (CPLPrequeliteStore)store
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  return (CPLPrequeliteStore *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_store);
  objc_storeStrong((id *)&self->_platformObject, 0);
}

@end