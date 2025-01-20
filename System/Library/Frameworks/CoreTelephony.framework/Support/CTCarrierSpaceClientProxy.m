@interface CTCarrierSpaceClientProxy
- (BOOL)_isEntitledForControl;
- (CTCarrierSpaceClientProxy)initWithConnection:(id)a3 registry:(shared_ptr<Registry>)a4 controller:(weak_ptr<CarrierSpaceControllerInterface>)a5 logger:(const void *)a6;
- (CTCarrierSpaceClientProxyDelegate)delegate;
- (NSXPCConnection)connection;
- (id).cxx_construct;
- (id)_processNameWithPid;
- (shared_ptr<carrier_space::EntitlementValidator>)entitlementValidator;
- (void)_handleConnectionInvalidated;
- (void)authenticationDidComplete:(id)a3 completion:(id)a4;
- (void)authenticationDidFail:(id)a3 completion:(id)a4;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)fetchAppsInfo:(BOOL)a3 completion:(id)a4;
- (void)fetchDataPlanMetrics:(id)a3;
- (void)fetchPlansInfo:(BOOL)a3 completion:(id)a4;
- (void)fetchUsageInfo:(BOOL)a3 completion:(id)a4;
- (void)getAuthenticationContext:(id)a3;
- (void)getCapabilities:(id)a3;
- (void)getUserConsentFlowInfo:(id)a3;
- (void)notifyAppsChanged;
- (void)notifyCapabilitiesChanged:(id)a3;
- (void)notifyDataPlanMetricsChanged;
- (void)notifyPlanPurchaseStatusChanged:(id)a3 status:(unsigned __int8)a4;
- (void)notifyPlansChanged;
- (void)notifyUsageChanged;
- (void)notifyUserConsentFlowInfoChanged;
- (void)ping:(id)a3;
- (void)purchasePlan:(id)a3 authInfo:(id)a4 completion:(id)a5;
- (void)refreshAllInfo:(id)a3;
- (void)refreshAppsInfo:(id)a3;
- (void)refreshPlansInfo:(id)a3;
- (void)refreshUsageInfo:(id)a3;
- (void)sendIfRespondsTo:(SEL)a3 handler:(id)a4;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEntitlementValidator:(shared_ptr<carrier_space::EntitlementValidator>)a3;
- (void)setUserConsent:(BOOL)a3 completion:(id)a4;
- (void)setUserInAuthFlow:(BOOL)a3 completion:(id)a4;
- (void)testMode:(BOOL)a3 config:(id)a4 completion:(id)a5;
- (void)userDidAcceptPlanTerms:(BOOL)a3 completion:(id)a4;
@end

@implementation CTCarrierSpaceClientProxy

