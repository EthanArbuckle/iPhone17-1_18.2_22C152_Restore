@interface NetworkReachability
- (NetworkReachability)initWithRegistry:(shared_ptr<const Registry>)a3 andQueue:(queue)a4 andLogger:(void *)a5;
- (id).cxx_construct;
- (void)bootstrap;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation NetworkReachability

- (NetworkReachability)initWithRegistry:(shared_ptr<const Registry>)a3 andQueue:(queue)a4 andLogger:(void *)a5
{
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v27.receiver = self;
  v27.super_class = (Class)NetworkReachability;
  v8 = [(NetworkReachability *)&v27 init];
  if (v8)
  {
    v9 = *(NSObject **)cntrl;
    if (v9) {
      dispatch_retain(v9);
    }
    v10 = *((void *)v8 + 23);
    *((void *)v8 + 23) = v9;
    if (v10) {
      dispatch_release(v10);
    }
    uint64_t v12 = *(void *)ptr;
    uint64_t v11 = *((void *)ptr + 1);
    if (v11) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
    }
    v13 = (std::__shared_weak_count *)*((void *)v8 + 26);
    *((void *)v8 + 25) = v12;
    *((void *)v8 + 26) = v11;
    if (v13) {
      sub_10004D2C8(v13);
    }
    uint64_t v14 = +[NWPathEvaluator sharedDefaultEvaluator];
    v15 = (void *)*((void *)v8 + 24);
    *((void *)v8 + 24) = v14;

    sub_100058DB0(&__p, "NetworkReachability");
    v16 = *((void *)v8 + 23);
    v23 = v16;
    if (v16) {
      dispatch_retain(v16);
    }
    ctu::RestModule::RestModule();
    long long v17 = v26;
    long long v26 = 0uLL;
    v18 = (std::__shared_weak_count *)*((void *)v8 + 22);
    *(_OWORD *)(v8 + 168) = v17;
    if (v18)
    {
      sub_10004D2C8(v18);
      if (*((void *)&v26 + 1)) {
        sub_10004D2C8(*((std::__shared_weak_count **)&v26 + 1));
      }
    }
    if (v23) {
      dispatch_release(v23);
    }
    if (v25 < 0) {
      operator delete(__p);
    }
    v8[80] = 0;
    uint64_t v19 = *((void *)v8 + 9);
    if (v19) {
      (*(void (**)(uint64_t))(*(void *)v19 + 48))(v19);
    }
    v8[40] = 0;
    uint64_t v20 = *((void *)v8 + 4);
    if (v20) {
      (*(void (**)(uint64_t))(*(void *)v20 + 48))(v20);
    }
    v8[160] = 0;
    uint64_t v21 = *((void *)v8 + 19);
    if (v21) {
      (*(void (**)(uint64_t))(*(void *)v21 + 48))(v21);
    }
    *((queue *)v8 + 27) = a4;
  }
  return (NetworkReachability *)v8;
}

