@interface PSSSSiriSyncHandler
- (void)_startSubscriptionFetch;
- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6;
- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4;
@end

@implementation PSSSSiriSyncHandler

- (void).cxx_destruct
{
}

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  id v6 = a4;
  subscriptionsFuture = self->_subscriptionsFuture;
  id v8 = a3;
  v9 = [(AFFuture *)subscriptionsFuture waitForValue:dispatch_time(0, 10000000000)];
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "_pssSiriSync_anchorValue");
    unsigned __int8 v12 = [v8 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
      [v6 setPostAnchor:v11];
      [v6 setObject:v10];
    }
  }
  else
  {
    v13 = AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      v15 = "-[PSSSSiriSyncHandler getChangeAfterAnchor:changeInfo:]";
      _os_log_error_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "%s Timed out. Leaving sync state as is.", (uint8_t *)&v14, 0xCu);
    }
    [v6 setPostAnchor:v8];

    [v6 setObject:0];
  }
}

- (void)_startSubscriptionFetch
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = +[LSApplicationWorkspace defaultWorkspace];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_28F4;
  v16[3] = &unk_4188;
  id v17 = v3;
  id v5 = v3;
  [v4 enumerateBundlesOfType:1 block:v16];

  id v15 = 0;
  id v6 = (AFFuture *)[objc_alloc((Class)AFFuture) initAndGetSetterBlock:&v15];
  id v7 = v15;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_294C;
  v12[3] = &unk_41D8;
  id v13 = objc_alloc_init((Class)PSSSSubscriptionManagerInternal);
  id v14 = v7;
  id v8 = v13;
  id v9 = v7;
  [v8 getActiveSubscriptionServicesMatchingBundleIdentifiers:v5 domainIdentifiers:0 maximumExpirationLimit:v12 completionHandler:31104000.0];
  subscriptionsFuture = self->_subscriptionsFuture;
  self->_subscriptionsFuture = v6;
  v11 = v6;
}

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6
{
  id v8 = a6;
  if (([a4 isEqualToString:@"1"] & 1) == 0) {
    [v8 resetWithValidity:@"1"];
  }
  [(PSSSSiriSyncHandler *)self _startSubscriptionFetch];
}

@end