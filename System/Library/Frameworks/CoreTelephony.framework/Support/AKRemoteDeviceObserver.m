@interface AKRemoteDeviceObserver
- (AKRemoteDeviceObserver)initWithQueue:(const queue *)a3 delegate:(const void *)a4;
- (id).cxx_construct;
- (void)_notifyAKDeviceListChanged:(id)a3;
- (void)dealloc;
@end

@implementation AKRemoteDeviceObserver

- (AKRemoteDeviceObserver)initWithQueue:(const queue *)a3 delegate:(const void *)a4
{
  dispatch_object_t fObj = (dispatch_object_t)a3->fObj.fObj;
  if (fObj) {
    dispatch_retain(fObj);
  }
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v19, kCtLoggingSystemName, "ak.svc");
  v18.receiver = self;
  v18.super_class = (Class)AKRemoteDeviceObserver;
  v7 = [(AKRemoteDeviceObserver *)&v18 initWithQueue:&fObj logContext:v19];
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v19);
  if (fObj) {
    dispatch_release(fObj);
  }
  if (v7)
  {
    v9 = *(AKRemoteDeviceObserverDelegate **)a4;
    uint64_t v8 = *((void *)a4 + 1);
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v7->fDelegate.__cntrl_;
    v7->fDelegate.__ptr_ = v9;
    v7->fDelegate.__cntrl_ = (__shared_weak_count *)v8;
    if (cntrl) {
      sub_10004D2C8(cntrl);
    }
    v11 = a3->fObj.fObj;
    if (v11) {
      dispatch_retain(v11);
    }
    v12 = v7->fQueue.fObj.fObj;
    v7->fQueue.fObj.dispatch_object_t fObj = (dispatch_object_s *)v11;
    if (v12) {
      dispatch_release(v12);
    }
    v13 = +[NSDistributedNotificationCenter defaultCenter];
    [v13 addObserver:v7 selector:"_notifyAKDeviceListChanged:" name:@"com.apple.authkit.trusted-device-list-changed" object:0];

    [(AKRemoteDeviceObserver *)v7 getLogContext];
    v14 = v17;
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "AKRemoteDeviceObserver registered for AKDeviceListChangedNotification", v16, 2u);
    }
  }
  return v7;
}

- (void)_notifyAKDeviceListChanged:(id)a3
{
  [(AKRemoteDeviceObserver *)self getLogContext];
  v4 = v11;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Authkit remote devices change notification received", buf, 2u);
  }
  dispatch_object_t fObj = self->fQueue.fObj.fObj;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100841D28;
  block[3] = &unk_101999238;
  block[4] = self;
  dispatch_async(fObj, block);
  dispatch_time_t v6 = dispatch_time(0, 10000000000);
  v7 = self->fQueue.fObj.fObj;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100841DD0;
  v8[3] = &unk_101999238;
  v8[4] = self;
  dispatch_after(v6, v7, v8);
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"com.apple.authkit.trusted-device-list-changed" object:0];

  v4.receiver = self;
  v4.super_class = (Class)AKRemoteDeviceObserver;
  [(AKRemoteDeviceObserver *)&v4 dealloc];
}

- (void).cxx_destruct
{
  dispatch_object_t fObj = self->fQueue.fObj.fObj;
  if (fObj) {
    dispatch_release(fObj);
  }
  cntrl = self->fDelegate.__cntrl_;
  if (cntrl)
  {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
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