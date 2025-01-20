@interface CPLPushRepositoryStorage
- (BOOL)getRelatedScopedIdentifier:(id *)a3 forRecordWithScopedIdentifier:(id)a4;
- (BOOL)hasChangesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (CPLEnginePushRepository)pushRepository;
- (CPLPushRepositoryStorage)initWithPushRepository:(id)a3;
- (id)changeWithScopedIdentifier:(id)a3;
- (id)changesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4;
- (id)scopedIdentifierAddingScopeIndexForScopedIdentifier:(id)a3;
- (id)storageDescription;
@end

@implementation CPLPushRepositoryStorage

- (BOOL)hasChangesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6 = a3;
  v7 = [(CPLPushRepositoryStorage *)self pushRepository];
  v8 = [(CPLPushRepositoryStorage *)self scopedIdentifierAddingScopeIndexForScopedIdentifier:v6];

  LOBYTE(a4) = [v7 hasChangesWithRelatedScopedIdentifier:v8 class:a4];
  return (char)a4;
}

- (BOOL)getRelatedScopedIdentifier:(id *)a3 forRecordWithScopedIdentifier:(id)a4
{
  id v6 = a4;
  v7 = [(CPLPushRepositoryStorage *)self pushRepository];
  v8 = [(CPLPushRepositoryStorage *)self scopedIdentifierAddingScopeIndexForScopedIdentifier:v6];

  LOBYTE(a3) = [v7 getRelatedScopedIdentifier:a3 forRecordWithScopedIdentifier:v8];
  return (char)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushRepository, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
}

- (CPLEnginePushRepository)pushRepository
{
  return self->_pushRepository;
}

- (id)changesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  pushRepository = self->_pushRepository;
  id v6 = [(CPLPushRepositoryStorage *)self scopedIdentifierAddingScopeIndexForScopedIdentifier:a3];
  v7 = [(CPLEnginePushRepository *)pushRepository allChangesWithClass:a4 relatedScopedIdentifier:v6];

  return v7;
}

- (id)changeWithScopedIdentifier:(id)a3
{
  pushRepository = self->_pushRepository;
  v4 = [(CPLPushRepositoryStorage *)self scopedIdentifierAddingScopeIndexForScopedIdentifier:a3];
  v5 = [(CPLEnginePushRepository *)pushRepository changeWithScopedIdentifier:v4];

  return v5;
}

- (id)scopedIdentifierAddingScopeIndexForScopedIdentifier:(id)a3
{
  id v5 = a3;
  if ([v5 scopeIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t storageScopeType = self->_storageScopeType;
    if (storageScopeType == 2)
    {
      id v7 = [(CPLEngineScopeStorage *)self->_scopes scopedIdentifierForCloudScopedIdentifier:v5];
    }
    else
    {
      if (storageScopeType != 1)
      {
        v10 = [MEMORY[0x1E4F28B00] currentHandler];
        v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStorageViews.m"];
        [v10 handleFailureInMethod:a2, self, v11, 44, @"Invalid scope type for %@: %ld", self->_pushRepository, self->_storageScopeType object file lineNumber description];

        abort();
      }
      id v7 = [(CPLEngineScopeStorage *)self->_scopes scopedIdentifierForLocalScopedIdentifier:v5];
    }
  }
  else
  {
    id v7 = v5;
  }
  v8 = v7;

  return v8;
}

- (id)storageDescription
{
  return [(CPLEngineStorage *)self->_pushRepository name];
}

- (CPLPushRepositoryStorage)initWithPushRepository:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPLPushRepositoryStorage;
  id v6 = [(CPLPushRepositoryStorage *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pushRepository, a3);
    v7->_unint64_t storageScopeType = [(CPLEnginePushRepository *)v7->_pushRepository scopeType];
    v8 = [v5 engineStore];
    uint64_t v9 = [v8 scopes];
    scopes = v7->_scopes;
    v7->_scopes = (CPLEngineScopeStorage *)v9;
  }
  return v7;
}

@end