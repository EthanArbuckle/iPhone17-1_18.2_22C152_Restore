@interface EDAttachmentPersistence
+ (NSString)attachmentColumnNameHash;
+ (NSString)attachmentIDColumnNameInMessageAttachmentsTable;
+ (NSString)attachmentsTableName;
+ (NSString)globalMessageIDColumnNameInMessageAttachmentTable;
+ (NSString)messageAttachmentsTableName;
+ (OS_os_log)log;
+ (id)attachmentTableSchema;
+ (id)hashForAttachmentData:(id)a3;
+ (id)hashForAttachmentName:(id)a3;
+ (id)messageAttachmentTableSchema;
+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4;
- (BOOL)insertMessageAttachmentMetadata:(id)a3;
- (BOOL)messageAttachmentExistsForGlobalMessageID:(int64_t)a3 mimePartNumber:(id)a4 hasAttachmentEntry:(BOOL *)a5;
- (BOOL)messageAttachmentExistsForGlobalMessageID:(int64_t)a3 remoteURL:(id)a4 hasAttachmentEntry:(BOOL *)a5;
- (BOOL)removeAttachments:(id)a3;
- (BOOL)updateAttachmentIDForMessageAttachment:(id)a3;
- (EDAttachmentPersistence)initWithDatabase:(id)a3;
- (EDPersistenceDatabase)database;
- (id)attachmentMetadataForMessage:(int64_t)a3 mimePartNumber:(id)a4;
- (id)attachmentMetadataForMessage:(int64_t)a3 remoteURL:(id)a4;
- (id)attachmentMetadataForMessageAttachmentID:(id)a3;
- (id)attachmentMetadataForMessageIDs:(id)a3;
- (id)attachmentsForGlobalMessageIDs:(id)a3;
- (id)globalMessageIDsForAttachment:(id)a3;
- (id)messageAttachmentMetadataForMessageID:(int64_t)a3;
- (id)uniqueAttachmentDataForHash:(id)a3;
- (int64_t)insertAttachmentMetadata:(id)a3;
- (void)enumerateAttachmentsInfoForGlobalMessageIDs:(id)a3 withBlock:(id)a4;
- (void)insertMimePartAttachments:(id)a3 forGlobalMessageID:(int64_t)a4;
- (void)setDatabase:(id)a3;
@end

@implementation EDAttachmentPersistence

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__EDAttachmentPersistence_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_9 != -1) {
    dispatch_once(&log_onceToken_9, block);
  }
  v2 = (void *)log_log_9;

  return (OS_os_log *)v2;
}

void __30__EDAttachmentPersistence_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_9;
  log_log_9 = (uint64_t)v1;
}

+ (NSString)attachmentsTableName
{
  return (NSString *)@"attachments";
}

+ (NSString)messageAttachmentsTableName
{
  return (NSString *)@"message_attachments";
}

+ (NSString)globalMessageIDColumnNameInMessageAttachmentTable
{
  return (NSString *)@"global_message_id";
}

+ (NSString)attachmentIDColumnNameInMessageAttachmentsTable
{
  return (NSString *)@"attachment";
}

+ (NSString)attachmentColumnNameHash
{
  return (NSString *)@"hash";
}

+ (id)attachmentTableSchema
{
  v14[7] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = +[EDAttachmentPersistence attachmentsTableName];
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"size" nullable:0 defaultValue:&unk_1F35BAB50];
  v5 = objc_msgSend(MEMORY[0x1E4F60E80], "textColumnWithName:collation:nullable:", @"hash", 1, 1, v4);
  v14[1] = v5;
  v6 = [MEMORY[0x1E4F60E80] textColumnWithName:@"file_name_on_file_system" collation:1 nullable:1];
  v14[2] = v6;
  v7 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"viewed_count" nullable:0 defaultValue:&unk_1F35BAB50];
  v14[3] = v7;
  v8 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"last_viewed" nullable:0 defaultValue:&unk_1F35BAB50];
  v14[4] = v8;
  v9 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"viewed_by_tapped_count" nullable:0 defaultValue:&unk_1F35BAB50];
  v14[5] = v9;
  v10 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"date_last_downloaded" nullable:0 defaultValue:&unk_1F35BAB50];
  v14[6] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:7];
  v12 = (void *)[v2 initWithName:v3 rowIDType:2 columns:v11];

  return v12;
}

+ (id)messageAttachmentTableSchema
{
  v35[5] = *MEMORY[0x1E4F143B8];
  v29 = [MEMORY[0x1E4F60E80] textColumnWithName:@"mime_part_number" collation:1 nullable:1];
  v28 = [MEMORY[0x1E4F60E80] textColumnWithName:@"remote_url" collation:1 nullable:1];
  id v2 = objc_alloc(MEMORY[0x1E4F60F08]);
  id v3 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"global_message_id" nullable:0];
  v35[0] = v3;
  v4 = [MEMORY[0x1E4F60E80] integerColumnWithName:@"attachment" nullable:1];
  v35[1] = v4;
  v5 = [MEMORY[0x1E4F60E80] textColumnWithName:@"name" collation:1 nullable:0];
  v35[2] = v5;
  v35[3] = v29;
  v35[4] = v28;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:5];
  v7 = (void *)[v2 initWithName:@"message_attachments" rowIDType:2 columns:v6];

  v34[0] = @"global_message_id";
  v34[1] = @"mime_part_number";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  [v7 addUniquenessConstraintForColumns:v8 conflictResolution:1];

  v33[0] = @"global_message_id";
  v33[1] = @"remote_url";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  [v7 addUniquenessConstraintForColumns:v9 conflictResolution:1];

  id v10 = objc_alloc(MEMORY[0x1E4F60E48]);
  v11 = [v29 columnExpression];
  v12 = [v11 isNotNull];
  v32[0] = v12;
  v13 = [v28 columnExpression];
  v14 = [v13 isNull];
  v32[1] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  v16 = (void *)[v10 initWithExpressions:v15];

  id v17 = objc_alloc(MEMORY[0x1E4F60E48]);
  v18 = [v29 columnExpression];
  v19 = [v18 isNull];
  v31[0] = v19;
  v20 = [v28 columnExpression];
  v21 = [v20 isNotNull];
  v31[1] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  v23 = (void *)[v17 initWithExpressions:v22];

  id v24 = objc_alloc(MEMORY[0x1E4F60ED8]);
  v30[0] = v16;
  v30[1] = v23;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
  v26 = (void *)[v24 initWithExpressions:v25];

  [v7 addCheckConstraintForExpression:v26];

  return v7;
}

+ (id)tablesAndForeignKeysToResolve:(id *)a3 associationsToResolve:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v5 = +[EDAttachmentPersistence attachmentTableSchema];
  v20[0] = @"hash";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  [v5 addUniquenessConstraintForColumns:v6 conflictResolution:1];

  v7 = +[EDAttachmentPersistence messageAttachmentTableSchema];
  v8 = [EDPersistenceForeignKeyPlaceholder alloc];
  v9 = [v7 columnForName:@"global_message_id"];
  id v10 = +[EDMessagePersistence messageGlobalDataTableName];
  v11 = [(EDPersistenceForeignKeyPlaceholder *)v8 initWithColumn:v9 tableName:v10 onDelete:2 onUpdate:0];
  v19[0] = v11;
  v12 = [EDPersistenceForeignKeyPlaceholder alloc];
  v13 = [v7 columnForName:@"attachment"];
  v14 = +[EDAttachmentPersistence attachmentsTableName];
  v15 = [(EDPersistenceForeignKeyPlaceholder *)v12 initWithColumn:v13 tableName:v14 onDelete:0 onUpdate:0];
  v19[1] = v15;
  *a3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];

  v18[0] = v5;
  v18[1] = v7;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];

  return v16;
}

