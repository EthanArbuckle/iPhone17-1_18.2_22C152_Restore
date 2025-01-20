@interface CPLUnacknowledgedChangeStorage
- (CPLEngineStore)store;
- (CPLUnacknowledgedChangeStorage)initWithStore:(id)a3;
- (id)changeWithScopedIdentifier:(id)a3;
- (id)changesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (id)storageDescription;
@end

@implementation CPLUnacknowledgedChangeStorage

- (void).cxx_destruct
{
}

- (CPLEngineStore)store
{
  return self->_store;
}

- (id)storageDescription
{
  return @"pendingChanges";
}

- (id)changesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStorageViews.m"];
  v9 = NSStringFromSelector(a2);
  v10 = [(CPLUnacknowledgedChangeStorage *)self storageDescription];
  [v7 handleFailureInMethod:a2, self, v8, 167, @"%@ on %@ should not be useful here", v9, v10 object file lineNumber description];

  abort();
}

- (id)changeWithScopedIdentifier:(id)a3
{
  v3 = [(CPLEngineStore *)self->_store unacknowledgedChangeWithLocalScopedIdentifier:a3];
  v4 = (void *)[v3 copy];

  return v4;
}

- (CPLUnacknowledgedChangeStorage)initWithStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLUnacknowledgedChangeStorage;
  id v6 = [(CPLUnacknowledgedChangeStorage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_store, a3);
  }

  return v7;
}

@end