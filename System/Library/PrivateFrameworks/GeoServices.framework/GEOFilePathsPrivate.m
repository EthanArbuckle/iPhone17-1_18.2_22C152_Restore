@interface GEOFilePathsPrivate
+ (id)daemonContainerCachesPathUsingLibSystem;
+ (id)daemonContainerLibraryPathUsingLibSystem;
+ (id)daemonContainerPathUsingLibSystem;
+ (id)pathForSearchPath:(int)a3 andDomain:(int)a4;
+ (id)systemContainerCachesPathUsingLibSystem;
+ (id)systemContainerLibraryPathUsingLibSystem;
+ (id)systemContainerPathUsingLibSystem;
+ (id)userContainerCachesPathUsingLibSystem;
+ (id)userContainerLibPathUsingLibSystem;
@end

@implementation GEOFilePathsPrivate

void __56__GEOFilePathsPrivate_daemonContainerPathUsingLibSystem__block_invoke()
{
  id v1 = +[GEOEntitlements currentProcessEntitlement:@"com.apple.security.system-groups"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v0 = [v1 containsObject:@"systemgroup.com.apple.geod"];
  }
  else {
    char v0 = 0;
  }
  _MergedGlobals_222 = v0;
}

+ (id)pathForSearchPath:(int)a3 andDomain:(int)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = NSStartSearchPathEnumerationPrivate();
  MEMORY[0x18C11EA50](v4, v7);
  v5 = (void *)[[NSString alloc] initWithUTF8String:v7];

  return v5;
}

+ (id)systemContainerLibraryPathUsingLibSystem
{
  v2 = [a1 systemContainerPathUsingLibSystem];
  v3 = [v2 stringByAppendingPathComponent:@"Library"];

  return v3;
}

+ (id)systemContainerPathUsingLibSystem
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = container_system_path_for_identifier();
  if (v2)
  {
    v3 = (void *)v2;
    uint64_t v4 = (void *)[[NSString alloc] initWithUTF8String:v2];
    free(v3);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v7 = 1;
      __int16 v8 = 2080;
      uint64_t v9 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "[ERROR] system container error %llu. system container path = '%s'", buf, 0x16u);
    }
    uint64_t v4 = 0;
  }

  return v4;
}

+ (id)daemonContainerLibraryPathUsingLibSystem
{
  uint64_t v2 = [a1 daemonContainerPathUsingLibSystem];
  v3 = [v2 stringByAppendingPathComponent:@"Library"];

  return v3;
}

+ (id)daemonContainerPathUsingLibSystem
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (qword_1EB29F930 != -1) {
    dispatch_once(&qword_1EB29F930, &__block_literal_global_63);
  }
  if (_MergedGlobals_222)
  {
    uint64_t v2 = container_system_group_path_for_identifier();
    if (v2)
    {
      v3 = (void *)v2;
      uint64_t v4 = (void *)[[NSString alloc] initWithUTF8String:v2];
      free(v3);
      goto LABEL_9;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v7 = 1;
      __int16 v8 = 2080;
      uint64_t v9 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "[ERROR] system container error %llu system container path = '%s'", buf, 0x16u);
    }
  }
  uint64_t v4 = 0;
LABEL_9:

  return v4;
}

+ (id)userContainerLibPathUsingLibSystem
{
  return (id)[a1 pathForSearchPath:5 andDomain:16];
}

+ (id)userContainerCachesPathUsingLibSystem
{
  return (id)[a1 pathForSearchPath:13 andDomain:16];
}

+ (id)systemContainerCachesPathUsingLibSystem
{
  uint64_t v2 = [a1 systemContainerLibraryPathUsingLibSystem];
  v3 = [v2 stringByAppendingPathComponent:@"Caches"];

  return v3;
}

+ (id)daemonContainerCachesPathUsingLibSystem
{
  uint64_t v2 = [a1 daemonContainerLibraryPathUsingLibSystem];
  v3 = [v2 stringByAppendingPathComponent:@"Caches"];

  return v3;
}

@end