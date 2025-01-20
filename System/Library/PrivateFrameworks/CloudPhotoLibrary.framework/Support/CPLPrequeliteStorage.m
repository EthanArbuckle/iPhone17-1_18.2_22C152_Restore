@interface CPLPrequeliteStorage
- (BOOL)_checkSuperWasCalled;
- (BOOL)addColumnVariable:(id)a3 error:(id *)a4;
- (BOOL)addColumnVariableGroup:(id)a3 error:(id *)a4;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)createIndex:(id)a3 withDefinition:(id)a4 condition:(id)a5 unique:(BOOL)a6 error:(id *)a7;
- (BOOL)createIndexOnColumn:(id)a3 error:(id *)a4;
- (BOOL)createIndexOnColumnVariable:(id)a3 error:(id *)a4;
- (BOOL)createIndexWithName:(id)a3 withDefinition:(id)a4 condition:(id)a5 unique:(BOOL)a6 error:(id *)a7;
- (BOOL)createIndexWithName:(id)a3 withDefinition:(id)a4 unique:(BOOL)a5 error:(id *)a6;
- (BOOL)createMainTableWithColumnVariables:(id)a3 error:(id *)a4;
- (BOOL)createMainTableWithDefinition:(id)a3 error:(id *)a4;
- (BOOL)createStorage;
- (BOOL)createVariable:(id)a3 defaultValue:(id)a4 error:(id *)a5;
- (BOOL)dropIndexWithName:(id)a3 error:(id *)a4;
- (BOOL)fixStorageAfterAnyVersionChange;
- (BOOL)initializeStorage;
- (BOOL)isAlive;
- (BOOL)isCloudScopeIndexValid:(int64_t)a3;
- (BOOL)isEmpty;
- (BOOL)isLocalScopeIndexValid:(int64_t)a3;
- (BOOL)openWithError:(id *)a3;
- (BOOL)recreateMainTableWithCopyInstructions:(id)a3 oldFields:(id)a4 error:(id *)a5;
- (BOOL)resetValueForVariable:(id)a3 error:(id *)a4;
- (BOOL)setValue:(id)a3 forVariable:(id)a4 error:(id *)a5;
- (BOOL)shouldIncludeInStatus;
- (BOOL)shouldUpgradeSchema;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (CPLPrequeliteStorage)initWithAbstractObject:(id)a3;
- (NSString)mainScopeIdentifier;
- (id)_scopes;
- (id)_statusPerScopeIndex;
- (id)additionalStatusForScopeWithIndex:(int64_t)a3 baseRecordCount:(int64_t)a4;
- (id)columnVariableWithName:(id)a3 defaultValue:(id)a4 type:(id)a5;
- (id)columnVariableWithName:(id)a3 type:(id)a4;
- (id)engineLibrary;
- (id)filterForExcludedScopeIdentifiers:(id)a3;
- (id)filterForIncludedScopeIdentifiers:(id)a3;
- (id)mainTable;
- (id)pqStore;
- (id)recordsDesignation;
- (id)scopeIdentifierForCloudScopeIndex:(int64_t)a3;
- (id)scopeIndexColumnName;
- (id)scopedIdentifierForCloudIdentifier:(id)a3 scopeIndex:(int64_t)a4;
- (id)scopedIdentifierForLocalIdentifier:(id)a3 scopeIndex:(int64_t)a4;
- (id)status;
- (id)statusDictionary;
- (id)statusPerScopeIndexWithGroupProperty:(id)a3 valueDescription:(id)a4;
- (id)valueForVariable:(id)a3;
- (id)variableWithName:(id)a3 defaultValue:(id)a4 type:(id)a5;
- (id)variableWithName:(id)a3 type:(id)a4;
- (int64_t)cloudScopeIndexForScopeIdentifier:(id)a3;
- (int64_t)localScopeIndexForScopeIdentifier:(id)a3;
- (int64_t)scopeIndexForCloudScopedIdentifier:(id)a3;
- (int64_t)scopeIndexForLocalScopedIdentifier:(id)a3;
- (int64_t)stableScopeIndexForScopeIdentifier:(id)a3;
- (void)_afterInitializeStorage;
- (void)_beforeInitializeStorage;
- (void)transactionDidFinish;
- (void)writeTransactionDidFail;
- (void)writeTransactionDidSucceed;
@end

@implementation CPLPrequeliteStorage

- (CPLPrequeliteStorage)initWithAbstractObject:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CPLPrequeliteStorage;
  v3 = [(CPLPrequeliteStorage *)&v10 initWithAbstractObject:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(CPLPrequeliteStorage *)v3 abstractObject];
    v6 = [v5 name];

    uint64_t v7 = +[CPLPrequeliteTable tableWithName:v6];
    mainTable = v4->_mainTable;
    v4->_mainTable = (CPLPrequeliteTable *)v7;

    objc_storeStrong((id *)&v4->_nameTable, v4->_mainTable);
    v4->_shouldUpgradeSchema = 1;
  }
  return v4;
}

