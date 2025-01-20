@interface _MTClientDemarcatedCurrentContainerPathProvider
- (NSURL)cachesPath;
- (NSURL)defaultPath;
- (NSURL)libraryPath;
@end

@implementation _MTClientDemarcatedCurrentContainerPathProvider

- (NSURL)defaultPath
{
  v2 = NSURL;
  v3 = NSHomeDirectory();
  v4 = [v2 fileURLWithPath:v3];
  v5 = [MEMORY[0x263F086E0] mainBundle];
  v6 = [v5 bundleIdentifier];
  v7 = [v4 URLByAppendingPathComponent:v6];

  return (NSURL *)v7;
}

- (NSURL)libraryPath
{
  v2 = NSURL;
  v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v4 = [v3 firstObject];
  v5 = [v2 fileURLWithPath:v4];
  v6 = [MEMORY[0x263F086E0] mainBundle];
  v7 = [v6 bundleIdentifier];
  v8 = [v5 URLByAppendingPathComponent:v7];

  return (NSURL *)v8;
}

- (NSURL)cachesPath
{
  v2 = NSURL;
  v3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v4 = [v3 firstObject];
  v5 = [v2 fileURLWithPath:v4];
  v6 = [MEMORY[0x263F086E0] mainBundle];
  v7 = [v6 bundleIdentifier];
  v8 = [v5 URLByAppendingPathComponent:v7];

  return (NSURL *)v8;
}

@end