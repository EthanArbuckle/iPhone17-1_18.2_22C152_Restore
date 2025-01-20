@interface LSApplicationIdentityMigrationResult
- (LSApplicationIdentityMigrationResult)init;
- (id)bestMigratedIdentityForIdentity:(id)a3;
- (id)migratedIdentitiesForIdentity:(id)a3;
- (void)noteIdentityDoesNotNeedMigration:(uint64_t)a1;
@end

@implementation LSApplicationIdentityMigrationResult

- (void)noteIdentityDoesNotNeedMigration:(uint64_t)a1
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    v6[0] = v3;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    [*(id *)(a1 + 8) setObject:v5 forKeyedSubscript:v4];
  }
}

- (LSApplicationIdentityMigrationResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)LSApplicationIdentityMigrationResult;
  v2 = [(LSApplicationIdentityMigrationResult *)&v6 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    migratedIdentities = v2->_migratedIdentities;
    v2->_migratedIdentities = v3;
  }
  return v2;
}

- (id)migratedIdentitiesForIdentity:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_migratedIdentities objectForKeyedSubscript:a3];
  if (v3) {
    [MEMORY[0x1E4F1CAD0] setWithArray:v3];
  }
  else {
  v4 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v4;
}

- (id)bestMigratedIdentityForIdentity:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_migratedIdentities objectForKeyedSubscript:a3];
  v4 = [v3 firstObject];

  return v4;
}

- (void).cxx_destruct
{
}

@end