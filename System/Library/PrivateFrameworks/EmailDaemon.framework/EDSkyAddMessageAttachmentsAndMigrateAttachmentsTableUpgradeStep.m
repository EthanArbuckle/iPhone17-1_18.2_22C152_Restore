@interface EDSkyAddMessageAttachmentsAndMigrateAttachmentsTableUpgradeStep
+ (BOOL)createMessageAttachmentsTableWithConnection:(id)a3;
+ (BOOL)createNewAttachmentTableWithConnection:(id)a3;
+ (BOOL)createNewSearchableAttachmentsTable:(id)a3;
+ (BOOL)deleteAttachmentsTableWithConnection:(id)a3;
+ (BOOL)deleteMessageAttachmentsTableWithConnection:(id)a3;
+ (BOOL)insertAttachmentIntoAttachmentTableWithAttachmentMetadata:(id)a3 connection:(id)a4;
+ (BOOL)insertIntoMessageAttachmentTableGlobalMessageID:(id)a3 attachmentMetadata:(id)a4 attachmentID:(int64_t)a5 connection:(id)a6;
+ (OS_os_log)log;
+ (int)runWithConnection:(id)a3;
+ (int)runWithConnection:(id)a3 dataProvider:(id)a4;
@end

@implementation EDSkyAddMessageAttachmentsAndMigrateAttachmentsTableUpgradeStep

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__EDSkyAddMessageAttachmentsAndMigrateAttachmentsTableUpgradeStep_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_91 != -1) {
    dispatch_once(&log_onceToken_91, block);
  }
  v2 = (void *)log_log_91;

  return (OS_os_log *)v2;
}

void __70__EDSkyAddMessageAttachmentsAndMigrateAttachmentsTableUpgradeStep_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_91;
  log_log_91 = (uint64_t)v1;
}

+ (int)runWithConnection:(id)a3 dataProvider:(id)a4
{
  id v5 = a3;
  [a1 deleteAttachmentsTableWithConnection:v5];
  if ([a1 deleteMessageAttachmentsTableWithConnection:v5]
    && [a1 createMessageAttachmentsTableWithConnection:v5]
    && [a1 createNewAttachmentTableWithConnection:v5]
    && [v5 executeStatementString:@"DROP TABLE searchable_attachments" errorMessage:@"Removing searchable_attachments table"])
  {
    int v6 = [a1 createNewSearchableAttachmentsTable:v5];
  }
  else
  {
    int v6 = 0;
  }
  [v5 executeStatementString:@"INSERT INTO properties  (key, value) VALUES (\"NeedToMigrateAttachments\",1)", @"Setting need to upgrade property" errorMessage];

  return v6 ^ 1;
}

+ (int)runWithConnection:(id)a3
{
  return +[EDSkyAddMessageAttachmentsAndMigrateAttachmentsTableUpgradeStep runWithConnection:a3 dataProvider:0];
}

+ (BOOL)createNewAttachmentTableWithConnection:(id)a3
{
  v23[7] = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v3 = objc_alloc(MEMORY[0x1E4F60F08]);
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"size" nullable:0 defaultValue:&unk_1F35BB060];
  v23[0] = v4;
  id v5 = [MEMORY[0x1E4F60E80] textColumnWithName:@"hash" collation:1 nullable:1];
  v23[1] = v5;
  int v6 = [MEMORY[0x1E4F60E80] textColumnWithName:@"file_name_on_file_system" collation:1 nullable:1];
  v23[2] = v6;
  v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"viewed_count" nullable:0 defaultValue:&unk_1F35BB060];
  v23[3] = v7;
  v8 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"last_viewed" nullable:0 defaultValue:&unk_1F35BB060];
  v23[4] = v8;
  v9 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"viewed_by_tapped_count" nullable:0 defaultValue:&unk_1F35BB060];
  v23[5] = v9;
  v10 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"date_last_downloaded" nullable:0 defaultValue:&unk_1F35BB060];
  v23[6] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:7];
  v12 = (void *)[v3 initWithName:@"attachments" rowIDType:2 columns:v11];

  v22 = @"hash";
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  [v12 addUniquenessConstraintForColumns:v13 conflictResolution:1];

  id v14 = objc_alloc(MEMORY[0x1E4F60EF0]);
  v21 = v12;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v16 = (void *)[v14 initWithTables:v15];

  v17 = [v16 definitionWithDatabaseName:0];
  v18 = [NSString stringWithFormat:@"Unable to create %@", @"attachments"];
  LOBYTE(v5) = [v20 executeStatementString:v17 errorMessage:v18];

  return (char)v5;
}