+ (id)hashForAttachmentData:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA58] dataWithLength:32];
  id v5 = v3;
  v6 = (const void *)[v5 bytes];
  CC_LONG v7 = [v5 length];
  id v8 = v4;
  CC_SHA256(v6, v7, (unsigned __int8 *)[v8 mutableBytes]);
  v9 = objc_msgSend(v8, "ef_hexString");

  return v9;
}

+ (id)hashForAttachmentName:(id)a3
{
  v4 = [a3 dataUsingEncoding:4];
  id v5 = [a1 hashForAttachmentData:v4];

  return v5;
}

- (EDAttachmentPersistence)initWithDatabase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDAttachmentPersistence;
  v6 = [(EDAttachmentPersistence *)&v9 init];
  CC_LONG v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_database, a3);
  }

  return v7;
}

- (int64_t)insertAttachmentMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = *MEMORY[0x1E4F5FCC8];
  id v5 = [v4 downloadDate];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1C9C8] date];
  }
  id v8 = v7;

  objc_super v9 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"attachments" conflictResolution:3];
  id v10 = [v4 size];
  [v9 setObject:v10 forKeyedSubscript:@"size"];

  v11 = [v4 attachmentHash];
  [v9 setObject:v11 forKeyedSubscript:@"hash"];

  v12 = [v4 nameOnDisk];
  [v9 setObject:v12 forKeyedSubscript:@"file_name_on_file_system"];

  [v9 setObject:v8 forKeyedSubscript:@"date_last_downloaded"];
  v13 = [(EDAttachmentPersistence *)self database];
  v14 = [NSString stringWithUTF8String:"-[EDAttachmentPersistence insertAttachmentMetadata:]"];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __52__EDAttachmentPersistence_insertAttachmentMetadata___block_invoke;
  v19[3] = &unk_1E6BFF338;
  id v15 = v9;
  id v20 = v15;
  id v16 = v4;
  id v21 = v16;
  v22 = &v23;
  objc_msgSend(v13, "__performWriteWithCaller:usingBlock:", v14, v19);

  int64_t v17 = v24[3];
  _Block_object_dispose(&v23, 8);

  return v17;
}

uint64_t __52__EDAttachmentPersistence_insertAttachmentMetadata___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v13 = 0;
  uint64_t v5 = [v3 executeInsertStatement:v4 error:&v13];
  id v6 = v13;
  if (v5)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 lastInsertedDatabaseID];
    id v7 = EDAttachmentsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      objc_super v9 = [*(id *)(a1 + 40) attachmentHash];
      *(_DWORD *)buf = 134349314;
      uint64_t v15 = v8;
      __int16 v16 = 2114;
      int64_t v17 = v9;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Inserted attachment: %{public}lld hash: %{public}@ into attachments table", buf, 0x16u);
    }
  }
  else
  {
    id v10 = NSString;
    id v7 = [*(id *)(a1 + 40) attachmentHash];
    v11 = [v10 stringWithFormat:@"Unable to insert attachment with hash: %@ into attachments table", v7];
    [v3 handleError:v6 message:v11];
  }
  return v5;
}

- (BOOL)insertMessageAttachmentMetadata:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 globalMessageID];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F60EC0]) initWithTable:@"message_attachments" conflictResolution:4];
  uint64_t v8 = [NSNumber numberWithLongLong:v6];
  [v7 setObject:v8 forKeyedSubscript:@"global_message_id"];

  objc_super v9 = [v5 name];

  if (v9)
  {
    id v10 = [v5 name];
    [v7 setObject:v10 forKeyedSubscript:@"name"];
  }
  v11 = [v5 attachmentID];
  if (v11)
  {
    v12 = [NSNumber numberWithLongLong:*MEMORY[0x1E4F5FCC8]];
    char v13 = [v11 isEqualToNumber:v12];

    if ((v13 & 1) == 0) {
      [v7 setObject:v11 forKeyedSubscript:@"attachment"];
    }
  }
  v14 = [v5 mimePartNumber];
  if (v14)
  {
    uint64_t v15 = [v5 remoteURL];

    if (v15)
    {
      __int16 v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"EDAttachmentPersistence.m" lineNumber:187 description:@"We should never have both a mime part number and a maildrop URL for a message."];
    }
  }
  int64_t v17 = [v5 mimePartNumber];

  if (v17)
  {
    uint64_t v18 = [v5 mimePartNumber];
    [v7 setObject:v18 forKeyedSubscript:@"mime_part_number"];
  }
  v19 = [v5 remoteURL];
  id v20 = v19;
  if (v19)
  {
    id v21 = [v19 absoluteString];
    [v7 setObject:v21 forKeyedSubscript:@"remote_url"];
  }
  v22 = [(EDAttachmentPersistence *)self database];
  uint64_t v23 = [NSString stringWithUTF8String:"-[EDAttachmentPersistence insertMessageAttachmentMetadata:]"];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __59__EDAttachmentPersistence_insertMessageAttachmentMetadata___block_invoke;
  v28[3] = &unk_1E6BFF360;
  id v24 = v7;
  id v29 = v24;
  id v25 = v5;
  id v30 = v25;
  uint64_t v31 = v6;
  char v26 = objc_msgSend(v22, "__performWriteWithCaller:usingBlock:", v23, v28);

  return v26;
}

uint64_t __59__EDAttachmentPersistence_insertMessageAttachmentMetadata___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v21 = 0;
  uint64_t v5 = [v3 executeInsertStatement:v4 error:&v21];
  id v6 = v21;
  id v7 = v6;
  if (v5)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F60E00];
    objc_super v9 = [*(id *)(a1 + 40) name];
    id v10 = [v8 fullyOrPartiallyRedactedStringForString:v9];

    v11 = EDAttachmentsLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [*(id *)(a1 + 40) mimePartNumber];
      uint64_t v13 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v10;
      __int16 v24 = 2114;
      id v25 = v12;
      __int16 v26 = 2048;
      uint64_t v27 = v13;
      _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "Inserted attachment: '%{public}@' (MIME part %{public}@) for globalMessageID: %lld into message_attachments table", buf, 0x20u);
    }
    goto LABEL_11;
  }
  v14 = [v6 domain];
  if (![v14 isEqualToString:*MEMORY[0x1E4F60D10]])
  {

    goto LABEL_10;
  }
  BOOL v15 = [v7 code] == 19;

  if (!v15)
  {
LABEL_10:
    uint64_t v18 = NSString;
    id v10 = [*(id *)(a1 + 40) name];
    v19 = [v18 stringWithFormat:@"Unable to insert attachment: %@ for globalMessageID: %lld into message_attachments table", v10, *(void *)(a1 + 48)];
    [v3 handleError:v7 message:v19];

    goto LABEL_11;
  }
  id v10 = EDAttachmentsLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v16 = [*(id *)(a1 + 40) mimePartNumber];
    int64_t v17 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = v16;
    __int16 v24 = 2048;
    id v25 = v17;
    _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Constraint while trying to insert attachment (MIME part %{public}@) for globalMessageID: %lld into message_attachments table", buf, 0x16u);
  }
