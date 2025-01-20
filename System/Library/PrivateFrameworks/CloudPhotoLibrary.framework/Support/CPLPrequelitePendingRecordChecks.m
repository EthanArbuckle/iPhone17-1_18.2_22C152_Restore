@interface CPLPrequelitePendingRecordChecks
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)dequeueCloudScopedIdentifiersToCheck:(id)a3 error:(id *)a4;
- (BOOL)enqueueCloudScopedIdentifiersToCheck:(id)a3 error:(id *)a4;
- (BOOL)hasRecordsToCheckWithScopeIdentifier:(id)a3;
- (BOOL)initializeStorage;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (id)nextBatchOfRecordsToCheckWithScopeIdentifier:(id)a3;
- (id)status;
@end

@implementation CPLPrequelitePendingRecordChecks

- (BOOL)initializeStorage
{
  v5.receiver = self;
  v5.super_class = (Class)CPLPrequelitePendingRecordChecks;
  BOOL v3 = [(CPLPrequeliteStorage *)&v5 initializeStorage];
  if (v3)
  {
    BOOL v3 = [(CPLPrequeliteStorage *)self createMainTableWithDefinition:@"scopeIndex INTEGER NOT NULL,identifier TEXT NOT NULL" error:0];
    if (v3)
    {
      BOOL v3 = [(CPLPrequeliteStorage *)self createIndexOnColumn:@"scopeIndex" error:0];
      if (v3) {
        LOBYTE(v3) = [(CPLPrequeliteStorage *)self createIndexWithName:@"scopedIdentifier" withDefinition:@"scopeIndex, identifier" unique:1 error:0];
      }
    }
  }
  return v3;
}

- (BOOL)upgradeStorageToVersion:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CPLPrequelitePendingRecordChecks;
  BOOL v5 = -[CPLPrequeliteStorage upgradeStorageToVersion:](&v7, "upgradeStorageToVersion:");
  if (a3 == 72 && v5) {
    LOBYTE(v5) = [(CPLPrequeliteStorage *)self createStorage];
  }
  return v5;
}

- (BOOL)enqueueCloudScopedIdentifiersToCheck:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [(CPLPrequeliteStorage *)self pqStore];
  objc_super v7 = [v6 pqlConnection];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (![v13 scopeIndex]) {
          sub_1001D3080((uint64_t)v13, (uint64_t)a2, (uint64_t)self);
        }
        v14 = [(CPLPrequeliteStorage *)self mainTable];
        id v15 = [v13 scopeIndex];
        v16 = [v13 identifier];
        LODWORD(v15) = [v7 cplExecute:@"INSERT OR IGNORE INTO %@ (scopeIndex, identifier) VALUES (%ld, %@)", v14, v15, v16];

        if (!v15)
        {

          if (a4)
          {
            [v7 lastError];
            BOOL v17 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            BOOL v17 = 0;
          }
          goto LABEL_14;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  BOOL v17 = 1;
LABEL_14:

  return v17;
}

- (id)nextBatchOfRecordsToCheckWithScopeIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CPLPrequeliteStorage *)self cloudScopeIndexForScopeIdentifier:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = &__NSArray0__struct;
  }
  else
  {
    int64_t v7 = v5;
    id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:200];
    id v9 = [(CPLPrequeliteStorage *)self pqStore];
    id v10 = [v9 pqlConnection];

    uint64_t v11 = [(CPLPrequeliteStorage *)self mainTable];
    id v12 = [v10 cplFetch:@"SELECT identifier FROM %@ WHERE scopeIndex = %ld LIMIT %lu", v11, v7, 200];

    if ([v12 next])
    {
      do
      {
        id v13 = objc_alloc((Class)CPLScopedIdentifier);
        v14 = [v12 stringAtIndex:0];
        id v15 = [v13 initWithScopeIdentifier:v4 identifier:v14 scopeIndex:v7];

        [v8 addObject:v15];
      }
      while (([v12 next] & 1) != 0);
    }
    id v6 = [v8 copy];
  }
  return v6;
}

- (BOOL)dequeueCloudScopedIdentifiersToCheck:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(CPLPrequeliteStorage *)self pqStore];
  v27 = [v7 pqlConnection];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v9)
  {

    uint64_t v11 = 0;
    char v23 = 1;
    goto LABEL_18;
  }
  id v10 = v9;
  v25 = a4;
  uint64_t v11 = 0;
  int64_t v12 = 0;
  uint64_t v13 = *(void *)v29;
  unsigned __int8 v26 = 1;
  do
  {
    v14 = v8;
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v29 != v13) {
        objc_enumerationMutation(v14);
      }
      v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      if (!v11
        || ([*(id *)(*((void *)&v28 + 1) + 8 * i) scopeIdentifier],
            BOOL v17 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v18 = [v17 isEqualToString:v11],
            v17,
            (v18 & 1) == 0))
      {
        uint64_t v19 = [v16 scopeIdentifier];

        int64_t v20 = [(CPLPrequeliteStorage *)self cloudScopeIndexForScopeIdentifier:v19];
        if (v20 == 0x7FFFFFFFFFFFFFFFLL)
        {
          int64_t v12 = 0;
          uint64_t v11 = (void *)v19;
          continue;
        }
        int64_t v12 = v20;
        uint64_t v11 = (void *)v19;
      }
      if (v12)
      {
        long long v21 = [(CPLPrequeliteStorage *)self mainTable];
        long long v22 = [v16 identifier];
        unsigned __int8 v26 = [v27 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld AND identifier = %@", v21, v12, v22];
      }
    }
    id v8 = v14;
    id v10 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
  }
  while (v10);

  char v23 = v26;
  if (!((v25 == 0) | v26 & 1))
  {
    [v27 lastError];
    char v23 = 0;
    id *v25 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_18:

  return v23 & 1;
}

- (BOOL)hasRecordsToCheckWithScopeIdentifier:(id)a3
{
  int64_t v4 = [(CPLPrequeliteStorage *)self cloudScopeIndexForScopeIdentifier:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  int64_t v6 = v4;
  int64_t v7 = [(CPLPrequeliteStorage *)self pqStore];
  id v8 = [(CPLPrequeliteStorage *)self mainTable];
  id v9 = +[PQLFormatInjection formatInjection:@"scopeIndex = %ld", v6];
  unsigned __int8 v10 = [v7 table:v8 hasRecordsMatchingQuery:v9];

  return v10;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  uint64_t v11 = [(CPLPrequeliteStorage *)self pqStore];
  int64_t v12 = [v11 pqlConnection];

  uint64_t v13 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned int v14 = [v12 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld LIMIT %ld", v13, a3, a4];

  if (v14)
  {
    *a5 = (int64_t)[v12 changes];
  }
  else if (a6)
  {
    *a6 = [v12 lastError];
  }

  return v14;
}

- (id)status
{
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  int64_t v4 = [(CPLPrequeliteStorage *)self mainTable];
  id v5 = [v3 tableCountOfRecords:v4];

  if (v5)
  {
    int64_t v6 = +[NSString stringWithFormat:@"%lu records need to be checked in the Cloud", v5];
  }
  else
  {
    int64_t v6 = 0;
  }
  return v6;
}

@end