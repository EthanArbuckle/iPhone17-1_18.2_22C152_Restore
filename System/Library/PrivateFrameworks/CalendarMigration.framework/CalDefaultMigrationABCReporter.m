@interface CalDefaultMigrationABCReporter
+ (id)sharedInstance;
- (void)reportIssueWithType:(id)a3 subtype:(id)a4 context:(id)a5 events:(id)a6;
@end

@implementation CalDefaultMigrationABCReporter

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;
  return v2;
}

uint64_t __48__CalDefaultMigrationABCReporter_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_0 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (void)reportIssueWithType:(id)a3 subtype:(id)a4 context:(id)a5 events:(id)a6
{
  v9 = (objc_class *)MEMORY[0x263F2FFE0];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (id)[[v9 alloc] initWithType:v13 subtype:v12 context:v11];

  [v14 setEvents:v10];
  [v14 setIgnoreRateLimiting:1];
  [v14 report];
}

@end