- (NSString)mainScopeIdentifier
{
  v2 = [(CPLPrequeliteStorage *)self abstractObject];
  v3 = [v2 mainScopeIdentifier];

  return (NSString *)v3;
}

- (id)pqStore
{
  v2 = [(CPLPrequeliteStorage *)self abstractObject];
  v3 = [v2 engineStore];
  v4 = [v3 platformObject];

  return v4;
}

- (id)engineLibrary
{
  v2 = [(CPLPrequeliteStorage *)self abstractObject];
  v3 = [v2 engineStore];
  v4 = [v3 engineLibrary];

  return v4;
}

- (void)_beforeInitializeStorage
{
  self->_initializingStorage = 1;
}

- (void)_afterInitializeStorage
{
  if (self->_initializeSuperWasCalled)
  {
    self->_initializingStorage = 0;
    self->_initializeSuperWasCalled = 0;
  }
  else
  {
    sub_1001D0924();
    sub_1001825C0();
  }
}

- (BOOL)createStorage
{
  if (![(CPLPrequeliteStorage *)self isAlive] && !_CPLSilentLogging)
  {
    v3 = sub_1001825C0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [(CPLPrequeliteStorage *)self mainTable];
      int v7 = 138412290;
      v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating storage for %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [(CPLPrequeliteStorage *)self _beforeInitializeStorage];
  BOOL v5 = [(CPLPrequeliteStorage *)self initializeStorage];
  [(CPLPrequeliteStorage *)self _afterInitializeStorage];
  return v5;
}

- (BOOL)initializeStorage
{
  if (!self->_initializingStorage) {
    sub_1001D0A34(_CPLSilentLogging == 0, self, a2);
  }
  if (!_CPLSilentLogging)
  {
    v3 = sub_1001825C0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = [(CPLPrequeliteStorage *)self abstractObject];
      BOOL v5 = [v4 name];
      int v7 = 138412290;
      v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Initializing %@", (uint8_t *)&v7, 0xCu);
    }
  }
  self->_initializeSuperWasCalled = 1;
  self->_shouldUpgradeSchema = 0;
  return 1;
}

- (BOOL)upgradeStorageToVersion:(int64_t)a3
{
  if (!_CPLSilentLogging)
  {
    v4 = sub_1001825C0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 134217984;
      int64_t v7 = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Upgrading to %lld", (uint8_t *)&v6, 0xCu);
    }
  }
  return 1;
}

- (BOOL)fixStorageAfterAnyVersionChange
{
  return 1;
}

- (id)mainTable
{
  return self->_mainTable;
}

- (BOOL)createMainTableWithColumnVariables:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    int64_t v7 = sub_1001825C0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      if (self->_tempTable) {
        v8 = "temporary ";
      }
      else {
        v8 = "";
      }
      v9 = [v6 variables];
      *(_DWORD *)buf = 136315394;
      v17 = v8;
      __int16 v18 = 2112;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Creating %stable with variables: %@", buf, 0x16u);
    }
  }
  objc_super v10 = [(CPLPrequeliteStorage *)self pqStore];
  v11 = [v10 pqlConnection];

  mainTable = self->_mainTable;
  v13 = [v6 definitionInjection];
  unsigned __int8 v14 = [v11 cplExecute:@"CREATE TABLE %@ (%@)", mainTable, v13];

  if (a4 && (v14 & 1) == 0)
  {
    *a4 = [v11 lastCPLError];
  }

  return v14;
}

- (BOOL)createMainTableWithDefinition:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    int64_t v7 = sub_1001825C0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      if (self->_tempTable) {
        v8 = "temporary ";
      }
      else {
        v8 = "";
      }
      *(_DWORD *)buf = 136315394;
      __int16 v18 = v8;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Creating %stable with definition: %@", buf, 0x16u);
    }
  }
  id v9 = objc_alloc((Class)PQLRawInjection);
  objc_super v10 = [v6 dataUsingEncoding:4];
  id v11 = [v9 initWithData:v10];

  v12 = [(CPLPrequeliteStorage *)self pqStore];
  v13 = [v12 pqlConnection];

  unsigned __int8 v14 = [v13 cplExecute:@"CREATE TABLE %@ (%@)", self->_mainTable, v11];
  BOOL v15 = v14;
  if (a4 && (v14 & 1) == 0)
  {
    *a4 = [v13 lastCPLError];
  }

  return v15;
}

