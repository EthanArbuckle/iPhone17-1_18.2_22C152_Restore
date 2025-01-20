@interface HDSimpleGraphDatabase
+ (HDSimpleGraphDatabase)graphDatabaseWithURL:(id)a3 error:(id *)a4;
+ (id)unitTesting_didInitGraphDatabaseHandler;
+ (uint64_t)_createSchemaForDatabase:(void *)a3 behavior:(uint64_t)a4 error:;
+ (uint64_t)_openDatabase:(uint64_t)a3 error:;
+ (uint64_t)_readSchemaVersionForDatabase:(uint64_t)a3 error:;
+ (uint64_t)_removeExistingAndCreateDatabase:(uint64_t)a3 error:;
+ (uint64_t)_removeExistingDatabaseAtURL:(uint64_t)a3 error:;
+ (void)setUnitTesting_didInitGraphDatabaseHandler:(id)a3;
- (BOOL)addAttributeForNodeID:(int64_t)a3 type:(int64_t)a4 value:(id)a5 version:(int64_t)a6 slots:(unint64_t)a7 error:(id *)a8;
- (BOOL)addRelationshipWithSubjectNodeID:(int64_t)a3 type:(int64_t)a4 objectNodeID:(int64_t)a5 version:(int64_t)a6 slots:(unint64_t)a7 error:(id *)a8;
- (BOOL)deleteNodeWithID:(int64_t)a3 error:(id *)a4;
- (BOOL)deleteWithError:(id *)a3;
- (BOOL)enumerateAttributesForNodeWithID:(int64_t)a3 error:(id *)a4 enumerationHandler:(id)a5;
- (BOOL)enumerateAttributesForNodeWithID:(int64_t)a3 includeDeleted:(BOOL)a4 error:(id *)a5 enumerationHandler:(id)a6;
- (BOOL)enumerateNodesForPredicate:(id)a3 error:(id *)a4 enumerationHandler:(id)a5;
- (BOOL)enumerateNodesForPredicate:(id)a3 includeDeleted:(BOOL)a4 limit:(unint64_t)a5 error:(id *)a6 enumerationHandler:(id)a7;
- (BOOL)enumerateRelationshipsForPredicate:(id)a3 error:(id *)a4 enumerationHandler:(id)a5;
- (BOOL)enumerateRelationshipsForPredicate:(id)a3 includeDeleted:(BOOL)a4 error:(id *)a5 enumerationHandler:(id)a6;
- (BOOL)enumerateRelationshipsWithSubjectID:(int64_t)a3 includeDeleted:(BOOL)a4 error:(id *)a5 enumerationHandler:(id)a6;
- (BOOL)foreignKeysEnable:(BOOL)a3 error:(id *)a4;
- (BOOL)insertNodeWithID:(int64_t)a3 version:(int64_t)a4 slots:(unint64_t)a5 deleted:(BOOL)a6 error:(id *)a7;
- (BOOL)isOpen;
- (BOOL)metadataValueForKey:(id)a3 valueOut:(id *)a4 error:(id *)a5;
- (BOOL)performTransactionWithError:(id *)a3 write:(BOOL)a4 block:(id)a5;
- (BOOL)setMetadataValue:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)unitTesting_addAttributeWithType:(int64_t)a3 value:(id)a4 nodeID:(int64_t)a5 error:(id *)a6;
- (BOOL)unitTesting_addRelationshipWithType:(int64_t)a3 subjectNodeID:(int64_t)a4 objectNodeID:(int64_t)a5 error:(id *)a6;
- (BOOL)unitTesting_removeRelationshipWithID:(int64_t)a3 subjectNodeID:(int64_t)a4 objectNodeID:(int64_t)a5 error:(id *)a6;
- (HDSQLiteDatabase)underlyingDatabase;
- (HDSQLiteDatabase)unitTesting_underlyingDatabase;
- (HDSimpleGraphDatabase)init;
- (NSURL)URL;
- (id)description;
- (id)nodeForID:(int64_t)a3 error:(id *)a4;
- (id)schemaVersionWithError:(id *)a3;
- (id)unitTesting_countOfNodesWithError:(id *)a3;
- (id)unitTesting_countOfNodesWithRelationshipType:(int64_t)a3 error:(id *)a4;
- (id)unitTesting_didCreateDatabaseConnectionHandler;
- (id)unitTesting_insertNodeWithID:(int64_t)a3 error:(id *)a4;
- (void)close;
- (void)dealloc;
- (void)onCommit:(id)a3 orRollback:(id)a4;
- (void)setUnitTesting_didCreateDatabaseConnectionHandler:(id)a3;
- (void)setUnitTesting_underlyingDatabase:(id)a3;
@end

