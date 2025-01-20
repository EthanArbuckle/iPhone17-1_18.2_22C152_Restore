@interface ENExposureDatabase
+ (void)_obliterateDatabaseAtURL:(id)a3 reason:(id)a4 generateStackshot:(BOOL)a5;
- (BOOL)_checkDatabaseOpenWithError:(id *)a3;
- (BOOL)_createOrMigrateSchemaFromVersion:(int64_t)a3 error:(id *)a4;
- (BOOL)_createSchemaWithConnection:(id)a3 error:(id *)a4;
- (BOOL)_getExistingPersistentTemporaryExposureKey:(id *)a3 rowID:(int64_t *)a4 keyData:(id)a5 connection:(id)a6 error:(id *)a7;
- (BOOL)_insertAdvertisement:(id)a3 keyRowID:(int64_t)a4 connection:(id)a5 error:(id *)a6;
- (BOOL)_insertExposureDetectionFile:(id)a3 sessionID:(id)a4 connection:(id)a5 error:(id *)a6;
- (BOOL)_insertOrUpdateExposureDetectionHistorySession:(id)a3 connection:(id)a4 error:(id *)a5;
- (BOOL)_insertPersistentTemporaryExposureKey:(id)a3 connection:(id)a4 error:(id *)a5;
- (BOOL)_reallyOpenDatabaseWithError:(id *)a3;
- (BOOL)deleteExposureDetectionHistoryWithError:(id *)a3;
- (BOOL)enumerateExposureDetectionHistoryFilesForSessionUUID:(id)a3 error:(id *)a4 handler:(id)a5;
- (BOOL)enumerateExposureDetectionHistorySessionsWithError:(id *)a3 handler:(id)a4;
- (BOOL)enumerateMatchedAdvertisementsWithError:(id *)a3 handler:(id)a4;
- (BOOL)getAdvertisementCount:(unsigned int *)a3 error:(id *)a4;
- (BOOL)getValue:(id *)a3 forKey:(id)a4 ofClass:(Class)a5 connection:(id)a6 error:(id *)a7;
- (BOOL)getValue:(id *)a3 forKey:(id)a4 ofClass:(Class)a5 error:(id *)a6;
- (BOOL)insertExposureDetectionFile:(id)a3 session:(id)a4 error:(id *)a5;
- (BOOL)isOpen;
- (BOOL)openWithError:(id *)a3;
- (BOOL)purgeRecordsWithInterval:(double)a3 nowDate:(id)a4 error:(id *)a5;
- (BOOL)setPropertyListValue:(id)a3 forKey:(id)a4 expiryDate:(id)a5 error:(id *)a6;
- (BOOL)setValue:(id)a3 forKey:(id)a4 expiryDate:(id)a5 error:(id *)a6;
- (BOOL)setValue:(id)a3 forKey:(id)a4 type:(int64_t)a5 expiryDate:(id)a6 modDate:(id)a7 connection:(id)a8 error:(id *)a9;
- (BOOL)upsertExposureDetectionHistorySession:(id)a3 error:(id *)a4;
- (ENExposureDatabase)initWithDirectoryURL:(id)a3;
- (ENExposureDatabase)initWithURL:(id)a3;
- (ENSQLiteConnection)connection;
- (id)_advertisementWithRPIData:(id)a3 encryptedAEMData:(id)a4 timestamp:(int64_t)a5 scanInterval:(int)a6 typicalRSSI:(int)a7 maxRSSI:(int)a8 saturated:(int)a9 counter:(int)a10;
- (id)_advertisementsForTemporaryExposureKeyRowID:(int64_t)a3 connection:(id)a4 error:(id *)a5;
- (id)_initWithURL:(id)a3;
- (id)_persistentTemporaryExposureKeyWithKeyData:(id)a3 appBundleIdentifier:(id)a4 regionCountryCode:(id)a5 rollingStartNumber:(int64_t)a6 rollingPeriod:(int64_t)a7 daysSinceOnsetOfSymptoms:(int64_t)a8 diagnosisReportType:(int)a9 originalReportType:(int)a10 transmissionRiskLevel:(int)a11 variantOfConcernType:(int)a12 originalVariantOfConcernType:(int)a13;
- (id)_sessionIDForUUID:(id)a3 connection:(id)a4 error:(id *)a5;
- (id)advertisementCountsByTemporaryKeyDatasWithError:(id *)a3;
- (id)errorMetricReporter;
- (id)initInMemoryDatabase;
- (int64_t)_updateExistingPersistentKeyIfNecessary:(id)a3 replacementKey:(id)a4 existingKeyID:(int64_t)a5 connection:(id)a6 error:(id *)a7;
- (int64_t)insertMatchedAdvertisements:(id)a3 forKey:(id)a4 error:(id *)a5;
- (void)_reportErrorMetric:(unsigned int)a3;
- (void)_reportSQLiteResult:(int)a3;
- (void)close;
- (void)purgeAllAndCloseWithReason:(id)a3;
- (void)setErrorMetricReporter:(id)a3;
@end

@implementation ENExposureDatabase

- (ENExposureDatabase)initWithURL:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B08] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"ENExposureDatabase.m", 53, @"Invalid parameter not satisfying: %@", @"databaseURL != nil" object file lineNumber description];
  }
  v6 = [(ENExposureDatabase *)self _initWithURL:v5];

  return v6;
}

- (ENExposureDatabase)initWithDirectoryURL:(id)a3
{
  v4 = [a3 URLByAppendingPathComponent:@"en_exposure.sqlite"];
  id v5 = [(ENExposureDatabase *)self initWithURL:v4];

  return v5;
}

- (id)initInMemoryDatabase
{
  return [(ENExposureDatabase *)self _initWithURL:0];
}

- (id)_initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ENExposureDatabase;
  id v5 = [(ENExposureDatabase *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    databaseURL = v5->_databaseURL;
    v5->_databaseURL = (NSURL *)v6;
  }
  return v5;
}

- (void)_reportErrorMetric:(unsigned int)a3
{
  errorMetricReporter = (void (**)(id, void))self->_errorMetricReporter;
  if (errorMetricReporter) {
    errorMetricReporter[2](errorMetricReporter, *(void *)&a3);
  }
}

- (void)_reportSQLiteResult:(int)a3
{
  if (a3 <= 12)
  {
    if (a3 == 1)
    {
      uint64_t v3 = 4001;
      goto LABEL_8;
    }
    if (a3 != 11) {
      return;
    }
    goto LABEL_9;
  }
  if (a3 == 26)
  {
LABEL_9:
    uint64_t v3 = 4000;
    goto LABEL_8;
  }
  if (a3 == 13)
  {
    uint64_t v3 = 4002;
LABEL_8:
    [(ENExposureDatabase *)self _reportErrorMetric:v3];
  }
}

- (BOOL)isOpen
{
  return [(ENSQLiteConnection *)self->_connection isOpen];
}

