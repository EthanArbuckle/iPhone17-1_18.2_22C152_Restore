@interface FOLocations
+ (NSURL)familyControlsAuthorization;
+ (id)familyControlsDirectory;
+ (id)sharedDirectory;
@end

@implementation FOLocations

+ (NSURL)familyControlsAuthorization
{
  v2 = [a1 familyControlsDirectory];
  v3 = [v2 URLByAppendingPathComponent:@"Authorizations.plist" isDirectory:0];

  return (NSURL *)v3;
}

+ (id)familyControlsDirectory
{
  v2 = [a1 sharedDirectory];
  v3 = [v2 URLByAppendingPathComponent:@"Library" isDirectory:1];
  v4 = [v3 URLByAppendingPathComponent:@"com.apple.FamilyControlsAgent" isDirectory:1];

  return v4;
}

+ (id)sharedDirectory
{
  return (id)[NSURL fileURLWithPath:@"/var/mobile" isDirectory:1];
}

@end