@implementation HDSimpleGraphDatabase

- (HDSimpleGraphDatabase)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

+ (HDSimpleGraphDatabase)graphDatabaseWithURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [HDSimpleGraphDatabase alloc];
  id v7 = v5;
  if (v6)
  {
    v22.receiver = v6;
    v22.super_class = (Class)HDSimpleGraphDatabase;
    v6 = objc_msgSendSuper2(&v22, sel_init);
    if (v6)
    {
      uint64_t v8 = [v7 copy];
      URL = v6->_URL;
      v6->_URL = (NSURL *)v8;
    }
  }

  v10 = _Block_copy((const void *)unitTesting_didInitGraphDatabaseHandler);
  if (v10) {
    (*(void (**)(uint64_t, HDSimpleGraphDatabase *))(unitTesting_didInitGraphDatabaseHandler + 16))(unitTesting_didInitGraphDatabaseHandler, v6);
  }
  if (v6)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    v12 = [(NSURL *)v6->_URL URLByDeletingLastPathComponent];
    int v13 = [v11 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:a4];

    if (v13)
    {
      v14 = v6->_URL;
      if (v6->_database)
      {
        v21 = [MEMORY[0x1E4F28B00] currentHandler];
        [v21 handleFailureInMethod:sel__createDatabaseConnectionWithURL_, v6, @"HDSimpleGraphDatabase.m", 127, @"Invalid parameter not satisfying: %@", @"_database == nil" object file lineNumber description];
      }
      uint64_t v15 = [objc_alloc(MEMORY[0x1E4F65D18]) initWithDatabaseURL:v14];
      database = v6->_database;
      v6->_database = (HDSQLiteDatabase *)v15;

      [(HDSQLiteDatabase *)v6->_database setFileProtectionType:*MEMORY[0x1E4F28348]];
      v17 = _Block_copy(v6->_unitTesting_didCreateDatabaseConnectionHandler);
      v18 = v17;
      if (v17) {
        (*((void (**)(void *, HDSimpleGraphDatabase *))v17 + 2))(v17, v6);
      }

      if (+[HDSimpleGraphDatabase _openDatabase:error:]((uint64_t)HDSimpleGraphDatabase, v6->_database, (uint64_t)a4))
      {

        v19 = v6;
        goto LABEL_17;
      }
      [(HDSimpleGraphDatabase *)v6 close];
    }
  }
  v19 = 0;
LABEL_17:

  return v19;
}

- (BOOL)isOpen
{
  return [(HDSQLiteDatabase *)self->_database isOpen];
}

- (HDSQLiteDatabase)underlyingDatabase
{
  return self->_database;
}