- (CTCarrierSpaceClientProxy)initWithConnection:(id)a3 registry:(shared_ptr<Registry>)a4 controller:(weak_ptr<CarrierSpaceControllerInterface>)a5 logger:(const void *)a6
{
  ptr = a5.__ptr_;
  cntrl = a4.__cntrl_;
  v8 = a4.__ptr_;
  id v10 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CTCarrierSpaceClientProxy;
  v11 = [(CTCarrierSpaceClientProxy *)&v37 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_25;
  }
  v11->logger = v10;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100077634;
  v35[3] = &unk_101999238;
  v13 = v11;
  v36 = v13;
  [(id)v12->logger setInvalidationHandler:v35];
  [(id)v12->logger setDelegate:v13];
  shared_ptr<Registry> v14 = *(shared_ptr<Registry> *)v8;
  *(void *)v8 = 0;
  *((void *)v8 + 1) = 0;
  v15 = (std::__shared_weak_count *)v13->fRegistry.__cntrl_;
  v13->fRegistry = v14;
  if (v15) {
    sub_10004D2C8(v15);
  }
  v16 = [(id)v12->logger _queue];
  v17 = v16;
  if (v16) {
    dispatch_retain(v16);
  }
  fObj = v13->fQueue.fObj.fObj;
  v13->fQueue.fObj.fObj = (dispatch_object_s *)v17;
  if (fObj) {
    dispatch_release(fObj);
  }
  ServiceMap = (std::mutex *)Registry::getServiceMap(v13->fRegistry.__ptr_);
  v20 = ServiceMap;
  if (v21 < 0)
  {
    v22 = (unsigned __int8 *)(v21 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v23 = 5381;
    do
    {
      uint64_t v21 = v23;
      unsigned int v24 = *v22++;
      uint64_t v23 = (33 * v23) ^ v24;
    }
    while (v24);
  }
  std::mutex::lock(ServiceMap);
  *(void *)&long long v33 = v21;
  v25 = sub_10004D37C(&v20[1].__m_.__sig, (unint64_t *)&v33);
  if (v25)
  {
    uint64_t v27 = v25[3];
    v26 = (std::__shared_weak_count *)v25[4];
    if (v26)
    {
      atomic_fetch_add_explicit(&v26->__shared_owners_, 1uLL, memory_order_relaxed);
      std::mutex::unlock(v20);
      atomic_fetch_add_explicit(&v26->__shared_owners_, 1uLL, memory_order_relaxed);
      sub_10004D2C8(v26);
      char v28 = 0;
      if (!v27) {
        goto LABEL_20;
      }
LABEL_17:
      (*(void (**)(long long *__return_ptr, uint64_t, id))(*(void *)v27 + 24))(&v33, v27, [(id)v12->logger processIdentifier]);
      p_fProcessName = (void **)&v13->fProcessName;
      if (*((char *)&v13->fProcessName.__r_.__value_.var0.var1 + 23) < 0) {
        operator delete(*p_fProcessName);
      }
      *(_OWORD *)p_fProcessName = v33;
      *((void *)&v13->fProcessName.__r_.__value_.var0.var1 + 2) = v34;
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v27 = 0;
  }
  std::mutex::unlock(v20);
  v26 = 0;
  char v28 = 1;
  if (v27) {
    goto LABEL_17;
  }
LABEL_20:
  if ((v28 & 1) == 0) {
    sub_10004D2C8(v26);
  }
  weak_ptr<CarrierSpaceControllerInterface> v30 = *(weak_ptr<CarrierSpaceControllerInterface> *)cntrl;
  *(void *)cntrl = 0;
  *((void *)cntrl + 1) = 0;
  v31 = (std::__shared_weak_count *)v13->fWeakController.__cntrl_;
  v13->fWeakController = v30;
  if (v31) {
    std::__shared_weak_count::__release_weak(v31);
  }
  *(void *)&v13->fProcessName.__r_.var0 = ptr;
  LOBYTE(v13->fProcessName.var0) = 0;
  objc_storeWeak((id *)&v13->fIsInAuthFlow, 0);

LABEL_25:
  return v12;
}

- (void)_handleConnectionInvalidated
{
  cntrl = self->fWeakController.__cntrl_;
  if (cntrl)
  {
    v4 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v4)
    {
      v5 = v4;
      ptr = self->fWeakController.__ptr_;
      if (ptr && LOBYTE(self->fProcessName.var0)) {
        (*(void (**)(CarrierSpaceControllerInterface *, void, void))(*(void *)ptr + 104))(ptr, 0, 0);
      }
      sub_10004D2C8(v5);
    }
  }
}

- (BOOL)_isEntitledForControl
{
  char v3 = (*((uint64_t (**)(NSXPCConnection *, const void *))self->_connection->super.isa + 3))(self->_connection, self->logger);
  if ((v3 & 1) == 0)
  {
    v4 = **(NSObject ***)&self->fProcessName.__r_.var0;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I Client %p does not have carrier space control entitlement", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3;
}

- (id)_processNameWithPid
{
  p_fProcessName = &self->fProcessName;
  if ((*((char *)&self->fProcessName.__r_.__value_.var0.var1 + 23) & 0x80000000) == 0)
  {
    if (!*((unsigned char *)&self->fProcessName.__r_.__value_.var0.var1 + 23)) {
      goto LABEL_7;
    }
LABEL_6:
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s (%d)", p_fProcessName, [self->logger processIdentifier]);
    goto LABEL_8;
  }
  if (self->fProcessName.__r_.__value_.var0.var1.__size_)
  {
    p_fProcessName = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_fProcessName->__r_.__value_.var0.var1.__data_;
    goto LABEL_6;
  }
LABEL_7:
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"pid %d", [self->logger processIdentifier], v5);
  char v3 = LABEL_8:;

  return v3;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  BOOL v5 = a5;
  id v26 = a3;
  id v8 = a4;
  v9 = v8;
  if (v5)
  {
    [v8 invoke];
    goto LABEL_31;
  }
  id v10 = [v8 methodSignature];
  v11 = +[NSMutableString stringWithFormat:@"{\n"];
  for (uint64_t i = 0; (unint64_t)[v10 numberOfArguments] > (i + 2); uint64_t i = (i + 1))
  {
    memset(__p, 0, 24);
    sub_100058DB0(__p, (char *)[v10 getArgumentTypeAtIndex:(i + 2)]);
    v13 = (void *)HIBYTE(__p[2]);
    if (SHIBYTE(__p[2]) < 0) {
      v13 = __p[1];
    }
    if (v13 == (void *)2)
    {
      if (SHIBYTE(__p[2]) >= 0) {
        v17 = __p;
      }
      else {
        v17 = (void **)__p[0];
      }
      if (*(_WORD *)v17 != 16192) {
        goto LABEL_19;
      }
      CFStringRef v18 = @"    %d: <block>\n";
LABEL_20:
      objc_msgSend(v11, "appendFormat:", v18, i);
      goto LABEL_21;
    }
    if (v13 != (void *)1) {
      goto LABEL_19;
    }
    if (SHIBYTE(__p[2]) >= 0) {
      shared_ptr<Registry> v14 = __p;
    }
    else {
      shared_ptr<Registry> v14 = (void **)__p[0];
    }
    int v15 = *(unsigned __int8 *)v14;
    if (v15 != 66)
    {
      if (v15 == 64)
      {
        id location = 0;
        [v9 getArgument:&location atIndex:(i + 2)];
        id v16 = objc_loadWeakRetained(&location);
        [v11 appendFormat:@"    %d: %@\n", i, v16, v26];

        objc_destroyWeak(&location);
        goto LABEL_21;
      }
LABEL_19:
      CFStringRef v18 = @"    %d: <undecodable>\n";
      goto LABEL_20;
    }
    LOBYTE(location) = 0;
    [v9 getArgument:&location atIndex:(i + 2)];
    v19 = "true";
    if (!(_BYTE)location) {
      v19 = "false";
    }
    objc_msgSend(v11, "appendFormat:", @"    %d: %s\n", i, v19);
LABEL_21:
    if (SHIBYTE(__p[2]) < 0) {
      operator delete(__p[0]);
    }
  }
  [v11 appendString:@"}"];
  v20 = NSStringFromSelector((SEL)[v9 selector]);
  uint64_t v21 = **(NSObject ***)&self->fProcessName.__r_.var0;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = [(CTCarrierSpaceClientProxy *)self _processNameWithPid];
    id v23 = [v22 UTF8String];
    id v24 = [v20 UTF8String];
    id v25 = [v11 UTF8String];
    LODWORD(__p[0]) = 136315650;
    *(void **)((char *)__p + 4) = v23;
    WORD2(__p[1]) = 2080;
    *(void **)((char *)&__p[1] + 6) = v24;
    HIWORD(__p[2]) = 2080;
    __p[3] = v25;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#I Client [%s] invoking %s, args %s", (uint8_t *)__p, 0x20u);
  }
  [v9 invoke];

LABEL_31:
}

