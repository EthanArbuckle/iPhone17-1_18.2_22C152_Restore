@interface AXUpdateCacheVersionSimpleTask
+ (id)taskGroupIdentifier;
+ (id)triggers;
- (void)run:(id)a3;
@end

@implementation AXUpdateCacheVersionSimpleTask

+ (id)taskGroupIdentifier
{
  return @"kAXResourceCacheTaskGroup";
}

+ (id)triggers
{
  v2 = +[AXSimpleAssetTaskTrigger withFirstBootType];
  v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (void)run:(id)a3
{
  v3 = (void (**)(id, uint64_t))a3;
  v4 = AXLogAssetDaemon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "AXUpdateCacheVersionSimpleTask: Task did begin", buf, 2u);
  }

  v5 = +[TTSAXResourceManager sharedInstance];
  id v6 = [v5 readResourceCacheVersionFromPreferences];

  if (v6 != (id)4)
  {
    v7 = AXLogAssetDaemon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "AXUpdateCacheVersionSimpleTask: Mismatch in cache versions. Refreshing resources and updating cache version.", v12, 2u);
    }

    v8 = +[TTSAXResourceManager sharedInstance];
    id v9 = [v8 refreshResourcesCacheForManagerType:3];
  }
  v10 = AXLogAssetDaemon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "AXUpdateCacheVersionSimpleTask: Task did complete", v11, 2u);
  }

  v3[2](v3, 1);
}

@end