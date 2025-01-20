@interface CPLPrequeliteStatusCenter
- (BOOL)acknowledgeChangedStatus:(id)a3 hasBeenDeleted:(BOOL *)a4 error:(id *)a5;
- (BOOL)addStatus:(id)a3 error:(id *)a4;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)discardNotificationForRecordWithScopedIdentifier:(id)a3 error:(id *)a4;
- (BOOL)getNewGeneration:(unint64_t *)a3 error:(id *)a4;
- (BOOL)hasStatusChanges;
- (BOOL)initializeStorage;
- (BOOL)openWithError:(id *)a3;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (CPLPrequeliteStatusCenter)initWithAbstractObject:(id)a3;
- (id)status;
- (id)statusChangesMaximumCount:(unint64_t)a3;
- (id)statusForRecordWithScopedIdentifier:(id)a3;
@end

@implementation CPLPrequeliteStatusCenter

- (CPLPrequeliteStatusCenter)initWithAbstractObject:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CPLPrequeliteStatusCenter;
  v3 = [(CPLPrequeliteStorage *)&v8 initWithAbstractObject:a3];
  if (v3)
  {
    v4 = +[CPLPrequeliteType integerType];
    uint64_t v5 = [v3 variableWithName:@"generation" type:v4];
    v6 = *(void **)(v3 + 36);
    *(void *)(v3 + 36) = v5;
  }
  return (CPLPrequeliteStatusCenter *)v3;
}

- (BOOL)initializeStorage
{
  v5.receiver = self;
  v5.super_class = (Class)CPLPrequeliteStatusCenter;
  BOOL v3 = [(CPLPrequeliteStorage *)&v5 initializeStorage];
  if (v3)
  {
    BOOL v3 = [(CPLPrequeliteStorage *)self createMainTableWithDefinition:@"scopeIndex INTEGER NOT NULL,identifier TEXT NOT NULL,class TEXT NOT NULL,generation INTEGER NOT NULL" error:0];
    if (v3)
    {
      BOOL v3 = [(CPLPrequeliteStorage *)self createIndexWithName:@"scopedIdentifier" withDefinition:@"identifier, scopeIndex" unique:1 error:0];
      if (v3)
      {
        BOOL v3 = [(CPLPrequeliteStorage *)self createIndexOnColumn:@"class" error:0];
        if (v3)
        {
          BOOL v3 = [(CPLPrequeliteStorage *)self createVariable:*(void *)(&self->super._shouldUpgradeSchema + 1) defaultValue:&off_1002921C0 error:0];
          if (v3) {
            LOBYTE(v3) = [(CPLPrequeliteStorage *)self createIndexOnColumn:@"scopeIndex" error:0];
          }
        }
      }
    }
  }
  return v3;
}

