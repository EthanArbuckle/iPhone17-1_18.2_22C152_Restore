@interface NanoRegistryObserver
- (NanoRegistryObserver)initWithQueue:(queue)a3 delegate:(weak_ptr<NanoRegistryObserverDelegate>)a4;
- (id).cxx_construct;
- (void)dealloc;
- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5;
- (void)didDeviceUnpair:(id)a3;
- (void)didDeviceUnpair_sync:(id)a3;
- (void)didEnterCompatibilityState:(id)a3;
- (void)didEnterCompatibilityState_sync:(id)a3;
- (void)notifyDevicesUpdated:(id)a3;
- (void)sendInitialUpdate:(id)a3;
- (void)startObserving_sync;
- (void)stopObserving_sync;
@end

@implementation NanoRegistryObserver

- (NanoRegistryObserver)initWithQueue:(queue)a3 delegate:(weak_ptr<NanoRegistryObserverDelegate>)a4
{
  ptr = a4.__ptr_;
  v15.receiver = self;
  v15.super_class = (Class)NanoRegistryObserver;
  v6 = [(NanoRegistryObserver *)&v15 init];
  if (v6)
  {
    v7 = *(NSObject **)a3.fObj.fObj;
    if (v7) {
      dispatch_retain(v7);
    }
    fObj = v6->_queue.fObj.fObj;
    v6->_queue.fObj.fObj = (dispatch_object_s *)v7;
    if (fObj) {
      dispatch_release(fObj);
    }
    v10 = *(NanoRegistryObserverDelegate **)ptr;
    uint64_t v9 = *((void *)ptr + 1);
    if (v9) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 16), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v6->_delegate.__cntrl_;
    v6->_delegate.__ptr_ = v10;
    v6->_delegate.__cntrl_ = (__shared_weak_count *)v9;
    if (cntrl) {
      std::__shared_weak_count::__release_weak(cntrl);
    }
    v16[0] = NRDevicePropertyPairingID;
    v16[1] = NRDevicePropertyIsActive;
    v16[2] = NRDevicePropertyCSN;
    v16[3] = NRDevicePropertyName;
    uint64_t v12 = +[NSArray arrayWithObjects:v16 count:4];
    interestingDeviceProperties = v6->_interestingDeviceProperties;
    v6->_interestingDeviceProperties = (NSArray *)v12;
  }
  return v6;
}

- (void)dealloc
{
  [(NanoRegistryObserver *)self stopObserving_sync];
  v3.receiver = self;
  v3.super_class = (Class)NanoRegistryObserver;
  [(NanoRegistryObserver *)&v3 dealloc];
}

- (void)startObserving_sync
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"didEnterCompatibilityState:" name:NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"didDeviceUnpair:" name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"didDeviceUnpair:" name:NRPairedDeviceRegistryDeviceDidFailToPairNotification object:0];

  v6 = +[NRPairedDeviceRegistry sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100BE42A4;
  v7[3] = &unk_101A46440;
  v7[4] = self;
  [v6 getDevicesWithBlock:v7];
}

- (void)stopObserving_sync
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (void)didEnterCompatibilityState:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100BE4450;
  v5[3] = &unk_101A04440;
  v6 = self;
  id v7 = a3;
  fObj = v6->_queue.fObj.fObj;
  id v4 = v7;
  dispatch_async(fObj, v5);
}

- (void)didEnterCompatibilityState_sync:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:NRPairedDeviceRegistryDevice];
  v6 = [v4 objectForKey:NRPairedDeviceRegistryCompatibilityStateKey];
  unsigned int v7 = [v6 intValue];

  if (v7 - 4 >= 2)
  {
    if (v7 != 3) {
      goto LABEL_9;
    }
    [v5 addPropertyObserver:self forPropertyChanges:self->_interestingDeviceProperties];
    cntrl = self->_delegate.__cntrl_;
    if (cntrl)
    {
      v10 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
      if (v10)
      {
        v11 = v10;
        ptr = self->_delegate.__ptr_;
        if (ptr) {
          (*(void (**)(NanoRegistryObserverDelegate *))(*(void *)ptr + 32))(ptr);
        }
        sub_10004D2C8(v11);
      }
    }
  }
  v13 = v5;
  v8 = +[NSArray arrayWithObjects:&v13 count:1];
  [(NanoRegistryObserver *)self notifyDevicesUpdated:v8];

LABEL_9:
}

- (void)didDeviceUnpair:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100BE46F4;
  v5[3] = &unk_101A04440;
  v6 = self;
  id v7 = a3;
  fObj = v6->_queue.fObj.fObj;
  id v4 = v7;
  dispatch_async(fObj, v5);
}

