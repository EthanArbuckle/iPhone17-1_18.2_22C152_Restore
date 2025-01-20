@interface SecureIntentRemoteAlertObserver
- (id).cxx_construct;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)setController:(weak_ptr<SecureIntentControllerImpl>)a3;
@end

@implementation SecureIntentRemoteAlertObserver

- (void)setController:(weak_ptr<SecureIntentControllerImpl>)a3
{
  v4 = *(SecureIntentControllerImpl **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_weakController.__cntrl_;
  self->_weakController.__ptr_ = v4;
  self->_weakController.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  cntrl = self->_weakController.__cntrl_;
  if (cntrl)
  {
    v8 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v8)
    {
      v9 = v8;
      ptr = self->_weakController.__ptr_;
      if (ptr)
      {
        id v11 = v6;
        if (v11)
        {
          v12 = sub_100200FB4((id *)ptr + 5);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v11;
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "secure intent remote alert invalidated with error: %@", buf, 0xCu);
          }

          v13 = (std::__shared_weak_count *)*((void *)ptr + 2);
          if (v13)
          {
            if (std::__shared_weak_count::lock(v13)) {
              operator new();
            }
          }
          sub_100088B9C();
        }
      }
      sub_10004D2C8(v9);
    }
  }
}

- (void).cxx_destruct
{
  cntrl = self->_weakController.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end