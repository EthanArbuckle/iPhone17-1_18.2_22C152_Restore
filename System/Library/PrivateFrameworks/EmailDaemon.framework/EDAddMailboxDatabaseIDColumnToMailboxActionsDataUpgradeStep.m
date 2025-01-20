@interface EDAddMailboxDatabaseIDColumnToMailboxActionsDataUpgradeStep
+ (int)runWithConnection:(id)a3;
@end

@implementation EDAddMailboxDatabaseIDColumnToMailboxActionsDataUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3 = a3;
  if (sqlite3_table_column_metadata((sqlite3 *)[v3 sqlDB], 0, "mailbox_actions", "mailbox", 0, 0, 0, 0, 0))
  {
    int v4 = sqlite3_exec((sqlite3 *)[v3 sqlDB], "ALTER TABLE mailbox_actions ADD COLUMN mailbox INTEGER;",
           0,
           0,
           0);
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

@end