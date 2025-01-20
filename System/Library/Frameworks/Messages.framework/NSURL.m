@interface NSURL
@end

@implementation NSURL

void __48__NSURL_MessagesAdditions____ms_cachesDirectory__block_invoke()
{
  v0 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v3 = [v0 lastObject];

  uint64_t v1 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3 isDirectory:1];
  v2 = (void *)__ms_cachesDirectory_sCachesDirectory;
  __ms_cachesDirectory_sCachesDirectory = v1;
}

@end