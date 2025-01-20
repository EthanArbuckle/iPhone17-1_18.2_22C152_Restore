@interface HDDatabaseMigrationTransaction
+ (id)unprotectedMigrationTransactionForMigrationTransaction:(id)a3;
- (BOOL)_migrationRequiredForProtectionClass:(uint64_t)a1 migrator:(void *)a2 schemaProviders:(void *)a3 error:(void *)a4;
- (BOOL)isProtectedMigration;
- (HDDatabaseMigrationTransaction)initWithUnprotectedDatabase:(id)a3 protectedDatabase:(id)a4 schemaProviders:(id)a5 behavior:(id)a6;
- (HDDatabaseMigrationTransactionDelegate)delegate;
- (HDSQLiteDatabase)defaultDatabase;
- (HDSQLiteDatabase)protectedDatabase;
- (HDSQLiteDatabase)unprotectedDatabase;
- (NSArray)schemaProviders;
- (_HKBehavior)behavior;
- (int64_t)HFDRebuildState;
- (int64_t)accessHistoricHFDWithError:(id *)a3 block:(id)a4;
- (int64_t)defaultProtectionClass;
- (int64_t)migrateOrCreateSchemaWithError:(id *)a3;
- (uint64_t)_createDataTablesInDatabase:(uint64_t)a1 entityClasses:(void *)a2 requiredPrefix:(void *)a3 error:(void *)a4;
- (uint64_t)_migrateOrCreateSchemaWithEntityClasses:(void *)a3 error:;
- (void)_enableIncrementalAutovacuumIfNeeded;
- (void)_presentRollbackAlertForSchema:(void *)a1 protectionClass:(uint64_t)a2 foundVersion:(uint64_t)a3 currentVersion:(uint64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setHFDRebuildState:(int64_t)a3;
@end

@implementation HDDatabaseMigrationTransaction

- (HDDatabaseMigrationTransaction)initWithUnprotectedDatabase:(id)a3 protectedDatabase:(id)a4 schemaProviders:(id)a5 behavior:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HDDatabaseMigrationTransaction;
  v15 = [(HDDatabaseMigrationTransaction *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_unprotectedDatabase, a3);
    objc_storeStrong((id *)&v16->_protectedDatabase, a4);
    uint64_t v17 = [v13 copy];
    schemaProviders = v16->_schemaProviders;
    v16->_schemaProviders = (NSArray *)v17;

    objc_storeStrong((id *)&v16->_behavior, a6);
  }

  return v16;
}

- (BOOL)isProtectedMigration
{
  return self->_protectedDatabase != 0;
}

- (HDSQLiteDatabase)defaultDatabase
{
  protectedDatabase = self->_protectedDatabase;
  if (!protectedDatabase) {
    protectedDatabase = self->_unprotectedDatabase;
  }
  return protectedDatabase;
}

- (int64_t)accessHistoricHFDWithError:(id *)a3 block:(id)a4
{
  v7 = (uint64_t (**)(id, void *, id *))a4;
  if (![(HDDatabaseMigrationTransaction *)self isProtectedMigration])
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HDDatabaseMigrationTransaction.m", 54, @"Invalid parameter not satisfying: %@", @"[self isProtectedMigration]" object file lineNumber description];
  }
  v8 = (void *)MEMORY[0x1E4F65D18];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = [WeakRetained profileDirectoryPath];
  id v11 = [v8 highFrequencyDatabaseURLWithProfileDirectoryPath:v10];

  id v12 = [HDHFDataStore alloc];
  id v13 = [v11 path];
  id v14 = [(HDHFDataStore *)v12 initWithPath:v13];

  int64_t v15 = v7[2](v7, v14, a3);
  [(HDHFDataStore *)v14 flushForInvalidation:1];

  return v15;
}

- (int64_t)defaultProtectionClass
{
  if ([(HDDatabaseMigrationTransaction *)self isProtectedMigration]) {
    return 2;
  }
  else {
    return 1;
  }
}

+ (id)unprotectedMigrationTransactionForMigrationTransaction:(id)a3
{
  id v4 = a3;
  if ([v4 isProtectedMigration])
  {
    id v5 = objc_alloc((Class)a1);
    v6 = [v4 unprotectedDatabase];
    v7 = [v4 schemaProviders];
    v8 = [v4 behavior];
    id v9 = (id)[v5 initWithUnprotectedDatabase:v6 protectedDatabase:0 schemaProviders:v7 behavior:v8];

    v10 = [v4 delegate];
    [v9 setDelegate:v10];
  }
  else
  {
    id v9 = v4;
  }

  return v9;
}

- (int64_t)HFDRebuildState
{
  v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained profileIdentifier];
  id v5 = HDDatabaseUserDefaultsKeyForProfileIdentifier(@"HKHFDRebuildStage", v4);

  if (v2)
  {
    v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  }
  int64_t v6 = [v2 integerForKey:v5];

  return v6;
}

- (void)setHFDRebuildState:(int64_t)a3
{
  id v4 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t v6 = [WeakRetained profileIdentifier];
  HDDatabaseUserDefaultsKeyForProfileIdentifier(@"HKHFDRebuildStage", v6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  }
  [v4 setInteger:a3 forKey:v7];
}

