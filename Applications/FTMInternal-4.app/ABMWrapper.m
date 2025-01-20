@interface ABMWrapper
+ (id)sharedInstance;
- (ABMWrapper)init;
- (ABMWrapperDelegate)delegate;
- (BOOL)addAWDConfigForAppId:(id)a3 andProtofFilePath:(id)a4;
- (BOOL)querySpecificMetric:(id)a3 triggerRef:(int)a4 triggerType:(int)a5 triggerID:(int)a6 profileID:(int)a7 metricID:(int)a8;
- (BOOL)removeAWDConfigForAppid:(id)a3;
- (dispatch_queue_s)queue;
- (id).cxx_construct;
- (void)listen;
- (void)setDelegate:(id)a3;
@end

@implementation ABMWrapper

+ (id)sharedInstance
{
  v2 = (void *)qword_1002DC370;
  if (!qword_1002DC370)
  {
    v3 = objc_alloc_init(ABMWrapper);
    v4 = (void *)qword_1002DC370;
    qword_1002DC370 = (uint64_t)v3;

    v2 = (void *)qword_1002DC370;
  }

  return v2;
}

- (ABMWrapper)init
{
  v9.receiver = self;
  v9.super_class = (Class)ABMWrapper;
  v2 = [(ABMWrapper *)&v9 init];
  if (v2)
  {
    sub_10001B6CC(&__p, "fieldtest");
    [v2 queue];
    abm::client::CreateManager();
    long long v3 = v8;
    long long v8 = 0uLL;
    v4 = (std::__shared_weak_count *)*((void *)v2 + 2);
    *(_OWORD *)(v2 + 8) = v3;
    if (v4)
    {
      sub_10001B780(v4);
      if (*((void *)&v8 + 1)) {
        sub_10001B780(*((std::__shared_weak_count **)&v8 + 1));
      }
    }
    if (v7 < 0) {
      operator delete(__p);
    }
  }
  return (ABMWrapper *)v2;
}

- (dispatch_queue_s)queue
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019DD8;
  block[3] = &unk_100286DF8;
  block[4] = self;
  if (qword_1002DC378 != -1) {
    dispatch_once(&qword_1002DC378, block);
  }
  return self->_queue;
}

