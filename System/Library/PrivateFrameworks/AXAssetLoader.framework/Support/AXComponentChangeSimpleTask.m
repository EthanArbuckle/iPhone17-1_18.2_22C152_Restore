@interface AXComponentChangeSimpleTask
+ (id)triggers;
- (void)didCompleteWithStatus:(unint64_t)a3;
- (void)run:(id)a3;
@end

@implementation AXComponentChangeSimpleTask

+ (id)triggers
{
  v2 = +[AXSimpleAssetTaskTrigger withNotificationName:@"com.apple.LaunchServices.ApplicationsChanged"];
  v6[0] = v2;
  v3 = +[AXSimpleAssetTaskTrigger withNotificationName:@"com.apple.coreaudio.components.changed"];
  v6[1] = v3;
  v4 = +[NSArray arrayWithObjects:v6 count:2];

  return v4;
}

- (void)run:(id)a3
{
  v3 = (void (**)(id, uint64_t))a3;
  v4 = AXLogAssetDaemon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "AXCompChangeTask: Task did begin", buf, 2u);
  }

  v5 = AXLogAssetDaemon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AXCompChangeTask: Will reconcile cached components for TTSSynthesisProviderVoiceManager", v11, 2u);
  }

  v6 = +[TTSSynthesisProviderVoiceManager sharedInstance];
  [v6 reconcileCachedComponents];

  v7 = +[AXAssetMetadataStore store];
  v8 = +[NSDate date];
  [v7 setValue:v8 forKey:@"ComponentChangeTaskSuccessful" forAssetType:kAXTTSResourceAssetType];

  v9 = AXLogAssetDaemon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "AXCompChangeTask: Task finishing", v10, 2u);
  }

  v3[2](v3, 1);
}

- (void)didCompleteWithStatus:(unint64_t)a3
{
  v3 = AXLogAssetDaemon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AXCompChangeTask: Will invoke AXUpdateResourcesSimpleTask now", v6, 2u);
  }

  v4 = +[AXSimpleAssetTaskManager sharedInstance];
  v5 = +[AXSimpleAssetTaskBase taskIdentifier];
  [v4 invokeTaskById:v5 arguments:&__NSDictionary0__struct];
}

@end