- (HDSQLiteDatabase)unprotectedDatabase
{
  return self->_unprotectedDatabase;
}

- (HDSQLiteDatabase)protectedDatabase
{
  return self->_protectedDatabase;
}

- (_HKBehavior)behavior
{
  return self->_behavior;
}

- (NSArray)schemaProviders
{
  return self->_schemaProviders;
}

- (HDDatabaseMigrationTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDDatabaseMigrationTransactionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_schemaProviders, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_protectedDatabase, 0);

  objc_storeStrong((id *)&self->_unprotectedDatabase, 0);
}

- (int64_t)migrateOrCreateSchemaWithError:(id *)a3
{
  int64_t v6 = [(HDDatabaseMigrationTransaction *)self delegate];
  id v7 = [(HDDatabaseMigrationTransaction *)self behavior];
  v8 = [v6 migrationTransaction:self entityClassesWithBehavior:v7];

  id v9 = +[HDDatabaseMigrationTransaction unprotectedMigrationTransactionForMigrationTransaction:self];
  int64_t v10 = -[HDDatabaseMigrationTransaction _migrateOrCreateSchemaWithEntityClasses:error:](v9, v8, a3);
  if (!v10)
  {
    if (![(HDDatabaseMigrationTransaction *)self isProtectedMigration])
    {
      int64_t v10 = 0;
      goto LABEL_6;
    }
    int64_t v10 = -[HDDatabaseMigrationTransaction _migrateOrCreateSchemaWithEntityClasses:error:](self, v8, a3);
  }
  if (v10 == 3)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"HDDatabase+Schema.m" lineNumber:156 description:@"Incorrectly returned in-progress migration status."];
  }
LABEL_6:

  return v10;
}

