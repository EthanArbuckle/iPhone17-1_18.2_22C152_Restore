@interface ENAdvertisementSQLiteStore
+ ($8B507D830E6EE36862B76123793C2CB9)advertisementForSQLiteStatement:(SEL)a3;
+ (BOOL)isCentralStore:(id)a3;
+ (BOOL)isStore:(id)a3;
+ (BOOL)isTemporaryStore:(id)a3;
+ (BOOL)removeAllDatabaseFilesWithDatabasePath:(id)a3;
+ (BOOL)removeAllStoresFromDiskWithFolderPath:(id)a3;
+ (BOOL)removeAllTemporaryStoresFromDiskWithFolderPath:(id)a3 lastModifiedBeforeDate:(id)a4;
+ (BOOL)storesPresentInFolderPath:(id)a3;
+ (BOOL)temporaryStoresPresentInFolderPath:(id)a3;
+ (id)centralStoreInFolderPath:(id)a3 error:(id *)a4;
+ (id)errorForSQLiteResult:(int)a3;
+ (id)statementStringForStatementType:(unint64_t)a3;
+ (id)storePathsInFolderPath:(id)a3;
+ (id)temporaryStoreInFolderPath:(id)a3 error:(id *)a4;
+ (id)temporaryStorePathsInFolderPath:(id)a3;
+ (id)temporaryStoresInFolderPath:(id)a3;
+ (void)enumerateTemporaryStoresInFolderPath:(id)a3 handler:(id)a4;
- (BOOL)cloneStoreTo:(id)a3;
- (BOOL)connectToDatabaseAndReturnError:(id *)a3;
- (BOOL)importContentsOfStore:(id)a3 error:(id *)a4;
- (BOOL)purgeAdvertismentsRecordedPriorToDate:(id)a3 error:(id *)a4;
- (BOOL)purgeAndRemoveFromDisk:(BOOL)a3;
- (BOOL)refreshStoredAdvertismentCountWithError:(id *)a3;
- (BOOL)saveContactTracingAdvertisementBuffer:(id *)a3 count:(unint64_t)a4 error:(id *)a5;
- (BOOL)transactionNeededForMigrationFromVersion:(int)a3;
- (ENAdvertisementSQLiteStore)initWithPath:(id)a3;
- (ENAdvertisementSQLiteStore)initWithPath:(id)a3 error:(id *)a4;
- (NSNumber)storedAdvertisementCount;
- (NSString)databasePath;
- (id)beaconCountMetricsWithStartDate:(id)a3 endDate:(id)a4 windowDuration:(double)a5;
- (id)queryFilterWithBufferSize:(unint64_t)a3 hashCount:(unint64_t)a4 attenuationThreshold:(unsigned __int8)a5;
- (int)beginDatabaseTransaction;
- (int)bindAdvertisement:(id *)a3 toSQLiteStatement:(sqlite3_stmt *)a4;
- (int)bindRPIBuffer:(const void *)a3 count:(unint64_t)a4 validityBuffer:(const void *)a5 validRPICount:(unint64_t)a6 toSQLiteStatement:(sqlite3_stmt *)a7;
- (int)checkpointWAL;
- (int)closeDatabase;
- (int)configureDatabase;
- (int)endDatabaseTransaction;
- (int)enumerateAdvertisments:(id)a3;
- (int)initializeAdvertisementTable;
- (int)initializePreparedStatements;
- (int)initializeRPIBufferModule;
- (int)migrateDatabase;
- (int)migrateFromVersion:(int)a3;
- (int)openDatabase;
- (int)rollbackDatabaseTransaction;
- (int)setVersionCurrent;
- (sqlite3_stmt)preparedStatementOfType:(unint64_t)a3;
- (unint64_t)getAdvertisementsMatchingRPIBuffer:(const void *)a3 count:(unint64_t)a4 validityBuffer:(const void *)a5 validRPICount:(unint64_t)a6 matchingAdvertisementBuffer:(id *)a7 error:(id *)a8;
- (void)dealloc;
- (void)disconnectFromDatabase;
- (void)enumeratePreparedStatements:(id)a3;
- (void)setDatabasePath:(id)a3;
@end

@implementation ENAdvertisementSQLiteStore

+ (id)centralStoreInFolderPath:(id)a3 error:(id *)a4
{
  v5 = [a3 stringByAppendingPathComponent:@"en_advertisements.db"];
  v6 = [[ENAdvertisementSQLiteStore alloc] initWithPath:v5 error:a4];

  return v6;
}

+ (id)temporaryStoreInFolderPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [a1 temporaryStorePathsInFolderPath:v6];
  unint64_t v8 = [v7 count];

  if (v8 < 0xA)
  {
    v9 = (void *)MEMORY[0x1E4F29020];
    v10 = [MEMORY[0x1E4F29120] UUID];
    v11 = [v10 UUIDString];
    v12 = [v9 stringWithFormat:@"%s%@.db", "tmp_en_advertisements_", v11];

    v13 = [v6 stringByAppendingPathComponent:v12];
    v14 = [[ENAdvertisementSQLiteStore alloc] initWithPath:v13];
  }
  else
  {
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    if (a4)
    {
      [MEMORY[0x1E4F28C50] errorWithDomain:@"ENAdvertisementStoreErrorDomain" code:7 userInfo:0];
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

+ (BOOL)isTemporaryStore:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"tmp_en_advertisements_"]) {
    char v4 = [v3 hasSuffix:@".db"];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)isCentralStore:(id)a3
{
  return [a3 isEqualToString:@"en_advertisements.db"];
}

+ (BOOL)isStore:(id)a3
{
  id v4 = a3;
  if ([a1 isCentralStore:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [a1 isTemporaryStore:v4];
  }

  return v5;
}

+ (id)temporaryStorePathsInFolderPath:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [MEMORY[0x1E4F28CC0] defaultManager];
  id v22 = 0;
  id v6 = [v5 contentsOfDirectoryAtPath:v4 error:&v22];
  id v7 = v22;

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          if ([a1 isTemporaryStore:v15])
          {
            v16 = [v4 stringByAppendingPathComponent:v15];
            [v8 addObject:v16];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v12);
    }
    goto LABEL_17;
  }
  if (gLogCategory__ENAdvertisementSQLiteStore <= 90
    && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    id v10 = [v7 localizedDescription];
    [v10 UTF8String];
    LogPrintF_safe();
LABEL_17:
  }

  return v8;
}