- (void)dealloc
{
  [(HDSimpleGraphDatabase *)self close];
  v3.receiver = self;
  v3.super_class = (Class)HDSimpleGraphDatabase;
  [(HDSimpleGraphDatabase *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(NSURL *)self->_URL path];
  v6 = [v3 stringWithFormat:@"<%@:%p %@>", v4, self, v5];

  return v6;
}

- (id)schemaVersionWithError:(id *)a3
{
  uint64_t v3 = +[HDSimpleGraphDatabase _readSchemaVersionForDatabase:error:]((uint64_t)HDSimpleGraphDatabase, self->_database, (uint64_t)a3);
  if (v3 < 0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [NSNumber numberWithLongLong:v3];
  }

  return v4;
}

+ (uint64_t)_readSchemaVersionForDatabase:(uint64_t)a3 error:
{
  id v4 = a2;
  self;
  uint64_t v5 = [v4 userVersionWithDatabaseName:0 error:a3];

  return v5;
}

+ (uint64_t)_openDatabase:(uint64_t)a3 error:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  self;
  if (![v4 openWithError:a3])
  {
    id v33 = v4;
    uint64_t v31 = self;
    v32 = [MEMORY[0x1E4F2B860] sharedBehavior];
    id v35 = 0;
    unint64_t v6 = +[HDSimpleGraphDatabase _readSchemaVersionForDatabase:error:](v31, v33, (uint64_t)&v35);
    id v30 = v35;
    if ([v32 supportsOntologyDatabaseFutureMigrations]) {
      unint64_t v7 = 10001;
    }
    else {
      unint64_t v7 = 8;
    }
    if (v6 == v7) {
      goto LABEL_7;
    }
    if ((v6 & 0x8000000000000000) == 0)
    {
      if (v6 > v7)
      {
        _HKInitializeLogging();
        uint64_t v8 = HKLogHealthOntology();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v44 = 138543874;
          uint64_t v45 = v31;
          __int16 v46 = 2048;
          unint64_t v47 = v6;
          __int16 v48 = 2048;
          uint64_t v49 = 8;
          _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Graph database schema version '%ld' greater than current '%ld' (rollback detected)", v44, 0x20u);
        }

        if (!+[HDSimpleGraphDatabase _removeExistingAndCreateDatabase:error:](v31, v33, a3)) {
          goto LABEL_18;
        }
      }
      if (v6 < v7)
      {
        if (v6)
        {
          id v34 = 0;
          id v27 = v33;
          id v25 = v32;
          uint64_t v28 = self;
          if (v6 > 3)
          {
            long long v38 = 0u;
            long long v39 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            id obj = +[HDSimpleGraphDatabaseMigrator migrationStepsWithBehavior:v25];
            uint64_t v12 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
            uint64_t v10 = v6;
            if (v12)
            {
              uint64_t v29 = *(void *)v37;
              uint64_t v10 = v6;
              while (2)
              {
                for (uint64_t i = 0; i != v12; ++i)
                {
                  if (*(void *)v37 != v29) {
                    objc_enumerationMutation(obj);
                  }
                  v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                  if (v10 < [v14 toVersion])
                  {
                    _HKInitializeLogging();
                    uint64_t v15 = HKLogHealthOntology();
                    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v16 = [v14 toVersion];
                      *(_DWORD *)buf = 138543874;
                      *(void *)&buf[4] = v28;
                      *(_WORD *)&buf[12] = 2048;
                      *(void *)&buf[14] = v10;
                      *(_WORD *)&buf[22] = 2048;
                      v53 = (void *)v16;
                      _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Migrate ontology database from schema %ld -> %ld", buf, 0x20u);
                    }

                    uint64_t v17 = [v14 toVersion];
                    uint64_t v18 = [v14 function];
                    id v19 = v27;
                    self;
                    uint64_t v40 = 0;
                    v41 = &v40;
                    uint64_t v42 = 0x2020000000;
                    uint64_t v43 = 1;
                    *(void *)buf = MEMORY[0x1E4F143A8];
                    *(void *)&buf[8] = 3221225472;
                    *(void *)&buf[16] = __67__HDSimpleGraphDatabase__migrateDatabase_toVersion_function_error___block_invoke;
                    v53 = &unk_1E63045B0;
                    v54 = &v40;
                    uint64_t v55 = v18;
                    uint64_t v56 = v17;
                    if ([v19 performTransactionWithType:1 error:&v34 usingBlock:buf]) {
                      uint64_t v9 = v41[3];
                    }
                    else {
                      uint64_t v9 = 1;
                    }
                    _Block_object_dispose(&v40, 8);

                    if (v9)
                    {

                      goto LABEL_40;
                    }
                    uint64_t v10 = [v14 toVersion];
                  }
                }
                uint64_t v12 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
                if (v12) {
                  continue;
                }
                break;
              }
            }

            uint64_t v9 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v34, 100, @"No migrations were written for schema < %ld", 5);
            uint64_t v9 = 1;
            uint64_t v10 = v6;
          }
LABEL_40:

          id v20 = v34;
          _HKInitializeLogging();
          v21 = HKLogHealthOntology();
          objc_super v22 = v21;
          if (v9 == 1)
          {
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v44 = 138544130;
              uint64_t v45 = v31;
              __int16 v46 = 2048;
              unint64_t v47 = v10;
              __int16 v48 = 2048;
              uint64_t v49 = 8;
              __int16 v50 = 2112;
              id v51 = v20;
              _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Unable to migrate from schema version %ld (current for OS is %ld) %@", v44, 0x2Au);
            }

            if ((+[HDSimpleGraphDatabase _removeExistingAndCreateDatabase:error:](v31, v27, a3) & 1) == 0)
            {

              goto LABEL_18;
            }
          }
          else
          {
            BOOL v23 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);

            if (v23)
            {
              v24 = HKLogHealthOntology();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v44 = 138543874;
                uint64_t v45 = v31;
                __int16 v46 = 2048;
                unint64_t v47 = v6;
                __int16 v48 = 2048;
                uint64_t v49 = v10;
                _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_INFO, "%{public}@: Migrated from schema version %ld -> %ld", v44, 0x20u);
              }
            }
          }
        }
        else if ((+[HDSimpleGraphDatabase _createSchemaForDatabase:behavior:error:](v31, v33, v32, a3) & 1) == 0)
        {
          goto LABEL_18;
        }
      }
