@interface CPLPrequeliteRemappedRecords
- (BOOL)addRemappedRecordWithScopedIdentifier:(id)a3 realScopedIdentifier:(id)a4 error:(id *)a5;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)fixStorageAfterAnyVersionChange;
- (BOOL)initializeStorage;
- (BOOL)isRecordWithScopedIdentifierRemapped:(id)a3;
- (BOOL)removeRemappedRecordWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (id)realScopedIdentifierForRemappedScopedIdentifier:(id)a3;
- (id)remappedRecordEnumeratorInScope:(id)a3;
- (id)scopedIdentifiersRemappedToScopedIdentifier:(id)a3;
@end

@implementation CPLPrequeliteRemappedRecords

- (BOOL)initializeStorage
{
  v5.receiver = self;
  v5.super_class = (Class)CPLPrequeliteRemappedRecords;
  BOOL v3 = [(CPLPrequeliteStorage *)&v5 initializeStorage];
  if (v3)
  {
    BOOL v3 = [(CPLPrequeliteStorage *)self createMainTableWithDefinition:@"scopeIndex INTEGER NOT NULL,cloudIdentifier TEXT NOT NULL,realIdentifier TEXT NOT NULL" error:0];
    if (v3)
    {
      BOOL v3 = [(CPLPrequeliteStorage *)self createIndexWithName:@"scopedCloudIdentifier" withDefinition:@"scopeIndex, cloudIdentifier" unique:1 error:0];
      if (v3) {
        LOBYTE(v3) = [(CPLPrequeliteStorage *)self createIndexWithName:@"scopedRealIdentifier" withDefinition:@"scopeIndex, realIdentifier" unique:0 error:0];
      }
    }
  }
  return v3;
}

- (BOOL)upgradeStorageToVersion:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CPLPrequeliteRemappedRecords;
  BOOL v5 = -[CPLPrequeliteStorage upgradeStorageToVersion:](&v10, "upgradeStorageToVersion:");
  if (v5)
  {
    if (a3 == 39)
    {
      if ([(CPLPrequeliteStorage *)self shouldUpgradeSchema])
      {
        LOBYTE(v5) = [(CPLPrequeliteStorage *)self recreateMainTableWithCopyInstructions:@"scopeIndex, cloudIdentifier, realIdentifier" oldFields:@"2, cloudIdentifier, realIdentifier" error:0];
        return v5;
      }
    }
    else if (a3 == 30)
    {
      v6 = [(CPLPrequeliteStorage *)self pqStore];
      v7 = [(CPLPrequeliteStorage *)self mainTable];
      v8 = [v7 tableName];
      [v6 recordUpgradeEvent:@"Adding index on cloudIdentifier in %@", v8];

      LOBYTE(v5) = [(CPLPrequeliteStorage *)self createIndexOnColumn:@"cloudIdentifier" error:0];
      return v5;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)fixStorageAfterAnyVersionChange
{
  v12.receiver = self;
  v12.super_class = (Class)CPLPrequeliteRemappedRecords;
  if (![(CPLPrequeliteStorage *)&v12 fixStorageAfterAnyVersionChange]) {
    return 0;
  }
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  v4 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned int v5 = [v3 table:v4 hasColumnWithName:@"deleteDate"];

  if (!v5) {
    return 1;
  }
  if (!_CPLSilentLogging)
  {
    v6 = sub_1001BAE54();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removing unused deleteDate column", v11, 2u);
    }
  }
  v7 = [(CPLPrequeliteStorage *)self pqStore];
  v8 = [v7 pqlConnection];

  unsigned __int8 v9 = [v8 cplExecute:@"ALTER TABLE remappedDeletes DROP COLUMN deleteDate"];
  return v9;
}

- (BOOL)addRemappedRecordWithScopedIdentifier:(id)a3 realScopedIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v8];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a5)
    {
      +[CPLErrors invalidScopeErrorWithScopedIdentifier:v8];
      unsigned __int8 v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    int64_t v12 = v10;
    v13 = [(CPLPrequeliteStorage *)self pqStore];
    v14 = [v13 pqlConnection];

    v15 = [(CPLPrequeliteStorage *)self mainTable];
    v16 = [v8 identifier];
    v17 = [v9 identifier];
    unsigned __int8 v11 = [v14 cplExecute:@"INSERT OR REPLACE INTO %@ (scopeIndex, cloudIdentifier, realIdentifier) VALUES (%ld, %@, %@)", v15, v12, v16, v17];

    if (a5 && (v11 & 1) == 0)
    {
      *a5 = [v14 lastCPLError];
    }
  }
  return v11;
}

