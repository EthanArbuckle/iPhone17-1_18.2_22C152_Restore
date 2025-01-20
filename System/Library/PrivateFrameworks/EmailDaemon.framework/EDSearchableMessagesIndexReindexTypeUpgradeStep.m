@interface EDSearchableMessagesIndexReindexTypeUpgradeStep
+ (int)runWithConnection:(id)a3;
@end

@implementation EDSearchableMessagesIndexReindexTypeUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3 = a3;
  int v4 = objc_msgSend(v3, "executeStatementString:errorMessage:", @"DROP INDEX IF EXISTS searchable_messages_message_id_reindex_type_index;",
         @"Unable to drop index searchable_messages_message_id_reindex_type_index index to searchable_messages");
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F60E78]) initWithName:@"reindex_type"];
  v6 = [v5 notEqualTo:&unk_1F35BAFB8];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4F60EB0]) initWithTableName:@"searchable_messages" columnNames:&unk_1F35BB588 where:v6 unique:0];
  v8 = [v7 definitionWithDatabaseName:0];
  if (v4) {
    [v3 executeStatementString:v8 errorMessage:@"Unable to add index searchable_messages_reindex_type_message_id_index to searchable_messages"];
  }

  return v4 ^ 1;
}

@end