- (BOOL)openWithError:(id *)a3
{
  if (![(ENExposureDatabase *)self isOpen])
  {
    if (!self->_databaseURL)
    {
LABEL_7:
      BOOL v5 = [(ENExposureDatabase *)self _reallyOpenDatabaseWithError:a3];
      if (!v5) {
        return v5;
      }
      uint64_t v14 = 0;
      if ([(ENSQLiteConnection *)self->_connection getUserVersion:&v14 error:a3]
        && [(ENExposureDatabase *)self _createOrMigrateSchemaFromVersion:v14 error:a3])
      {
        if (gLogCategory_ENExposureDatabase <= 30
          && (gLogCategory_ENExposureDatabase != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        goto LABEL_2;
      }
      [(ENExposureDatabase *)self close];
LABEL_26:
      LOBYTE(v5) = 0;
      return v5;
    }
    id v6 = objc_alloc_init(MEMORY[0x1E4F28CC0]);
    v7 = [(NSURL *)self->_databaseURL URLByDeletingLastPathComponent];
    if ([v6 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:a3])
    {
      if ([v7 setResourceValue:MEMORY[0x1E4F1CC40] forKey:*MEMORY[0x1E4F1C638] error:a3])
      {

        goto LABEL_7;
      }
      if (gLogCategory__ENExposureDatabase > 90
        || gLogCategory__ENExposureDatabase == -1 && !_LogCategory_Initialize())
      {
        uint64_t v10 = 4005;
        goto LABEL_25;
      }
      objc_super v9 = [v7 path];
      v12 = v9;
      LogPrintF_safe();
      uint64_t v10 = 4005;
    }
    else
    {
      if (gLogCategory__ENExposureDatabase > 90
        || gLogCategory__ENExposureDatabase == -1 && !_LogCategory_Initialize())
      {
        uint64_t v10 = 4004;
        goto LABEL_25;
      }
      uint64_t v8 = objc_opt_class();
      objc_super v9 = [v7 absoluteString];
      v12 = (void *)v8;
      v13 = v9;
      LogPrintF_safe();
      uint64_t v10 = 4004;
    }

LABEL_25:
    -[ENExposureDatabase _reportErrorMetric:](self, "_reportErrorMetric:", v10, v12, v13);

    goto LABEL_26;
  }
LABEL_2:
  LOBYTE(v5) = 1;
  return v5;
}

- (void)close
{
  if ([(ENSQLiteConnection *)self->_connection isOpen])
  {
    [(ENSQLiteConnection *)self->_connection close];
    if (gLogCategory_ENExposureDatabase <= 30
      && (gLogCategory_ENExposureDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  connection = self->_connection;
  self->_connection = 0;
}

- (BOOL)_reallyOpenDatabaseWithError:(id *)a3
{
  if (self->_connection)
  {
    v12 = [MEMORY[0x1E4F28B08] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"ENExposureDatabase.m", 158, @"Invalid parameter not satisfying: %@", @"_connection == nil" object file lineNumber description];
  }
  if (self->_databaseURL)
  {
    BOOL v5 = [[ENSQLiteConnection alloc] initWithDatabaseURL:self->_databaseURL];
    connection = self->_connection;
    self->_connection = v5;

    [(ENSQLiteConnection *)self->_connection setAdditionalOpenFlags:0x200000];
  }
  else
  {
    v7 = objc_alloc_init(ENSQLiteConnection);
    uint64_t v8 = self->_connection;
    self->_connection = v7;
  }
  uint64_t v9 = [(ENSQLiteConnection *)self->_connection openWithError:a3];
  if (v9)
  {
    [(ENExposureDatabase *)self close];
    if (v9 == 23)
    {
      if (gLogCategory_ENExposureDatabase <= 50
        && (gLogCategory_ENExposureDatabase != -1 || _LogCategory_Initialize()))
      {
        uint64_t v14 = [(NSURL *)self->_databaseURL path];
        LogPrintF_safe();
      }
    }
    else if (gLogCategory_ENExposureDatabase <= 115 {
           && (gLogCategory_ENExposureDatabase != -1 || _LogCategory_Initialize()))
    }
    {
      v15 = [(NSURL *)self->_databaseURL path];
      LogPrintF_safe();

      -[ENExposureDatabase _reportSQLiteResult:](self, "_reportSQLiteResult:", v9, v15, v9);
    }
    else
    {
      -[ENExposureDatabase _reportSQLiteResult:](self, "_reportSQLiteResult:", v9, v13, v16);
    }
  }
  return v9 == 0;
}

- (BOOL)_checkDatabaseOpenWithError:(id *)a3
{
  BOOL v4 = [(ENSQLiteConnection *)self->_connection isOpen];
  BOOL v5 = v4;
  if (a3 && !v4)
  {
    ENErrorF();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)_createOrMigrateSchemaFromVersion:(int64_t)a3 error:(id *)a4
{
  if (a3 == 8)
  {
    LOBYTE(v8) = 1;
    return v8;
  }
  v26[5] = v7;
  v26[6] = v6;
  v26[17] = v4;
  v26[18] = v5;
  if ((unint64_t)(a3 - 9) < 0xFFFFFFFFFFFFFFF9)
  {
    if (gLogCategory__ENExposureDatabase <= 90
      && (gLogCategory__ENExposureDatabase != -1 || _LogCategory_Initialize()))
    {
      int64_t v21 = a3;
      LogPrintF_safe();
    }
    if (-[ENSQLiteConnection truncateWithError:](self->_connection, "truncateWithError:", a4, v21))
    {
      connection = self->_connection;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __62__ENExposureDatabase__createOrMigrateSchemaFromVersion_error___block_invoke;
      v26[3] = &unk_1E69AE698;
      v26[4] = self;
      LOBYTE(v8) = [(ENSQLiteConnection *)connection performTransactionWithType:1 error:a4 usingBlock:v26];
    }
    else
    {
      if (gLogCategory__ENExposureDatabase > 90) {
        goto LABEL_32;
      }
      if (gLogCategory__ENExposureDatabase != -1 || (int v8 = _LogCategory_Initialize()) != 0)
      {
        LogPrintF_safe();
        goto LABEL_32;
      }
    }
    return v8;
  }
  uint64_t v12 = 0;
  while (1)
  {
    int64_t v13 = *(void *)((char *)&unk_1F2B285B0 + v12);
    if (v13 > a3) {
      break;
    }
LABEL_15:
    v12 += 16;
    if (v12 == 96)
    {
      LOBYTE(v8) = 1;
      return v8;
    }
  }
  uint64_t v14 = *(void *)((char *)&unk_1F2B285B0 + v12 + 8);
  if (gLogCategory_ENExposureDatabase <= 50
    && (gLogCategory_ENExposureDatabase != -1 || _LogCategory_Initialize()))
  {
    int64_t v21 = v13;
    LogPrintF_safe();
  }
  v15 = self->_connection;
  v24[5] = v14;
  id v25 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __62__ENExposureDatabase__createOrMigrateSchemaFromVersion_error___block_invoke_2;
  v24[3] = &__block_descriptor_48_e32_B24__0__ENSQLiteConnection_8__16l;
  v24[4] = v13;
  BOOL v16 = -[ENSQLiteConnection performTransactionWithType:error:usingBlock:](v15, "performTransactionWithType:error:usingBlock:", 1, &v25, v24, v21);
  id v17 = v25;
  v18 = v17;
  if (v16)
  {

    goto LABEL_15;
  }
  if (gLogCategory__ENExposureDatabase <= 90
    && (gLogCategory__ENExposureDatabase != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v22 = int64_t v21 = v13;
    LogPrintF_safe();
  }
  -[ENExposureDatabase _reportErrorMetric:](self, "_reportErrorMetric:", 4003, v21, v22);
  if (a4) {
    *a4 = v18;
  }

LABEL_32:
  LOBYTE(v8) = 0;
  return v8;
}

uint64_t __62__ENExposureDatabase__createOrMigrateSchemaFromVersion_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _createSchemaWithConnection:a2 error:a3];
}

uint64_t __62__ENExposureDatabase__createOrMigrateSchemaFromVersion_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ((*(unsigned int (**)(void))(a1 + 40))()) {
    uint64_t v6 = [v5 setUserVersion:*(void *)(a1 + 32) error:a3];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)_createSchemaWithConnection:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (![v5 executeUncachedSQLStatements:&unk_1F2B35C80 error:a4])
  {
LABEL_8:
    BOOL v6 = 0;
    goto LABEL_9;
  }
  if (([v5 setUserVersion:8 error:a4] & 1) == 0)
  {
    if (gLogCategory__ENExposureDatabase <= 90
      && (gLogCategory__ENExposureDatabase != -1 || _LogCategory_Initialize()))
    {
      objc_opt_class();
      LogPrintF_safe();
    }
    goto LABEL_8;
  }
  BOOL v6 = 1;
LABEL_9:

  return v6;
}

- (int64_t)insertMatchedAdvertisements:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(ENExposureDatabase *)self _checkDatabaseOpenWithError:a5])
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0;
    connection = self->_connection;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__ENExposureDatabase_insertMatchedAdvertisements_forKey_error___block_invoke;
    v13[3] = &unk_1E69AE6E0;
    v13[4] = self;
    id v14 = v9;
    BOOL v16 = &v17;
    id v15 = v8;
    if ([(ENSQLiteConnection *)connection performTransactionWithType:1 error:a5 usingBlock:v13])
    {
      int64_t v11 = v18[3];
    }
    else
    {
      int64_t v11 = 0;
    }

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

uint64_t __63__ENExposureDatabase_insertMatchedAdvertisements_forKey_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v23 = 0;
  uint64_t v24 = -1;
  BOOL v6 = *(void **)(a1 + 32);
  uint64_t v7 = [*(id *)(a1 + 40) key];
  id v8 = [v7 keyData];
  char v9 = [v6 _getExistingPersistentTemporaryExposureKey:&v23 rowID:&v24 keyData:v8 connection:v5 error:a3];
  id v10 = v23;

  if ((v9 & 1) == 0)
  {
    if (gLogCategory__ENExposureDatabase > 90
      || gLogCategory__ENExposureDatabase == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_29;
    }
    goto LABEL_8;
  }
  if (!v10)
  {
    uint64_t v12 = 1;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    int64_t v11 = (id *)(a1 + 48);
    if (![*(id *)(a1 + 48) count]) {
      goto LABEL_30;
    }
    if ([*(id *)(a1 + 32) _insertPersistentTemporaryExposureKey:*(void *)(a1 + 40) connection:v5 error:a3])
    {
      uint64_t v24 = [v5 lastInsertedRowID];
      goto LABEL_12;
    }
    if (gLogCategory__ENExposureDatabase > 90
      || gLogCategory__ENExposureDatabase == -1 && !_LogCategory_Initialize())
    {
LABEL_29:
      uint64_t v12 = 0;
      goto LABEL_30;
    }
LABEL_8:
    LogPrintF_safe();
    goto LABEL_29;
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 32) _updateExistingPersistentKeyIfNecessary:v10 replacementKey:*(void *)(a1 + 40) existingKeyID:v24 connection:v5 error:a3];
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    goto LABEL_29;
  }
  int64_t v11 = (id *)(a1 + 48);
  if (![*(id *)(a1 + 48) count])
  {
    uint64_t v12 = 1;
    goto LABEL_30;
  }
