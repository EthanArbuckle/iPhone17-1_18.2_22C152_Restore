@interface IDSOpportunisticDeliveryController
- (BOOL)diceRoll;
- (BOOL)sendOpportunisticData:(id)a3 toDestination:(id)a4;
- (IDSDAccountController)accountController;
- (IDSOpportunisticCache)cache;
- (IDSOpportunisticDeliveryController)init;
- (IDSOpportunisticDeliveryController)initWithCache:(id)a3 accountController:(id)a4;
- (OS_dispatch_queue)opportunisticQueue;
- (void)addOpportunisticData:(id)a3 serviceName:(id)a4 accountUniqueID:(id)a5 identifier:(id)a6 options:(id)a7 completion:(id)a8;
- (void)removeOpportunisticDataForIdentifier:(id)a3 serviceName:(id)a4 completion:(id)a5;
- (void)sendOpportunisticDataIfNeededToDestination:(id)a3 completion:(id)a4;
- (void)setAccountController:(id)a3;
- (void)setCache:(id)a3;
- (void)setOpportunisticQueue:(id)a3;
@end

@implementation IDSOpportunisticDeliveryController

- (IDSOpportunisticDeliveryController)init
{
  v3 = objc_alloc_init(IDSOpportunisticCache);
  v4 = [(IDSOpportunisticDeliveryController *)self initWithCache:v3 accountController:0];

  return v4;
}

- (IDSOpportunisticDeliveryController)initWithCache:(id)a3 accountController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IDSOpportunisticDeliveryController;
  v9 = [(IDSOpportunisticDeliveryController *)&v13 init];
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.ids.opportunisticdeliverycontroller", 0);
    opportunisticQueue = v9->_opportunisticQueue;
    v9->_opportunisticQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_cache, a3);
    objc_storeStrong((id *)&v9->_accountController, a4);
  }

  return v9;
}

- (IDSDAccountController)accountController
{
  accountController = self->_accountController;
  if (accountController)
  {
    v3 = accountController;
  }
  else
  {
    v3 = +[IDSDAccountController sharedInstance];
  }

  return v3;
}

- (void)addOpportunisticData:(id)a3 serviceName:(id)a4 accountUniqueID:(id)a5 identifier:(id)a6 options:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  opportunisticQueue = self->_opportunisticQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100058BEC;
  block[3] = &unk_100980098;
  id v28 = v17;
  id v29 = v15;
  id v30 = v16;
  id v31 = v18;
  id v32 = v14;
  v33 = self;
  id v34 = v19;
  id v21 = v19;
  id v22 = v14;
  id v23 = v18;
  id v24 = v16;
  id v25 = v15;
  id v26 = v17;
  dispatch_async(opportunisticQueue, block);
}

- (void)removeOpportunisticDataForIdentifier:(id)a3 serviceName:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  opportunisticQueue = self->_opportunisticQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100058E2C;
  v15[3] = &unk_1009800C0;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(opportunisticQueue, v15);
}

- (BOOL)diceRoll
{
  uint32_t v2 = arc4random_uniform(0x64u);
  v3 = +[IDSServerBag sharedInstance];
  v4 = [v3 objectForKey:@"ids-opportunistic-send-percentage"];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    signed int v5 = [v4 intValue];
    uint64_t v6 = v5;
    id v7 = +[IDSFoundationLog opportunistic];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Fetched Opportunistic Send Percentage from Bag {opportunisticSendPercentage: %d}", (uint8_t *)v9, 8u);
    }
  }
  else
  {
    uint64_t v6 = 10;
  }

  return v6 > v2;
}

- (void)sendOpportunisticDataIfNeededToDestination:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  opportunisticQueue = self->_opportunisticQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100059120;
  block[3] = &unk_1009800E8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(opportunisticQueue, block);
}

- (BOOL)sendOpportunisticData:(id)a3 toDestination:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IDSOpportunisticDeliveryController *)self accountController];
  id v9 = [v6 accountUniqueID];
  id v10 = [v8 accountWithUniqueID:v9];

  if (v10)
  {
    id v31 = [v6 data];
    v11 = [v6 identifier];
    id v12 = [v6 serviceName];
    v47[0] = @"i";
    v47[1] = @"s";
    v48[0] = v11;
    v48[1] = v12;
    v47[2] = @"d";
    v48[2] = v31;
    id v30 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:3];
    id v13 = +[NSString stringGUID];
    id v14 = IDSGetUUIDData();

    id v15 = objc_alloc_init((Class)IDSSendParameters);
    id v16 = [v10 uniqueID];
    [v15 setAccountUUID:v16];

    [v15 setMessage:v30];
    [v15 setCommand:&off_1009D0C00];
    [v15 setPriority:300];
    [v15 setFireAndForget:1];
    [v15 setEncryptPayload:1];
    [v15 setDestinations:v7];
    [v15 setAlwaysSkipSelf:1];
    [v15 setMessageUUID:v14];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100059680;
    v40[3] = &unk_100980110;
    id v17 = v11;
    id v41 = v17;
    id v18 = v14;
    id v42 = v18;
    id v19 = objc_retainBlock(v40);
    v20 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000597B4;
    block[3] = &unk_100980160;
    id v33 = v10;
    id v34 = v15;
    id v35 = v17;
    id v36 = v18;
    id v39 = v19;
    id v37 = v12;
    id v38 = v7;
    id v21 = v12;
    id v22 = v18;
    id v23 = v17;
    id v24 = v19;
    id v25 = v15;
    dispatch_async(v20, block);
  }
  else
  {
    id v26 = +[IDSFoundationLog opportunistic];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [v6 identifier];
      id v28 = [v6 accountUniqueID];
      *(_DWORD *)buf = 138412546;
      v44 = v27;
      __int16 v45 = 2112;
      v46 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Failed to find account for opportunistic send {identifier: %@, accountUniqueID: %@}", buf, 0x16u);
    }
    [v6 markInvalid];
  }

  return v10 != 0;
}

- (OS_dispatch_queue)opportunisticQueue
{
  return self->_opportunisticQueue;
}

- (void)setOpportunisticQueue:(id)a3
{
}

- (IDSOpportunisticCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (void)setAccountController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountController, 0);
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_opportunisticQueue, 0);
}

@end