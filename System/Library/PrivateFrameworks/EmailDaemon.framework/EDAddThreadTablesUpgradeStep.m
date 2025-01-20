@interface EDAddThreadTablesUpgradeStep
+ (EFSQLTableSchema)threadMailboxesTableSchema;
+ (EFSQLTableSchema)threadRecipientsTableSchema;
+ (EFSQLTableSchema)threadScopesTableSchema;
+ (EFSQLTableSchema)threadSendersTableSchema;
+ (EFSQLTableSchema)threadsTableSchema;
+ (id)_schemaWithMessagesTable:(id)a3 mailboxesTable:(id)a4 conversationsTable:(id)a5;
+ (int)runWithConnection:(id)a3;
@end

@implementation EDAddThreadTablesUpgradeStep

+ (id)_schemaWithMessagesTable:(id)a3 mailboxesTable:(id)a4 conversationsTable:(id)a5
{
  v25[5] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v22 = a5;
  v10 = [a1 threadScopesTableSchema];
  v11 = [a1 threadsTableSchema];
  v12 = [a1 threadMailboxesTableSchema];
  v13 = [a1 threadSendersTableSchema];
  v14 = [a1 threadRecipientsTableSchema];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__EDAddThreadTablesUpgradeStep__schemaWithMessagesTable_mailboxesTable_conversationsTable___block_invoke_2;
  aBlock[3] = &unk_1E6BFF250;
  id v24 = &__block_literal_global_0;
  v15 = (void (**)(void *, void *, __CFString *, id))_Block_copy(aBlock);
  v15[2](v15, v10, @"mailbox", v9);
  v15[2](v15, v11, @"scope", v10);
  uint64_t v16 = ((uint64_t (*)(void *, void *, __CFString *, id))v15[2])(v15, v11, @"conversation", v22);
  __91__EDAddThreadTablesUpgradeStep__schemaWithMessagesTable_mailboxesTable_conversationsTable___block_invoke(v16, v11, @"newest_read_message", v8, 3);
  __91__EDAddThreadTablesUpgradeStep__schemaWithMessagesTable_mailboxesTable_conversationsTable___block_invoke(v17, v11, @"display_message", v8, 3);
  v15[2](v15, v12, @"thread", v11);
  v15[2](v15, v12, @"mailbox", v9);
  v15[2](v15, v13, @"thread", v11);
  v15[2](v15, v14, @"thread", v11);
  id v18 = objc_alloc(MEMORY[0x1E4F60EF0]);
  v25[0] = v10;
  v25[1] = v11;
  v25[2] = v12;
  v25[3] = v13;
  v25[4] = v14;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:5];
  v20 = (void *)[v18 initWithTables:v19];

  return v20;
}

void __91__EDAddThreadTablesUpgradeStep__schemaWithMessagesTable_mailboxesTable_conversationsTable___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v9 = a4;
  id v8 = [a2 columnForName:a3];
  [v8 setAsForeignKeyForTable:v9 onDelete:a5 onUpdate:0];
}