LABEL_12:
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = *v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        if (!objc_msgSend(*(id *)(a1 + 32), "_insertAdvertisement:keyRowID:connection:error:", *(void *)(*((void *)&v19 + 1) + 8 * i), v24, v5, a3, (void)v19))
        {
          uint64_t v12 = 0;
          goto LABEL_22;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 1;
LABEL_22:

LABEL_30:
  return v12;
}

- (BOOL)_insertAdvertisement:(id)a3 keyRowID:(int64_t)a4 connection:(id)a5 error:(id *)a6
{
  id v9 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__ENExposureDatabase__insertAdvertisement_keyRowID_connection_error___block_invoke;
  v12[3] = &unk_1E69AE708;
  id v13 = v9;
  int64_t v14 = a4;
  id v10 = v9;
  LOBYTE(a6) = [a5 executeSQL:@"INSERT OR REPLACE INTO advertisements (rpi, encrypted_aem, timestamp, scan_interval, rssi, max_rssi, saturated, counter, tek_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", a6, v12, 0 error bindingHandler enumerationHandler];

  return (char)a6;
}

uint64_t __69__ENExposureDatabase__insertAdvertisement_keyRowID_connection_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) rpi];
  ENSQLiteBindFoundationValue(a2, 1, v4);

  id v5 = [*(id *)(a1 + 32) encryptedAEM];
  ENSQLiteBindFoundationValue(a2, 2, v5);

  [*(id *)(a1 + 32) timestamp];
  sqlite3_bind_int64(a2, 3, (uint64_t)v6);
  sqlite3_bind_int(a2, 4, [*(id *)(a1 + 32) scanInterval]);
  sqlite3_bind_int(a2, 5, [*(id *)(a1 + 32) typicalRSSI]);
  sqlite3_bind_int(a2, 6, [*(id *)(a1 + 32) maxRSSI]);
  sqlite3_bind_int(a2, 7, [*(id *)(a1 + 32) saturated]);
  sqlite3_bind_int(a2, 8, [*(id *)(a1 + 32) counter]);
  sqlite3_int64 v7 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 9, v7);
}

- (BOOL)_getExistingPersistentTemporaryExposureKey:(id *)a3 rowID:(int64_t *)a4 keyData:(id)a5 connection:(id)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = -1;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__9;
  id v25 = __Block_byref_object_dispose__9;
  id v26 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __96__ENExposureDatabase__getExistingPersistentTemporaryExposureKey_rowID_keyData_connection_error___block_invoke;
  v19[3] = &unk_1E69AE730;
  id v14 = v12;
  id v20 = v14;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __96__ENExposureDatabase__getExistingPersistentTemporaryExposureKey_rowID_keyData_connection_error___block_invoke_2;
  v18[3] = &unk_1E69AE758;
  v18[5] = &v27;
  v18[6] = &v21;
  v18[4] = self;
  int v15 = [v13 executeSQL:@"SELECT ROWID, key, app_bundle_id, region_id, start, period, onset_days, report_type, original_report_type, transmission_risk, variant_of_concern_type, original_variant_of_concern_type FROM teks WHERE key = ?", a7, v19, v18 error bindingHandler enumerationHandler];
  if (v15)
  {
    uint64_t v16 = (void *)v22[5];
    if (v16)
    {
      *a3 = v16;
      *a4 = v28[3];
    }
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v15;
}

void __96__ENExposureDatabase__getExistingPersistentTemporaryExposureKey_rowID_keyData_connection_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
}

uint64_t __96__ENExposureDatabase__getExistingPersistentTemporaryExposureKey_rowID_keyData_connection_error___block_invoke_2(void *a1, sqlite3_stmt *a2)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = sqlite3_column_int64(a2, 0);
  long long v19 = (void *)a1[4];
  v18 = ENSQLiteColumnAsData(a2, 1);
  uint64_t v4 = ENSQLiteColumnAsString(a2, 2);
  id v5 = ENSQLiteColumnAsString(a2, 3);
  sqlite3_int64 v17 = sqlite3_column_int64(a2, 4);
  sqlite3_int64 v6 = sqlite3_column_int64(a2, 5);
  sqlite3_int64 v7 = sqlite3_column_int64(a2, 6);
  int v8 = sqlite3_column_int(a2, 7);
  int v9 = sqlite3_column_int(a2, 8);
  int v10 = sqlite3_column_int(a2, 9);
  int v11 = sqlite3_column_int(a2, 10);
  LODWORD(v16) = sqlite3_column_int(a2, 11);
  uint64_t v12 = [v19 _persistentTemporaryExposureKeyWithKeyData:v18 appBundleIdentifier:v4 regionCountryCode:v5 rollingStartNumber:v17 rollingPeriod:v6 daysSinceOnsetOfSymptoms:v7 diagnosisReportType:__PAIR64__(v9 originalReportType:v8) transmissionRiskLevel:__PAIR64__(v11 variantOfConcernType:v10) originalVariantOfConcernType:v16];
  uint64_t v13 = *(void *)(a1[6] + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  return 1;
}

- (int64_t)_updateExistingPersistentKeyIfNecessary:(id)a3 replacementKey:(id)a4 existingKeyID:(int64_t)a5 connection:(id)a6 error:(id *)a7
{
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  int v14 = [v13 originalReportType];
  int v15 = [v13 key];
  int v16 = [v15 diagnosisReportType];

  sqlite3_int64 v17 = [v12 key];
  int v18 = [v17 diagnosisReportType];

  long long v19 = [v13 key];

  int v20 = [v19 variantOfConcernType];
  uint64_t v21 = [v12 key];

  int v22 = [v21 variantOfConcernType];
  int64_t v23 = 4;
  if (v14 && v14 == v16 && !v20)
  {
    uint64_t v24 = ENCompareDiagnosisReportTypes();
    if (v24 != -1)
    {
      if (v24)
      {
        int64_t v23 = 4;
        if (!v22) {
          goto LABEL_12;
        }
      }
      else
      {
        int64_t v23 = 2;
        if (!v22) {
          goto LABEL_12;
        }
      }
    }
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __108__ENExposureDatabase__updateExistingPersistentKeyIfNecessary_replacementKey_existingKeyID_connection_error___block_invoke;
    v26[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
    int v27 = v18;
    int v28 = v22;
    v26[4] = a5;
    if ([v11 executeSQL:@"UPDATE teks SET (report_type, variant_of_concern_type) = (?, ?) WHERE ROWID = ?", a7, v26, 0 error bindingHandler enumerationHandler])int64_t v23 = 3; {
    else
    }
      int64_t v23 = 0;
  }
LABEL_12:

  return v23;
}

uint64_t __108__ENExposureDatabase__updateExistingPersistentKeyIfNecessary_replacementKey_existingKeyID_connection_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(unsigned int *)(a1 + 40));
  sqlite3_bind_int64(a2, 2, *(unsigned int *)(a1 + 44));
  sqlite3_int64 v4 = *(void *)(a1 + 32);

  return sqlite3_bind_int64(a2, 3, v4);
}

