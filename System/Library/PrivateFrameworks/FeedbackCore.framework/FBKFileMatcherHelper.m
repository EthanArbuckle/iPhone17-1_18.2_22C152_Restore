@interface FBKFileMatcherHelper
+ (id)additionalDevicePlatforms;
+ (id)additionalSysdiagnoseMatcherWithPlatform:(id)a3;
+ (id)fakeSysdiagnoseRequirementWithPlatform:(id)a3;
+ (id)stubFilePredicateWithRequiresRemote:(BOOL)a3;
@end

@implementation FBKFileMatcherHelper

+ (id)additionalSysdiagnoseMatcherWithPlatform:(id)a3
{
  v4 = [a1 fakeSysdiagnoseRequirementWithPlatform:a3];
  v5 = [a1 stubFilePredicateWithRequiresRemote:0];
  v6 = [[FBKMatcherPredicate alloc] initWithFileMatcher:v4 filePredicate:v5];
  [(FBKMatcherPredicate *)v6 setIsAdditional:1];

  return v6;
}

+ (id)stubFilePredicateWithRequiresRemote:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = +[FBKFilePredicate entity];
  v5 = (void *)[objc_alloc(MEMORY[0x263EFF280]) initWithEntity:v4 insertIntoManagedObjectContext:0];
  [v5 setRequiresRemote:v3];

  return v5;
}

+ (id)additionalDevicePlatforms
{
  return +[FBKDeviceManager supportedPlatforms];
}

+ (id)fakeSysdiagnoseRequirementWithPlatform:(id)a3
{
  id v3 = a3;
  v4 = +[FBKFileMatcher entity];
  v5 = (void *)[objc_alloc(MEMORY[0x263EFF280]) initWithEntity:v4 insertIntoManagedObjectContext:0];
  [v5 setDeBundleIdentifier:@"com.apple.DiagnosticExtensions.sysdiagnose"];
  if ([v3 isEqualToString:*MEMORY[0x263F3A0E8]])
  {
    v6 = @"HomePod sysdiagnose";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F3A0F8]])
  {
    v6 = @"tvOS sysdiagnose";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F3A110]])
  {
    v6 = @"watchOS sysdiagnose";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F3A118]])
  {
    v6 = @"iOS sysdiagnose";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F3A0F0]])
  {
    v6 = @"macOS sysdiagnose";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F3A108]])
  {
    v6 = @"visionOS sysdiagnose";
  }
  else
  {
    v6 = @"Sysdiagnose";
  }
  [v5 setName:v6];
  [v5 setInstructionsAsHTML:&stru_26DDF6A30];
  v7 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"^.*sysdiagnose.*\\.tar\\.gz$" options:0 error:0];
  [v5 setRegularExpression:v7];

  [v5 setPlatform:v3];

  return v5;
}

@end