- (BOOL)upgradeStorageToVersion:(int64_t)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CPLPrequeliteStatusCenter;
  if (!-[CPLPrequeliteStorage upgradeStorageToVersion:](&v18, "upgradeStorageToVersion:")) {
    return 0;
  }
  unsigned __int8 v5 = 1;
  if (a3 <= 41)
  {
    if (a3 == 35) {
      return [(CPLPrequeliteStorage *)self createStorage];
    }
    if (a3 == 39 && [(CPLPrequeliteStorage *)self shouldUpgradeSchema])
    {
      if (!_CPLSilentLogging)
      {
        if (qword_1002DC138 != -1) {
          dispatch_once(&qword_1002DC138, &stru_10027FA40);
        }
        v7 = (void *)qword_1002DC140;
        if (os_log_type_enabled((os_log_t)qword_1002DC140, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v8 = v7;
          v9 = [(CPLPrequeliteStorage *)self mainTable];
          *(_DWORD *)buf = 138412546;
          v20 = v9;
          __int16 v21 = 2048;
          uint64_t v22 = 39;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Upgrading %@ to version %llu: adding scopeIndex column", buf, 0x16u);
        }
      }
      v10 = [(CPLPrequeliteStorage *)self pqStore];
      v11 = [v10 pqlConnection];

      v12 = [(CPLPrequeliteStorage *)self mainTable];
      unsigned __int8 v5 = [v11 cplExecute:@"ALTER TABLE %@ ADD COLUMN scopeIndex INTEGER DEFAULT 1", v12];
    }
  }
  else if (a3 == 42)
  {
    if ([(CPLPrequeliteStorage *)self shouldUpgradeSchema])
    {
      v13 = +[CPLPrequeliteType integerType];
      v14 = +[CPLPrequeliteVariable variableWithName:@"generation" type:v13];

      v15 = [(CPLPrequeliteStorage *)self pqStore];
      v16 = [v15 valueForGlobalVariable:v14];

      [(CPLPrequeliteStorage *)self createVariable:*(void *)(&self->super._shouldUpgradeSchema + 1) defaultValue:v16 error:0];
      return 1;
    }
  }
  else if (a3 == 52)
  {
    if ([(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
      return [(CPLPrequeliteStorage *)self createIndexOnColumn:@"scopeIndex" error:0];
    }
  }
  else if (a3 == 53 && [(CPLPrequeliteStorage *)self shouldUpgradeSchema])
  {
    if ([(CPLPrequeliteStorage *)self dropIndexWithName:@"identifier" error:0]) {
      return [(CPLPrequeliteStorage *)self createIndexWithName:@"scopedIdentifier" withDefinition:@"identifier, scopeIndex" unique:1 error:0];
    }
    return 0;
  }
  return v5;
}

- (BOOL)openWithError:(id *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPLPrequeliteStatusCenter;
  return [(CPLPrequeliteStorage *)&v4 openWithError:a3];
}

- (BOOL)hasStatusChanges
{
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  objc_super v4 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned __int8 v5 = [v3 tableHasRecords:v4];

  return v5;
}

- (BOOL)getNewGeneration:(unint64_t *)a3 error:(id *)a4
{
  v7 = [(CPLPrequeliteStorage *)self valueForVariable:*(void *)(&self->super._shouldUpgradeSchema + 1)];
  *a3 = (unint64_t)[v7 unsignedIntegerValue] + 1;

  objc_super v8 = +[NSNumber numberWithUnsignedInteger:*a3];
  LOBYTE(a4) = [(CPLPrequeliteStorage *)self setValue:v8 forVariable:*(void *)(&self->super._shouldUpgradeSchema + 1) error:a4];

  return (char)a4;
}

- (BOOL)addStatus:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 record];
  objc_super v8 = [v7 scopedIdentifier];
  int64_t v9 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v8];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
    {
      +[CPLErrors invalidScopeErrorWithScopedIdentifier:v8];
      unsigned __int8 v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    int64_t v11 = v9;
    v12 = [(CPLPrequeliteStorage *)self pqStore];
    v13 = [v12 pqlConnection];

    v14 = [(CPLPrequeliteStorage *)self mainTable];
    v15 = [v8 identifier];
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    unsigned __int8 v10 = [v13 cplExecute:@"INSERT OR REPLACE INTO %@ (scopeIndex, identifier, class, generation) VALUES (%ld, %@, %@, %lu)", v14, v11, v15, v17, objc_msgSend(v6, "generation")];

    if (a4 && (v10 & 1) == 0)
    {
      *a4 = [v13 lastCPLError];
    }
  }
  return v10;
}

- (id)statusForRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
  }
  else
  {
    int64_t v7 = v5;
    objc_super v8 = [(CPLPrequeliteStorage *)self pqStore];
    int64_t v9 = [v8 pqlConnection];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001BDCC8;
    v13[3] = &unk_10027EE80;
    v13[4] = self;
    unsigned __int8 v10 = [(CPLPrequeliteStorage *)self mainTable];
    int64_t v11 = [v4 identifier];
    id v6 = [v9 cplFetchObject:v13, @"SELECT scopeIndex, identifier, class, generation FROM %@ WHERE scopeIndex = %ld AND identifier = %@", v10, v7, v11 sql];
  }
  return v6;
}