- (id)_persistentTemporaryExposureKeyWithKeyData:(id)a3 appBundleIdentifier:(id)a4 regionCountryCode:(id)a5 rollingStartNumber:(int64_t)a6 rollingPeriod:(int64_t)a7 daysSinceOnsetOfSymptoms:(int64_t)a8 diagnosisReportType:(int)a9 originalReportType:(int)a10 transmissionRiskLevel:(int)a11 variantOfConcernType:(int)a12 originalVariantOfConcernType:(int)a13
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  if (v18)
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F25800]);
    [v21 setKeyData:v18];
    [v21 setRollingStartNumber:a6];
    [v21 setRollingPeriod:a7];
    [v21 setDaysSinceOnsetOfSymptoms:a8];
    [v21 setDiagnosisReportType:a9];
    [v21 setTransmissionRiskLevel:a11];
    [v21 setVariantOfConcernType:a12];
    [v21 setOriginalVariantOfConcernType:a13];
    int v22 = [[ENPersistentTemporaryExposureKey alloc] initWithTemporaryExposureKey:v21 appBundleIdentifier:v19 regionCountryCode:v20];
    [(ENPersistentTemporaryExposureKey *)v22 setOriginalReportType:a10];
    [(ENPersistentTemporaryExposureKey *)v22 setOriginalVariantOfConcernType:a13];
  }
  else
  {
    int64_t v23 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v24 = [v23 isSensitiveLoggingAllowed];

    if (v24
      && gLogCategory_ENExposureDatabase <= 90
      && (gLogCategory_ENExposureDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    int v22 = 0;
  }

  return v22;
}

- (BOOL)_insertPersistentTemporaryExposureKey:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v7 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__ENExposureDatabase__insertPersistentTemporaryExposureKey_connection_error___block_invoke;
  v10[3] = &unk_1E69AE730;
  id v11 = v7;
  id v8 = v7;
  LOBYTE(a5) = [a4 executeSQL:@"INSERT INTO teks (app_bundle_id, region_id, key, start, period, end, onset_days, report_type, original_report_type, transmission_risk, variant_of_concern_type, original_variant_of_concern_type) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", a5, v10, 0 error bindingHandler enumerationHandler];

  return (char)a5;
}

void __77__ENExposureDatabase__insertPersistentTemporaryExposureKey_connection_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = [*(id *)(a1 + 32) appBundleIdentifier];
  ENSQLiteBindFoundationValue(a2, 1, v4);

  id v5 = [*(id *)(a1 + 32) regionCountryCode];
  ENSQLiteBindFoundationValue(a2, 2, v5);

  id v7 = [*(id *)(a1 + 32) key];
  sqlite3_int64 v6 = [v7 keyData];
  ENSQLiteBindFoundationValue(a2, 3, v6);

  sqlite3_bind_int64(a2, 4, [v7 rollingStartNumber]);
  sqlite3_bind_int64(a2, 5, [v7 rollingPeriod]);
  sqlite3_bind_int64(a2, 6, [v7 rollingPeriod] + objc_msgSend(v7, "rollingStartNumber"));
  sqlite3_bind_int64(a2, 7, [v7 daysSinceOnsetOfSymptoms]);
  sqlite3_bind_int64(a2, 8, [v7 diagnosisReportType]);
  sqlite3_bind_int64(a2, 9, [*(id *)(a1 + 32) originalReportType]);
  sqlite3_bind_int(a2, 10, [v7 transmissionRiskLevel]);
  sqlite3_bind_int64(a2, 11, [v7 variantOfConcernType]);
  sqlite3_bind_int64(a2, 12, [*(id *)(a1 + 32) originalVariantOfConcernType]);
}

- (BOOL)enumerateMatchedAdvertisementsWithError:(id *)a3 handler:(id)a4
{
  id v6 = a4;
  if ([(ENExposureDatabase *)self _checkDatabaseOpenWithError:a3])
  {
    connection = self->_connection;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__ENExposureDatabase_enumerateMatchedAdvertisementsWithError_handler___block_invoke;
    v10[3] = &unk_1E69AE7C8;
    void v10[4] = self;
    id v11 = v6;
    BOOL v8 = [(ENSQLiteConnection *)connection performTransactionWithType:0 error:a3 usingBlock:v10];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __70__ENExposureDatabase_enumerateMatchedAdvertisementsWithError_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__ENExposureDatabase_enumerateMatchedAdvertisementsWithError_handler___block_invoke_2;
  v10[3] = &unk_1E69AE7A0;
  id v6 = *(void **)(a1 + 40);
  void v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v7 = v5;
  uint64_t v8 = [v7 executeSQL:@"SELECT ROWID, key, app_bundle_id, region_id, start, period, onset_days, report_type, original_report_type, transmission_risk, variant_of_concern_type, original_variant_of_concern_type FROM teks", a3, 0, v10 error bindingHandler enumerationHandler];

  return v8;
}

uint64_t __70__ENExposureDatabase_enumerateMatchedAdvertisementsWithError_handler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2, uint64_t a3)
{
  sqlite3_int64 v5 = sqlite3_column_int64(a2, 0);
  int v28 = *(void **)(a1 + 32);
  sqlite3_int64 v29 = v5;
  int v27 = ENSQLiteColumnAsData(a2, 1);
  id v6 = ENSQLiteColumnAsString(a2, 2);
  id v7 = ENSQLiteColumnAsString(a2, 3);
  sqlite3_int64 v26 = sqlite3_column_int64(a2, 4);
  sqlite3_int64 v8 = sqlite3_column_int64(a2, 5);
  sqlite3_int64 v9 = sqlite3_column_int64(a2, 6);
  int v10 = sqlite3_column_int(a2, 7);
  int v11 = sqlite3_column_int(a2, 8);
  int v12 = sqlite3_column_int(a2, 9);
  int v13 = sqlite3_column_int(a2, 10);
  LODWORD(v24) = sqlite3_column_int(a2, 11);
  int v14 = [v28 _persistentTemporaryExposureKeyWithKeyData:v27 appBundleIdentifier:v6 regionCountryCode:v7 rollingStartNumber:v26 rollingPeriod:v8 daysSinceOnsetOfSymptoms:v9 diagnosisReportType:__PAIR64__(v11 originalReportType:v10) transmissionRiskLevel:__PAIR64__(v13 variantOfConcernType:v12) originalVariantOfConcernType:v24];

  if (v14)
  {
    int v15 = [*(id *)(a1 + 32) _advertisementsForTemporaryExposureKeyRowID:v29 connection:*(void *)(a1 + 40) error:a3];
    int v16 = v15;
    if (v15)
    {
      if ([v15 count])
      {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_22:

        goto LABEL_23;
      }
      id v21 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v22 = [v21 isSensitiveLoggingAllowed];

      if (!v22
        || gLogCategory_ENExposureDatabase > 90
        || gLogCategory_ENExposureDatabase == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_22;
      }
    }
    else
    {
      id v19 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v20 = [v19 isSensitiveLoggingAllowed];

      if (!v20
        || gLogCategory_ENExposureDatabase > 90
        || gLogCategory_ENExposureDatabase == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_22;
      }
    }
    LogPrintF_safe();
    goto LABEL_22;
  }
  sqlite3_int64 v17 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v18 = [v17 isSensitiveLoggingAllowed];

  if (v18
    && gLogCategory_ENExposureDatabase <= 90
    && (gLogCategory_ENExposureDatabase != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_23:

  return 1;
}

- (id)advertisementCountsByTemporaryKeyDatasWithError:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA68]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__ENExposureDatabase_advertisementCountsByTemporaryKeyDatasWithError___block_invoke;
  v10[3] = &unk_1E69AE7F0;
  id v11 = v5;
  id v6 = v5;
  if ([(ENExposureDatabase *)self enumerateMatchedAdvertisementsWithError:a3 handler:v10])
  {
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  return v8;
}

void __70__ENExposureDatabase_advertisementCountsByTemporaryKeyDatasWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x1E4F28EC8];
  id v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(a3, "count"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = *(void **)(a1 + 32);
  id v8 = [v6 key];

  sqlite3_int64 v9 = [v8 keyData];
  [v7 setObject:v10 forKeyedSubscript:v9];
}

- (id)_advertisementsForTemporaryExposureKeyRowID:(int64_t)a3 connection:(id)a4 error:(id *)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F1CA40];
  id v9 = a4;
  id v10 = objc_alloc_init(v8);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __83__ENExposureDatabase__advertisementsForTemporaryExposureKeyRowID_connection_error___block_invoke;
  v17[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v17[4] = a3;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__ENExposureDatabase__advertisementsForTemporaryExposureKeyRowID_connection_error___block_invoke_2;
  v15[3] = &unk_1E69AE838;
  v15[4] = self;
  id v16 = v10;
  id v11 = v10;
  LODWORD(a5) = [v9 executeSQL:@"SELECT rpi, encrypted_aem, timestamp, scan_interval, rssi, max_rssi, saturated, counter FROM advertisements WHERE tek_id = ?", a5, v17, v15 error bindingHandler enumerationHandler];

  if (a5) {
    int v12 = v11;
  }
  else {
    int v12 = 0;
  }
  id v13 = v12;

  return v13;
}

