@interface EDAddMessagesBrandIndicatorColumnUpgradeStep
+ (int)runWithConnection:(id)a3;
@end

@implementation EDAddMessagesBrandIndicatorColumnUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3 = a3;
  if ([v3 columnExists:@"brand_indicator" inTable:@"messages" type:0]) {
    int v4 = 0;
  }
  else {
    int v4 = sqlite3_exec((sqlite3 *)[v3 sqlDB], "ALTER TABLE messages ADD COLUMN brand_indicator INTEGER;CREATE INDEX IF NOT EXISTS messages_brand_indicator_i"
  }
           "ndex ON messages(brand_indicator);",
           0,
           0,
           0);

  return v4;
}

@end