+ (BOOL)deleteAttachmentsTableWithConnection:(id)a3
{
  id v3 = a3;
  v4 = [NSString stringWithFormat:@"DROP TABLE IF EXISTS %@", @"attachments"];
  id v5 = [NSString stringWithFormat:@"Unable to delete table %@", @"attachments"];
  char v6 = [v3 executeStatementString:v4 errorMessage:v5];

  return v6;
}

+ (BOOL)deleteMessageAttachmentsTableWithConnection:(id)a3
{
  id v3 = a3;
  v4 = [NSString stringWithFormat:@"DROP TABLE IF EXISTS %@", @"message_attachments"];
  id v5 = [NSString stringWithFormat:@"Unable to delete table %@", @"message_attachments"];
  char v6 = [v3 executeStatementString:v4 errorMessage:v5];

  return v6;
}

+ (BOOL)createMessageAttachmentsTableWithConnection:(id)a3
{
  v50[5] = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  v43 = [MEMORY[0x1E4F60E80] textColumnWithName:@"mime_part_number" collation:1 nullable:1];
  v42 = [MEMORY[0x1E4F60E80] textColumnWithName:@"remote_url" collation:1 nullable:1];
  id v3 = objc_alloc(MEMORY[0x1E4F60F08]);
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"global_message_id" nullable:0];
  v50[0] = v4;
  id v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"attachment" nullable:1];
  v50[1] = v5;
  char v6 = [MEMORY[0x1E4F60E80] textColumnWithName:@"name" collation:1 nullable:0];
  v50[2] = v6;
  v50[3] = v43;
  v50[4] = v42;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:5];
  v8 = (void *)[v3 initWithName:@"message_attachments" rowIDType:2 columns:v7];

  v49[0] = @"global_message_id";
  v49[1] = @"mime_part_number";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
  [v8 addUniquenessConstraintForColumns:v9 conflictResolution:1];

  v48[0] = @"global_message_id";
  v48[1] = @"remote_url";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
  [v8 addUniquenessConstraintForColumns:v10 conflictResolution:1];

  id v11 = objc_alloc(MEMORY[0x1E4F60E48]);
  v12 = [v43 columnExpression];
  v13 = [v12 isNotNull];
  v47[0] = v13;
  id v14 = [v42 columnExpression];
  v15 = [v14 isNull];
  v47[1] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
  v41 = (void *)[v11 initWithExpressions:v16];

  id v17 = objc_alloc(MEMORY[0x1E4F60E48]);
  v18 = [v43 columnExpression];
  v19 = [v18 isNull];
  v46[0] = v19;
  id v20 = [v42 columnExpression];
  v21 = [v20 isNotNull];
  v46[1] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
  v23 = (void *)[v17 initWithExpressions:v22];

  id v24 = objc_alloc(MEMORY[0x1E4F60ED8]);
  v45[0] = v41;
  v45[1] = v23;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  v26 = (void *)[v24 initWithExpressions:v25];

  [v8 addCheckConstraintForExpression:v26];
  id v27 = objc_alloc(MEMORY[0x1E4F60F08]);
  v28 = +[EDMessagePersistence messageGlobalDataTableName];
  v29 = (void *)[v27 initWithName:v28 rowIDType:2 columns:MEMORY[0x1E4F1CBF0]];

  v30 = [v8 columnForName:@"global_message_id"];
  [v30 setAsForeignKeyForTable:v29 onDelete:2 onUpdate:0];

  id v31 = objc_alloc(MEMORY[0x1E4F60F08]);
  v32 = (void *)[v31 initWithName:@"attachments" rowIDType:2 columns:MEMORY[0x1E4F1CBF0]];
  v33 = [v8 columnForName:@"attachment"];
  [v33 setAsForeignKeyForTable:v32 onDelete:0 onUpdate:0];

  id v34 = objc_alloc(MEMORY[0x1E4F60EF0]);
  v44 = v8;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
  v36 = (void *)[v34 initWithTables:v35];

  v37 = [v36 definitionWithDatabaseName:0];
  v38 = [NSString stringWithFormat:@"Unable to create %@", @"attachments"];
  LOBYTE(v30) = [v40 executeStatementString:v37 errorMessage:v38];

  return (char)v30;
}

