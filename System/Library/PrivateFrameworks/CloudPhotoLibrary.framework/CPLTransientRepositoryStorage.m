@interface CPLTransientRepositoryStorage
- (CPLEngineTransientRepository)transientRepository;
- (CPLTransientRepositoryStorage)initWithTransientRepository:(id)a3;
- (id)changeWithScopedIdentifier:(id)a3;
- (id)changesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (id)storageDescription;
@end

@implementation CPLTransientRepositoryStorage

- (void).cxx_destruct
{
}

- (CPLEngineTransientRepository)transientRepository
{
  return self->_transientRepository;
}

- (id)changesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStorageViews.m"];
  v9 = NSStringFromSelector(a2);
  [v7 handleFailureInMethod:a2, self, v8, 79, @"%@ is not implemented on %@", v9, objc_opt_class() object file lineNumber description];

  abort();
}

- (id)changeWithScopedIdentifier:(id)a3
{
  return [(CPLEngineTransientRepository *)self->_transientRepository changeWithScopedIdentifier:a3];
}

- (id)storageDescription
{
  return [(CPLEngineStorage *)self->_transientRepository name];
}

- (CPLTransientRepositoryStorage)initWithTransientRepository:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLTransientRepositoryStorage;
  id v6 = [(CPLTransientRepositoryStorage *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_transientRepository, a3);
  }

  return v7;
}

@end