- (id)columnVariableWithName:(id)a3 type:(id)a4
{
  return +[CPLPrequeliteVariable variableWithName:a3 type:a4];
}

- (id)columnVariableWithName:(id)a3 defaultValue:(id)a4 type:(id)a5
{
  return +[CPLPrequeliteVariable variableWithName:a3 defaultValue:a4 type:a5];
}

- (BOOL)addColumnVariable:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v8 = v7;
  if (self->_initializingStorage)
  {
    sub_1001D0C48(v7, self, a2);
LABEL_19:
    sub_1001D0B58(v8, self, a2);
  }
  if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
    goto LABEL_19;
  }
  if (self->_initializingStorage)
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_1001825C0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_super v10 = "temporary ";
        mainTable = self->_mainTable;
        if (!self->_tempTable) {
          objc_super v10 = "";
        }
        *(_DWORD *)buf = 138412802;
        v24 = v8;
        __int16 v25 = 2080;
        v26 = (void *)v10;
        __int16 v27 = 2112;
        v28 = mainTable;
        v12 = "Creating column %@ on %s%@";
        v13 = v9;
        os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
        uint32_t v15 = 32;
        goto LABEL_12;
      }
      goto LABEL_13;
    }
  }
  else if (!_CPLSilentLogging)
  {
    id v9 = sub_1001825C0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_mainTable;
      *(_DWORD *)buf = 138412546;
      v24 = v8;
      __int16 v25 = 2112;
      v26 = v16;
      v12 = "Adding column %@ on %@";
      v13 = v9;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      uint32_t v15 = 22;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, buf, v15);
    }
LABEL_13:
  }
  v17 = [(CPLPrequeliteStorage *)self pqStore];
  __int16 v18 = [v17 pqlConnection];

  __int16 v19 = [(CPLPrequeliteStorage *)self mainTable];
  id v20 = [v8 columnDefinition];
  unsigned __int8 v21 = [v18 cplExecute:@"ALTER TABLE %@ ADD COLUMN %@", v19, v20];

  if (a4 && (v21 & 1) == 0)
  {
    *a4 = [v18 lastCPLError];
  }

  return v21;
}

- (BOOL)addColumnVariableGroup:(id)a3 error:(id *)a4
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = objc_msgSend(a3, "variables", 0);
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (![(CPLPrequeliteStorage *)self addColumnVariable:*(void *)(*((void *)&v13 + 1) + 8 * i) error:a4])
        {
          BOOL v11 = 0;
          goto LABEL_11;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (BOOL)createIndex:(id)a3 withDefinition:(id)a4 condition:(id)a5 unique:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (self->_initializingStorage) {
    goto LABEL_4;
  }
  if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
    sub_1001D0D38(v13, self, a2);
  }
  if (self->_initializingStorage)
  {
LABEL_4:
    if (_CPLSilentLogging) {
      goto LABEL_11;
    }
    long long v16 = sub_1001825C0();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_10;
    }
    v17 = "temporary ";
    mainTable = self->_mainTable;
    if (!self->_tempTable) {
      v17 = "";
    }
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2112;
    v35 = mainTable;
    __int16 v19 = "Creating index %@ on %s%@";
    id v20 = v16;
    os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
    uint32_t v22 = 32;
    goto LABEL_9;
  }
  if (!_CPLSilentLogging)
  {
    long long v16 = sub_1001825C0();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    v32 = self->_mainTable;
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v32;
    __int16 v19 = "Adding index %@ on %@";
    id v20 = v16;
    os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    uint32_t v22 = 22;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, buf, v22);
LABEL_10:
  }
LABEL_11:
  v23 = +[CPLPrequeliteVariable indexVariableForVariableWithName:v13 forTable:self->_nameTable];
  v24 = [(CPLPrequeliteStorage *)self pqStore];
  __int16 v25 = [v24 pqlConnection];
  v26 = v25;
  if (!v8)
  {
    if (!v15)
    {
      unsigned __int8 v27 = [v25 cplExecute:@"CREATE INDEX IF NOT EXISTS %@ ON %@ (%@)", v23, self->_mainTable, v14, v33, *(void *)buf, *(_OWORD *)&buf[8], v35];
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  if (v15)
  {
LABEL_15:
    unsigned __int8 v27 = [v25 cplExecute:@"CREATE INDEX IF NOT EXISTS %@ ON %@ (%@) WHERE %@", v23, self->_mainTable, v14, v15, *(void *)buf, *(_OWORD *)&buf[8], v35];
    goto LABEL_17;
  }
  unsigned __int8 v27 = [v25 cplExecute:@"CREATE UNIQUE INDEX IF NOT EXISTS %@ ON %@ (%@)", v23, self->_mainTable, v14, v33, *(_OWORD *)buf, *(void *)&buf[16], v35];
LABEL_17:
  BOOL v28 = v27;

  if (a7 && !v28)
  {
    v29 = [(CPLPrequeliteStorage *)self pqStore];
    v30 = [v29 pqlConnection];
    *a7 = [v30 lastCPLError];
  }
  return v28;
}

- (BOOL)createIndexOnColumnVariable:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 variableName];
  LOBYTE(a4) = [(CPLPrequeliteStorage *)self createIndex:v7 withDefinition:v6 condition:0 unique:0 error:a4];

  return (char)a4;
}