- (BOOL)removeRemappedRecordWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
    {
      +[CPLErrors invalidScopeErrorWithScopedIdentifier:v6];
      unsigned __int8 v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    int64_t v9 = v7;
    int64_t v10 = [(CPLPrequeliteStorage *)self pqStore];
    unsigned __int8 v11 = [v10 pqlConnection];

    int64_t v12 = [(CPLPrequeliteStorage *)self mainTable];
    v13 = [v6 identifier];
    unsigned __int8 v8 = [v11 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld AND cloudIdentifier = %@", v12, v9, v13];

    if (v8)
    {
      if ((uint64_t)[v11 changes] >= 1 && !_CPLSilentLogging)
      {
        v14 = sub_1001BAE54();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v17 = v6;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Removed %@ from remapped records", buf, 0xCu);
        }
      }
    }
    else if (a4)
    {
      *a4 = [v11 lastCPLError];
    }
  }
  return v8;
}

- (id)realScopedIdentifierForRemappedScopedIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
  }
  else
  {
    int64_t v7 = v5;
    unsigned __int8 v8 = [(CPLPrequeliteStorage *)self pqStore];
    int64_t v9 = [v8 pqlConnection];

    uint64_t v10 = objc_opt_class();
    unsigned __int8 v11 = [(CPLPrequeliteStorage *)self mainTable];
    int64_t v12 = [v4 identifier];
    id v13 = [v9 cplFetchObjectOfClass:v10, @"SELECT realIdentifier FROM %@ WHERE scopeIndex = %ld AND cloudIdentifier = %@", v11, v7, v12 sql];

    if (v13) {
      id v6 = [objc_alloc((Class)CPLScopedIdentifier) initRelativeToScopedIdentifier:v4 identifier:v13];
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

- (id)scopedIdentifiersRemappedToScopedIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = &__NSArray0__struct;
  }
  else
  {
    int64_t v7 = v5;
    unsigned __int8 v8 = [(CPLPrequeliteStorage *)self pqStore];
    int64_t v9 = [v8 pqlConnection];

    uint64_t v10 = [v4 scopeIdentifier];
    unsigned __int8 v11 = [(CPLPrequeliteStorage *)self mainTable];
    int64_t v12 = [v4 identifier];
    id v13 = [v9 cplFetch:@"SELECT cloudIdentifier FROM %@ WHERE scopeIndex = %ld AND realIdentifier = %@", v11, v7, v12];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1001BB45C;
    v16[3] = &unk_10027F5C8;
    id v17 = v10;
    int64_t v18 = v7;
    id v14 = v10;
    id v6 = [v13 enumerateObjects:v16];
  }
  return v6;
}

- (BOOL)isRecordWithScopedIdentifierRemapped:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CPLPrequeliteStorage *)self scopeIndexForCloudScopedIdentifier:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v6 = 0;
  }
  else
  {
    int64_t v7 = v5;
    unsigned __int8 v8 = [(CPLPrequeliteStorage *)self pqStore];
    int64_t v9 = [(CPLPrequeliteStorage *)self mainTable];
    uint64_t v10 = [v4 identifier];
    unsigned __int8 v11 = +[PQLFormatInjection formatInjection:@"scopeIndex = %ld AND cloudIdentifier = %@", v7, v10];
    unsigned __int8 v6 = [v8 table:v9 hasRecordsMatchingQuery:v11];
  }
  return v6;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  unsigned __int8 v11 = [(CPLPrequeliteStorage *)self pqStore];
  int64_t v12 = [v11 pqlConnection];

  id v13 = [(CPLPrequeliteStorage *)self mainTable];
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

- (id)remappedRecordEnumeratorInScope:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CPLPrequeliteStorage *)self pqStore];
  unsigned __int8 v6 = [v5 pqlConnection];

  id v7 = [v4 cloudIndex];
  unsigned __int8 v8 = [v4 scopeIdentifier];

  int64_t v9 = [(CPLPrequeliteStorage *)self mainTable];
  id v10 = [v6 cplFetch:@"SELECT cloudIdentifier, realIdentifier FROM %@ WHERE scopeIndex = %ld", v9, v7];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001BB7FC;
  v15[3] = &unk_10027F5C8;
  id v16 = v8;
  id v17 = v7;
  id v11 = v8;
  int64_t v12 = [v10 enumerateObjects:v15];
  id v13 = [[CPLPrequeliteSkipNullEnumerator alloc] initWithEnumerator:v12];

  return v13;
}

@end