@interface HDDatabaseJournalDatabase
+ (uint64_t)_getIDForString:(void *)a3 database:(uint64_t)a4 error:;
+ (uint64_t)_openDatabase:(uint64_t)a3 error:;
- (BOOL)appendData:(id)a3 entryClass:(Class)a4 error:(id *)a5;
- (BOOL)createAndOpenForWritingWithError:(id *)a3;
- (BOOL)flushDataToDisk:(id *)a3;
- (BOOL)isOpen;
- (BOOL)openForReadingWithError:(id *)a3;
- (BOOL)removeWithError:(id *)a3;
- (HDDatabaseJournalDatabase)init;
- (HDDatabaseJournalDatabase)initWithURL:(id)a3;
- (HDKeyValueDomain)unitTesting_keyValueDomainOverride;
- (HDSQLiteDatabase)unitTesting_underlyingDatabase;
- (NSString)description;
- (NSString)journalPath;
- (NSString)name;
- (double)modificationTime;
- (id)_getIdentifierAndCreationDate:(uint64_t)a3 error:;
- (id)getIdentifierAndCreationDate:(id *)a3 error:(id *)a4;
- (id)unitTesting_didCreateDatabaseConnectionHandler;
- (int64_t)size;
- (unsigned)enumerateEntriesWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5 handler:(id)a6;
- (unsigned)readVersionWithError:(id *)a3;
- (void)_clearCachedProperties;
- (void)_createDatabaseConnectionWithURL:(uint64_t)a1;
- (void)_faultCachedProperties;
- (void)close;
- (void)dealloc;
- (void)setUnitTesting_didCreateDatabaseConnectionHandler:(id)a3;
- (void)setUnitTesting_keyValueDomainOverride:(id)a3;
- (void)setUnitTesting_underlyingDatabase:(id)a3;
- (void)unitTesting_setEnumeratedBytesThreshold:(int64_t)a3;
@end

@implementation HDDatabaseJournalDatabase

- (HDDatabaseJournalDatabase)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDDatabaseJournalDatabase)initWithURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDDatabaseJournalDatabase;
  v5 = [(HDDatabaseJournalDatabase *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 URLByAppendingPathComponent:@"journaldb.sqlite"];
    databaseURL = v5->_databaseURL;
    v5->_databaseURL = (NSURL *)v6;

    size = v5->_size;
    v5->_size = 0;

    modificationDate = v5->_modificationDate;
    v5->_modificationDate = 0;

    v5->_enumeratedBytesThreshold = 0x40000;
  }

  return v5;
}

- (void)dealloc
{
  [(HDDatabaseJournalDatabase *)self close];
  v3.receiver = self;
  v3.super_class = (Class)HDDatabaseJournalDatabase;
  [(HDDatabaseJournalDatabase *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  id v4 = [(NSURL *)self->_databaseURL path];
  BOOL v5 = [(HDDatabaseJournalDatabase *)self isOpen];
  uint64_t v6 = @"closed";
  if (v5) {
    uint64_t v6 = @"open";
  }
  v7 = [v3 stringWithFormat:@"%@ (%@)", v4, v6];

  return (NSString *)v7;
}

- (id)getIdentifierAndCreationDate:(id *)a3 error:(id *)a4
{
  if (![(HDDatabaseJournalDatabase *)self isOpen]) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Cannot get identifier for %@", self);
  }

  return -[HDDatabaseJournalDatabase _getIdentifierAndCreationDate:error:]((uint64_t)self, a3, (uint64_t)a4);
}

- (id)_getIdentifierAndCreationDate:(uint64_t)a3 error:
{
  if (a1)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__112;
    v18 = __Block_byref_object_dispose__112;
    id v19 = 0;
    uint64_t v10 = 0;
    objc_super v11 = (double *)&v10;
    uint64_t v12 = 0x2020000000;
    uint64_t v13 = 0;
    BOOL v5 = *(void **)(a1 + 16);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __65__HDDatabaseJournalDatabase__getIdentifierAndCreationDate_error___block_invoke_2;
    v9[3] = &unk_1E62F5978;
    v9[4] = &v14;
    v9[5] = &v10;
    if ([v5 executeSQL:@"SELECT value, modification_date FROM key_value_store WHERE key = ?", a3, &__block_literal_global_387, v9 error bindingHandler enumerationHandler])
    {
      uint64_t v6 = (void *)v15[5];
      if (v6)
      {
        if (a2)
        {
          *a2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v11[3]];
          uint64_t v6 = (void *)v15[5];
        }
        id v7 = v6;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 100, @"No database identifier has been set");
    }
    id v7 = 0;
LABEL_9:
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);

    goto LABEL_10;
  }
  id v7 = 0;