- (void)getCapabilities:(id)a3
{
  id v4 = a3;
  cntrl = self->fWeakController.__cntrl_;
  if (cntrl)
  {
    int v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v6 && self->fWeakController.__ptr_)
    {
      uint64_t v10 = 0;
      fObj = self->fQueue.fObj.fObj;
      if (fObj) {
        dispatch_retain((dispatch_object_t)self->fQueue.fObj.fObj);
      }
      dispatch_object_t object = fObj;
      v12 = off_1019993E0;
      v13 = self;
      id v14 = objc_retainBlock(v4);
      int v15 = &v12;
      id v8 = v13;
      sub_10007CF50();
    }
  }
  else
  {
    int v6 = 0;
  }
  v9 = +[CTCarrierSpaceError errorForCode:4];
  (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);

  if (v6) {
    sub_10004D2C8(v6);
  }
}

- (void)getUserConsentFlowInfo:(id)a3
{
  id v4 = a3;
  cntrl = self->fWeakController.__cntrl_;
  if (cntrl)
  {
    int v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v6 && self->fWeakController.__ptr_)
    {
      uint64_t v10 = 0;
      fObj = self->fQueue.fObj.fObj;
      if (fObj) {
        dispatch_retain((dispatch_object_t)self->fQueue.fObj.fObj);
      }
      dispatch_object_t object = fObj;
      v12 = off_101999470;
      v13 = self;
      id v14 = objc_retainBlock(v4);
      int v15 = &v12;
      id v8 = v13;
      sub_10007D41C();
    }
  }
  else
  {
    int v6 = 0;
  }
  v9 = +[CTCarrierSpaceError errorForCode:4];
  (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);

  if (v6) {
    sub_10004D2C8(v6);
  }
}

- (void)setUserConsent:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v10 = (void (**)(id, void *))a4;
  cntrl = self->fWeakController.__cntrl_;
  if (!cntrl)
  {
    v7 = 0;
    goto LABEL_6;
  }
  v7 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
  if (!v7 || (ptr = self->fWeakController.__ptr_) == 0)
  {
LABEL_6:
    v9 = +[CTCarrierSpaceError errorForCode:4];
    v10[2](v10, v9);

    if (!v7) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  (*(void (**)(CarrierSpaceControllerInterface *, BOOL))(*(void *)ptr + 32))(ptr, v4);
  v10[2](v10, 0);
LABEL_7:
  sub_10004D2C8(v7);
LABEL_8:
}

- (void)fetchUsageInfo:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  cntrl = self->fWeakController.__cntrl_;
  if (cntrl)
  {
    id v8 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v8 && self->fWeakController.__ptr_)
    {
      uint64_t v12 = 0;
      BOOL v13 = a3;
      fObj = self->fQueue.fObj.fObj;
      if (fObj) {
        dispatch_retain((dispatch_object_t)self->fQueue.fObj.fObj);
      }
      dispatch_object_t object = fObj;
      int v15 = off_101999500;
      id v16 = self;
      id v17 = objc_retainBlock(v6);
      CFStringRef v18 = &v15;
      uint64_t v10 = v16;
      sub_10007D8E8();
    }
  }
  else
  {
    id v8 = 0;
  }
  v11 = +[CTCarrierSpaceError errorForCode:4];
  (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v11);

  if (v8) {
    sub_10004D2C8(v8);
  }
}

- (void)fetchPlansInfo:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  cntrl = self->fWeakController.__cntrl_;
  if (cntrl)
  {
    id v8 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v8 && self->fWeakController.__ptr_)
    {
      uint64_t v12 = 0;
      BOOL v13 = a3;
      fObj = self->fQueue.fObj.fObj;
      if (fObj) {
        dispatch_retain((dispatch_object_t)self->fQueue.fObj.fObj);
      }
      dispatch_object_t object = fObj;
      int v15 = off_101999590;
      id v16 = self;
      id v17 = objc_retainBlock(v6);
      CFStringRef v18 = &v15;
      uint64_t v10 = v16;
      sub_10007DDB4();
    }
  }
  else
  {
    id v8 = 0;
  }
  v11 = +[CTCarrierSpaceError errorForCode:4];
  (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v11);

  if (v8) {
    sub_10004D2C8(v8);
  }
}