uint64_t __83__ENExposureDatabase__advertisementsForTemporaryExposureKeyRowID_connection_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __83__ENExposureDatabase__advertisementsForTemporaryExposureKeyRowID_connection_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = sqlite3_column_int64(a2, 2);
  id v5 = *(void **)(a1 + 32);
  id v6 = ENSQLiteColumnAsData(a2, 0);
  id v7 = ENSQLiteColumnAsData(a2, 1);
  uint64_t v8 = sqlite3_column_int(a2, 3);
  uint64_t v9 = sqlite3_column_int(a2, 4);
  uint64_t v10 = sqlite3_column_int(a2, 5);
  int v11 = sqlite3_column_int(a2, 6);
  int v12 = objc_msgSend(v5, "_advertisementWithRPIData:encryptedAEMData:timestamp:scanInterval:typicalRSSI:maxRSSI:saturated:counter:", v6, v7, v4, v8, v9, v10, __PAIR64__(sqlite3_column_int(a2, 7), v11));

  if (v12)
  {
    [*(id *)(a1 + 40) addObject:v12];
  }
  else
  {
    id v13 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v14 = [v13 isSensitiveLoggingAllowed];

    if (v14
      && gLogCategory_ENExposureDatabase <= 90
      && (gLogCategory_ENExposureDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }

  return 1;
}

- (id)_advertisementWithRPIData:(id)a3 encryptedAEMData:(id)a4 timestamp:(int64_t)a5 scanInterval:(int)a6 typicalRSSI:(int)a7 maxRSSI:(int)a8 saturated:(int)a9 counter:(int)a10
{
  char v10 = a8;
  char v11 = a7;
  unsigned __int16 v12 = a6;
  id v15 = a3;
  id v16 = a4;
  id v17 = v15;
  if (v17)
  {
    int v18 = [ENAdvertisement alloc];
    id v19 = v18;
    if (v16)
    {
      LOBYTE(v23) = a10;
      int v20 = [(ENAdvertisement *)v18 initWithRPI:v17 encryptedAEM:v16 timestamp:v12 scanInterval:v11 typicalRSSI:v10 maxRSSI:a9 != 0 saturated:(double)a5 counter:v23];
    }
    else
    {
      id v21 = [MEMORY[0x1E4F1C9B0] data];
      LOBYTE(v23) = a10;
      int v20 = [(ENAdvertisement *)v19 initWithRPI:v17 encryptedAEM:v21 timestamp:v12 scanInterval:v11 typicalRSSI:v10 maxRSSI:a9 != 0 saturated:(double)a5 counter:v23];
    }
  }
  else
  {
    int v20 = 0;
  }

  return v20;
}

- (BOOL)getAdvertisementCount:(unsigned int *)a3 error:(id *)a4
{
  if (![(ENExposureDatabase *)self _checkDatabaseOpenWithError:a4]) {
    return 0;
  }
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  connection = self->_connection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__ENExposureDatabase_getAdvertisementCount_error___block_invoke;
  v11[3] = &unk_1E69AE860;
  v11[4] = &v12;
  BOOL v8 = [(ENSQLiteConnection *)connection executeSQL:@"SELECT COUNT(*) FROM advertisements" error:a4 bindingHandler:0 enumerationHandler:v11];
  char v9 = !v8;
  if (!a3) {
    char v9 = 1;
  }
  if ((v9 & 1) == 0) {
    *a3 = *((_DWORD *)v13 + 6);
  }
  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __50__ENExposureDatabase_getAdvertisementCount_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sqlite3_column_int64(a2, 0);
  return 1;
}

- (BOOL)upsertExposureDetectionHistorySession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(ENExposureDatabase *)self _checkDatabaseOpenWithError:a4])
  {
    connection = self->_connection;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__ENExposureDatabase_upsertExposureDetectionHistorySession_error___block_invoke;
    v10[3] = &unk_1E69AE888;
    void v10[4] = self;
    id v11 = v6;
    BOOL v8 = [(ENSQLiteConnection *)connection performTransactionWithType:1 error:a4 usingBlock:v10];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __66__ENExposureDatabase_upsertExposureDetectionHistorySession_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _insertOrUpdateExposureDetectionHistorySession:*(void *)(a1 + 40) connection:a2 error:a3];
}

- (BOOL)_insertOrUpdateExposureDetectionHistorySession:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v7 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__ENExposureDatabase__insertOrUpdateExposureDetectionHistorySession_connection_error___block_invoke;
  v10[3] = &unk_1E69AE730;
  id v11 = v7;
  id v8 = v7;
  LOBYTE(a5) = [a4 executeSQL:@"INSERT INTO session_history (uuid, date, app_bundle_id, region_cc, region_sc, file_count, match_count, build, exp_class) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) ON CONFLICT(uuid) DO UPDATE SET date=excluded.date, app_bundle_id=excluded.app_bundle_id, region_cc=excluded.region_cc, region_sc=excluded.region_sc, file_count=excluded.file_count, match_count=excluded.match_count, build=excluded.build, exp_class=excluded.exp_class", a5, v10, 0 error bindingHandler enumerationHandler];

  return (char)a5;
}

void __86__ENExposureDatabase__insertOrUpdateExposureDetectionHistorySession_connection_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = [*(id *)(a1 + 32) UUID];
  ENSQLiteBindFoundationValue(a2, 1, v4);

  id v5 = [*(id *)(a1 + 32) date];
  ENSQLiteBindFoundationValue(a2, 2, v5);

  id v6 = [*(id *)(a1 + 32) appBundleIdentifier];
  ENSQLiteBindFoundationValue(a2, 3, v6);

  id v7 = [*(id *)(a1 + 32) region];
  id v8 = [v7 countryCode];
  ENSQLiteBindFoundationValue(a2, 4, v8);

  char v9 = [*(id *)(a1 + 32) region];
  char v10 = [v9 subdivisionCode];
  ENSQLiteBindFoundationValue(a2, 5, v10);

  sqlite3_bind_int64(a2, 6, [*(id *)(a1 + 32) fileCount]);
  sqlite3_bind_int64(a2, 7, [*(id *)(a1 + 32) matchCount]);
  id v11 = [*(id *)(a1 + 32) systemBuildVersion];
  ENSQLiteBindFoundationValue(a2, 8, v11);

  id v12 = [*(id *)(a1 + 32) exposureClassificationIdentifier];
  ENSQLiteBindFoundationValue(a2, 9, v12);
}

- (id)_sessionIDForUUID:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__9;
  int v20 = __Block_byref_object_dispose__9;
  id v21 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__ENExposureDatabase__sessionIDForUUID_connection_error___block_invoke;
  v14[3] = &unk_1E69AE730;
  id v9 = v7;
  id v15 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__ENExposureDatabase__sessionIDForUUID_connection_error___block_invoke_2;
  v13[3] = &unk_1E69AE860;
  v13[4] = &v16;
  if (![v8 executeSQL:@"SELECT ROWID FROM session_history WHERE uuid=?" error:a5 bindingHandler:v14 enumerationHandler:v13])
  {
    char v10 = 0;
    goto LABEL_6;
  }
  char v10 = (void *)v17[5];
  if (v10)
  {
LABEL_6:
    id v11 = v10;
    goto LABEL_7;
  }
  if (a5)
  {
    ENErrorF();
    id v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }
LABEL_7:

  _Block_object_dispose(&v16, 8);

  return v11;
}

void __57__ENExposureDatabase__sessionIDForUUID_connection_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
}

uint64_t __57__ENExposureDatabase__sessionIDForUUID_connection_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28EC8], "numberWithLongLong:", sqlite3_column_int64(a2, 0));
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

