@interface VCPLogManager
+ (id)dateFormatter;
+ (id)dateFormatterDateTime;
+ (id)sharedLogManager;
- (BOOL)enableDatabaseLog;
- (VCPLogManager)init;
- (int)logLevel;
@end

@implementation VCPLogManager

+ (id)sharedLogManager
{
  if (+[VCPLogManager sharedLogManager]::once != -1) {
    dispatch_once(&+[VCPLogManager sharedLogManager]::once, &__block_literal_global_84);
  }
  v2 = (void *)+[VCPLogManager sharedLogManager]::instance;
  return v2;
}

void __33__VCPLogManager_sharedLogManager__block_invoke()
{
  v0 = objc_alloc_init(VCPLogManager);
  v1 = (void *)+[VCPLogManager sharedLogManager]::instance;
  +[VCPLogManager sharedLogManager]::instance = (uint64_t)v0;
}

- (VCPLogManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)VCPLogManager;
  v2 = [(VCPLogManager *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_logLevel = 6;
    v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v5 = [v4 persistentDomainForName:@"com.apple.mediaanalysis"];

    v6 = [v5 objectForKey:@"LogLevel"];
    v7 = v6;
    if (v6)
    {
      int v8 = [v6 intValue];
      if (v8 >= 7) {
        int v9 = 7;
      }
      else {
        int v9 = v8;
      }
      v3->_logLevel = v9 & ~(v9 >> 31);
    }
    v10 = [v5 objectForKey:@"EnableDatabaseLog"];
    v11 = v10;
    if (v10) {
      v3->_enableDatabaseLog = [v10 BOOLValue];
    }
  }
  return v3;
}

+ (id)dateFormatter
{
  if (+[VCPLogManager dateFormatter]::once != -1) {
    dispatch_once(&+[VCPLogManager dateFormatter]::once, &__block_literal_global_199);
  }
  v2 = (void *)+[VCPLogManager dateFormatter]::formatter;
  return v2;
}

void __30__VCPLogManager_dateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)+[VCPLogManager dateFormatter]::formatter;
  +[VCPLogManager dateFormatter]::formatter = (uint64_t)v0;

  [(id)+[VCPLogManager dateFormatter]::formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSSSSXXXX"];
  id v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  objc_msgSend((id)+[VCPLogManager dateFormatter]::formatter, "setLocale:");
}

+ (id)dateFormatterDateTime
{
  if (+[VCPLogManager dateFormatterDateTime]::once != -1) {
    dispatch_once(&+[VCPLogManager dateFormatterDateTime]::once, &__block_literal_global_206);
  }
  id v2 = (void *)+[VCPLogManager dateFormatterDateTime]::formatter;
  return v2;
}

void __38__VCPLogManager_dateFormatterDateTime__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)+[VCPLogManager dateFormatterDateTime]::formatter;
  +[VCPLogManager dateFormatterDateTime]::formatter = (uint64_t)v0;

  [(id)+[VCPLogManager dateFormatterDateTime]::formatter setDateFormat:@"yyyy-MM-dd HH:mm:ssXXXX"];
  id v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  objc_msgSend((id)+[VCPLogManager dateFormatterDateTime]::formatter, "setLocale:");
}

- (int)logLevel
{
  return self->_logLevel;
}

- (BOOL)enableDatabaseLog
{
  return self->_enableDatabaseLog;
}

@end