LABEL_10:

  return v7;
}

- (NSString)name
{
  v2 = [(NSURL *)self->_databaseURL URLByDeletingLastPathComponent];
  objc_super v3 = [v2 lastPathComponent];

  return (NSString *)v3;
}

- (NSString)journalPath
{
  v2 = [(NSURL *)self->_databaseURL URLByDeletingLastPathComponent];
  objc_super v3 = [v2 URLByDeletingLastPathComponent];
  id v4 = [v3 path];

  return (NSString *)v4;
}

- (BOOL)isOpen
{
  database = self->_database;
  if (database) {
    LOBYTE(database) = [(HDSQLiteDatabase *)database isOpen];
  }
  return (char)database;
}

- (int64_t)size
{
  size = self->_size;
  if (!size)
  {
    -[HDDatabaseJournalDatabase _faultCachedProperties]((uint64_t)self);
    size = self->_size;
  }

  return [(NSNumber *)size integerValue];
}

- (void)_faultCachedProperties
{
  v32[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = *MEMORY[0x1E4F1C5F8];
    uint64_t v3 = *MEMORY[0x1E4F1C530];
    v32[0] = *MEMORY[0x1E4F1C5F8];
    v32[1] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    uint64_t v24 = a1;
    v31[0] = *(id *)(a1 + 8);
    BOOL v5 = [v31[0] URLByDeletingPathExtension];
    uint64_t v6 = [v5 URLByAppendingPathExtension:@"sqlite-wal"];
    v31[1] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];

    v8 = [MEMORY[0x1E4F1C9C8] distantPast];
    [v8 timeIntervalSinceReferenceDate];
    double v10 = v9;

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v7;
    uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = 0;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = [*(id *)(*((void *)&v26 + 1) + 8 * i) resourceValuesForKeys:v4 error:0];
          v17 = [v16 objectForKeyedSubscript:v2];
          v18 = [v16 objectForKeyedSubscript:v3];
          if (v17) {
            v13 += [v17 integerValue];
          }
          if (v18)
          {
            [v18 timeIntervalSinceReferenceDate];
            if (v10 < v19) {
              double v10 = v19;
            }
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v12);
    }
    else
    {
      uint64_t v13 = 0;
    }

    uint64_t v20 = [NSNumber numberWithInteger:v13];
    v21 = *(void **)(v24 + 24);
    *(void *)(v24 + 24) = v20;

    uint64_t v22 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v10];
    v23 = *(void **)(v24 + 32);
    *(void *)(v24 + 32) = v22;
  }
}

- (double)modificationTime
{
  modificationDate = self->_modificationDate;
  if (!modificationDate)
  {
    -[HDDatabaseJournalDatabase _faultCachedProperties]((uint64_t)self);
    modificationDate = self->_modificationDate;
  }

  [(NSDate *)modificationDate timeIntervalSinceReferenceDate];
  return result;
}

- (BOOL)appendData:(id)a3 entryClass:(Class)a4 error:(id *)a5
{
  id v8 = a3;
  if ([(HDDatabaseJournalDatabase *)self isOpen])
  {
    -[HDDatabaseJournalDatabase _clearCachedProperties]((uint64_t)self);
    database = self->_database;
    id v10 = v8;
    uint64_t v11 = database;
    uint64_t v12 = self;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__HDDatabaseJournalDatabase__appendData_entryClass_database_error___block_invoke;
    v16[3] = &unk_1E63028B8;
    uint64_t v18 = v12;
    Class v19 = a4;
    id v17 = v10;
    id v13 = v10;
    char v14 = [(HDSQLiteDatabase *)v11 performTransactionWithType:1 error:a5 usingBlock:v16];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a5, 3, @"Cannot append data because journal database is not open");
    char v14 = 0;
  }

  return v14;
}