- (BOOL)createIndexWithName:(id)a3 withDefinition:(id)a4 unique:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc((Class)PQLRawInjection);
  id v13 = [v10 dataUsingEncoding:4];

  id v14 = [v12 initWithData:v13];
  LOBYTE(a6) = [(CPLPrequeliteStorage *)self createIndex:v11 withDefinition:v14 condition:0 unique:v7 error:a6];

  return (char)a6;
}

- (BOOL)createIndexWithName:(id)a3 withDefinition:(id)a4 condition:(id)a5 unique:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc((Class)PQLRawInjection);
  long long v16 = [v13 dataUsingEncoding:4];

  id v17 = [v15 initWithData:v16];
  id v18 = objc_alloc((Class)PQLRawInjection);
  __int16 v19 = [v12 dataUsingEncoding:4];

  id v20 = [v18 initWithData:v19];
  LOBYTE(a7) = [(CPLPrequeliteStorage *)self createIndex:v14 withDefinition:v17 condition:v20 unique:v8 error:a7];

  return (char)a7;
}

- (BOOL)createIndexOnColumn:(id)a3 error:(id *)a4
{
  unsigned __int8 v6 = [(CPLPrequeliteStorage *)self createIndexWithName:a3 withDefinition:a3 unique:0 error:a4];
  BOOL v7 = v6;
  if (a4 && (v6 & 1) == 0)
  {
    BOOL v8 = [(CPLPrequeliteStorage *)self pqStore];
    uint64_t v9 = [v8 pqlConnection];
    *a4 = [v9 lastCPLError];
  }
  return v7;
}

- (BOOL)dropIndexWithName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    BOOL v7 = sub_1001825C0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Dropping index %@", buf, 0xCu);
    }
  }
  BOOL v8 = +[CPLPrequeliteVariable indexVariableForVariableWithName:v6 forTable:self->_nameTable];
  uint64_t v9 = [(CPLPrequeliteStorage *)self pqStore];
  id v10 = [v9 pqlConnection];
  unsigned __int8 v11 = [v10 cplExecute:@"DROP INDEX IF EXISTS %@", v8];

  if (a4 && (v11 & 1) == 0)
  {
    id v12 = [(CPLPrequeliteStorage *)self pqStore];
    id v13 = [v12 pqlConnection];
    *a4 = [v13 lastCPLError];
  }
  return v11;
}

- (id)variableWithName:(id)a3 type:(id)a4
{
  return [(CPLPrequeliteStorage *)self variableWithName:a3 defaultValue:0 type:a4];
}

- (id)variableWithName:(id)a3 defaultValue:(id)a4 type:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (self->_tempTable)
  {
    id v15 = (CPLPrequeliteStorage *)sub_1001D0E28(v9, self, a2);
    return (id)[(CPLPrequeliteStorage *)v15 createVariable:v17 defaultValue:v18 error:v19];
  }
  else
  {
    id v12 = v11;
    id v13 = +[CPLPrequeliteVariable variableWithName:v9 forTable:self->_mainTable type:v11];

    return v13;
  }
}

- (BOOL)createVariable:(id)a3 defaultValue:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = (CPLPrequeliteTable *)a4;
  if (self->_tempTable)
  {
    unsigned __int8 v11 = 1;
    goto LABEL_15;
  }
  id v12 = [v9 table];
  mainTable = self->_mainTable;

  if (v12 != mainTable)
  {
    sub_1001D0F18(v9, a2, self);
    goto LABEL_20;
  }
  if (self->_initializingStorage) {
    goto LABEL_7;
  }
  if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema])
  {
LABEL_20:
    if (!_CPLSilentLogging)
    {
      uint32_t v22 = sub_1001825C0();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = self->_mainTable;
        *(_DWORD *)buf = 138412546;
        id v27 = v9;
        __int16 v28 = 2112;
        v29 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Trying to create variable %@ for %@ but the table has just been created", buf, 0x16u);
      }
    }
    v24 = +[NSAssertionHandler currentHandler];
    __int16 v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/PrequeliteStore/CPLPrequeliteStorage.m"];
    [v24 handleFailureInMethod:a2, self, v25, 240, @"Trying to create variable %@ for %@ but the table has just been created", v9, self->_mainTable object file lineNumber description];

    abort();
  }
  if (!self->_initializingStorage)
  {
    if (_CPLSilentLogging) {
      goto LABEL_12;
    }
    id v14 = sub_1001825C0();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138412546;
    id v27 = v9;
    __int16 v28 = 2112;
    v29 = v10;
    id v15 = "Adding variable %@ with default value %@";
    SEL v16 = v14;
    os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_10;
  }