LABEL_11:

  return v5;
}

- (BOOL)updateAttachmentIDForMessageAttachment:(id)a3
{
  void v34[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v23 = [v3 attachmentID];
  uint64_t v4 = [v3 globalMessageID];
  id v21 = [v3 mimePartNumber];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F60F10]) initWithTable:@"message_attachments"];
  [v5 setObject:v23 forKeyedSubscript:@"attachment"];
  id v6 = objc_alloc(MEMORY[0x1E4F60E48]);
  id v7 = [MEMORY[0x1E4F60E78] column:@"global_message_id"];
  uint64_t v8 = [NSNumber numberWithLongLong:v4];
  objc_super v9 = [v7 equalTo:v8];
  v34[0] = v9;
  id v10 = [MEMORY[0x1E4F60E78] column:@"mime_part_number"];
  v11 = [v10 equalTo:v21];
  v34[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  uint64_t v13 = (void *)[v6 initWithExpressions:v12];
  [v5 setWhereClause:v13];

  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  v14 = [(EDAttachmentPersistence *)self database];
  BOOL v15 = [NSString stringWithUTF8String:"-[EDAttachmentPersistence updateAttachmentIDForMessageAttachment:]"];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __66__EDAttachmentPersistence_updateAttachmentIDForMessageAttachment___block_invoke;
  v24[3] = &unk_1E6BFF388;
  id v16 = v5;
  id v25 = v16;
  uint64_t v28 = &v30;
  uint64_t v29 = v4;
  id v17 = v21;
  id v26 = v17;
  id v18 = v23;
  id v27 = v18;
  if (objc_msgSend(v14, "__performWriteWithCaller:usingBlock:", v15, v24)) {
    BOOL v19 = *((unsigned char *)v31 + 24) != 0;
  }
  else {
    BOOL v19 = 0;
  }

  _Block_object_dispose(&v30, 8);
  return v19;
}

uint64_t __66__EDAttachmentPersistence_updateAttachmentIDForMessageAttachment___block_invoke(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v13 = 0;
  uint64_t v4 = [v3 executeUpdateStatement:a1[4] rowsChanged:&v13];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v4;
  if (v4)
  {
    if (v13)
    {
      uint64_t v5 = EDAttachmentsLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = a1[8];
        uint64_t v8 = a1[5];
        uint64_t v7 = a1[6];
        *(_DWORD *)buf = 138543874;
        uint64_t v15 = v7;
        __int16 v16 = 2048;
        uint64_t v17 = v6;
        __int16 v18 = 2114;
        uint64_t v19 = v8;
        _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Updated row with attachment reference: %{public}@, globalMessageID: %lld, mimePart: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      objc_super v9 = EDAttachmentsLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = a1[8];
        uint64_t v11 = a1[5];
        *(_DWORD *)buf = 134218242;
        uint64_t v15 = v10;
        __int16 v16 = 2114;
        uint64_t v17 = v11;
        _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "No matching rows found for attachment globalMessageID: %lld, mimePart: %{public}@", buf, 0x16u);
      }

      *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
    }
  }

  return v4;
}

- (id)attachmentsForGlobalMessageIDs:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(EDAttachmentPersistence *)self database];
  uint64_t v7 = [NSString stringWithUTF8String:"-[EDAttachmentPersistence attachmentsForGlobalMessageIDs:]"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__EDAttachmentPersistence_attachmentsForGlobalMessageIDs___block_invoke;
  v13[3] = &unk_1E6BFF3D8;
  id v8 = v4;
  id v14 = v8;
  id v9 = v5;
  id v15 = v9;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v13);

  uint64_t v10 = v15;
  id v11 = v9;

  return v11;
}

uint64_t __58__EDAttachmentPersistence_attachmentsForGlobalMessageIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v5 = [MEMORY[0x1E4F60E78] allColumns];
  uint64_t v6 = +[EDAttachmentPersistence messageAttachmentsTableName];
  uint64_t v7 = (void *)[v4 initWithResult:v5 table:v6];

  id v8 = [MEMORY[0x1E4F60E78] column:@"global_message_id"];
  id v9 = [v8 in:*(void *)(a1 + 32)];

  [v7 setWhere:v9];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__EDAttachmentPersistence_attachmentsForGlobalMessageIDs___block_invoke_2;
  v17[3] = &unk_1E6BFF3B0;
  id v18 = *(id *)(a1 + 40);
  id v16 = 0;
  uint64_t v10 = [v3 executeSelectStatement:v7 withBlock:v17 error:&v16];
  id v11 = v16;
  if (v11) {
    [v3 handleError:v11 message:@"Determine which attachments are referenced by globalMessageIDs"];
  }
  v12 = EDAttachmentsLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v13;
    __int16 v21 = 2112;
    uint64_t v22 = v14;
    _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "Found attachments %{public}@ for globalMessageIDs %@", buf, 0x16u);
  }

  return v10;
}

void __58__EDAttachmentPersistence_attachmentsForGlobalMessageIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = NSNumber;
  id v5 = [a2 objectForKeyedSubscript:@"attachment"];
  id v4 = objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v5, "databaseIDValue"));
  [v2 addObject:v4];
}

- (id)globalMessageIDsForAttachment:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(EDAttachmentPersistence *)self database];
  uint64_t v7 = [NSString stringWithUTF8String:"-[EDAttachmentPersistence globalMessageIDsForAttachment:]"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__EDAttachmentPersistence_globalMessageIDsForAttachment___block_invoke;
  v13[3] = &unk_1E6BFF3D8;
  id v8 = v4;
  id v14 = v8;
  id v9 = v5;
  id v15 = v9;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, v13);

  uint64_t v10 = v15;
  id v11 = v9;

  return v11;
}

uint64_t __57__EDAttachmentPersistence_globalMessageIDsForAttachment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v5 = [MEMORY[0x1E4F60E78] allColumns];
  uint64_t v6 = +[EDAttachmentPersistence messageAttachmentsTableName];
  uint64_t v7 = (void *)[v4 initWithResult:v5 table:v6];

  id v8 = [MEMORY[0x1E4F60E78] column:@"attachment"];
  id v9 = [v8 equalTo:*(void *)(a1 + 32)];

  [v7 setWhere:v9];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__EDAttachmentPersistence_globalMessageIDsForAttachment___block_invoke_2;
  v17[3] = &unk_1E6BFF3B0;
  id v18 = *(id *)(a1 + 40);
  id v16 = 0;
  uint64_t v10 = [v3 executeSelectStatement:v7 withBlock:v17 error:&v16];
  id v11 = v16;
  if (v11) {
    [v3 handleError:v11 message:@"Determine which attachments are referenced by globalMessageIDs"];
  }
  v12 = EDAttachmentsLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v13;
    __int16 v21 = 2114;
    uint64_t v22 = v14;
    _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "Found globalMessageIDs %{public}@ for attachment %{public}@", buf, 0x16u);
  }

  return v10;
}