- (void)fetchAppsInfo:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  cntrl = self->fWeakController.__cntrl_;
  if (cntrl)
  {
    id v8 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v8 && self->fWeakController.__ptr_)
    {
      uint64_t v12 = 0;
      BOOL v13 = a3;
      fObj = self->fQueue.fObj.fObj;
      if (fObj) {
        dispatch_retain((dispatch_object_t)self->fQueue.fObj.fObj);
      }
      dispatch_object_t object = fObj;
      int v15 = off_101999620;
      id v16 = self;
      id v17 = objc_retainBlock(v6);
      CFStringRef v18 = &v15;
      uint64_t v10 = v16;
      sub_10007E280();
    }
  }
  else
  {
    id v8 = 0;
  }
  v11 = +[CTCarrierSpaceError errorForCode:4];
  (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v11);

  if (v8) {
    sub_10004D2C8(v8);
  }
}

- (void)refreshAllInfo:(id)a3
{
  id v4 = a3;
  cntrl = self->fWeakController.__cntrl_;
  if (cntrl)
  {
    id v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v6 && self->fWeakController.__ptr_)
    {
      uint64_t v10 = 0;
      fObj = self->fQueue.fObj.fObj;
      if (fObj) {
        dispatch_retain((dispatch_object_t)self->fQueue.fObj.fObj);
      }
      dispatch_object_t object = fObj;
      uint64_t v12 = off_1019996B0;
      BOOL v13 = self;
      id v14 = objc_retainBlock(v4);
      int v15 = &v12;
      id v8 = v13;
      sub_10007E74C();
    }
  }
  else
  {
    id v6 = 0;
  }
  v9 = +[CTCarrierSpaceError errorForCode:4];
  (*((void (**)(id, void *))v4 + 2))(v4, v9);

  if (v6) {
    sub_10004D2C8(v6);
  }
}

- (void)purchasePlan:(id)a3 authInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  cntrl = self->fWeakController.__cntrl_;
  if (cntrl)
  {
    uint64_t v12 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v12 && self->fWeakController.__ptr_)
    {
      BOOL v13 = [v8 planId];

      if (v13)
      {
        uint64_t v48 = 0;
        long long v47 = 0u;
        *(_OWORD *)__p = 0u;
        memset(v46, 0, sizeof(v46));
        *(_OWORD *)v43 = 0u;
        long long v44 = 0u;
        *(_OWORD *)v41 = 0u;
        long long v42 = 0u;
        *(_OWORD *)buf = 0u;
        *(_OWORD *)v40 = 0u;
        id v14 = [v8 planId];
        sub_10003ED78((std::string *)v40, (char *)[v14 UTF8String]);

        int v15 = [v8 planLabel];
        LOBYTE(v14) = v15 == 0;

        if ((v14 & 1) == 0)
        {
          id v16 = [v8 planLabel];
          sub_10003ED78((std::string *)&v41[1], (char *)[v16 UTF8String]);
        }
        id v17 = [v8 planTermsURL];
        if (v17)
        {
          CFStringRef v18 = [v8 planTermsURL];
          BOOL v19 = [v18 length] == 0;

          if (!v19)
          {
            id v20 = [v8 planTermsURL];
            *(void *)&long long v32 = [v20 UTF8String];
            sub_1000791C0((std::string *)v43, (char **)&v32);
          }
        }
        sub_100079204((uint64_t)&v32, v9);
        if (v48 == v38)
        {
          if ((_BYTE)v48)
          {
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
            *(_OWORD *)__p = v32;
            v46[0] = v33;
            long long v33 = 0;
            long long v32 = 0uLL;
            if (v46[1])
            {
              v46[2] = v46[1];
              operator delete(v46[1]);
            }
            *(_OWORD *)&v46[1] = v34;
            uint64_t v21 = v35;
            v35 = 0;
            long long v34 = 0uLL;
            dispatch_object_t object = (dispatch_object_t)v47;
            v46[3] = v21;
            *(void *)&long long v47 = v36;
            uint64_t v36 = 0;
            sub_10007CA64((const void **)&object);
            WORD4(v47) = v37;
          }
        }
        else if ((_BYTE)v48)
        {
          sub_10007CA64((const void **)&v47);
          if (v46[1])
          {
            v46[2] = v46[1];
            operator delete(v46[1]);
          }
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          LOBYTE(v48) = 0;
        }
        else
        {
          *(_OWORD *)__p = v32;
          long long v32 = 0uLL;
          *(_OWORD *)&v46[1] = v34;
          v46[0] = v33;
          long long v33 = 0;
          long long v34 = 0uLL;
          id v26 = v35;
          uint64_t v25 = v36;
          v35 = 0;
          uint64_t v36 = 0;
          v46[3] = v26;
          *(void *)&long long v47 = v25;
          WORD4(v47) = v37;
          LOBYTE(v48) = 1;
        }
        sub_10007CAFC((uint64_t)&v32);
        fObj = self->fQueue.fObj.fObj;
        if (fObj) {
          dispatch_retain((dispatch_object_t)self->fQueue.fObj.fObj);
        }
        char v28 = self;
        id v29 = objc_retainBlock(v10);
        dispatch_object_t object = fObj;
        *(void *)&long long v32 = off_101999740;
        *((void *)&v32 + 1) = v28;
        long long v33 = v29;
        *(void *)&long long v34 = &v32;
        weak_ptr<CarrierSpaceControllerInterface> v30 = v28;
        sub_10007E74C();
      }
      id v23 = **(NSObject ***)&self->fProcessName.__r_.var0;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = 8;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#I response for purchasePlan, error %ld", buf, 0xCu);
      }
      id v24 = +[CTCarrierSpaceError errorForCode:8];
      (*((void (**)(id, void *))v10 + 2))(v10, v24);

      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v22 = +[CTCarrierSpaceError errorForCode:4];
  (*((void (**)(id, void *))v10 + 2))(v10, v22);

  if (v12) {
LABEL_19:
  }
    sub_10004D2C8(v12);
}

