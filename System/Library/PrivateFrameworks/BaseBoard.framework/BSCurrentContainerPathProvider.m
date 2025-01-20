@interface BSCurrentContainerPathProvider
- (NSURL)cachesPath;
- (NSURL)defaultPath;
- (NSURL)libraryPath;
@end

@implementation BSCurrentContainerPathProvider

- (NSURL)cachesPath
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v4 = [v3 firstObject];
  v5 = [v2 fileURLWithPath:v4];

  return (NSURL *)v5;
}

- (NSURL)defaultPath
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = NSHomeDirectory();
  v4 = [v2 fileURLWithPath:v3];

  return (NSURL *)v4;
}

- (NSURL)libraryPath
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v4 = [v3 firstObject];
  v5 = [v2 fileURLWithPath:v4];

  return (NSURL *)v5;
}

@end