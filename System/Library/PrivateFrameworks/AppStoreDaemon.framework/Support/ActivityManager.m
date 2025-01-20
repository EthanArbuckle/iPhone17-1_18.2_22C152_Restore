@interface ActivityManager
- (ActivityManager)init;
@end

@implementation ActivityManager

- (ActivityManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)ActivityManager;
  v2 = [(ActivityManager *)&v15 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.ActivityManager.callout", v3);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.appstored.ActivityManager.dispatch", v6);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v7;

    v9 = sub_1003DA6D4();
    unsigned __int8 v10 = [v9 isHRNMode];

    if ((v10 & 1) == 0)
    {
      v11 = v2->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10020DEA4;
      block[3] = &unk_100521388;
      v14 = v2;
      dispatch_async(v11, block);
    }
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

@end