- (void)fetchDataPlanMetrics:(id)a3
{
  id v4 = a3;
  cntrl = self->fWeakController.__cntrl_;
  if (cntrl)
  {
    id v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v6 && self->fWeakController.__ptr_)
    {
      uint64_t v10 = 0;
      fObj = self->fQueue.fObj.fObj;
      if (fObj) {
        dispatch_retain((dispatch_object_t)self->fQueue.fObj.fObj);
      }
      dispatch_object_t object = fObj;
      uint64_t v12 = off_1019997C0;
      BOOL v13 = self;
      id v14 = objc_retainBlock(v4);
      int v15 = &v12;
      id v8 = v13;
      sub_10007EF14();
    }
  }
  else
  {
    id v6 = 0;
  }
  id v9 = +[CTCarrierSpaceError errorForCode:4];
  (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);

  if (v6) {
    sub_10004D2C8(v6);
  }
}

- (void)ping:(id)a3
{
  char v3 = (void (**)(id, void))a3;
  if (v3) {
    v3[2](v3, 0);
  }
}

- (void)testMode:(BOOL)a3 config:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  cntrl = self->fWeakController.__cntrl_;
  if (cntrl)
  {
    v11 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v11)
    {
      ptr = self->fWeakController.__ptr_;
      if (ptr)
      {
        id v14 = v8;
        if (v8) {
          CFRetain(v8);
        }
        (*(void (**)(CarrierSpaceControllerInterface *, BOOL, const void **))(*(void *)ptr + 120))(ptr, v6, &v14);
        sub_100057D78(&v14);
        v9[2](v9, 0);
        goto LABEL_9;
      }
    }
  }
  else
  {
    v11 = 0;
  }
  BOOL v13 = +[CTCarrierSpaceError errorForCode:4];
  ((void (**)(id, void *))v9)[2](v9, v13);

  if (v11) {
LABEL_9:
  }
    sub_10004D2C8(v11);
}

