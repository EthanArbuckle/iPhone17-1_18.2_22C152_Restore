@interface SYLogs
+ (BOOL)shouldDisplaySyncErrorMessage;
+ (BOOL)shouldDumpIDSOnSyncError;
+ (BOOL)shouldLogBubblesToAggD;
+ (id)logFolder;
+ (void)initialize;
@end

@implementation SYLogs

+ (void)initialize
{
  v10[1] = *MEMORY[0x263EF8340];
  if ((id)objc_opt_class() == a1)
  {
    v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v9 = @"SyncErrorAlert";
    v3 = [NSNumber numberWithBool:1];
    v10[0] = v3;
    v4 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [v2 registerDefaults:v4];

    v7 = @"Pumbaa";
    v5 = [NSNumber numberWithBool:0];
    v8 = v5;
    v6 = [NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    [v2 registerDefaults:v6];
  }
}

+ (id)logFolder
{
  if (logFolder_onceToken != -1) {
    dispatch_once(&logFolder_onceToken, &__block_literal_global);
  }
  v2 = (void *)logFolder___folder;
  return v2;
}

uint64_t __19__SYLogs_logFolder__block_invoke()
{
  int v0 = MGGetBoolAnswer();
  v1 = @"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/CompanionSync";
  if (v0) {
    v1 = @"/var/mobile/Library/Logs/CompanionSync";
  }
  logFolder___folder = (uint64_t)v1;
  return MEMORY[0x270F9A758]();
}

+ (BOOL)shouldDisplaySyncErrorMessage
{
  return 1;
}

+ (BOOL)shouldLogBubblesToAggD
{
  return 1;
}

+ (BOOL)shouldDumpIDSOnSyncError
{
  return 0;
}

@end