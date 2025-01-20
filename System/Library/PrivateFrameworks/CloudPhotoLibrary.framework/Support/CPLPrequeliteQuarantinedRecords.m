@interface CPLPrequeliteQuarantinedRecords
- (BOOL)addQuarantinedRecordWithScopedIdentifier:(id)a3 recordClass:(Class)a4 reason:(id)a5 error:(id *)a6;
- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6;
- (BOOL)initializeStorage;
- (BOOL)isRecordWithScopedIdentifierQuarantined:(id)a3;
- (BOOL)removeQuarantinedRecordWithScopedIdentifier:(id)a3 removed:(BOOL *)a4 error:(id *)a5;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (Class)classForQuarantinedRecordWithScopedIdentifier:(id)a3;
- (unint64_t)countOfQuarantinedRecords;
- (unint64_t)countOfQuarantinedRecordsInScopeWithIdentifier:(id)a3;
@end

@implementation CPLPrequeliteQuarantinedRecords

- (BOOL)initializeStorage
{
  v5.receiver = self;
  v5.super_class = (Class)CPLPrequeliteQuarantinedRecords;
  BOOL v3 = [(CPLPrequeliteStorage *)&v5 initializeStorage];
  if (v3)
  {
    BOOL v3 = [(CPLPrequeliteStorage *)self createMainTableWithDefinition:@"scopeIndex INTEGER NOT NULL,localIdentifier TEXT NOT NULL,quarantineDate TIMESTAMP NOT NULL,class TEXT,reason TEXT NOT NULL" error:0];
    if (v3) {
      LOBYTE(v3) = [(CPLPrequeliteStorage *)self createIndexWithName:@"localScopedIdentifier" withDefinition:@"localIdentifier, scopeIndex" unique:1 error:0];
    }
  }
  return v3;
}

- (BOOL)upgradeStorageToVersion:(int64_t)a3
{
  v25.receiver = self;
  v25.super_class = (Class)CPLPrequeliteQuarantinedRecords;
  if (!-[CPLPrequeliteStorage upgradeStorageToVersion:](&v25, "upgradeStorageToVersion:"))
  {
    LOBYTE(v5) = 0;
    return (char)v5;
  }
  LOBYTE(v5) = 1;
  if (a3 > 38)
  {
    if (a3 != 39)
    {
      if (a3 == 63)
      {
        if ([(CPLPrequeliteStorage *)self shouldUpgradeSchema])
        {
          if (!_CPLSilentLogging)
          {
            if (qword_1002DC128 != -1) {
              dispatch_once(&qword_1002DC128, &stru_10027FA20);
            }
            v12 = (void *)qword_1002DC130;
            if (os_log_type_enabled((os_log_t)qword_1002DC130, OS_LOG_TYPE_DEFAULT))
            {
              v13 = v12;
              v14 = [(CPLPrequeliteStorage *)self mainTable];
              *(_DWORD *)buf = 138412546;
              v27 = v14;
              __int16 v28 = 2048;
              uint64_t v29 = 63;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Upgrading %@ to version %llu: adding class column", buf, 0x16u);
            }
          }
          v15 = [(CPLPrequeliteStorage *)self pqStore];
          v6 = [v15 pqlConnection];

          v16 = [(CPLPrequeliteStorage *)self mainTable];
          unsigned int v17 = [v6 cplExecute:@"ALTER TABLE %@ ADD COLUMN class TEXT DEFAULT NULL", v16];

          if (v17)
          {
            objc_super v5 = [(CPLPrequeliteStorage *)self pqStore];
            v18 = [v5 clientCache];
            v19 = [v18 mainTable];

            v20 = [(CPLPrequeliteStorage *)self mainTable];
            LODWORD(v5) = [v6 cplExecute:@"UPDATE %@ SET class = (SELECT class FROM %@ WHERE identifier = %@.localIdentifier AND scopeIndex = %@.scopeIndex)", v20, v19, v20, v20];
            if (v5)
            {
              uint64_t v21 = (uint64_t)[v6 changes];
              if (v21 >= 1)
              {
                uint64_t v22 = v21;
                v23 = [(CPLPrequeliteStorage *)self pqStore];
                objc_msgSend(v23, "recordUpgradeEvent:", @"Updated quarantined record classes from client cache for %lld records", v22);
              }
            }
          }
          else
          {
            LOBYTE(v5) = 0;
          }
          goto LABEL_31;
        }
      }
      else if (a3 == 68)
      {
        objc_super v5 = [(CPLPrequeliteStorage *)self pqStore];
        v6 = [v5 pqlConnection];

        v7 = [(CPLPrequeliteStorage *)self mainTable];
        LODWORD(v5) = [v6 cplExecute:@"UPDATE %@ SET class = \"CPLMasterChange\" WHERE reason = \"Asset has been quarantined\"", v7];

        if (!v5) {
          goto LABEL_31;
        }
        uint64_t v8 = (uint64_t)[v6 changes];
        if (v8 < 1) {
          goto LABEL_31;
        }
        uint64_t v9 = v8;
        v10 = [(CPLPrequeliteStorage *)self pqStore];
        objc_msgSend(v10, "recordUpgradeEvent:", @"Fixed %lld quarantined record classes to CPLMasterChange", v9);
LABEL_14:

LABEL_31:
        return (char)v5;
      }
      return (char)v5;
    }
    if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
      return (char)v5;
    }
    unsigned __int8 v11 = [(CPLPrequeliteStorage *)self recreateMainTableWithCopyInstructions:@"scopeIndex, localIdentifier, quarantineDate, class, reason" oldFields:@"1, localIdentifier, quarantineDate, NULL, reason" error:0];
LABEL_29:
    LOBYTE(v5) = v11;
    return (char)v5;
  }
  if (a3 == 24)
  {
    unsigned __int8 v11 = [(CPLPrequeliteStorage *)self createStorage];
    goto LABEL_29;
  }
  if (a3 == 38 && [(CPLPrequeliteStorage *)self shouldUpgradeSchema])
  {
    objc_super v5 = [(CPLPrequeliteStorage *)self pqStore];
    v6 = [v5 pqlConnection];

    v10 = [(CPLPrequeliteStorage *)self mainTable];
    LOBYTE(v5) = [v6 cplExecute:@"ALTER TABLE %@ ADD COLUMN reason TEXT NOT NULL DEFAULT \"Unknown reason\"", v10];
    goto LABEL_14;
  }
  return (char)v5;
}

