@interface CXCallDirectoryStoreMigrator
- (CXCallDirectoryStore)store;
- (CXCallDirectoryStoreMigrator)init;
- (id)_performMigrationsStartingAtSchemaVersion:(int64_t)a3 error:(id *)a4;
- (id)performMigrationsWithError:(id *)a3;
- (id)retrieveExtensionBlock;
- (id)storeCreationBlock;
- (void)setRetrieveExtensionBlock:(id)a3;
- (void)setStore:(id)a3;
- (void)setStoreCreationBlock:(id)a3;
@end

@implementation CXCallDirectoryStoreMigrator

- (CXCallDirectoryStoreMigrator)init
{
  v7.receiver = self;
  v7.super_class = (Class)CXCallDirectoryStoreMigrator;
  v2 = [(CXCallDirectoryStoreMigrator *)&v7 init];
  v3 = v2;
  if (v2)
  {
    id storeCreationBlock = v2->_storeCreationBlock;
    v2->_id storeCreationBlock = &__block_literal_global_7;

    id retrieveExtensionBlock = v3->_retrieveExtensionBlock;
    v3->_id retrieveExtensionBlock = &__block_literal_global_3;
  }
  return v3;
}

id __36__CXCallDirectoryStoreMigrator_init__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [[CXCallDirectoryStore alloc] initForReadingAndWritingWithError:a2];

  return v2;
}

uint64_t __36__CXCallDirectoryStoreMigrator_init__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [MEMORY[0x1E4F28C70] extensionWithIdentifier:a2 error:a3];
}

- (id)performMigrationsWithError:(id *)a3
{
  v5 = [(CXCallDirectoryStoreMigrator *)self storeCreationBlock];
  v6 = ((void (**)(void, id *))v5)[2](v5, a3);
  [(CXCallDirectoryStoreMigrator *)self setStore:v6];

  objc_super v7 = [(CXCallDirectoryStoreMigrator *)self store];

  if (!v7
    || ([(CXCallDirectoryStoreMigrator *)self store],
        v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 schemaVersion],
        v8,
        v9 == -1))
  {
    v10 = 0;
  }
  else
  {
    v10 = [(CXCallDirectoryStoreMigrator *)self _performMigrationsStartingAtSchemaVersion:v9 error:a3];
  }

  return v10;
}

- (id)_performMigrationsStartingAtSchemaVersion:(int64_t)a3 error:(id *)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  objc_super v7 = objc_alloc_init(CXCallDirectoryStoreMigrationResult);
  [(CXCallDirectoryStoreMigrationResult *)v7 setStartingSchemaVersion:a3];
  [(CXCallDirectoryStoreMigrationResult *)v7 setEndingSchemaVersion:5];
  [(CXCallDirectoryStoreMigrationResult *)v7 setRequiresExtensionDisablement:0];
  [(CXCallDirectoryStoreMigrationResult *)v7 setRequiresExtensionSynchronization:0];
  switch(a3)
  {
    case -1:
    case 0:
    case 1:
      v8 = [(CXCallDirectoryStoreMigrator *)self store];
      p_super = [v8 url];

      [(CXCallDirectoryStoreMigrator *)self setStore:0];
      v10 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v11 = [v10 removeItemAtURL:p_super error:a4];

      if (!v11) {
        goto LABEL_29;
      }
      v12 = CXDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v51 = (uint64_t)p_super;
        _os_log_impl(&dword_1A6E3A000, v12, OS_LOG_TYPE_DEFAULT, "Successfully removed DB at URL %@", buf, 0xCu);
      }

      v13 = [(CXCallDirectoryStoreMigrator *)self storeCreationBlock];
      v14 = ((void (**)(void, id *))v13)[2](v13, a4);
      [(CXCallDirectoryStoreMigrator *)self setStore:v14];

      v15 = [(CXCallDirectoryStoreMigrator *)self store];

      if (!v15) {
        goto LABEL_29;
      }
      [(CXCallDirectoryStoreMigrationResult *)v7 setRequiresExtensionDisablement:1];
      [(CXCallDirectoryStoreMigrationResult *)v7 setRequiresExtensionSynchronization:1];

      goto LABEL_7;
    case 2:
