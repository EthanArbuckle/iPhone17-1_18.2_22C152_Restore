@interface EDDropMessagesReadIndexUpgradeStep
+ (int)runWithConnection:(id)a3;
@end

@implementation EDDropMessagesReadIndexUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3 = a3;
  int v4 = sqlite3_exec((sqlite3 *)[v3 sqlDB], "DROP INDEX IF EXISTS messages_read_index;", 0, 0, 0);

  return v4;
}

@end