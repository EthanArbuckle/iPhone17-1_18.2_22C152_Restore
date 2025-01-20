@interface PurchaseService
- (PurchaseService)init;
- (void)adopt:(id)a3 withReplyHandler:(id)a4;
- (void)adoptableBundleIdentifiersWithReplyHandler:(id)a3;
- (void)checkStoreQueue:(int64_t)a3;
- (void)notifyDialogCompleteForPurchaseID:(id)a3 result:(BOOL)a4 selectedButton:(int64_t)a5 withResultHandler:(id)a6;
- (void)processPurchase:(id)a3 withReplyHandler:(id)a4;
- (void)processPurchases:(id)a3 withReplyHandler:(id)a4;
- (void)purchaseBatch:(id)a3 additionalBuyParams:(id)a4 withReplyHandler:(id)a5;
- (void)purchaseBatchWithItemMetadata:(id)a3 additionalBuyParams:(id)a4 withReplyHandler:(id)a5;
- (void)startPurchase:(id)a3 withReplyHandler:(id)a4;
@end

@implementation PurchaseService

- (PurchaseService)init
{
  v9.receiver = self;
  v9.super_class = (Class)PurchaseService;
  v2 = [(PurchaseService *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.AppStoreDaemon.PurchaseService", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = sub_100213454();
    purchaseInterface = v2->_purchaseInterface;
    v2->_purchaseInterface = (PurchaseManagerInterface *)v6;
  }
  return v2;
}

- (void)adopt:(id)a3 withReplyHandler:(id)a4
{
  dispatch_queue_t v4 = (void (**)(id, void *))a4;
  v5 = sub_100016788();
  uint64_t v6 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = objc_opt_class();
    id v9 = v8;
    v10 = [v5 processInfo];
    v11 = [v10 bundleIdentifier];
    int v12 = 138412802;
    v13 = v8;
    __int16 v14 = 2114;
    v15 = v5;
    __int16 v16 = 2114;
    v17 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[%@]: %{public}@ Adoption requested by %{public}@ but is not supported on this platform", (uint8_t *)&v12, 0x20u);
  }
  v7 = +[NSError errorWithDomain:ASDErrorDomain code:909 userInfo:0];
  v4[2](v4, v7);
}

- (void)adoptableBundleIdentifiersWithReplyHandler:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  dispatch_queue_t v4 = sub_100016788();
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = v6;
    v8 = [v4 processInfo];
    id v9 = [v8 bundleIdentifier];
    int v10 = 138412802;
    v11 = v6;
    __int16 v12 = 2114;
    v13 = v4;
    __int16 v14 = 2114;
    v15 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "[%@]: %{public}@ Adoptable bundle identifiers requested by %{public}@ but is not supported on this platform", (uint8_t *)&v10, 0x20u);
  }
  v3[2](v3, &__NSArray0__struct);
}

- (void)checkStoreQueue:(int64_t)a3
{
  v5 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10040AEA0;
  v8[3] = &unk_100525408;
  v8[4] = self;
  id v9 = v5;
  int64_t v10 = a3;
  id v7 = v5;
  sub_100010948(dispatchQueue, v8);
}

- (void)notifyDialogCompleteForPurchaseID:(id)a3 result:(BOOL)a4 selectedButton:(int64_t)a5 withResultHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  __int16 v12 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10040B14C;
  v17[3] = &unk_10052D330;
  v17[4] = self;
  id v18 = v10;
  BOOL v22 = a4;
  id v20 = v11;
  int64_t v21 = a5;
  id v19 = v12;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  sub_100010948(dispatchQueue, v17);
}

- (void)processPurchase:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10040B65C;
  v13[3] = &unk_100522420;
  v13[4] = self;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  sub_100010948(dispatchQueue, v13);
}

- (void)processPurchases:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10040BA54;
  v13[3] = &unk_100522420;
  v13[4] = self;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  sub_100010948(dispatchQueue, v13);
}

- (void)purchaseBatch:(id)a3 additionalBuyParams:(id)a4 withReplyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10040BE18;
  v17[3] = &unk_100522420;
  id v18 = v11;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  id v16 = v11;
  sub_100010948(dispatchQueue, v17);
}

- (void)purchaseBatchWithItemMetadata:(id)a3 additionalBuyParams:(id)a4 withReplyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10040C1F0;
  v17[3] = &unk_100522420;
  id v18 = v8;
  id v19 = v11;
  id v20 = v9;
  id v21 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  id v16 = v8;
  sub_100010948(dispatchQueue, v17);
}

- (void)startPurchase:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100016788();
  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10040C5BC;
  v13[3] = &unk_100522420;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  sub_100010948(dispatchQueue, v13);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseInterface, 0);
  objc_storeStrong((id *)&self->_legacyPurchaseInterface, 0);
  objc_storeStrong((id *)&self->_adoptionInterface, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end