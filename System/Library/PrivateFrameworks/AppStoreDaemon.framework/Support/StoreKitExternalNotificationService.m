@interface StoreKitExternalNotificationService
- (StoreKitExternalNotificationService)init;
- (void)_handleBagChangedNotification:(id)a3;
- (void)presentSheetIfNeededForProcessHandle:(id)a3 completion:(id)a4;
@end

@implementation StoreKitExternalNotificationService

- (StoreKitExternalNotificationService)init
{
  v11.receiver = self;
  v11.super_class = (Class)StoreKitExternalNotificationService;
  v2 = [(StoreKitExternalNotificationService *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.StoreKitExternalNotificationService", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    displayedSheets = v2->_displayedSheets;
    v2->_displayedSheets = (NSMutableSet *)v6;

    uint64_t v8 = objc_opt_new();
    taskQueue = v2->_taskQueue;
    v2->_taskQueue = (TaskQueue *)v8;
  }
  return v2;
}

- (void)presentSheetIfNeededForProcessHandle:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10037994C;
  v13[3] = &unk_100522420;
  id v14 = v8;
  id v15 = v6;
  v16 = self;
  id v17 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  sub_100010948(dispatchQueue, v13);
}

- (void)_handleBagChangedNotification:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10037AA5C;
  block[3] = &unk_100521388;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_displayedSheets, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end