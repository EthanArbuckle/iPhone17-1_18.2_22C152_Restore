@interface TelephonyStateRelay
- (BOOL)isStewieActive:(id)a3;
- (TelephonyStateRelay)initWithMonitoring:(TelephonyStateDelegate *)a3;
- (basic_string<char,)formatCellularRAT:(std::allocator<char>> *__return_ptr)retstr;
- (basic_string<char,)formatCellularRat:(std::allocator<char>> *__return_ptr)retstr forDeploymentType:;
- (basic_string<char,)formatInternetConnection:(std::allocator<char>> *__return_ptr)retstr;
- (char)formatSignalBars:(id)a3;
- (id).cxx_construct;
- (id)dataSubscriptionContext;
- (id)extractServingCellInfo:(id)a3;
- (int)cellularInternetConnectionStateAsEnum:(int)a3;
- (pair<LinkStateNotificationType,)extractLinkStateChange:(id)a3;
- (unsigned)extractHighThroughput:(id)a3;
- (void)_updateCellInternetStatusAndLQM:(int)a3 pdpContext:(int)a4;
- (void)_updateCellularLQM:(optional<LQMThreshold>)a3;
- (void)_updateCellularRAT:()basic_string<char;
- (void)_updateHighThroughput:(BOOL)a3;
- (void)_updateIsDualSim:(optional<BOOL>)a3;
- (void)_updateServingCarrierName:(optional<std::string> *)a3;
- (void)_updateSignalBars:(char)a3;
- (void)_updateSubscriberCarrierBundleVersion:(optional<std::string> *)a3;
- (void)_updateSubscriberCarrierCountry:(optional<std::string> *)a3;
- (void)_updateSubscriberCarrierName:(optional<std::string> *)a3;
- (void)carrierBundleChange:(id)a3;
- (void)cellMonitorUpdate:(id)a3 info:(id)a4;
- (void)currentDataSimChanged:(id)a3;
- (void)dealloc;
- (void)displayStatusChanged:(id)a3 status:(id)a4;
- (void)enhancedDataLinkQualityChanged:(id)a3 metric:(id)a4;
- (void)handleCarrierBundleChanged:(id)a3;
- (void)handleCellMonitorUpdate:(id)a3 info:(id)a4;
- (void)handleCurrentDataSimChanged:(id)a3;
- (void)handleDisplayStatusChanged:(id)a3 status:(id)a4;
- (void)handleDisplayStatusChangedForSatelliteStatus:(BOOL)a3;
- (void)handleEnhancedLQMChanged:(id)a3 metric:(id)a4;
- (void)handleHighThroughputChanged:(id)a3 metric:(id)a4;
- (void)handleInternetConnectionStateChanged:(id)a3;
- (void)handleLinkStateChanged:(id)a3 metric:(id)a4;
- (void)handleOperatorBundleChanged:(id)a3;
- (void)handleSignalStrengthChanged:(id)a3 info:(id)a4;
- (void)handleStewieStateChanged:(id)a3;
- (void)handleSubscriptionInfoChanged;
- (void)initTelephonyClient;
- (void)internetConnectionStateChanged:(id)a3;
- (void)operatorBundleChange:(id)a3;
- (void)refreshInternetConnectionSync;
- (void)refreshIsDualSimSync;
- (void)refreshIsSatelliteSystemSync;
- (void)refreshOnCurrentDataSimChange;
- (void)refreshServingCarrierNameSync;
- (void)refreshSignalStrengthBarsSync;
- (void)refreshSubscriberInfoSync;
- (void)signalStrengthChanged:(id)a3 info:(id)a4;
- (void)stateChanged:(id)a3;
- (void)subscriptionInfoDidChange;
- (void)updateSatelliteStatusAndCellularRAT:(unsigned __int8)a3;
@end

@implementation TelephonyStateRelay

- (void)cellMonitorUpdate:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_10000FD1C((id *)&self->_stateRelayQueue.fObj.fObj);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100027910;
  v11[3] = &unk_100154DB8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)handleCellMonitorUpdate:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(TelephonyStateRelay *)self dataSubscriptionContext];
  id v9 = v8;
  if (v7 && v6 && v8)
  {
    id v10 = [v8 slotID];
    if (v10 == [v6 slotID])
    {
      v11 = [(TelephonyStateRelay *)self extractServingCellInfo:v7];
      id v12 = v11;
      if (v11)
      {
        id v13 = [v11 objectForKey:kCTCellMonitorCellRadioAccessTechnology];
        v14 = [v12 objectForKey:kCTCellMonitorDeploymentType];
        if (v13)
        {
          [(TelephonyStateRelay *)self formatCellularRat:v13 forDeploymentType:v14];
          [(TelephonyStateRelay *)self _updateCellularRAT:&__p];
          if (v16 < 0) {
            operator delete(__p);
          }
        }
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_ERROR))
  {
    sub_1000FBA34();
  }
}

- (id)dataSubscriptionContext
{
  coreTelephonyClient = self->_coreTelephonyClient;
  if (coreTelephonyClient)
  {
    dataSubscriptionContext = self->_dataSubscriptionContext;
    if (dataSubscriptionContext)
    {
      v5 = dataSubscriptionContext;
    }
    else
    {
      id v9 = 0;
      v5 = [(CoreTelephonyClient *)coreTelephonyClient getCurrentDataSubscriptionContextSync:&v9];
      id v6 = v9;
      if (v6)
      {
        id v7 = (id)qword_10015EF78;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          [v6 localizedDescription];
          objc_claimAutoreleasedReturnValue();
          sub_1000FB94C();
        }
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (basic_string<char,)formatCellularRat:(std::allocator<char>> *__return_ptr)retstr forDeploymentType:
{
  v4 = v3;
  v5 = v1;
  id v6 = v2;
  id v7 = v4;
  memset(&v11, 0, sizeof(v11));
  if ([v6 isEqualToString:kCTCellMonitorRadioAccessTechnologyLTE])
  {
    std::string::assign(&v11, "LTE");
    if (!v7) {
      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (int)[v7 intValue] <= 0) {
      goto LABEL_24;
    }
    v8 = "NR NSA";
  }
  else if ([v6 isEqualToString:kCTCellMonitorRadioAccessTechnologyNR])
  {
    v8 = "NR";
  }
  else if ([v6 isEqualToString:kCTCellMonitorRadioAccessTechnologyUMTS])
  {
    v8 = "UMTS";
  }
  else if ([v6 isEqualToString:kCTCellMonitorRadioAccessTechnologyUTRAN])
  {
    v8 = "UTRAN";
  }
  else if ([v6 isEqualToString:kCTCellMonitorRadioAccessTechnologyGSM])
  {
    v8 = "GSM";
  }
  else if ([v6 isEqualToString:kCTCellMonitorRadioAccessTechnologyCDMA1x])
  {
    v8 = "CDMA1x";
  }
  else if ([v6 isEqualToString:kCTCellMonitorRadioAccessTechnologyCDMAEVDO])
  {
    v8 = "CDMAEVDO";
  }
  else if ([v6 isEqualToString:kCTCellMonitorRadioAccessTechnologyCDMAHybrid])
  {
    v8 = "CDMAHybrid";
  }
  else if ([v6 isEqualToString:kCTCellMonitorRadioAccessTechnologyUTRAN2])
  {
    v8 = "TDSCDMA";
  }
  else
  {
    v8 = "RATUnknown";
  }
  std::string::assign(&v11, v8);
LABEL_24:
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    sub_100017424(&__p, v11.__r_.__value_.__l.__data_, v11.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v11;
  }
  [v5 formatCellularRAT:&__p];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v11.__r_.__value_.__l.__data_);
  }

  return result;
}

- (basic_string<char,)formatCellularRAT:(std::allocator<char>> *__return_ptr)retstr
{
  v3 = v2;
  int v5 = result[4].__r_.__value_.var0.var0.__data_[16];
  if (v5 == 3)
  {
    id v6 = "LTE NTN";
    goto LABEL_5;
  }
  if (v5 == 2)
  {
    id v6 = "Satellite";
LABEL_5:
    result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)std::string::assign(v2, v6);
  }
  *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)&v3->__r_.__value_.__l.__data_;
  *((void *)&retstr->__r_.__value_.var0.var1 + 2) = *((void *)&v3->__r_.__value_.__l + 2);
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  return result;
}

