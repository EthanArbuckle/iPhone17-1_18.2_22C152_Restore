@interface EDAddReadLaterTableUpgradeStep
+ (int)runWithConnection:(id)a3;
@end

@implementation EDAddReadLaterTableUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3 = a3;
  int v4 = objc_msgSend(v3, "executeStatementString:errorMessage:", @"ALTER TABLE threads ADD COLUMN read_later_date INTEGER;",
         @"Unable to add read_later_date column to threads");
  if (v4) {
    int v4 = objc_msgSend(v3, "executeStatementString:errorMessage:", @"CREATE TABLE IF NOT EXISTS read_later (global_message_id INTEGER PRIMARY KEY, date INTEGER NOT NULL);",
  }
           @"Unable to create read_later table");
  int v5 = v4 ^ 1;

  return v5;
}

@end