LABEL_7:
  if (!_CPLSilentLogging)
  {
    id v14 = sub_1001825C0();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
LABEL_11:

      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412546;
    id v27 = v9;
    __int16 v28 = 2112;
    v29 = v10;
    id v15 = "Creating variable %@ with default value %@";
    SEL v16 = v14;
    os_log_type_t v17 = OS_LOG_TYPE_DEBUG;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, buf, 0x16u);
    goto LABEL_11;
  }
LABEL_12:
  id v18 = [(CPLPrequeliteStorage *)self pqStore];
  unsigned __int8 v11 = [v18 addGlobalVariable:v9 defaultValue:v10 error:a5];

  if (a5 && (v11 & 1) == 0)
  {
    __int16 v19 = [(CPLPrequeliteStorage *)self pqStore];
    id v20 = [v19 pqlConnection];
    *a5 = [v20 lastCPLError];

    unsigned __int8 v11 = 0;
  }
LABEL_15:

  return v11;
}

- (BOOL)setValue:(id)a3 forVariable:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  unsigned __int8 v11 = [v10 table];
  mainTable = self->_mainTable;

  if (v11 == mainTable)
  {
    id v13 = [(CPLPrequeliteStorage *)self pqStore];
    unsigned __int8 v14 = [v13 setValue:v9 forGlobalVariable:v10 error:a5];

    return v14;
  }
  else
  {
    SEL v16 = (CPLPrequeliteStorage *)sub_1001D0FF0(v10, a2, self);
    return [(CPLPrequeliteStorage *)v16 valueForVariable:v18];
  }
}

- (id)valueForVariable:(id)a3
{
  id v5 = a3;
  id v6 = [v5 table];
  mainTable = self->_mainTable;

  if (v6 == mainTable)
  {
    BOOL v8 = [(CPLPrequeliteStorage *)self pqStore];
    id v9 = [v8 valueForGlobalVariable:v5];

    return v9;
  }
  else
  {
    unsigned __int8 v11 = (CPLPrequeliteStorage *)sub_1001D10C8(v5, a2, self);
    return (id)[(CPLPrequeliteStorage *)v11 resetValueForVariable:v13 error:v14];
  }
}

- (BOOL)resetValueForVariable:(id)a3 error:(id *)a4
{
  id v7 = a3;
  BOOL v8 = [v7 table];
  mainTable = self->_mainTable;

  if (v8 == mainTable)
  {
    id v10 = [(CPLPrequeliteStorage *)self pqStore];
    unsigned __int8 v11 = [v10 resetValueForGlobalVariable:v7 error:a4];

    return v11;
  }
  else
  {
    id v13 = (CPLPrequeliteStorage *)sub_1001D11A0(v7, a2, self);
    return [(CPLPrequeliteStorage *)v13 openWithError:v15];
  }
}

- (BOOL)openWithError:(id *)a3
{
  self->_superWasCalled = 1;
  return 1;
}

- (BOOL)closeWithError:(id *)a3
{
  self->_superWasCalled = 1;
  return 1;
}

- (void)writeTransactionDidFail
{
  self->_superWasCalled = 1;
}

- (void)writeTransactionDidSucceed
{
  self->_superWasCalled = 1;
}

- (void)transactionDidFinish
{
  self->_superWasCalled = 1;
}

- (BOOL)isEmpty
{
  v3 = [(CPLPrequeliteStorage *)self abstractObject];
  if (![v3 shouldBeCreatedDynamically])
  {

    goto LABEL_5;
  }
  unsigned __int8 v4 = [(CPLPrequeliteStorage *)self isAlive];

  if (v4)
  {
LABEL_5:
    id v6 = [(CPLPrequeliteStorage *)self pqStore];
    id v7 = [(CPLPrequeliteStorage *)self mainTable];
    unsigned int v5 = [v6 tableHasRecords:v7] ^ 1;

    return v5;
  }
  LOBYTE(v5) = 1;
  return v5;
}

- (BOOL)isAlive
{
  v3 = [(CPLPrequeliteStorage *)self pqStore];
  unsigned __int8 v4 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned __int8 v5 = [v3 hasTable:v4];

  return v5;
}

