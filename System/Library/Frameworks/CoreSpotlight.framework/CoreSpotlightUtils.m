@interface CoreSpotlightUtils
+ (BOOL)detailedLoggingEnabled;
+ (BOOL)disabledUserActivities;
+ (BOOL)fastUserActivites;
+ (BOOL)forceDataMigration;
+ (void)initialize;
@end

@implementation CoreSpotlightUtils

+ (BOOL)fastUserActivites
{
  return CSFastUserActivites;
}

+ (void)initialize
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  CSFastUserActivites = [v2 BOOLForKey:@"CSFastUserActivities"];
  CSForceDataMigration = [v2 BOOLForKey:@"CSForceDataMigration"];
  gDisableUserActivities = [v2 BOOLForKey:@"CSDisableBackgroundHarvesting"];
  gCSLogDetailedActivity = [v2 BOOLForKey:@"CSLogDetailedActivity"];
}

+ (BOOL)detailedLoggingEnabled
{
  return gCSLogDetailedActivity;
}

+ (BOOL)disabledUserActivities
{
  return gDisableUserActivities;
}

+ (BOOL)forceDataMigration
{
  return CSForceDataMigration;
}

@end