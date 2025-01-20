@interface EduModeNotifier
- (EduModeNotifier)initWithRegistry:(shared_ptr<const Registry>)a3 andQueue:(queue)a4 andLogger:(void *)a5;
- (id).cxx_construct;
- (void)dumpState;
- (void)handleiCloudAccountEventSync:(int)a3;
- (void)registerForNotifications;
- (void)setup;
- (void)updateEDUModeSync;
@end

@implementation EduModeNotifier

- (EduModeNotifier)initWithRegistry:(shared_ptr<const Registry>)a3 andQueue:(queue)a4 andLogger:(void *)a5
{
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v24.receiver = self;
  v24.super_class = (Class)EduModeNotifier;
  v8 = [(EduModeNotifier *)&v24 init];
  v9 = v8;
  if (v8)
  {
    v11 = *(Registry **)ptr;
    uint64_t v10 = *((void *)ptr + 1);
    if (v10) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
    }
    v12 = (std::__shared_weak_count *)v8->fRegistry.__cntrl_;
    v9->fRegistry.__ptr_ = v11;
    v9->fRegistry.__cntrl_ = (__shared_weak_count *)v10;
    if (v12) {
      sub_10004D2C8(v12);
    }
    v13 = *(NSObject **)cntrl;
    if (v13) {
      dispatch_retain(v13);
    }
    fObj = v9->fQueue.fObj.fObj;
    v9->fQueue.fObj.fObj = (dispatch_object_s *)v13;
    if (fObj) {
      dispatch_release(fObj);
    }
    v9->fLogger = a4.fObj.fObj;
    sub_100058DB0(&__p, "EDUModeNotifier");
    v15 = v9->fQueue.fObj.fObj;
    v20 = v15;
    if (v15) {
      dispatch_retain(v15);
    }
    ctu::RestModule::RestModule();
    RestModule v16 = v23;
    RestModule v23 = (RestModule)0;
    v17 = (std::__shared_weak_count *)v9->fRestModule.fState.__cntrl_;
    v9->fRestModule = v16;
    if (v17)
    {
      sub_10004D2C8(v17);
      if (v23.fState.__cntrl_) {
        sub_10004D2C8((std::__shared_weak_count *)v23.fState.__cntrl_);
      }
    }
    if (v20) {
      dispatch_release(v20);
    }
    if (v22 < 0) {
      operator delete(__p);
    }
    v9->fEduModeResource.fValue = 0;
    f = v9->fEduModeResource.fSender.__f_.__f_;
    if (f) {
      (*(void (**)(void *))(*(void *)f + 48))(f);
    }
  }
  return v9;
}

- (void)setup
{
  Registry::createRestModuleOneTimeUseConnection(&v4, self->fRegistry.__ptr_);
  ctu::RestModule::connect();
  if (v5) {
    sub_10004D2C8(v5);
  }
  v6[0] = off_101A927C8;
  v6[1] = &self->fRestModule;
  v6[3] = v6;
  sub_100318874(v6, self->fEduModeResource.fSender.__f_.__buf_.__lx);
  sub_10030AB98(v6);
  f = self->fEduModeResource.fSender.__f_.__f_;
  if (f) {
    (*(void (**)(void *, BOOL *))(*(void *)f + 48))(f, &self->fEduModeResource.fValue);
  }
  [(EduModeNotifier *)self registerForNotifications];
}

- (void)registerForNotifications
{
  id location = 0;
  objc_initWeak(&location, self);
  fObj = self->fQueue.fObj.fObj;
  v4[1] = fObj;
  if (fObj) {
    dispatch_retain(fObj);
  }
  objc_copyWeak(v4, &location);
  sub_100C05CFC();
}

- (void)handleiCloudAccountEventSync:(int)a3
{
  if (a3 == 2) {
    [(EduModeNotifier *)self updateEDUModeSync];
  }
}

- (void)updateEDUModeSync
{
  int v3 = (*(uint64_t (**)(iCloudAccountNotificator *, SEL))(*(void *)self->fICloudStateMonitor.__ptr_ + 8))(self->fICloudStateMonitor.__ptr_, a2);
  uint64_t v4 = *(NSObject **)self->fLogger;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "false";
    if (v3) {
      v5 = "true";
    }
    int v8 = 136315138;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I Device is in edu mode: %s", (uint8_t *)&v8, 0xCu);
  }
  self->fEduModeResource.fValue = v3;
  p_fValue = &self->fEduModeResource.fValue;
  uint64_t v7 = *((void *)p_fValue - 1);
  if (v7) {
    (*(void (**)(uint64_t, BOOL *))(*(void *)v7 + 48))(v7, p_fValue);
  }
}

- (void)dumpState
{
  int v3 = *(NSObject **)self->fLogger;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->fEduModeResource.fValue) {
      uint64_t v4 = "true";
    }
    else {
      uint64_t v4 = "false";
    }
    int v5 = 136315138;
    v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I Device is in edu mode: %s", (uint8_t *)&v5, 0xCu);
  }
}

- (void).cxx_destruct
{
  fObj = self->fQueue.fObj.fObj;
  if (fObj) {
    dispatch_release(fObj);
  }
  cntrl = self->fRegistry.__cntrl_;
  if (cntrl) {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
  }
  int v5 = self->fRestModule.fState.__cntrl_;
  if (v5) {
    sub_10004D2C8((std::__shared_weak_count *)v5);
  }
  sub_10030AB98(self->fEduModeResource.fSender.__f_.__buf_.__lx);
  v6 = self->fICloudStateMonitor.__cntrl_;
  if (v6)
  {
    sub_10004D2C8((std::__shared_weak_count *)v6);
  }
}

- (id).cxx_construct
{
  self->fICloudStateMonitor.__ptr_ = 0;
  self->fICloudStateMonitor.__cntrl_ = 0;
  self->fEduModeResource.fSender.__f_.__f_ = 0;
  self->fEduModeResource.fValue = 0;
  ctu::RestModule::RestModule((ctu::RestModule *)&self->fRestModule);
  self->fRegistry.__ptr_ = 0;
  self->fRegistry.__cntrl_ = 0;
  self->fQueue.fObj.fObj = 0;
  return self;
}

@end