uint64_t __91__EDAddThreadTablesUpgradeStep__schemaWithMessagesTable_mailboxesTable_conversationsTable___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (EFSQLTableSchema)threadScopesTableSchema
{
  v84[5] = *MEMORY[0x1E4F143B8];
  v70 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"mailbox" nullable:1];
  v67 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"mailbox_type" nullable:1];
  v68 = [MEMORY[0x1E4F60E80] blobColumnWithName:@"filter_predicate" nullable:1];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v84[0] = v70;
  v84[1] = v67;
  v84[2] = v68;
  v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"needs_update" nullable:0 defaultValue:&unk_1F35BAB38];
  v84[3] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"last_viewed" nullable:0 defaultValue:&unk_1F35BAB38];
  v84[4] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:5];
  v6 = (void *)[v2 initWithName:@"thread_scopes" rowIDType:2 columns:v5];

  v69 = [v70 columnExpression];
  v66 = [v67 columnExpression];
  v65 = [v68 columnExpression];
  id v7 = objc_alloc(MEMORY[0x1E4F60E48]);
  id v8 = [v69 isNotNull];
  v83[0] = v8;
  id v9 = [v66 isNull];
  v83[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v83 count:2];
  v64 = (void *)[v7 initWithExpressions:v10];

  id v11 = objc_alloc(MEMORY[0x1E4F60E48]);
  v12 = [v69 isNull];
  v82[0] = v12;
  v13 = [v66 isNotNull];
  v82[1] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:2];
  v63 = (void *)[v11 initWithExpressions:v14];

  id v15 = objc_alloc(MEMORY[0x1E4F60ED8]);
  v81[0] = v64;
  v81[1] = v63;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];
  v62 = (void *)[v15 initWithExpressions:v16];

  [v6 addCheckConstraintForExpression:v62];
  id v17 = objc_alloc(MEMORY[0x1E4F60E48]);
  id v18 = [v69 isNotNull];
  v80[0] = v18;
  v19 = [v65 isNull];
  v80[1] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:2];
  v21 = (void *)[v17 initWithExpressions:v20];

  id v22 = objc_alloc(MEMORY[0x1E4F60EB0]);
  v23 = [v6 name];
  id v24 = [v70 name];
  v79 = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
  v61 = (void *)[v22 initWithTableName:v23 columnNames:v25 where:v21 unique:1];

  [v6 addIndex:v61];
  id v26 = objc_alloc(MEMORY[0x1E4F60E48]);
  v27 = [v69 isNotNull];
  v78[0] = v27;
  v28 = [v65 isNotNull];
  v78[1] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:2];
  v30 = (void *)[v26 initWithExpressions:v29];

  id v31 = objc_alloc(MEMORY[0x1E4F60EB0]);
  v32 = [v6 name];
  v33 = [v70 name];
  v77[0] = v33;
  v34 = [v68 name];
  v77[1] = v34;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:2];
  v36 = (void *)[v31 initWithTableName:v32 columnNames:v35 where:v30 unique:1];

  [v6 addIndex:v36];
  id v37 = objc_alloc(MEMORY[0x1E4F60E48]);
  v38 = [v66 isNotNull];
  v76[0] = v38;
  v39 = [v65 isNull];
  v76[1] = v39;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:2];
  v41 = (void *)[v37 initWithExpressions:v40];

  id v42 = objc_alloc(MEMORY[0x1E4F60EB0]);
  v43 = [v6 name];
  v44 = [v67 name];
  v75 = v44;
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
  v46 = (void *)[v42 initWithTableName:v43 columnNames:v45 where:v41 unique:1];

  [v6 addIndex:v46];
  id v47 = objc_alloc(MEMORY[0x1E4F60E48]);
  v48 = [v66 isNotNull];
  v74[0] = v48;
  v49 = [v65 isNotNull];
  v74[1] = v49;
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:2];
  v51 = (void *)[v47 initWithExpressions:v50];

  id v52 = objc_alloc(MEMORY[0x1E4F60EB0]);
  v53 = [v6 name];
  v54 = [v67 name];
  v73[0] = v54;
  v55 = [v68 name];
  v73[1] = v55;
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:2];
  v57 = (void *)[v52 initWithTableName:v53 columnNames:v56 where:v51 unique:1];

  [v6 addIndex:v57];
  v72 = @"needs_update";
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
  [v6 addIndexForColumns:v58];

  v71 = @"last_viewed";
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
  [v6 addIndexForColumns:v59];

  return (EFSQLTableSchema *)v6;
}

+ (EFSQLTableSchema)threadsTableSchema
{
  v33[23] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v30 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"scope" nullable:0];
  v33[0] = v30;
  v29 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"conversation" nullable:0];
  v33[1] = v29;
  v28 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"newest_read_message" nullable:1];
  v33[2] = v28;
  v27 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"display_message" nullable:1];
  v33[3] = v27;
  id v26 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"date" nullable:0];
  v33[4] = v26;
  v25 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"read" nullable:0 defaultValue:&unk_1F35BAB38];
  v33[5] = v25;
  id v24 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"flagged" nullable:0 defaultValue:&unk_1F35BAB38];
  v33[6] = v24;
  v23 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_red_flag" nullable:0 defaultValue:&unk_1F35BAB38];
  v33[7] = v23;
  id v22 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_orange_flag" nullable:0 defaultValue:&unk_1F35BAB38];
  v33[8] = v22;
  v21 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_yellow_flag" nullable:0 defaultValue:&unk_1F35BAB38];
  v33[9] = v21;
  v20 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_green_flag" nullable:0 defaultValue:&unk_1F35BAB38];
  v33[10] = v20;
  v19 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_blue_flag" nullable:0 defaultValue:&unk_1F35BAB38];
  v33[11] = v19;
  id v18 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_purple_flag" nullable:0 defaultValue:&unk_1F35BAB38];
  v33[12] = v18;
  id v17 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_gray_flag" nullable:0 defaultValue:&unk_1F35BAB38];
  v33[13] = v17;
  uint64_t v16 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"draft" nullable:0 defaultValue:&unk_1F35BAB38];
  v33[14] = v16;
  v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"replied" nullable:0 defaultValue:&unk_1F35BAB38];
  v33[15] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"forwarded" nullable:0 defaultValue:&unk_1F35BAB38];
  v33[16] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"redirected" nullable:0 defaultValue:&unk_1F35BAB38];
  v33[17] = v5;
  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"junk_level_set_by_user" nullable:0 defaultValue:&unk_1F35BAB38];
  v33[18] = v6;
  id v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"junk_level" nullable:0 defaultValue:&unk_1F35BAB38];
  v33[19] = v7;
  id v8 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_unflagged" nullable:0 defaultValue:&unk_1F35BAB38];
  v33[20] = v8;
  id v9 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"has_attachments" nullable:0 defaultValue:&unk_1F35BAB38];
  v33[21] = v9;
  v10 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"count" nullable:0];
  v33[22] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:23];
  v12 = (void *)[v2 initWithName:@"threads" rowIDType:2 columns:v11];

  v32[0] = @"scope";
  v32[1] = @"conversation";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  [v12 addUniquenessConstraintForColumns:v13 conflictResolution:1];

  v31[0] = @"scope";
  v31[1] = @"date";
  v31[2] = @"conversation";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];
  [v12 addIndexForColumns:v14];

  return (EFSQLTableSchema *)v12;
}