- (id)extractServingCellInfo:(id)a3
{
  id v3 = a3;
  v4 = [v3 legacyInfo];
  id v5 = [v3 legacyInfo];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = 0;
      id v9 = &v8;
      uint64_t v10 = 0x3032000000;
      std::string v11 = sub_10007EBB4;
      id v12 = sub_10007EBC4;
      id v13 = 0;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100002B80;
      v7[3] = &unk_100154DE0;
      v7[4] = &v8;
      [v4 enumerateObjectsUsingBlock:v7];
      id v5 = (id)v9[5];
      _Block_object_dispose(&v8, 8);
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (void)_updateCellularRAT:()basic_string<char
{
  id v5 = (std::string *)(&self->_subscriberCarrierBundleVersion.__r_.__value_.var0.var1 + 1);
  size_t v6 = *((unsigned __int8 *)&a3->__r_.__value_.var0.var1 + 23);
  size_t size = a3->__r_.__value_.var0.var1.__size_;
  if ((v6 & 0x80u) == 0) {
    size_t v8 = v6;
  }
  else {
    size_t v8 = size;
  }
  uint64_t var0_high = HIBYTE(self->_subscriberCarrierBundleVersion.var0);
  int v10 = (char)var0_high;
  if ((var0_high & 0x80u) != 0) {
    uint64_t var0_high = *(void *)&self->_subscriberCarrierBundleVersion.__r_.var0;
  }
  if (v8 == var0_high)
  {
    if (v10 >= 0) {
      std::string v11 = &self->_subscriberCarrierBundleVersion.__r_.__value_.var0.var1 + 1;
    }
    else {
      std::string v11 = (__long *)v5->__r_.__value_.__r.__words[0];
    }
    if ((v6 & 0x80) != 0)
    {
      if (!memcmp(a3->__r_.__value_.var0.var1.__data_, v11, size)) {
        return;
      }
    }
    else
    {
      if (!v6) {
        return;
      }
      for (i = a3;
            i->__r_.__value_.var0.var0.__data_[0] == LOBYTE(v11->__data_);
            i = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)((char *)i + 1))
      {
        std::string v11 = (__long *)((char *)v11 + 1);
        if (!--v6) {
          return;
        }
      }
    }
  }
  std::string::operator=(v5, (const std::string *)a3);
  telephonyStateDelegate = self->_telephonyStateDelegate;
  if (SHIBYTE(self->_subscriberCarrierBundleVersion.var0) < 0)
  {
    sub_100017424(__p, *((void **)&self->_subscriberCarrierBundleVersion.__r_.__value_.var0.var1 + 2), *(void *)&self->_subscriberCarrierBundleVersion.__r_.var0);
  }
  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
    std::string::size_type v17 = v5->__r_.__value_.__r.__words[2];
  }
  char v18 = 1;
  (*((void (**)(id *__return_ptr, TelephonyStateDelegate *, void **))telephonyStateDelegate->var0 + 2))(&v15, telephonyStateDelegate, __p);
  id v14 = v15;
  id v15 = 0;

  if (v18)
  {
    if (SHIBYTE(v17) < 0) {
      operator delete(__p[0]);
    }
  }
}

- (TelephonyStateRelay)initWithMonitoring:(TelephonyStateDelegate *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)TelephonyStateRelay;
  v4 = [(TelephonyStateRelay *)&v21 init];
  id v5 = v4;
  if (v4)
  {
    v4->_telephonyStateDelegate = a3;
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.analyticsd.TelephonyStateRelay.myQueue", 0);
    fObj = v5->_stateRelayQueue.fObj.fObj;
    v5->_stateRelayQueue.fObj.fObj = (OS_dispatch_object *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.analyticsd.TelephonyStateRelay.CallbackQueue", 0);
    id v9 = v5->_telephonyClientQueue.fObj.fObj;
    v5->_telephonyClientQueue.fObj.fObj = (OS_dispatch_object *)v8;

    [(TelephonyStateRelay *)v5 initTelephonyClient];
    v5->_internetCellStatus = 0;
    [(TelephonyStateRelay *)v5 _updateCellularLQM:0];
    coreTelephonyClient = v5->_coreTelephonyClient;
    if (coreTelephonyClient) {
      [(CoreTelephonyClient *)coreTelephonyClient setDelegate:v5];
    }
    id v11 = objc_alloc((Class)CTStewieStateMonitor);
    id v12 = sub_10000FD1C((id *)&v5->_telephonyClientQueue.fObj.fObj);
    id v13 = [v11 initWithDelegate:v5 queue:v12];
    size_t size = (void *)v5->_subscriberCarrierCountry.__r_.__value_.var0.var1.__size_;
    v5->_subscriberCarrierCountry.__r_.__value_.var0.var1.__size_ = (unint64_t)v13;

    v5->_subscriberCarrierCountry.__r_.__value_.var0.var0.__data_[0] = 1;
    [(id)v5->_subscriberCarrierCountry.__r_.__value_.var0.var1.__size_ start];
    id v15 = sub_10000FD1C((id *)&v5->_stateRelayQueue.fObj.fObj);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10007C908;
    v19[3] = &unk_100153F58;
    char v16 = v5;
    v20 = v16;
    dispatch_async(v15, v19);

    std::string::size_type v17 = v16;
  }

  return v5;
}