void __57__EDAttachmentPersistence_globalMessageIDsForAttachment___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = NSNumber;
  id v5 = [a2 objectForKeyedSubscript:@"global_message_id"];
  id v4 = objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v5, "databaseIDValue"));
  [v2 addObject:v4];
}

- (BOOL)removeAttachments:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  id v5 = [(EDAttachmentPersistence *)self database];
  uint64_t v6 = [NSString stringWithUTF8String:"-[EDAttachmentPersistence removeAttachments:]"];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__EDAttachmentPersistence_removeAttachments___block_invoke;
  v9[3] = &unk_1E6BFF400;
  id v7 = v4;
  id v10 = v7;
  id v11 = &v12;
  objc_msgSend(v5, "__performWriteWithCaller:usingBlock:", v6, v9);

  LOBYTE(v4) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v4;
}

BOOL __45__EDAttachmentPersistence_removeAttachments___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = EDAttachmentsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v17 = v5;
    _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_DEFAULT, "Removing attachments %@ from the attachments table", buf, 0xCu);
  }

  uint64_t v6 = [MEMORY[0x1E4F60E78] column:*MEMORY[0x1E4F60D08]];
  id v7 = [v6 in:*(void *)(a1 + 32)];

  id v8 = objc_alloc(MEMORY[0x1E4F60E98]);
  id v9 = +[EDAttachmentPersistence attachmentsTableName];
  id v10 = (void *)[v8 initWithTable:v9 where:v7];

  id v15 = 0;
  char v11 = [v3 executeDeleteStatement:v10 error:&v15];
  id v12 = v15;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v11;
  if (v12) {
    [v3 handleError:v12 message:@"Removing unexpected messages from attachments table"];
  }
  BOOL v13 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;

  return v13;
}

- (BOOL)messageAttachmentExistsForGlobalMessageID:(int64_t)a3 mimePartNumber:(id)a4 hasAttachmentEntry:(BOOL *)a5
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v24 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v9 = [MEMORY[0x1E4F60E78] allColumns];
  uint64_t v23 = (void *)[v8 initWithResult:v9 table:@"message_attachments"];

  id v10 = (void *)MEMORY[0x1E4F60E48];
  char v11 = [MEMORY[0x1E4F60E78] column:@"global_message_id"];
  id v12 = [NSNumber numberWithLongLong:a3];
  BOOL v13 = [v11 equalTo:v12];
  v37[0] = v13;
  uint64_t v14 = [MEMORY[0x1E4F60E78] column:@"mime_part_number"];
  id v15 = [v14 equalTo:v24];
  v37[1] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  uint64_t v17 = [v10 combined:v16];
  [v23 setWhere:v17];

  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  v32[0] = 0;
  v32[1] = v32;
  void v32[2] = 0x2020000000;
  v32[3] = *MEMORY[0x1E4F5FCC8];
  uint64_t v18 = [(EDAttachmentPersistence *)self database];
  uint64_t v19 = [NSString stringWithUTF8String:"-[EDAttachmentPersistence messageAttachmentExistsForGlobalMessageID:mimePartNumber:hasAttachmentEntry:]"];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __103__EDAttachmentPersistence_messageAttachmentExistsForGlobalMessageID_mimePartNumber_hasAttachmentEntry___block_invoke;
  v25[3] = &unk_1E6BFF450;
  id v20 = v23;
  id v26 = v20;
  uint64_t v28 = &v33;
  int64_t v30 = a3;
  uint64_t v31 = a5;
  uint64_t v29 = v32;
  id v21 = v24;
  id v27 = v21;
  objc_msgSend(v18, "__performReadWithCaller:usingBlock:", v19, v25);

  LOBYTE(v16) = *((unsigned char *)v34 + 24) != 0;
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v33, 8);

  return (char)v16;
}

uint64_t __103__EDAttachmentPersistence_messageAttachmentExistsForGlobalMessageID_mimePartNumber_hasAttachmentEntry___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v16 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __103__EDAttachmentPersistence_messageAttachmentExistsForGlobalMessageID_mimePartNumber_hasAttachmentEntry___block_invoke_2;
  v17[3] = &unk_1E6BFF428;
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v19 = *(void *)(a1 + 64);
  uint64_t v20 = v4;
  long long v18 = *(_OWORD *)(a1 + 48);
  uint64_t v5 = [a2 executeSelectStatement:v3 withBlock:v17 error:&v16];
  id v6 = v16;
  if (v6)
  {
    id v7 = EDAttachmentsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *(NSObject **)(a1 + 64);
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      uint64_t v22 = v8;
      __int16 v23 = 2114;
      uint64_t v24 = v9;
      __int16 v25 = 2114;
      id v26 = v6;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Failed to check if message attachment identifier and attachmennt identifier exist for messageID %lld mimePartNumber: %{public}@ with error %{public}@", buf, 0x20u);
    }
  }
  else
  {
    if (**(unsigned char **)(a1 + 72)) {
      id v10 = @"Found";
    }
    else {
      id v10 = @"Did not find";
    }
    id v7 = v10;
    char v11 = EDAttachmentsLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = *(void **)(a1 + 64);
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      uint64_t v22 = v7;
      __int16 v23 = 2048;
      uint64_t v24 = v13;
      __int16 v25 = 2048;
      id v26 = v12;
      __int16 v27 = 2114;
      uint64_t v28 = v14;
      _os_log_impl(&dword_1DB39C000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ attachment identifier %lld for messageID %lld mimePartNumber: %{public}@", buf, 0x2Au);
    }
  }
  return v5;
}

void __103__EDAttachmentPersistence_messageAttachmentExistsForGlobalMessageID_mimePartNumber_hasAttachmentEntry___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 objectForKeyedSubscript:@"global_message_id"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 databaseIDValue] == *(void *)(a1 + 48);

  uint64_t v4 = [v7 objectForKeyedSubscript:@"attachment"];
  uint64_t v5 = [v4 numberValue];
  **(unsigned char **)(a1 + 56) = v5 != 0;

  id v6 = [v7 objectForKeyedSubscript:@"attachment"];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 databaseIDValue];
}

- (BOOL)messageAttachmentExistsForGlobalMessageID:(int64_t)a3 remoteURL:(id)a4 hasAttachmentEntry:(BOOL *)a5
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v24 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v8 = [MEMORY[0x1E4F60E78] allColumns];
  __int16 v23 = (void *)[v7 initWithResult:v8 table:@"message_attachments"];

  uint64_t v9 = (void *)MEMORY[0x1E4F60E48];
  id v10 = [MEMORY[0x1E4F60E78] column:@"global_message_id"];
  char v11 = [NSNumber numberWithLongLong:a3];
  id v12 = [v10 equalTo:v11];
  v36[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F60E78] column:@"remote_url"];
  uint64_t v14 = [v24 absoluteString];
  id v15 = [v13 equalTo:v14];
  v36[1] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  uint64_t v17 = [v9 combined:v16];
  [v23 setWhere:v17];

  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  v31[0] = 0;
  v31[1] = v31;
  void v31[2] = 0x2020000000;
  v31[3] = *MEMORY[0x1E4F5FCC8];
  long long v18 = [(EDAttachmentPersistence *)self database];
  uint64_t v19 = [NSString stringWithUTF8String:"-[EDAttachmentPersistence messageAttachmentExistsForGlobalMessageID:remoteURL:hasAttachmentEntry:]"];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __98__EDAttachmentPersistence_messageAttachmentExistsForGlobalMessageID_remoteURL_hasAttachmentEntry___block_invoke;
  v25[3] = &unk_1E6BFF478;
  id v20 = v23;
  id v26 = v20;
  __int16 v27 = &v32;
  int64_t v29 = a3;
  int64_t v30 = a5;
  uint64_t v28 = v31;
  objc_msgSend(v18, "__performReadWithCaller:usingBlock:", v19, v25);

  LOBYTE(v18) = *((unsigned char *)v33 + 24) != 0;
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v32, 8);

  return (char)v18;
}