+ (BOOL)temporaryStoresPresentInFolderPath:(id)a3
{
  id v3 = [a1 temporaryStorePathsInFolderPath:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

+ (id)temporaryStoresInFolderPath:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [a1 temporaryStorePathsInFolderPath:v4];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (gLogCategory_ENAdvertisementSQLiteStore <= 40
          && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
          [v11 UTF8String];
          LogPrintF_safe();
        }
        uint64_t v12 = [[ENAdvertisementSQLiteStore alloc] initWithPath:v11];
        if (v12) {
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (void)enumerateTemporaryStoresInFolderPath:(id)a3 handler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, ENAdvertisementSQLiteStore *, unsigned char *))a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [a1 temporaryStorePathsInFolderPath:a3];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (gLogCategory_ENAdvertisementSQLiteStore <= 40
          && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
          [v12 UTF8String];
          LogPrintF_safe();
        }
        uint64_t v13 = [[ENAdvertisementSQLiteStore alloc] initWithPath:v12];
        if (v13)
        {
          char v14 = 0;
          v6[2](v6, v13, &v14);
          if (v14)
          {

            goto LABEL_19;
          }
        }
        else if (gLogCategory_ENAdvertisementSQLiteStore <= 90 {
               && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        }
        {
          [v12 UTF8String];
          LogPrintF_safe();
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
LABEL_19:
}

+ (id)storePathsInFolderPath:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28CC0] defaultManager];
  id v22 = 0;
  id v6 = [v5 contentsOfDirectoryAtPath:v4 error:&v22];
  id v7 = v22;

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          if ([a1 isStore:v15])
          {
            long long v16 = [v4 stringByAppendingPathComponent:v15];
            [v8 addObject:v16];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v12);
    }
    goto LABEL_17;
  }
  if (gLogCategory__ENAdvertisementSQLiteStore <= 90
    && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    id v10 = [v7 localizedDescription];
    [v10 UTF8String];
    LogPrintF_safe();
LABEL_17:
  }

  return v8;
}

+ (BOOL)storesPresentInFolderPath:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28CC0] defaultManager];
  int v6 = [v5 fileExistsAtPath:v4];

  if (v6)
  {
    id v7 = [a1 storePathsInFolderPath:v4];
    BOOL v8 = [v7 count] != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (ENAdvertisementSQLiteStore)initWithPath:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ENAdvertisementSQLiteStore;
  BOOL v8 = [(ENAdvertisementSQLiteStore *)&v12 init];
  BOOL v9 = v8;
  if (v8
    && (objc_storeStrong((id *)&v8->_databasePath, a3),
        ![(ENAdvertisementSQLiteStore *)v9 connectToDatabaseAndReturnError:a4]))
  {
    id v10 = 0;
  }
  else
  {
    id v10 = v9;
  }

  return v10;
}

- (ENAdvertisementSQLiteStore)initWithPath:(id)a3
{
  return [(ENAdvertisementSQLiteStore *)self initWithPath:a3 error:0];
}

- (void)dealloc
{
  if (self->_database) {
    [(ENAdvertisementSQLiteStore *)self disconnectFromDatabase];
  }
  v3.receiver = self;
  v3.super_class = (Class)ENAdvertisementSQLiteStore;
  [(ENAdvertisementSQLiteStore *)&v3 dealloc];
}

- (BOOL)importContentsOfStore:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (gLogCategory_ENAdvertisementSQLiteStore <= 50
    && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    id v7 = [(NSString *)self->_databasePath UTF8String];
    id v8 = [v6 databasePath];
    long long v21 = v7;
    uint64_t v22 = [v8 UTF8String];
    LogPrintF_safe();
  }
  BOOL v9 = objc_msgSend(v6, "storedAdvertisementCount", v21, v22);
  id v10 = v9;
  if (v9 && [v9 unsignedIntValue] <= 0x4CB) {
    size_t v11 = [v10 unsignedIntValue];
  }
  else {
    size_t v11 = 1228;
  }
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  objc_super v12 = malloc_type_calloc(v11, 0x28uLL, 0x10000400A747E1EuLL);
  uint64_t v13 = v12;
  if (v12)
  {
    if (*((unsigned char *)v25 + 24))
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __58__ENAdvertisementSQLiteStore_importContentsOfStore_error___block_invoke;
      v23[3] = &unk_1E69AE600;
      v23[4] = self;
      v23[5] = &v28;
      v23[8] = v12;
      v23[9] = a4;
      v23[6] = &v24;
      v23[7] = v11;
      int v14 = [v6 enumerateAdvertisments:v23];
      if (*((unsigned char *)v25 + 24)) {
        BOOL v15 = v14 == 0;
      }
      else {
        BOOL v15 = 0;
      }
      char v16 = v15;
      *((unsigned char *)v25 + 24) = v16;
      if (v15)
      {
        size_t v17 = v29[3] % v11;
        if (v17)
        {
          BOOL v18 = [(ENAdvertisementSQLiteStore *)self saveContactTracingAdvertisementBuffer:v13 count:v17 error:a4];
          *((unsigned char *)v25 + 24) = v18;
        }
      }
    }
  }
  else
  {
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    *((unsigned char *)v25 + 24) = 0;
  }
  free(v13);
  char v19 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v19;
}

uint64_t __58__ENAdvertisementSQLiteStore_importContentsOfStore_error___block_invoke(uint64_t a1, long long *a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) % *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64) + 40 * v2;
  long long v4 = *a2;
  long long v5 = a2[1];
  *(void *)(v3 + 32) = *((void *)a2 + 4);
  *(_OWORD *)uint64_t v3 = v4;
  *(_OWORD *)(v3 + 16) = v5;
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v2 != *(void *)(a1 + 56) - 1
    || (objc_msgSend(*(id *)(a1 + 32), "saveContactTracingAdvertisementBuffer:count:error:", *(void *)(a1 + 64)) & 1) != 0)
  {
    return 1;
  }
  uint64_t result = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  return result;
}

+ (id)statementStringForStatementType:(unint64_t)a3
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return off_1E69AE668[a3];
  }
}

