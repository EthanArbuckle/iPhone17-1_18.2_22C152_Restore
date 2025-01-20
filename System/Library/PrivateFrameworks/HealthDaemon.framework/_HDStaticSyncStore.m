@interface _HDStaticSyncStore
- (BOOL)canRecieveSyncObjectsForEntityClass:(Class)a3;
- (BOOL)enforceSyncEntityOrdering;
- (BOOL)shouldContinueAfterAnchorValidationError:(id)a3;
- (BOOL)shouldEnforceSequenceOrdering;
- (BOOL)supportsSpeculativeChangesForSyncEntityClass:(Class)a3;
- (HDProfile)profile;
- (NSString)description;
- (_HDStaticSyncStore)initWithProfile:(id)a3 storeIdentifier:(id)a4 error:(id *)a5;
- (id)databaseIdentifier;
- (id)orderedSyncEntities;
- (id)syncEntityDependenciesForSyncEntity:(Class)a3;
- (id)syncStoreDefaultSourceBundleIdentifier;
- (id)syncStoreIdentifier;
- (int)protocolVersion;
- (int64_t)expectedSequenceNumberForSyncEntityClass:(Class)a3;
- (int64_t)syncEpoch;
- (int64_t)syncProvenance;
- (int64_t)syncStoreType;
@end

@implementation _HDStaticSyncStore

- (_HDStaticSyncStore)initWithProfile:(id)a3 storeIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 database];
  v11 = +[HDSyncStoreEntity syncStoreEntityWithUUID:v9 type:5 healthDatabase:v10 error:a5];

  if (v11)
  {
    v16.receiver = self;
    v16.super_class = (Class)_HDStaticSyncStore;
    v12 = [(_HDStaticSyncStore *)&v16 init];
    v13 = v12;
    if (v12)
    {
      objc_storeWeak((id *)&v12->_profile, v8);
      v13->_syncProvenance = [v11 syncProvenance];
      objc_storeStrong((id *)&v13->_storeIdentifier, a4);
    }
    self = v13;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NSUUID *)self->_storeIdentifier UUIDString];
  v6 = [v3 stringWithFormat:@"<%@:%p storeIdentifier:%@>", v4, self, v5];

  return (NSString *)v6;
}

- (int)protocolVersion
{
  return 16;
}

- (BOOL)canRecieveSyncObjectsForEntityClass:(Class)a3
{
  return 1;
}

- (BOOL)enforceSyncEntityOrdering
{
  return 1;
}

- (int64_t)expectedSequenceNumberForSyncEntityClass:(Class)a3
{
  return 0;
}

- (id)orderedSyncEntities
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v3 = [WeakRetained syncEngine];
  uint64_t v4 = [v3 allOrderedSyncEntities];

  return v4;
}

- (BOOL)shouldContinueAfterAnchorValidationError:(id)a3
{
  return 0;
}

- (BOOL)shouldEnforceSequenceOrdering
{
  return 0;
}

- (BOOL)supportsSpeculativeChangesForSyncEntityClass:(Class)a3
{
  return 0;
}

- (id)syncEntityDependenciesForSyncEntity:(Class)a3
{
  return (id)[(objc_class *)a3 syncEntityDependenciesForSyncProtocolVersion:16];
}

- (int64_t)syncEpoch
{
  return 0;
}

- (int64_t)syncProvenance
{
  return self->_syncProvenance;
}

- (id)syncStoreDefaultSourceBundleIdentifier
{
  return @"com.apple.Health";
}

- (id)syncStoreIdentifier
{
  return self->_storeIdentifier;
}

- (id)databaseIdentifier
{
  return 0;
}

- (int64_t)syncStoreType
{
  return 5;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeIdentifier, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end