- (void)_clearCachedProperties
{
  if (a1)
  {
    [*(id *)(a1 + 8) removeAllCachedResourceValues];
    uint64_t v2 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    uint64_t v3 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;
  }
}

- (void)close
{
  database = self->_database;
  self->_database = 0;
  uint64_t v3 = database;

  [(HDSQLiteDatabase *)v3 close];
}

- (BOOL)createAndOpenForWritingWithError:(id *)a3
{
  if ([(HDDatabaseJournalDatabase *)self isOpen])
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = [(NSURL *)self->_databaseURL path];
    [v11 handleFailureInMethod:a2, self, @"HDDatabaseJournalDatabase.m", 141, @"Cannot create and open %@ because it is already open", v12 object file lineNumber description];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v7 = [(NSURL *)self->_databaseURL URLByDeletingLastPathComponent];
  int v8 = [v6 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:a3];

  if (!v8) {
    goto LABEL_7;
  }
  -[HDDatabaseJournalDatabase _createDatabaseConnectionWithURL:]((uint64_t)self, self->_databaseURL);
  if ((+[HDDatabaseJournalDatabase _openDatabase:error:]((uint64_t)HDDatabaseJournalDatabase, self->_database, (uint64_t)a3) & 1) == 0)
  {
    [(HDDatabaseJournalDatabase *)self close];
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_8;
  }
  -[HDDatabaseJournalDatabase _clearCachedProperties]((uint64_t)self);
  BOOL v9 = 1;
LABEL_8:

  return v9;
}

- (void)_createDatabaseConnectionWithURL:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = (objc_class *)MEMORY[0x1E4F65D18];
    id v4 = a2;
    uint64_t v5 = [[v3 alloc] initWithDatabaseURL:v4];

    id v6 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v5;

    [*(id *)(a1 + 16) setFileProtectionType:*MEMORY[0x1E4F28348]];
    id v7 = _Block_copy(*(const void **)(a1 + 64));
    if (v7)
    {
      id v8 = v7;
      (*((void (**)(void *, uint64_t))v7 + 2))(v7, a1);
      id v7 = v8;
    }
  }
}

