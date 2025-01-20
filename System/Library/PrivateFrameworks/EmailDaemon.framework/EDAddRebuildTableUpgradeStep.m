@interface EDAddRebuildTableUpgradeStep
+ (int)runWithConnection:(id)a3;
@end

@implementation EDAddRebuildTableUpgradeStep

+ (int)runWithConnection:(id)a3
{
  return [a3 executeStatementString:@"CREATE TABLE IF NOT EXISTS searchable_rebuild (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, message_id INTEGER NOT NULL)", @"Unable to create searchable_rebuild table" errorMessage] ^ 1;
}

@end