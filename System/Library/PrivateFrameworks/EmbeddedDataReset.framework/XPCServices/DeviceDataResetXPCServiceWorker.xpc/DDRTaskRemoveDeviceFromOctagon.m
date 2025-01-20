@interface DDRTaskRemoveDeviceFromOctagon
- (double)estimatedTimeOfCompletion;
- (id)identifier;
- (void)run;
@end

@implementation DDRTaskRemoveDeviceFromOctagon

- (void)run
{
  id v2 = objc_alloc_init((Class)OTConfigurationContext);
  [v2 setContext:OTDefaultContext];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100002680;
  v7[3] = &unk_100010628;
  id v8 = [objc_alloc((Class)OTClique) initWithContextData:v2];
  v3 = dispatch_semaphore_create(0);
  v9 = v3;
  id v4 = v8;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v7);
  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v3, v5))
  {
    v6 = DDRLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100008BC0(v6);
    }
  }
}

- (double)estimatedTimeOfCompletion
{
  return 5.0;
}

- (id)identifier
{
  return @"com.apple.devicedatareset.removeDeviceFromOctagon";
}

@end