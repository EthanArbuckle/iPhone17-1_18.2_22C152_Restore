@interface WirelessTrialStateRelay
- (WirelessTrialStateRelay)initWithMonitoring:(WirelessTrialStateDelegate *)a3;
- (id).cxx_construct;
- (optional<std::string>)getWirelessTrialIdentifier;
- (void)_updateWirelessTrialIdentifier:(optional<std::string> *)a3;
- (void)refreshWirelessTrialIdentifier;
- (void)subscribeToTrial;
@end

@implementation WirelessTrialStateRelay

- (WirelessTrialStateRelay)initWithMonitoring:(WirelessTrialStateDelegate *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)WirelessTrialStateRelay;
  v4 = [(WirelessTrialStateRelay *)&v11 init];
  if (v4)
  {
    if (objc_opt_class())
    {
      v4->_wirelessTrialStateDelegate = a3;
      dispatch_queue_t v5 = dispatch_queue_create("analyticsd.TrialCellularWireless.CallbackQueue", 0);
      fObj = v4->_trialCellularWirelessClientQueue.fObj.fObj;
      v4->_trialCellularWirelessClientQueue.fObj.fObj = (OS_dispatch_object *)v5;

      uint64_t v7 = +[TRIClient clientWithIdentifier:259];
      trialClient = v4->trialClient;
      v4->trialClient = (TRIClient *)v7;

      if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_DEBUG)) {
        sub_1000FFE34();
      }
      [(WirelessTrialStateRelay *)v4 subscribeToTrial];
    }
    v9 = v4;
  }

  return v4;
}

- (void)refreshWirelessTrialIdentifier
{
  [(WirelessTrialStateRelay *)self getWirelessTrialIdentifier];
  [(WirelessTrialStateRelay *)self _updateWirelessTrialIdentifier:&__p];
  if (v5)
  {
    if (v4 < 0) {
      operator delete(__p);
    }
  }
}

- (optional<std::string>)getWirelessTrialIdentifier
{
  uint64_t v2 = v1;
  [*(id *)(v1 + 8) refresh];
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&retstr->var0.var0 = v4;
  *((_OWORD *)&retstr->var0.var1.__r_.__value_.var0.var1 + 1) = v4;
  retstr->var0.var0 = 0;
  LOBYTE(retstr->var0.var1.__r_.var0) = 0;
  if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_DEBUG)) {
    sub_100100014();
  }
  char v5 = [*(id *)(v2 + 8) experimentIdentifiersWithNamespaceName:@"WIRELESS_DATA_ANALYTICS_CELLULAR_PRODUCT_EXPERIMENTATION_INTERNAL"];
  if (v5)
  {
    v6 = [*(id *)(v2 + 8) levelForFactor:off_10015E8B8 withNamespaceName:@"WIRELESS_DATA_ANALYTICS_CELLULAR_PRODUCT_EXPERIMENTATION_INTERNAL"];
    uint64_t v7 = v6;
    if (!v6)
    {
      if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_ERROR)) {
        sub_1000FFEF4();
      }
      goto LABEL_20;
    }
    v8 = [v6 fileValue];
    v9 = [v8 path];
    if (v9)
    {
      v10 = [v7 fileValue];
      objc_super v11 = [v10 path];
      BOOL v12 = [v11 length] == 0;

      if (!v12)
      {
        v13 = [v7 fileValue];
        v14 = [v13 path];
        v15 = +[NSURL fileURLWithPath:v14];

        if (v15)
        {
          id v16 = [v5 treatmentId];
          *(void *)v22 = [v16 UTF8String];
          sub_100066F58((std::string *)retstr, (std::string::value_type **)v22);
          v17 = (id)qword_10015EF78;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            v19 = [v5 experimentId];
            unsigned int v20 = [v5 deploymentId];
            if (*((char *)&retstr->var0.var1.__r_.__value_.var0.var1 + 23) >= 0) {
              data = retstr;
            }
            else {
              data = (optional<std::string> *)retstr->var0.var1.__r_.__value_.var0.var1.__data_;
            }
            *(_DWORD *)v22 = 138412802;
            *(void *)&v22[4] = v19;
            __int16 v23 = 1024;
            unsigned int v24 = v20;
            __int16 v25 = 2080;
            v26 = data;
            _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "[WirelessTrialStateRelay] WirelessTrialIdentifier: experimentIdentifiers are: experimentId: %@, deploymentId: %d, treatmentId: %s", v22, 0x1Cu);
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_ERROR))
        {
          sub_1000FFFB4();
        }

LABEL_20:
        goto LABEL_21;
      }
    }
    else
    {
    }
    if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_ERROR)) {
      sub_1000FFF54();
    }
    goto LABEL_20;
  }
  if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_DEBUG)) {
    sub_1000FFE94();
  }
LABEL_21:

  return result;
}

- (void)subscribeToTrial
{
  if (self->trialClient)
  {
    if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_DEBUG)) {
      sub_1001000D4();
    }
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    trialClient = self->trialClient;
    char v5 = sub_10000FD1C((id *)&self->_trialCellularWirelessClientQueue.fObj.fObj);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10008C5FC;
    v10[3] = &unk_100156190;
    v10[4] = &v13;
    objc_copyWeak(&v11, &location);
    id v6 = [(TRIClient *)trialClient addUpdateHandlerForNamespaceName:@"WIRELESS_DATA_ANALYTICS_CELLULAR_PRODUCT_EXPERIMENTATION_INTERNAL" queue:v5 usingBlock:v10];

    if (!*((unsigned char *)v14 + 24))
    {
      uint64_t v7 = qword_10015EF78;
      if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_INFO))
      {
        if (*((unsigned char *)v14 + 24)) {
          v8 = "YES";
        }
        else {
          v8 = "NO";
        }
        *(_DWORD *)buf = 136446210;
        v18 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[WirelessTrialStateRelay] WirelessTrialIdentifier: subscribeToTrial: trialCallbackReceived: %{public}s", buf, 0xCu);
      }
      id v9 = objc_loadWeakRetained(&location);
      [v9 refreshWirelessTrialIdentifier];
    }
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v13, 8);
  }
  else if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_ERROR))
  {
    sub_100100074();
  }
}

- (void)_updateWirelessTrialIdentifier:(optional<std::string> *)a3
{
  wirelessTrialStateDelegate = self->_wirelessTrialStateDelegate;
  sub_10007FD94((uint64_t)__p, (long long *)&a3->var0.var0);
  (*((void (**)(id *__return_ptr, WirelessTrialStateDelegate *, void **))wirelessTrialStateDelegate->var0 + 2))(&v5, wirelessTrialStateDelegate, __p);
  id v4 = v5;
  id v5 = 0;

  if (v8)
  {
    if (v7 < 0) {
      operator delete(__p[0]);
    }
  }
}

- (void).cxx_destruct
{
  fObj = self->_trialCellularWirelessClientQueue.fObj.fObj;
  self->_trialCellularWirelessClientQueue.fObj.fObj = 0;

  objc_storeStrong((id *)&self->trialClient, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end