- (BOOL)connectToDatabaseAndReturnError:(id *)a3
{
  long long v5 = [(NSString *)self->_databasePath UTF8String];
  if (gLogCategory_ENAdvertisementSQLiteStore <= 50)
  {
    id v6 = v5;
    if (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize())
    {
      char v16 = v6;
      LogPrintF_safe();
    }
  }
  uint64_t v7 = [(ENAdvertisementSQLiteStore *)self openDatabase];
  if (v7)
  {
    uint64_t v8 = v7;
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90)
    {
      if (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()) {
LABEL_34:
      }
        LogPrintF_safe();
LABEL_35:
      if (gLogCategory__ENAdvertisementSQLiteStore <= 90
        && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
      {
        uint64_t v17 = v8;
        LogPrintF_safe();
      }
    }
  }
  else
  {
    uint64_t v9 = [(ENAdvertisementSQLiteStore *)self configureDatabase];
    if (v9)
    {
      uint64_t v8 = v9;
      if (gLogCategory__ENAdvertisementSQLiteStore <= 90)
      {
        if (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()) {
          goto LABEL_34;
        }
        goto LABEL_35;
      }
    }
    else
    {
      uint64_t v10 = [(ENAdvertisementSQLiteStore *)self migrateDatabase];
      if (v10)
      {
        uint64_t v8 = v10;
        if (gLogCategory__ENAdvertisementSQLiteStore <= 90)
        {
          if (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()) {
            goto LABEL_34;
          }
          goto LABEL_35;
        }
      }
      else
      {
        uint64_t v11 = [(ENAdvertisementSQLiteStore *)self initializeAdvertisementTable];
        if (v11)
        {
          uint64_t v8 = v11;
          if (gLogCategory__ENAdvertisementSQLiteStore <= 90)
          {
            if (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()) {
              goto LABEL_34;
            }
            goto LABEL_35;
          }
        }
        else
        {
          uint64_t v12 = [(ENAdvertisementSQLiteStore *)self initializeRPIBufferModule];
          if (v12)
          {
            uint64_t v8 = v12;
            if (gLogCategory__ENAdvertisementSQLiteStore <= 90)
            {
              if (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()) {
                goto LABEL_34;
              }
              goto LABEL_35;
            }
          }
          else
          {
            uint64_t v13 = [(ENAdvertisementSQLiteStore *)self initializePreparedStatements];
            if (!v13)
            {
              uint64_t v18 = 0;
              if ([(ENAdvertisementSQLiteStore *)self refreshStoredAdvertismentCountWithError:&v18])
              {
                return 1;
              }
              if (gLogCategory__ENAdvertisementSQLiteStore <= 90
                && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
              }
              uint64_t v8 = 1;
              goto LABEL_35;
            }
            uint64_t v8 = v13;
            if (gLogCategory__ENAdvertisementSQLiteStore <= 90)
            {
              if (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()) {
                goto LABEL_34;
              }
              goto LABEL_35;
            }
          }
        }
      }
    }
  }
  if (v8 == 26 || v8 == 11)
  {
    if (gLogCategory_ENAdvertisementSQLiteStore <= 50
      && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    if (!-[ENAdvertisementSQLiteStore purgeAndRemoveFromDisk:](self, "purgeAndRemoveFromDisk:", 0, v17)
      && gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    [(ENAdvertisementSQLiteStore *)self closeDatabase];
  }
  if (!a3) {
    return 0;
  }
  id v14 = [(id)objc_opt_class() errorForSQLiteResult:v8];
  BOOL result = 0;
  *a3 = v14;
  return result;
}

- (void)disconnectFromDatabase
{
  [(ENAdvertisementSQLiteStore *)self enumeratePreparedStatements:&__block_literal_global_8];
  free(self->_preparedStatements);
  self->_preparedStatements = 0;

  [(ENAdvertisementSQLiteStore *)self closeDatabase];
}

uint64_t __52__ENAdvertisementSQLiteStore_disconnectFromDatabase__block_invoke(int a1, sqlite3_stmt *pStmt)
{
  return sqlite3_finalize(pStmt);
}

- (int)openDatabase
{
  uint64_t v3 = [(NSString *)self->_databasePath UTF8String];

  return sqlite3_open_v2(v3, &self->_database, 2097158, 0);
}

- (int)closeDatabase
{
  database = self->_database;
  if (database)
  {
    int v4 = sqlite3_close(database);
    if (v4)
    {
      if (gLogCategory_ENAdvertisementSQLiteStore <= 90
        && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
      {
        [(NSString *)self->_databasePath UTF8String];
        LogPrintF_safe();
      }
    }
    else
    {
      self->_database = 0;
    }
  }
  else
  {
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    return 1;
  }
  return v4;
}

- (int)configureDatabase
{
  [(NSString *)self->_databasePath UTF8String];
  if (gLogCategory_ENAdvertisementSQLiteStore <= 50
    && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  if (sqlite3_busy_timeout(self->_database, 600000)
    && gLogCategory__ENAdvertisementSQLiteStore <= 90
    && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  int v3 = sqlite3_exec(self->_database, "pragma auto_vacuum = 1;", 0, 0, 0);
  if (v3)
  {
    int v4 = v3;
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
LABEL_17:
      LogPrintF_safe();
    }
  }
  else
  {
    int v4 = sqlite3_exec(self->_database, "pragma journal_mode=WAL;", 0, 0, 0);
    if (v4
      && gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_17;
    }
  }
  return v4;
}

- (int)migrateDatabase
{
  ppStmt = 0;
  uint64_t v3 = sqlite3_prepare(self->_database, "pragma user_version;", -1, &ppStmt, 0);
  if (v3)
  {
    uint64_t v4 = v3;
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      uint64_t v9 = (uint64_t)sqlite3_errmsg(self->_database);
      uint64_t v10 = sqlite3_extended_errcode(self->_database);
      uint64_t v8 = v4;
      LogPrintF_safe();
    }
    if (v4 == 100) {
      goto LABEL_11;
    }
LABEL_19:
    sqlite3_finalize(ppStmt);
    return v4;
  }
  int v5 = sqlite3_step(ppStmt);
  if (v5 != 100)
  {
    LODWORD(v4) = v5;
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      sqlite3_errmsg(self->_database);
      sqlite3_extended_errcode(self->_database);
      LogPrintF_safe();
    }
    goto LABEL_19;
  }
LABEL_11:
  uint64_t v6 = sqlite3_column_int(ppStmt, 0);
  sqlite3_finalize(ppStmt);
  LODWORD(v4) = 0;
  if (v6 != 2)
  {
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      uint64_t v8 = v6;
      uint64_t v9 = 2;
      LogPrintF_safe();
    }
    LODWORD(v4) = -[ENAdvertisementSQLiteStore migrateFromVersion:](self, "migrateFromVersion:", v6, v8, v9, v10);
  }
  return v4;
}

- (BOOL)transactionNeededForMigrationFromVersion:(int)a3
{
  return a3 == 1;
}

- (int)migrateFromVersion:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (-[ENAdvertisementSQLiteStore transactionNeededForMigrationFromVersion:](self, "transactionNeededForMigrationFromVersion:"))
  {
    LODWORD(v5) = [(ENAdvertisementSQLiteStore *)self beginDatabaseTransaction];
    if (v5) {
      goto LABEL_31;
    }
  }
  if (v3 && (int)v3 <= 2)
  {
    if (v3 == 1)
    {
      uint64_t v6 = sqlite3_exec(self->_database, "ALTER TABLE en_advertisements ADD COLUMN max_rssi INTEGER;", 0, 0, 0);
      if (v6)
      {
        uint64_t v5 = v6;
        if (gLogCategory__ENAdvertisementSQLiteStore <= 90
          && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
LABEL_24:
          uint64_t v11 = sqlite3_errmsg(self->_database);
          uint64_t v12 = sqlite3_extended_errcode(self->_database);
          uint64_t v10 = v5;
LABEL_25:
          LogPrintF_safe();
        }
LABEL_31:
        if (-[ENAdvertisementSQLiteStore transactionNeededForMigrationFromVersion:](self, "transactionNeededForMigrationFromVersion:", v3, v10, v11, v12)&& [(ENAdvertisementSQLiteStore *)self rollbackDatabaseTransaction]&& gLogCategory__ENAdvertisementSQLiteStore <= 90&& (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
          sqlite3_errmsg(self->_database);
          sqlite3_extended_errcode(self->_database);
          LogPrintF_safe();
        }
        return v5;
      }
      uint64_t v9 = sqlite3_exec(self->_database, "UPDATE en_advertisements SET max_rssi = rssi;", 0, 0, 0);
      if (v9)
      {
        uint64_t v5 = v9;
        if (gLogCategory__ENAdvertisementSQLiteStore <= 90
          && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_24;
        }
        goto LABEL_31;
      }
    }
  }
  else if (![(ENAdvertisementSQLiteStore *)self purgeAndRemoveFromDisk:0])
  {
    LODWORD(v5) = 1;
    goto LABEL_31;
  }
  int v7 = [(ENAdvertisementSQLiteStore *)self setVersionCurrent];
  if (v7)
  {
    LODWORD(v5) = v7;
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_25;
    }
    goto LABEL_31;
  }
  if (![(ENAdvertisementSQLiteStore *)self transactionNeededForMigrationFromVersion:v3])
  {
    LODWORD(v5) = 0;
    return v5;
  }

  return [(ENAdvertisementSQLiteStore *)self endDatabaseTransaction];
}