- (void)didDeviceUnpair_sync:(id)a3
{
  id v4 = a3;
  cntrl = self->_delegate.__cntrl_;
  if (cntrl)
  {
    v6 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v6)
    {
      id v7 = v6;
      ptr = self->_delegate.__ptr_;
      if (ptr)
      {
        uint64_t v9 = [v4 objectForKey:NRPairedDeviceRegistryDevice];
        v10 = [v9 valueForProperty:NRDevicePropertyPairingID];
        v11 = v10;
        if (v10)
        {
          id v12 = [v10 UUIDString];
          sub_100058DB0(__p, (char *)[v12 UTF8String]);
          (*(void (**)(NanoRegistryObserverDelegate *, void **))(*(void *)ptr + 16))(ptr, __p);
          if (v14 < 0) {
            operator delete(__p[0]);
          }
        }
        else
        {
          sub_100058DB0(__p, "");
          (*(void (**)(NanoRegistryObserverDelegate *, void **))(*(void *)ptr + 16))(ptr, __p);
          if (v14 < 0) {
            operator delete(__p[0]);
          }
        }
      }
      sub_10004D2C8(v7);
    }
  }
}

- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100BE49C0;
  v8[3] = &unk_101A04440;
  id v9 = a3;
  v10 = self;
  fObj = self->_queue.fObj.fObj;
  id v7 = v9;
  dispatch_async(fObj, v8);
}

- (void)sendInitialUpdate:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "addPropertyObserver:forPropertyChanges:", self, self->_interestingDeviceProperties, (void)v8);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NanoRegistryObserver *)self notifyDevicesUpdated:v4];
}

