@interface TMDataMigrator
- (BOOL)performMigration;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)dataClassName;
@end

@implementation TMDataMigrator

- (id)dataClassName
{
  return @"CoreTime";
}

- (BOOL)performMigration
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppBooleanValue(@"automatic-time", @"com.apple.preferences.datetime", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    TMSetAutomaticTimeEnabled();
    TMSetAutomaticTimeZoneEnabled();
    CFPreferencesSetAppValue(@"automatic-time", 0, @"com.apple.preferences.datetime");
    CFPreferencesAppSynchronize(@"com.apple.preferences.datetime");
  }
  return 1;
}

- (float)estimatedDuration
{
  return 0.0;
}

- (float)migrationProgress
{
  return 0.0;
}

@end