- (void)setUserInAuthFlow:(BOOL)a3 completion:(id)a4
{
  uint64_t v10 = (void (**)(id, void *))a4;
  if (![(CTCarrierSpaceClientProxy *)self _isEntitledForControl])
  {
    id v8 = +[CTCarrierSpaceError errorForCode:12];
    v10[2](v10, v8);

    goto LABEL_10;
  }
  cntrl = self->fWeakController.__cntrl_;
  if (!cntrl)
  {
    v7 = 0;
    goto LABEL_8;
  }
  v7 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
  if (!v7 || !self->fWeakController.__ptr_)
  {
LABEL_8:
    id v9 = +[CTCarrierSpaceError errorForCode:4];
    v10[2](v10, v9);

    if (!v7) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  LOBYTE(self->fProcessName.var0) = a3;
  v10[2](v10, 0);
LABEL_9:
  sub_10004D2C8(v7);
LABEL_10:
}

- (void)authenticationDidComplete:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  if ([(CTCarrierSpaceClientProxy *)self _isEntitledForControl])
  {
    cntrl = self->fWeakController.__cntrl_;
    if (cntrl)
    {
      id v9 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
      if (v9)
      {
        ptr = self->fWeakController.__ptr_;
        if (ptr)
        {
          uint64_t v26 = 0;
          long long v24 = 0u;
          *(_OWORD *)cf = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          sub_100079204((uint64_t)&v22, v6);
          if ((_BYTE)v26)
          {
            id v14 = 0;
            int v15 = 0;
            uint64_t v16 = 0;
            sub_10005C928(&v14, (const void *)v22, *((uint64_t *)&v22 + 1), *((void *)&v22 + 1) - v22);
            __p = 0;
            CFStringRef v18 = 0;
            uint64_t v19 = 0;
            sub_10005C928(&__p, *((const void **)&v23 + 1), v24, v24 - *((void *)&v23 + 1));
            CFTypeRef v20 = cf[0];
            if (cf[0]) {
              CFRetain(cf[0]);
            }
            __int16 v21 = (__int16)cf[1];
            (*(void (**)(CarrierSpaceControllerInterface *, void **))(*(void *)ptr + 96))(ptr, &v14);
            sub_10007CA64(&v20);
            if (__p)
            {
              CFStringRef v18 = __p;
              operator delete(__p);
            }
            if (v14)
            {
              int v15 = v14;
              operator delete(v14);
            }
            v7[2](v7, 0);
          }
          else
          {
            BOOL v13 = +[CTCarrierSpaceError errorForCode:8];
            ((void (**)(id, void *))v7)[2](v7, v13);
          }
          sub_10007CAFC((uint64_t)&v22);
LABEL_19:
          sub_10004D2C8(v9);
          goto LABEL_20;
        }
      }
    }
    else
    {
      id v9 = 0;
    }
    uint64_t v12 = +[CTCarrierSpaceError errorForCode:4];
    ((void (**)(id, void *))v7)[2](v7, v12);

    if (!v9) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v11 = +[CTCarrierSpaceError errorForCode:12];
  ((void (**)(id, void *))v7)[2](v7, v11);

LABEL_20:
}

- (void)authenticationDidFail:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  if ([(CTCarrierSpaceClientProxy *)self _isEntitledForControl])
  {
    cntrl = self->fWeakController.__cntrl_;
    if (cntrl)
    {
      id v9 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
      if (v9)
      {
        ptr = self->fWeakController.__ptr_;
        if (ptr)
        {
          v11 = **(NSObject ***)&self->fProcessName.__r_.var0;
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            id v12 = [v6 description];
            int v20 = 136315138;
            id v21 = [v12 UTF8String];
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I Received signal that authentication failed with error: %s", (uint8_t *)&v20, 0xCu);
          }
          BOOL v13 = [v6 domain];
          unsigned int v14 = [v13 isEqualToString:CTCarrierSpaceErrorDomain];

          if (v14)
          {
            id v15 = [v6 code];
            uint64_t v16 = 0;
            unint64_t v17 = 0x10000000DLL;
            while (*(id *)&dword_10150F370[v16 + 2] != v15)
            {
              v16 += 4;
              if (v16 == 56) {
                goto LABEL_18;
              }
            }
            unint64_t v17 = dword_10150F370[v16] | (unint64_t)&_mh_execute_header;
          }
          else
          {
            unint64_t v17 = 0;
          }
LABEL_18:
          (*(void (**)(CarrierSpaceControllerInterface *, uint64_t, unint64_t))(*(void *)ptr + 104))(ptr, 1, v17);
          v7[2](v7, 0);
LABEL_19:
          sub_10004D2C8(v9);
          goto LABEL_20;
        }
      }
    }
    else
    {
      id v9 = 0;
    }
    uint64_t v19 = +[CTCarrierSpaceError errorForCode:4];
    ((void (**)(id, void *))v7)[2](v7, v19);

    if (!v9) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  CFStringRef v18 = +[CTCarrierSpaceError errorForCode:12];
  ((void (**)(id, void *))v7)[2](v7, v18);

LABEL_20:
}

- (void)userDidAcceptPlanTerms:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v12 = (void (**)(id, void *))a4;
  if (![(CTCarrierSpaceClientProxy *)self _isEntitledForControl])
  {
    uint64_t v10 = +[CTCarrierSpaceError errorForCode:12];
    v12[2](v12, v10);

    goto LABEL_13;
  }
  cntrl = self->fWeakController.__cntrl_;
  if (!cntrl)
  {
    v7 = 0;
    goto LABEL_11;
  }
  v7 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
  if (!v7 || (ptr = self->fWeakController.__ptr_) == 0)
  {
LABEL_11:
    v11 = +[CTCarrierSpaceError errorForCode:4];
    v12[2](v12, v11);

    if (!v7) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v4) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 3;
  }
  (*(void (**)(CarrierSpaceControllerInterface *, uint64_t, void))(*(void *)ptr + 104))(ptr, v9, 0);
  v12[2](v12, 0);
LABEL_12:
  sub_10004D2C8(v7);
LABEL_13:
}

- (void)refreshUsageInfo:(id)a3
{
  id v4 = a3;
  cntrl = self->fWeakController.__cntrl_;
  if (cntrl)
  {
    id v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v6 && self->fWeakController.__ptr_)
    {
      uint64_t v9 = 0;
      fObj = self->fQueue.fObj.fObj;
      if (fObj) {
        dispatch_retain(fObj);
      }
      dispatch_object_t object = fObj;
      v11[0] = off_101999850;
      v11[1] = objc_retainBlock(v4);
      v11[3] = v11;
      sub_10007E74C();
    }
  }
  else
  {
    id v6 = 0;
  }
  id v8 = +[CTCarrierSpaceError errorForCode:4];
  (*((void (**)(id, void *))v4 + 2))(v4, v8);

  if (v6) {
    sub_10004D2C8(v6);
  }
}

- (void)refreshPlansInfo:(id)a3
{
  id v4 = a3;
  cntrl = self->fWeakController.__cntrl_;
  if (cntrl)
  {
    id v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v6 && self->fWeakController.__ptr_)
    {
      uint64_t v9 = 0;
      fObj = self->fQueue.fObj.fObj;
      if (fObj) {
        dispatch_retain(fObj);
      }
      dispatch_object_t object = fObj;
      v11[0] = off_1019998D0;
      v11[1] = objc_retainBlock(v4);
      v11[3] = v11;
      sub_10007E74C();
    }
  }
  else
  {
    id v6 = 0;
  }
  id v8 = +[CTCarrierSpaceError errorForCode:4];
  (*((void (**)(id, void *))v4 + 2))(v4, v8);

  if (v6) {
    sub_10004D2C8(v6);
  }
}

