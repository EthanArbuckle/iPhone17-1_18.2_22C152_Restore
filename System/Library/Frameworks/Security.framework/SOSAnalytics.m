@interface SOSAnalytics
+ (id)databasePath;
+ (id)logger;
@end

@implementation SOSAnalytics

+ (id)logger
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SOSAnalytics;
  v2 = objc_msgSendSuper2(&v4, sel_logger);

  return v2;
}

+ (id)databasePath
{
  if (databasePath_onceToken != -1) {
    dispatch_once(&databasePath_onceToken, &__block_literal_global_4886);
  }

  return +[SFAnalytics defaultAnalyticsDatabasePath:@"sos_analytics"];
}

void __28__SOSAnalytics_databasePath__block_invoke()
{
  WithPathInKeychainDirectory(@"sos_analytics.db", (uint64_t)&__block_literal_global_28);
  WithPathInKeychainDirectory(@"sos_analytics.db-wal", (uint64_t)&__block_literal_global_33);

  WithPathInKeychainDirectory(@"sos_analytics.db-shm", (uint64_t)&__block_literal_global_38);
}

BOOL __28__SOSAnalytics_databasePath__block_invoke_4(int a1, std::__fs::filesystem::path *__p)
{
  return remove(__p, (std::error_code *)__p);
}

BOOL __28__SOSAnalytics_databasePath__block_invoke_3(int a1, std::__fs::filesystem::path *__p)
{
  return remove(__p, (std::error_code *)__p);
}

BOOL __28__SOSAnalytics_databasePath__block_invoke_2(int a1, std::__fs::filesystem::path *__p)
{
  return remove(__p, (std::error_code *)__p);
}

@end