- (void)bootstrap
{
  Registry::createRestModuleOneTimeUseConnection(&v16, self->fRegistry.__ptr_);
  p_fRestModule = &self->fRestModule;
  ctu::RestModule::connect();
  if (v17) {
    sub_10004D2C8(v17);
  }
  p_fInternetReachabilityInterface = &self->fInternetReachabilityInterface;
  v18 = off_101A098D8;
  uint64_t v19 = &self->fRestModule;
  uint64_t v20 = &v18;
  if (&v18 != (uint64_t (***)())&self->fInternetReachabilityInterface)
  {
    f = (uint64_t (***)())self->fInternetReachabilityInterface.fSender.__f_.__f_;
    if (f == (uint64_t (***)())p_fInternetReachabilityInterface)
    {
      v22 = &self->fRestModule;
      uint64_t v23 = 0;
      uint64_t v20 = 0;
      uint64_t v21 = off_101A098D8;
      (*(void (**)(property_source_t<internet_reachability_interface> *, uint64_t (***)()))(*(void *)p_fInternetReachabilityInterface->fSender.__f_.__buf_.__lx + 24))(&self->fInternetReachabilityInterface, &v18);
      (*(void (**)(void *))(*(void *)self->fInternetReachabilityInterface.fSender.__f_.__f_ + 32))(self->fInternetReachabilityInterface.fSender.__f_.__f_);
      self->fInternetReachabilityInterface.fSender.__f_.__f_ = 0;
      uint64_t v20 = &v18;
      ((void (*)(uint64_t (***)(), property_source_t<internet_reachability_interface> *))v21[3])(&v21, &self->fInternetReachabilityInterface);
      ((void (*)(uint64_t (***)()))v21[4])(&v21);
    }
    else
    {
      *(void *)self->fInternetReachabilityInterface.fSender.__f_.__buf_.__lx = off_101A098D8;
      *(void *)&self->fInternetReachabilityInterface.fSender.__f_.__buf_.__lx[8] = p_fRestModule;
      uint64_t v20 = f;
    }
    self->fInternetReachabilityInterface.fSender.__f_.__f_ = p_fInternetReachabilityInterface;
  }
  sub_1007C0A3C(&v18);
  v6 = self->fInternetReachabilityInterface.fSender.__f_.__f_;
  if (v6) {
    (*(void (**)(void *, unsigned __int8 *))(*(void *)v6 + 48))(v6, &self->fInternetReachabilityInterface.fValue);
  }
  p_fInternetStatus = &self->fInternetStatus;
  v18 = off_101A09968;
  uint64_t v19 = &self->fRestModule;
  uint64_t v20 = &v18;
  if (&v18 != (uint64_t (***)())&self->fInternetStatus)
  {
    v8 = (uint64_t (***)())self->fInternetStatus.fSender.__f_.__f_;
    if (v8 == (uint64_t (***)())p_fInternetStatus)
    {
      v22 = &self->fRestModule;
      uint64_t v23 = 0;
      uint64_t v20 = 0;
      uint64_t v21 = off_101A09968;
      (*(void (**)(property_source_t<internet_status> *, uint64_t (***)()))(*(void *)p_fInternetStatus->fSender.__f_.__buf_.__lx
                                                                                               + 24))(&self->fInternetStatus, &v18);
      (*(void (**)(void *))(*(void *)self->fInternetStatus.fSender.__f_.__f_ + 32))(self->fInternetStatus.fSender.__f_.__f_);
      self->fInternetStatus.fSender.__f_.__f_ = 0;
      uint64_t v20 = &v18;
      ((void (*)(uint64_t (***)(), property_source_t<internet_status> *))v21[3])(&v21, &self->fInternetStatus);
      ((void (*)(uint64_t (***)()))v21[4])(&v21);
    }
    else
    {
      *(void *)self->fInternetStatus.fSender.__f_.__buf_.__lx = off_101A09968;
      *(void *)&self->fInternetStatus.fSender.__f_.__buf_.__lx[8] = p_fRestModule;
      uint64_t v20 = v8;
    }
    self->fInternetStatus.fSender.__f_.__f_ = p_fInternetStatus;
  }
  sub_1007C09B8(&v18);
  v9 = self->fInternetStatus.fSender.__f_.__f_;
  if (v9) {
    (*(void (**)(void *, unsigned __int8 *))(*(void *)v9 + 48))(v9, &self->fInternetStatus.fValue);
  }
  p_fWifiStatus = &self->fWifiStatus;
  v18 = off_101A099F8;
  uint64_t v19 = &self->fRestModule;
  uint64_t v20 = &v18;
  if (&v18 != (uint64_t (***)())&self->fWifiStatus)
  {
    uint64_t v11 = (uint64_t (***)())self->fWifiStatus.fSender.__f_.__f_;
    if (v11 == (uint64_t (***)())p_fWifiStatus)
    {
      v22 = &self->fRestModule;
      uint64_t v23 = 0;
      uint64_t v20 = 0;
      uint64_t v21 = off_101A099F8;
      (*(void (**)(property_source_t<wifi_status> *, uint64_t (***)()))(*(void *)p_fWifiStatus->fSender.__f_.__buf_.__lx
                                                                                           + 24))(&self->fWifiStatus, &v18);
      (*(void (**)(void *))(*(void *)self->fWifiStatus.fSender.__f_.__f_ + 32))(self->fWifiStatus.fSender.__f_.__f_);
      self->fWifiStatus.fSender.__f_.__f_ = 0;
      uint64_t v20 = &v18;
      ((void (*)(uint64_t (***)(), property_source_t<wifi_status> *))v21[3])(&v21, &self->fWifiStatus);
      ((void (*)(uint64_t (***)()))v21[4])(&v21);
    }
    else
    {
      *(void *)self->fWifiStatus.fSender.__f_.__buf_.__lx = off_101A099F8;
      *(void *)&self->fWifiStatus.fSender.__f_.__buf_.__lx[8] = p_fRestModule;
      uint64_t v20 = v11;
    }
    self->fWifiStatus.fSender.__f_.__f_ = p_fWifiStatus;
  }
  sub_1007C0934(&v18);
  uint64_t v12 = self->fWifiStatus.fSender.__f_.__f_;
  if (v12) {
    (*(void (**)(void *, unsigned __int8 *))(*(void *)v12 + 48))(v12, &self->fWifiStatus.fValue);
  }
  p_fEthernetStatus = &self->fEthernetStatus;
  v18 = off_101A09A88;
  uint64_t v19 = &self->fRestModule;
  uint64_t v20 = &v18;
  if (&v18 != (uint64_t (***)())&self->fEthernetStatus)
  {
    uint64_t v14 = (uint64_t (***)())self->fEthernetStatus.fSender.__f_.__f_;
    if (v14 == (uint64_t (***)())p_fEthernetStatus)
    {
      v22 = &self->fRestModule;
      uint64_t v23 = 0;
      uint64_t v20 = 0;
      uint64_t v21 = off_101A09A88;
      (*(void (**)(property_source_t<ethernet_status> *, uint64_t (***)()))(*(void *)p_fEthernetStatus->fSender.__f_.__buf_.__lx
                                                                                               + 24))(&self->fEthernetStatus, &v18);
      (*(void (**)(void *))(*(void *)self->fEthernetStatus.fSender.__f_.__f_ + 32))(self->fEthernetStatus.fSender.__f_.__f_);
      self->fEthernetStatus.fSender.__f_.__f_ = 0;
      uint64_t v20 = &v18;
      ((void (*)(uint64_t (***)(), property_source_t<ethernet_status> *))v21[3])(&v21, &self->fEthernetStatus);
      ((void (*)(uint64_t (***)()))v21[4])(&v21);
    }
    else
    {
      *(void *)self->fEthernetStatus.fSender.__f_.__buf_.__lx = off_101A09A88;
      *(void *)&self->fEthernetStatus.fSender.__f_.__buf_.__lx[8] = p_fRestModule;
      uint64_t v20 = v14;
    }
    self->fEthernetStatus.fSender.__f_.__f_ = p_fEthernetStatus;
  }
  sub_1007C08B0(&v18);
  v15 = self->fEthernetStatus.fSender.__f_.__f_;
  if (v15) {
    (*(void (**)(void *, unsigned __int8 *))(*(void *)v15 + 48))(v15, &self->fEthernetStatus.fValue);
  }
  [self->fNWPathEvaluator addObserver:self forKeyPath:@"path" options:5 context:0];
}