- (void)dealloc
{
  coreTelephonyClient = self->_coreTelephonyClient;
  if (coreTelephonyClient) {
    [(CoreTelephonyClient *)coreTelephonyClient setDelegate:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)TelephonyStateRelay;
  [(TelephonyStateRelay *)&v4 dealloc];
}

- (void)initTelephonyClient
{
  id v3 = objc_alloc((Class)CoreTelephonyClient);
  objc_super v4 = sub_10000FD1C((id *)&self->_telephonyClientQueue.fObj.fObj);
  id v5 = (CoreTelephonyClient *)[v3 initWithQueue:v4];
  coreTelephonyClient = self->_coreTelephonyClient;
  self->_coreTelephonyClient = v5;

  id v7 = self->_coreTelephonyClient;
  if (v7)
  {
    id v13 = 0;
    dispatch_queue_t v8 = [(CoreTelephonyClient *)v7 getPreferredDataSubscriptionContextSync:&v13];
    id v9 = (CTXPCServiceSubscriptionContext *)v13;
    dataSubscriptionContext = self->_dataSubscriptionContext;
    self->_dataSubscriptionContext = v8;

    if (v9)
    {
      id v11 = (id)qword_10015EF78;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        [(CTXPCServiceSubscriptionContext *)v9 localizedDescription];
        objc_claimAutoreleasedReturnValue();
        sub_1000FB94C();
      }
    }
  }
  else
  {
    id v12 = qword_10015EF78;
    if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[TelephonyStateRelay] WARNING: Failed to create CoreTelephonyClient instance", buf, 2u);
    }
    id v9 = self->_dataSubscriptionContext;
    self->_dataSubscriptionContext = 0;
  }
}

- (void)refreshOnCurrentDataSimChange
{
  [(TelephonyStateRelay *)self refreshInternetConnectionSync];
  [(TelephonyStateRelay *)self refreshSignalStrengthBarsSync];
  [(TelephonyStateRelay *)self refreshSubscriberInfoSync];

  [(TelephonyStateRelay *)self refreshServingCarrierNameSync];
}

- (void)refreshSignalStrengthBarsSync
{
  coreTelephonyClient = self->_coreTelephonyClient;
  if (coreTelephonyClient)
  {
    dataSubscriptionContext = self->_dataSubscriptionContext;
    if (dataSubscriptionContext)
    {
      id v8 = 0;
      id v5 = [(CoreTelephonyClient *)coreTelephonyClient getSignalStrengthInfo:dataSubscriptionContext error:&v8];
      id v6 = v8;
      if (!v6 || v5)
      {
        [(TelephonyStateRelay *)self _updateSignalBars:[(TelephonyStateRelay *)self formatSignalBars:v5]];
      }
      else
      {
        id v7 = (id)qword_10015EF78;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          [v6 localizedDescription];
          objc_claimAutoreleasedReturnValue();
          sub_1000FB990();
        }
      }
    }
  }
}

- (void)refreshInternetConnectionSync
{
  coreTelephonyClient = self->_coreTelephonyClient;
  if (coreTelephonyClient && self->_dataSubscriptionContext)
  {
    id v8 = 0;
    objc_super v4 = [(CoreTelephonyClient *)coreTelephonyClient getInternetConnectionStateSync:&v8];
    id v5 = v8;
    if (!v5 || v4)
    {
      uint64_t v7 = -[TelephonyStateRelay cellularInternetConnectionStateAsEnum:](self, "cellularInternetConnectionStateAsEnum:", [v4 state]);
      id v6 = [v4 pdp];
      [(TelephonyStateRelay *)self _updateCellInternetStatusAndLQM:v7 pdpContext:[v6 intValue]];
    }
    else
    {
      id v6 = (id)qword_10015EF78;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        [v5 localizedDescription];
        objc_claimAutoreleasedReturnValue();
        sub_1000FB990();
      }
    }
  }
}

- (void)refreshSubscriberInfoSync
{
  coreTelephonyClient = self->_coreTelephonyClient;
  if (coreTelephonyClient)
  {
    dataSubscriptionContext = self->_dataSubscriptionContext;
    if (dataSubscriptionContext)
    {
      id v5 = sub_100072CF0(coreTelephonyClient, dataSubscriptionContext);
      id v6 = v5;
      if (v5)
      {
        sub_100015438(__p, (char *)[v5 UTF8String]);
        long long v27 = *(_OWORD *)__p;
        uint64_t v28 = v14;
        __p[1] = 0;
        uint64_t v14 = 0;
        __p[0] = 0;
        char v29 = 1;
        [(TelephonyStateRelay *)self _updateSubscriberCarrierName:&v27];
        if (v29 && SHIBYTE(v28) < 0) {
          operator delete((void *)v27);
        }
        if (SHIBYTE(v14) < 0) {
          operator delete(__p[0]);
        }
      }
      uint64_t v7 = sub_100073120(self->_coreTelephonyClient, self->_dataSubscriptionContext);
      id v8 = v7;
      if (v7)
      {
        sub_100015438(__p, (char *)[v7 UTF8String]);
        *(_OWORD *)v24 = *(_OWORD *)__p;
        uint64_t v25 = v14;
        __p[1] = 0;
        uint64_t v14 = 0;
        __p[0] = 0;
        char v26 = 1;
        [(TelephonyStateRelay *)self _updateSubscriberCarrierCountry:v24];
        if (v26 && SHIBYTE(v25) < 0) {
          operator delete(v24[0]);
        }
        if (SHIBYTE(v14) < 0)
        {
          id v9 = __p[0];
LABEL_18:
          operator delete(v9);
        }
      }
      else
      {
        LOBYTE(v21) = 0;
        char v23 = 0;
        [(TelephonyStateRelay *)self _updateSubscriberCarrierCountry:&v21];
        if (v23 && v22 < 0)
        {
          id v9 = v21;
          goto LABEL_18;
        }
      }
      int v10 = sub_100072F7C(self->_coreTelephonyClient, self->_dataSubscriptionContext);
      id v11 = v10;
      if (v10)
      {
        sub_100015438(__p, (char *)[v10 UTF8String]);
        *(_OWORD *)char v18 = *(_OWORD *)__p;
        uint64_t v19 = v14;
        __p[1] = 0;
        uint64_t v14 = 0;
        __p[0] = 0;
        char v20 = 1;
        [(TelephonyStateRelay *)self _updateSubscriberCarrierBundleVersion:v18];
        if (v20)
        {
          if (SHIBYTE(v19) < 0) {
            operator delete(v18[0]);
          }
        }
        if ((SHIBYTE(v14) & 0x80000000) == 0) {
          goto LABEL_29;
        }
        id v12 = __p[0];
      }
      else
      {
        LOBYTE(v15) = 0;
        char v17 = 0;
        [(TelephonyStateRelay *)self _updateSubscriberCarrierBundleVersion:&v15];
        if (!v17 || (v16 & 0x80000000) == 0) {
          goto LABEL_29;
        }
        id v12 = v15;
      }
      operator delete(v12);
LABEL_29:
    }
  }
}