- (int)setVersionCurrent
{
  objc_msgSend(MEMORY[0x1E4F29020], "stringWithFormat:", @"pragma user_version=%d;", 2);
  id v3 = objc_claimAutoreleasedReturnValue();
  uint64_t v4 = (const char *)[v3 UTF8String];

  database = self->_database;

  return sqlite3_exec(database, v4, 0, 0, 0);
}

- (int)initializeAdvertisementTable
{
  int v3 = sqlite3_exec(self->_database, (const char *)objc_msgSend(@"CREATE TABLE IF NOT EXISTS en_advertisements(rpi BLOB, encrypted_aem BLOB, timestamp INTEGER, scan_interval INTEGER, rssi INTEGER, max_rssi INTEGER, saturated BOOLEAN, counter INTEGER, PRIMARY KEY(rpi, timestamp)) WITHOUT ROWID;",
                         "UTF8String"),
         0,
         0,
         0);
  if (v3)
  {
    int v4 = v3;
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
LABEL_8:
      sqlite3_errmsg(self->_database);
      sqlite3_extended_errcode(self->_database);
      LogPrintF_safe();
    }
  }
  else
  {
    int v4 = sqlite3_exec(self->_database, (const char *)objc_msgSend(@"CREATE INDEX IF NOT EXISTS timestamp ON en_advertisements(timestamp);",
                           "UTF8String"),
           0,
           0,
           0);
    if (v4
      && gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_8;
    }
  }
  return v4;
}

- (int)initializeRPIBufferModule
{
  int v3 = ct_sqlite_rpi_buffer_init(self->_database);
  if (v3
    && gLogCategory__ENAdvertisementSQLiteStore <= 90
    && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    sqlite3_errmsg(self->_database);
    sqlite3_extended_errcode(self->_database);
    LogPrintF_safe();
  }
  return v3;
}

- (int)initializePreparedStatements
{
  int v3 = (sqlite3_stmt **)malloc_type_malloc(0x28uLL, 0x2004093837F09uLL);
  self->_preparedStatements = v3;
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    while (1)
    {
      id v6 = [(id)objc_opt_class() statementStringForStatementType:v5];
      int v7 = (const char *)[v6 UTF8String];

      int v8 = sqlite3_prepare(self->_database, v7, -1, &self->_preparedStatements[v4], 0);
      if (v8) {
        break;
      }
      ++v5;
      ++v4;
      if (v5 == 5) {
        return 0;
      }
    }
    int v9 = v8;
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      sqlite3_errmsg(self->_database);
      sqlite3_extended_errcode(self->_database);
      LogPrintF_safe();
    }
    free(self->_preparedStatements);
    self->_preparedStatements = 0;
  }
  else
  {
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    return 7;
  }
  return v9;
}

- (void)enumeratePreparedStatements:(id)a3
{
  if (self->_preparedStatements)
  {
    for (uint64_t i = 0; i != 5; ++i)
      (*((void (**)(id, sqlite3_stmt *, uint64_t))a3 + 2))(a3, self->_preparedStatements[i], i);
  }
}

+ (id)errorForSQLiteResult:(int)a3
{
  uint64_t v5 = 0;
  if (a3 > 22)
  {
    if (a3 == 23)
    {
      uint64_t v6 = 6;
    }
    else
    {
      if (a3 != 26) {
        goto LABEL_13;
      }
LABEL_6:
      uint64_t v6 = 3;
    }
  }
  else
  {
    switch(a3)
    {
      case 5:
        uint64_t v6 = 5;
        break;
      case 6:
      case 7:
      case 8:
      case 9:
      case 12:
        goto LABEL_13;
      case 10:
        uint64_t v6 = 4;
        break;
      case 11:
        goto LABEL_6;
      case 13:
        uint64_t v6 = 2;
        break;
      default:
        if (a3 != 1) {
          goto LABEL_13;
        }
        uint64_t v6 = 1;
        break;
    }
  }
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C50], "errorWithDomain:code:userInfo:", @"ENAdvertisementStoreErrorDomain", v6, 0, v3);
LABEL_13:
  return v5;
}

- (int)beginDatabaseTransaction
{
  int v3 = sqlite3_exec(self->_database, "BEGIN EXCLUSIVE TRANSACTION;", 0, 0, 0);
  if (v3
    && gLogCategory__ENAdvertisementSQLiteStore <= 90
    && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    sqlite3_errmsg(self->_database);
    sqlite3_extended_errcode(self->_database);
    LogPrintF_safe();
  }
  return v3;
}

- (int)endDatabaseTransaction
{
  int v3 = sqlite3_exec(self->_database, "COMMIT;", 0, 0, 0);
  if (v3
    && gLogCategory__ENAdvertisementSQLiteStore <= 90
    && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    sqlite3_errmsg(self->_database);
    sqlite3_extended_errcode(self->_database);
    LogPrintF_safe();
  }
  return v3;
}

- (int)rollbackDatabaseTransaction
{
  int v3 = sqlite3_exec(self->_database, "ROLLBACK;", 0, 0, 0);
  if (v3
    && gLogCategory__ENAdvertisementSQLiteStore <= 90
    && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    sqlite3_errmsg(self->_database);
    sqlite3_extended_errcode(self->_database);
    LogPrintF_safe();
  }
  return v3;
}

- (int)checkpointWAL
{
  int v3 = sqlite3_exec(self->_database, "pragma wal_checkpoint(TRUNCATE);", 0, 0, 0);
  if (v3
    && gLogCategory__ENAdvertisementSQLiteStore <= 90
    && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    sqlite3_errmsg(self->_database);
    sqlite3_extended_errcode(self->_database);
    LogPrintF_safe();
  }
  return v3;
}

