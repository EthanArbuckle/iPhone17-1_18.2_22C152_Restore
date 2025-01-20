@interface NetworkStateRelay
- (NWPathEvaluator)primaryPathEvaluator;
- (NetworkStateRelay)initWithMonitoring:(NetworkingStateDelegate *)a3 withWiFiStateRelay:(id)a4 withTelephonyStateRelay:(id)a5;
- (id).cxx_construct;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerForNetworkChanges;
- (void)setPrimaryPathEvaluator:(id)a3;
- (void)updatePrimaryNetworkInterfaceType:(optional<NWInterfaceType>)a3;
@end

@implementation NetworkStateRelay

- (NetworkStateRelay)initWithMonitoring:(NetworkingStateDelegate *)a3 withWiFiStateRelay:(id)a4 withTelephonyStateRelay:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)NetworkStateRelay;
  v11 = [(NetworkStateRelay *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->delegate = a3;
    objc_storeStrong((id *)&v11->_wiFiStateRelay, a4);
    objc_storeStrong((id *)&v12->_telephonyStateRelay, a5);
    dispatch_queue_t v13 = dispatch_queue_create("analyticsd.NetworkingStateResolver.NetworkStateRelay.myQueue", 0);
    fObj = v12->_stateRelayQueue.fObj.fObj;
    v12->_stateRelayQueue.fObj.fObj = (OS_dispatch_object *)v13;

    [(NetworkStateRelay *)v12 registerForNetworkChanges];
  }

  return v12;
}

- (void)dealloc
{
  fObj = self->_stateRelayQueue.fObj.fObj;
  p_stateRelayQueue = &self->_stateRelayQueue;
  if (fObj)
  {
    v5 = sub_10000FD1C((id *)&p_stateRelayQueue->fObj.fObj);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009CCF4;
    block[3] = &unk_100153F58;
    block[4] = self;
    dispatch_sync(v5, block);
  }
  v6.receiver = self;
  v6.super_class = (Class)NetworkStateRelay;
  [(NetworkStateRelay *)&v6 dealloc];
}

- (void)registerForNetworkChanges
{
  id v5 = objc_alloc_init((Class)NWParameters);
  [v5 prohibitNetworkAgentsWithDomain:@"NetworkExtension" type:@"VPN"];
  [v5 prohibitNetworkAgentsWithDomain:@"NetworkExtension" type:@"AOVPN"];
  [v5 prohibitNetworkAgentsWithDomain:@"NetworkExtension" type:@"AppVPN"];
  v3 = (NWPathEvaluator *)[objc_alloc((Class)NWPathEvaluator) initWithEndpoint:0 parameters:v5];
  primaryPathEvaluator = self->_primaryPathEvaluator;
  self->_primaryPathEvaluator = v3;

  [(NWPathEvaluator *)self->_primaryPathEvaluator addObserver:self forKeyPath:@"path" options:5 context:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8 = sub_10000FD1C((id *)&self->_stateRelayQueue.fObj.fObj);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10009CF2C;
  v10[3] = &unk_100156BF0;
  objc_copyWeak(&v12, &location);
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)updatePrimaryNetworkInterfaceType:(optional<NWInterfaceType>)a3
{
  BOOL var1 = a3.var1;
  int64_t v4 = a3.var0.var1;
  memset(&v11, 170, sizeof(v11));
  sub_100015438(&v11, "<unknown>");
  if (var1)
  {
    objc_super v6 = "WiredEthernet";
    switch(v4)
    {
      case 0:
        objc_super v6 = "Other";
        goto LABEL_9;
      case 1:
        std::string::assign(&v11, "WiFi");
        wiFiStateRelay = self->_wiFiStateRelay;
        if (!wiFiStateRelay
          || ![(WiFiStateRelay *)wiFiStateRelay wiFiActiveAndUsingPersonalHotspot])
        {
          break;
        }
        objc_super v6 = "PersonalHotspot";
LABEL_9:
        std::string::assign(&v11, v6);
        break;
      case 2:
        objc_super v6 = "Cellular";
        goto LABEL_9;
      case 3:
        goto LABEL_9;
      case 4:
        objc_super v6 = "Loopback";
        goto LABEL_9;
      default:
        break;
    }
  }
  delegate = self->delegate;
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    sub_100017424(&__p, v11.__r_.__value_.__l.__data_, v11.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v11;
  }
  char v13 = 1;
  (*((void (**)(id *__return_ptr, NetworkingStateDelegate *, std::string *))delegate->var0 + 2))(&v10, delegate, &__p);
  id v9 = v10;
  id v10 = 0;

  if (v13 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v11.__r_.__value_.__l.__data_);
  }
}

- (NWPathEvaluator)primaryPathEvaluator
{
  return self->_primaryPathEvaluator;
}

- (void)setPrimaryPathEvaluator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryPathEvaluator, 0);
  fObj = self->_stateRelayQueue.fObj.fObj;
  self->_stateRelayQueue.fObj.fObj = 0;

  objc_storeStrong((id *)&self->_telephonyStateRelay, 0);

  objc_storeStrong((id *)&self->_wiFiStateRelay, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  return self;
}

@end