- (void)refreshServingCarrierNameSync
{
  coreTelephonyClient = self->_coreTelephonyClient;
  if (coreTelephonyClient)
  {
    dataSubscriptionContext = self->_dataSubscriptionContext;
    if (dataSubscriptionContext)
    {
      id v5 = sub_100073240(coreTelephonyClient, dataSubscriptionContext);
      id v6 = v5;
      if (v5)
      {
        sub_100015438(v7, (char *)[v5 UTF8String]);
        *(_OWORD *)std::string __p = *(_OWORD *)v7;
        uint64_t v10 = v8;
        v7[1] = 0;
        uint64_t v8 = 0;
        v7[0] = 0;
        char v11 = 1;
        [(TelephonyStateRelay *)self _updateServingCarrierName:__p];
        if (v11 && SHIBYTE(v10) < 0) {
          operator delete(__p[0]);
        }
        if (SHIBYTE(v8) < 0) {
          operator delete(v7[0]);
        }
      }
    }
  }
}

- (void)refreshIsDualSimSync
{
  coreTelephonyClient = self->_coreTelephonyClient;
  if (coreTelephonyClient)
  {
    id v5 = [(CoreTelephonyClient *)coreTelephonyClient getSubscriptionInfoWithError:0];
    objc_super v4 = [v5 subscriptionsInUse];
    -[TelephonyStateRelay _updateIsDualSim:](self, "_updateIsDualSim:", ((unint64_t)[v4 count] > 1) | 0x100);
  }
}

- (void)refreshIsSatelliteSystemSync
{
  [(TelephonyStateRelay *)self updateSatelliteStatusAndCellularRAT:1];
  size_t size = (void *)self->_subscriberCarrierCountry.__r_.__value_.var0.var1.__size_;
  if (size
    && ([size getState],
        id v7 = (id)objc_claimAutoreleasedReturnValue(),
        unsigned int v4 = -[TelephonyStateRelay isStewieActive:](self, "isStewieActive:"),
        v7,
        v4))
  {
    [(TelephonyStateRelay *)self updateSatelliteStatusAndCellularRAT:2];
  }
  else
  {
    coreTelephonyClient = self->_coreTelephonyClient;
    if (coreTelephonyClient)
    {
      dataSubscriptionContext = self->_dataSubscriptionContext;
      if (dataSubscriptionContext)
      {
        id v8 = [(CoreTelephonyClient *)coreTelephonyClient copyRegistrationDisplayStatus:dataSubscriptionContext error:0];
        if (v8 && [v8 isSatelliteSystem]) {
          [(TelephonyStateRelay *)self updateSatelliteStatusAndCellularRAT:3];
        }
      }
    }
  }
}

- (void)signalStrengthChanged:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000FD1C((id *)&self->_stateRelayQueue.fObj.fObj);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007D5E4;
  v11[3] = &unk_100154DB8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)enhancedDataLinkQualityChanged:(id)a3 metric:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000FD1C((id *)&self->_stateRelayQueue.fObj.fObj);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007D724;
  v11[3] = &unk_100154DB8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)displayStatusChanged:(id)a3 status:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000FD1C((id *)&self->_stateRelayQueue.fObj.fObj);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10007D864;
  v11[3] = &unk_100154DB8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

- (void)currentDataSimChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000FD1C((id *)&self->_stateRelayQueue.fObj.fObj);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007D970;
  block[3] = &unk_100153FA8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)internetConnectionStateChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000FD1C((id *)&self->_stateRelayQueue.fObj.fObj);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007DA78;
  block[3] = &unk_100153FA8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)carrierBundleChange:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000FD1C((id *)&self->_stateRelayQueue.fObj.fObj);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007DB80;
  block[3] = &unk_100153FA8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)operatorBundleChange:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000FD1C((id *)&self->_stateRelayQueue.fObj.fObj);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007DC88;
  block[3] = &unk_100153FA8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)subscriptionInfoDidChange
{
  id v3 = sub_10000FD1C((id *)&self->_stateRelayQueue.fObj.fObj);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007DD4C;
  v4[3] = &unk_100153F58;
  v4[4] = self;
  dispatch_async(v3, v4);
}

- (void)stateChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000FD1C((id *)&self->_stateRelayQueue.fObj.fObj);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007DE50;
  block[3] = &unk_100153FA8;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)handleCurrentDataSimChanged:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_dataSubscriptionContext, a3);
  id v6 = (id)qword_10015EF78;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [(CTXPCServiceSubscriptionContext *)self->_dataSubscriptionContext slotID];
    int v8 = 134217984;
    id v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[TelephonyStateRelay] Changing data preferred to slot = %ld", (uint8_t *)&v8, 0xCu);
  }

  [(TelephonyStateRelay *)self refreshOnCurrentDataSimChange];
}

- (void)handleInternetConnectionStateChanged:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = -[TelephonyStateRelay cellularInternetConnectionStateAsEnum:](self, "cellularInternetConnectionStateAsEnum:", [v4 state]);
    id v7 = [v5 pdp];
    -[TelephonyStateRelay _updateCellInternetStatusAndLQM:pdpContext:](self, "_updateCellInternetStatusAndLQM:pdpContext:", v6, [v7 intValue]);
  }
  else if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_ERROR))
  {
    sub_1000FB9D4();
  }
}

- (void)handleSignalStrengthChanged:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(TelephonyStateRelay *)self dataSubscriptionContext];
  id v9 = v8;
  if (v7 && v6 && v8)
  {
    id v10 = [v8 slotID];
    if (v10 == [v6 slotID]) {
      [(TelephonyStateRelay *)self _updateSignalBars:[(TelephonyStateRelay *)self formatSignalBars:v7]];
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_ERROR))
  {
    sub_1000FBA94();
  }
}

- (void)handleEnhancedLQMChanged:(id)a3 metric:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (v7)
  {
    id v9 = [v7 metricType];
    if (v9 == (id)1)
    {
      [(TelephonyStateRelay *)self handleLinkStateChanged:v6 metric:v8];
    }
    else if (v9 == (id)8)
    {
      [(TelephonyStateRelay *)self handleHighThroughputChanged:v6 metric:v8];
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_ERROR))
  {
    sub_1000FBAF4();
  }
}

- (void)handleLinkStateChanged:(id)a3 metric:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(TelephonyStateRelay *)self dataSubscriptionContext];
  id v9 = v8;
  if (v7 && v6 && v8)
  {
    id v10 = [v8 slotID];
    if (v10 == [v6 slotID])
    {
      char v11 = [v7 enhancedLinkQuality];
      unsigned __int16 v12 = (unsigned __int16)[(TelephonyStateRelay *)self extractLinkStateChange:v11];
      unsigned __int8 v13 = HIBYTE(v12);
      int v14 = v12;

      if (v14 == 1) {
        [(TelephonyStateRelay *)self _updateCellularLQM:v13 | 0x100u];
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_ERROR))
  {
    sub_1000FBA94();
  }
}