uint64_t __98__EDAttachmentPersistence_messageAttachmentExistsForGlobalMessageID_remoteURL_hasAttachmentEntry___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v14 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__EDAttachmentPersistence_messageAttachmentExistsForGlobalMessageID_remoteURL_hasAttachmentEntry___block_invoke_2;
  v15[3] = &unk_1E6BFF428;
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v17 = *(void *)(a1 + 56);
  uint64_t v18 = v4;
  long long v16 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = [a2 executeSelectStatement:v3 withBlock:v15 error:&v14];
  id v6 = v14;
  if (v6)
  {
    id v7 = EDAttachmentsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = *(NSObject **)(a1 + 56);
      *(_DWORD *)buf = 134218242;
      id v20 = v8;
      __int16 v21 = 2114;
      id v22 = v6;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Failed to check if message attachment identifier and attachmennt identifier exist for messageID %lld remoteURL with error %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (**(unsigned char **)(a1 + 64)) {
      uint64_t v9 = @"Found";
    }
    else {
      uint64_t v9 = @"Did not find";
    }
    id v7 = v9;
    id v10 = EDAttachmentsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 56);
      id v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 138543874;
      id v20 = v7;
      __int16 v21 = 2048;
      id v22 = v12;
      __int16 v23 = 2048;
      uint64_t v24 = v11;
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ attachment identifier %lld for messageID %lld and remoteURL@", buf, 0x20u);
    }
  }
  return v5;
}

void __98__EDAttachmentPersistence_messageAttachmentExistsForGlobalMessageID_remoteURL_hasAttachmentEntry___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 objectForKeyedSubscript:@"global_message_id"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 databaseIDValue] == *(void *)(a1 + 48);

  uint64_t v4 = [v7 objectForKeyedSubscript:@"attachment"];
  uint64_t v5 = [v4 numberValue];
  **(unsigned char **)(a1 + 56) = v5 != 0;

  id v6 = [v7 objectForKeyedSubscript:@"attachment"];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v6 databaseIDValue];
}

- (id)messageAttachmentMetadataForMessageID:(int64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(EDAttachmentPersistence *)self database];
  id v7 = [NSString stringWithUTF8String:"-[EDAttachmentPersistence messageAttachmentMetadataForMessageID:]"];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __65__EDAttachmentPersistence_messageAttachmentMetadataForMessageID___block_invoke;
  long long v16 = &unk_1E6BFF4A0;
  int64_t v18 = a3;
  id v8 = v5;
  id v17 = v8;
  objc_msgSend(v6, "__performReadWithCaller:usingBlock:", v7, &v13);

  uint64_t v9 = EDAttachmentsLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = v8;
    __int16 v21 = 2048;
    int64_t v22 = a3;
    _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Found attachments metadata %{public}@ for message %lld", buf, 0x16u);
  }

  if (objc_msgSend(v8, "count", v13, v14, v15, v16)) {
    id v10 = v8;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  return v11;
}

uint64_t __65__EDAttachmentPersistence_messageAttachmentMetadataForMessageID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v5 = [MEMORY[0x1E4F60E78] allColumns];
  id v6 = (void *)[v4 initWithResult:v5 table:@"message_attachments"];

  id v7 = [MEMORY[0x1E4F60E78] column:@"global_message_id"];
  id v8 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  uint64_t v9 = [v7 equalTo:v8];
  [v6 setWhere:v9];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__EDAttachmentPersistence_messageAttachmentMetadataForMessageID___block_invoke_2;
  v14[3] = &unk_1E6BFF3B0;
  id v15 = *(id *)(a1 + 32);
  id v13 = 0;
  uint64_t v10 = [v3 executeSelectStatement:v6 withBlock:v14 error:&v13];
  id v11 = v13;

  return v10;
}

void __65__EDAttachmentPersistence_messageAttachmentMetadataForMessageID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F1CB10];
  id v19 = v3;
  id v5 = [v3 objectForKeyedSubscript:@"remote_url"];
  id v6 = [v5 stringValue];
  uint64_t v18 = a1;
  id v7 = [v4 URLWithString:v6];

  id v8 = [EDMessageAttachmentMetadata alloc];
  uint64_t v9 = [v19 objectForKeyedSubscript:@"global_message_id"];
  uint64_t v10 = [v9 databaseIDValue];
  id v11 = [v19 objectForKeyedSubscript:@"name"];
  id v12 = [v11 stringValue];
  id v13 = [v19 objectForKeyedSubscript:@"mime_part_number"];
  uint64_t v14 = [v13 stringValue];
  id v15 = [v19 objectForKeyedSubscript:@"attachment"];
  long long v16 = [v15 numberValue];
  id v17 = [(EDMessageAttachmentMetadata *)v8 initWithGlobalMessageID:v10 name:v12 mimePart:v14 attachmentID:v16 remoteURL:v7];

  [*(id *)(v18 + 32) addObject:v17];
}

- (id)uniqueAttachmentDataForHash:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  id v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  id v5 = [(EDAttachmentPersistence *)self database];
  id v6 = [NSString stringWithUTF8String:"-[EDAttachmentPersistence uniqueAttachmentDataForHash:]"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__EDAttachmentPersistence_uniqueAttachmentDataForHash___block_invoke;
  v12[3] = &unk_1E6BFF400;
  id v7 = v4;
  id v13 = v7;
  uint64_t v14 = &v15;
  objc_msgSend(v5, "__performReadWithCaller:usingBlock:", v6, v12);

  id v8 = EDAttachmentsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v16[5];
    *(_DWORD *)buf = 138543618;
    uint64_t v22 = v9;
    __int16 v23 = 2114;
    id v24 = v7;
    _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Found attachment metadata %{public}@ for hash %{public}@", buf, 0x16u);
  }

  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

uint64_t __55__EDAttachmentPersistence_uniqueAttachmentDataForHash___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F60EF8]);
  id v5 = [MEMORY[0x1E4F60E78] allColumns];
  id v6 = (void *)[v4 initWithResult:v5 table:@"attachments"];

  id v7 = [MEMORY[0x1E4F60E78] column:@"hash"];
  id v8 = [v7 equalTo:*(void *)(a1 + 32)];
  [v6 setWhere:v8];

  [v6 setLimit:1];
  id v11 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__EDAttachmentPersistence_uniqueAttachmentDataForHash___block_invoke_2;
  v12[3] = &unk_1E6BFF4C8;
  void v12[4] = *(void *)(a1 + 40);
  [v3 executeSelectStatement:v6 withBlock:v12 error:&v11];
  id v9 = v11;
  if (v9) {
    [v3 handleError:v9 message:@"Failed to fetch attachment reference in message_attachments table"];
  }

  return 1;
}