- (uint64_t)_migrateOrCreateSchemaWithEntityClasses:(void *)a3 error:
{
  uint64_t v173 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1)
  {
    uint64_t v68 = 0;
    goto LABEL_183;
  }
  int64_t v6 = [a1 defaultDatabase];
  uint64_t v7 = [v6 userVersionWithDatabaseName:0 error:a3];
  if (v7 < 0) {
    goto LABEL_181;
  }
  v155 = a3;
  if (!v7)
  {
    -[HDDatabaseMigrationTransaction _enableIncrementalAutovacuumIfNeeded](a1);
    id v60 = v5;
    int v61 = [a1 isProtectedMigration];
    [a1 defaultDatabase];
    v63 = v62 = a1;
    uint64_t v64 = [v62 defaultProtectionClass];
    if (v61)
    {
      v151 = v62;
      if (![v63 isWriter])
      {
        uint64_t v68 = 4;
        goto LABEL_120;
      }
      v65 = [v62 unprotectedDatabase];
      *(void *)&long long v158 = 0;
      a3 = +[HDKeyValueEntity retrieveDatabaseIdentifierFromDatabase:v65 error:&v158];
      id v66 = (id)v158;

      if (a3)
      {
        _HKInitializeLogging();
        v67 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v163 = 138543362;
          *(void *)&v163[4] = a3;
          _os_log_error_impl(&dword_1BCB7D000, v67, OS_LOG_TYPE_ERROR, "Fatal: Found identifier %{public}@ in unprotected database when creating protected database", v163, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", v155, 100, @"Found identifier %@ in unprotected database when creating protected database", a3);
        uint64_t v68 = 2;
        goto LABEL_138;
      }
      a3 = v155;
      v62 = v151;
      if (v66)
      {
        if (v155)
        {
          id v66 = v66;
          a3 = 0;
          void *v155 = v66;
        }
        else
        {
          _HKLogDroppedError();
        }
        uint64_t v68 = 1;
        goto LABEL_138;
      }
    }
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __81__HDDatabaseMigrationTransaction_Schema___createEntitiesWithEntityClasses_error___block_invoke;
    *(void *)&buf[24] = &__block_descriptor_40_e8_B16__0_8l;
    *(void *)&buf[32] = v64;
    v89 = objc_msgSend(v60, "hk_filter:", buf);
    v90 = a3;
    int v91 = -[HDDatabaseMigrationTransaction _createDataTablesInDatabase:entityClasses:requiredPrefix:error:]((uint64_t)v62, v63, v89, 0);

    if (v91)
    {
      v151 = v62;
      v92 = [v62 behavior];
      int v93 = [v92 futureMigrationsEnabled];
      uint64_t v94 = 100002;
      if (v64 == 2) {
        uint64_t v94 = 100017;
      }
      uint64_t v95 = 18201;
      if (v64 == 2) {
        uint64_t v95 = 18006;
      }
      if (v93) {
        uint64_t v96 = v94;
      }
      else {
        uint64_t v96 = v95;
      }

      int v97 = [v63 setUserVersion:v96 withDatabaseName:0 error:v90];
      if (v97) {
        uint64_t v68 = 0;
      }
      else {
        uint64_t v68 = 2;
      }
      if ((v97 & v61) != 1)
      {
        a3 = v90;
        goto LABEL_179;
      }
      v146 = v6;
      id v66 = +[HDKeyValueEntity generateNewDatabaseIdentifier];
      _HKInitializeLogging();
      v98 = (os_log_t *)MEMORY[0x1E4F29F18];
      v99 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v163 = 138543362;
        *(void *)&v163[4] = v66;
        _os_log_impl(&dword_1BCB7D000, v99, OS_LOG_TYPE_DEFAULT, "Inserting identifier %{public}@ in unprotected db", v163, 0xCu);
      }
      v100 = +[HDSyncIdentity legacySyncIdentity];
      v101 = [v62 unprotectedDatabase];
      v102 = +[HDSyncIdentityEntity insertOrLookupConcreteIdentityForIdentity:v100 database:v101 error:v155];

      if (!v102)
      {
        id v115 = 0;
        int64_t v6 = v146;
        a3 = v155;
LABEL_177:

        uint64_t v68 = 2;
        goto LABEL_178;
      }
      id v143 = v5;
      v103 = [v102 entity];
      uint64_t v104 = [v103 persistentID];

      v105 = [v62 unprotectedDatabase];
      *(void *)v170 = 0;
      BOOL v106 = +[HDKeyValueEntity persistDatabaseIdentifier:v66 syncIdentity:v104 database:v105 error:v170];
      id v107 = *(id *)v170;

      _HKInitializeLogging();
      v108 = *v98;
      v109 = *v98;
      if (v106)
      {
        if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v163 = 138543362;
          *(void *)&v163[4] = v66;
          _os_log_impl(&dword_1BCB7D000, v108, OS_LOG_TYPE_DEFAULT, "Inserting identifier %{public}@ in protected db", v163, 0xCu);
        }
        v110 = [v151 protectedDatabase];
        *(void *)v167 = v107;
        BOOL v111 = +[HDKeyValueEntity persistDatabaseIdentifier:v66 syncIdentity:v104 database:v110 error:v167];
        id v112 = *(id *)v167;

        if (v111)
        {

          a3 = [v151 delegate];
          [a3 migrationTransaction:v151 didCreateDatabasesWithIdentifier:v66];
          uint64_t v68 = 0;
          id v5 = v143;
          int64_t v6 = v146;
LABEL_138:

          a3 = v155;
LABEL_178:

LABEL_179:
          if (v68) {
            goto LABEL_182;
          }
          uint64_t v7 = [v6 userVersionWithDatabaseName:0 error:a3];
          a1 = v151;
          if ((v7 & 0x8000000000000000) == 0) {
            goto LABEL_4;
          }
LABEL_181:
          uint64_t v68 = 1;
          goto LABEL_182;
        }
        _HKInitializeLogging();
        v118 = *v98;
        id v5 = v143;
        if (os_log_type_enabled(*v98, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v163 = 138543618;
          *(void *)&v163[4] = v66;
          __int16 v164 = 2114;
          id v165 = v112;
          _os_log_error_impl(&dword_1BCB7D000, v118, OS_LOG_TYPE_ERROR, "Failed inserting protected identifier %{public}@: %{public}@", v163, 0x16u);
        }
        id v115 = v112;
        int64_t v6 = v146;
        if (!v115)
        {
          a3 = v155;
          goto LABEL_176;
        }
        a3 = v155;
        if (!v155) {
          goto LABEL_143;
        }
      }
      else
      {
        if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v163 = 138543618;
          *(void *)&v163[4] = v66;
          __int16 v164 = 2114;
          id v165 = v107;
          _os_log_error_impl(&dword_1BCB7D000, v108, OS_LOG_TYPE_ERROR, "Failed inserting unprotected identifier %{public}@: %{public}@", v163, 0x16u);
        }
        id v115 = v107;
        id v5 = v143;
        int64_t v6 = v146;
        a3 = v155;
        if (!v115) {
          goto LABEL_176;
        }
        if (!v155)
        {
LABEL_143:
          _HKLogDroppedError();
          goto LABEL_176;
        }
      }
      id v115 = v115;
      *a3 = v115;
LABEL_176:

      goto LABEL_177;
    }
    uint64_t v68 = 2;
LABEL_120:

    goto LABEL_182;
  }