- (BOOL)addAWDConfigForAppId:(id)a3 andProtofFilePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[FTMInternal-4] addAWDConfigForAppId begins", (uint8_t *)&buf, 2u);
  }
  if (([v6 isEqualToString:@"fieldtest"] & 1) == 0)
  {
    BOOL v10 = 0;
    goto LABEL_44;
  }
  memset(&v34[1], 0, 7);
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v9 = v8;
  if (v8)
  {
    v34[0] = v8;
  }
  else
  {
    xpc_object_t v9 = xpc_null_create();
    v34[0] = v9;
    if (!v9)
    {
      xpc_object_t v11 = xpc_null_create();
      xpc_object_t v9 = 0;
      goto LABEL_12;
    }
  }
  if (xpc_get_type(v9) != (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t v11 = xpc_null_create();
LABEL_12:
    v34[0] = v11;
    goto LABEL_13;
  }
  xpc_retain(v9);
LABEL_13:
  xpc_release(v9);
  id v12 = +[NSData dataWithContentsOfFile:v7];
  xpc_object_t v13 = xpc_data_create([v12 bytes], (size_t)[v12 length]);
  if (!v13) {
    xpc_object_t v13 = xpc_null_create();
  }
  if (xpc_get_type(v13) == (xpc_type_t)&_xpc_type_null)
  {
    v14 = 0;
    int v15 = 0;
    BOOL v10 = 0;
  }
  else
  {
    xpc_object_t v32 = xpc_int64_create(2);
    if (!v32) {
      xpc_object_t v32 = xpc_null_create();
    }
    *(void *)&long long buf = v34;
    *((void *)&buf + 1) = abm::kKeyAppID;
    sub_10001A38C((uint64_t)&buf, &v32, &object);
    xpc_release(object);
    xpc_object_t object = 0;
    xpc_release(v32);
    xpc_object_t v32 = 0;
    xpc_object_t v30 = v13;
    if (v13) {
      xpc_retain(v13);
    }
    else {
      xpc_object_t v30 = xpc_null_create();
    }
    *(void *)&long long buf = v34;
    *((void *)&buf + 1) = abm::kKeyPayload;
    sub_10001A38C((uint64_t)&buf, &v30, &v31);
    xpc_release(v31);
    xpc_object_t v31 = 0;
    xpc_release(v30);
    xpc_object_t v30 = 0;
    xpc_object_t v28 = xpc_int64_create(0);
    if (!v28) {
      xpc_object_t v28 = xpc_null_create();
    }
    *(void *)&long long buf = v34;
    *((void *)&buf + 1) = abm::kKeyPayloadType;
    sub_10001A38C((uint64_t)&buf, &v28, &v29);
    xpc_release(v29);
    xpc_object_t v29 = 0;
    xpc_release(v28);
    xpc_object_t v27 = 0;
    xpc_object_t v28 = 0;
    xpc_object_t v16 = xpc_null_create();
    cntrl = self->_abmManager.__cntrl_;
    ptr = self->_abmManager.__ptr_;
    v26 = cntrl;
    xpc_object_t v27 = v16;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    sub_10001B6CC(&__p, abm::kCommandAddConfiguration);
    abm::client::PerformCommand();
    uint64_t v18 = buf;
    v14 = (void *)*((void *)&buf + 1);
    unint64_t v19 = v36;
    LODWORD(v34[1]) = *(_DWORD *)v37;
    *(_DWORD *)((char *)&v34[1] + 3) = *(_DWORD *)&v37[3];
    int v15 = v38;
    char v38 = 0;
    BYTE8(buf) = 0;
    if (v24 < 0) {
      operator delete(__p);
    }
    if (v26) {
      sub_10001B780((std::__shared_weak_count *)v26);
    }
    if (v15 < 0)
    {
      sub_10001B584(&buf, v14, v19);
      if (v36 >= 0) {
        p_long long buf = &buf;
      }
      else {
        p_long long buf = (long long *)buf;
      }
    }
    else
    {
      *(void *)&long long buf = v14;
      *((void *)&buf + 1) = v19;
      LODWORD(v36) = v34[1];
      *(_DWORD *)((char *)&v36 + 3) = *(_DWORD *)((char *)&v34[1] + 3);
      HIBYTE(v36) = v15;
      p_long long buf = &buf;
    }
    NSLog(@"%s: error=%d msg=%s", "-[ABMWrapper addAWDConfigForAppId:andProtofFilePath:]", v18, p_buf);
    if (SHIBYTE(v36) < 0) {
      operator delete((void *)buf);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v21 = "FALSE";
      if (!v18) {
        v21 = "TRUE";
      }
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v21;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[FTMInternal-4] addAWDConfigForAppId success? %{public}s", (uint8_t *)&buf, 0xCu);
    }
    BOOL v10 = v18 == 0;
  }
  xpc_release(v13);

  xpc_release(v34[0]);
  if (v15 < 0) {
    operator delete(v14);
  }
LABEL_44:

  return v10;
}

- (BOOL)removeAWDConfigForAppid:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"fieldtest"] & 1) == 0)
  {
    BOOL v7 = 0;
    goto LABEL_32;
  }
  memset(&v23[1], 0, 7);
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v6 = v5;
  if (v5)
  {
    v23[0] = v5;
  }
  else
  {
    xpc_object_t v6 = xpc_null_create();
    v23[0] = v6;
    if (!v6)
    {
      xpc_object_t v8 = xpc_null_create();
      xpc_object_t v6 = 0;
      goto LABEL_10;
    }
  }
  if (xpc_get_type(v6) != (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t v8 = xpc_null_create();
LABEL_10:
    v23[0] = v8;
    goto LABEL_11;
  }
  xpc_retain(v6);
LABEL_11:
  xpc_release(v6);
  object[1] = xpc_null_create();
  xpc_object_t v21 = xpc_int64_create(2);
  if (!v21) {
    xpc_object_t v21 = xpc_null_create();
  }
  *(void *)&long long buf = v23;
  *((void *)&buf + 1) = abm::kKeyAppID;
  sub_10001A38C((uint64_t)&buf, &v21, object);
  xpc_release(object[0]);
  object[0] = 0;
  xpc_release(v21);
  cntrl = self->_abmManager.__cntrl_;
  ptr = self->_abmManager.__ptr_;
  v20 = cntrl;
  xpc_object_t v21 = 0;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  sub_10001B6CC(&__p, abm::kCommandClearConfiguration);
  abm::client::PerformCommand();
  uint64_t v10 = buf;
  id v12 = (void *)*((void *)&buf + 1);
  unint64_t v11 = v25;
  LODWORD(v23[1]) = *(_DWORD *)v26;
  *(_DWORD *)((char *)&v23[1] + 3) = *(_DWORD *)&v26[3];
  int v13 = v27;
  char v27 = 0;
  BYTE8(buf) = 0;
  if (v18 < 0) {
    operator delete(__p);
  }
  if (v20) {
    sub_10001B780((std::__shared_weak_count *)v20);
  }
  if (v13 < 0)
  {
    sub_10001B584(&buf, v12, v11);
    if (v25 >= 0) {
      p_long long buf = &buf;
    }
    else {
      p_long long buf = (long long *)buf;
    }
  }
  else
  {
    *(void *)&long long buf = v12;
    *((void *)&buf + 1) = v11;
    LODWORD(v25) = v23[1];
    *(_DWORD *)((char *)&v25 + 3) = *(_DWORD *)((char *)&v23[1] + 3);
    HIBYTE(v25) = v13;
    p_long long buf = &buf;
  }
  NSLog(@"%s: error=%d msg=%s", "-[ABMWrapper removeAWDConfigForAppid:]", v10, p_buf);
  if (SHIBYTE(v25) < 0) {
    operator delete((void *)buf);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = "FALSE";
    if (!v10) {
      int v15 = "TRUE";
    }
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[FTMInternal-4] removeAWDConfigForAppid success? %{public}s", (uint8_t *)&buf, 0xCu);
  }
  BOOL v7 = v10 == 0;
  xpc_release(v23[0]);
  if (v13 < 0) {
    operator delete(v12);
  }
LABEL_32:

  return v7;
}