LABEL_7:
      v16 = [(CXCallDirectoryStoreMigrator *)self store];
      v17 = [v16 database];
      p_super = [v17 namesOfColumnsInTableWithName:@"Extension" error:a4];

      if (!p_super)
      {
        v18 = v7;
        goto LABEL_32;
      }
      if (([p_super containsObject:@"state"] & 1) == 0)
      {
        v18 = objc_msgSend(NSString, "stringWithFormat:", @"ALTER TABLE Extension ADD COLUMN state INTEGER NOT NULL DEFAULT %ld", 1);
        v19 = [(CXCallDirectoryStoreMigrator *)self store];
        v20 = [v19 database];
        int v21 = [v20 executeSQL:v18 error:a4];

        if (v21)
        {

          goto LABEL_11;
        }

LABEL_32:
        goto LABEL_33;
      }
LABEL_11:
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __80__CXCallDirectoryStoreMigrator__performMigrationsStartingAtSchemaVersion_error___block_invoke;
      v49[3] = &unk_1E5CAE170;
      v49[4] = self;
      v22 = (void *)MEMORY[0x1AD0C5BA0](v49);
      v23 = [(CXCallDirectoryStoreMigrator *)self store];
      v24 = [v23 database];
      int v25 = [v24 selectSQL:@"SELECT id, bundle_id FROM Extension", MEMORY[0x1E4F1CBF0], 2, v22, a4 withBindings expectedColumnCount resultRowHandler error];

      if (v25
        && ([(CXCallDirectoryStoreMigrator *)self store],
            v26 = objc_claimAutoreleasedReturnValue(),
            [v26 database],
            v27 = objc_claimAutoreleasedReturnValue(),
            char v28 = [v27 executeSQL:@"UPDATE SchemaVersion SET version = ?" withBindings:&unk_1EFC36D88 error:a4], v27, v26, (v28 & 1) != 0))
      {
        int v29 = 1;
      }
      else
      {

        int v29 = 0;
        objc_super v7 = 0;
      }

      if (!v29) {
        goto LABEL_25;
      }
LABEL_17:
      v30 = [(CXCallDirectoryStoreMigrator *)self store];
      v31 = [v30 database];
      p_super = [v31 namesOfColumnsInTableWithName:@"Extension" error:a4];

      if (!p_super) {
        goto LABEL_29;
      }
      if (([p_super containsObject:@"state_last_modified"] & 1) == 0)
      {
        v32 = [(CXCallDirectoryStoreMigrator *)self store];
        v33 = [v32 database];
        int v34 = [v33 executeSQL:@"ALTER TABLE Extension ADD COLUMN state_last_modified REAL NOT NULL DEFAULT 0.0" error:a4];

        if (!v34) {
          goto LABEL_29;
        }
      }
      v35 = [(CXCallDirectoryStoreMigrator *)self store];
      v36 = [v35 database];
      int v37 = [v36 executeSQL:@"UPDATE Extension SET state_last_modified = ((julianday('now') - 2440587.5)*86400.0)" error:a4];

      if (!v37
        || ([(CXCallDirectoryStoreMigrator *)self store],
            v38 = objc_claimAutoreleasedReturnValue(),
            [v38 database],
            v39 = objc_claimAutoreleasedReturnValue(),
            char v40 = [v39 executeSQL:@"UPDATE SchemaVersion SET version = ?" withBindings:&unk_1EFC36DA0 error:a4], v39, v38, (v40 & 1) == 0))
      {
LABEL_29:

LABEL_33:
        objc_super v7 = 0;
LABEL_34:

        goto LABEL_35;
      }

