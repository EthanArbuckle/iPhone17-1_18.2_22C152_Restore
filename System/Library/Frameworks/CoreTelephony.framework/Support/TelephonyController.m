@interface TelephonyController
- (TelephonyController)initWithRegistry:(const void *)a3;
- (id).cxx_construct;
- (void)callObserver:(id)a3 callChanged:(id)a4;
- (void)handleUnexpectedAnswer:(const dict *)a3;
- (void)handleUnexpectedHold:(const dict *)a3;
- (void)handleUnexpectedMODial:(const dict *)a3 responder:(void *)a4;
- (void)initialize;
- (void)registerForRestProperties_sync;
@end

@implementation TelephonyController

- (TelephonyController)initWithRegistry:(const void *)a3
{
  v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v6 = dispatch_queue_create("TelephonyController", v5);
  v13.receiver = self;
  v13.super_class = (Class)TelephonyController;
  v7 = [(TelephonyController *)&v13 initWithQueue:v6];
  if (v7)
  {
    if (v6) {
      dispatch_retain(v6);
    }
    fObj = v7->fQueue.fObj.fObj;
    v7->fQueue.fObj.fObj = (dispatch_object_s *)v6;
    if (fObj) {
      dispatch_release(fObj);
    }
    v10 = *(Registry **)a3;
    uint64_t v9 = *((void *)a3 + 1);
    if (v9) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v7->fRegistry.__cntrl_;
    v7->fRegistry.__ptr_ = v10;
    v7->fRegistry.__cntrl_ = (__shared_weak_count *)v9;
    if (cntrl) {
      sub_10004D2C8(cntrl);
    }
    operator new();
  }
  if (v6) {
    dispatch_release(v6);
  }
  return 0;
}

- (void)initialize
{
  fObj = self->fQueue.fObj.fObj;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F0074;
  block[3] = &unk_101999238;
  block[4] = self;
  dispatch_async(fObj, block);
}

- (void)registerForRestProperties_sync
{
  v2 = self;
  sub_100058DB0(__p, "/cc/requests/unexpected_mo_dial");
  v3 = v2;
  v10 = off_1019AAD10;
  v11 = v3;
  v12 = &v10;
  ctu::RestModule::registerAsRequestSink();
  sub_1001F23E0(&v10);
  if (v9 < 0) {
    operator delete(__p[0]);
  }

  v4 = v3;
  sub_100058DB0(__p, "/cc/events/unexpected_answer");
  v5 = v4;
  v10 = off_1019AADA0;
  v11 = v5;
  v12 = &v10;
  ctu::RestModule::observeEvent();
  sub_10003F600(&v10);
  if (v9 < 0) {
    operator delete(__p[0]);
  }

  v6 = v5;
  sub_100058DB0(__p, "/cc/events/unexpected_hold");
  v7 = v6;
  v10 = off_1019AAE20;
  v11 = v7;
  v12 = &v10;
  ctu::RestModule::observeEvent();
  sub_10003F600(&v10);
  if (v9 < 0) {
    operator delete(__p[0]);
  }

  sub_1001F0320((uint64_t)&v7->fCurrentCalls.fValue.__end_);
}

