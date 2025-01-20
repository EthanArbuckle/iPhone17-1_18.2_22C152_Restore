@interface CPLEngineIgnoredRecords
- (BOOL)addIgnoredRecord:(id)a3 ignoredDate:(id)a4 otherScopeIndex:(int64_t)a5 error:(id *)a6;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)hasRecordWithScopedIdentifier:(id)a3;
- (BOOL)removeRecordWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)scopeIdentifier:(id)a3 hasIgnoredRecordsBeforeDate:(id)a4;
- (BOOL)setIgnoredDate:(id)a3 forRecordWithScopedIdentifier:(id)a4 error:(id *)a5;
- (id)ignoredRecordWithScopedIdentifier:(id)a3;
- (id)ignoredRecordsBeforeDate:(id)a3 scopeIdentifier:(id)a4 maximumCount:(unint64_t)a5;
- (id)recordWithScopedIdentifier:(id)a3;
- (unint64_t)scopeType;
@end

@implementation CPLEngineIgnoredRecords

- (BOOL)scopeIdentifier:(id)a3 hasIgnoredRecordsBeforeDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CPLEngineStorage *)self platformObject];
  char v9 = [v8 scopeIdentifier:v7 hasIgnoredRecordsBeforeDate:v6];

  return v9;
}

- (BOOL)setIgnoredDate:(id)a3 forRecordWithScopedIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a5) = [v10 setIgnoredDate:v9 forRecordWithScopedIdentifier:v8 error:a5];

  return (char)a5;
}

- (id)ignoredRecordsBeforeDate:(id)a3 scopeIdentifier:(id)a4 maximumCount:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(CPLEngineStorage *)self platformObject];
  v11 = [v10 ignoredRecordsBeforeDate:v9 scopeIdentifier:v8 maximumCount:a5];

  return v11;
}

- (id)ignoredRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self platformObject];
  id v6 = [v5 ignoredRecordWithScopedIdentifier:v4];

  return v6;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  v11 = [(CPLEngineStorage *)self platformObject];
  int v12 = [v11 deleteRecordsForScopeIndex:a3 maxCount:a4 deletedCount:a5 error:a6];

  if (!v12) {
    return 0;
  }
  if (*a5) {
    return 1;
  }
  v14 = [(CPLEngineStorage *)self platformObject];
  id v20 = 0;
  int v15 = [v14 popCloudScopedIdentifiersToCheck:&v20 otherScopeIndex:a3 maxCount:a4 deletedCount:a5 error:a6];
  id v16 = v20;

  if (v15)
  {
    if ([v16 count])
    {
      v17 = [(CPLEngineStorage *)self engineStore];
      v18 = [v17 pendingRecordChecks];

      char v13 = [v18 enqueueCloudScopedIdentifiersToCheck:v16 error:a6];
    }
    else
    {
      char v13 = 1;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)removeRecordWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a4) = [v7 removeRecordWithScopedIdentifier:v6 error:a4];

  return (char)a4;
}

- (BOOL)addIgnoredRecord:(id)a3 ignoredDate:(id)a4 otherScopeIndex:(int64_t)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a3;
  int v12 = [(CPLEngineStorage *)self platformObject];
  LOBYTE(a6) = [v12 addIgnoredRecord:v11 ignoredDate:v10 otherScopeIndex:a5 error:a6];

  return (char)a6;
}

- (BOOL)hasRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(CPLEngineStorage *)self platformObject];
  char v6 = [v5 hasRecordWithScopedIdentifier:v4];

  return v6;
}

- (id)recordWithScopedIdentifier:(id)a3
{
  v3 = [(CPLEngineIgnoredRecords *)self ignoredRecordWithScopedIdentifier:a3];
  id v4 = [v3 record];

  return v4;
}

- (unint64_t)scopeType
{
  return 2;
}

@end