- (pair<LinkStateNotificationType,)extractLinkStateChange:(id)a3
{
  id v3 = a3;
  unsigned __int8 v9 = 0;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 length] == (id)5)
    {
      objc_msgSend(v3, "getBytes:range:", &v9, 1, 1);
      unsigned __int8 v8 = -1;
      switch(v9)
      {
        case 4u:
          uint64_t v4 = 4;
          break;
        case 2u:
          uint64_t v4 = 3;
          break;
        case 1u:
          uint64_t v4 = 2;
          break;
        default:
          if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_ERROR)) {
            sub_1000FBB54();
          }
          __int16 v6 = 255;
          goto LABEL_16;
      }
      objc_msgSend(v3, "getBytes:range:", &v8, v4, 1);
      __int16 v6 = v8;
LABEL_16:
      __int16 v5 = v9;
      goto LABEL_9;
    }
  }
  __int16 v5 = 0;
  __int16 v6 = 255;
LABEL_9:

  return (pair<LinkStateNotificationType, LQMThreshold>)(v5 | (v6 << 8));
}

- (void)handleHighThroughputChanged:(id)a3 metric:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(TelephonyStateRelay *)self dataSubscriptionContext];
  unsigned __int8 v9 = v8;
  if (v7 && v6 && v8)
  {
    id v10 = [v8 slotID];
    if (v10 == [v6 slotID])
    {
      char v11 = [v7 enhancedLinkQuality];
      unsigned int v12 = [(TelephonyStateRelay *)self extractHighThroughput:v11];

      if (v12 <= 1) {
        [(TelephonyStateRelay *)self _updateHighThroughput:v12 != 0];
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_ERROR))
  {
    sub_1000FBA94();
  }
}

- (void)handleCarrierBundleChanged:(id)a3
{
  id v4 = a3;
  __int16 v5 = [(TelephonyStateRelay *)self dataSubscriptionContext];
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = [v5 slotID];
    if (v7 == [v4 slotID]) {
      [(TelephonyStateRelay *)self refreshSubscriberInfoSync];
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_ERROR))
  {
    sub_1000FBBB4();
  }
}

- (void)handleOperatorBundleChanged:(id)a3
{
  id v4 = a3;
  __int16 v5 = [(TelephonyStateRelay *)self dataSubscriptionContext];
  id v6 = v5;
  if (v4 && v5)
  {
    id v7 = [v5 slotID];
    if (v7 == [v4 slotID]) {
      [(TelephonyStateRelay *)self refreshServingCarrierNameSync];
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_ERROR))
  {
    sub_1000FBC14();
  }
}

- (void)handleDisplayStatusChanged:(id)a3 status:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[TelephonyStateRelay handleDisplayStatusChangedForSatelliteStatus:](self, "handleDisplayStatusChangedForSatelliteStatus:", [v7 isSatelliteSystem]);
  unsigned __int8 v8 = [(TelephonyStateRelay *)self dataSubscriptionContext];
  unsigned __int8 v9 = v8;
  if (v6 && v8)
  {
    id v10 = [v8 slotID];
    if (v10 == [v6 slotID])
    {
      char v11 = [v7 registrationDisplayStatus];
      if ([v11 isEqualToString:kCTRegistrationStatusNotRegistered])
      {
        int v12 = self->_subscriberCarrierCountry.__r_.__value_.var0.var0.__data_[0];

        if (v12 == 1)
        {
          sub_100015438(__p, "NoService");
          [(TelephonyStateRelay *)self _updateCellularRAT:__p];
          if (v16 < 0) {
            operator delete(__p[0]);
          }
        }
      }
      else
      {
      }
      unsigned __int8 v13 = [v7 registrationDisplayStatus];
      char v14 = sub_1000736BC(v13);

      if (v14)
      {
        [(TelephonyStateRelay *)self refreshServingCarrierNameSync];
        [(TelephonyStateRelay *)self refreshSubscriberInfoSync];
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_ERROR))
  {
    sub_1000FBC74();
  }
}

- (void)handleDisplayStatusChangedForSatelliteStatus:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 || self->_subscriberCarrierCountry.__r_.__value_.var0.var0.__data_[0] != 1)
  {
    __int16 v5 = qword_10015EF78;
    if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_DEBUG))
    {
      sub_1000FBCD4(v3, (uint64_t)self, v5);
      if (v3) {
        goto LABEL_5;
      }
    }
    else if (v3)
    {
LABEL_5:
      id v6 = self;
      uint64_t v7 = 3;
LABEL_9:
      [(TelephonyStateRelay *)v6 updateSatelliteStatusAndCellularRAT:v7];
      return;
    }
    if (self->_subscriberCarrierCountry.__r_.__value_.var0.var0.__data_[0] != 3) {
      return;
    }
    id v6 = self;
    uint64_t v7 = 1;
    goto LABEL_9;
  }
}

- (void)handleSubscriptionInfoChanged
{
  [(TelephonyStateRelay *)self refreshIsDualSimSync];

  [(TelephonyStateRelay *)self refreshSubscriberInfoSync];
}

- (void)handleStewieStateChanged:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_DEBUG)) {
    sub_1000FBD54();
  }
  if ([(TelephonyStateRelay *)self isStewieActive:v4])
  {
    [(TelephonyStateRelay *)self updateSatelliteStatusAndCellularRAT:2];
  }
  else if (self->_subscriberCarrierCountry.__r_.__value_.var0.var0.__data_[0] == 2)
  {
    [(TelephonyStateRelay *)self updateSatelliteStatusAndCellularRAT:1];
  }
}

- (unsigned)extractHighThroughput:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = -1;
  unsigned __int8 v8 = -1;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v3 length] == (id)8)
      {
        int v7 = 0;
        objc_msgSend(v3, "getBytes:range:", &v7, 4, 4);
        unsigned __int8 v4 = v7 != 0;
      }
      else if ((unint64_t)[v3 length] < 2 {
             || (objc_msgSend(v3, "getBytes:range:", &v8, 1, 1), unsigned __int8 v4 = v8, v8 >= 2u))
      }
      {
        __int16 v5 = qword_10015EF78;
        if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_ERROR)) {
          sub_1000FBDC0(&v8, v5);
        }
        unsigned __int8 v4 = -1;
      }
    }
  }

  return v4;
}

- (void)_updateCellInternetStatusAndLQM:(int)a3 pdpContext:(int)a4
{
  self->_internetCellStatus = a3;
  telephonyStateDelegate = self->_telephonyStateDelegate;
  -[TelephonyStateRelay formatInternetConnection:](self, "formatInternetConnection:");
  *(_OWORD *)std::string __p = *(_OWORD *)v7;
  uint64_t v11 = v8;
  char v12 = 1;
  (*((void (**)(id *__return_ptr, TelephonyStateDelegate *, void **))telephonyStateDelegate->var0 + 4))(&v9, telephonyStateDelegate, __p);
  id v6 = v9;
  id v9 = 0;

  if (v12 && SHIBYTE(v11) < 0) {
    operator delete(__p[0]);
  }
  [(TelephonyStateRelay *)self _updateCellularLQM:0];
}

