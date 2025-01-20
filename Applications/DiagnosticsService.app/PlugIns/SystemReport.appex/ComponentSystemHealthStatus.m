@interface ComponentSystemHealthStatus
- (BOOL)isPresent;
- (CRSystemHealthStatus)systemHealthStatus;
- (ComponentSystemHealthStatus)init;
- (id)systemHealthInfo;
- (void)populateAttributes:(id)a3;
- (void)setSystemHealthStatus:(id)a3;
@end

@implementation ComponentSystemHealthStatus

- (ComponentSystemHealthStatus)init
{
  v6.receiver = self;
  v6.super_class = (Class)ComponentSystemHealthStatus;
  v2 = [(ComponentSystemHealthStatus *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    systemHealthStatus = v2->_systemHealthStatus;
    v2->_systemHealthStatus = (CRSystemHealthStatus *)v3;
  }
  return v2;
}

- (BOOL)isPresent
{
  return 1;
}

- (void)populateAttributes:(id)a3
{
  id v5 = a3;
  v4 = [(ComponentSystemHealthStatus *)self systemHealthInfo];
  if (v4) {
    [v5 setObject:v4 forKeyedSubscript:@"systemHealthInfo"];
  }
}

- (id)systemHealthInfo
{
  uint64_t v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Making system health status async call.", buf, 2u);
  }

  v4 = dispatch_queue_create("systemHealthDiagnosticsQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  v17 = buf;
  uint64_t v18 = 0x3032000000;
  v19 = sub_100029BF8;
  v20 = sub_100029C08;
  id v21 = 0;
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100029C10;
  v11[3] = &unk_100084BB0;
  objc_copyWeak(&v14, &location);
  v13 = buf;
  objc_super v6 = v5;
  v12 = v6;
  dispatch_async(v4, v11);
  dispatch_time_t v7 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    v8 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v22 = 134217984;
      uint64_t v23 = 0x4008000000000000;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "System health status retrieval timed out after %f seconds", v22, 0xCu);
    }
  }
  id v9 = *((id *)v17 + 5);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

  return v9;
}

- (CRSystemHealthStatus)systemHealthStatus
{
  return self->_systemHealthStatus;
}

- (void)setSystemHealthStatus:(id)a3
{
}

- (void).cxx_destruct
{
}

@end