- (BOOL)shouldIncludeInStatus
{
  v3 = [(CPLPrequeliteStorage *)self abstractObject];
  unsigned int v4 = [v3 shouldBeCreatedDynamically];

  if (!v4) {
    return 1;
  }
  unsigned __int8 v5 = [(CPLPrequeliteStorage *)self pqStore];
  id v6 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned __int8 v7 = [v5 hasTable:v6];

  return v7;
}

- (id)recordsDesignation
{
  return @"records";
}

- (id)status
{
  v3 = [(CPLPrequeliteStorage *)self abstractObject];
  if ([v3 shouldBeCreatedDynamically])
  {
    unsigned int v4 = [(CPLPrequeliteStorage *)self pqStore];
    unsigned __int8 v5 = [(CPLPrequeliteStorage *)self mainTable];
    unsigned int v6 = [v4 hasTable:v5];

    if (!v6)
    {
      unsigned __int8 v7 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  BOOL v8 = [(CPLPrequeliteStorage *)self pqStore];
  id v9 = [(CPLPrequeliteStorage *)self mainTable];
  id v10 = [v8 tableCountOfRecords:v9];

  unsigned __int8 v11 = [(CPLPrequeliteStorage *)self recordsDesignation];
  unsigned __int8 v7 = +[NSString stringWithFormat:@"%lu %@", v10, v11];

LABEL_6:
  return v7;
}

- (id)statusDictionary
{
  v3 = [(CPLPrequeliteStorage *)self abstractObject];
  if ([v3 shouldBeCreatedDynamically])
  {
    unsigned int v4 = [(CPLPrequeliteStorage *)self pqStore];
    unsigned __int8 v5 = [(CPLPrequeliteStorage *)self mainTable];
    unsigned int v6 = [v4 hasTable:v5];

    if (!v6)
    {
      unsigned __int8 v7 = 0;
      goto LABEL_6;
    }
  }
  else
  {
  }
  BOOL v8 = [(CPLPrequeliteStorage *)self pqStore];
  id v9 = [(CPLPrequeliteStorage *)self mainTable];
  id v10 = [v8 tableCountOfRecords:v9];

  CFStringRef v13 = @"records";
  unsigned __int8 v11 = +[NSNumber numberWithUnsignedInteger:v10];
  SEL v14 = v11;
  unsigned __int8 v7 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];

LABEL_6:
  return v7;
}

- (id)scopeIndexColumnName
{
  return @"scopeIndex";
}

- (id)additionalStatusForScopeWithIndex:(int64_t)a3 baseRecordCount:(int64_t)a4
{
  return 0;
}

- (id)_statusPerScopeIndex
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v4 = [(CPLPrequeliteStorage *)self pqStore];
  unsigned __int8 v5 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned int v6 = [(CPLPrequeliteStorage *)self scopeIndexColumnName];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100184244;
  v11[3] = &unk_10027EFB0;
  v11[4] = self;
  id v7 = v3;
  id v12 = v7;
  [v4 table:v5 enumerateCountGroupedByProperty:v6 block:v11];

  BOOL v8 = v12;
  id v9 = v7;

  return v9;
}

- (id)statusPerScopeIndexWithGroupProperty:(id)a3 valueDescription:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  BOOL v8 = [(CPLPrequeliteStorage *)self _statusPerScopeIndex];
  id v9 = [(CPLPrequeliteStorage *)self pqStore];
  id v10 = [v9 pqlConnection];

  id v23 = v6;
  unsigned __int8 v11 = (const char *)[v23 UTF8String];
  uint64_t v12 = +[PQLRawInjection rawInjection:v11 length:strlen(v11)];
  CFStringRef v13 = [(CPLPrequeliteStorage *)self mainTable];
  uint32_t v22 = (void *)v12;
  id v14 = [v10 cplFetch:@"SELECT scopeIndex, %@, count(%@) FROM %@ GROUP BY scopeIndex, %@", v12, v12, v13, v12];

  if ([v14 next])
  {
    do
    {
      id v15 = [v14 integerAtIndex:0];
      SEL v16 = [v14 objectAtIndex:1];
      id v17 = [v14 unsignedIntegerAtIndex:2];
      if (v16)
      {
        v7[2](v7, v16);
        id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v18 = @"(nil)";
      }
      __int16 v19 = +[NSNumber numberWithInteger:v15];
      id v20 = [v8 objectForKeyedSubscript:v19];

      [v20 appendFormat:@"\n\t%@: %lu", v18, v17];
    }
    while (([v14 next] & 1) != 0);
  }

  return v8;
}

- (BOOL)_checkSuperWasCalled
{
  BOOL superWasCalled = self->_superWasCalled;
  self->_BOOL superWasCalled = 0;
  return superWasCalled;
}