- (void)_updateCellularLQM:(optional<LQMThreshold>)a3
{
  (*((void (**)(id *__return_ptr))self->_telephonyStateDelegate->var0 + 5))(&v4);
  id v3 = v4;
  id v4 = 0;
}

- (void)_updateSignalBars:(char)a3
{
  (*((void (**)(id *__return_ptr))self->_telephonyStateDelegate->var0 + 3))(&v4);
  id v3 = v4;
  id v4 = 0;
}

- (void)_updateHighThroughput:(BOOL)a3
{
  (*((void (**)(id *__return_ptr))self->_telephonyStateDelegate->var0 + 6))(&v4);
  id v3 = v4;
  id v4 = 0;
}

- (void)_updateSubscriberCarrierName:(optional<std::string> *)a3
{
  p_subscriberCarrierName = (std::string *)&self->_subscriberCarrierName;
  if (LOBYTE(a3->var0.var1.__r_.var0))
  {
    uint64_t v6 = *((unsigned __int8 *)&self->_subscriberCarrierName.__r_.__value_.var0.var1 + 23);
    if ((v6 & 0x80u) == 0) {
      unint64_t size = *((unsigned __int8 *)&self->_subscriberCarrierName.__r_.__value_.var0.var1 + 23);
    }
    else {
      unint64_t size = self->_subscriberCarrierName.__r_.__value_.var0.var1.__size_;
    }
    unint64_t v8 = *((unsigned __int8 *)&a3->var0.var1.__r_.__value_.var0.var1 + 23);
    int v9 = (char)v8;
    if ((v8 & 0x80u) != 0) {
      unint64_t v8 = a3->var0.var1.__r_.__value_.var0.var1.__size_;
    }
    if (size == v8)
    {
      if (v9 >= 0) {
        data = a3;
      }
      else {
        data = (optional<std::string> *)a3->var0.var1.__r_.__value_.var0.var1.__data_;
      }
      if ((v6 & 0x80) != 0)
      {
        if (!memcmp(p_subscriberCarrierName->__r_.__value_.__l.__data_, data, self->_subscriberCarrierName.__r_.__value_.var0.var1.__size_))return; {
      }
        }
      else
      {
        if (!*((unsigned char *)&self->_subscriberCarrierName.__r_.__value_.var0.var1 + 23)) {
          return;
        }
        for (i = &self->_subscriberCarrierName;
              i->__r_.__value_.var0.var0.__data_[0] == data->var0.var0;
              i = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)((char *)i + 1))
        {
          data = (optional<std::string> *)((char *)data + 1);
          if (!--v6) {
            return;
          }
        }
      }
    }
    id v15 = qword_10015EF78;
    if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_INFO))
    {
      char v16 = p_subscriberCarrierName;
      if (*((char *)&self->_subscriberCarrierName.__r_.__value_.var0.var1 + 23) < 0) {
        char v16 = (std::string *)p_subscriberCarrierName->__r_.__value_.__r.__words[0];
      }
      char v17 = a3;
      if (*((char *)&a3->var0.var1.__r_.__value_.var0.var1 + 23) < 0) {
        char v17 = (optional<std::string> *)a3->var0.var1.__r_.__value_.var0.var1.__data_;
      }
      *(_DWORD *)buf = 136315394;
      uint64_t v25 = v16;
      __int16 v26 = 2080;
      long long v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[TelephonyStateRelay] Changing homeCarrierName from %s to %s", buf, 0x16u);
    }
    std::string::operator=(p_subscriberCarrierName, (const std::string *)a3);
    telephonyStateDelegate = self->_telephonyStateDelegate;
    sub_10007FD94((uint64_t)v23, (long long *)&a3->var0.var0);
    (*((void (**)(id *__return_ptr, TelephonyStateDelegate *, uint8_t *))telephonyStateDelegate->var0 + 7))(&v21, telephonyStateDelegate, v23);
    id v19 = v21;
    id v21 = 0;

    if (v23[24] && (char)v23[23] < 0)
    {
      char v14 = (void **)v23;
      goto LABEL_30;
    }
  }
  else
  {
    std::string::assign((std::string *)&self->_subscriberCarrierName, "");
    char v12 = self->_telephonyStateDelegate;
    sub_10007FD94((uint64_t)v22, (long long *)&a3->var0.var0);
    (*((void (**)(id *__return_ptr, TelephonyStateDelegate *, unsigned char *))v12->var0 + 7))(&v20, v12, v22);
    id v13 = v20;
    id v20 = 0;

    if (v22[24] && (v22[23] & 0x80000000) != 0)
    {
      char v14 = (void **)v22;
LABEL_30:
      operator delete(*v14);
    }
  }
}

- (void)_updateSubscriberCarrierCountry:(optional<std::string> *)a3
{
  p_var0 = (std::string *)&self->_servingCarrierName.var0;
  if (LOBYTE(a3->var0.var1.__r_.var0))
  {
    uint64_t v6 = self->_subscriberCarrierBundleVersion.__r_.__value_.var0.var0.__data_[15];
    if ((v6 & 0x80u) == 0) {
      data = (char *)self->_subscriberCarrierBundleVersion.__r_.__value_.var0.var0.__data_[15];
    }
    else {
      data = self->_subscriberCarrierBundleVersion.__r_.__value_.var0.var1.__data_;
    }
    unint64_t size = *((unsigned __int8 *)&a3->var0.var1.__r_.__value_.var0.var1 + 23);
    int v9 = (char)size;
    if ((size & 0x80u) != 0) {
      unint64_t size = a3->var0.var1.__r_.__value_.var0.var1.__size_;
    }
    if (data == (char *)size)
    {
      if (v9 >= 0) {
        id v10 = a3;
      }
      else {
        id v10 = (optional<std::string> *)a3->var0.var1.__r_.__value_.var0.var1.__data_;
      }
      if ((v6 & 0x80) != 0)
      {
        if (!memcmp(p_var0->__r_.__value_.__l.__data_, v10, (size_t)self->_subscriberCarrierBundleVersion.__r_.__value_.var0.var1.__data_))return; {
      }
        }
      else
      {
        if (!self->_subscriberCarrierBundleVersion.__r_.__value_.var0.var0.__data_[15]) {
          return;
        }
        for (i = &self->_servingCarrierName.var0;
              *(unsigned __int8 *)i == v10->var0.var0;
              i = (int64_t *)((char *)i + 1))
        {
          id v10 = (optional<std::string> *)((char *)v10 + 1);
          if (!--v6) {
            return;
          }
        }
      }
    }
    id v15 = qword_10015EF78;
    if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_INFO))
    {
      char v16 = p_var0;
      if (self->_subscriberCarrierBundleVersion.__r_.__value_.var0.var0.__data_[15] < 0) {
        char v16 = (std::string *)p_var0->__r_.__value_.__r.__words[0];
      }
      char v17 = a3;
      if (*((char *)&a3->var0.var1.__r_.__value_.var0.var1 + 23) < 0) {
        char v17 = (optional<std::string> *)a3->var0.var1.__r_.__value_.var0.var1.__data_;
      }
      *(_DWORD *)buf = 136315394;
      uint64_t v25 = v16;
      __int16 v26 = 2080;
      long long v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[TelephonyStateRelay] Changing homeCarrierCountry from %s to %s", buf, 0x16u);
    }
    std::string::operator=(p_var0, (const std::string *)a3);
    telephonyStateDelegate = self->_telephonyStateDelegate;
    sub_10007FD94((uint64_t)v23, (long long *)&a3->var0.var0);
    (*((void (**)(id *__return_ptr, TelephonyStateDelegate *, uint8_t *))telephonyStateDelegate->var0 + 9))(&v21, telephonyStateDelegate, v23);
    id v19 = v21;
    id v21 = 0;

    if (v23[24] && (char)v23[23] < 0)
    {
      char v14 = (void **)v23;
      goto LABEL_30;
    }
  }
  else
  {
    std::string::assign((std::string *)&self->_servingCarrierName.var0, "");
    char v12 = self->_telephonyStateDelegate;
    sub_10007FD94((uint64_t)v22, (long long *)&a3->var0.var0);
    (*((void (**)(id *__return_ptr, TelephonyStateDelegate *, unsigned char *))v12->var0 + 9))(&v20, v12, v22);
    id v13 = v20;
    id v20 = 0;

    if (v22[24] && (v22[23] & 0x80000000) != 0)
    {
      char v14 = (void **)v22;
LABEL_30:
      operator delete(*v14);
    }
  }
}