LABEL_7:
      uint64_t v5 = 1;
LABEL_19:

      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:underlyingError:", a3, 100, @"Unable to read schema version", v30);
LABEL_18:
    uint64_t v5 = 0;
    goto LABEL_19;
  }
  uint64_t v5 = 0;
LABEL_20:

  return v5;
}

+ (uint64_t)_removeExistingAndCreateDatabase:(uint64_t)a3 error:
{
  id v4 = a2;
  uint64_t v5 = self;
  [v4 close];
  unint64_t v6 = [v4 fileURL];
  int v7 = +[HDSimpleGraphDatabase _removeExistingDatabaseAtURL:error:](v5, v6, a3);

  if (v7) {
    uint64_t v8 = +[HDSimpleGraphDatabase _openDatabase:error:](v5, v4, a3);
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (uint64_t)_createSchemaForDatabase:(void *)a3 behavior:(uint64_t)a4 error:
{
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__HDSimpleGraphDatabase__createSchemaForDatabase_behavior_error___block_invoke;
  v12[3] = &unk_1E62FB8D8;
  id v13 = v6;
  uint64_t v14 = v8;
  id v9 = v6;
  uint64_t v10 = [v7 performTransactionWithType:1 error:a4 usingBlock:v12];

  return v10;
}

+ (uint64_t)_removeExistingDatabaseAtURL:(uint64_t)a3 error:
{
  id v4 = a2;
  self;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  uint64_t v6 = objc_msgSend(v5, "hd_removeSQLiteDatabaseAtURL:preserveCopy:", v4, 0);
  if ((v6 & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = [v4 path];
    objc_msgSend(v7, "hk_assignError:code:format:", a3, 102, @"Unable to remove existing database '%@'", v8);
  }
  return v6;
}

uint64_t __65__HDSimpleGraphDatabase__createSchemaForDatabase_behavior_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v51[16] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = *(id *)(a1 + 32);
  self;
  self;
  v51[0] = objc_opt_class();
  v51[1] = objc_opt_class();
  v51[2] = objc_opt_class();
  v51[3] = objc_opt_class();
  v51[4] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:5];
  int v8 = [v6 supportsOntologyDatabaseFutureMigrations];

  uint64_t v37 = a3;
  long long v38 = v5;
  if (v8)
  {
    self;
    uint64_t v9 = [v7 arrayByAddingObjectsFromArray:MEMORY[0x1E4F1CBF0]];

    id v7 = (void *)v9;
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v10 addObject:@"PRAGMA encoding=\"UTF-8\";"];
  id v11 = v7;
  self;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v48 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [*(id *)(*((void *)&v47 + 1) + 8 * i) createTableSQL];
        [v12 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v15);
  }

  long long v36 = v10;
  [v10 addObjectsFromArray:v12];

  id v19 = v13;
  self;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v21 = v19;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v44 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v43 + 1) + 8 * j);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v27 = [v26 indices];
        uint64_t v28 = [v27 countByEnumeratingWithState:&v39 objects:&v47 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v40;
          do
          {
            for (uint64_t k = 0; k != v29; ++k)
            {
              if (*(void *)v40 != v30) {
                objc_enumerationMutation(v27);
              }
              v32 = [*(id *)(*((void *)&v39 + 1) + 8 * k) creationSQL];
              [v20 addObject:v32];
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v39 objects:&v47 count:16];
          }
          while (v29);
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v23);
  }

  [v36 addObjectsFromArray:v20];
  [v36 addObject:@"PRAGMA page_size = 2048;"];

  int v33 = [v38 executeSQLStatements:v36 error:v37];
  if (v33) {
    uint64_t v34 = [v38 setUserVersion:8 withDatabaseName:0 error:v37];
  }
  else {
    uint64_t v34 = 0;
  }

  return v34;
}

