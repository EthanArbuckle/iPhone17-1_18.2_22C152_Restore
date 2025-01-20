@interface LegacyActivityManager
- (LegacyActivityManager)init;
@end

@implementation LegacyActivityManager

- (LegacyActivityManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)LegacyActivityManager;
  v2 = [(LegacyActivityManager *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    backgroundTaskObservers = v2->_backgroundTaskObservers;
    v2->_backgroundTaskObservers = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.appstored.LegacyActivityManager.dispatch", v5);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v6;

    v2->_observerLock._os_unfair_lock_opaque = 0;
    v8 = v2->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100210F00;
    block[3] = &unk_100521388;
    v11 = v2;
    dispatch_async(v8, block);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_backgroundTaskObservers, 0);
}

@end