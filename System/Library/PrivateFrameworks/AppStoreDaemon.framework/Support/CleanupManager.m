@interface CleanupManager
- (CleanupManager)init;
@end

@implementation CleanupManager

- (CleanupManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)CleanupManager;
  v2 = [(CleanupManager *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.CleanupManager.dispatch", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end