- (void)dealloc
{
  fNWPathEvaluator = self->fNWPathEvaluator;
  if (fNWPathEvaluator) {
    [fNWPathEvaluator removeObserver:self forKeyPath:@"path"];
  }
  v4.receiver = self;
  v4.super_class = (Class)NetworkReachability;
  [(NetworkReachability *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id location = 0;
  objc_initWeak(&location, self);
  fObj = self->fQueue.fObj.fObj;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1007C03D4;
  v8[3] = &unk_101A098A8;
  objc_copyWeak(&v9, &location);
  dispatch_async(fObj, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  cntrl = self->fRegistry.__cntrl_;
  if (cntrl) {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->fNWPathEvaluator, 0);
  fObj = self->fQueue.fObj.fObj;
  if (fObj) {
    dispatch_release(fObj);
  }
  v5 = self->fRestModule.fState.__cntrl_;
  if (v5) {
    sub_10004D2C8((std::__shared_weak_count *)v5);
  }
  sub_1007C08B0(self->fEthernetStatus.fSender.__f_.__buf_.__lx);
  sub_1007C0934(self->fWifiStatus.fSender.__f_.__buf_.__lx);
  sub_1007C09B8(self->fInternetStatus.fSender.__f_.__buf_.__lx);

  sub_1007C0A3C(self->fInternetReachabilityInterface.fSender.__f_.__buf_.__lx);
}

- (id).cxx_construct
{
  self->fInternetReachabilityInterface.fSender.__f_.__f_ = 0;
  self->fInternetReachabilityInterface.fValue = 0;
  self->fInternetStatus.fSender.__f_.__f_ = 0;
  self->fInternetStatus.fValue = 0;
  self->fWifiStatus.fSender.__f_.__f_ = 0;
  self->fWifiStatus.fValue = 0;
  self->fEthernetStatus.fSender.__f_.__f_ = 0;
  self->fEthernetStatus.fValue = 0;
  ctu::RestModule::RestModule((ctu::RestModule *)&self->fRestModule);
  self->fQueue.fObj.fObj = 0;
  self->fRegistry.__ptr_ = 0;
  self->fRegistry.__cntrl_ = 0;
  return self;
}

@end