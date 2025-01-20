@interface CalWellKnownPaths
+ (BOOL)checkOrCreatePath:(id)a3;
+ (id)calendarFileHandlerPath;
+ (id)realHomeDirectoryPath;
@end

@implementation CalWellKnownPaths

+ (id)realHomeDirectoryPath
{
  uid_t v2 = getuid();
  v3 = getpwuid(v2);
  if (v3)
  {
    v4 = [NSString stringWithUTF8String:v3->pw_dir];
  }
  else
  {
    v4 = @"~/";
  }

  return v4;
}

+ (BOOL)checkOrCreatePath:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  v5 = [v3 defaultManager];
  v6 = [v4 stringByExpandingTildeToNonSandboxHome];

  char v14 = 0;
  if ([v5 fileExistsAtPath:v6 isDirectory:&v14]) {
    BOOL v7 = v14 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v13 = 0;
    char v11 = [v5 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v13];
    id v8 = v13;
    v9 = v8;
    if (v8)
    {
      v10 = [v8 localizedDescription];
      NSLog(&cfstr_UnableToCreate_0.isa, v6, v10);
    }
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

+ (id)calendarFileHandlerPath
{
  return @"/System/Library/CoreServices/CalendarFileHandler.app";
}

@end