- (id)_scopes
{
  v2 = [(CPLPrequeliteStorage *)self pqStore];
  id v3 = [v2 abstractObject];
  unsigned int v4 = [v3 scopes];

  return v4;
}

- (int64_t)scopeIndexForLocalScopedIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CPLPrequeliteStorage *)self _scopes];
  id v6 = [v5 scopedIdentifierForLocalScopedIdentifier:v4];

  if (v6) {
    int64_t v7 = (int64_t)[v6 scopeIndex];
  }
  else {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (int64_t)scopeIndexForCloudScopedIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CPLPrequeliteStorage *)self _scopes];
  id v6 = [v5 scopedIdentifierForCloudScopedIdentifier:v4];

  if (v6) {
    int64_t v7 = (int64_t)[v6 scopeIndex];
  }
  else {
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (int64_t)localScopeIndexForScopeIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CPLPrequeliteStorage *)self _scopes];
  id v6 = [v5 indexForLocalScopeIdentifier:v4];

  return (int64_t)v6;
}

- (int64_t)cloudScopeIndexForScopeIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CPLPrequeliteStorage *)self _scopes];
  id v6 = [v5 indexForCloudScopeIdentifier:v4];

  return (int64_t)v6;
}

- (int64_t)stableScopeIndexForScopeIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CPLPrequeliteStorage *)self _scopes];
  id v6 = [v5 stableScopeIndexForScopeIdentifier:v4];

  return (int64_t)v6;
}

- (id)filterForIncludedScopeIdentifiers:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CPLPrequeliteStorage *)self _scopes];
  id v6 = [v5 filterForIncludedScopeIdentifiers:v4];

  return v6;
}

- (id)filterForExcludedScopeIdentifiers:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CPLPrequeliteStorage *)self _scopes];
  id v6 = [v5 filterForExcludedScopeIdentifiers:v4];

  return v6;
}

- (id)scopedIdentifierForLocalIdentifier:(id)a3 scopeIndex:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(CPLPrequeliteStorage *)self _scopes];
  BOOL v8 = [v7 scopeIdentifierForLocalScopeIndex:a4];

  if (v8)
  {
    id v9 = [objc_alloc((Class)CPLScopedIdentifier) initWithScopeIdentifier:v8 identifier:v6];
    [v9 setScopeIndex:a4];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)scopedIdentifierForCloudIdentifier:(id)a3 scopeIndex:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(CPLPrequeliteStorage *)self _scopes];
  BOOL v8 = [v7 scopeIdentifierForCloudScopeIndex:a4];

  if (v8)
  {
    id v9 = [objc_alloc((Class)CPLScopedIdentifier) initWithScopeIdentifier:v8 identifier:v6];
    [v9 setScopeIndex:a4];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)scopeIdentifierForCloudScopeIndex:(int64_t)a3
{
  id v4 = [(CPLPrequeliteStorage *)self _scopes];
  unsigned __int8 v5 = [v4 scopeIdentifierForCloudScopeIndex:a3];

  return v5;
}

- (BOOL)isLocalScopeIndexValid:(int64_t)a3
{
  id v4 = [(CPLPrequeliteStorage *)self _scopes];
  unsigned __int8 v5 = [v4 validLocalScopeIndexes];
  LOBYTE(a3) = [v5 containsIndex:a3];

  return a3;
}

- (BOOL)isCloudScopeIndexValid:(int64_t)a3
{
  id v4 = [(CPLPrequeliteStorage *)self _scopes];
  unsigned __int8 v5 = [v4 validCloudScopeIndexes];
  LOBYTE(a3) = [v5 containsIndex:a3];

  return a3;
}