+ (uint64_t)_openDatabase:(uint64_t)a3 error:
{
  id v4 = a2;
  self;
  if (![v4 openWithError:a3])
  {
    id v6 = v4;
    self;
    id v12 = 0;
    id v7 = v6;
    self;
    unint64_t v8 = [v7 userVersionWithDatabaseName:0 error:&v12];

    id v9 = v12;
    if (v8 == 1)
    {
LABEL_4:
      uint64_t v5 = 1;
LABEL_10:

      goto LABEL_11;
    }
    if ((v8 & 0x8000000000000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:underlyingError:", a3, 100, @"Unable to read schema version", v9);
    }
    else
    {
      if (v8 < 2)
      {
        id v11 = v7;
        self;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __60__HDDatabaseJournalDatabase__createSchemaForDatabase_error___block_invoke;
        v13[3] = &unk_1E6302890;
        id v14 = &unk_1F17EA218;
        uint64_t v5 = [v11 performTransactionWithType:1 error:a3 usingBlock:v13];

        if (!v5) {
          goto LABEL_10;
        }
        goto LABEL_4;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 116, @"Journal database schema version '%ld' greater than current '%ld'", v8, 1);
    }
    uint64_t v5 = 0;
    goto LABEL_10;
  }
  uint64_t v5 = 0;
LABEL_11:

  return v5;
}

- (unsigned)enumerateEntriesWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5 handler:(id)a6
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  if ([(HDDatabaseJournalDatabase *)self isOpen])
  {
    v51 = v10;
    id v54 = 0;
    v52 = -[HDDatabaseJournalDatabase _getIdentifierAndCreationDate:error:]((uint64_t)self, 0, (uint64_t)&v54);
    id v50 = v54;
    if (v52)
    {
      id v11 = v9;
      if (self)
      {
        unitTesting_keyValueDomainOverride = self->_unitTesting_keyValueDomainOverride;
        if (!unitTesting_keyValueDomainOverride)
        {
          unitTesting_keyValueDomainOverride = self->_keyValueDomain;
          if (!unitTesting_keyValueDomainOverride)
          {
            id v13 = NSString;
            id v14 = [(HDDatabaseJournalDatabase *)self journalPath];
            v15 = [v14 lastPathComponent];
            uint64_t v16 = [v13 stringWithFormat:@"JournalDatabase-%@", v15];

            id v17 = [[HDKeyValueDomain alloc] initWithCategory:100 domainName:v16 profile:v11];
            keyValueDomain = self->_keyValueDomain;
            self->_keyValueDomain = v17;

            unitTesting_keyValueDomainOverride = self->_keyValueDomain;
          }
        }
        Class v19 = unitTesting_keyValueDomainOverride;
      }
      else
      {
        Class v19 = 0;
      }

      v72[0] = @"IDENTIFIER";
      v72[1] = @"anchor";
      uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:2];
      v21 = [(HDKeyValueDomain *)v19 valuesForKeys:v20 error:a5];
      uint64_t v22 = v21;
      if (!v21)
      {
        unsigned int v31 = 0;
LABEL_52:

        goto LABEL_53;
      }
      v23 = [v21 objectForKeyedSubscript:@"anchor"];
      uint64_t v24 = [v23 longLongValue];

      v49 = [v22 objectForKeyedSubscript:@"IDENTIFIER"];
      if ([v52 isEqualToString:v49]) {
        uint64_t v25 = v24;
      }
      else {
        uint64_t v25 = 0;
      }
      _HKInitializeLogging();
      long long v26 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v25;
        _os_log_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_INFO, "Enumerate %@ from anchor %lld", buf, 0x16u);
      }
      int64_t enumeratedBytesThreshold = self->_enumeratedBytesThreshold;
      long long v28 = self->_database;
      id v48 = v51;
      self;
      long long v29 = v28;
      self;
      uint64_t v66 = 0;
      v67 = &v66;
      uint64_t v68 = 0x2020000000;
      uint64_t v69 = 0;
      uint64_t v61 = MEMORY[0x1E4F143A8];
      uint64_t v62 = 3221225472;
      uint64_t v63 = (uint64_t)__61__HDDatabaseJournalDatabase__maxEntryAnchorInDatabase_error___block_invoke;
      v64 = &unk_1E62F3640;
      v65 = &v66;
      if ([(HDSQLiteDatabase *)v29 executeSQL:@"SELECT MAX(ROWID) FROM entries" error:a5 bindingHandler:0 enumerationHandler:&v61])uint64_t v30 = v67[3]; {
      else
      }
        uint64_t v30 = -1;
      _Block_object_dispose(&v66, 8);

      if (v30 < 0)
      {

LABEL_50:
        unsigned int v31 = 0;
LABEL_51:

        goto LABEL_52;
      }
      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v61 = 0;
      uint64_t v62 = (uint64_t)&v61;
      uint64_t v63 = 0x2020000000;
      v64 = 0;
      uint64_t v66 = 0;
      v67 = &v66;
      uint64_t v68 = 0x2020000000;
      uint64_t v69 = v25;
      uint64_t v57 = 0;
      v58 = &v57;
      uint64_t v59 = 0x2020000000;
      int v60 = 3;
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __103__HDDatabaseJournalDatabase__enumerateEntriesInDatabase_anchor_enumeratedBytesThreshold_error_handler___block_invoke;
      v56[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
      v56[4] = v25;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __103__HDDatabaseJournalDatabase__enumerateEntriesInDatabase_anchor_enumeratedBytesThreshold_error_handler___block_invoke_2;
      v74 = &unk_1E63028E0;
      v76 = &v66;
      v77 = &v61;
      id v36 = v35;
      v78 = &v57;
      int64_t v79 = enumeratedBytesThreshold;
      id v37 = v36;
      v75 = (uint64_t *)v36;
      if ([(HDSQLiteDatabase *)v29 executeSQL:@"SELECT entries.ROWID AS anchor, string, size, data FROM entries INNER JOIN unique_strings ON unique_strings.ROWID = entries.class_name WHERE anchor > ? ORDER BY anchor ASC" error:a5 bindingHandler:v56 enumerationHandler:buf])
      {
        uint64_t v38 = [v37 count];
        uint64_t v39 = v67[3];
        if (v38)
        {
          uint64_t v40 = *(void *)(v62 + 24);
          id v55 = 0;
          unsigned int v31 = (*((uint64_t (**)(id, id, uint64_t, BOOL, id *))v48 + 2))(v48, v37, v40, v39 >= v30, &v55);
          id v41 = v55;
          if (v31 - 3 >= 2)
          {
            id v43 = v41;
            v44 = v43;
            if (v43)
            {
              if (a5) {
                *a5 = v43;
              }
              else {
                _HKLogDroppedError();
              }
            }

            uint64_t v39 = v67[3];
LABEL_48:

            _Block_object_dispose(&v57, 8);
            _Block_object_dispose(&v66, 8);
            _Block_object_dispose(&v61, 8);

            if (v31 - 3 > 1) {
              goto LABEL_51;
            }
            v71[0] = v52;
            v70[0] = @"IDENTIFIER";
            v70[1] = @"anchor";
            v45 = [NSNumber numberWithLongLong:v39];
            v71[1] = v45;
            v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:2];

            LODWORD(v45) = [(HDKeyValueDomain *)v19 setValuesWithDictionary:v46 error:a5];
            if (v45) {
              goto LABEL_51;
            }
            goto LABEL_50;
          }

          uint64_t v39 = v67[3];
          if (v31 != 3)
          {
            unsigned int v31 = 4;
            goto LABEL_48;
          }
        }
      }
      else
      {
        if ((*((_DWORD *)v58 + 6) - 3) < 2)
        {
          unsigned int v31 = 0;
          uint64_t v39 = v25;
          goto LABEL_48;
        }
        uint64_t v39 = v25;
      }
      unsigned int v31 = *((_DWORD *)v58 + 6);
      goto LABEL_48;
    }
    id v53 = 0;
    if (self)
    {
      uint64_t v61 = 0;
      uint64_t v62 = (uint64_t)&v61;
      uint64_t v63 = 0x2020000000;
      v64 = 0;
      database = self->_database;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __54__HDDatabaseJournalDatabase__hasEmptySchemaWithError___block_invoke;
      v74 = &unk_1E62F3640;
      v75 = &v61;
      if ([(HDSQLiteDatabase *)database executeSQL:@"SELECT COUNT(*) FROM sqlite_master" error:&v53 bindingHandler:0 enumerationHandler:buf])
      {
        uint64_t v33 = *(void *)(v62 + 24);
        _Block_object_dispose(&v61, 8);
        Class v19 = (HDKeyValueDomain *)v53;
        if (v33 < 1)
        {
          unsigned int v31 = 3;
LABEL_54:

          id v10 = v51;
          goto LABEL_55;
        }
        v34 = (HDKeyValueDomain *)v50;
        uint64_t v20 = v34;
        if (v34)
        {
          if (a5)
          {
            uint64_t v20 = v34;
            unsigned int v31 = 0;
            *a5 = v20;
LABEL_53:

            goto LABEL_54;
          }
          _HKLogDroppedError();
        }
LABEL_59:
        unsigned int v31 = 0;
        goto LABEL_53;
      }
      _Block_object_dispose(&v61, 8);
      v42 = (HDKeyValueDomain *)v53;
      uint64_t v20 = v42;
      if (v42)
      {
        if (a5)
        {
          uint64_t v20 = v42;
          unsigned int v31 = 0;
          *a5 = v20;
        }
        else
        {
          _HKLogDroppedError();
          unsigned int v31 = 0;
        }
        Class v19 = v20;
        goto LABEL_53;
      }
    }
    else
    {
      uint64_t v20 = 0;
    }
    Class v19 = 0;
    goto LABEL_59;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a5, 3, @"Cannot enumerate data because journal database is not open");
  unsigned int v31 = 0;
