@interface NTKUtilityFaceDialCachePathProvider
- (NSURL)cachesPath;
- (NSURL)defaultPath;
- (NSURL)libraryPath;
@end

@implementation NTKUtilityFaceDialCachePathProvider

- (NSURL)defaultPath
{
  v2 = BSCurrentUserDirectory();
  v3 = +[NSURL fileURLWithPath:v2];

  return (NSURL *)v3;
}

- (NSURL)libraryPath
{
  v2 = [(NTKUtilityFaceDialCachePathProvider *)self defaultPath];
  v3 = [v2 URLByAppendingPathComponent:@"Library"];

  return (NSURL *)v3;
}

- (NSURL)cachesPath
{
  v2 = [(NTKUtilityFaceDialCachePathProvider *)self libraryPath];
  v3 = [v2 URLByAppendingPathComponent:@"Caches"];

  return (NSURL *)v3;
}

@end