- (void)refreshAppsInfo:(id)a3
{
  id v4 = a3;
  cntrl = self->fWeakController.__cntrl_;
  if (cntrl)
  {
    id v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v6 && self->fWeakController.__ptr_)
    {
      uint64_t v9 = 0;
      fObj = self->fQueue.fObj.fObj;
      if (fObj) {
        dispatch_retain(fObj);
      }
      dispatch_object_t object = fObj;
      v11[0] = off_101999950;
      v11[1] = objc_retainBlock(v4);
      v11[3] = v11;
      sub_10007E74C();
    }
  }
  else
  {
    id v6 = 0;
  }
  id v8 = +[CTCarrierSpaceError errorForCode:4];
  (*((void (**)(id, void *))v4 + 2))(v4, v8);

  if (v6) {
    sub_10004D2C8(v6);
  }
}

- (void)getAuthenticationContext:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  cntrl = self->fWeakController.__cntrl_;
  if (cntrl)
  {
    id v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v6 && self->fWeakController.__ptr_)
    {
      v7 = self->fRegistry.__cntrl_;
      *(void *)buf = self->fRegistry.__ptr_;
      *(void *)&buf[8] = v7;
      if (v7) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)v7 + 1, 1uLL, memory_order_relaxed);
      }
      xpc_object_t v30 = 0;
      sub_100BE7E60((Registry **)buf, 1, &v30);
      if (*(void *)&buf[8]) {
        sub_10004D2C8(*(std::__shared_weak_count **)&buf[8]);
      }
      id v8 = objc_alloc_init((Class)CTCarrierSpaceAuthenticationContext);
      xpc_object_t object = 0;
      memset(buf, 0, sizeof(buf));
      uint64_t v32 = 0;
      ctu::cf::assign();
      *(_OWORD *)__p = *(_OWORD *)buf;
      uint64_t v26 = v32;
      uint64_t v9 = *(void ***)buf;
      if (v32 >= 0) {
        uint64_t v9 = __p;
      }
      uint64_t v27 = &v30;
      char v28 = v9;
      sub_100048BAC((uint64_t)&v27, &object);
      if (SHIBYTE(v26) < 0) {
        operator delete(__p[0]);
      }
      if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_null)
      {
        xpc::bridge((uint64_t *)buf, (xpc *)&object, v10);
        [v8 setClientID:*(void *)buf];
        sub_1000577C4((const void **)buf);
      }
      xpc_release(object);
      xpc_object_t object = 0;
      memset(buf, 0, sizeof(buf));
      uint64_t v32 = 0;
      ctu::cf::assign();
      *(_OWORD *)__p = *(_OWORD *)buf;
      uint64_t v26 = v32;
      v11 = *(void ***)buf;
      if (v32 >= 0) {
        v11 = __p;
      }
      uint64_t v27 = &v30;
      char v28 = v11;
      sub_100048BAC((uint64_t)&v27, &object);
      if (SHIBYTE(v26) < 0) {
        operator delete(__p[0]);
      }
      if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_null)
      {
        xpc::bridge((uint64_t *)buf, (xpc *)&object, v12);
        [v8 setAuthURL:*(void *)buf];
        sub_1000577C4((const void **)buf);
      }
      xpc_release(object);
      xpc_object_t object = 0;
      memset(buf, 0, sizeof(buf));
      uint64_t v32 = 0;
      ctu::cf::assign();
      *(_OWORD *)__p = *(_OWORD *)buf;
      uint64_t v26 = v32;
      BOOL v13 = *(void ***)buf;
      if (v32 >= 0) {
        BOOL v13 = __p;
      }
      uint64_t v27 = &v30;
      char v28 = v13;
      sub_100048BAC((uint64_t)&v27, &object);
      if (SHIBYTE(v26) < 0) {
        operator delete(__p[0]);
      }
      if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_null)
      {
        xpc::bridge((uint64_t *)buf, (xpc *)&object, v14);
        [v8 setTokenURL:*(void *)buf];
        sub_1000577C4((const void **)buf);
      }
      xpc_release(object);
      xpc_object_t object = 0;
      memset(buf, 0, sizeof(buf));
      uint64_t v32 = 0;
      ctu::cf::assign();
      *(_OWORD *)__p = *(_OWORD *)buf;
      uint64_t v26 = v32;
      id v15 = *(void ***)buf;
      if (v32 >= 0) {
        id v15 = __p;
      }
      uint64_t v27 = &v30;
      char v28 = v15;
      sub_100048BAC((uint64_t)&v27, &object);
      if (SHIBYTE(v26) < 0) {
        operator delete(__p[0]);
      }
      if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_null)
      {
        xpc::bridge((uint64_t *)buf, (xpc *)&object, v16);
        [v8 setCarrierName:*(void *)buf];
        sub_1000577C4((const void **)buf);
      }
      xpc_release(object);
      xpc_object_t object = 0;
      memset(buf, 0, sizeof(buf));
      uint64_t v32 = 0;
      ctu::cf::assign();
      *(_OWORD *)__p = *(_OWORD *)buf;
      uint64_t v26 = v32;
      unint64_t v17 = *(void ***)buf;
      if (v32 >= 0) {
        unint64_t v17 = __p;
      }
      uint64_t v27 = &v30;
      char v28 = v17;
      sub_100048BAC((uint64_t)&v27, &object);
      if (SHIBYTE(v26) < 0) {
        operator delete(__p[0]);
      }
      if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_null)
      {
        xpc::bridge((uint64_t *)buf, (xpc *)&object, v18);
        [v8 setScope:*(void *)buf];
        sub_1000577C4((const void **)buf);
      }
      xpc_release(object);
      memset(buf, 0, sizeof(buf));
      uint64_t v32 = 0;
      ctu::cf::assign();
      *(_OWORD *)__p = *(_OWORD *)buf;
      uint64_t v26 = v32;
      uint64_t v19 = __p;
      if (v32 < 0) {
        uint64_t v19 = *(void ***)buf;
      }
      uint64_t v27 = &v30;
      char v28 = v19;
      sub_100048BAC((uint64_t)&v27, &object);
      objc_msgSend(v8, "setSupportsState:", xpc::dyn_cast_or_default((xpc *)&object, 0, v20));
      xpc_release(object);
      xpc_object_t object = 0;
      if (SHIBYTE(v26) < 0) {
        operator delete(__p[0]);
      }
      xpc_release(v30);
      id v21 = **(NSObject ***)&self->fProcessName.__r_.var0;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = [v8 description];
        id v23 = [v22 UTF8String];
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = v23;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#I Reply for getAuthenticationContext: %s", buf, 0xCu);
      }
      v4[2](v4, v8, 0);

      goto LABEL_47;
    }
  }
  else
  {
    id v6 = 0;
  }
  long long v24 = +[CTCarrierSpaceError errorForCode:4];
  ((void (**)(id, id, void *))v4)[2](v4, 0, v24);

  if (v6) {
LABEL_47:
  }
    sub_10004D2C8(v6);
}

