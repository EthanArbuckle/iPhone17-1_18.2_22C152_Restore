@interface EDAddMessagesFollowUpColumnUpgradeStep
+ (int)runWithConnection:(id)a3;
@end

@implementation EDAddMessagesFollowUpColumnUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3 = a3;
  int v4 = sqlite3_exec((sqlite3 *)[v3 sqlDB], "ALTER TABLE message_global_data ADD COLUMN follow_up_start_date INTEGER;ALTER TABLE message_global_data ADD COL"
         "UMN follow_up_end_date INTEGER;CREATE INDEX IF NOT EXISTS message_global_data_follow_up_start_date_index ON mes"
         "sage_global_data(follow_up_start_date);CREATE INDEX IF NOT EXISTS message_global_data_follow_up_end_date_index "
         "ON message_global_data(follow_up_end_date);",
         0,
         0,
         0);

  return v4;
}

@end