uint64_t __67__HDSimpleGraphDatabase__migrateDatabase_toVersion_function_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (*(uint64_t (**)(void))(a1 + 40))();
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = [v5 setUserVersion:*(void *)(a1 + 48) withDatabaseName:0 error:a3];
  }

  return v6;
}

- (void)close
{
  [(HDSQLiteDatabase *)self->_database close];
  database = self->_database;
  self->_database = 0;
}

- (BOOL)deleteWithError:(id *)a3
{
  [(HDSimpleGraphDatabase *)self close];
  URL = self->_URL;

  return +[HDSimpleGraphDatabase _removeExistingDatabaseAtURL:error:]((uint64_t)HDSimpleGraphDatabase, URL, (uint64_t)a3);
}

- (BOOL)performTransactionWithError:(id *)a3 write:(BOOL)a4 block:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  if ([(HDSQLiteDatabase *)self->_database isOpen])
  {
    uint64_t v9 = [(HDSQLiteDatabase *)self->_database isWriter];
    [(HDSQLiteDatabase *)self->_database setWriter:v5];
    database = self->_database;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __65__HDSimpleGraphDatabase_performTransactionWithError_write_block___block_invoke;
    uint64_t v16 = &unk_1E63045D8;
    uint64_t v17 = self;
    id v18 = v8;
    char v11 = [(HDSQLiteDatabase *)database performTransactionWithType:v5 error:a3 usingBlock:&v13];
    -[HDSQLiteDatabase setWriter:](self->_database, "setWriter:", v9, v13, v14, v15, v16);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 100, @"Database not open");
    char v11 = 0;
  }

  return v11;
}

uint64_t __65__HDSimpleGraphDatabase_performTransactionWithError_write_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)onCommit:(id)a3 orRollback:(id)a4
{
}

- (BOOL)insertNodeWithID:(int64_t)a3 version:(int64_t)a4 slots:(unint64_t)a5 deleted:(BOOL)a6 error:(id *)a7
{
  return +[HDSimpleGraphDatabaseNodeEntity insertNodeWithID:a3 version:a4 slots:a5 deleted:a6 database:self->_database error:a7];
}