LABEL_55:

  return v31;
}

- (BOOL)flushDataToDisk:(id *)a3
{
  return 1;
}

- (BOOL)openForReadingWithError:(id *)a3
{
  if ([(HDDatabaseJournalDatabase *)self isOpen])
  {
    unint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v9 = [(NSURL *)self->_databaseURL path];
    [v8 handleFailureInMethod:a2, self, @"HDDatabaseJournalDatabase.m", 245, @"Cannot open %@ because it is already open", v9 object file lineNumber description];
  }
  -[HDDatabaseJournalDatabase _createDatabaseConnectionWithURL:]((uint64_t)self, self->_databaseURL);
  char v6 = +[HDDatabaseJournalDatabase _openDatabase:error:]((uint64_t)HDDatabaseJournalDatabase, self->_database, (uint64_t)a3);
  if ((v6 & 1) == 0) {
    [(HDDatabaseJournalDatabase *)self close];
  }
  return v6;
}

- (unsigned)readVersionWithError:(id *)a3
{
  return 6;
}

- (BOOL)removeWithError:(id *)a3
{
  if ([(HDDatabaseJournalDatabase *)self isOpen])
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = [(NSURL *)self->_databaseURL path];
    [v10 handleFailureInMethod:a2, self, @"HDDatabaseJournalDatabase.m", 265, @"Cannot remove %@ because it is still open", v11 object file lineNumber description];
  }
  -[HDDatabaseJournalDatabase _clearCachedProperties]((uint64_t)self);
  id v6 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v7 = [(NSURL *)self->_databaseURL URLByDeletingLastPathComponent];
  char v8 = [v6 removeItemAtURL:v7 error:a3];

  return v8;
}