LABEL_4:
  uint64_t v152 = v7;
  id v8 = v5;
  int v9 = [a1 isProtectedMigration];
  int64_t v10 = [a1 defaultDatabase];
  uint64_t v11 = [a1 defaultProtectionClass];
  id v12 = [a1 behavior];
  int v13 = [v12 futureMigrationsEnabled];
  uint64_t v14 = 100002;
  if (v11 == 2) {
    uint64_t v14 = 100017;
  }
  uint64_t v15 = 18201;
  if (v11 == 2) {
    uint64_t v15 = 18006;
  }
  if (!v13) {
    uint64_t v14 = v15;
  }
  uint64_t v149 = v14;

  v16 = [[HDDatabaseMigrator alloc] initWithTransaction:a1];
  uint64_t v17 = [a1 schemaProviders];
  id v162 = 0;
  v153 = v16;
  BOOL v18 = -[HDDatabaseMigrationTransaction _migrationRequiredForProtectionClass:migrator:schemaProviders:error:](v11, v16, v17, &v162);
  id v19 = v162;

  if (!v18)
  {
    id v19 = v19;
    id v5 = v8;
    if (v19)
    {
      if (a3) {
        *a3 = v19;
      }
      else {
        _HKLogDroppedError();
      }
    }
    uint64_t v68 = v19 != 0;

    goto LABEL_155;
  }
  if (v9 && ![v10 isWriter])
  {
    uint64_t v68 = 4;
    id v5 = v8;
    goto LABEL_155;
  }
  int v141 = v9;
  v140 = v10;
  v145 = v6;
  if ([MEMORY[0x1E4F2B860] isAppleInternalInstall])
  {
    objc_super v20 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v20 setBool:0 forKey:@"HDHasPresentedRollbackWarningDialog"];
  }
  v142 = v8;
  id v144 = v19;
  BOOL v147 = v18;
  _HKInitializeLogging();
  v21 = (void *)*MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
  {
    if (v9) {
      v22 = "protected";
    }
    else {
      v22 = "unprotected";
    }
    v23 = (void *)MEMORY[0x1E4F2B860];
    v24 = v21;
    v25 = [v23 currentOSBuild];
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = v22;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v152;
    *(_WORD *)&buf[22] = 2048;
    *(void *)&buf[24] = v149;
    *(_WORD *)&buf[32] = 2114;
    *(void *)&buf[34] = v25;
    _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_DEFAULT, "Will migrate %s database from version %ld to %ld (build version %{public}@)", buf, 0x2Au);
  }
  long long v160 = 0u;
  long long v161 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  v150 = a1;
  v26 = [a1 schemaProviders];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v158 objects:v163 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v159;
    if (v9) {
      v30 = "protected";
    }
    else {
      v30 = "unprotected";
    }
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v159 != v29) {
          objc_enumerationMutation(v26);
        }
        v32 = *(void **)(*((void *)&v158 + 1) + 8 * i);
        v33 = [(HDDatabaseMigrator *)v153 schemaManager];
        v34 = [v32 schemaName];
        uint64_t v35 = [v33 currentVersionForSchema:v34 protectionClass:v11 error:v155];

        if (v35 < 0)
        {

          uint64_t v68 = 1;
          id v5 = v142;
          int64_t v6 = v145;
          a3 = v155;
          a1 = v150;
LABEL_134:
          BOOL v18 = v147;
          int64_t v10 = v140;
          id v19 = v144;
          goto LABEL_155;
        }
        uint64_t v36 = [v32 currentSchemaVersionForProtectionClass:v11];
        if (v35 != v36)
        {
          uint64_t v37 = v36;
          _HKInitializeLogging();
          v38 = (void *)*MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
          {
            v39 = v38;
            v40 = [v32 schemaName];
            *(_DWORD *)buf = 136315906;
            *(void *)&buf[4] = v30;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v40;
            *(_WORD *)&buf[22] = 2048;
            *(void *)&buf[24] = v35;
            *(_WORD *)&buf[32] = 2048;
            *(void *)&buf[34] = v37;
            _os_log_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_DEFAULT, "Will migrate %s database schema '%{public}@' from version %ld to %ld", buf, 0x2Au);
          }
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v158 objects:v163 count:16];
    }
    while (v28);
  }

  [(HDDatabaseMigrator *)v153 addPrimaryMigrationSteps];
  a1 = v150;
  id v41 = [v150 schemaProviders];
  v42 = v153;
  v154 = v42;
  if (![v41 count])
  {

    a3 = v155;
    goto LABEL_68;
  }
  id v138 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  memset(v167, 0, sizeof(v167));
  long long v168 = 0u;
  long long v169 = 0u;
  obuint64_t j = v41;
  uint64_t v43 = [obj countByEnumeratingWithState:v167 objects:buf count:16];
  a3 = v155;
  if (!v43) {
    goto LABEL_52;
  }
  uint64_t v44 = v43;
  uint64_t v137 = **(void **)&v167[16];
  id v135 = v41;
  while (2)
  {
    for (uint64_t j = 0; j != v44; ++j)
    {
      if (**(void **)&v167[16] != v137) {
        objc_enumerationMutation(obj);
      }
      v46 = *(void **)(*(void *)&v167[8] + 8 * j);
      v47 = [v46 schemaName];
      if (!v47)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"Plugin '%@' provided no schema name.", v46);
LABEL_133:

        uint64_t v68 = 1;
        id v5 = v142;
        int64_t v6 = v145;
        goto LABEL_134;
      }
      v48 = [v138 objectForKeyedSubscript:v47];

      if (v48)
      {
        v116 = (void *)MEMORY[0x1E4F28C58];
        v117 = [v138 objectForKeyedSubscript:v47];
        objc_msgSend(v116, "hk_assignError:code:format:", a3, 3, @"Schema '%@' provided by both %@ and %@.", v47, v46, v117);

        v42 = v154;
        goto LABEL_133;
      }
      v49 = [(HDDatabaseMigrator *)v42 schemaManager];
      uint64_t v50 = [v49 currentVersionForSchema:v47 protectionClass:v11 error:a3];

      if (v50 < 0) {
        goto LABEL_133;
      }
      if (v50)
      {
        [v46 registerMigrationStepsForProtectionClass:v11 migrator:v42];
      }
      else
      {
        id v51 = v46;
        v52 = v42;
        if ([v150 isProtectedMigration]) {
          [v150 protectedDatabase];
        }
        else {
        v53 = [v150 unprotectedDatabase];
        }
        *(void *)v170 = MEMORY[0x1E4F143A8];
        *(void *)&v170[8] = 3221225472;
        *(void *)&v170[16] = __106__HDDatabaseMigrationTransaction_Schema___createEntitiesForSchemaProvider_protectionClass_migrator_error___block_invoke;
        *(void *)&v170[24] = &unk_1E62FAEB8;
        id v54 = v51;
        *((void *)&v172 + 1) = v11;
        *(void *)&long long v171 = v54;
        *((void *)&v171 + 1) = v150;
        v55 = v52;
        *(void *)&long long v172 = v55;
        int v56 = [v53 performTransactionWithType:1 error:v155 usingBlock:v170];

        a3 = v155;
        v42 = v154;
        if (!v56) {
          goto LABEL_133;
        }
        _HKInitializeLogging();
        v57 = (void *)*MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
        {
          v58 = v57;
          uint64_t v59 = [v54 currentSchemaVersionForProtectionClass:v11];
          *(_DWORD *)v170 = 138543618;
          *(void *)&v170[4] = v47;
          *(_WORD *)&v170[12] = 2048;
          *(void *)&v170[14] = v59;
          _os_log_impl(&dword_1BCB7D000, v58, OS_LOG_TYPE_DEFAULT, "Created entities for '%{public}@' at version %ld", v170, 0x16u);
        }
      }
    }
    id v41 = v135;
    uint64_t v44 = [obj countByEnumeratingWithState:v167 objects:buf count:16];
    if (v44) {
      continue;
    }
    break;
  }