- (sqlite3_stmt)preparedStatementOfType:(unint64_t)a3
{
  int v3 = self->_preparedStatements[a3];
  sqlite3_reset(v3);
  return v3;
}

+ ($8B507D830E6EE36862B76123793C2CB9)advertisementForSQLiteStatement:(SEL)a3
{
  *(void *)&retstr->var3 = 0;
  retstr->var0 = 0u;
  *(_OWORD *)retstr->var1.var0 = 0u;
  *(double *)(&retstr->var1 + 1) = (double)sqlite3_column_int64(a4, 2);
  HIDWORD(retstr->var2) = sqlite3_column_int64(a4, 8);
  LOWORD(retstr->var3) = sqlite3_column_int64(a4, 9);
  HIWORD(retstr->var3) = sqlite3_column_int(a4, 3);
  LOBYTE(retstr->var4) = sqlite3_column_int(a4, 4);
  HIBYTE(retstr->var4) = sqlite3_column_int(a4, 5);
  LOBYTE(retstr->var5) = sqlite3_column_int(a4, 6) != 0;
  HIBYTE(retstr->var5) = sqlite3_column_int(a4, 7);
  retstr->var0 = *($0DD201535F598B6025D84F9AACEC468E *)sqlite3_column_blob(a4, 0);
  int v6 = sqlite3_column_bytes(a4, 1);
  BOOL result = ($8B507D830E6EE36862B76123793C2CB9 *)sqlite3_column_blob(a4, 1);
  if (v6 == 4)
  {
    retstr->var1 = *($A0BF7C2F34202597F9F30F6CD4123348 *)result->var0.var0;
  }
  else if (gLogCategory__ENAdvertisementSQLiteStore <= 90)
  {
    if (gLogCategory__ENAdvertisementSQLiteStore != -1) {
      return ($8B507D830E6EE36862B76123793C2CB9 *)LogPrintF_safe();
    }
    BOOL result = ($8B507D830E6EE36862B76123793C2CB9 *)_LogCategory_Initialize();
    if (result) {
      return ($8B507D830E6EE36862B76123793C2CB9 *)LogPrintF_safe();
    }
  }
  return result;
}

- (int)bindAdvertisement:(id *)a3 toSQLiteStatement:(sqlite3_stmt *)a4
{
  int v7 = sqlite3_bind_blob(a4, 1, a3, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (v7)
  {
    int v8 = v7;
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
LABEL_42:
      sqlite3_errmsg(self->_database);
      sqlite3_extended_errcode(self->_database);
      LogPrintF_safe();
    }
  }
  else
  {
    int v9 = sqlite3_bind_blob(a4, 2, &a3->var1, 4, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if (v9)
    {
      int v8 = v9;
      if (gLogCategory__ENAdvertisementSQLiteStore <= 90
        && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_42;
      }
    }
    else
    {
      int v10 = sqlite3_bind_int64(a4, 3, (uint64_t)*(double *)(&a3->var1 + 1));
      if (v10)
      {
        int v8 = v10;
        if (gLogCategory__ENAdvertisementSQLiteStore <= 90
          && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_42;
        }
      }
      else
      {
        int v11 = sqlite3_bind_int(a4, 4, HIWORD(a3->var3));
        if (v11)
        {
          int v8 = v11;
          if (gLogCategory__ENAdvertisementSQLiteStore <= 90
            && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
          {
            goto LABEL_42;
          }
        }
        else
        {
          int v12 = sqlite3_bind_int(a4, 5, SLOBYTE(a3->var4));
          if (v12)
          {
            int v8 = v12;
            if (gLogCategory__ENAdvertisementSQLiteStore <= 90
              && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
            {
              goto LABEL_42;
            }
          }
          else
          {
            int v13 = sqlite3_bind_int(a4, 6, SHIBYTE(a3->var4));
            if (v13)
            {
              int v8 = v13;
              if (gLogCategory__ENAdvertisementSQLiteStore <= 90
                && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
              {
                goto LABEL_42;
              }
            }
            else
            {
              int v14 = sqlite3_bind_int(a4, 7, LOBYTE(a3->var5));
              if (v14)
              {
                int v8 = v14;
                if (gLogCategory__ENAdvertisementSQLiteStore <= 90
                  && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
                {
                  goto LABEL_42;
                }
              }
              else
              {
                int v8 = sqlite3_bind_int(a4, 8, HIBYTE(a3->var5));
                if (v8
                  && gLogCategory__ENAdvertisementSQLiteStore <= 90
                  && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
                {
                  goto LABEL_42;
                }
              }
            }
          }
        }
      }
    }
  }
  return v8;
}

- (BOOL)refreshStoredAdvertismentCountWithError:(id *)a3
{
  uint64_t v5 = [(ENAdvertisementSQLiteStore *)self preparedStatementOfType:1];
  uint64_t v6 = [(ENAdvertisementSQLiteStore *)self beginDatabaseTransaction];
  if (v6 == 100) {
    goto LABEL_4;
  }
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v8 = sqlite3_step(v5);
    if (v8 == 100)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x1E4F28EC8], "numberWithInt:", sqlite3_column_int(v5, 0));
      int v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      storedAdvertisementCount = self->_storedAdvertisementCount;
      self->_storedAdvertisementCount = v9;

      BOOL v11 = 1;
      goto LABEL_12;
    }
    uint64_t v7 = v8;
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      BOOL v15 = sqlite3_errmsg(self->_database);
      uint64_t v16 = sqlite3_extended_errcode(self->_database);
      uint64_t v14 = v7;
      LogPrintF_safe();
    }
  }
  int v12 = self->_storedAdvertisementCount;
  self->_storedAdvertisementCount = 0;

  if (a3)
  {
    [(id)objc_opt_class() errorForSQLiteResult:v7];
    BOOL v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v11 = 0;
  }
LABEL_12:
  [(ENAdvertisementSQLiteStore *)self endDatabaseTransaction];
  sqlite3_reset(v5);
  return v11;
}

- (BOOL)saveContactTracingAdvertisementBuffer:(id *)a3 count:(unint64_t)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v9 = [(ENAdvertisementSQLiteStore *)self preparedStatementOfType:0];
  uint64_t v10 = [(ENAdvertisementSQLiteStore *)self beginDatabaseTransaction];
  if (!v10)
  {
    if (!a4)
    {
      uint64_t v10 = 0;
      goto LABEL_12;
    }
    unint64_t v14 = a4;
    while (1)
    {
      long long v15 = *(_OWORD *)a3->var1.var0;
      v22[0] = a3->var0;
      v22[1] = v15;
      uint64_t v23 = *(void *)&a3->var3;
      uint64_t v16 = [(ENAdvertisementSQLiteStore *)self bindAdvertisement:v22 toSQLiteStatement:v9];
      if (v16)
      {
        uint64_t v10 = v16;
        if (gLogCategory__ENAdvertisementSQLiteStore <= 90
          && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_21;
        }
        goto LABEL_2;
      }
      uint64_t v17 = sqlite3_step(v9);
      if (v17 != 101) {
        break;
      }
      sqlite3_clear_bindings(v9);
      sqlite3_reset(v9);
      a3 = ($8B507D830E6EE36862B76123793C2CB9 *)((char *)a3 + 40);
      if (!--v14) {
        goto LABEL_3;
      }
    }
    uint64_t v10 = v17;
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
LABEL_21:
      long long v20 = sqlite3_errmsg(self->_database);
      uint64_t v21 = sqlite3_extended_errcode(self->_database);
      uint64_t v19 = v10;
      LogPrintF_safe();
    }
  }
