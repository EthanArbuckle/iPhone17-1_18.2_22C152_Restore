@interface NSFileManager(GKCachingAdditions)
- (double)_gkExpirationIntervalOfFileAtPath:()GKCachingAdditions;
- (ssize_t)_gkReadXattrBytes:()GKCachingAdditions count:withName:path:;
- (uint64_t)_gkRemoveXattrNamed:()GKCachingAdditions path:;
- (uint64_t)_gkWriteXattrBytes:()GKCachingAdditions count:withName:path:;
- (void)_gkSetExpirationInterval:()GKCachingAdditions ofFileAtPath:;
@end

@implementation NSFileManager(GKCachingAdditions)

- (ssize_t)_gkReadXattrBytes:()GKCachingAdditions count:withName:path:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  v11 = (const char *)[v10 fileSystemRepresentation];
  id v12 = v9;
  v13 = (const char *)[v12 UTF8String];
  unint64_t v14 = getxattr(v11, v13, 0, 0, 0, 0);
  if (v14 >= a4)
  {
    size_t v15 = a4;
  }
  else
  {
    size_t v15 = v14;
    v16 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v17 = GKOSLoggers();
      v16 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v20 = 138413058;
      id v21 = v12;
      __int16 v22 = 2048;
      size_t v23 = a4;
      __int16 v24 = 2048;
      size_t v25 = v15;
      __int16 v26 = 2112;
      id v27 = v10;
      _os_log_debug_impl(&dword_1C2D22000, v16, OS_LOG_TYPE_DEBUG, "-- Xattr: %@ -- count requested %ld is greater than actual byte count %ld so we're truncating. path = %@", (uint8_t *)&v20, 0x2Au);
    }
  }
  if (v15) {
    ssize_t v18 = getxattr(v11, v13, a3, v15, 0, 0);
  }
  else {
    ssize_t v18 = -1;
  }

  return v18;
}

- (uint64_t)_gkWriteXattrBytes:()GKCachingAdditions count:withName:path:
{
  id v9 = a6;
  id v10 = a5;
  v11 = (const char *)[v9 fileSystemRepresentation];
  id v12 = v10;
  v13 = (const char *)[v12 UTF8String];

  return setxattr(v11, v13, a3, a4, 0, 0);
}

- (uint64_t)_gkRemoveXattrNamed:()GKCachingAdditions path:
{
  id v5 = a4;
  id v6 = a3;
  v7 = (const char *)[v5 fileSystemRepresentation];
  id v8 = v6;
  id v9 = (const char *)[v8 UTF8String];

  return removexattr(v7, v9, 0);
}

- (double)_gkExpirationIntervalOfFileAtPath:()GKCachingAdditions
{
  double v4 = -1.0;
  if ([a1 _gkReadXattrBytes:&v4 count:8 withName:@"gamekit-cache-expiration" path:a3] < 1) {
    return 0.0;
  }
  else {
    return v4 - CFAbsoluteTimeGetCurrent();
  }
}

- (void)_gkSetExpirationInterval:()GKCachingAdditions ofFileAtPath:
{
  id v5 = a4;
  double v7 = CFAbsoluteTimeGetCurrent() + a1;
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v6 _gkWriteXattrBytes:&v7 count:8 withName:@"gamekit-cache-expiration" path:v5];
}

@end