- (BOOL)enumerateExposureDetectionHistorySessionsWithError:(id *)a3 handler:(id)a4
{
  id v6 = a4;
  if ([(ENExposureDatabase *)self _checkDatabaseOpenWithError:a3])
  {
    connection = self->_connection;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __81__ENExposureDatabase_enumerateExposureDetectionHistorySessionsWithError_handler___block_invoke;
    v10[3] = &unk_1E69AE8B0;
    id v11 = v6;
    BOOL v8 = [(ENSQLiteConnection *)connection executeSQL:@"SELECT uuid, date, app_bundle_id, region_cc, region_sc, file_count, match_count, build, exp_class FROM session_history ORDER BY date DESC" error:a3 bindingHandler:0 enumerationHandler:v10];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

BOOL __81__ENExposureDatabase_enumerateExposureDetectionHistorySessionsWithError_handler___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = ENSQLiteColumnAsUUID(a2, 0);
  BOOL v5 = 1;
  uint64_t v6 = ENSQLiteColumnAsDate(a2, 1);
  id v7 = (void *)v6;
  if (v4 && v6)
  {
    BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4F25758]) initWithUUID:v4];
    [v8 setDate:v7];
    id v9 = ENSQLiteColumnAsString(a2, 2);
    [v8 setAppBundleIdentifier:v9];

    char v10 = ENSQLiteColumnAsString(a2, 3);
    id v11 = ENSQLiteColumnAsString(a2, 4);
    if (v10)
    {
      id v12 = (void *)[objc_alloc(MEMORY[0x1E4F257A8]) initWithCountryCode:v10 subdivisionCode:v11];
      [v8 setRegion:v12];
    }
    objc_msgSend(v8, "setFileCount:", sqlite3_column_int64(a2, 5));
    objc_msgSend(v8, "setMatchCount:", sqlite3_column_int64(a2, 6));
    id v13 = ENSQLiteColumnAsString(a2, 7);
    [v8 setSystemBuildVersion:v13];

    uint64_t v14 = ENSQLiteColumnAsString(a2, 8);
    [v8 setExposureClassificationIdentifier:v14];

    char v16 = 0;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    BOOL v5 = v16 == 0;
  }
  return v5;
}

- (BOOL)insertExposureDetectionFile:(id)a3 session:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(ENExposureDatabase *)self _checkDatabaseOpenWithError:a5])
  {
    connection = self->_connection;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__ENExposureDatabase_insertExposureDetectionFile_session_error___block_invoke;
    v13[3] = &unk_1E69AE8D8;
    v13[4] = self;
    id v14 = v9;
    id v15 = v8;
    BOOL v11 = [(ENSQLiteConnection *)connection performTransactionWithType:1 error:a5 usingBlock:v13];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

uint64_t __64__ENExposureDatabase_insertExposureDetectionFile_session_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) UUID];
  id v8 = [v6 _sessionIDForUUID:v7 connection:v5 error:a3];

  if (v8) {
    uint64_t v9 = [*(id *)(a1 + 32) _insertExposureDetectionFile:*(void *)(a1 + 48) sessionID:v8 connection:v5 error:a3];
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)_insertExposureDetectionFile:(id)a3 sessionID:(id)a4 connection:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v9 metadata];
  id v13 = 0;
  char v14 = 1;
  while (v12 && (v14 & 1) != 0)
  {
    uint64_t v15 = [MEMORY[0x1E4F28FA0] dataWithPropertyList:v12 format:200 options:0 error:a6];

    char v14 = 0;
    id v13 = (void *)v15;
    if (!v15)
    {

      char v16 = 0;
      goto LABEL_7;
    }
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __78__ENExposureDatabase__insertExposureDetectionFile_sessionID_connection_error___block_invoke;
  v19[3] = &unk_1E69AE900;
  id v20 = v9;
  id v21 = v10;
  id v22 = v13;
  id v17 = v13;
  char v16 = [v11 executeSQL:@"INSERT INTO file_history (hash, date, session_id, key_count, match_count, app_bundle_id, region_cc, region_sc, metadata) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", a6, v19, 0 error bindingHandler enumerationHandler];

LABEL_7:
  return v16;
}

void __78__ENExposureDatabase__insertExposureDetectionFile_sessionID_connection_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) fileHash];
  ENSQLiteBindFoundationValue(a2, 1, v4);

  id v5 = [*(id *)(a1 + 32) processDate];
  ENSQLiteBindFoundationValue(a2, 2, v5);

  sqlite3_bind_int64(a2, 3, [*(id *)(a1 + 40) longLongValue]);
  uint64_t v6 = [*(id *)(a1 + 32) keyCount];
  sqlite3_bind_int64(a2, 4, [v6 longLongValue]);

  id v7 = [*(id *)(a1 + 32) matchCount];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) matchCount];
    sqlite3_bind_int64(a2, 5, [v8 longLongValue]);
  }
  else
  {
    sqlite3_bind_null(a2, 5);
  }
  id v9 = [*(id *)(a1 + 32) sourceAppBundleIdentifier];
  ENSQLiteBindFoundationValue(a2, 6, v9);

  id v10 = [*(id *)(a1 + 32) sourceRegion];
  id v11 = [v10 countryCode];
  ENSQLiteBindFoundationValue(a2, 7, v11);

  id v12 = [*(id *)(a1 + 32) sourceRegion];
  id v13 = [v12 subdivisionCode];
  ENSQLiteBindFoundationValue(a2, 8, v13);

  char v14 = *(void **)(a1 + 48);

  ENSQLiteBindFoundationValue(a2, 9, v14);
}

- (BOOL)enumerateExposureDetectionHistoryFilesForSessionUUID:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(ENExposureDatabase *)self _checkDatabaseOpenWithError:a4])
  {
    connection = self->_connection;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __89__ENExposureDatabase_enumerateExposureDetectionHistoryFilesForSessionUUID_error_handler___block_invoke;
    v13[3] = &unk_1E69AE928;
    v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    BOOL v11 = [(ENSQLiteConnection *)connection performTransactionWithType:1 error:a4 usingBlock:v13];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

uint64_t __89__ENExposureDatabase_enumerateExposureDetectionHistoryFilesForSessionUUID_error_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) _sessionIDForUUID:*(void *)(a1 + 40) connection:a2 error:a3];
  uint64_t v6 = (void *)v5;
  if (v5)
  {
    id v7 = *(void **)(*(void *)(a1 + 32) + 24);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __89__ENExposureDatabase_enumerateExposureDetectionHistoryFilesForSessionUUID_error_handler___block_invoke_2;
    v12[3] = &unk_1E69AE730;
    void v12[4] = v5;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __89__ENExposureDatabase_enumerateExposureDetectionHistoryFilesForSessionUUID_error_handler___block_invoke_3;
    v10[3] = &unk_1E69AE8B0;
    id v11 = *(id *)(a1 + 48);
    uint64_t v8 = [v7 executeSQL:@"SELECT hash, date, key_count, match_count, app_bundle_id, region_cc, region_sc, metadata FROM file_history WHERE session_id=? ORDER BY date DESC", a3, v12, v10 error bindingHandler enumerationHandler];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __89__ENExposureDatabase_enumerateExposureDetectionHistoryFilesForSessionUUID_error_handler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v3 = [*(id *)(a1 + 32) longLongValue];

  return sqlite3_bind_int64(a2, 1, v3);
}

uint64_t __89__ENExposureDatabase_enumerateExposureDetectionHistoryFilesForSessionUUID_error_handler___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = ENSQLiteColumnAsData(a2, 0);
  uint64_t v5 = ENSQLiteColumnAsDate(a2, 1);
  uint64_t v6 = (void *)v5;
  if (v4 && v5)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F25750]);
    [v7 setFileHash:v4];
    [v7 setProcessDate:v6];
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28EC8], "numberWithLongLong:", sqlite3_column_int64(a2, 2));
    [v7 setKeyCount:v8];

    if (sqlite3_column_type(a2, 3) != 5)
    {
      id v9 = objc_msgSend(MEMORY[0x1E4F28EC8], "numberWithLongLong:", sqlite3_column_int64(a2, 3));
      [v7 setMatchCount:v9];
    }
    id v10 = ENSQLiteColumnAsString(a2, 4);
    [v7 setSourceAppBundleIdentifier:v10];

    id v11 = ENSQLiteColumnAsString(a2, 5);
    id v12 = ENSQLiteColumnAsString(a2, 6);
    if (v11)
    {
      id v13 = (void *)[objc_alloc(MEMORY[0x1E4F257A8]) initWithCountryCode:v11 subdivisionCode:v12];
      [v7 setSourceRegion:v13];
    }
    id v14 = ENSQLiteColumnAsData(a2, 7);
    if (!v14) {
      goto LABEL_21;
    }
    id v18 = 0;
    id v15 = [MEMORY[0x1E4F28FA0] propertyListWithData:v14 options:0 format:0 error:&v18];
    id v16 = v18;
    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 setMetadata:v15];
LABEL_20:

