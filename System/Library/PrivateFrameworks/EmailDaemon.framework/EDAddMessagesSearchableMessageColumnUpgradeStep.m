@interface EDAddMessagesSearchableMessageColumnUpgradeStep
+ (int)runWithConnection:(id)a3;
@end

@implementation EDAddMessagesSearchableMessageColumnUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3 = a3;
  if ([v3 columnExists:@"searchable_message" inTable:@"messages" type:0])
  {
    int v4 = 0;
  }
  else
  {
    int v5 = objc_msgSend(v3, "executeStatementString:errorMessage:", @"ALTER TABLE messages ADD COLUMN searchable_message INTEGER REFERENCES searchable_messages(message_id) ON DELETE SET NULL;",
           @"Unable to add searchable_message column to messages");
    if (v5)
    {
      int v5 = objc_msgSend(v3, "executeStatementString:errorMessage:", @"UPDATE OR IGNORE messages SET searchable_message = (SELECT searchable_messages.ROWID FROM searchable_messages WHERE searchable_messages.ROWID = messages.ROWID);",
             @"Unable to populate searchable_message");
      if (v5)
      {
        int v5 = objc_msgSend(v3, "executeStatementString:errorMessage:", @"CREATE INDEX IF NOT EXISTS messages_searchable_message_deleted_index ON messages(searchable_message, deleted);",
               @"Unable to add messages_searchable_message_deleted_index");
        if (v5) {
          int v5 = objc_msgSend(v3, "executeStatementString:errorMessage:", @"CREATE INDEX IF NOT EXISTS searchable_messages_transaction_id_message_id_index ON searchable_messages(transaction_id, message_id);",
        }
                 @"Unable to add searchable_messages_transaction_id_message_id_index");
      }
    }
    int v4 = v5 ^ 1;
  }

  return v4;
}

@end