- (BOOL)recreateMainTableWithCopyInstructions:(id)a3 oldFields:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (self->_tempTable)
  {
    sub_1001D136C(self, a2);
LABEL_40:
    sub_1001D1278((uint64_t)self, (uint64_t)a2);
  }
  id v11 = v10;
  if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
    goto LABEL_40;
  }
  v60 = a5;
  id v62 = v11;
  uint64_t v12 = [(CPLPrequeliteStorage *)self abstractObject];
  CFStringRef v13 = [v12 name];
  uint64_t v14 = [v13 stringByAppendingString:@"_temp"];

  v61 = (void *)v14;
  id v15 = +[CPLPrequeliteTable tableWithName:v14];
  tempTable = self->_tempTable;
  self->_tempTable = v15;

  id v17 = [(CPLPrequeliteStorage *)self pqStore];
  id v18 = [v17 pqlConnection];

  if (![v18 cplExecute:@"DROP TABLE IF EXISTS %@", self->_tempTable]) {
    goto LABEL_31;
  }
  id v59 = v9;
  __int16 v19 = [(CPLPrequeliteTable *)self->_mainTable tableName];
  id v20 = [v19 stringByAppendingString:@"."];

  id v21 = objc_alloc_init((Class)NSMutableArray);
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  p_mainTable = &self->_mainTable;
  id v22 = [v18 cplFetch:@"SELECT name FROM sqlite_master WHERE type = \"index\" AND tbl_name = %@", self->_mainTable];
  id v23 = [v22 enumerateObjectsOfClass:objc_opt_class()];

  id v24 = [v23 countByEnumeratingWithState:&v67 objects:v80 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v68;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v68 != v26) {
          objc_enumerationMutation(v23);
        }
        __int16 v28 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        if ([v28 hasPrefix:v20]) {
          [v21 addObject:v28];
        }
      }
      id v25 = [v23 countByEnumeratingWithState:&v67 objects:v80 count:16];
    }
    while (v25);
  }
  v58 = self;

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v29 = v21;
  id v30 = [v29 countByEnumeratingWithState:&v63 objects:v79 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v64;
    while (2)
    {
      for (j = 0; j != v31; j = (char *)j + 1)
      {
        if (*(void *)v64 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = +[PQLNameInjection nameWithString:*(void *)(*((void *)&v63 + 1) + 8 * (void)j)];
        unsigned __int8 v35 = [v18 cplExecute:@"DROP INDEX %@", v34];

        if ((v35 & 1) == 0)
        {

          self = v58;
          id v9 = v59;
          goto LABEL_31;
        }
      }
      id v31 = [v29 countByEnumeratingWithState:&v63 objects:v79 count:16];
      if (v31) {
        continue;
      }
      break;
    }
  }

  v36 = *p_mainTable;
  self = v58;
  objc_storeStrong((id *)p_mainTable, v58->_tempTable);
  unsigned int v37 = [(CPLPrequeliteStorage *)v58 createStorage];
  v38 = *p_mainTable;
  *p_mainTable = v36;

  id v9 = v59;
  if (!v37) {
    goto LABEL_31;
  }
  id v39 = v59;
  v40 = (const char *)[v39 UTF8String];
  v41 = +[PQLRawInjection rawInjection:v40 length:strlen(v40)];
  id v42 = v62;
  v43 = (const char *)[v42 UTF8String];
  v44 = +[PQLRawInjection rawInjection:v43 length:strlen(v43)];
  unsigned int v45 = [v18 cplExecute:@"INSERT INTO %@ (%@) SELECT %@ FROM %@", v58->_tempTable, v41, v44, *p_mainTable];
  id v46 = [v18 changes];

  if (!v45) {
    goto LABEL_31;
  }
  if ([v18 cplExecute:@"DROP TABLE %@", *p_mainTable]
    && ([v18 cplExecute:@"ALTER TABLE %@ RENAME TO %@", v58->_tempTable, *p_mainTable] & 1) != 0)
  {
    v47 = v62;
    if (!_CPLSilentLogging)
    {
      v48 = sub_1001825C0();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v49 = *p_mainTable;
        *(_DWORD *)buf = 138413058;
        v72 = v49;
        __int16 v73 = 2112;
        id v74 = v42;
        __int16 v75 = 2112;
        id v76 = v39;
        __int16 v77 = 2048;
        id v78 = v46;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "successfully recreated %@ using copy %@ -> %@ (%lld records copied)", buf, 0x2Au);
      }
    }
    v50 = [(CPLPrequeliteStorage *)v58 pqStore];
    [v50 recordUpgradeEvent:@"successfully recreated %@ using copy %@ -> %@ (%lld records copied)", *p_mainTable, v42, v39, v46];

    BOOL v51 = 1;
  }
  else
  {
LABEL_31:
    v47 = v62;
    if (!_CPLSilentLogging)
    {
      v52 = sub_1001825C0();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        mainTable = self->_mainTable;
        v54 = [v18 lastError];
        *(_DWORD *)buf = 138413058;
        v72 = mainTable;
        __int16 v73 = 2112;
        id v74 = v62;
        __int16 v75 = 2112;
        id v76 = v9;
        __int16 v77 = 2112;
        id v78 = v54;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Failed to recreate %@ using copy %@ -> %@: %@", buf, 0x2Au);
      }
    }
    if (v60)
    {
      [v18 lastError];
      BOOL v51 = 0;
      id *v60 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v51 = 0;
    }
  }
  v55 = self->_tempTable;
  self->_tempTable = 0;

  return v51;
}

- (BOOL)shouldUpgradeSchema
{
  return self->_shouldUpgradeSchema;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tempTable, 0);
  objc_storeStrong((id *)&self->_mainTable, 0);
  objc_storeStrong((id *)&self->_nameTable, 0);
}

@end