LABEL_21:
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));

        goto LABEL_22;
      }
      if (gLogCategory__ENExposureDatabase > 90
        || gLogCategory__ENExposureDatabase == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_20;
      }
    }
    else if (gLogCategory__ENExposureDatabase > 90 {
           || gLogCategory__ENExposureDatabase == -1 && !_LogCategory_Initialize())
    }
    {
      goto LABEL_20;
    }
    LogPrintF_safe();
    goto LABEL_20;
  }
LABEL_22:

  return 1;
}

- (BOOL)deleteExposureDetectionHistoryWithError:(id *)a3
{
  if (!-[ENExposureDatabase _checkDatabaseOpenWithError:](self, "_checkDatabaseOpenWithError:")) {
    return 0;
  }
  BOOL v5 = [(ENSQLiteConnection *)self->_connection executeUncachedSQL:@"DELETE FROM session_history" error:a3];
  connection = self->_connection;
  id v10 = 0;
  BOOL v7 = [(ENSQLiteConnection *)connection executeUncachedSQL:@"PRAGMA wal_checkpoint(TRUNCATE)" error:&v10];
  id v8 = v10;
  if (!v7
    && gLogCategory__ENExposureDatabase <= 90
    && (gLogCategory__ENExposureDatabase != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  return v5;
}

- (BOOL)getValue:(id *)a3 forKey:(id)a4 ofClass:(Class)a5 error:(id *)a6
{
  id v10 = a4;
  if ([(ENExposureDatabase *)self _checkDatabaseOpenWithError:a6])
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = __Block_byref_object_copy__9;
    uint64_t v23 = __Block_byref_object_dispose__9;
    id v24 = 0;
    connection = self->_connection;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __52__ENExposureDatabase_getValue_forKey_ofClass_error___block_invoke;
    v15[3] = &unk_1E69AE950;
    v15[4] = self;
    id v17 = &v19;
    id v16 = v10;
    Class v18 = a5;
    BOOL v12 = [(ENSQLiteConnection *)connection performTransactionWithType:0 error:a6 usingBlock:v15];
    char v13 = !v12;
    if (!a3) {
      char v13 = 1;
    }
    if ((v13 & 1) == 0) {
      *a3 = (id) v20[5];
    }

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

uint64_t __52__ENExposureDatabase_getValue_forKey_ofClass_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [*(id *)(a1 + 32) getValue:&obj forKey:*(void *)(a1 + 40) ofClass:v3 connection:a2 error:a3];
  objc_storeStrong((id *)(v4 + 40), obj);
  return v5;
}

- (BOOL)getValue:(id *)a3 forKey:(id)a4 ofClass:(Class)a5 connection:(id)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a6;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__9;
  v39 = __Block_byref_object_dispose__9;
  id v40 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 3;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __63__ENExposureDatabase_getValue_forKey_ofClass_connection_error___block_invoke;
  v29[3] = &unk_1E69AE730;
  id v13 = v11;
  id v30 = v13;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __63__ENExposureDatabase_getValue_forKey_ofClass_connection_error___block_invoke_2;
  v28[3] = &unk_1E69AE978;
  v28[4] = &v31;
  v28[5] = &v35;
  if ([v12 executeSQL:@"SELECT type, value FROM kvs WHERE key LIKE ?", a7, v29, v28 error bindingHandler enumerationHandler])
  {
    if (v36[5])
    {
      id v14 = (void *)MEMORY[0x1D9439DC0]();
      uint64_t v15 = v32[3];
      if (v15 == 1)
      {
        id v18 = (id)v36[5];
        int v27 = 0;
        uint64_t v19 = [MEMORY[0x1E4F28DB8] unarchivedObjectOfClass:a5 fromData:v18 error:&v27];
        id v20 = v27;
      }
      else
      {
        if (v15 != 2)
        {
          if (v15 != 3 || (objc_opt_isKindOfClass() & 1) != 0)
          {
            id v16 = 0;
            BOOL v17 = 1;
            goto LABEL_14;
          }
          id v24 = (objc_class *)objc_opt_class();
          NSStringFromClass(v24);
          id v18 = (id)objc_claimAutoreleasedReturnValue();
          id v25 = NSStringFromClass(a5);
          ENErrorF();
          id v16 = (id)objc_claimAutoreleasedReturnValue();

          BOOL v17 = 0;
LABEL_13:

LABEL_14:
          if (v17)
          {
            id v22 = (void *)v36[5];
            a7 = a3;
          }
          else
          {
            id v22 = v16;
            if (!a7)
            {
LABEL_18:

              goto LABEL_19;
            }
          }
          *a7 = v22;
          goto LABEL_18;
        }
        id v18 = (id)v36[5];
        sqlite3_int64 v26 = 0;
        uint64_t v19 = [MEMORY[0x1E4F28FA0] propertyListWithData:v18 options:0 format:0 error:&v26];
        id v20 = v26;
      }
      id v16 = v20;
      uint64_t v21 = (void *)v36[5];
      v36[5] = v19;

      BOOL v17 = v36[5] != 0;
      goto LABEL_13;
    }
    *a3 = 0;
    LOBYTE(v17) = 1;
  }
  else
  {
    LOBYTE(v17) = 0;
  }
LABEL_19:

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v17;
}

void __63__ENExposureDatabase_getValue_forKey_ofClass_connection_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
}

uint64_t __63__ENExposureDatabase_getValue_forKey_ofClass_connection_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sqlite3_column_int64(a2, 0);
  uint64_t v4 = ENSQLiteColumnAsNaturalType(a2, 1);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return 1;
}

- (BOOL)setValue:(id)a3 forKey:(id)a4 expiryDate:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v13 = 3;
  }
  else
  {
    uint64_t v13 = 1;
  }
  connection = self->_connection;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __55__ENExposureDatabase_setValue_forKey_expiryDate_error___block_invoke;
  v20[3] = &unk_1E69AE9A0;
  v20[4] = self;
  id v21 = v10;
  id v23 = v12;
  uint64_t v24 = v13;
  id v22 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  BOOL v18 = [(ENSQLiteConnection *)connection performTransactionWithType:1 error:a6 usingBlock:v20];

  return v18;
}

uint64_t __55__ENExposureDatabase_setValue_forKey_expiryDate_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v7 = a1[7];
  uint64_t v6 = a1[8];
  uint64_t v8 = a1[6];
  id v9 = (void *)MEMORY[0x1E4F1C9C0];
  id v10 = a2;
  id v11 = [v9 date];
  uint64_t v12 = [v4 setValue:v5 forKey:v8 type:v6 expiryDate:v7 modDate:v11 connection:v10 error:a3];

  return v12;
}

- (BOOL)setPropertyListValue:(id)a3 forKey:(id)a4 expiryDate:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  connection = self->_connection;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__ENExposureDatabase_setPropertyListValue_forKey_expiryDate_error___block_invoke;
  v18[3] = &unk_1E69AE9C8;
  v18[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  LOBYTE(a6) = [(ENSQLiteConnection *)connection performTransactionWithType:1 error:a6 usingBlock:v18];

  return (char)a6;
}

uint64_t __67__ENExposureDatabase_setPropertyListValue_forKey_expiryDate_error___block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  uint64_t v8 = (void *)MEMORY[0x1E4F1C9C0];
  id v9 = a2;
  id v10 = [v8 date];
  uint64_t v11 = [v4 setValue:v5 forKey:v6 type:2 expiryDate:v7 modDate:v10 connection:v9 error:a3];

  return v11;
}

- (BOOL)setValue:(id)a3 forKey:(id)a4 type:(int64_t)a5 expiryDate:(id)a6 modDate:(id)a7 connection:(id)a8 error:(id *)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = (void *)MEMORY[0x1D9439DC0]();
  if (!v14) {
    goto LABEL_5;
  }
  if (a5 == 2)
  {
    uint64_t v34 = 0;
    uint64_t v20 = [MEMORY[0x1E4F28FA0] dataWithPropertyList:v14 format:200 options:0 error:&v34];
    id v21 = v34;
    goto LABEL_7;
  }
  if (a5 != 1)
  {
LABEL_5:
    id v22 = 0;
    goto LABEL_9;
  }
  uint64_t v35 = 0;
  uint64_t v20 = [MEMORY[0x1E4F28DA8] archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v35];
  id v21 = v35;
LABEL_7:
  id v22 = v21;

  if (!v20)
  {
    id v23 = 0;
    int v24 = 0;
    goto LABEL_10;
  }
  id v14 = (id)v20;
