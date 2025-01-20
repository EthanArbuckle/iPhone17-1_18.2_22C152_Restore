@interface EDPersistenceDatabaseSchema
+ (EFSQLSchema)protectedSchema;
+ (EFSQLSchema)schema;
+ (id)_protectedSchemaProviders;
+ (id)_schemaProviders;
+ (id)_schemaWithPopulationBlock:(id)a3;
+ (id)additionalSchemaProviders;
+ (id)mailboxURLColumnName;
+ (id)mailboxesTableName;
+ (id)partialMailboxesTableSchema;
+ (id)propertiesTableName;
+ (id)propertiesTableSchema;
+ (void)_initializeSchemas;
+ (void)registerAdditionalPropertiesForPropertyMapper:(id)a3;
+ (void)test_resetSchema;
@end

@implementation EDPersistenceDatabaseSchema

+ (id)mailboxesTableName
{
  return @"mailboxes";
}

+ (void)test_resetSchema
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"EDPersistenceDatabaseSchema.m", 48, @"%s can only be called from unit tests", "+[EDPersistenceDatabaseSchema test_resetSchema]");
  }
  os_unfair_lock_lock((os_unfair_lock_t)&sSchemaLock);
  v4 = (void *)sSchema;
  sSchema = 0;

  v5 = (void *)sProtectedSchema;
  sProtectedSchema = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&sSchemaLock);
}

+ (EFSQLSchema)schema
{
  os_unfair_lock_lock((os_unfair_lock_t)&sSchemaLock);
  v3 = (void *)sSchema;
  if (!sSchema)
  {
    [a1 _initializeSchemas];
    v3 = (void *)sSchema;
  }
  id v4 = v3;
  os_unfair_lock_unlock((os_unfair_lock_t)&sSchemaLock);

  return (EFSQLSchema *)v4;
}

+ (EFSQLSchema)protectedSchema
{
  os_unfair_lock_lock((os_unfair_lock_t)&sSchemaLock);
  v3 = (void *)sProtectedSchema;
  if (!sProtectedSchema)
  {
    [a1 _initializeSchemas];
    v3 = (void *)sProtectedSchema;
  }
  id v4 = v3;
  os_unfair_lock_unlock((os_unfair_lock_t)&sSchemaLock);

  return (EFSQLSchema *)v4;
}

+ (void)_initializeSchemas
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __49__EDPersistenceDatabaseSchema__initializeSchemas__block_invoke;
  v21[3] = &unk_1E6C044D0;
  id v23 = a1;
  id v4 = v3;
  id v22 = v4;
  uint64_t v5 = [a1 _schemaWithPopulationBlock:v21];
  v6 = (void *)sSchema;
  sSchema = v5;

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __49__EDPersistenceDatabaseSchema__initializeSchemas__block_invoke_2;
  v20[3] = &__block_descriptor_40_e43_v24__0__NSMutableArray_8__NSMutableArray_16l;
  v20[4] = a1;
  uint64_t v7 = [a1 _schemaWithPopulationBlock:v20];
  v8 = (void *)sProtectedSchema;
  sProtectedSchema = v7;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (([v13 resolveWithSchema:sSchema] & 1) == 0
          && ([v13 resolveWithSchema:sProtectedSchema] & 1) == 0)
        {
          v14 = [MEMORY[0x1E4F28B00] currentHandler];
          [v14 handleFailureInMethod:a2, a1, @"EDPersistenceDatabaseSchema.m", 98, @"Unable to resolve association: %@", v13 object file lineNumber description];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v10);
  }
}

void __49__EDPersistenceDatabaseSchema__initializeSchemas__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [*(id *)(a1 + 40) _schemaProviders];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
        id v15 = 0;
        id v16 = 0;
        v12 = [v11 tablesAndForeignKeysToResolve:&v16 associationsToResolve:&v15];
        id v13 = v16;
        id v14 = v15;
        [v5 addObjectsFromArray:v12];
        [v6 addObjectsFromArray:v13];
        [*(id *)(a1 + 32) addObjectsFromArray:v14];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

