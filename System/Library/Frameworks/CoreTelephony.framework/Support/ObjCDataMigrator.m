@interface ObjCDataMigrator
- (ObjCDataMigrator)initWithRegistry:(const void *)a3;
- (id).cxx_construct;
- (void)_handlePostInstallUpdateActivityCallback:(_xpc_activity_s *)a3;
- (void)_postInstallUpdateActivityDidReceiveCallback:(_xpc_activity_s *)a3;
- (void)setup;
@end

@implementation ObjCDataMigrator

- (ObjCDataMigrator)initWithRegistry:(const void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ObjCDataMigrator;
  v4 = [(ObjCDataMigrator *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v7 = *(Registry **)a3;
    uint64_t v6 = *((void *)a3 + 1);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_registry.__cntrl_;
    v5->_registry.__ptr_ = v7;
    v5->_registry.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl) {
      sub_10004D2C8(cntrl);
    }
    v5->_alreadyRegistered = 0;
  }
  return v5;
}

- (void)setup
{
  if (self->_alreadyRegistered) {
    return;
  }
  self->_alreadyRegistered = 1;
  xpc_object_t v22 = 0;
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v4 = v3;
  if (v3)
  {
    xpc_object_t v22 = v3;
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    xpc_object_t v22 = v4;
    if (!v4)
    {
      xpc_object_t v5 = xpc_null_create();
      xpc_object_t v4 = 0;
      goto LABEL_9;
    }
  }
  if (xpc_get_type(v4) != (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t v5 = xpc_null_create();
LABEL_9:
    xpc_object_t v22 = v5;
    goto LABEL_10;
  }
  xpc_retain(v4);
LABEL_10:
  xpc_release(v4);
  xpc_object_t v20 = xpc_BOOL_create(1);
  if (!v20) {
    xpc_object_t v20 = xpc_null_create();
  }
  *(void *)buf = &v22;
  v19 = (const char *)XPC_ACTIVITY_POST_INSTALL;
  sub_100035E70((uint64_t)buf, &v20, &v21);
  xpc_release(v21);
  xpc_object_t v21 = 0;
  xpc_release(v20);
  xpc_object_t v20 = 0;
  xpc_object_t v16 = xpc_BOOL_create(1);
  if (!v16) {
    xpc_object_t v16 = xpc_null_create();
  }
  *(void *)buf = &v22;
  v19 = (const char *)XPC_ACTIVITY_REQUIRES_CLASS_C;
  sub_100035E70((uint64_t)buf, &v16, &v17);
  xpc_release(v17);
  xpc_object_t v17 = 0;
  xpc_release(v16);
  xpc_object_t v16 = 0;
  xpc_object_t v14 = xpc_int64_create(XPC_ACTIVITY_INTERVAL_5_MIN);
  if (!v14) {
    xpc_object_t v14 = xpc_null_create();
  }
  *(void *)buf = &v22;
  v19 = XPC_ACTIVITY_GRACE_PERIOD;
  sub_100035E70((uint64_t)buf, &v14, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v14);
  xpc_object_t v14 = 0;
  xpc_object_t v12 = xpc_string_create(XPC_ACTIVITY_PRIORITY_UTILITY);
  if (!v12) {
    xpc_object_t v12 = xpc_null_create();
  }
  *(void *)buf = &v22;
  v19 = XPC_ACTIVITY_PRIORITY;
  sub_100035E70((uint64_t)buf, &v12, &v13);
  xpc_release(v13);
  xpc_object_t v13 = 0;
  xpc_release(v12);
  xpc_object_t v12 = 0;
  xpc_object_t v10 = xpc_BOOL_create(1);
  if (!v10) {
    xpc_object_t v10 = xpc_null_create();
  }
  *(void *)buf = &v22;
  v19 = XPC_ACTIVITY_ALLOW_BATTERY;
  sub_100035E70((uint64_t)buf, &v10, &v11);
  xpc_release(v11);
  xpc_object_t v11 = 0;
  xpc_release(v10);
  xpc_object_t v10 = 0;
  sub_1007295DC();
  uint64_t v6 = qword_101B0D598;
  if (os_log_type_enabled((os_log_t)qword_101B0D598, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I Registering for post-install update activity", buf, 2u);
  }
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  xpc_object_t v7 = v22;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100729674;
  handler[3] = &unk_101A006A0;
  objc_copyWeak(&v9, (id *)buf);
  xpc_activity_register("com.apple.CommCenter.migration.post-install-update", v7, handler);
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
  xpc_release(v22);
}

- (void)_postInstallUpdateActivityDidReceiveCallback:(_xpc_activity_s *)a3
{
  sub_1007295DC();
  uint64_t v6 = qword_101B0D598;
  if (os_log_type_enabled((os_log_t)qword_101B0D598, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I Post-install update activity did receive callback", buf, 2u);
  }
  xpc_activity_state_t state = xpc_activity_get_state(a3);
  if (state == 2)
  {
    [(ObjCDataMigrator *)self _handlePostInstallUpdateActivityCallback:a3];
  }
  else if (!state)
  {
    sub_1007295DC();
    v8 = qword_101B0D598;
    if (os_log_type_enabled((os_log_t)qword_101B0D598, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I Checking in for post-install update handler", v9, 2u);
    }
  }
}

- (void)_handlePostInstallUpdateActivityCallback:(_xpc_activity_s *)a3
{
  sub_1007295DC();
  xpc_object_t v5 = qword_101B0D598;
  if (os_log_type_enabled((os_log_t)qword_101B0D598, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I Post-install update handler entered", (uint8_t *)&buf, 2u);
  }
  p_registry = &self->_registry;
  sub_10072A110((uint64_t)p_registry);
  char v7 = DMGetUserDataDisposition();
  sub_1006941A8(&buf);
  xpc_object_t v48 = (xpc_object_t)buf;
  *(void *)&long long buf = xpc_null_create();
  xpc_release((xpc_object_t)buf);
  xpc_object_t v46 = xpc_BOOL_create(0);
  if (!v46) {
    xpc_object_t v46 = xpc_null_create();
  }
  *(void *)&long long buf = &v48;
  *((void *)&buf + 1) = "kIsEraseInstall";
  sub_100035E70((uint64_t)&buf, &v46, &v47);
  xpc_release(v47);
  xpc_object_t v47 = 0;
  xpc_release(v46);
  xpc_object_t v46 = 0;
  xpc_object_t v44 = xpc_BOOL_create(0);
  if (!v44) {
    xpc_object_t v44 = xpc_null_create();
  }
  *(void *)&long long buf = &v48;
  *((void *)&buf + 1) = "kIsUpgrade";
  sub_100035E70((uint64_t)&buf, &v44, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v44);
  xpc_object_t v44 = 0;
  xpc_object_t v42 = xpc_BOOL_create(0);
  if (!v42) {
    xpc_object_t v42 = xpc_null_create();
  }
  *(void *)&long long buf = &v48;
  *((void *)&buf + 1) = "kIsRestore";
  sub_100035E70((uint64_t)&buf, &v42, &v43);
  xpc_release(v43);
  xpc_object_t v43 = 0;
  xpc_release(v42);
  xpc_object_t v42 = 0;
  if (v7)
  {
    sub_1007295DC();
    id v9 = qword_101B0D598;
    if (os_log_type_enabled((os_log_t)qword_101B0D598, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I Is erase install", (uint8_t *)&buf, 2u);
    }
    xpc_object_t v40 = xpc_BOOL_create(1);
    if (!v40) {
      xpc_object_t v40 = xpc_null_create();
    }
    *(void *)&long long buf = &v48;
    *((void *)&buf + 1) = "kIsEraseInstall";
    sub_100035E70((uint64_t)&buf, &v40, &v41);
    xpc_release(v41);
    xpc_object_t v41 = 0;
    xpc_release(v40);
    xpc_object_t v40 = 0;
    if ((v7 & 8) != 0) {
      goto LABEL_20;
    }
    goto LABEL_31;
  }
  if ((v7 & 2) != 0)
  {
    sub_1007295DC();
    xpc_object_t v11 = qword_101B0D598;
    if (os_log_type_enabled((os_log_t)qword_101B0D598, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I Is upgrade", (uint8_t *)&buf, 2u);
    }
    xpc_object_t v38 = xpc_BOOL_create(1);
    if (!v38) {
      xpc_object_t v38 = xpc_null_create();
    }
    *(void *)&long long buf = &v48;
    *((void *)&buf + 1) = "kIsUpgrade";
    sub_100035E70((uint64_t)&buf, &v38, &v39);
    xpc_release(v39);
    xpc_object_t v39 = 0;
    xpc_release(v38);
    xpc_object_t v38 = 0;
  }
  else
  {
    if ((v7 & 4) != 0)
    {
      sub_1007295DC();
      xpc_object_t v22 = qword_101B0D598;
      if (os_log_type_enabled((os_log_t)qword_101B0D598, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#I Is restore", (uint8_t *)&buf, 2u);
      }
      xpc_object_t v36 = xpc_BOOL_create(1);
      if (!v36) {
        xpc_object_t v36 = xpc_null_create();
      }
      *(void *)&long long buf = &v48;
      *((void *)&buf + 1) = "kIsRestore";
      sub_100035E70((uint64_t)&buf, &v36, &v37);
      xpc_release(v37);
      xpc_object_t v37 = 0;
      xpc_release(v36);
      xpc_object_t v36 = 0;
      if ((v7 & 8) != 0) {
        goto LABEL_20;
      }
      goto LABEL_31;
    }
    sub_1007295DC();
    v8 = qword_101B0D598;
    if (os_log_type_enabled((os_log_t)qword_101B0D598, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I User data disposition unknown", (uint8_t *)&buf, 2u);
      if ((v7 & 8) != 0) {
        goto LABEL_20;
      }
      goto LABEL_31;
    }
  }
  if ((v7 & 8) != 0)
  {
LABEL_20:
    sub_1007295DC();
    xpc_object_t v10 = qword_101B0D598;
    if (os_log_type_enabled((os_log_t)qword_101B0D598, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I Is different device", (uint8_t *)&buf, 2u);
    }
    xpc_object_t v34 = xpc_BOOL_create(1);
    if (!v34) {
      xpc_object_t v34 = xpc_null_create();
    }
    *(void *)&long long buf = &v48;
    *((void *)&buf + 1) = "kIsDifferentDevice";
    sub_100035E70((uint64_t)&buf, &v34, &v35);
    xpc_release(v35);
    xpc_object_t v35 = 0;
    xpc_release(v34);
    xpc_object_t v34 = 0;
    goto LABEL_36;
  }
LABEL_31:
  sub_1007295DC();
  xpc_object_t v12 = qword_101B0D598;
  if (os_log_type_enabled((os_log_t)qword_101B0D598, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I Is same device", (uint8_t *)&buf, 2u);
  }
  xpc_object_t v32 = xpc_BOOL_create(0);
  if (!v32) {
    xpc_object_t v32 = xpc_null_create();
  }
  *(void *)&long long buf = &v48;
  *((void *)&buf + 1) = "kIsDifferentDevice";
  sub_100035E70((uint64_t)&buf, &v32, &v33);
  xpc_release(v33);
  xpc_object_t v33 = 0;
  xpc_release(v32);
  xpc_object_t v32 = 0;
LABEL_36:
  v31 = 0;
  if ((v7 & 2) != 0)
  {
    *(void *)&long long buf = DMGetPreviousBuildVersion();
    sub_100013168((const void **)&v31, (CFTypeRef *)&buf);
  }
  else if ((v7 & 4) != 0)
  {
    CFDictionaryRef v30 = (const __CFDictionary *)DMCopyUserDataDispositionAuxiliaryData();
    CFTypeRef Value = CFDictionaryGetValue(v30, DMUserDataDispositionAuxiliaryDataRestoredBackupBuildVersion);
    *(void *)&long long buf = 0;
    xpc_object_t v13 = (const void **)sub_100056248(&buf, &Value);
    xpc_object_t v14 = v31;
    v31 = (ctu *)buf;
    *(void *)&long long buf = v14;
    sub_1000558F4(v13);
    sub_100057D78((const void **)&v30);
  }
  if (v31) {
    v15 = sub_1000810B8;
  }
  else {
    v15 = 0;
  }
  if (v15)
  {
    sub_1007295DC();
    xpc_object_t v16 = qword_101B0D598;
    if (os_log_type_enabled((os_log_t)qword_101B0D598, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v31;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#I Migrating from system version: %@", (uint8_t *)&buf, 0xCu);
    }
    ctu::cf_to_xpc((uint64_t *)&v27, v31, v17);
    *(void *)&long long buf = &v48;
    *((void *)&buf + 1) = "kLastSystemVersionString";
    sub_100035E70((uint64_t)&buf, &v27, &v28);
    xpc_release(v28);
    xpc_object_t v28 = 0;
    xpc_release(v27);
    xpc_object_t v27 = 0;
    int v18 = [(ctu *)v31 intValue];
    if (v18 >= 1)
    {
      sub_1007295DC();
      v19 = qword_101B0D598;
      if (os_log_type_enabled((os_log_t)qword_101B0D598, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 67109120;
        DWORD1(buf) = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#I Migrating from system version: %d", (uint8_t *)&buf, 8u);
      }
      xpc_object_t v25 = xpc_int64_create(v18);
      if (!v25) {
        xpc_object_t v25 = xpc_null_create();
      }
      *(void *)&long long buf = &v48;
      *((void *)&buf + 1) = "kLastSystemVersion";
      sub_100035E70((uint64_t)&buf, &v25, &v26);
      xpc_release(v26);
      xpc_object_t v26 = 0;
      xpc_release(v25);
      xpc_object_t v25 = 0;
    }
  }
  Registry::getServiceManager((uint64_t *)&buf, p_registry->__ptr_);
  xpc_object_t v24 = v48;
  if (v48) {
    xpc_retain(v48);
  }
  else {
    xpc_object_t v24 = xpc_null_create();
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v23 = global_queue;
  if (global_queue) {
    dispatch_retain(global_queue);
  }
  v49[0] = off_101A00848;
  v49[3] = v49;
  ServiceManager::migrate();
  sub_100060644(v49);
  if (v23) {
    dispatch_release(v23);
  }
  xpc_release(v24);
  if (*((void *)&buf + 1)) {
    sub_10004D2C8(*((std::__shared_weak_count **)&buf + 1));
  }
  if (!xpc_activity_set_state(a3, 5))
  {
    sub_1007295DC();
    xpc_object_t v21 = qword_101B0D598;
    if (os_log_type_enabled((os_log_t)qword_101B0D598, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed setting activity state to done", (uint8_t *)&buf, 2u);
    }
  }
  sub_1000558F4((const void **)&v31);
  xpc_release(v48);
}

- (void).cxx_destruct
{
  cntrl = self->_registry.__cntrl_;
  if (cntrl) {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end