- (void)sendIfRespondsTo:(SEL)a3 handler:(id)a4
{
  id v6 = a4;
  v7 = [(CTCarrierSpaceClientProxy *)self connection];
  id v8 = [v7 remoteObjectProxy];

  if (v8)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10007AF64;
    v9[3] = &unk_101999260;
    SEL v12 = a3;
    id v11 = v6;
    id v10 = v8;
    [v10 remoteObjectRespondsToSelector:a3 handler:v9];
  }
}

- (void)notifyCapabilitiesChanged:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007B09C;
  v5[3] = &unk_101999288;
  id v6 = a3;
  id v4 = v6;
  [(CTCarrierSpaceClientProxy *)self sendIfRespondsTo:"capabilitiesDidChange:" handler:v5];
}

- (void)notifyUserConsentFlowInfoChanged
{
}

- (void)notifyUsageChanged
{
}

- (void)notifyPlansChanged
{
}

- (void)notifyAppsChanged
{
}

- (void)notifyDataPlanMetricsChanged
{
}

- (void)notifyPlanPurchaseStatusChanged:(id)a3 status:(unsigned __int8)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007B1FC;
  v7[3] = &unk_101999370;
  id v8 = a3;
  unsigned __int8 v9 = a4;
  id v6 = v8;
  [(CTCarrierSpaceClientProxy *)self sendIfRespondsTo:"purchasedPlan:didChangeStatus:context:" handler:v7];
}

- (shared_ptr<carrier_space::EntitlementValidator>)entitlementValidator
{
  delegate = self->_delegate;
  *v2 = self->_connection;
  v2[1] = (NSXPCConnection *)delegate;
  if (delegate) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)delegate + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (EntitlementValidator *)self;
  return result;
}

- (void)setEntitlementValidator:(shared_ptr<carrier_space::EntitlementValidator>)a3
{
  id v4 = *(NSXPCConnection **)a3.__ptr_;
  char v3 = (atomic_ullong *)*((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit(v3 + 1, 1uLL, memory_order_relaxed);
  }
  delegate = self->_delegate;
  self->_connection = v4;
  self->_delegate = (CTCarrierSpaceClientProxyDelegate *)v3;
  if (delegate) {
    sub_10004D2C8((std::__shared_weak_count *)delegate);
  }
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)self->logger;
}

- (void)setConnection:(id)a3
{
  self->logger = a3;
}

- (CTCarrierSpaceClientProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->fIsInAuthFlow);

  return (CTCarrierSpaceClientProxyDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  delegate = self->_delegate;
  if (delegate) {
    sub_10004D2C8((std::__shared_weak_count *)delegate);
  }
  objc_destroyWeak((id *)&self->fIsInAuthFlow);
  if (*((char *)&self->fProcessName.__r_.__value_.var0.var1 + 23) < 0) {
    operator delete(self->fProcessName.__r_.__value_.var0.var1.__data_);
  }
  fObj = self->fQueue.fObj.fObj;
  if (fObj) {
    dispatch_release(fObj);
  }
  cntrl = self->fWeakController.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  id v6 = self->fRegistry.__cntrl_;
  if (v6)
  {
    sub_10004D2C8((std::__shared_weak_count *)v6);
  }
}

- (id).cxx_construct
{
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  return self;
}

@end