- (void)handleUnexpectedMODial:(const dict *)a3 responder:(void *)a4
{
  v48[0] = 0;
  v48[1] = 0;
  uint64_t v49 = 0;
  xpc_object_t v45 = (xpc_object_t)a3;
  v46 = "kUuid";
  sub_100048BAC((uint64_t)&v45, object);
  memset(buf, 0, sizeof(buf));
  xpc::dyn_cast_or_default();
  if ((char)buf[23] < 0) {
    operator delete(*(void **)buf);
  }
  xpc_release(object[0]);
  *(void *)buf = a3;
  *(void *)&buf[8] = "kCallStatus";
  sub_100048BAC((uint64_t)buf, &v45);
  unsigned int v8 = xpc::dyn_cast_or_default((xpc *)&v45, 0, v7);
  xpc_release(v45);
  *(void *)buf = a3;
  *(void *)&buf[8] = "kCallDirectionMobileOriginated";
  sub_100048BAC((uint64_t)buf, &v45);
  char v10 = xpc::dyn_cast_or_default((xpc *)&v45, 0, v9);
  xpc_release(v45);
  if ((v10 & 1) == 0)
  {
    v27 = *(NSObject **)self->logger.__ptr_.__value_;
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    v28 = v48;
    if (v49 < 0) {
      v28 = (void **)v48[0];
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v28;
    v29 = "Got unexpected MO dial event for a call, %s, that's not mobile originated. Returning.";
    v30 = v27;
    uint32_t v31 = 12;
    goto LABEL_26;
  }
  if (v8 > 7 || ((1 << v8) & 0x9C) == 0)
  {
    v32 = *(NSObject **)self->logger.__ptr_.__value_;
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    int v33 = SHIBYTE(v49);
    v34 = (void **)v48[0];
    uint64_t v35 = asString();
    v36 = v48;
    if (v33 < 0) {
      v36 = v34;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = v36;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v35;
    v29 = "Got unexpected MO dial event for a call, %s, that's not in dialing/alerting state (Call State: %s). Returning.";
    v30 = v32;
    uint32_t v31 = 22;
LABEL_26:
    _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);
    goto LABEL_37;
  }
  v11 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v48;
    if (v49 < 0) {
      v12 = (void **)v48[0];
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#N Got Unexpected MO Dial for %s! Sending CXStartCallAction.", buf, 0xCu);
  }
  if (v49 >= 0) {
    objc_super v13 = v48;
  }
  else {
    objc_super v13 = (void **)v48[0];
  }
  uint64_t v37 = +[NSString stringWithUTF8String:v13];
  id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:v37];
  xpc_object_t v45 = 0;
  v46 = 0;
  uint64_t v47 = 0;
  object[0] = (xpc_object_t)a3;
  object[1] = "kPhoneNumber";
  sub_100048BAC((uint64_t)object, &v44);
  memset(buf, 0, sizeof(buf));
  xpc::dyn_cast_or_default();
  if ((char)buf[23] < 0) {
    operator delete(*(void **)buf);
  }
  xpc_release(v44);
  if (v47 >= 0) {
    v15 = &v45;
  }
  else {
    v15 = v45;
  }
  v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v15, v37);
  *(void *)buf = a3;
  *(void *)&buf[8] = "kCallType";
  sub_100048BAC((uint64_t)buf, object);
  int v18 = xpc::dyn_cast_or_default((xpc *)object, (const object *)1, v17);
  xpc_release(object[0]);
  *(void *)buf = a3;
  *(void *)&buf[8] = "kIsTTY";
  sub_100048BAC((uint64_t)buf, object);
  uint64_t v20 = xpc::dyn_cast_or_default((xpc *)object, 0, v19);
  xpc_release(object[0]);
  *(void *)buf = a3;
  *(void *)&buf[8] = "kCallSourceMode";
  sub_100048BAC((uint64_t)buf, object);
  int v22 = xpc::dyn_cast_or_default((xpc *)object, 0, v21);
  xpc_release(object[0]);
  v23 = objc_opt_new();
  id v24 = objc_alloc((Class)CXStartCallAction);
  id v25 = [objc_alloc((Class)CXHandle) initWithType:2 value:v16];
  id v26 = [v24 initWithCallUUID:v14 handle:v25];

  [v26 setVoicemail:0];
  [v26 setEmergency:(v18 & 0xFFFFFFFE) == 2];
  [v26 setRelay:v22 != 0];
  objc_msgSend(v26, "setTTYType:", +[TelephonyProviderDelegate toCXTTYType:](TelephonyProviderDelegate, "toCXTTYType:", v20));
  [v23 addAction:v26];
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  sub_1001F0B48((uint64_t)a4, buf);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3321888768;
  v39[2] = sub_1001F0BD0;
  v39[3] = &unk_1019AAC48;
  v39[5] = *(void *)buf;
  v40 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8]) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 1uLL, memory_order_relaxed);
  }
  v39[4] = self;
  if (SHIBYTE(v49) < 0)
  {
    sub_10004FC84(&__p, v48[0], (unint64_t)v48[1]);
  }
  else
  {
    long long __p = *(_OWORD *)v48;
    uint64_t v42 = v49;
  }
  [(TelephonyController *)self requestTransaction:v23 completion:v39];
  if (SHIBYTE(v42) < 0) {
    operator delete((void *)__p);
  }
  if (v40) {
    sub_10004D2C8(v40);
  }
  if (*(void *)&buf[8]) {
    sub_10004D2C8(*(std::__shared_weak_count **)&buf[8]);
  }

  if (SHIBYTE(v47) < 0) {
    operator delete(v45);
  }

LABEL_37:
  if (SHIBYTE(v49) < 0) {
    operator delete(v48[0]);
  }
}

