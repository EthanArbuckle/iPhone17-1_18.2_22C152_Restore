@interface DEDDirectoriesCleanup
+ (BOOL)isDryRun;
+ (BOOL)shouldRun;
+ (void)didRun;
@end

@implementation DEDDirectoriesCleanup

+ (BOOL)isDryRun
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"directoriesCleanupDryRun"];

  return v3;
}

+ (BOOL)shouldRun
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"directoriesCleanupDone"] ^ 1;

  return v3;
}

+ (void)didRun
{
  id v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 setBool:1 forKey:@"directoriesCleanupDone"];
}

@end