LABEL_2:
  if (v10 == 101)
  {
LABEL_3:
    uint64_t v10 = [(ENAdvertisementSQLiteStore *)self endDatabaseTransaction];
    storedAdvertisementCount = self->_storedAdvertisementCount;
    if (storedAdvertisementCount)
    {
      objc_msgSend(MEMORY[0x1E4F28EC8], "numberWithUnsignedInteger:", a4 + -[NSNumber unsignedIntValue](storedAdvertisementCount, "unsignedIntValue"));
      int v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      int v13 = self->_storedAdvertisementCount;
      self->_storedAdvertisementCount = v12;
    }
    goto LABEL_23;
  }
LABEL_12:
  if ([(ENAdvertisementSQLiteStore *)self rollbackDatabaseTransaction]
    && gLogCategory__ENAdvertisementSQLiteStore <= 90
    && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    sqlite3_errmsg(self->_database);
    sqlite3_extended_errcode(self->_database);
    LogPrintF_safe();
  }
LABEL_23:
  if (a5 && v10)
  {
    *a5 = [(id)objc_opt_class() errorForSQLiteResult:v10];
  }
  sqlite3_reset(v9);
  return v10 == 0;
}

- (int)enumerateAdvertisments:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  uint64_t v5 = [(ENAdvertisementSQLiteStore *)self preparedStatementOfType:2];
  if (![(ENAdvertisementSQLiteStore *)self beginDatabaseTransaction])
  {
    while (1)
    {
      uint64_t v8 = sqlite3_step(v5);
      if (v8 != 100) {
        break;
      }
      uint64_t v19 = 0;
      long long v17 = 0u;
      long long v18 = 0u;
      int v9 = objc_opt_class();
      if (v9)
      {
        [v9 advertisementForSQLiteStatement:v5];
      }
      else
      {
        uint64_t v19 = 0;
        long long v17 = 0u;
        long long v18 = 0u;
      }
      uint64_t v10 = (uint64_t (*)(void *, _OWORD *))v4[2];
      v15[0] = v17;
      v15[1] = v18;
      uint64_t v16 = v19;
      if ((v10(v4, v15) & 1) == 0) {
        goto LABEL_2;
      }
    }
    uint64_t v11 = v8;
    if (v8 != 101
      && gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      int v13 = sqlite3_errmsg(self->_database);
      uint64_t v14 = sqlite3_extended_errcode(self->_database);
      uint64_t v12 = v11;
      LogPrintF_safe();
    }
  }
LABEL_2:
  int v6 = [(ENAdvertisementSQLiteStore *)self endDatabaseTransaction];
  sqlite3_reset(v5);

  return v6;
}

- (id)queryFilterWithBufferSize:(unint64_t)a3 hashCount:(unint64_t)a4 attenuationThreshold:(unsigned __int8)a5
{
  int v6 = [[ENQueryFilter alloc] initWithBufferSize:a3 hashCount:a4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__ENAdvertisementSQLiteStore_queryFilterWithBufferSize_hashCount_attenuationThreshold___block_invoke;
  v9[3] = &unk_1E69AE648;
  uint64_t v7 = v6;
  uint64_t v10 = v7;
  if ([(ENAdvertisementSQLiteStore *)self enumerateAdvertisments:v9])
  {
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      sqlite3_errmsg(self->_database);
      sqlite3_extended_errcode(self->_database);
      LogPrintF_safe();
    }

    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __87__ENAdvertisementSQLiteStore_queryFilterWithBufferSize_hashCount_attenuationThreshold___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (id)beaconCountMetricsWithStartDate:(id)a3 endDate:(id)a4 windowDuration:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [[ENBeaconCountMetrics alloc] initWithStartDate:v9 endDate:v8 windowDuration:a5];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__ENAdvertisementSQLiteStore_beaconCountMetricsWithStartDate_endDate_windowDuration___block_invoke;
  v13[3] = &unk_1E69AE648;
  uint64_t v11 = v10;
  uint64_t v14 = v11;
  if ([(ENAdvertisementSQLiteStore *)self enumerateAdvertisments:v13])
  {
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      sqlite3_errmsg(self->_database);
      sqlite3_extended_errcode(self->_database);
      LogPrintF_safe();
    }

    uint64_t v11 = 0;
  }

  return v11;
}

uint64_t __85__ENAdvertisementSQLiteStore_beaconCountMetricsWithStartDate_endDate_windowDuration___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [ENAdvertisement alloc];
  long long v5 = *(_OWORD *)(a2 + 16);
  v8[0] = *(_OWORD *)a2;
  v8[1] = v5;
  uint64_t v9 = *(void *)(a2 + 32);
  int v6 = [(ENAdvertisement *)v4 initWithStructRepresentation:v8];
  [*(id *)(a1 + 32) addAdvertisement:v6];

  return 1;
}

- (int)bindRPIBuffer:(const void *)a3 count:(unint64_t)a4 validityBuffer:(const void *)a5 validRPICount:(unint64_t)a6 toSQLiteStatement:(sqlite3_stmt *)a7
{
  int v8 = a6;
  int v10 = a4;
  int v12 = sqlite3_bind_pointer(a7, 1, (void *)a3, "ct_sqlite_rpi_buffer", 0);
  if (v12)
  {
    int v13 = v12;
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
LABEL_18:
      sqlite3_errmsg(self->_database);
      sqlite3_extended_errcode(self->_database);
      LogPrintF_safe();
    }
  }
  else
  {
    int v14 = sqlite3_bind_pointer(a7, 2, (void *)a5, "ct_sqlite_rpi_validity_buffer", 0);
    if (v14)
    {
      int v13 = v14;
      if (gLogCategory__ENAdvertisementSQLiteStore <= 90
        && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_18;
      }
    }
    else
    {
      int v15 = sqlite3_bind_int(a7, 3, v10);
      if (v15)
      {
        int v13 = v15;
        if (gLogCategory__ENAdvertisementSQLiteStore <= 90
          && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_18;
        }
      }
      else
      {
        int v13 = sqlite3_bind_int(a7, 4, v8);
        if (v13
          && gLogCategory__ENAdvertisementSQLiteStore <= 90
          && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_18;
        }
      }
    }
  }
  return v13;
}