LABEL_52:

LABEL_68:
  id v69 = 0;
  uint64_t v68 = 3;
  int64_t v6 = v145;
  BOOL v18 = v147;
LABEL_69:
  v70 = v69;
  id v19 = v144;
  while (v68 == 3)
  {
    id v157 = v70;
    uint64_t v68 = [(HDDatabaseMigrator *)v154 migrateFromVersion:v152 toVersion:v149 error:&v157];
    id v69 = v157;

    v70 = v69;
    if (!v68)
    {

      v71 = [v150 schemaProviders];
      id v156 = 0;
      BOOL v72 = -[HDDatabaseMigrationTransaction _migrationRequiredForProtectionClass:migrator:schemaProviders:error:](v11, v154, v71, &v156);
      id v144 = v156;

      uint64_t v68 = 0;
      if (!v72 && v144)
      {
        _HKInitializeLogging();
        v73 = *MEMORY[0x1E4F29F18];
        uint64_t v68 = 1;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1BCB7D000, v73, OS_LOG_TYPE_ERROR, "Migration step indicated success but failed to increment the user version. This will be reported as a failure.", buf, 2u);
          uint64_t v68 = 1;
        }
      }
      goto LABEL_69;
    }
  }
  v139 = v70;
  if (v68)
  {
    id v113 = v70;
    id v5 = v142;
    v114 = (os_log_t *)MEMORY[0x1E4F29F18];
    if (v113)
    {
      if (a3) {
        *a3 = v113;
      }
      else {
        _HKLogDroppedError();
      }
    }

    _HKInitializeLogging();
    v119 = *v114;
    if (os_log_type_enabled(*v114, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v68;
      *(_WORD *)&buf[8] = 2048;
      *(void *)&buf[10] = v152;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = v149;
      *(_WORD *)&buf[28] = 2114;
      *(void *)&buf[30] = v113;
      _os_log_error_impl(&dword_1BCB7D000, v119, OS_LOG_TYPE_ERROR, "Migrator returned %d for migration from %ld to %ld: %{public}@", buf, 0x26u);
    }
    _HKInitializeLogging();
    v120 = *v114;
    if (os_log_type_enabled(*v114, OS_LOG_TYPE_INFO))
    {
      v121 = "unprotected";
      if (v141) {
        v121 = "protected";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v121;
      _os_log_impl(&dword_1BCB7D000, v120, OS_LOG_TYPE_INFO, "Finished %s database migration with success=NO", buf, 0xCu);
    }
    a3 = v155;
  }
  else
  {
    uint64_t v74 = [v140 userVersionWithDatabaseName:0 error:a3];
    _HKInitializeLogging();
    v75 = *MEMORY[0x1E4F29F18];
    id v5 = v142;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v74;
      _os_log_impl(&dword_1BCB7D000, v75, OS_LOG_TYPE_DEFAULT, "Finished database migration with success=YES, version %ld", buf, 0xCu);
    }
    if (v74 < 0)
    {
      uint64_t v68 = 1;
    }
    else
    {
      if (v74 != v149)
      {
        _HKInitializeLogging();
        v76 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&buf[4] = v149;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v74;
          _os_log_fault_impl(&dword_1BCB7D000, v76, OS_LOG_TYPE_FAULT, "Database migration returned success but failed to update user version to current version (expected %ld but final version is %ld)", buf, 0x16u);
        }
      }
      long long v171 = 0u;
      long long v172 = 0u;
      memset(v170, 0, sizeof(v170));
      v77 = [v150 schemaProviders];
      uint64_t v78 = [v77 countByEnumeratingWithState:v170 objects:buf count:16];
      if (v78)
      {
        uint64_t v79 = v78;
        uint64_t v68 = 0;
        uint64_t v80 = **(void **)&v170[16];
        do
        {
          for (uint64_t k = 0; k != v79; ++k)
          {
            if (**(void **)&v170[16] != v80) {
              objc_enumerationMutation(v77);
            }
            v82 = *(void **)(*(void *)&v170[8] + 8 * k);
            v83 = [(HDDatabaseMigrator *)v154 schemaManager];
            v84 = [v82 schemaName];
            uint64_t v85 = [v83 currentVersionForSchema:v84 protectionClass:v11 error:a3];

            if (v85 < 0) {
              uint64_t v68 = 1;
            }
            uint64_t v86 = [v82 currentSchemaVersionForProtectionClass:v11];
            if (v85 != v86)
            {
              uint64_t v87 = v86;
              _HKInitializeLogging();
              v88 = *MEMORY[0x1E4F29F18];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)v167 = 134218240;
                *(void *)&v167[4] = v87;
                *(_WORD *)&v167[12] = 2048;
                *(void *)&v167[14] = v85;
                _os_log_fault_impl(&dword_1BCB7D000, v88, OS_LOG_TYPE_FAULT, "Database migration returned success but failed to update user version to current version (expected %ld but final version is %ld)", v167, 0x16u);
              }
            }
            a3 = v155;
          }
          uint64_t v79 = [v77 countByEnumeratingWithState:v170 objects:buf count:16];
        }
        while (v79);
      }
      else
      {
        uint64_t v68 = 0;
      }

      id v5 = v142;
      id v19 = v144;
      int64_t v6 = v145;
      a1 = v150;
      BOOL v18 = v147;
    }
  }
  int64_t v10 = v140;
  [(HDDatabaseMigrator *)v154 invalidate];