+ (BOOL)createNewSearchableAttachmentsTable:(id)a3
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v5 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"attachment" nullable:1];
  v23[0] = v5;
  char v6 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"message_id" nullable:1];
  v23[1] = v6;
  v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"transaction_id" nullable:0];
  v23[2] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  v9 = (void *)[v4 initWithName:@"searchable_attachments" rowIDType:1 rowIDAlias:@"attachment_id" columns:v8];

  v22 = @"attachment";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  [v9 addIndexForColumns:v10];

  [v9 addIndexForColumns:&unk_1F35BB5A0];
  id v11 = objc_alloc(MEMORY[0x1E4F60F08]);
  v12 = (void *)[v11 initWithName:@"message_attachments" rowIDType:2 columns:MEMORY[0x1E4F1CBF0]];
  v13 = [v9 columnForName:@"attachment"];
  [v13 setAsForeignKeyForTable:v12 onDelete:3 onUpdate:0];

  id v14 = objc_alloc(MEMORY[0x1E4F60EF0]);
  v21 = v9;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v16 = (void *)[v14 initWithTables:v15];

  id v17 = [v16 definitionWithDatabaseName:0];
  v18 = [NSString stringWithFormat:@"Unable to create %@", @"searchable_attachments"];
  char v19 = [v3 executeStatementString:v17 errorMessage:v18];

  return v19;
}

+ (BOOL)insertIntoMessageAttachmentTableGlobalMessageID:(id)a3 attachmentMetadata:(id)a4 attachmentID:(int64_t)a5 connection:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"message_attachments" conflictResolution:4];
  [v12 setObject:v9 forKeyedSubscript:@"global_message_id"];
  v13 = [v10 name];
  [v12 setObject:v13 forKeyedSubscript:@"name"];

  id v14 = [v10 mimePartNumber];
  [v12 setObject:v14 forKeyedSubscript:@"mime_part_number"];

  if (*MEMORY[0x1E4F5FCC8] != a5)
  {
    v15 = [NSNumber numberWithLongLong:a5];
    [v12 setObject:v15 forKeyedSubscript:@"attachment"];
  }
  v16 = [v10 remoteURL];
  id v17 = v16;
  if (v16)
  {
    v18 = [v16 absoluteString];
    [v12 setObject:v18 forKeyedSubscript:@"remote_url"];
  }
  id v24 = 0;
  char v19 = [v11 executeInsertStatement:v12 error:&v24];
  id v20 = v24;
  if (v20) {
    char v21 = v19;
  }
  else {
    char v21 = 1;
  }
  if ((v21 & 1) == 0)
  {
    v22 = [NSString stringWithFormat:@"Unable to insert messageID %@ into message_attachments table", v9];
    [v11 handleError:v20 message:v22];
  }
  return v19;
}

+ (BOOL)insertAttachmentIntoAttachmentTableWithAttachmentMetadata:(id)a3 connection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"attachments" conflictResolution:3];
  v8 = [v5 size];
  [v7 setObject:v8 forKeyedSubscript:@"size"];

  id v9 = [v5 attachmentHash];
  [v7 setObject:v9 forKeyedSubscript:@"hash"];

  id v10 = [v5 nameOnDisk];
  [v7 setObject:v10 forKeyedSubscript:@"file_name_on_file_system"];

  id v11 = [v5 downloadDate];
  v12 = v11;
  if (!v11)
  {
    v12 = [MEMORY[0x1E4F1C9C8] date];
  }
  [v7 setObject:v12 forKeyedSubscript:@"date_last_downloaded"];
  if (!v11) {

  }
  id v19 = 0;
  char v13 = [v6 executeInsertStatement:v7 error:&v19];
  id v14 = v19;
  if ((v13 & 1) == 0)
  {
    v15 = NSString;
    v16 = [v5 attachmentHash];
    id v17 = [v15 stringWithFormat:@"Unable to insert attachment hash %@ into attachments table", v16];
    [v6 handleError:v14 message:v17];
  }
  return v13;
}

@end