- (unint64_t)getAdvertisementsMatchingRPIBuffer:(const void *)a3 count:(unint64_t)a4 validityBuffer:(const void *)a5 validRPICount:(unint64_t)a6 matchingAdvertisementBuffer:(id *)a7 error:(id *)a8
{
  int v15 = [(ENAdvertisementSQLiteStore *)self storedAdvertisementCount];
  if (v15)
  {
  }
  else if (![(ENAdvertisementSQLiteStore *)self refreshStoredAdvertismentCountWithError:a8])
  {
    if (gLogCategory__ENAdvertisementSQLiteStore > 90
      || gLogCategory__ENAdvertisementSQLiteStore == -1 && !_LogCategory_Initialize())
    {
      return 0;
    }
    goto LABEL_28;
  }
  uint64_t v16 = [(ENAdvertisementSQLiteStore *)self storedAdvertisementCount];
  size_t v17 = [v16 unsignedIntValue];

  long long v18 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_calloc(v17, 0x28uLL, 0x10000400A747E1EuLL);
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = [(ENAdvertisementSQLiteStore *)self preparedStatementOfType:3];
    uint64_t v21 = (const char *)[(ENAdvertisementSQLiteStore *)self bindRPIBuffer:a3 count:a4 validityBuffer:a5 validRPICount:a6 toSQLiteStatement:v20];
    if (v21)
    {
      uint64_t v22 = v21;
      if (gLogCategory__ENAdvertisementSQLiteStore <= 90
        && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
      {
        uint64_t v31 = sqlite3_errmsg(self->_database);
        v32 = (const char *)sqlite3_extended_errcode(self->_database);
        LogPrintF_safe();
      }
    }
    else
    {
      uint64_t v22 = (const char *)[(ENAdvertisementSQLiteStore *)self beginDatabaseTransaction];
      if (!v22)
      {
        unint64_t v23 = 0;
        while (1)
        {
          uint64_t v24 = (const char *)sqlite3_step(v20);
          if (v24 != 100) {
            break;
          }
          if (v23 < v17)
          {
            uint64_t v28 = objc_opt_class();
            if (v28)
            {
              [v28 advertisementForSQLiteStatement:v20];
            }
            else
            {
              uint64_t v36 = 0;
              long long v34 = 0u;
              long long v35 = 0u;
            }
            v29 = (char *)v19 + 40 * v23++;
            *((void *)v29 + 4) = v36;
            *(_OWORD *)v29 = v34;
            *((_OWORD *)v29 + 1) = v35;
          }
          else
          {
            v25 = +[ENLoggingPrefs sharedENLoggingPrefs];
            int v26 = [v25 isSensitiveLoggingAllowed];

            if (v26
              && gLogCategory_ENAdvertisementSQLiteStore <= 90
              && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
            {
              uint64_t v31 = (const char *)v17;
              LogPrintF_safe();
            }
            storedAdvertisementCount = self->_storedAdvertisementCount;
            self->_storedAdvertisementCount = 0;
          }
        }
        uint64_t v22 = v24;
        if (v24 == 101) {
          goto LABEL_36;
        }
        if (gLogCategory__ENAdvertisementSQLiteStore <= 90
          && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
          v32 = sqlite3_errmsg(self->_database);
          uint64_t v33 = sqlite3_extended_errcode(self->_database);
          uint64_t v31 = v22;
          LogPrintF_safe();
        }
        goto LABEL_42;
      }
    }
    if (v22 == 101)
    {
      unint64_t v23 = 0;
LABEL_36:
      *a7 = v19;
LABEL_45:
      [(ENAdvertisementSQLiteStore *)self endDatabaseTransaction];
      sqlite3_clear_bindings(v20);
      sqlite3_reset(v20);
      return v23;
    }
LABEL_42:
    free(v19);
    *a7 = 0;
    if (a8)
    {
      [(id)objc_opt_class() errorForSQLiteResult:v22];
      unint64_t v23 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unint64_t v23 = 0;
    }
    goto LABEL_45;
  }
  if (gLogCategory__ENAdvertisementSQLiteStore <= 90
    && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
LABEL_28:
    LogPrintF_safe();
  }
  return 0;
}

- (BOOL)purgeAdvertismentsRecordedPriorToDate:(id)a3 error:(id *)a4
{
  [a3 timeIntervalSince1970];
  double v7 = v6;
  if (gLogCategory_ENAdvertisementSQLiteStore <= 50
    && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    long long v18 = [(NSString *)self->_databasePath UTF8String];
    double v15 = v7;
    LogPrintF_safe();
  }
  int v8 = -[ENAdvertisementSQLiteStore preparedStatementOfType:](self, "preparedStatementOfType:", 4, *(void *)&v15, v18);
  uint64_t v9 = [(ENAdvertisementSQLiteStore *)self beginDatabaseTransaction];
  if (!v9)
  {
    uint64_t v10 = sqlite3_bind_double(v8, 1, v7);
    if (!v10)
    {
      uint64_t v11 = sqlite3_step(v8);
      if (v11 == 101) {
        goto LABEL_7;
      }
      uint64_t v9 = v11;
      if (gLogCategory__ENAdvertisementSQLiteStore <= 90
        && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
      {
        uint64_t v19 = sqlite3_errmsg(self->_database);
        uint64_t v21 = sqlite3_extended_errcode(self->_database);
        uint64_t v16 = v9;
        LogPrintF_safe();
      }
      goto LABEL_19;
    }
    uint64_t v9 = v10;
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      uint64_t v19 = sqlite3_errmsg(self->_database);
      uint64_t v21 = sqlite3_extended_errcode(self->_database);
      uint64_t v16 = v9;
      LogPrintF_safe();
    }
  }
  if (v9 == 101)
  {
LABEL_7:
    uint64_t v9 = [(ENAdvertisementSQLiteStore *)self endDatabaseTransaction];
    goto LABEL_24;
  }
LABEL_19:
  uint64_t v12 = [(ENAdvertisementSQLiteStore *)self rollbackDatabaseTransaction];
  if (v12)
  {
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90)
    {
      uint64_t v13 = v12;
      if (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize())
      {
        uint64_t v20 = sqlite3_errmsg(self->_database);
        uint64_t v22 = sqlite3_extended_errcode(self->_database);
        uint64_t v17 = v13;
        LogPrintF_safe();
      }
    }
  }
LABEL_24:
  if (v9)
  {
    if (a4)
    {
      *a4 = [(id)objc_opt_class() errorForSQLiteResult:v9];
    }
  }
  else
  {
    [(ENAdvertisementSQLiteStore *)self checkpointWAL];
  }
  if (!-[ENAdvertisementSQLiteStore refreshStoredAdvertismentCountWithError:](self, "refreshStoredAdvertismentCountWithError:", a4, v17, v20, v22)&& gLogCategory__ENAdvertisementSQLiteStore <= 90&& (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  sqlite3_reset(v8);
  return v9 == 0;
}

+ (BOOL)removeAllDatabaseFilesWithDatabasePath:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28CC0] defaultManager];
  id v39 = 0;
  char v5 = [v4 removeItemAtPath:v3 error:&v39];
  id v6 = v39;
  if (v6) {
    char v7 = 0;
  }
  else {
    char v7 = v5;
  }
  char v31 = v7;
  if ((v7 & 1) == 0
    && gLogCategory_ENAdvertisementSQLiteStore <= 90
    && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    uint64_t v8 = [v3 UTF8String];
    [v6 localizedDescription];
    uint64_t v9 = v4;
    id v10 = objc_claimAutoreleasedReturnValue();
    uint64_t v26 = v8;
    uint64_t v28 = [v10 UTF8String];
    LogPrintF_safe();

    uint64_t v4 = v9;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  objc_msgSend(&unk_1F2B36090, "allKeys", v26, v28);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v3, "stringByAppendingString:", v15, v27, v29, v30);
        if ([v4 fileExistsAtPath:v16])
        {
          id v17 = v3;
          id v34 = v6;
          long long v18 = v4;
          int v19 = [v4 removeItemAtPath:v16 error:&v34];
          id v20 = v34;

          if (v19) {
            BOOL v21 = v20 == 0;
          }
          else {
            BOOL v21 = 0;
          }
          if (v21)
          {
            id v6 = 0;
          }
          else
          {
            if (gLogCategory_ENAdvertisementSQLiteStore <= 90
              && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
            {
              id v22 = [&unk_1F2B36090 objectForKey:v15];
              uint64_t v32 = [v22 UTF8String];
              uint64_t v23 = [v16 UTF8String];
              id v24 = [v20 localizedDescription];
              uint64_t v29 = v23;
              uint64_t v30 = [v24 UTF8String];
              uint64_t v27 = v32;
              LogPrintF_safe();
            }
            char v31 = 0;
            id v6 = v20;
          }
          id v3 = v17;
          uint64_t v4 = v18;
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v12);
  }

  return v31 & 1;
}

