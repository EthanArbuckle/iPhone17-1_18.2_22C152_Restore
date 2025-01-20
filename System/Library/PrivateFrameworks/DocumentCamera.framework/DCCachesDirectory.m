@interface DCCachesDirectory
+ (id)sharedCachesDirectory;
- (DCCachesDirectory)init;
- (NSURL)cachesDirectoryURL;
- (void)init;
@end

@implementation DCCachesDirectory

- (DCCachesDirectory)init
{
  v15.receiver = self;
  v15.super_class = (Class)DCCachesDirectory;
  v2 = [(DCCachesDirectory *)&v15 init];
  if (v2)
  {
    v3 = NSURL;
    v4 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v5 = [v4 lastObject];
    uint64_t v6 = [v3 fileURLWithPath:v5];

    v7 = [(id)v6 URLByAppendingPathComponent:@"com.apple.DocumentCamera"];

    v8 = [MEMORY[0x263F08850] defaultManager];
    id v14 = 0;
    LOBYTE(v6) = [v8 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v14];
    id v9 = v14;

    if ((v6 & 1) == 0)
    {
      v10 = os_log_create("com.apple.documentcamera", "");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        [(DCCachesDirectory *)(uint64_t)v7 init];
      }
    }
    cachesDirectoryURL = v2->_cachesDirectoryURL;
    v2->_cachesDirectoryURL = v7;
    v12 = v7;
  }
  return v2;
}

+ (id)sharedCachesDirectory
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__DCCachesDirectory_sharedCachesDirectory__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCachesDirectory_onceToken != -1) {
    dispatch_once(&sharedCachesDirectory_onceToken, block);
  }
  v2 = (void *)sharedCachesDirectory_sharedCachesDirectory;

  return v2;
}

void __42__DCCachesDirectory_sharedCachesDirectory__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedCachesDirectory_sharedCachesDirectory;
  sharedCachesDirectory_sharedCachesDirectory = (uint64_t)v1;
}

- (NSURL)cachesDirectoryURL
{
  return self->_cachesDirectoryURL;
}

- (void).cxx_destruct
{
}

- (void)init
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "Failed to create directory %@ with error %@.", (uint8_t *)&v3, 0x16u);
}

@end