@interface XPCNotificationCenter
- (XPCNotificationCenter)init;
@end

@implementation XPCNotificationCenter

- (XPCNotificationCenter)init
{
  v11.receiver = self;
  v11.super_class = (Class)XPCNotificationCenter;
  v2 = [(XPCNotificationCenter *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.AppStoreFoundation.XPCNotificationCenter", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    notificationClients = v2->_notificationClients;
    v2->_notificationClients = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    notificationSources = v2->_notificationSources;
    v2->_notificationSources = v8;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationSources, 0);
  objc_storeStrong((id *)&self->_notificationClients, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end