- (BOOL)addQuarantinedRecordWithScopedIdentifier:(id)a3 recordClass:(Class)a4 reason:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  int64_t v12 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v10];
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a6)
    {
      +[CPLErrors invalidScopeErrorWithScopedIdentifier:v10];
      unsigned __int8 v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v13 = 0;
    }
  }
  else
  {
    int64_t v14 = v12;
    +[NSDate timeIntervalSinceReferenceDate];
    unint64_t v16 = (unint64_t)v15;
    unsigned int v17 = [(CPLPrequeliteStorage *)self pqStore];
    v18 = [v17 pqlConnection];

    v19 = [(CPLPrequeliteStorage *)self mainTable];
    v20 = [v10 identifier];
    uint64_t v21 = NSStringFromClass(a4);
    unsigned __int8 v13 = [v18 cplExecute:@"INSERT OR IGNORE INTO %@ (scopeIndex, localIdentifier, quarantineDate, class, reason) VALUES (%ld, %@, %lu, %@, %@)", v19, v14, v20, v16, v21, v11];

    if (a6 && (v13 & 1) == 0)
    {
      *a6 = [v18 lastCPLError];
    }
  }
  return v13;
}

- (BOOL)removeQuarantinedRecordWithScopedIdentifier:(id)a3 removed:(BOOL *)a4 error:(id *)a5
{
  id v8 = a3;
  int64_t v9 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v8];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a5)
    {
      +[CPLErrors invalidScopeErrorWithScopedIdentifier:v8];
      unsigned __int8 v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    int64_t v11 = v9;
    int64_t v12 = [(CPLPrequeliteStorage *)self pqStore];
    unsigned __int8 v13 = [v12 pqlConnection];

    int64_t v14 = [(CPLPrequeliteStorage *)self mainTable];
    double v15 = [v8 identifier];
    unsigned __int8 v10 = [v13 cplExecute:@"DELETE FROM %@ WHERE localIdentifier = %@ AND scopeIndex = %ld", v14, v15, v11];

    if (v10)
    {
      *a4 = (uint64_t)[v13 changes] > 0;
    }
    else if (a5)
    {
      *a5 = [v13 lastCPLError];
    }
  }
  return v10;
}

- (BOOL)isRecordWithScopedIdentifierQuarantined:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v6 = 0;
  }
  else
  {
    int64_t v7 = v5;
    id v8 = [(CPLPrequeliteStorage *)self pqStore];
    int64_t v9 = [(CPLPrequeliteStorage *)self mainTable];
    unsigned __int8 v10 = [v4 identifier];
    int64_t v11 = +[PQLFormatInjection formatInjection:@"localIdentifier = %@ AND scopeIndex = %ld", v10, v7];
    unsigned __int8 v6 = [v8 table:v9 hasRecordsMatchingQuery:v11];
  }
  return v6;
}

- (Class)classForQuarantinedRecordWithScopedIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CPLPrequeliteStorage *)self scopeIndexForLocalScopedIdentifier:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v6 = 0;
  }
  else
  {
    int64_t v7 = v5;
    id v8 = [(CPLPrequeliteStorage *)self pqStore];
    int64_t v9 = [v8 pqlConnection];

    uint64_t v10 = objc_opt_class();
    int64_t v11 = [(CPLPrequeliteStorage *)self mainTable];
    int64_t v12 = [v4 identifier];
    unsigned __int8 v13 = (NSString *)[v9 cplFetchObjectOfClass:v10, @"SELECT class FROM %@ WHERE localIdentifier = %@ AND scopeIndex = %ld", v11, v12, v7 sql];

    if (v13)
    {
      unsigned __int8 v6 = NSClassFromString(v13);
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }
  return (Class)v6;
}

- (unint64_t)countOfQuarantinedRecords
{
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  id v4 = [(CPLPrequeliteStorage *)self mainTable];
  id v5 = [v3 tableCountOfRecords:v4];

  return (unint64_t)v5;
}

- (unint64_t)countOfQuarantinedRecordsInScopeWithIdentifier:(id)a3
{
  int64_t v4 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  int64_t v6 = v4;
  int64_t v7 = [(CPLPrequeliteStorage *)self pqStore];
  id v8 = [(CPLPrequeliteStorage *)self mainTable];
  int64_t v9 = +[PQLFormatInjection formatInjection:@"scopeIndex = %ld", v6];
  id v10 = [v7 table:v8 countOfRecordsMatchingQuery:v9];

  return (unint64_t)v10;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  int64_t v11 = [(CPLPrequeliteStorage *)self pqStore];
  int64_t v12 = [v11 pqlConnection];

  unsigned __int8 v13 = [(CPLPrequeliteStorage *)self mainTable];
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

@end