- (void)_updateSubscriberCarrierBundleVersion:(optional<std::string> *)a3
{
  p_unint64_t size = (std::string *)&self->_servingCarrierName.__r_.__value_.var0.var1.__size_;
  if (LOBYTE(a3->var0.var1.__r_.var0))
  {
    uint64_t v6 = *((unsigned __int8 *)&self->_servingCarrierName.__r_.var1 + 3);
    if ((v6 & 0x80u) == 0) {
      uint64_t v7 = *((unsigned __int8 *)&self->_servingCarrierName.__r_.var1 + 3);
    }
    else {
      uint64_t v7 = *((void *)&self->_servingCarrierName.__r_.__value_.var0.var1 + 2);
    }
    unint64_t size = *((unsigned __int8 *)&a3->var0.var1.__r_.__value_.var0.var1 + 23);
    int v9 = (char)size;
    if ((size & 0x80u) != 0) {
      unint64_t size = a3->var0.var1.__r_.__value_.var0.var1.__size_;
    }
    if (v7 == size)
    {
      if (v9 >= 0) {
        data = a3;
      }
      else {
        data = (optional<std::string> *)a3->var0.var1.__r_.__value_.var0.var1.__data_;
      }
      if ((v6 & 0x80) != 0)
      {
        if (!memcmp(p_size->__r_.__value_.__l.__data_, data, *((void *)&self->_servingCarrierName.__r_.__value_.var0.var1 + 2)))return; {
      }
        }
      else
      {
        if (!*((unsigned char *)&self->_servingCarrierName.__r_.var1 + 3)) {
          return;
        }
        for (i = &self->_servingCarrierName.__r_.__value_.var0.var1.__size_;
              *(unsigned __int8 *)i == data->var0.var0;
              i = (unint64_t *)((char *)i + 1))
        {
          data = (optional<std::string> *)((char *)data + 1);
          if (!--v6) {
            return;
          }
        }
      }
    }
    id v15 = qword_10015EF78;
    if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_INFO))
    {
      char v16 = p_size;
      if (*((char *)&self->_servingCarrierName.__r_.var1 + 3) < 0) {
        char v16 = (std::string *)p_size->__r_.__value_.__r.__words[0];
      }
      char v17 = a3;
      if (*((char *)&a3->var0.var1.__r_.__value_.var0.var1 + 23) < 0) {
        char v17 = (optional<std::string> *)a3->var0.var1.__r_.__value_.var0.var1.__data_;
      }
      *(_DWORD *)buf = 136315394;
      uint64_t v25 = v16;
      __int16 v26 = 2080;
      long long v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[TelephonyStateRelay] Changing homeCarrierBundleVersion from %s to %s", buf, 0x16u);
    }
    std::string::operator=(p_size, (const std::string *)a3);
    telephonyStateDelegate = self->_telephonyStateDelegate;
    sub_10007FD94((uint64_t)v23, (long long *)&a3->var0.var0);
    (*((void (**)(id *__return_ptr, TelephonyStateDelegate *, uint8_t *))telephonyStateDelegate->var0 + 8))(&v21, telephonyStateDelegate, v23);
    id v19 = v21;
    id v21 = 0;

    if (v23[24] && (char)v23[23] < 0)
    {
      char v14 = (void **)v23;
      goto LABEL_30;
    }
  }
  else
  {
    std::string::assign((std::string *)&self->_servingCarrierName.__r_.__value_.var0.var1.__size_, "");
    char v12 = self->_telephonyStateDelegate;
    sub_10007FD94((uint64_t)v22, (long long *)&a3->var0.var0);
    (*((void (**)(id *__return_ptr, TelephonyStateDelegate *, unsigned char *))v12->var0 + 8))(&v20, v12, v22);
    id v13 = v20;
    id v20 = 0;

    if (v22[24] && (v22[23] & 0x80000000) != 0)
    {
      char v14 = (void **)v22;
LABEL_30:
      operator delete(*v14);
    }
  }
}

