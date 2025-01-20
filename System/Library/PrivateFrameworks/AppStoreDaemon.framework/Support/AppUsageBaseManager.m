@interface AppUsageBaseManager
- (AppUsageBaseManager)init;
- (id)createMetricsEventsForEventType:(unsigned __int8)a3 context:(id)a4;
@end

@implementation AppUsageBaseManager

- (AppUsageBaseManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)AppUsageBaseManager;
  v2 = [(AppUsageBaseManager *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.AppUsageBaseManager.dispatch", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (id)createMetricsEventsForEventType:(unsigned __int8)a3 context:(id)a4
{
  return 0;
}

- (void).cxx_destruct
{
}

@end