LABEL_23:
      v41 = [(CXCallDirectoryStoreMigrator *)self store];
      v42 = [v41 database];
      int v43 = [v42 executeSQL:@"CREATE INDEX idx_PhoneNumberIdentificationEntry_FK_Label ON PhoneNumberIdentificationEntry(label_id)" error:a4];

      if (!v43
        || ([(CXCallDirectoryStoreMigrator *)self store],
            v44 = objc_claimAutoreleasedReturnValue(),
            [v44 database],
            v45 = objc_claimAutoreleasedReturnValue(),
            int v46 = [v45 executeSQL:@"UPDATE SchemaVersion SET version = ?" withBindings:&unk_1EFC36DB8 error:a4], v45, v44, !v46))
      {
        p_super = &v7->super;
        goto LABEL_33;
      }
LABEL_25:
      if (v7)
      {
        uint64_t v47 = [(CXCallDirectoryStoreMigrationResult *)v7 startingSchemaVersion];
        if (v47 < [(CXCallDirectoryStoreMigrationResult *)v7 endingSchemaVersion])
        {
          p_super = CXDefaultLog();
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v51 = 5;
            _os_log_impl(&dword_1A6E3A000, p_super, OS_LOG_TYPE_DEFAULT, "Successfully migrated to schema version %ld", buf, 0xCu);
          }
          goto LABEL_34;
        }
      }
LABEL_35:
      return v7;
    case 3:
      goto LABEL_17;
    case 4:
      goto LABEL_23;
    default:
      goto LABEL_25;
  }
}

void __80__CXCallDirectoryStoreMigrator__performMigrationsStartingAtSchemaVersion_error___block_invoke(uint64_t a1, void *a2)
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 objectAtIndexedSubscript:0];
  uint64_t v5 = [v4 longLongValue];

  v6 = [v3 objectAtIndexedSubscript:1];

  objc_super v7 = [*(id *)(a1 + 32) retrieveExtensionBlock];
  id v18 = 0;
  v8 = ((void (**)(void, void *, id *))v7)[2](v7, v6, &v18);
  id v9 = v18;

  if (!v8)
  {
    v16 = CXDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __80__CXCallDirectoryStoreMigrator__performMigrationsStartingAtSchemaVersion_error___block_invoke_cold_1((uint64_t)v6, (uint64_t)v9, v16);
    }
    id v15 = v9;
    goto LABEL_9;
  }
  if ([v8 isEnabledViaPlugInKit])
  {
    v10 = [*(id *)(a1 + 32) store];
    int v11 = [v10 database];
    v25[0] = &unk_1EFC36D28;
    v12 = [NSNumber numberWithLongLong:v5];
    v25[1] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    id v17 = v9;
    char v14 = [v11 executeSQL:@"UPDATE Extension SET state = ? WHERE (id = ?)" withBindings:v13 error:&v17];
    id v15 = v17;

    if (v14)
    {
LABEL_10:
      id v9 = v15;
      goto LABEL_11;
    }
    v16 = CXDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v20 = v6;
      __int16 v21 = 2048;
      uint64_t v22 = v5;
      __int16 v23 = 2112;
      id v24 = v15;
      _os_log_error_impl(&dword_1A6E3A000, v16, OS_LOG_TYPE_ERROR, "Error setting state to Enabled for extension with identifier '%@' (ID %lld): %@", buf, 0x20u);
    }
LABEL_9:

    goto LABEL_10;
  }
LABEL_11:
}

- (CXCallDirectoryStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (id)storeCreationBlock
{
  return self->_storeCreationBlock;
}

- (void)setStoreCreationBlock:(id)a3
{
}

- (id)retrieveExtensionBlock
{
  return self->_retrieveExtensionBlock;
}

- (void)setRetrieveExtensionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_retrieveExtensionBlock, 0);
  objc_storeStrong(&self->_storeCreationBlock, 0);

  objc_storeStrong((id *)&self->_store, 0);
}

void __80__CXCallDirectoryStoreMigrator__performMigrationsStartingAtSchemaVersion_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A6E3A000, log, OS_LOG_TYPE_ERROR, "Error retrieving NSExtension with identifier '%@': %@. Not migrating enabled status", (uint8_t *)&v3, 0x16u);
}

@end