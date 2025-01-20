@interface EDAddMessagesDeletedDateReceivedIndexUpgradeStep
+ (int)runWithConnection:(id)a3;
@end

@implementation EDAddMessagesDeletedDateReceivedIndexUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3 = a3;
  int v4 = sqlite3_exec((sqlite3 *)[v3 sqlDB], "CREATE INDEX IF NOT EXISTS messages_deleted_date_received_index ON messages(deleted, date_received);",
         0,
         0,
         0);

  return v4;
}

@end