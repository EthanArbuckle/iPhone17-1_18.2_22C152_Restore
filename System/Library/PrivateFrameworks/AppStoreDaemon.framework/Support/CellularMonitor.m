@interface CellularMonitor
- (CellularMonitor)init;
- (void)activeSubscriptionsDidChange;
- (void)dealloc;
- (void)internetDataStatus:(id)a3;
- (void)servingNetworkChanged:(id)a3;
@end

@implementation CellularMonitor

- (CellularMonitor)init
{
  v17.receiver = self;
  v17.super_class = (Class)CellularMonitor;
  v2 = [(CellularMonitor *)&v17 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.CellularMonitor", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = (CoreTelephonyClient *)[objc_alloc((Class)CoreTelephonyClient) initWithQueue:v2->_dispatchQueue];
    telephonyClient = v2->_telephonyClient;
    v2->_telephonyClient = v6;

    [(CoreTelephonyClient *)v2->_telephonyClient setDelegate:v2];
    if (os_variant_has_internal_content())
    {
      objc_initWeak(&location, v2);
      v8 = dispatch_get_global_queue(21, 0);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10035520C;
      handler[3] = &unk_100523F28;
      objc_copyWeak(&v15, &location);
      notify_register_dispatch("com.apple.appstored.emulatenetwork", &v2->_emulationToken, v8, handler);

      v9 = sub_1002C4494();
      sub_100355274((uint64_t)v2, v9);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    v10 = v2->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100355318;
    block[3] = &unk_100521388;
    v13 = v2;
    dispatch_async(v10, block);
  }
  return v2;
}

- (void)dealloc
{
  [(CoreTelephonyClient *)self->_telephonyClient setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)CellularMonitor;
  [(CellularMonitor *)&v3 dealloc];
}

- (void)internetDataStatus:(id)a3
{
  dispatch_queue_t v4 = (ASDCellularIdentity *)-[ASDCellularIdentity copyWithRoaming:](self->_identity, "copyWithRoaming:", [a3 inHomeCountry] ^ 1);
  identity = self->_identity;
  self->_identity = v4;
}

- (void)servingNetworkChanged:(id)a3
{
  if (self)
  {
    subscriptionContext = self->_subscriptionContext;
    telephonyClient = self->_telephonyClient;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100355B30;
    v5[3] = &unk_1005293D0;
    v5[4] = self;
    [(CoreTelephonyClient *)telephonyClient getDataStatus:subscriptionContext completion:v5];
  }
}

- (void)activeSubscriptionsDidChange
{
  telephonyClient = self->_telephonyClient;
  id v25 = 0;
  dispatch_queue_t v4 = [(CoreTelephonyClient *)telephonyClient getCurrentDataSubscriptionContextSync:&v25];
  v5 = v25;
  subscriptionContext = self->_subscriptionContext;
  self->_subscriptionContext = v4;

  v7 = self->_subscriptionContext;
  if (v7)
  {
    v8 = self->_telephonyClient;
    v24 = v5;
    uint64_t v9 = +[ASDCellularIdentity identityForSubscription:v7 usingClient:v8 error:&v24];
    v10 = v24;

    identity = self->_identity;
    self->_identity = (ASDCellularIdentity *)v9;

    v12 = [(ASDCellularIdentity *)self->_identity simIdentity];
    LOBYTE(v9) = [v12 isEqualToString:@"00000000000000000000"];

    if (v9)
    {
      v13 = ASDLogHandleForCategory();
      v14 = v13;
      if (v10)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v27 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[Network] Unable to identify cellular data subscription: %{public}@", buf, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[Network] There is no cellular data subscription", buf, 2u);
        }
        v10 = v14;
      }
    }
    else
    {
      v18 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [(ASDCellularIdentity *)self->_identity simIdentity];
        v20 = sub_1002F2418(v19);
        *(_DWORD *)buf = 138543362;
        v27 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[Network] Cellular data subscription became: %{public}@", buf, 0xCu);
      }
      v21 = sub_1002DC980();
      sub_1002DCAAC((uint64_t)v21);
      v22 = (unsigned char *)objc_claimAutoreleasedReturnValue();

      if (v22 && (v22[18] & 1) != 0)
      {
        v23 = [(ASDCellularIdentity *)self->_identity defaultsKey];
        sub_1003F2074((uint64_t)AppDefaultsManager, v23, @"ActiveCompanionSim");
      }
    }
  }
  else
  {
    id v15 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[Network] Unable to fetch current cellular data subscription: %{public}@", buf, 0xCu);
    }

    v16 = +[ASDCellularIdentity nullIdentity];
    objc_super v17 = self->_identity;
    self->_identity = v16;

    v10 = v5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emulation, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end