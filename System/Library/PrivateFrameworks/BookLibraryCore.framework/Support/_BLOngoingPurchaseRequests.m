@interface _BLOngoingPurchaseRequests
- (BOOL)checkAndAddStoreIDForRequest:(id)a3;
- (NSMutableSet)ongoingPurchaseRequestsByStoreID;
- (OS_dispatch_queue)accessQueue;
- (_BLOngoingPurchaseRequests)init;
- (id)_purchaseRequestStoreID:(id)a3;
- (void)removeStoreIDForRequest:(id)a3;
@end

@implementation _BLOngoingPurchaseRequests

- (_BLOngoingPurchaseRequests)init
{
  v9.receiver = self;
  v9.super_class = (Class)_BLOngoingPurchaseRequests;
  v2 = [(_BLOngoingPurchaseRequests *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ibooks.BLService._BLOngoingPurchaseRequests", v3);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    ongoingPurchaseRequestsByStoreID = v2->_ongoingPurchaseRequestsByStoreID;
    v2->_ongoingPurchaseRequestsByStoreID = v6;
  }
  return v2;
}

- (id)_purchaseRequestStoreID:(id)a3
{
  id v3 = a3;
  dispatch_queue_t v4 = [v3 buyParameters];
  v5 = [v3 storeIdentifier];

  if ((uint64_t)[v5 longLongValue] >= 1)
  {
    id v6 = v5;
LABEL_5:
    v7 = v6;
    goto LABEL_6;
  }
  if ([v4 length])
  {
    id v6 = +[BLUtilities storeIDFromBuyParameters:v4];
    goto LABEL_5;
  }
  v7 = 0;
LABEL_6:
  if ((uint64_t)[v7 longLongValue] <= 0)
  {
    v8 = BLServicePurchaseManagerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      v11 = v5;
      __int16 v12 = 2112;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Purchase-Mgr]: storeID not found: storeIdentifier=%@, buyParameters=%@", (uint8_t *)&v10, 0x16u);
    }
  }

  return v7;
}

- (BOOL)checkAndAddStoreIDForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v5 = [(_BLOngoingPurchaseRequests *)self _purchaseRequestStoreID:v4];
  if ((uint64_t)[v5 longLongValue] >= 1)
  {
    id v6 = [(_BLOngoingPurchaseRequests *)self accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000574E4;
    block[3] = &unk_1001A1D50;
    v11 = &v12;
    block[4] = self;
    id v10 = v5;
    dispatch_sync(v6, block);
  }
  BOOL v7 = *((unsigned char *)v13 + 24) == 0;

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)removeStoreIDForRequest:(id)a3
{
  id v4 = [(_BLOngoingPurchaseRequests *)self _purchaseRequestStoreID:a3];
  if ((uint64_t)[v4 longLongValue] >= 1)
  {
    v5 = [(_BLOngoingPurchaseRequests *)self accessQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100057644;
    v6[3] = &unk_1001A11A8;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(v5, v6);
  }
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (NSMutableSet)ongoingPurchaseRequestsByStoreID
{
  return self->_ongoingPurchaseRequestsByStoreID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ongoingPurchaseRequestsByStoreID, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end