LABEL_155:
  if (![a1 isProtectedMigration] || v68)
  {
LABEL_164:
    if (!v18) {
      goto LABEL_182;
    }
    goto LABEL_165;
  }
  v122 = [a1 protectedDatabase];
  char v123 = [v122 isWriter];

  if ((v123 & 1) == 0)
  {
    uint64_t v68 = 0;
    goto LABEL_164;
  }
  v124 = a1;
  v125 = [a1 protectedDatabase];
  *(void *)v163 = 0;
  v126 = +[HDKeyValueEntity retrieveDatabaseIdentifierFromDatabase:v125 error:v163];
  id v127 = *(id *)v163;

  if (!v126 && v127)
  {
    _HKInitializeLogging();
    v128 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v127;
      _os_log_impl(&dword_1BCB7D000, v128, OS_LOG_TYPE_INFO, "temporary SQL error reading identifiers: %{public}@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:underlyingError:", a3, 100, @"Retry: temporary SQL error reading identifiers", v127);
    v129 = 0;
    uint64_t v68 = 1;
    goto LABEL_174;
  }
  BOOL v148 = v18;
  v130 = [v124 unprotectedDatabase];
  *(void *)v170 = v127;
  v129 = +[HDKeyValueEntity retrieveDatabaseIdentifierFromDatabase:v130 error:v170];
  id v131 = *(id *)v170;

  if (v126 && v129 && ([v126 isEqualToData:v129] & 1) != 0)
  {

    uint64_t v68 = 0;
    a1 = v124;
    if (!v148) {
      goto LABEL_182;
    }
LABEL_165:
    -[HDDatabaseMigrationTransaction _enableIncrementalAutovacuumIfNeeded](a1);
    goto LABEL_182;
  }
  _HKInitializeLogging();
  v132 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v126;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v129;
    _os_log_error_impl(&dword_1BCB7D000, v132, OS_LOG_TYPE_ERROR, "FATAL: database identifiers do not match (protected: %{public}@, unprotected: %{public}@)", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a3, 100, @"Fatal: database identifiers did not match");
  v133 = [v124 delegate];
  [v133 migrationTransaction:v124 didEncounterDatabaseMismatchWithUnprotectedIdentifier:v129 protectedIdentifier:v126];

  uint64_t v68 = 2;
  id v127 = v131;
LABEL_174:

LABEL_182:
LABEL_183:

  return v68;
}

- (void)_enableIncrementalAutovacuumIfNeeded
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v1 = [a1 defaultDatabase];
  id v5 = 0;
  char v2 = [v1 enableIncrementalAutovacuumForDatabaseWithName:0 error:&v5];
  id v3 = v5;

  if ((v2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v4 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v7 = v3;
      _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "Failed to enable autovacuum for database: %{public}@", buf, 0xCu);
    }
  }
}

