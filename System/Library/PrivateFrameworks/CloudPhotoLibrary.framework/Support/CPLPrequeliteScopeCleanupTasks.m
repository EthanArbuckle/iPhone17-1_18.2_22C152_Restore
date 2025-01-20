@interface CPLPrequeliteScopeCleanupTasks
- (BOOL)addCleanupTaskForScopeWithIndex:(int64_t)a3 scopeIdentifier:(id)a4 scopeType:(unint64_t)a5 error:(id *)a6;
- (BOOL)deleteCleanupTaskForScopeWithIndex:(int64_t)a3 error:(id *)a4;
- (BOOL)hasCleanupTasks;
- (BOOL)initializeStorage;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (id)status;
- (id)statusDictionary;
- (int64_t)nextCleanupTaskScopeIndexOfType:(unint64_t *)a3;
@end

@implementation CPLPrequeliteScopeCleanupTasks

- (BOOL)initializeStorage
{
  v5.receiver = self;
  v5.super_class = (Class)CPLPrequeliteScopeCleanupTasks;
  BOOL v3 = [(CPLPrequeliteStorage *)&v5 initializeStorage];
  if (v3) {
    LOBYTE(v3) = [(CPLPrequeliteStorage *)self createMainTableWithDefinition:@"scopeIndex INTEGER NOT NULL,scopeType INTEGER NOT NULL,scopeIdentifier STRING NOT NULL" error:0];
  }
  return v3;
}

- (BOOL)upgradeStorageToVersion:(int64_t)a3
{
  if (a3 == 40) {
    return [(CPLPrequeliteStorage *)self createStorage];
  }
  else {
    return 1;
  }
}

- (BOOL)addCleanupTaskForScopeWithIndex:(int64_t)a3 scopeIdentifier:(id)a4 scopeType:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  v11 = [(CPLPrequeliteStorage *)self pqStore];
  v12 = [v11 pqlConnection];

  v13 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned __int8 v14 = [v12 cplExecute:@"INSERT INTO %@ (scopeIndex, scopeType, scopeIdentifier) VALUES (%ld, %lu, %@)", v13, a3, a5, v10];

  if (a6 && (v14 & 1) == 0)
  {
    *a6 = [v12 lastError];
  }

  return v14;
}

- (int64_t)nextCleanupTaskScopeIndexOfType:(unint64_t *)a3
{
  objc_super v5 = [(CPLPrequeliteStorage *)self pqStore];
  v6 = [v5 pqlConnection];

  v7 = [(CPLPrequeliteStorage *)self mainTable];
  id v8 = [v6 cplFetch:@"SELECT scopeIndex, scopeType FROM %@ LIMIT 1", v7];

  if ([v8 next])
  {
    do
    {
      int64_t v9 = (int64_t)[v8 integerAtIndex:0];
      *a3 = (unint64_t)[v8 unsignedIntegerAtIndex:1];
    }
    while (([v8 next] & 1) != 0);
  }
  else
  {
    int64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (BOOL)deleteCleanupTaskForScopeWithIndex:(int64_t)a3 error:(id *)a4
{
  v7 = [(CPLPrequeliteStorage *)self pqStore];
  id v8 = [v7 pqlConnection];

  int64_t v9 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned __int8 v10 = [v8 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld", v9, a3];

  if (a4 && (v10 & 1) == 0)
  {
    *a4 = [v8 lastError];
  }

  return v10;
}

- (BOOL)hasCleanupTasks
{
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  v4 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned __int8 v5 = [v3 tableHasRecords:v4];

  return v5;
}

- (id)status
{
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  v4 = [(CPLPrequeliteStorage *)self mainTable];
  id v5 = [v3 tableCountOfRecords:v4];

  if (v5)
  {
    v6 = +[NSString stringWithFormat:@"%lu scope indexes to clean", v5];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)statusDictionary
{
  return &__NSDictionary0__struct;
}

@end