- (id)nodeForID:(int64_t)a3 error:(id *)a4
{
  return +[HDSimpleGraphDatabaseNodeEntity nodeForID:a3 database:self->_database error:a4];
}

- (BOOL)enumerateNodesForPredicate:(id)a3 error:(id *)a4 enumerationHandler:(id)a5
{
  return [(HDSimpleGraphDatabase *)self enumerateNodesForPredicate:a3 includeDeleted:0 limit:*MEMORY[0x1E4F65DE0] error:a4 enumerationHandler:a5];
}

- (BOOL)enumerateNodesForPredicate:(id)a3 includeDeleted:(BOOL)a4 limit:(unint64_t)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  return +[HDSimpleGraphDatabaseNodeEntity enumerateNodesWithPredicate:a3 skipDeleted:!a4 limit:a5 database:self->_database error:a6 enumerationHandler:a7];
}

- (BOOL)deleteNodeWithID:(int64_t)a3 error:(id *)a4
{
  return +[HDSimpleGraphDatabaseNodeEntity deleteNodeWithID:a3 database:self->_database error:a4];
}

- (BOOL)addRelationshipWithSubjectNodeID:(int64_t)a3 type:(int64_t)a4 objectNodeID:(int64_t)a5 version:(int64_t)a6 slots:(unint64_t)a7 error:(id *)a8
{
  return +[HDSimpleGraphDatabaseRelationshipEntity addRelationshipWithType:a4 subjectNodeID:a3 objectNodeID:a5 version:a6 slots:a7 database:self->_database error:a8];
}

- (BOOL)enumerateRelationshipsForPredicate:(id)a3 error:(id *)a4 enumerationHandler:(id)a5
{
  return [(HDSimpleGraphDatabase *)self enumerateRelationshipsForPredicate:a3 includeDeleted:0 error:a4 enumerationHandler:a5];
}

- (BOOL)enumerateRelationshipsForPredicate:(id)a3 includeDeleted:(BOOL)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  return +[HDSimpleGraphDatabaseRelationshipEntity enumerateRelationshipsWithPredicate:a3 skipDeleted:!a4 database:self->_database error:a5 enumerationHandler:a6];
}

- (BOOL)enumerateRelationshipsWithSubjectID:(int64_t)a3 includeDeleted:(BOOL)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  return +[HDSimpleGraphDatabaseRelationshipEntity enumerateRelationshipsWithSubjectID:a3 skipDeleted:!a4 database:self->_database error:a5 enumerationHandler:a6];
}

- (BOOL)addAttributeForNodeID:(int64_t)a3 type:(int64_t)a4 value:(id)a5 version:(int64_t)a6 slots:(unint64_t)a7 error:(id *)a8
{
  return +[HDSimpleGraphDatabaseAttributeEntity addAttributeWithType:a4 value:a5 nodeID:a3 version:a6 slots:a7 database:self->_database error:a8];
}

- (BOOL)enumerateAttributesForNodeWithID:(int64_t)a3 error:(id *)a4 enumerationHandler:(id)a5
{
  return [(HDSimpleGraphDatabase *)self enumerateAttributesForNodeWithID:a3 includeDeleted:0 error:a4 enumerationHandler:a5];
}

- (BOOL)enumerateAttributesForNodeWithID:(int64_t)a3 includeDeleted:(BOOL)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  BOOL v6 = a4;
  id v10 = a6;
  if (!self->_database)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HDSimpleGraphDatabase.m", 561, @"Invalid parameter not satisfying: %@", @"_database" object file lineNumber description];
  }
  BOOL v11 = +[HDSimpleGraphDatabaseAttributeEntity enumerateAttributesForNodeWithID:skipDeleted:database:error:enumerationHandler:](HDSimpleGraphDatabaseAttributeEntity, "enumerateAttributesForNodeWithID:skipDeleted:database:error:enumerationHandler:", a3, !v6);

  return v11;
}