BOOL __81__HDDatabaseMigrationTransaction_Schema___createEntitiesWithEntityClasses_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 protectionClass] == *(void *)(a1 + 32);
}

- (uint64_t)_createDataTablesInDatabase:(uint64_t)a1 entityClasses:(void *)a2 requiredPrefix:(void *)a3 error:(void *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    obuint64_t j = v8;
    uint64_t v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(obj);
          }
          id v18 = v9;
          id v19 = v7;
          int v14 = HKWithAutoreleasePool();

          if (!v14)
          {
            uint64_t v15 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      uint64_t v15 = 1;
    }
    else
    {
      uint64_t v15 = 1;
    }
LABEL_13:
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t __105__HDDatabaseMigrationTransaction_Schema___createDataTablesInDatabase_entityClasses_requiredPrefix_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = *(void **)(a1 + 56);
  id v5 = [*(id *)(a1 + 32) behavior];
  int64_t v6 = [v4 createTableSQLWithBehavior:v5];

  if (v6)
  {
    if (*(void *)(a1 + 40))
    {
      id v7 = [*(id *)(a1 + 56) databaseTable];
      char v8 = [v7 hasPrefix:*(void *)(a1 + 40)];

      if ((v8 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a2, 3, @"Entity '%@' missing required prefix '%@'", *(void *)(a1 + 56), *(void *)(a1 + 40));
        goto LABEL_26;
      }
    }
    if (![*(id *)(a1 + 48) executeUncachedSQL:v6 error:a2 bindingHandler:0 enumerationHandler:0])
    {
LABEL_26:
      uint64_t v31 = 0;
      goto LABEL_27;
    }
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v9 = *(void **)(a1 + 56);
  uint64_t v10 = [*(id *)(a1 + 32) behavior];
  uint64_t v11 = [v9 indicesWithBehavior:v10];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v38;
LABEL_7:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v38 != v14) {
        objc_enumerationMutation(v11);
      }
      v16 = *(void **)(*((void *)&v37 + 1) + 8 * v15);
      if ([v16 entityClass] == *(void *)(a1 + 56))
      {
        uint64_t v17 = [v16 creationSQL];
        int v18 = [*(id *)(a1 + 48) executeUncachedSQL:v17 error:a2 bindingHandler:0 enumerationHandler:0];

        if (!v18) {
          goto LABEL_24;
        }
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
        if (v13) {
          goto LABEL_7;
        }
        break;
      }
    }
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v19 = *(void **)(a1 + 56);
  long long v20 = [*(id *)(a1 + 32) behavior];
  uint64_t v11 = [v19 triggersWithBehavior:v20];

  uint64_t v21 = [v11 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v34;
LABEL_16:
    uint64_t v24 = 0;
    while (1)
    {
      if (*(void *)v34 != v23) {
        objc_enumerationMutation(v11);
      }
      uint64_t v25 = *(void **)(*((void *)&v33 + 1) + 8 * v24);
      if ([v25 entityClass] == *(void *)(a1 + 56))
      {
        v26 = [v25 creationSQL];
        int v27 = [*(id *)(a1 + 48) executeUncachedSQL:v26 error:a2];

        if (!v27) {
          break;
        }
      }
      if (v22 == ++v24)
      {
        uint64_t v22 = [v11 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v22) {
          goto LABEL_16;
        }
        goto LABEL_23;
      }
    }
LABEL_24:

    goto LABEL_26;
  }
LABEL_23:

  uint64_t v28 = *(void *)(a1 + 32);
  uint64_t v29 = *(void *)(a1 + 48);
  v30 = [*(id *)(a1 + 56) privateSubEntities];
  uint64_t v31 = -[HDDatabaseMigrationTransaction _createDataTablesInDatabase:entityClasses:requiredPrefix:error:](v28, v29, v30, *(void *)(a1 + 40), a2);

LABEL_27:
  return v31;
}

