@interface MOLocations
+ (NSURL)effectiveSettingsPath;
+ (id)effectiveSettingsDirectory;
+ (id)sharedDirectory;
@end

@implementation MOLocations

+ (NSURL)effectiveSettingsPath
{
  v2 = [a1 effectiveSettingsDirectory];
  v3 = [v2 URLByAppendingPathComponent:@"EffectiveSettings.plist" isDirectory:0];

  return (NSURL *)v3;
}

+ (id)effectiveSettingsDirectory
{
  v2 = [a1 sharedDirectory];
  v3 = [v2 URLByAppendingPathComponent:@"Library" isDirectory:1];
  v4 = [v3 URLByAppendingPathComponent:@"com.apple.ManagedSettings" isDirectory:1];

  return v4;
}

+ (id)sharedDirectory
{
  return (id)[MEMORY[0x1E4F1CB10] fileURLWithPath:@"/var/mobile" isDirectory:1];
}

@end