+ (EFSQLTableSchema)threadMailboxesTableSchema
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"thread" nullable:0];
  v10[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"mailbox" nullable:0];
  v10[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  v9[0] = @"thread";
  v9[1] = @"mailbox";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v7 = (void *)[v2 initWithName:@"thread_mailboxes" columns:v5 primaryKeyColumns:v6];

  return (EFSQLTableSchema *)v7;
}

+ (EFSQLTableSchema)threadSendersTableSchema
{
  v16[4] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"thread" nullable:0];
  v16[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"address" nullable:0];
  v16[1] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"date" nullable:0];
  v16[2] = v5;
  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"priority" nullable:0 defaultValue:&unk_1F35BAB38];
  v16[3] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  v15[0] = @"thread";
  v15[1] = @"address";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  id v9 = (void *)[v2 initWithName:@"thread_senders" columns:v7 primaryKeyColumns:v8];

  v14[0] = @"address";
  v14[1] = @"thread";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  [v9 addIndexForColumns:v10];

  v13[0] = @"thread";
  v13[1] = @"priority";
  v13[2] = @"date";
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  [v9 addIndexForColumns:v11];

  return (EFSQLTableSchema *)v9;
}

+ (EFSQLTableSchema)threadRecipientsTableSchema
{
  v17[5] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"thread" nullable:0];
  v17[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"address" nullable:0];
  v17[1] = v4;
  v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"type" nullable:0];
  v17[2] = v5;
  v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"date" nullable:0];
  v17[3] = v6;
  id v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"priority" nullable:0 defaultValue:&unk_1F35BAB38];
  v17[4] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:5];
  v16[0] = @"thread";
  v16[1] = @"type";
  v16[2] = @"address";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
  v10 = (void *)[v2 initWithName:@"thread_recipients" columns:v8 primaryKeyColumns:v9];

  v15[0] = @"address";
  v15[1] = @"thread";
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [v10 addIndexForColumns:v11];

  v14[0] = @"thread";
  v14[1] = @"priority";
  void v14[2] = @"date";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
  [v10 addIndexForColumns:v12];

  return (EFSQLTableSchema *)v10;
}

+ (int)runWithConnection:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F60F08]);
  v6 = (void *)[v5 initWithName:@"messages" rowIDType:2 columns:MEMORY[0x1E4F1CBF0]];
  id v7 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v8 = (void *)[v7 initWithName:@"mailboxes" rowIDType:2 columns:MEMORY[0x1E4F1CBF0]];
  id v9 = objc_alloc(MEMORY[0x1E4F60F08]);
  v10 = (void *)[v9 initWithName:@"conversations" rowIDType:2 rowIDAlias:@"conversation_id" columns:MEMORY[0x1E4F1CBF0]];
  id v11 = [a1 _schemaWithMessagesTable:v6 mailboxesTable:v8 conversationsTable:v10];
  v12 = [v11 definitionWithDatabaseName:0];
  v13 = (sqlite3 *)[v4 sqlDB];
  id v14 = v12;
  LODWORD(v13) = sqlite3_exec(v13, (const char *)[v14 UTF8String], 0, 0, 0);

  return (int)v13;
}

@end