@interface GEOConfigRangeCheckEnabled
@end

@implementation GEOConfigRangeCheckEnabled

void ___GEOConfigRangeCheckEnabled_block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v0 = +[GEOPlatform sharedPlatform];
  int v1 = [v0 isInternalInstall];

  if (v1)
  {
    v2 = +[GEOFilePaths pathFor:1];
    v3 = [v2 stringByAppendingPathComponent:@"GEOConfigRangeClampDisabled"];
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v5 = [v4 fileExistsAtPath:v3];

    if (v5)
    {
      _MergedGlobals_270 = 1;
      v6 = j__GEOGetUserDefaultsLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v7 = 138412290;
        v8 = v3;
        _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "!!WARNING!! \"%@\" found, GEOConfig Range Clamping has been disabled", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

@end