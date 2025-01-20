@interface EMBiomeStreamDirectory
+ (OS_os_log)log;
+ (id)url;
+ (void)url;
@end

@implementation EMBiomeStreamDirectory

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__EMBiomeStreamDirectory_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_4 != -1) {
    dispatch_once(&log_onceToken_4, block);
  }
  v2 = (void *)log_log_4;
  return (OS_os_log *)v2;
}

void __29__EMBiomeStreamDirectory_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_4;
  log_log_4 = (uint64_t)v1;
}

+ (id)url
{
  v2 = +[EMPersistenceLayoutManager mailDataDirectory];
  id v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"BiomeStream" isDirectory:1 relativeToURL:v2];
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = [v3 path];
  char v6 = [v4 fileExistsAtPath:v5];

  if ((v6 & 1) != 0
    || ((id v14 = 0,
         char v7 = [v4 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&v14],
         (id v8 = v14) == 0)
      ? (char v9 = v7)
      : (char v9 = 0),
        (v9 & 1) != 0))
  {
    id v10 = v3;
  }
  else
  {
    v11 = v8;
    v12 = +[EMBiomeStreamDirectory log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[EMBiomeStreamDirectory url];
    }

    id v10 = 0;
  }

  return v10;
}

+ (void)url
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BEFDB000, a2, OS_LOG_TYPE_ERROR, "Error creating Biome storage directory: %@", (uint8_t *)&v2, 0xCu);
}

@end