- (BOOL)setMetadataValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  return +[HDSimpleGraphDatabaseMetadataEntity setMetadataValue:a3 forKey:a4 database:self->_database error:a5];
}

- (BOOL)metadataValueForKey:(id)a3 valueOut:(id *)a4 error:(id *)a5
{
  return +[HDSimpleGraphDatabaseMetadataEntity metadataValueForKey:a3 valueOut:a4 database:self->_database error:a5];
}

- (BOOL)foreignKeysEnable:(BOOL)a3 error:(id *)a4
{
  if (a3) {
    id v4 = @"PRAGMA foreign_keys = ON";
  }
  else {
    id v4 = @"PRAGMA foreign_keys = OFF";
  }
  return [(HDSQLiteDatabase *)self->_database executeUncachedSQL:v4 error:a4];
}

+ (void)setUnitTesting_didInitGraphDatabaseHandler:(id)a3
{
  uint64_t v3 = [a3 copy];
  id v4 = (void *)unitTesting_didInitGraphDatabaseHandler;
  unitTesting_didInitGraphDatabaseHandler = v3;
}

+ (id)unitTesting_didInitGraphDatabaseHandler
{
  v2 = _Block_copy((const void *)unitTesting_didInitGraphDatabaseHandler);

  return v2;
}

- (HDSQLiteDatabase)unitTesting_underlyingDatabase
{
  return self->_database;
}

- (void)setUnitTesting_underlyingDatabase:(id)a3
{
}

- (id)unitTesting_insertNodeWithID:(int64_t)a3 error:(id *)a4
{
  BOOL v5 = 0;
  if ([(HDSimpleGraphDatabase *)self insertNodeWithID:a3 version:0 slots:0 deleted:0 error:a4])
  {
    BOOL v6 = [HDSimpleGraphNode alloc];
    id v7 = [(HDSQLiteDatabase *)self->_database lastInsertRowID];
    BOOL v5 = -[HDSimpleGraphNode initWithRowID:attributes:relationships:](v6, "initWithRowID:attributes:relationships:", [v7 longLongValue], 0, 0);
  }

  return v5;
}

- (BOOL)unitTesting_addAttributeWithType:(int64_t)a3 value:(id)a4 nodeID:(int64_t)a5 error:(id *)a6
{
  return +[HDSimpleGraphDatabaseAttributeEntity addAttributeWithType:a3 value:a4 nodeID:a5 version:0 slots:0 database:self->_database error:a6];
}

- (BOOL)unitTesting_addRelationshipWithType:(int64_t)a3 subjectNodeID:(int64_t)a4 objectNodeID:(int64_t)a5 error:(id *)a6
{
  return +[HDSimpleGraphDatabaseRelationshipEntity addRelationshipWithType:a3 subjectNodeID:a4 objectNodeID:a5 version:0 slots:0 database:self->_database error:a6];
}

- (id)unitTesting_countOfNodesWithError:(id *)a3
{
  return +[HDSQLiteEntity countValueForProperty:*MEMORY[0x1E4F65C78] predicate:0 database:self->_database error:a3];
}

- (id)unitTesting_countOfNodesWithRelationshipType:(int64_t)a3 error:(id *)a4
{
  BOOL v6 = HDSimpleGraphRelationshipEntityPredicateForRelationshipType(a3);
  id v7 = +[HDSQLiteEntity countDistinctForProperty:@"subject_id" predicate:v6 database:self->_database error:a4];

  return v7;
}

- (BOOL)unitTesting_removeRelationshipWithID:(int64_t)a3 subjectNodeID:(int64_t)a4 objectNodeID:(int64_t)a5 error:(id *)a6
{
  return +[HDSimpleGraphDatabaseRelationshipEntity removeRelationshipWithType:a3 subjectNodeID:a4 objectNodeID:a5 database:self->_database error:a6];
}

- (NSURL)URL
{
  return self->_URL;
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
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

@end