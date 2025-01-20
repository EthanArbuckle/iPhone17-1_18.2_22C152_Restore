@interface HDCurrentActivitySummaryDemoQueryServer
+ (Class)queryClass;
- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable;
- (void)_queue_start;
@end

@implementation HDCurrentActivitySummaryDemoQueryServer

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable
{
  return 1;
}

- (void)_queue_start
{
  v8.receiver = self;
  v8.super_class = (Class)HDCurrentActivitySummaryDemoQueryServer;
  [(HDCurrentActivitySummaryDemoQueryServer *)&v8 _queue_start];
  v3 = [(HDCurrentActivitySummaryDemoQueryServer *)self clientProxy];
  v4 = sub_5654((uint64_t)self);
  _HKInitializeLogging();
  v5 = HKLogActivity;
  if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&def_E6CC, v5, OS_LOG_TYPE_INFO, "Delivering demo Activity Summary: %@", buf, 0xCu);
  }
  v9 = v4;
  v6 = +[NSArray arrayWithObjects:&v9 count:1];
  v7 = [(HDCurrentActivitySummaryDemoQueryServer *)self queryUUID];
  objc_msgSend(v3, "client_deliverActivitySummaries:queryUUID:", v6, v7);
}

@end