- (BOOL)purgeAndRemoveFromDisk:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_ENAdvertisementSQLiteStore <= 50
    && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    [(NSString *)self->_databasePath UTF8String];
    LogPrintF_safe();
  }
  if (self->_database && _sqlite3_db_truncate())
  {
    if (gLogCategory__ENAdvertisementSQLiteStore > 90)
    {
LABEL_10:
      LOBYTE(v5) = 0;
      goto LABEL_12;
    }
    if (gLogCategory__ENAdvertisementSQLiteStore != -1 || (int v5 = _LogCategory_Initialize()) != 0)
    {
      sqlite3_errmsg(self->_database);
      sqlite3_extended_errcode(self->_database);
      LogPrintF_safe();
      goto LABEL_10;
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }
LABEL_12:
  if (v3)
  {
    [(ENAdvertisementSQLiteStore *)self disconnectFromDatabase];
    id v6 = objc_opt_class();
    databasePath = self->_databasePath;
    LOBYTE(v5) = [v6 removeAllDatabaseFilesWithDatabasePath:databasePath];
  }
  return v5;
}

- (BOOL)cloneStoreTo:(id)a3
{
  id v4 = [a3 stringByAppendingPathComponent:@"en_advertisements.db"];
  [v4 UTF8String];
  int v5 = _sqlite3_db_copy();
  if (v5
    && gLogCategory__ENAdvertisementSQLiteStore <= 90
    && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    sqlite3_errmsg(self->_database);
    sqlite3_extended_errcode(self->_database);
    LogPrintF_safe();
  }

  return v5 == 0;
}

+ (BOOL)removeAllStoresFromDiskWithFolderPath:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 storePathsInFolderPath:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    char v8 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(a1, "removeAllDatabaseFilesWithDatabasePath:", v10, v12) & 1) == 0)
        {
          if (gLogCategory_ENAdvertisementSQLiteStore <= 90
            && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
          {
            uint64_t v12 = [v10 UTF8String];
            LogPrintF_safe();
          }
          char v8 = 0;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    char v8 = 1;
  }

  return v8 & 1;
}

+ (BOOL)removeAllTemporaryStoresFromDiskWithFolderPath:(id)a3 lastModifiedBeforeDate:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v27 = a4;
  uint64_t v6 = [a1 temporaryStorePathsInFolderPath:a3];
  uint64_t v7 = [MEMORY[0x1E4F28CC0] defaultManager];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v8)
  {
    char v12 = 1;
    goto LABEL_33;
  }
  uint64_t v9 = v8;
  id v10 = 0;
  uint64_t v11 = *(void *)v32;
  char v12 = 1;
  uint64_t v26 = *MEMORY[0x1E4F28308];
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v32 != v11) {
        objc_enumerationMutation(obj);
      }
      long long v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      id v30 = v10;
      long long v15 = objc_msgSend(v7, "attributesOfItemAtPath:error:", v14, &v30, v24, v25);
      id v16 = v30;

      if (v15) {
        BOOL v17 = v16 == 0;
      }
      else {
        BOOL v17 = 0;
      }
      if (!v17)
      {
        if (gLogCategory_ENAdvertisementSQLiteStore > 90
          || gLogCategory_ENAdvertisementSQLiteStore == -1 && !_LogCategory_Initialize())
        {
          char v12 = 0;
          goto LABEL_29;
        }
        uint64_t v18 = [v14 UTF8String];
        id v19 = [v16 localizedDescription];
        uint64_t v24 = v18;
        uint64_t v25 = [v19 UTF8String];
        LogPrintF_safe();
LABEL_27:
        char v12 = 0;
        goto LABEL_28;
      }
      id v19 = [v15 objectForKey:v26];
      if ([v19 compare:v27] == -1)
      {
        if (gLogCategory_ENAdvertisementSQLiteStore <= 40
          && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
          uint64_t v24 = [v14 UTF8String];
          LogPrintF_safe();
        }
        id v20 = objc_msgSend(MEMORY[0x1E4F28CC0], "defaultManager", v24);
        id v29 = 0;
        int v21 = [v20 removeItemAtPath:v14 error:&v29];
        id v16 = v29;

        if (v21 && !v16) {
          goto LABEL_28;
        }
        if (gLogCategory__ENAdvertisementSQLiteStore <= 90
          && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
          id v22 = [v16 localizedDescription];
          uint64_t v24 = [v22 UTF8String];
          LogPrintF_safe();
        }
        goto LABEL_27;
      }
      id v16 = 0;
LABEL_28:

LABEL_29:
      id v10 = v16;
    }
    uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  }
  while (v9);

LABEL_33:
  return v12 & 1;
}

- (NSNumber)storedAdvertisementCount
{
  return self->_storedAdvertisementCount;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (void)setDatabasePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databasePath, 0);

  objc_storeStrong((id *)&self->_storedAdvertisementCount, 0);
}

@end