LABEL_9:
  id v33 = v22;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __79__ENExposureDatabase_setValue_forKey_type_expiryDate_modDate_connection_error___block_invoke;
  v27[3] = &unk_1E69AE9F0;
  id v28 = v15;
  id v23 = v14;
  id v29 = v23;
  int64_t v32 = a5;
  id v30 = v17;
  id v31 = v16;
  int v24 = [v18 executeSQL:@"INSERT OR REPLACE INTO kvs(key, value, type, mod_date, expiration_date) VALUES (?, ?, ?, ?, ?)", &v33, v27, 0 error bindingHandler enumerationHandler];
  id v25 = v33;

  id v22 = v25;
LABEL_10:
  if (a9 && !v24 && v22) {
    *a9 = v22;
  }

  return v24;
}

void __79__ENExposureDatabase_setValue_forKey_type_expiryDate_modDate_connection_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  ENSQLiteBindFoundationValue(a2, 1, *(void **)(a1 + 32));
  ENSQLiteBindFoundationValue(a2, 2, *(void **)(a1 + 40));
  sqlite3_bind_int64(a2, 3, *(void *)(a1 + 64));
  ENSQLiteBindFoundationValue(a2, 4, *(void **)(a1 + 48));
  uint64_t v4 = *(void **)(a1 + 56);

  ENSQLiteBindFoundationValue(a2, 5, v4);
}

- (BOOL)purgeRecordsWithInterval:(double)a3 nowDate:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if ([(ENExposureDatabase *)self _checkDatabaseOpenWithError:a5])
  {
    id v9 = [v8 dateByAddingTimeInterval:-a3];
    [v9 timeIntervalSinceReferenceDate];
    unsigned int v11 = ((v10 + *MEMORY[0x1E4F1CF70]) / 600.0);
    connection = self->_connection;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __61__ENExposureDatabase_purgeRecordsWithInterval_nowDate_error___block_invoke;
    v19[3] = &unk_1E69AEA38;
    unsigned int v22 = v11;
    id v20 = v8;
    id v13 = v9;
    id v21 = v13;
    BOOL v14 = [(ENSQLiteConnection *)connection performTransactionWithType:1 error:a5 usingBlock:v19];
    id v15 = self->_connection;
    id v18 = 0;
    LOBYTE(connection) = [(ENSQLiteConnection *)v15 executeUncachedSQL:@"PRAGMA wal_checkpoint(TRUNCATE)" error:&v18];
    id v16 = v18;
    if ((connection & 1) == 0
      && gLogCategory__ENExposureDatabase <= 90
      && (gLogCategory__ENExposureDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

uint64_t __61__ENExposureDatabase_purgeRecordsWithInterval_nowDate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__ENExposureDatabase_purgeRecordsWithInterval_nowDate_error___block_invoke_2;
  v12[3] = &__block_descriptor_36_e23_v16__0__sqlite3_stmt__8l;
  int v13 = *(_DWORD *)(a1 + 48);
  if ([v5 executeSQL:@"DELETE FROM teks WHERE end <= ?" error:a3 bindingHandler:v12 enumerationHandler:0])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__ENExposureDatabase_purgeRecordsWithInterval_nowDate_error___block_invoke_3;
    v10[3] = &unk_1E69AE730;
    id v11 = *(id *)(a1 + 32);
    if ([v5 executeSQL:@"DELETE FROM kvs WHERE expiration_date IS NOT NULL AND expiration_date <= ?" error:a3 bindingHandler:v10 enumerationHandler:0])
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __61__ENExposureDatabase_purgeRecordsWithInterval_nowDate_error___block_invoke_4;
      v8[3] = &unk_1E69AE730;
      id v9 = *(id *)(a1 + 40);
      uint64_t v6 = [v5 executeSQL:@"DELETE FROM session_history WHERE date < ?" error:a3 bindingHandler:v8 enumerationHandler:0];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __61__ENExposureDatabase_purgeRecordsWithInterval_nowDate_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(unsigned int *)(a1 + 32));
}

uint64_t __61__ENExposureDatabase_purgeRecordsWithInterval_nowDate_error___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];

  return sqlite3_bind_double(a2, 1, v3);
}

uint64_t __61__ENExposureDatabase_purgeRecordsWithInterval_nowDate_error___block_invoke_4(uint64_t a1, sqlite3_stmt *a2)
{
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];

  return sqlite3_bind_double(a2, 1, v3);
}

- (void)purgeAllAndCloseWithReason:(id)a3
{
  id v4 = a3;
  if (gLogCategory_ENExposureDatabase <= 50
    && (gLogCategory_ENExposureDatabase != -1 || _LogCategory_Initialize()))
  {
    id v9 = [(NSURL *)self->_databaseURL path];
    id v10 = v4;
    LogPrintF_safe();
  }
  connection = self->_connection;
  if (!connection) {
    goto LABEL_13;
  }
  id v11 = 0;
  BOOL v6 = [(ENSQLiteConnection *)connection truncateWithError:&v11];
  id v7 = v11;
  id v8 = v7;
  if (!v6)
  {
    if (gLogCategory__ENExposureDatabase <= 90
      && (gLogCategory__ENExposureDatabase != -1 || _LogCategory_Initialize()))
    {
      id v9 = v8;
      LogPrintF_safe();
    }

LABEL_13:
    [(ENExposureDatabase *)self close];
    +[ENExposureDatabase _obliterateDatabaseAtURL:self->_databaseURL reason:v4 generateStackshot:0];
    goto LABEL_14;
  }

  [(ENExposureDatabase *)self close];
LABEL_14:
}

+ (void)_obliterateDatabaseAtURL:(id)a3 reason:(id)a4 generateStackshot:(BOOL)a5
{
  BOOL v5 = a5;
  v45[3] = *(id *)MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    id v31 = [MEMORY[0x1E4F28B08] currentHandler];
    [v31 handleFailureInMethod:a2, a1, @"ENExposureDatabase.m", 1211, @"Invalid parameter not satisfying: %@", @"databaseURL != nil" object file lineNumber description];
  }
  if (v5) {
    int v11 = 115;
  }
  else {
    int v11 = 50;
  }
  if (v11 >= gLogCategory_ENExposureDatabase
    && (gLogCategory_ENExposureDatabase != -1 || _LogCategory_Initialize()))
  {
    int64_t v32 = [v9 path];
    id v34 = v10;
    LogPrintF_safe();
  }
  uint64_t v37 = v10;
  v38 = v9;
  objc_msgSend(v9, "path", v32, v34);
  v45[0] = (id)objc_claimAutoreleasedReturnValue();
  id v12 = [v45[0] stringByAppendingString:@"-wal"];
  v45[1] = v12;
  id v36 = v45[0];
  int v13 = [v45[0] stringByAppendingString:@"-shm"];
  v45[2] = v13;
  BOOL v14 = [MEMORY[0x1E4F1C970] arrayWithObjects:v45 count:3];

  id v15 = objc_alloc_init(MEMORY[0x1E4F28CC0]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v16 = v14;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v44 count:16];
  p_superclass = ENExposureDatabase.superclass;
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v41;
    uint64_t v21 = *MEMORY[0x1E4F281F0];
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(v16);
        }
        uint64_t v23 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        id v39 = 0;
        char v24 = objc_msgSend(v15, "removeItemAtPath:error:", v23, &v39, v33, v35);
        id v25 = v39;
        sqlite3_int64 v26 = v25;
        if (v24)
        {
          int v27 = *((_DWORD *)p_superclass + 580);
          if (v27 <= 50 && (v27 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v33 = v23;
LABEL_26:
            LogPrintF_safe();
          }
        }
        else
        {
          id v28 = [v25 domain];
          if ([v28 isEqualToString:v21])
          {
            if ([v26 code] == 4)
            {

              goto LABEL_33;
            }
            uint64_t v29 = [v26 code];

            BOOL v30 = v29 == 260;
            p_superclass = (__objc2_class **)(ENExposureDatabase + 8);
            if (v30) {
              goto LABEL_33;
            }
          }
          else
          {
          }
          if (gLogCategory__ENExposureDatabase <= 90
            && (gLogCategory__ENExposureDatabase != -1 || _LogCategory_Initialize()))
          {
            uint64_t v33 = v23;
            uint64_t v35 = v26;
            goto LABEL_26;
          }
        }
LABEL_33:
      }
      uint64_t v19 = [v16 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v19);
  }
}

- (id)errorMetricReporter
{
  return self->_errorMetricReporter;
}

- (void)setErrorMetricReporter:(id)a3
{
}

- (ENSQLiteConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_errorMetricReporter, 0);

  objc_storeStrong((id *)&self->_databaseURL, 0);
}

@end