void __55__EDAttachmentPersistence_uniqueAttachmentDataForHash___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [EDAttachmentMetadata alloc];
  id v4 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F60D08]];
  id v5 = [v4 numberValue];
  id v6 = [v11 objectForKeyedSubscript:@"file_name_on_file_system"];
  id v7 = [v6 stringValue];
  uint64_t v8 = [(EDAttachmentMetadata *)v3 initWithAttachmentID:v5 nameOnDisk:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)attachmentMetadataForMessageIDs:(id)a3
{
  v26[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v26[0] = @"global_message_id";
  v26[1] = @"attachment";
  v26[2] = @"file_name_on_file_system";
  v26[3] = @"name";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
  id v7 = [v6 componentsJoinedByString:@","];

  id v8 = objc_alloc(MEMORY[0x1E4F60EF8]);
  uint64_t v9 = [MEMORY[0x1E4F60E78] column:v7];
  id v10 = (void *)[v8 initWithResult:v9 table:@"message_attachments"];

  id v11 = (id)[v10 leftOuterJoin:@"attachments" sourceColumn:@"attachment" targetColumn:*MEMORY[0x1E4F60D08]];
  id v12 = [MEMORY[0x1E4F60E78] column:@"global_message_id"];
  id v13 = [v12 in:v4];
  [v10 setWhere:v13];

  uint64_t v14 = [(EDAttachmentPersistence *)self database];
  uint64_t v15 = [NSString stringWithUTF8String:"-[EDAttachmentPersistence attachmentMetadataForMessageIDs:]"];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __59__EDAttachmentPersistence_attachmentMetadataForMessageIDs___block_invoke;
  v22[3] = &unk_1E6BFF4F0;
  id v16 = v10;
  id v23 = v16;
  id v17 = v5;
  id v24 = v17;
  id v18 = v4;
  id v25 = v18;
  objc_msgSend(v14, "__performReadWithCaller:usingBlock:", v15, v22);

  id v19 = v25;
  id v20 = v17;

  return v20;
}

uint64_t __59__EDAttachmentPersistence_attachmentMetadataForMessageIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__EDAttachmentPersistence_attachmentMetadataForMessageIDs___block_invoke_2;
  v10[3] = &unk_1E6BFF3B0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v9 = 0;
  [a2 executeSelectStatement:v4 withBlock:v10 error:&v9];
  id v5 = v9;
  if (v5)
  {
    id v6 = EDAttachmentsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __59__EDAttachmentPersistence_attachmentMetadataForMessageIDs___block_invoke_cold_1(a1, v6);
    }
  }
  else
  {
    id v6 = EDAttachmentsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "Found attachment metadata for messages %{public}@", buf, 0xCu);
    }
  }

  return 1;
}

void __59__EDAttachmentPersistence_attachmentMetadataForMessageIDs___block_invoke_2(uint64_t a1, void *a2)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [EDAttachmentMetadata alloc];
  id v5 = [v3 objectForKeyedSubscript:@"attachment"];
  id v6 = [v5 numberValue];
  uint64_t v7 = [v3 objectForKeyedSubscript:@"file_name_on_file_system"];
  id v8 = [v7 stringValue];
  id v9 = [(EDAttachmentMetadata *)v4 initWithAttachmentID:v6 nameOnDisk:v8];

  id v10 = [v3 objectForKeyedSubscript:@"name"];
  id v11 = [v10 stringValue];

  id v12 = [v3 objectForKeyedSubscript:@"global_message_id"];
  uint64_t v13 = [v12 numberValue];

  uint64_t v14 = [MEMORY[0x1E4F60DF0] pairWithFirst:v9 second:v11];
  uint64_t v15 = [*(id *)(a1 + 32) objectForKey:v13];

  if (v15)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v17 = [*(id *)(a1 + 32) objectForKey:v13];
    id v18 = (void *)[v16 initWithArray:v17];

    [v18 addObject:v14];
    [*(id *)(a1 + 32) setObject:v18 forKey:v13];
  }
  else
  {
    id v19 = *(void **)(a1 + 32);
    v21[0] = v14;
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [v19 setObject:v20 forKey:v13];
  }
}

- (id)attachmentMetadataForMessage:(int64_t)a3 mimePartNumber:(id)a4
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v24 = a4;
  id v6 = objc_alloc(MEMORY[0x1E4F60EF8]);
  uint64_t v7 = [MEMORY[0x1E4F60E78] allColumns];
  id v8 = (void *)[v6 initWithResult:v7 table:@"message_attachments"];

  id v9 = (id)[v8 leftOuterJoin:@"attachments" sourceColumn:@"attachment" targetColumn:*MEMORY[0x1E4F60D08]];
  id v10 = (void *)MEMORY[0x1E4F60E48];
  id v11 = [MEMORY[0x1E4F60E78] column:@"global_message_id"];
  id v12 = [NSNumber numberWithLongLong:a3];
  uint64_t v13 = [v11 equalTo:v12];
  v36[0] = v13;
  uint64_t v14 = [MEMORY[0x1E4F60E78] column:@"mime_part_number"];
  uint64_t v15 = [v14 equalTo:v24];
  v36[1] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  id v17 = [v10 combined:v16];
  [v8 setWhere:v17];

  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy_;
  uint64_t v34 = __Block_byref_object_dispose_;
  id v35 = 0;
  id v18 = [(EDAttachmentPersistence *)self database];
  id v19 = [NSString stringWithUTF8String:"-[EDAttachmentPersistence attachmentMetadataForMessage:mimePartNumber:]"];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __71__EDAttachmentPersistence_attachmentMetadataForMessage_mimePartNumber___block_invoke;
  v25[3] = &unk_1E6BFF518;
  id v20 = v8;
  id v26 = v20;
  uint64_t v28 = &v30;
  int64_t v29 = a3;
  id v21 = v24;
  id v27 = v21;
  objc_msgSend(v18, "__performReadWithCaller:usingBlock:", v19, v25);

  id v22 = (id)v31[5];
  _Block_object_dispose(&v30, 8);

  return v22;
}

uint64_t __71__EDAttachmentPersistence_attachmentMetadataForMessage_mimePartNumber___block_invoke(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[4];
  id v10 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__EDAttachmentPersistence_attachmentMetadataForMessage_mimePartNumber___block_invoke_2;
  v11[3] = &unk_1E6BFF4C8;
  v11[4] = a1[6];
  [a2 executeSelectStatement:v3 withBlock:v11 error:&v10];
  id v4 = v10;
  if (v4)
  {
    id v5 = EDAttachmentsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __71__EDAttachmentPersistence_attachmentMetadataForMessage_mimePartNumber___block_invoke_cold_1();
    }
  }
  else
  {
    id v5 = EDAttachmentsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[7];
      uint64_t v7 = a1[5];
      id v8 = [*(id *)(*(void *)(a1[6] + 8) + 40) attachmentID];
      *(_DWORD *)buf = 134218498;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      id v17 = v8;
      _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Found attachment metadata for message %lld mime part %{public}@ attachmentID %{public}@", buf, 0x20u);
    }
  }

  return 1;
}

