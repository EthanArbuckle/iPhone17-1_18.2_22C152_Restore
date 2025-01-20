@interface _CPLOptimisticIDMapping
- (BOOL)addCloudScopedIdentifier:(id)a3 forLocalScopedIdentifier:(id)a4 isFinal:(BOOL)a5 direction:(unint64_t)a6 error:(id *)a7;
- (CPLEngineIDMapping)idMapping;
- (_CPLOptimisticIDMapping)initWithIDMapping:(id)a3;
- (id)cloudScopedIdentifierForLocalScopedIdentifier:(id)a3 isFinal:(BOOL *)a4;
- (id)firstAvailableCloudScopedIdentifierForProposedCloudScopedIdentifier:(id)a3;
- (id)localScopedIdentifierForCloudScopedIdentifier:(id)a3 isFinal:(BOOL *)a4;
- (id)localScopedIdentifierForCloudScopedIdentifierIncludeRemappedRecords:(id)a3;
- (id)setupCloudScopedIdentifier:(id)a3 forLocalScopedIdentifier:(id)a4 isFinal:(BOOL)a5 direction:(unint64_t)a6 error:(id *)a7;
@end

@implementation _CPLOptimisticIDMapping

- (void).cxx_destruct
{
}

- (CPLEngineIDMapping)idMapping
{
  return self->_idMapping;
}

- (id)setupCloudScopedIdentifier:(id)a3 forLocalScopedIdentifier:(id)a4 isFinal:(BOOL)a5 direction:(unint64_t)a6 error:(id *)a7
{
  return [(CPLEngineIDMapping *)self->_idMapping setupCloudScopedIdentifier:a3 forLocalScopedIdentifier:a4 isFinal:a5 direction:a6 error:a7];
}

- (id)localScopedIdentifierForCloudScopedIdentifierIncludeRemappedRecords:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineIDMapping *)self->_idMapping localScopedIdentifierForCloudScopedIdentifierIncludeRemappedRecords:v4];
  if (!v5) {
    v5 = (void *)[v4 copy];
  }

  return v5;
}

- (id)localScopedIdentifierForCloudScopedIdentifier:(id)a3 isFinal:(BOOL *)a4
{
  id v6 = a3;
  v7 = [(CPLEngineIDMapping *)self->_idMapping localScopedIdentifierForCloudScopedIdentifier:v6 isFinal:a4];
  if (!v7) {
    v7 = (void *)[v6 copy];
  }

  return v7;
}

- (id)firstAvailableCloudScopedIdentifierForProposedCloudScopedIdentifier:(id)a3
{
  return [(CPLEngineIDMapping *)self->_idMapping firstAvailableCloudScopedIdentifierForProposedCloudScopedIdentifier:a3];
}

- (id)cloudScopedIdentifierForLocalScopedIdentifier:(id)a3 isFinal:(BOOL *)a4
{
  id v6 = a3;
  v7 = [(CPLEngineIDMapping *)self->_idMapping cloudScopedIdentifierForLocalScopedIdentifier:v6 isFinal:a4];
  if (!v7)
  {
    v8 = (void *)[v6 copy];
    v7 = [(CPLEngineIDMapping *)self->_idMapping firstAvailableCloudScopedIdentifierForProposedCloudScopedIdentifier:v8];
  }
  return v7;
}

- (BOOL)addCloudScopedIdentifier:(id)a3 forLocalScopedIdentifier:(id)a4 isFinal:(BOOL)a5 direction:(unint64_t)a6 error:(id *)a7
{
  return [(CPLEngineIDMapping *)self->_idMapping addCloudScopedIdentifier:a3 forLocalScopedIdentifier:a4 isFinal:a5 direction:a6 error:a7];
}

- (_CPLOptimisticIDMapping)initWithIDMapping:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CPLOptimisticIDMapping;
  id v6 = [(_CPLOptimisticIDMapping *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_idMapping, a3);
  }

  return v7;
}

@end