uint64_t __106__HDDatabaseMigrationTransaction_Schema___createEntitiesForSchemaProvider_protectionClass_migrator_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v7 = a2;
  char v8 = [v5 databaseEntitiesForProtectionClass:v6];
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = [*(id *)(a1 + 32) schemaName];
  LODWORD(v9) = -[HDDatabaseMigrationTransaction _createDataTablesInDatabase:entityClasses:requiredPrefix:error:](v9, v7, v8, v10);

  if (v9)
  {
    uint64_t v11 = [*(id *)(a1 + 48) schemaManager];
    uint64_t v12 = [*(id *)(a1 + 32) currentSchemaVersionForProtectionClass:*(void *)(a1 + 56)];
    uint64_t v13 = [*(id *)(a1 + 32) schemaName];
    uint64_t v14 = [v11 setVersion:v12 schema:v13 protectionClass:*(void *)(a1 + 56) error:a3];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (void)_presentRollbackAlertForSchema:(void *)a1 protectionClass:(uint64_t)a2 foundVersion:(uint64_t)a3 currentVersion:(uint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  _HKInitializeLogging();
  char v8 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = "main";
    if (a2 == 2) {
      uint64_t v11 = "protected";
    }
    *(_DWORD *)uint64_t v13 = 136315906;
    *(void *)&v13[4] = v11;
    uint64_t v12 = @"<primary>";
    *(_WORD *)&v13[12] = 2114;
    if (v7) {
      uint64_t v12 = v7;
    }
    *(void *)&v13[14] = v12;
    __int16 v14 = 2048;
    uint64_t v15 = a3;
    __int16 v16 = 2048;
    uint64_t v17 = a4;
    _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "Detected attempt to rollback %s database (schema: %{public}@) from a newer build (Found version %ld but current version is %ld); failing migration.",
      v13,
      0x2Au);
  }
  if (objc_msgSend(MEMORY[0x1E4F2B860], "isAppleInternalInstall", *(_OWORD *)v13)
    && (_presentRollbackAlertForSchema_protectionClass_foundVersion_currentVersion__isPresenting & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    if ([v9 BOOLForKey:@"HDHasPresentedRollbackWarningDialog"])
    {
LABEL_7:

      goto LABEL_8;
    }
    char v10 = [MEMORY[0x1E4F2B860] isTestingDevice];

    if ((v10 & 1) == 0)
    {
      _presentRollbackAlertForSchema_protectionClass_foundVersion_currentVersion__isPresenting = 1;
      id v9 = objc_alloc_init(MEMORY[0x1E4F65D98]);
      [v9 setTitle:@"Health DB Version Mismatch"];
      [v9 setMessage:@"Your Health database appears to be from a newer build. Rolling back to earlier builds is not supported, and Health apps will not be functional."];
      [v9 setDefaultButton:@"OK"];
      [v9 presentWithResponseHandler:&__block_literal_global_62];
      goto LABEL_7;
    }
  }
LABEL_8:
}

void __117__HDDatabaseMigrationTransaction_Schema___presentRollbackAlertForSchema_protectionClass_foundVersion_currentVersion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _presentRollbackAlertForSchema_protectionClass_foundVersion_currentVersion__isPresenting = 0;
  if (!a4)
  {
    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v4 setBool:1 forKey:@"HDHasPresentedRollbackWarningDialog"];
  }
}

- (BOOL)_migrationRequiredForProtectionClass:(uint64_t)a1 migrator:(void *)a2 schemaProviders:(void *)a3 error:(void *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = [v7 schemaManager];
  unint64_t v10 = [v9 currentVersionForSchema:0 protectionClass:a1 error:a4];

  if ((v10 & 0x8000000000000000) != 0)
  {
LABEL_28:
    BOOL v17 = 0;
    goto LABEL_29;
  }
  uint64_t v11 = [v7 behavior];
  int v12 = [v11 futureMigrationsEnabled];
  uint64_t v13 = 100002;
  if (a1 == 2) {
    uint64_t v13 = 100017;
  }
  uint64_t v14 = 18201;
  if (a1 == 2) {
    uint64_t v14 = 18006;
  }
  if (v12) {
    unint64_t v15 = v13;
  }
  else {
    unint64_t v15 = v14;
  }

  if (v10 > v15)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_databaseSchemaRolledBackError");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      if (a4) {
        *a4 = v16;
      }
      else {
        _HKLogDroppedError();
      }
    }

    -[HDDatabaseMigrationTransaction _presentRollbackAlertForSchema:protectionClass:foundVersion:currentVersion:](0, a1, v10, v15);
    goto LABEL_28;
  }
  if (v10 >= v15)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obuint64_t j = v8;
    uint64_t v18 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v34;
      id v31 = v8;
      while (2)
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v34 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void **)(*((void *)&v33 + 1) + 8 * v21);
          uint64_t v23 = objc_msgSend(v7, "schemaManager", v31);
          uint64_t v24 = [v22 schemaName];
          uint64_t v25 = [v23 currentVersionForSchema:v24 protectionClass:a1 error:a4];

          BOOL v17 = v25 >= 0;
          if (v25 < 0) {
            goto LABEL_35;
          }
          uint64_t v26 = [v22 currentSchemaVersionForProtectionClass:a1];
          if (v25 > v26)
          {
            uint64_t v28 = v26;
            objc_msgSend(MEMORY[0x1E4F28C58], "hk_databaseSchemaRolledBackError");
            id v29 = (id)objc_claimAutoreleasedReturnValue();
            if (v29)
            {
              if (a4) {
                *a4 = v29;
              }
              else {
                _HKLogDroppedError();
              }
            }

            v30 = [v22 schemaName];
            -[HDDatabaseMigrationTransaction _presentRollbackAlertForSchema:protectionClass:foundVersion:currentVersion:](v30, a1, v25, v28);

            BOOL v17 = 0;
LABEL_35:

            id v8 = v31;
            goto LABEL_29;
          }
          if (v25 < v26) {
            goto LABEL_35;
          }
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
        id v8 = v31;
        if (v19) {
          continue;
        }
        break;
      }
    }

    goto LABEL_28;
  }
  BOOL v17 = 1;
LABEL_29:

  return v17;
}

@end