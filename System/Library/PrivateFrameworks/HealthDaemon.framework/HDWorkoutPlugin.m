@interface HDWorkoutPlugin
+ (BOOL)shouldLoadPluginForDaemon:(id)a3;
- (NSString)pluginIdentifier;
- (id)extensionForHealthDaemon:(id)a3;
- (id)extensionForProfile:(id)a3;
@end

@implementation HDWorkoutPlugin

- (NSString)pluginIdentifier
{
  return (NSString *)@"com.apple.health.WorkoutPlugin";
}

+ (BOOL)shouldLoadPluginForDaemon:(id)a3
{
  v3 = [a3 behavior];
  char v4 = [v3 supportsWorkouts];

  return v4;
}

- (id)extensionForHealthDaemon:(id)a3
{
  id v3 = a3;
  char v4 = [[HDWorkoutPluginDaemonExtension alloc] initWithDaemon:v3];

  return v4;
}

- (id)extensionForProfile:(id)a3
{
  return 0;
}

@end