void __71__EDAttachmentPersistence_attachmentMetadataForMessage_mimePartNumber___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [EDAttachmentMetadata alloc];
  id v4 = [v11 objectForKeyedSubscript:@"attachment"];
  id v5 = [v4 numberValue];
  uint64_t v6 = [v11 objectForKeyedSubscript:@"file_name_on_file_system"];
  uint64_t v7 = [v6 stringValue];
  uint64_t v8 = [(EDAttachmentMetadata *)v3 initWithAttachmentID:v5 nameOnDisk:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)attachmentMetadataForMessage:(int64_t)a3 remoteURL:(id)a4
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v25 = a4;
  id v5 = objc_alloc(MEMORY[0x1E4F60EF8]);
  uint64_t v6 = [MEMORY[0x1E4F60E78] allColumns];
  uint64_t v7 = (void *)[v5 initWithResult:v6 table:@"message_attachments"];

  id v8 = (id)[v7 leftOuterJoin:@"attachments" sourceColumn:@"attachment" targetColumn:*MEMORY[0x1E4F60D08]];
  uint64_t v9 = (void *)MEMORY[0x1E4F60E48];
  id v10 = [MEMORY[0x1E4F60E78] column:@"global_message_id"];
  id v11 = [NSNumber numberWithLongLong:a3];
  id v12 = [v10 equalTo:v11];
  v37[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F60E78] column:@"remote_url"];
  __int16 v14 = [v25 absoluteString];
  uint64_t v15 = [v13 equalTo:v14];
  v37[1] = v15;
  __int16 v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  id v17 = [v9 combined:v16];
  [v7 setWhere:v17];

  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy_;
  id v35 = __Block_byref_object_dispose_;
  id v36 = 0;
  uint64_t v18 = [(EDAttachmentPersistence *)self database];
  id v19 = [NSString stringWithUTF8String:"-[EDAttachmentPersistence attachmentMetadataForMessage:remoteURL:]"];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __66__EDAttachmentPersistence_attachmentMetadataForMessage_remoteURL___block_invoke;
  v26[3] = &unk_1E6BFF518;
  id v20 = v7;
  id v27 = v20;
  int64_t v29 = &v31;
  int64_t v30 = a3;
  id v21 = v25;
  id v28 = v21;
  objc_msgSend(v18, "__performReadWithCaller:usingBlock:", v19, v26);

  id v22 = (id)v32[5];
  _Block_object_dispose(&v31, 8);

  return v22;
}

uint64_t __66__EDAttachmentPersistence_attachmentMetadataForMessage_remoteURL___block_invoke(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[4];
  id v10 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__EDAttachmentPersistence_attachmentMetadataForMessage_remoteURL___block_invoke_2;
  v11[3] = &unk_1E6BFF4C8;
  v11[4] = a1[6];
  [a2 executeSelectStatement:v3 withBlock:v11 error:&v10];
  id v4 = v10;
  if (v4)
  {
    id v5 = EDAttachmentsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __66__EDAttachmentPersistence_attachmentMetadataForMessage_remoteURL___block_invoke_cold_1((uint64_t)a1, (uint64_t)v4, v5);
    }
  }
  else
  {
    id v5 = EDAttachmentsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[7];
      uint64_t v7 = a1[5];
      id v8 = [*(id *)(*(void *)(a1[6] + 8) + 40) attachmentID];
      *(_DWORD *)buf = 134218498;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      id v17 = v8;
      _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Found attachment metadata for message %lld remoteURL %@ attachmentID %{public}@", buf, 0x20u);
    }
  }

  return 1;
}

void __66__EDAttachmentPersistence_attachmentMetadataForMessage_remoteURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [EDAttachmentMetadata alloc];
  id v4 = [v11 objectForKeyedSubscript:@"attachment"];
  id v5 = [v4 numberValue];
  uint64_t v6 = [v11 objectForKeyedSubscript:@"file_name_on_file_system"];
  uint64_t v7 = [v6 stringValue];
  uint64_t v8 = [(EDAttachmentMetadata *)v3 initWithAttachmentID:v5 nameOnDisk:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (id)attachmentMetadataForMessageAttachmentID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F60EF8]);
  uint64_t v6 = [MEMORY[0x1E4F60E78] allColumns];
  uint64_t v7 = (void *)[v5 initWithResult:v6 table:@"message_attachments"];

  id v8 = (id)[v7 leftOuterJoin:@"attachments" sourceColumn:@"attachment" targetColumn:*MEMORY[0x1E4F60D08]];
  uint64_t v9 = [MEMORY[0x1E4F60E78] column:@"message_attachments.rowid"];
  id v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "databaseID"));
  id v11 = [v9 equalTo:v10];
  [v7 setWhere:v11];

  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy_;
  id v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  id v12 = [(EDAttachmentPersistence *)self database];
  uint64_t v13 = [NSString stringWithUTF8String:"-[EDAttachmentPersistence attachmentMetadataForMessageAttachmentID:]"];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __68__EDAttachmentPersistence_attachmentMetadataForMessageAttachmentID___block_invoke;
  v18[3] = &unk_1E6BFF540;
  id v14 = v7;
  id v19 = v14;
  id v21 = &v22;
  id v15 = v4;
  id v20 = v15;
  objc_msgSend(v12, "__performReadWithCaller:usingBlock:", v13, v18);

  id v16 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v16;
}

uint64_t __68__EDAttachmentPersistence_attachmentMetadataForMessageAttachmentID___block_invoke(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[4];
  id v9 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__EDAttachmentPersistence_attachmentMetadataForMessageAttachmentID___block_invoke_2;
  v10[3] = &unk_1E6BFF4C8;
  void v10[4] = a1[6];
  [a2 executeSelectStatement:v3 withBlock:v10 error:&v9];
  id v4 = v9;
  if (v4)
  {
    id v5 = EDAttachmentsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __68__EDAttachmentPersistence_attachmentMetadataForMessageAttachmentID___block_invoke_cold_1();
    }
  }
  else
  {
    id v5 = EDAttachmentsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[5];
      uint64_t v7 = [*(id *)(*(void *)(a1[6] + 8) + 40) attachmentID];
      *(_DWORD *)buf = 138412546;
      uint64_t v12 = v6;
      __int16 v13 = 2114;
      id v14 = v7;
      _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Found attachment metadata for messageAttachmentID %@ attachmentID %{public}@", buf, 0x16u);
    }
  }

  return 1;
}

void __68__EDAttachmentPersistence_attachmentMetadataForMessageAttachmentID___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [EDAttachmentMetadata alloc];
  id v4 = [v11 objectForKeyedSubscript:@"attachment"];
  id v5 = [v4 numberValue];
  uint64_t v6 = [v11 objectForKeyedSubscript:@"file_name_on_file_system"];
  uint64_t v7 = [v6 stringValue];
  uint64_t v8 = [(EDAttachmentMetadata *)v3 initWithAttachmentID:v5 nameOnDisk:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)insertMimePartAttachments:(id)a3 forGlobalMessageID:(int64_t)a4
{
  id v6 = a3;
  if ([v6 count] && *MEMORY[0x1E4F5FCC8] != a4)
  {
    uint64_t v7 = [(EDAttachmentPersistence *)self database];
    uint64_t v8 = [NSString stringWithUTF8String:"-[EDAttachmentPersistence insertMimePartAttachments:forGlobalMessageID:]"];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__EDAttachmentPersistence_insertMimePartAttachments_forGlobalMessageID___block_invoke;
    v9[3] = &unk_1E6BFF4A0;
    id v10 = v6;
    int64_t v11 = a4;
    objc_msgSend(v7, "__performWriteWithCaller:usingBlock:", v8, v9);
  }
}