- (void)notifyDevicesUpdated:(id)a3
{
  v60 = 0;
  v61 = 0;
  unint64_t v62 = 0;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = a3;
  id v3 = [obj countByEnumeratingWithState:&v56 objects:v72 count:16];
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v52 = NRDevicePropertyPairingID;
    uint64_t v51 = NRDevicePropertyName;
    uint64_t v50 = NRDevicePropertyCellularEnabled;
    uint64_t v46 = NRDevicePropertyCSN;
    uint64_t v45 = NRDevicePropertyIMEI;
    uint64_t v44 = NRDevicePropertyMEID;
    uint64_t v49 = NRDevicePropertySystemVersion;
    uint64_t v48 = NRDevicePropertyProductType;
    uint64_t v47 = NRDevicePropertyIsActive;
    uint64_t v43 = NRDevicePropertyIsAltAccount;
    uint64_t v53 = *(void *)v57;
    for (uint64_t i = *(void *)v57; ; uint64_t i = *(void *)v57)
    {
      if (i != v53) {
        objc_enumerationMutation(obj);
      }
      uint64_t v6 = *(void **)(*((void *)&v56 + 1) + 8 * v4);
      id v7 = [v6 valueForProperty:v52];
      if (v7) {
        break;
      }
LABEL_56:

      if (++v4 >= (unint64_t)v3)
      {
        id v3 = [obj countByEnumeratingWithState:&v56 objects:v72 count:16];
        if (!v3) {
          goto LABEL_60;
        }
        uint64_t v4 = 0;
      }
    }
    long long v8 = v61;
    if ((unint64_t)v61 >= v62)
    {
      unint64_t v10 = 0xD37A6F4DE9BD37A7 * ((v61 - v60) >> 3);
      unint64_t v11 = v10 + 1;
      if (v10 + 1 > 0x1642C8590B21642) {
        sub_10006A748();
      }
      if (0xA6F4DE9BD37A6F4ELL * ((uint64_t)(v62 - (void)v60) >> 3) > v11) {
        unint64_t v11 = 0xA6F4DE9BD37A6F4ELL * ((uint64_t)(v62 - (void)v60) >> 3);
      }
      if (0xD37A6F4DE9BD37A7 * ((uint64_t)(v62 - (void)v60) >> 3) >= 0xB21642C8590B21) {
        unint64_t v12 = 0x1642C8590B21642;
      }
      else {
        unint64_t v12 = v11;
      }
      v67 = &v62;
      if (v12) {
        v13 = (char *)sub_100150DA4((uint64_t)&v62, v12);
      }
      else {
        v13 = 0;
      }
      char v14 = &v13[184 * v10];
      __p = v13;
      v64 = v14;
      v66 = &v13[184 * v12];
      *(_OWORD *)char v14 = 0u;
      *((_OWORD *)v14 + 1) = 0u;
      *((_OWORD *)v14 + 2) = 0u;
      *((_OWORD *)v14 + 3) = 0u;
      *((_OWORD *)v14 + 4) = 0u;
      *((_OWORD *)v14 + 5) = 0u;
      *((_OWORD *)v14 + 6) = 0u;
      *((_OWORD *)v14 + 7) = 0u;
      *((_OWORD *)v14 + 8) = 0u;
      *((_OWORD *)v14 + 9) = 0u;
      *((_OWORD *)v14 + 10) = 0u;
      *((void *)v14 + 22) = 0;
      v65 = v14 + 184;
      sub_100150D2C((uint64_t *)&v60, &__p);
      long long v9 = v61;
      sub_100150EDC((uint64_t)&__p);
    }
    else
    {
      *((void *)v61 + 22) = 0;
      v8[9] = 0u;
      v8[10] = 0u;
      v8[7] = 0u;
      v8[8] = 0u;
      v8[5] = 0u;
      v8[6] = 0u;
      v8[3] = 0u;
      void v8[4] = 0u;
      v8[1] = 0u;
      v8[2] = 0u;
      long long v9 = (char *)v8 + 184;
      _OWORD *v8 = 0u;
    }
    v61 = v9;
    id v15 = [v7 UUIDString];
    v16 = v9 - 176;
    sub_10003ED78((std::string *)(v9 - 176), (char *)[v15 UTF8String]);

    v17 = [v6 valueForProperty:v51];
    v18 = v17;
    if (v17) {
      sub_10003ED78((std::string *)(v9 - 80), (char *)[v17 UTF8String]);
    }
    v19 = [v6 valueForProperty:v50];
    *(v9 - 8) = [v19 BOOLValue];

    if (*(v9 - 8))
    {
      v20 = [v6 valueForProperty:v46];

      if (v20) {
        sub_10003ED78((std::string *)(v9 - 152), (char *)[v20 UTF8String]);
      }
      v21 = [v6 valueForProperty:v45];

      if (v21) {
        sub_10003ED78((std::string *)(v9 - 128), (char *)[v21 UTF8String]);
      }
      v22 = [v6 valueForProperty:v44];

      if (v22)
      {
        id v23 = v22;
        sub_10003ED78((std::string *)(v9 - 104), (char *)[v23 UTF8String]);
      }
      else
      {
        id v23 = 0;
      }
    }
    else
    {
      id v23 = v18;
    }
    v24 = [v6 valueForProperty:v49];

    if (v24) {
      sub_10003ED78((std::string *)(v9 - 56), (char *)[v24 UTF8String]);
    }
    v25 = [v6 valueForProperty:v48];

    if (v25) {
      sub_10003ED78((std::string *)(v9 - 32), (char *)[v25 UTF8String]);
    }
    v26 = +[NRPairedDeviceRegistry sharedInstance];
    unsigned int v27 = [v26 compatibilityState];

    v28 = [v6 valueForProperty:v47];
    unsigned int v29 = [v28 BOOLValue];

    if (v29)
    {
      if ((v27 & 0xFFFE) == 4)
      {
        char v30 = 2;
LABEL_38:
        *(v9 - 7) = v30;
        goto LABEL_40;
      }
      if (v27 == 3)
      {
        char v30 = 1;
        goto LABEL_38;
      }
    }
    *(v9 - 7) = 0;
LABEL_40:
    if (*(v9 - 57) < 0)
    {
      uint64_t v31 = *((void *)v9 - 9);
      if (!v31)
      {
LABEL_47:
        *(v9 - 184) = v31;
        sub_100BE3EF4();
        v34 = qword_101B10248;
        if (os_log_type_enabled((os_log_t)qword_101B10248, OS_LOG_TYPE_DEFAULT))
        {
          if (*(v9 - 153) < 0) {
            v16 = *(char **)v16;
          }
          sub_1008EA2D8((unsigned __int8 *)v9 - 184, &object);
          v35 = xpc_copy_description(object);
          __p = 0;
          v64 = 0;
          v65 = 0;
          sub_100058DB0(&__p, v35);
          free(v35);
          p_p = &__p;
          if (SHIBYTE(v65) < 0) {
            p_p = __p;
          }
          *(_DWORD *)buf = 136315394;
          v69 = v16;
          __int16 v70 = 2080;
          v71 = p_p;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "#I Updated device id: %s, %s", buf, 0x16u);
          if (SHIBYTE(v65) < 0) {
            operator delete(__p);
          }
          xpc_release(object);
        }

        goto LABEL_56;
      }
    }
    else
    {
      LOBYTE(v31) = *(v9 - 57);
      if (!(_BYTE)v31) {
        goto LABEL_47;
      }
    }
    v32 = [v6 valueForProperty:v43];
    unsigned int v33 = [v32 BOOLValue];

    if (v33) {
      LOBYTE(v31) = 2;
    }
    else {
      LOBYTE(v31) = 1;
    }
    goto LABEL_47;
  }
LABEL_60:

  if (v60 == v61)
  {
    sub_100BE3EF4();
    v41 = qword_101B10248;
    if (os_log_type_enabled((os_log_t)qword_101B10248, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(__p) = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "#I Device list is empty", (uint8_t *)&__p, 2u);
    }
  }
  else
  {
    cntrl = self->_delegate.__cntrl_;
    if (cntrl)
    {
      v38 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
      if (v38)
      {
        v39 = v38;
        ptr = self->_delegate.__ptr_;
        if (ptr) {
          (*(void (**)(NanoRegistryObserverDelegate *, char **))(*(void *)ptr + 24))(ptr, &v60);
        }
        sub_10004D2C8(v39);
      }
    }
  }
  __p = &v60;
  sub_100150960((void ***)&__p);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestingDeviceProperties, 0);
  cntrl = self->_delegate.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  fObj = self->_queue.fObj.fObj;
  if (fObj)
  {
    dispatch_release(fObj);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end