- (id)statusChangesMaximumCount:(unint64_t)a3
{
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [(CPLPrequeliteStorage *)self pqStore];
  int64_t v7 = [v6 pqlConnection];

  objc_super v8 = [(CPLPrequeliteStorage *)self mainTable];
  id v9 = [v7 cplFetch:@"SELECT scopeIndex, identifier, class, generation FROM %@", v8];

  do
  {
    if (![v9 next]) {
      break;
    }
    id v10 = [objc_alloc((Class)CPLRecordStatus) initFromPQLResultSet:v9 center:self error:0];
    if (v10) {
      [v5 addObject:v10];
    }
    id v11 = [v5 count];
  }
  while ((unint64_t)v11 < a3);

  return v5;
}

- (BOOL)acknowledgeChangedStatus:(id)a3 hasBeenDeleted:(BOOL *)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [v8 record];
  id v10 = [v9 scopedIdentifier];
  id v11 = [v10 scopeIndex];
  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL
    && (id v11 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v10], v11 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    if (a5)
    {
      +[CPLErrors invalidScopeErrorWithScopedIdentifier:v10];
      unsigned __int8 v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }
  else
  {
    v13 = [(CPLPrequeliteStorage *)self pqStore];
    v14 = [v13 pqlConnection];

    v15 = [(CPLPrequeliteStorage *)self mainTable];
    v16 = [v10 identifier];
    unsigned __int8 v12 = [v14 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld AND identifier = %@ AND generation <= %lu", v15, v11, v16, objc_msgSend(v8, "generation")];

    if (v12)
    {
      *a4 = (uint64_t)[v14 changes] > 0;
    }
    else if (a5)
    {
      *a5 = [v14 lastCPLError];
    }
  }
  return v12;
}

- (BOOL)discardNotificationForRecordWithScopedIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v6];
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
    id v10 = [(CPLPrequeliteStorage *)self pqStore];
    id v11 = [v10 pqlConnection];

    unsigned __int8 v12 = [(CPLPrequeliteStorage *)self mainTable];
    v13 = [v6 identifier];
    unsigned __int8 v8 = [v11 cplExecute:@"DELETE FROM %@ WHERE scopeIndex = %ld AND identifier = %@", v12, v9, v13];

    if (a4 && (v8 & 1) == 0)
    {
      *a4 = [v11 lastCPLError];
    }
  }
  return v8;
}

- (id)status
{
  v29.receiver = self;
  v29.super_class = (Class)CPLPrequeliteStatusCenter;
  BOOL v3 = [(CPLPrequeliteStorage *)&v29 status];
  id v4 = [v3 mutableCopy];

  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = [(CPLPrequeliteStorage *)self pqStore];
  int64_t v7 = [v6 pqlConnection];

  unsigned __int8 v8 = [(CPLPrequeliteStorage *)self mainTable];
  v24 = v7;
  id v9 = [v7 cplFetch:@"SELECT class, count(class) FROM %@ GROUP BY class", v8];

  if ([v9 next])
  {
    do
    {
      uint64_t v10 = [v9 stringAtIndex:0];
      if (v10) {
        id v11 = (__CFString *)v10;
      }
      else {
        id v11 = @"(nil)";
      }
      unsigned __int8 v12 = (char *)[v9 unsignedIntegerAtIndex:1];
      v13 = [v5 objectForKeyedSubscript:v11];
      v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", &v12[(void)[v13 unsignedIntegerValue]]);
      [v5 setObject:v14 forKeyedSubscript:v11];
    }
    while (([v9 next] & 1) != 0);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v15 = [v5 allKeys];
  v16 = [v15 sortedArrayUsingSelector:"compare:"];

  id v17 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v22 = [v5 objectForKeyedSubscript:v21];
        [v4 appendFormat:@"\n\t%@: %@", v21, v22];
      }
      id v18 = [v16 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v18);
  }

  return v4;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  id v11 = [(CPLPrequeliteStorage *)self pqStore];
  unsigned __int8 v12 = [v11 pqlConnection];

  v13 = [(CPLPrequeliteStorage *)self mainTable];
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

- (void).cxx_destruct
{
}

@end