uint64_t __72__EDAttachmentPersistence_insertMimePartAttachments_forGlobalMessageID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v27 = [a2 preparedStatementForQueryString:@"INSERT OR IGNORE INTO message_attachments (global_message_id, name, mime_part_number) VALUES (:global_id, :name, :mime)"];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v3)
  {
    uint64_t v5 = *(void *)v31;
    *(void *)&long long v4 = 138543874;
    long long v25 = v4;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v31 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "first", v25);
        uint64_t v9 = @"1";
        if (([v8 isEqualToString:&stru_1F3583658] & 1) == 0)
        {
          uint64_t v9 = [v7 first];
        }

        id v10 = [v7 first];
        int v11 = [v10 isEqualToString:&stru_1F3583658];

        if (v11)
        {
          uint64_t v12 = EDAttachmentsLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v13 = *(__CFString **)(a1 + 40);
            *(_DWORD *)buf = 134217984;
            id v35 = v13;
            _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "Updated MIME part to 1 for message with global id %lld", buf, 0xCu);
          }
        }
        if (v9)
        {
          uint64_t v14 = [v7 second];
          uint64_t v15 = (void *)v14;
          id v16 = @"attachment";
          if (v14) {
            id v16 = (__CFString *)v14;
          }
          id v17 = v16;

          uint64_t v29 = 0;
          v40[0] = @":global_id";
          uint64_t v18 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
          v41[0] = v18;
          v41[1] = v17;
          v40[1] = @":name";
          v40[2] = @":mime";
          v41[2] = v9;
          id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];

          id v28 = 0;
          LOBYTE(v18) = [v27 executeWithNamedBindings:v19 rowsChanged:&v29 error:&v28];
          id v20 = v28;
          if (v18)
          {
            if (!v29)
            {
              id v21 = EDAttachmentsLog();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v22 = *(void *)(a1 + 40);
                *(_DWORD *)buf = 138543618;
                id v35 = v9;
                __int16 v36 = 2048;
                uint64_t v37 = v22;
                _os_log_impl(&dword_1DB39C000, v21, OS_LOG_TYPE_DEFAULT, "Message attachment for part '%{public}@', global message ID %lld already exists. Not inserting.", buf, 0x16u);
              }
              goto LABEL_21;
            }
          }
          else
          {
            id v21 = EDAttachmentsLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              uint64_t v23 = *(void *)(a1 + 40);
              *(_DWORD *)buf = v25;
              id v35 = v9;
              __int16 v36 = 2048;
              uint64_t v37 = v23;
              __int16 v38 = 2114;
              id v39 = v20;
              _os_log_error_impl(&dword_1DB39C000, v21, OS_LOG_TYPE_ERROR, "Failed to insert message attachment for part '%{public}@', global message ID %lld: error %{public}@", buf, 0x20u);
            }
LABEL_21:
          }
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v3);
  }

  return 1;
}

- (void)enumerateAttachmentsInfoForGlobalMessageIDs:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [(EDAttachmentPersistence *)self database];
    uint64_t v9 = [NSString stringWithUTF8String:"-[EDAttachmentPersistence enumerateAttachmentsInfoForGlobalMessageIDs:withBlock:]"];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __81__EDAttachmentPersistence_enumerateAttachmentsInfoForGlobalMessageIDs_withBlock___block_invoke;
    v10[3] = &unk_1E6BFF5B0;
    id v11 = v6;
    id v12 = v7;
    objc_msgSend(v8, "__performReadWithCaller:usingBlock:", v9, v10);
  }
}

uint64_t __81__EDAttachmentPersistence_enumerateAttachmentsInfoForGlobalMessageIDs_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = objc_msgSend(*(id *)(a1 + 32), "ef_map:", &__block_literal_global_2);
  uint64_t v5 = [v4 componentsJoinedByString:@","];

  id v6 = [NSString stringWithFormat:@"SELECT message_attachments.global_message_id, message_attachments.mime_part_number, attachments.rowid, attachments.file_name_on_file_system FROM message_attachments LEFT JOIN attachments ON attachments.rowid == message_attachments.attachment WHERE message_attachments.global_message_id in (%@)", v5];
  id v7 = [v3 preparedStatementForQueryString:v6];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__EDAttachmentPersistence_enumerateAttachmentsInfoForGlobalMessageIDs_withBlock___block_invoke_3;
  v12[3] = &unk_1E6BFF588;
  id v13 = *(id *)(a1 + 40);
  id v11 = 0;
  LOBYTE(a1) = [v7 executeUsingBlock:v12 error:&v11];
  id v8 = v11;
  if ((a1 & 1) == 0)
  {
    uint64_t v9 = EDAttachmentsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __81__EDAttachmentPersistence_enumerateAttachmentsInfoForGlobalMessageIDs_withBlock___block_invoke_cold_1((uint64_t)v8, v9);
    }
  }
  return 1;
}

id __81__EDAttachmentPersistence_enumerateAttachmentsInfoForGlobalMessageIDs_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 stringValue];

  return v2;
}

void __81__EDAttachmentPersistence_enumerateAttachmentsInfoForGlobalMessageIDs_withBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 objectAtIndexedSubscript:0];
  [v3 int64Value];

  long long v4 = [v9 objectAtIndexedSubscript:1];
  uint64_t v5 = [v4 stringValue];

  id v6 = [v9 objectAtIndexedSubscript:2];
  [v6 int64Value];

  id v7 = [v9 objectAtIndexedSubscript:3];
  id v8 = [v7 stringValue];

  if (v5) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (EDPersistenceDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (void).cxx_destruct
{
}

void __59__EDAttachmentPersistence_attachmentMetadataForMessageIDs___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch attachment metadata for messages %{public}@", (uint8_t *)&v3, 0xCu);
}

void __71__EDAttachmentPersistence_attachmentMetadataForMessage_mimePartNumber___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1DB39C000, v0, v1, "Failed to fetch attachment metadata for message %lld mime part %{public}@ error %{public}@");
}

void __66__EDAttachmentPersistence_attachmentMetadataForMessage_remoteURL___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 134218498;
  *(void *)&v3[4] = *(void *)(a1 + 56);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(a1 + 40);
  *(_WORD *)&v3[22] = 2114;
  OUTLINED_FUNCTION_0_1(&dword_1DB39C000, a2, a3, "Failed to fetch attachment metadata for message %lld remoteURL %@ error %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], a2);
}

void __68__EDAttachmentPersistence_attachmentMetadataForMessageAttachmentID___block_invoke_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_1();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1DB39C000, v1, OS_LOG_TYPE_ERROR, "Failed to fetch attachment metadata for messageAttachmentID %@ error %{public}@", v2, 0x16u);
}

void __81__EDAttachmentPersistence_enumerateAttachmentsInfoForGlobalMessageIDs_withBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Failed to get message attachment for global message IDs: error %{public}@", (uint8_t *)&v2, 0xCu);
}

@end