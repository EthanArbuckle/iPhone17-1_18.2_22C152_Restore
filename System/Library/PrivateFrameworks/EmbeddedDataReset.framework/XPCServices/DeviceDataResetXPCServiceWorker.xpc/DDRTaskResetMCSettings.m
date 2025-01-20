@interface DDRTaskResetMCSettings
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskResetMCSettings

- (void)run
{
  id v2 = +[MCProfileConnection sharedConnection];
  [v2 resetAllSettingsToDefaults];
}

- (double)estimatedTimeOfCompletion
{
  return 0.3;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.resetMCSettings";
}

@end