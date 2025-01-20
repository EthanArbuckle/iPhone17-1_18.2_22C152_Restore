@interface WriteMMappedImage
@end

@implementation WriteMMappedImage

void ___WriteMMappedImage_block_invoke()
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F08850] defaultManager];
  v1 = _BridgeIconCachePath();
  id v7 = 0;
  int v2 = [v0 createDirectoryAtPath:v1 withIntermediateDirectories:0 attributes:0 error:&v7];
  id v3 = v7;

  if (v2) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    v5 = bps_utility_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = _BridgeIconCachePath();
      *(_DWORD *)buf = 138412546;
      v9 = v6;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_21C513000, v5, OS_LOG_TYPE_DEFAULT, "Failed to create (%@) dir: %@", buf, 0x16u);
    }
  }
}

void ___WriteMMappedImage_block_invoke_132(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  _CachePathForIcon(*(void **)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 writeToCPBitmapFile:v2 flags:0];
}

@end