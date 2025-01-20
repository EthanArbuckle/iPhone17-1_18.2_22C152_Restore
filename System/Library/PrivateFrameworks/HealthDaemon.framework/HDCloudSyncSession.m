@interface HDCloudSyncSession
- (BOOL)requiresSyncForChangesFromAnchorRangeMap:(id)a3;
- (HDCloudSyncSequenceRecord)sequenceRecord;
- (id)excludedSyncIdentities;
- (id)excludedSyncStores;
- (id)newChangeWithSyncEntityClass:(Class)a3 version:(id)a4;
- (id)syncPredicate;
- (int64_t)maxEncodedBytesPerChangeSetForSyncEntityClass:(Class)a3;
- (int64_t)maxEncodedBytesPerCodableChangeForSyncEntityClass:(Class)a3;
- (void)setExcludedSyncIdentities:(id)a3;
- (void)setExcludedSyncStores:(id)a3;
- (void)setSequenceRecord:(id)a3;
@end

@implementation HDCloudSyncSession

- (id)excludedSyncStores
{
  return self->_excludedSyncStores;
}

- (void)setExcludedSyncStores:(id)a3
{
  id v4 = a3;
  id v7 = [(HDSyncSession *)self syncStore];
  v5 = [v4 setByAddingObject:v7];

  excludedSyncStores = self->_excludedSyncStores;
  self->_excludedSyncStores = v5;
}

- (id)excludedSyncIdentities
{
  return self->_excludedSyncIdentities;
}

- (void)setExcludedSyncIdentities:(id)a3
{
}

- (id)newChangeWithSyncEntityClass:(Class)a3 version:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)maxEncodedBytesPerCodableChangeForSyncEntityClass:(Class)a3
{
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()]) {
    return 0x20000;
  }

  return [(HDCloudSyncSession *)self maxEncodedBytesPerChangeSetForSyncEntityClass:a3];
}

- (int64_t)maxEncodedBytesPerChangeSetForSyncEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return 3145728;
  }
  else {
    return 0x80000;
  }
}

- (id)syncPredicate
{
  v29.receiver = self;
  v29.super_class = (Class)HDCloudSyncSession;
  v3 = [(HDSyncSession *)&v29 syncPredicate];
  id v4 = [(HDSyncSession *)self syncStore];
  v5 = [v3 dateInterval];
  v6 = [v5 startDate];
  id v7 = [v4 shardPredicate];
  v8 = [v7 startDate];
  uint64_t v9 = HKDateMin();

  v10 = [v3 dateInterval];
  v11 = [v10 endDate];
  v12 = [v4 shardPredicate];
  v13 = [v12 endDate];
  uint64_t v14 = HKDateMax();

  v28 = v4;
  if (!(v9 | v14))
  {
    v17 = 0;
    goto LABEL_11;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28C18]);
  v16 = v15;
  if (v9)
  {
    if (v14)
    {
      v17 = (void *)[v15 initWithStartDate:v9 endDate:v14];
      goto LABEL_11;
    }
    v18 = (void *)v9;
LABEL_9:
    v19 = [MEMORY[0x1E4F1C9C8] distantFuture];
    v17 = (void *)[v16 initWithStartDate:v18 endDate:v19];

    if (v9) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v18 = [MEMORY[0x1E4F1C9C8] distantPast];
  if (!v14) {
    goto LABEL_9;
  }
  v17 = (void *)[v16 initWithStartDate:v18 endDate:v14];
LABEL_10:

LABEL_11:
  v20 = [HDSyncPredicate alloc];
  v21 = [v3 excludedSyncProvenances];
  v22 = [v3 includedObjectTypes];
  v23 = [v3 defaultMaximumObjectAge];
  v24 = [v3 defaultMaximumTombstoneAge];
  v25 = [v3 maximumObjectAgeByType];
  v26 = [(HDSyncPredicate *)v20 initWithExcludedSyncProvenances:v21 dateInterval:v17 includedObjectTypes:v22 defaultMaximumObjectAge:v23 defaultMaximumTombstoneAge:v24 maximumObjectAgeByType:v25];

  return v26;
}

- (BOOL)requiresSyncForChangesFromAnchorRangeMap:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HDSyncSession *)self syncStore];
  [v5 primaryOrderedSyncEntities];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v15 = 0;
        uint64_t v16 = 0;
        uint64_t v15 = HDSyncAnchorRangeMake(-1, -1);
        uint64_t v16 = v11;
        v12 = [v10 syncEntityIdentifier];
        int v13 = [v4 getAnchorRange:&v15 forSyncEntityIdentifier:v12];

        if (v13 && v16 > v15)
        {
          LOBYTE(v7) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v7;
}

- (HDCloudSyncSequenceRecord)sequenceRecord
{
  return self->_sequenceRecord;
}

- (void)setSequenceRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequenceRecord, 0);
  objc_storeStrong((id *)&self->_excludedSyncIdentities, 0);
  objc_storeStrong((id *)&self->_filteredOrderedSyncEntities, 0);

  objc_storeStrong((id *)&self->_excludedSyncStores, 0);
}

@end