- (void)_updateServingCarrierName:(optional<std::string> *)a3
{
  p_int64_t var0 = (std::string *)&self->_subscriberCarrierName.__r_.var0;
  if (LOBYTE(a3->var0.var1.__r_.var0))
  {
    uint64_t v6 = self->_servingCarrierName.__r_.__value_.var0.var0.__data_[7];
    if ((v6 & 0x80u) == 0) {
      int64_t var0 = self->_servingCarrierName.__r_.__value_.var0.var0.__data_[7];
    }
    else {
      int64_t var0 = self->_subscriberCarrierName.var0;
    }
    unint64_t size = *((unsigned __int8 *)&a3->var0.var1.__r_.__value_.var0.var1 + 23);
    int v9 = (char)size;
    if ((size & 0x80u) != 0) {
      unint64_t size = a3->var0.var1.__r_.__value_.var0.var1.__size_;
    }
    if (var0 == size)
    {
      if (v9 >= 0) {
        data = a3;
      }
      else {
        data = (optional<std::string> *)a3->var0.var1.__r_.__value_.var0.var1.__data_;
      }
      if ((v6 & 0x80) != 0)
      {
        if (!memcmp(p_var0->__r_.__value_.__l.__data_, data, self->_subscriberCarrierName.var0)) {
          return;
        }
      }
      else
      {
        if (!self->_servingCarrierName.__r_.__value_.var0.var0.__data_[7]) {
          return;
        }
        for (i = &self->_subscriberCarrierName.__r_.var0;
              *(unsigned __int8 *)i == data->var0.var0;
              i = (int *)((char *)i + 1))
        {
          data = (optional<std::string> *)((char *)data + 1);
          if (!--v6) {
            return;
          }
        }
      }
    }
    id v15 = qword_10015EF78;
    if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_INFO))
    {
      char v16 = p_var0;
      if (self->_servingCarrierName.__r_.__value_.var0.var0.__data_[7] < 0) {
        char v16 = (std::string *)p_var0->__r_.__value_.__r.__words[0];
      }
      char v17 = a3;
      if (*((char *)&a3->var0.var1.__r_.__value_.var0.var1 + 23) < 0) {
        char v17 = (optional<std::string> *)a3->var0.var1.__r_.__value_.var0.var1.__data_;
      }
      *(_DWORD *)buf = 136315394;
      uint64_t v25 = v16;
      __int16 v26 = 2080;
      long long v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[TelephonyStateRelay] Changing servingCarrierName from %s to %s", buf, 0x16u);
    }
    std::string::operator=(p_var0, (const std::string *)a3);
    telephonyStateDelegate = self->_telephonyStateDelegate;
    sub_10007FD94((uint64_t)v23, (long long *)&a3->var0.var0);
    (*((void (**)(id *__return_ptr, TelephonyStateDelegate *, uint8_t *))telephonyStateDelegate->var0 + 10))(&v21, telephonyStateDelegate, v23);
    id v19 = v21;
    id v21 = 0;

    if (v23[24] && (char)v23[23] < 0)
    {
      char v14 = (void **)v23;
      goto LABEL_30;
    }
  }
  else
  {
    std::string::assign((std::string *)&self->_subscriberCarrierName.__r_.var0, "");
    char v12 = self->_telephonyStateDelegate;
    sub_10007FD94((uint64_t)v22, (long long *)&a3->var0.var0);
    (*((void (**)(id *__return_ptr, TelephonyStateDelegate *, unsigned char *))v12->var0 + 10))(&v20, v12, v22);
    id v13 = v20;
    id v20 = 0;

    if (v22[24] && (v22[23] & 0x80000000) != 0)
    {
      char v14 = (void **)v22;
LABEL_30:
      operator delete(*v14);
    }
  }
}

- (void)_updateIsDualSim:(optional<BOOL>)a3
{
  (*((void (**)(id *__return_ptr))self->_telephonyStateDelegate->var0 + 11))(&v4);
  id v3 = v4;
  id v4 = 0;
}

- (int)cellularInternetConnectionStateAsEnum:(int)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return dword_10011B160[a3];
  }
}

- (char)formatSignalBars:(id)a3
{
  id v3 = [a3 displayBars];
  id v4 = v3;
  if (v3) {
    char v5 = [v3 intValue];
  }
  else {
    char v5 = -1;
  }

  return v5;
}

- (basic_string<char,)formatInternetConnection:(std::allocator<char>> *__return_ptr)retstr
{
  int v2 = v1;
  memset(retstr, 170, 24);
  result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)sub_100015438(retstr, "Unknown");
  if ((v2 - 1) < 4) {
    return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)std::string::assign((std::string *)retstr, off_100154E00[v2 - 1]);
  }
  return result;
}

- (void)updateSatelliteStatusAndCellularRAT:(unsigned __int8)a3
{
  p_subscriberCarrierCountry = &self->_subscriberCarrierCountry;
  if (self->_subscriberCarrierCountry.__r_.__value_.var0.var0.__data_[0] != a3)
  {
    uint64_t v4 = a3;
    uint64_t v6 = qword_10015EF78;
    if (os_log_type_enabled((os_log_t)qword_10015EF78, OS_LOG_TYPE_DEBUG)) {
      sub_1000FBE60((uint64_t)p_subscriberCarrierCountry, v4, v6);
    }
    if (v4 == 1) {
      std::string::assign((std::string *)(&self->_subscriberCarrierBundleVersion.__r_.__value_.var0.var1 + 1), "RATUnknown");
    }
    self->_subscriberCarrierCountry.__r_.__value_.var0.var0.__data_[0] = v4;
    if (SHIBYTE(self->_subscriberCarrierBundleVersion.var0) < 0)
    {
      sub_100017424(v7, *((void **)&self->_subscriberCarrierBundleVersion.__r_.__value_.var0.var1 + 2), *(void *)&self->_subscriberCarrierBundleVersion.__r_.var0);
    }
    else
    {
      *(_OWORD *)uint64_t v7 = *((_OWORD *)&self->_subscriberCarrierBundleVersion.__r_.__value_.var0.var1 + 1);
      int64_t var0 = self->_subscriberCarrierBundleVersion.var0;
    }
    [(TelephonyStateRelay *)self formatCellularRAT:v7];
    [(TelephonyStateRelay *)self _updateCellularRAT:&__p];
    if (v10 < 0) {
      operator delete(__p);
    }
    if (SHIBYTE(var0) < 0) {
      operator delete(v7[0]);
    }
  }
}

- (BOOL)isStewieActive:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 isStewieActive];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriberCarrierCountry.__r_.__value_.var0.var1.__size_, 0);
  if (SHIBYTE(self->_subscriberCarrierBundleVersion.var0) < 0) {
    operator delete(*((void **)&self->_subscriberCarrierBundleVersion.__r_.__value_.var0.var1 + 2));
  }
  if (self->_subscriberCarrierBundleVersion.__r_.__value_.var0.var0.__data_[15] < 0) {
    operator delete((void *)self->_servingCarrierName.var0);
  }
  if (*((char *)&self->_servingCarrierName.__r_.var1 + 3) < 0) {
    operator delete((void *)self->_servingCarrierName.__r_.__value_.var0.var1.__size_);
  }
  if (self->_servingCarrierName.__r_.__value_.var0.var0.__data_[7] < 0) {
    operator delete(*(void **)&self->_subscriberCarrierName.__r_.var0);
  }
  if (*((char *)&self->_subscriberCarrierName.__r_.__value_.var0.var1 + 23) < 0) {
    operator delete(self->_subscriberCarrierName.__r_.__value_.var0.var1.__data_);
  }
  objc_storeStrong((id *)&self->_dataSubscriptionContext, 0);
  fObj = self->_telephonyClientQueue.fObj.fObj;
  self->_telephonyClientQueue.fObj.fObj = 0;

  uint64_t v4 = self->_stateRelayQueue.fObj.fObj;
  self->_stateRelayQueue.fObj.fObj = 0;

  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((void *)self + 21) = 0;
  return self;
}

@end