void __49__EDPersistenceDatabaseSchema__initializeSchemas__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [*(id *)(a1 + 32) _protectedSchemaProviders];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        id v14 = 0;
        v12 = [v11 protectedTablesAndForeignKeysToResolve:&v14];
        id v13 = v14;
        [v5 addObjectsFromArray:v12];
        [v6 addObjectsFromArray:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

+ (id)_schemaWithPopulationBlock:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, id))a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4[2](v4, v5);
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F60EF0]) initWithTables:v5];
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = +[EDMessagePersistence messagesTableName];
  uint64_t v9 = [a1 mailboxesTableName];
  uint64_t v10 = objc_msgSend(v7, "initWithObjects:", v8, v9, 0);
  id v18 = a1;

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v20;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (([v15 resolveWithSchema:v6] & 1) == 0
          && ([v15 resolveToStringForTableNames:v10] & 1) == 0)
        {
          long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
          [v16 handleFailureInMethod:a2, v18, @"EDPersistenceDatabaseSchema.m", 112, @"Unable to resolve foreign key constraint: %@", v15 object file lineNumber description];
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  return v6;
}

+ (id)_schemaProviders
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  id v3 = objc_msgSend(a1, "additionalSchemaProviders", v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, objc_opt_class());
  id v18 = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:13];
  id v5 = objc_msgSend(v4, "ef_flatten");

  return v5;
}

+ (id)_protectedSchemaProviders
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];

  return v2;
}

+ (void)registerAdditionalPropertiesForPropertyMapper:(id)a3
{
  id v3 = a3;
  [v3 registerColumnName:@"ROWID" table:@"interaction_log" lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_eventID];
  [v3 registerColumnName:@"version" table:@"interaction_log" lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_version];
  [v3 registerColumnName:@"date" table:@"interaction_log" lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_date];
  [v3 registerColumnName:@"account" table:@"interaction_log" lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_accountID];
  [v3 registerColumnName:@"mailbox" table:@"interaction_log" lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_mailboxID];
  [v3 registerColumnName:@"conversation" table:@"interaction_log" lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_conversationID];
  [v3 registerColumnName:@"message_id_hash" table:@"interaction_log" lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_messageIDHash];
  [v3 registerColumnName:@"message" table:@"interaction_log" lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_messagePersistentID];
  [v3 registerColumnName:@"name" table:@"interaction_log" lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_name];
  [v3 registerColumnName:@"data" table:@"interaction_log" lookupKeys:MEMORY[0x1E4F1CC08] forClass:objc_opt_class() property:sel_data];
}

+ (id)propertiesTableName
{
  return @"properties";
}

+ (id)mailboxURLColumnName
{
  return @"url";
}

+ (id)propertiesTableSchema
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v4 = [a1 propertiesTableName];
  id v5 = [MEMORY[0x1E4F60E80] textColumnWithName:@"key" collation:1 nullable:0];
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F60E80] blobColumnWithName:@"value" nullable:0];
  v10[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  uint64_t v8 = (void *)[v3 initWithName:v4 rowIDType:1 columns:v7];

  [v8 addUniquenessConstraintForColumns:&unk_1F35BB4B0 conflictResolution:1];

  return v8;
}

+ (id)partialMailboxesTableSchema
{
  v12[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v4 = [a1 mailboxesTableName];
  id v5 = [MEMORY[0x1E4F60E80] textColumnWithName:@"url" collation:1 nullable:0];
  v12[0] = v5;
  id v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"total_count" nullable:0 defaultValue:&unk_1F35BAE38];
  v12[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"unread_count" nullable:0 defaultValue:&unk_1F35BAE38];
  v12[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"deleted_count" nullable:0 defaultValue:&unk_1F35BAE38];
  v12[3] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
  uint64_t v10 = (void *)[v3 initWithName:v4 rowIDType:2 columns:v9];

  [v10 addUniquenessConstraintForColumns:&unk_1F35BB4C8 conflictResolution:1];

  return v10;
}

+ (id)additionalSchemaProviders
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end