uint64_t __60__HDDatabaseJournalDatabase__createSchemaForDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([v5 executeSQLStatements:*(void *)(a1 + 32) error:a3]
    && [v5 executeUncachedSQL:@"INSERT OR IGNORE INTO key_value_store (key, value, modification_date) VALUES (?, ?, ?)", a3, &__block_literal_global_120, 0 error bindingHandler enumerationHandler])
  {
    uint64_t v6 = [v5 setUserVersion:1 withDatabaseName:0 error:a3];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __60__HDDatabaseJournalDatabase__createSchemaForDatabase_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteBindStringToStatement();
  uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [v3 UUIDString];
  HDSQLiteBindStringToStatement();

  double Current = CFAbsoluteTimeGetCurrent();

  return sqlite3_bind_double(a2, 3, Current);
}

uint64_t __67__HDDatabaseJournalDatabase__appendData_entryClass_database_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [MEMORY[0x1E4F2B860] sharedBehavior];
  char v8 = [v7 currentOSBuild];
  uint64_t v9 = +[HDDatabaseJournalDatabase _getIDForString:database:error:](v6, v8, v5, a3);

  if (v9 < 1
    || (uint64_t v10 = *(void *)(a1 + 40),
        NSStringFromClass(*(Class *)(a1 + 48)),
        id v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = +[HDDatabaseJournalDatabase _getIDForString:database:error:](v10, v11, v5, a3),
        v11,
        v12 < 1))
  {
    uint64_t v16 = 0;
  }
  else
  {
    id v13 = *(id *)(a1 + 32);
    id v14 = v5;
    self;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __90__HDDatabaseJournalDatabase__insertData_osBuildStringID_classNameStringID_database_error___block_invoke;
    v18[3] = &unk_1E62F3618;
    uint64_t v20 = v9;
    uint64_t v21 = v12;
    id v19 = v13;
    id v15 = v13;
    uint64_t v16 = [v14 executeSQL:@"INSERT INTO entries (os_build, class_name, size, data) VALUES (?, ?, ?, ?)", a3, v18, 0 error bindingHandler enumerationHandler];
  }
  return v16;
}