- (BOOL)querySpecificMetric:(id)a3 triggerRef:(int)a4 triggerType:(int)a5 triggerID:(int)a6 profileID:(int)a7 metricID:(int)a8
{
  id v14 = a3;
  if (([v14 isEqualToString:@"fieldtest"] & 1) == 0)
  {
    BOOL v17 = 0;
    goto LABEL_44;
  }
  *(_DWORD *)((char *)v48 + 3) = 0;
  v48[0] = 0;
  xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v16 = v15;
  if (v15)
  {
    xpc_object_t v47 = v15;
  }
  else
  {
    xpc_object_t v16 = xpc_null_create();
    xpc_object_t v47 = v16;
    if (!v16)
    {
      xpc_object_t v18 = xpc_null_create();
      xpc_object_t v16 = 0;
      goto LABEL_10;
    }
  }
  if (xpc_get_type(v16) != (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t v18 = xpc_null_create();
LABEL_10:
    xpc_object_t v47 = v18;
    goto LABEL_11;
  }
  xpc_retain(v16);
LABEL_11:
  xpc_release(v16);
  xpc_object_t v45 = xpc_int64_create(2);
  if (!v45) {
    xpc_object_t v45 = xpc_null_create();
  }
  *(void *)long long buf = &v47;
  *(void *)&buf[8] = abm::kKeyAppID;
  sub_10001A38C((uint64_t)buf, &v45, &v46);
  xpc_release(v46);
  xpc_object_t v46 = 0;
  xpc_release(v45);
  xpc_object_t v45 = 0;
  xpc_object_t v43 = xpc_int64_create(0);
  if (!v43) {
    xpc_object_t v43 = xpc_null_create();
  }
  *(void *)long long buf = &v47;
  *(void *)&buf[8] = abm::kKeyPayloadType;
  sub_10001A38C((uint64_t)buf, &v43, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v43);
  xpc_object_t v43 = 0;
  xpc_object_t v41 = xpc_int64_create(a4);
  if (!v41) {
    xpc_object_t v41 = xpc_null_create();
  }
  *(void *)long long buf = &v47;
  *(void *)&buf[8] = abm::kKeyTriggerRef;
  sub_10001A38C((uint64_t)buf, &v41, &v42);
  xpc_release(v42);
  xpc_object_t v42 = 0;
  xpc_release(v41);
  xpc_object_t v41 = 0;
  xpc_object_t v39 = xpc_int64_create(a5);
  if (!v39) {
    xpc_object_t v39 = xpc_null_create();
  }
  *(void *)long long buf = &v47;
  *(void *)&buf[8] = abm::kKeyTriggerType;
  sub_10001A38C((uint64_t)buf, &v39, &v40);
  xpc_release(v40);
  xpc_object_t v40 = 0;
  xpc_release(v39);
  xpc_object_t v39 = 0;
  xpc_object_t v37 = xpc_int64_create(a6);
  if (!v37) {
    xpc_object_t v37 = xpc_null_create();
  }
  *(void *)long long buf = &v47;
  *(void *)&buf[8] = abm::kKeyTriggerID;
  sub_10001A38C((uint64_t)buf, &v37, &v38);
  xpc_release(v38);
  xpc_object_t v38 = 0;
  xpc_release(v37);
  xpc_object_t v37 = 0;
  xpc_object_t v35 = xpc_int64_create(a7);
  if (!v35) {
    xpc_object_t v35 = xpc_null_create();
  }
  *(void *)long long buf = &v47;
  *(void *)&buf[8] = abm::kKeyProfileID;
  sub_10001A38C((uint64_t)buf, &v35, &v36);
  xpc_release(v36);
  xpc_object_t v36 = 0;
  xpc_release(v35);
  xpc_object_t v35 = 0;
  xpc_object_t v33 = xpc_int64_create(a8);
  if (!v33) {
    xpc_object_t v33 = xpc_null_create();
  }
  *(void *)long long buf = &v47;
  *(void *)&buf[8] = abm::kKeyMetricID;
  sub_10001A38C((uint64_t)buf, &v33, &v34);
  xpc_release(v34);
  xpc_object_t v34 = 0;
  xpc_release(v33);
  xpc_object_t v32 = 0;
  xpc_object_t v33 = 0;
  xpc_object_t v19 = xpc_null_create();
  cntrl = self->_abmManager.__cntrl_;
  ptr = self->_abmManager.__ptr_;
  xpc_object_t v31 = cntrl;
  xpc_object_t v32 = v19;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  sub_10001B6CC(&__p, abm::kCommandQueryMetric);
  abm::client::PerformCommand();
  uint64_t v21 = *(unsigned int *)buf;
  v23 = *(void **)&buf[8];
  unint64_t v22 = *(void *)&buf[16];
  v48[0] = *(_DWORD *)v50;
  *(_DWORD *)((char *)v48 + 3) = *(_DWORD *)&v50[3];
  int v24 = v51;
  char v51 = 0;
  buf[8] = 0;
  if (v29 < 0) {
    operator delete(__p);
  }
  if (v31) {
    sub_10001B780((std::__shared_weak_count *)v31);
  }
  if (v24 < 0)
  {
    sub_10001B584(buf, v23, v22);
    if (buf[23] >= 0) {
      int64_t v25 = buf;
    }
    else {
      int64_t v25 = *(unsigned char **)buf;
    }
  }
  else
  {
    *(void *)long long buf = v23;
    *(void *)&buf[8] = v22;
    *(_DWORD *)&buf[16] = v48[0];
    *(_DWORD *)&buf[19] = *(_DWORD *)((char *)v48 + 3);
    buf[23] = v24;
    int64_t v25 = buf;
  }
  NSLog(@"%s: error=%d msg=%s", "-[ABMWrapper querySpecificMetric:triggerRef:triggerType:triggerID:profileID:metricID:]", v21, v25);
  if ((buf[23] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v26 = "FALSE";
    if (!v21) {
      v26 = "TRUE";
    }
    *(_DWORD *)long long buf = 136446466;
    *(void *)&buf[4] = v26;
    *(_WORD *)&buf[12] = 1026;
    *(_DWORD *)&buf[14] = v21;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[FTMInternal-4] querySpecificMetric success? %{public}s errorCode if any %{public}d", buf, 0x12u);
  }
  BOOL v17 = v21 == 0;
  xpc_release(v47);
  if (v24 < 0) {
    operator delete(v23);
  }
LABEL_44:

  return v17;
}

- (void)listen
{
  cntrl = self->_abmManager.__cntrl_;
  ptr = self->_abmManager.__ptr_;
  int v13 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  sub_10001B6CC(v10, abm::kEventTrigger);
  abm::client::RegisterEventHandler();
  if (v11 < 0) {
    operator delete(v10[0]);
  }
  if (v13) {
    sub_10001B780((std::__shared_weak_count *)v13);
  }
  id v4 = self->_abmManager.__cntrl_;
  xpc_object_t v9 = (std::__shared_weak_count *)v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v4 + 1, 1uLL, memory_order_relaxed);
  }
  sub_10001B6CC(v10, abm::kEventMetric);
  abm::client::RegisterEventHandler();
  if (v11 < 0) {
    operator delete(v10[0]);
  }
  if (v9) {
    sub_10001B780(v9);
  }
  xpc_object_t v5 = self->_abmManager.__cntrl_;
  xpc_object_t v8 = (std::__shared_weak_count *)v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v5 + 1, 1uLL, memory_order_relaxed);
  }
  abm::client::EventsOff();
  if (v8) {
    sub_10001B780(v8);
  }
  xpc_object_t v6 = self->_abmManager.__cntrl_;
  BOOL v7 = (std::__shared_weak_count *)v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v6 + 1, 1uLL, memory_order_relaxed);
  }
  abm::client::EventsOn();
  if (v7) {
    sub_10001B780(v7);
  }
}

- (ABMWrapperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ABMWrapperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  cntrl = self->_abmManager.__cntrl_;
  if (cntrl)
  {
    sub_10001B780((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end