- (void)handleUnexpectedAnswer:(const dict *)a3
{
  v30[0] = 0;
  v30[1] = 0;
  uint64_t v31 = 0;
  v28[0] = (xpc_object_t)a3;
  v28[1] = "kUuid";
  sub_100048BAC((uint64_t)v28, &object);
  memset(buf, 0, sizeof(buf));
  xpc::dyn_cast_or_default();
  if ((char)buf[23] < 0) {
    operator delete(*(void **)buf);
  }
  xpc_release(object);
  *(void *)buf = a3;
  *(void *)&buf[8] = "kCallStatus";
  sub_100048BAC((uint64_t)buf, v28);
  int v6 = xpc::dyn_cast_or_default((xpc *)v28, 0, v5);
  xpc_release(v28[0]);
  *(void *)buf = a3;
  *(void *)&buf[8] = "kCallDirectionMobileOriginated";
  sub_100048BAC((uint64_t)buf, v28);
  int v8 = xpc::dyn_cast_or_default((xpc *)v28, 0, v7);
  xpc_release(v28[0]);
  if (v8)
  {
    BOOL v9 = *(NSObject **)self->logger.__ptr_.__value_;
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    char v10 = v30;
    if (v31 < 0) {
      char v10 = (void **)v30[0];
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v10;
    v11 = "Got unexpected answer event for a call, %s, that's not mobile terminated. Returning.";
    v12 = v9;
    uint32_t v13 = 12;
LABEL_13:
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    goto LABEL_27;
  }
  id v14 = *(NSObject **)self->logger.__ptr_.__value_;
  if (v6)
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    int v15 = SHIBYTE(v31);
    v16 = (void **)v30[0];
    uint64_t v17 = asString();
    int v18 = v30;
    if (v15 < 0) {
      int v18 = v16;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = v18;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v17;
    v11 = "Got unexpected answer event for a call, %s, that's not in active state (Call State: %s). Returning.";
    v12 = v14;
    uint32_t v13 = 22;
    goto LABEL_13;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = v30;
    if (v31 < 0) {
      uint64_t v19 = (void **)v30[0];
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v19;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#N Got Unexpected Answer for %s! Sending CXAnswerCallAction.", buf, 0xCu);
  }
  if (v31 >= 0) {
    uint64_t v20 = v30;
  }
  else {
    uint64_t v20 = (void **)v30[0];
  }
  uint64_t v21 = +[NSString stringWithUTF8String:v20];
  id v22 = [objc_alloc((Class)NSUUID) initWithUUIDString:v21];
  v23 = objc_opt_new();
  id v24 = [objc_alloc((Class)CXAnswerCallAction) initWithCallUUID:v22];
  [v23 addAction:v24];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3321888768;
  v25[2] = sub_1001F11F8;
  v25[3] = &unk_1019AAC80;
  v25[4] = self;
  if (SHIBYTE(v31) < 0)
  {
    sub_10004FC84(&__p, v30[0], (unint64_t)v30[1]);
  }
  else
  {
    long long __p = *(_OWORD *)v30;
    uint64_t v27 = v31;
  }
  [(TelephonyController *)self requestTransaction:v23 completion:v25];
  if (SHIBYTE(v27) < 0) {
    operator delete((void *)__p);
  }

LABEL_27:
  if (SHIBYTE(v31) < 0) {
    operator delete(v30[0]);
  }
}

- (void)handleUnexpectedHold:(const dict *)a3
{
  v29[0] = 0;
  v29[1] = 0;
  uint64_t v30 = 0;
  v27[0] = (xpc_object_t)a3;
  v27[1] = "kUuid";
  sub_100048BAC((uint64_t)v27, &object);
  memset(buf, 0, sizeof(buf));
  xpc::dyn_cast_or_default();
  if ((char)buf[23] < 0) {
    operator delete(*(void **)buf);
  }
  xpc_release(object);
  *(void *)buf = a3;
  *(void *)&buf[8] = "kCallStatus";
  sub_100048BAC((uint64_t)buf, v27);
  int v6 = xpc::dyn_cast_or_default((xpc *)v27, 0, v5);
  xpc_release(v27[0]);
  *(void *)buf = a3;
  *(void *)&buf[8] = "kPreviousCallStatus";
  sub_100048BAC((uint64_t)buf, v27);
  int v8 = xpc::dyn_cast_or_default((xpc *)v27, 0, v7);
  xpc_release(v27[0]);
  if (v6) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v8 == 1;
  }
  int v10 = v9;
  BOOL v12 = v6 == 1 && v8 == 0;
  value = (os_log_t *)self->logger.__ptr_.__value_;
  id v14 = *value;
  if ((v10 & 1) != 0 || v12)
  {
    if (os_log_type_enabled(*value, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = v29;
      if (v30 < 0) {
        int v18 = (void **)v29[0];
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v18;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#N Got Unexpected Hold for %s! Sending CXSetHeldCallAction.", buf, 0xCu);
    }
    if (v30 >= 0) {
      uint64_t v19 = v29;
    }
    else {
      uint64_t v19 = (void **)v29[0];
    }
    uint64_t v20 = +[NSString stringWithUTF8String:v19];
    id v21 = [objc_alloc((Class)NSUUID) initWithUUIDString:v20];
    id v22 = objc_opt_new();
    id v23 = [objc_alloc((Class)CXSetHeldCallAction) initWithCallUUID:v21 onHold:v10 ^ 1u];
    [v22 addAction:v23];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3321888768;
    v24[2] = sub_1001F170C;
    v24[3] = &unk_1019AAC80;
    v24[4] = self;
    if (SHIBYTE(v30) < 0)
    {
      sub_10004FC84(&__p, v29[0], (unint64_t)v29[1]);
    }
    else
    {
      long long __p = *(_OWORD *)v29;
      uint64_t v26 = v30;
    }
    [(TelephonyController *)self requestTransaction:v22 completion:v24];
    if (SHIBYTE(v26) < 0) {
      operator delete((void *)__p);
    }
  }
  else if (os_log_type_enabled(*value, OS_LOG_TYPE_ERROR))
  {
    if (v30 >= 0) {
      int v15 = v29;
    }
    else {
      int v15 = (void **)v29[0];
    }
    uint64_t v16 = asString();
    uint64_t v17 = asString();
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2080;
    uint64_t v32 = v17;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Got unexpected hold event for a call, %s, that's not in the right state (Call State: %s, Previous Call State: %s). Returning.", buf, 0x20u);
  }
  if (SHIBYTE(v30) < 0) {
    operator delete(v29[0]);
  }
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (v8)
  {
    v49[0] = 0;
    v49[1] = 0;
    uint64_t v50 = 0;
    BOOL v9 = [v7 UUID];
    sub_100848F68(v9, v49);

    int v10 = *(NSObject **)self->logger.__ptr_.__value_;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (v50 >= 0) {
        v11 = v49;
      }
      else {
        v11 = (void **)v49[0];
      }
      unsigned int v12 = [v7 hasConnected];
      unsigned int v13 = [v7 hasEnded];
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v12;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I Call %s changed! active: %d, ended: %d", buf, 0x18u);
    }
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    v46 = 0;
    sub_1001F1EB0(&v46, (void **)self->fCurrentCalls.fValue.__end_, (void **)self->fCurrentCalls.fValue.__end_cap_.__value_, (self->fCurrentCalls.fValue.__end_cap_.__value_ - self->fCurrentCalls.fValue.__end_) >> 3);
    id v14 = v46;
    int v15 = v47;
    if (SHIBYTE(v50) < 0)
    {
      sub_10004FC84(__s1, v49[0], (unint64_t)v49[1]);
    }
    else
    {
      *(_OWORD *)__s1 = *(_OWORD *)v49;
      uint64_t v45 = v50;
    }
    if (v14 != v15)
    {
      while (1)
      {
        uint64_t v17 = *v14;
        xpc_object_t v56 = v17;
        if (v17) {
          xpc_retain(v17);
        }
        else {
          xpc_object_t v56 = xpc_null_create();
        }
        long long __p = 0;
        v54 = 0;
        uint64_t v55 = 0;
        v51[0] = &v56;
        v51[1] = "kUuid";
        sub_100048BAC((uint64_t)v51, &object);
        memset(buf, 0, sizeof(buf));
        xpc::dyn_cast_or_default();
        if ((char)buf[23] < 0) {
          operator delete(*(void **)buf);
        }
        xpc_release(object);
        if (v45 >= 0) {
          int v18 = (void *)HIBYTE(v45);
        }
        else {
          int v18 = __s1[1];
        }
        uint64_t v19 = (void *)HIBYTE(v55);
        int v20 = SHIBYTE(v55);
        if (v55 < 0) {
          uint64_t v19 = v54;
        }
        if (v18 == v19) {
          break;
        }
        BOOL v30 = 0;
        if (SHIBYTE(v55) < 0) {
          goto LABEL_40;
        }
LABEL_36:
        xpc_release(v56);
        if (v30) {
          goto LABEL_45;
        }
        if (++v14 == v15)
        {
          id v14 = v15;
          goto LABEL_45;
        }
      }
      if (v55 >= 0) {
        p_p = (unsigned __int8 *)&__p;
      }
      else {
        p_p = (unsigned __int8 *)__p;
      }
      if (v45 < 0)
      {
        BOOL v30 = memcmp(__s1[0], p_p, (size_t)__s1[1]) == 0;
        if ((v20 & 0x80000000) == 0) {
          goto LABEL_36;
        }
      }
      else if (HIBYTE(v45))
      {
        uint64_t v22 = HIBYTE(v45) - 1;
        id v23 = __s1;
        do
        {
          int v25 = *(unsigned __int8 *)v23;
          id v23 = (void **)((char *)v23 + 1);
          int v24 = v25;
          int v27 = *p_p++;
          int v26 = v27;
          BOOL v29 = v22-- != 0;
          BOOL v30 = v24 == v26;
        }
        while (v24 == v26 && v29);
        if ((SHIBYTE(v55) & 0x80000000) == 0) {
          goto LABEL_36;
        }
      }
      else
      {
        BOOL v30 = 1;
        if ((SHIBYTE(v55) & 0x80000000) == 0) {
          goto LABEL_36;
        }
      }
LABEL_40:
      operator delete(__p);
      goto LABEL_36;
    }
LABEL_45:
    if (SHIBYTE(v45) < 0) {
      operator delete(__s1[0]);
    }
    if (v14 != v47) {
      goto LABEL_67;
    }
    ServiceMap = (std::mutex *)Registry::getServiceMap(self->fRegistry.__ptr_);
    uint64_t v32 = ServiceMap;
    if (v33 < 0)
    {
      v34 = (unsigned __int8 *)(v33 & 0x7FFFFFFFFFFFFFFFLL);
      uint64_t v35 = 5381;
      do
      {
        uint64_t v33 = v35;
        unsigned int v36 = *v34++;
        uint64_t v35 = (33 * v35) ^ v36;
      }
      while (v36);
    }
    std::mutex::lock(ServiceMap);
    *(void *)buf = v33;
    uint64_t v37 = sub_10004D37C(&v32[1].__m_.__sig, (unint64_t *)buf);
    if (v37)
    {
      uint64_t v39 = v37[3];
      v38 = (std::__shared_weak_count *)v37[4];
      if (v38)
      {
        atomic_fetch_add_explicit(&v38->__shared_owners_, 1uLL, memory_order_relaxed);
        std::mutex::unlock(v32);
        atomic_fetch_add_explicit(&v38->__shared_owners_, 1uLL, memory_order_relaxed);
        sub_10004D2C8(v38);
        char v40 = 0;
        if (!v39)
        {
LABEL_65:
          if ((v40 & 1) == 0) {
            sub_10004D2C8(v38);
          }
LABEL_67:
          *(void *)buf = &v46;
          sub_1001F1FAC((void ***)buf);
          if (SHIBYTE(v50) < 0) {
            operator delete(v49[0]);
          }
          goto LABEL_69;
        }
LABEL_57:
        if (([v7 hasConnected] & 1) != 0 || objc_msgSend(v7, "hasEnded"))
        {
          if ([v7 hasEnded]) {
            uint64_t v41 = 2;
          }
          else {
            uint64_t v41 = (uint64_t)[v7 hasConnected];
          }
          uint64_t v42 = *(NSObject **)self->logger.__ptr_.__value_;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v43 = asString();
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = v43;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "#I Sending VoIP App Info (k3rdPartyApp, %s, kUnknown) to baseband", buf, 0xCu);
          }
          (*(void (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)v39 + 648))(v39, 2, v41, 0);
        }
        goto LABEL_65;
      }
    }
    else
    {
      uint64_t v39 = 0;
    }
    std::mutex::unlock(v32);
    v38 = 0;
    char v40 = 1;
    if (!v39) {
      goto LABEL_65;
    }
    goto LABEL_57;
  }
  uint64_t v16 = *(NSObject **)self->logger.__ptr_.__value_;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "TelephonyController is null. Dropping call update.", buf, 2u);
  }
LABEL_69:
}

- (void).cxx_destruct
{
  p_end = &self->fCurrentCalls.fValue.__end_;
  sub_1001F1FAC((void ***)&p_end);
  sub_100119D1C((ctu::OsLogLogger **)&self->logger, 0);
  value = self->fRestModule.__ptr_.__value_;
  self->fRestModule.__ptr_.__value_ = 0;
  if (value) {
    sub_1001F20B0((uint64_t)&self->fRestModule, (uint64_t)value);
  }
  cntrl = self->fRegistry.__cntrl_;
  if (cntrl) {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
  }
  fObj = self->fQueue.fObj.fObj;
  if (fObj) {
    dispatch_release(fObj);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 7) = 0;
  return self;
}

@end