+ (uint64_t)_getIDForString:(void *)a3 database:(uint64_t)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  self;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = -1;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__HDDatabaseJournalDatabase__getIDForString_database_error___block_invoke;
  v15[3] = &unk_1E62F43C8;
  id v8 = v6;
  id v16 = v8;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__HDDatabaseJournalDatabase__getIDForString_database_error___block_invoke_2;
  v14[3] = &unk_1E62F3640;
  v14[4] = &v17;
  if ([v7 executeSQL:@"SELECT ROWID FROM unique_strings WHERE string = ?" error:a4 bindingHandler:v15 enumerationHandler:v14])
  {
    uint64_t v9 = v18[3];
    if (v9 <= 0)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __60__HDDatabaseJournalDatabase__getIDForString_database_error___block_invoke_3;
      v12[3] = &unk_1E62F43C8;
      id v13 = v8;
      if ([v7 executeSQL:@"INSERT INTO unique_strings (string) VALUES (?)" error:a4 bindingHandler:v12 enumerationHandler:0])
      {
        uint64_t v10 = [v7 lastInsertRowID];
        uint64_t v9 = [v10 longLongValue];
      }
      else
      {
        uint64_t v9 = -1;
      }
    }
  }
  else
  {
    uint64_t v9 = -1;
  }

  _Block_object_dispose(&v17, 8);
  return v9;
}

uint64_t __60__HDDatabaseJournalDatabase__getIDForString_database_error___block_invoke()
{
  return HDSQLiteBindStringToStatement();
}

uint64_t __60__HDDatabaseJournalDatabase__getIDForString_database_error___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t __60__HDDatabaseJournalDatabase__getIDForString_database_error___block_invoke_3()
{
  return HDSQLiteBindStringToStatement();
}

uint64_t __90__HDDatabaseJournalDatabase__insertData_osBuildStringID_classNameStringID_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  sqlite3_bind_int64(a2, 2, *(void *)(a1 + 48));
  sqlite3_bind_int64(a2, 3, [*(id *)(a1 + 32) length]);

  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __103__HDDatabaseJournalDatabase__enumerateEntriesInDatabase_anchor_enumeratedBytesThreshold_error_handler___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

BOOL __103__HDDatabaseJournalDatabase__enumerateEntriesInDatabase_anchor_enumeratedBytesThreshold_error_handler___block_invoke_2(void *a1, uint64_t a2)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = HDSQLiteColumnAsInt64();
  id v4 = MEMORY[0x1C1879F80](a2, 1);
  int v5 = HDSQLiteColumnAsInt64();
  id v6 = MEMORY[0x1C1879F20](a2, 3);
  *(void *)(*(void *)(a1[6] + 8) + 24) += v5;
  id v7 = (void *)a1[4];
  id v8 = [[HDJournalChapterItem alloc] initWithEntryClassName:v4 serializedEntryData:v6];
  [v7 addObject:v8];

  unint64_t v9 = *(void *)(*(void *)(a1[6] + 8) + 24);
  unint64_t v10 = a1[8];
  if (v9 >= v10) {
    *(_DWORD *)(*(void *)(a1[7] + 8) + 24) = 4;
  }
  BOOL v11 = v9 < v10;

  return v11;
}

uint64_t __61__HDDatabaseJournalDatabase__maxEntryAnchorInDatabase_error___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t __54__HDDatabaseJournalDatabase__hasEmptySchemaWithError___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t __65__HDDatabaseJournalDatabase__getIdentifierAndCreationDate_error___block_invoke()
{
  return HDSQLiteBindStringToStatement();
}

uint64_t __65__HDDatabaseJournalDatabase__getIdentifierAndCreationDate_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x1C1879F80](a2, 0);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = MEMORY[0x1C1879F40](a2, 1);
  return 1;
}

- (HDSQLiteDatabase)unitTesting_underlyingDatabase
{
  return self->_database;
}

- (void)setUnitTesting_underlyingDatabase:(id)a3
{
}

- (void)unitTesting_setEnumeratedBytesThreshold:(int64_t)a3
{
  self->_int64_t enumeratedBytesThreshold = a3;
}

- (HDKeyValueDomain)unitTesting_keyValueDomainOverride
{
  return self->_unitTesting_keyValueDomainOverride;
}

- (void)setUnitTesting_keyValueDomainOverride:(id)a3
{
}

- (id)unitTesting_didCreateDatabaseConnectionHandler
{
  return self->_unitTesting_didCreateDatabaseConnectionHandler;
}

- (void)setUnitTesting_didCreateDatabaseConnectionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_didCreateDatabaseConnectionHandler, 0);
  objc_storeStrong((id *)&self->_unitTesting_keyValueDomainOverride, 0);
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_database, 0);

  objc_storeStrong((id *)&self->_databaseURL, 0);
}

@end