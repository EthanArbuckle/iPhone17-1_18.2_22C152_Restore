@interface ACAccountStoreDelegate
- (ACAccountStoreDelegate)initWithCallback:(id)a3 queue:(queue)a4 registry:(const void *)a5;
- (BOOL)isManagedAppleId;
- (const)getPrimaryAccount;
- (id).cxx_construct;
- (void)dealloc;
- (void)findAccountName:(id)a3;
- (void)initAccountNameWithRetry;
- (void)storeStatusChanged:(id)a3;
@end

@implementation ACAccountStoreDelegate

- (ACAccountStoreDelegate)initWithCallback:(id)a3 queue:(queue)a4 registry:(const void *)a5
{
  v18.receiver = self;
  v18.super_class = (Class)ACAccountStoreDelegate;
  id v8 = [(ACAccountStoreDelegate *)&v18 init];
  id v9 = v8;
  if (v8)
  {
    uint64_t v11 = *(void *)a5;
    uint64_t v10 = *((void *)a5 + 1);
    if (v10) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
    }
    v12 = (std::__shared_weak_count *)*((void *)v8 + 3);
    *((void *)v9 + 2) = v11;
    *((void *)v9 + 3) = v10;
    if (v12) {
      sub_10004D2C8(v12);
    }
    *((_WORD *)v9 + 16) = 0;
    if (a3) {
      v13 = _Block_copy(a3);
    }
    else {
      v13 = 0;
    }
    v14 = (const void *)*((void *)v9 + 6);
    *((void *)v9 + 6) = v13;
    if (v14) {
      _Block_release(v14);
    }
    v15 = *(NSObject **)a4.fObj.fObj;
    if (v15) {
      dispatch_retain(v15);
    }
    v16 = *((void *)v9 + 5);
    *((void *)v9 + 5) = v15;
    if (v16) {
      dispatch_release(v16);
    }
    *((void *)v9 + 1) = 0;
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  v3 = *((void *)self + 14);
  *((void *)self + 14) = 0;
  if (v3) {
    dispatch_release(v3);
  }
  v4 = (std::__shared_weak_count *)*((void *)self + 13);
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  if (v4) {
    sub_10004D2C8(v4);
  }
  v5 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v5 removeObserver:self name:ACDAccountStoreDidChangeNotification object:0];
  uint64_t v6 = *((void *)self + 7);
  if (v6)
  {
    (*(void (**)(uint64_t))(*(void *)v6 + 16))(v6);
    v7 = (std::__shared_weak_count *)*((void *)self + 8);
    *((void *)self + 7) = 0;
    *((void *)self + 8) = 0;
    if (v7) {
      sub_10004D2C8(v7);
    }
  }
  id v8 = (void *)*((void *)self + 1);
  if (v8) {

  }
  v9.receiver = self;
  v9.super_class = (Class)ACAccountStoreDelegate;
  [(ACAccountStoreDelegate *)&v9 dealloc];
}

- (void)initAccountNameWithRetry
{
  v3 = (std::__shared_weak_count *)*((void *)self + 8);
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  if (v3) {
    sub_10004D2C8(v3);
  }
  uint64_t v4 = *((void *)self + 12);
  v5 = (std::__shared_weak_count *)*((void *)self + 13);
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3321888768;
  v6[2] = sub_100C0546C;
  v6[3] = &unk_101A47B98;
  if (v5)
  {
    atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v7 = self;
    uint64_t v8 = v4;
    objc_super v9 = v5;
    atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    v7 = self;
    uint64_t v8 = v4;
    objc_super v9 = 0;
  }
  [(ACAccountStoreDelegate *)self findAccountName:v6];
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  if (v9) {
    std::__shared_weak_count::__release_weak(v9);
  }
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
}

- (void)storeStatusChanged:(id)a3
{
  uint64_t v4 = **((void **)self + 15);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    buf[0] = 136315394;
    *(void *)&buf[1] = "";
    __int16 v7 = 2080;
    uint64_t v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I %s%sstoreStatusChanged", (uint8_t *)buf, 0x16u);
  }
  uint64_t v5 = *((void *)self + 13);
  if (v5)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 16), 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 16), 1uLL, memory_order_relaxed);
  }
  operator new();
}

- (void)findAccountName:(id)a3
{
  uint64_t v5 = *((void *)self + 13);
  if (v5)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 16), 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 16), 1uLL, memory_order_relaxed);
  }
  if (*((void *)self + 5)) {
    dispatch_retain(*((dispatch_object_t *)self + 5));
  }
  id v6 = *((id *)self + 1);
  if (a3) {
    _Block_copy(a3);
  }
  operator new();
}

- (const)getPrimaryAccount
{
  return (char *)self + 72;
}

- (BOOL)isManagedAppleId
{
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v4 = **((void **)self + 15);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      uint64_t v8 = "";
      __int16 v9 = 2080;
      uint64_t v10 = "";
      uint64_t v5 = "#I %s%sPrimaryAppleAccount not supported";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v7, 0x16u);
    }
    return 0;
  }
  id v3 = objc_msgSend(*((id *)self + 1), "aa_primaryAppleAccount");
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v4 = **((void **)self + 15);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      uint64_t v8 = "";
      __int16 v9 = 2080;
      uint64_t v10 = "";
      uint64_t v5 = "#I %s%sManagedAppleID not supported";
      goto LABEL_10;
    }
    return 0;
  }

  return objc_msgSend(v3, "aa_isManagedAppleID");
}

- (void).cxx_destruct
{
  sub_100119D1C((ctu::OsLogLogger **)self + 15, 0);
  id v3 = *((void *)self + 14);
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)*((void *)self + 13);
  if (v4) {
    sub_10004D2C8(v4);
  }
  if (*((char *)self + 95) < 0) {
    operator delete(*((void **)self + 9));
  }
  uint64_t v5 = (std::__shared_weak_count *)*((void *)self + 8);
  if (v5) {
    sub_10004D2C8(v5);
  }
  id v6 = (const void *)*((void *)self + 6);
  if (v6) {
    _Block_release(v6);
  }
  int v7 = *((void *)self + 5);
  if (v7) {
    dispatch_release(v7);
  }
  uint64_t v8 = (std::__shared_weak_count *)*((void *)self + 3);
  if (v8)
  {
    sub_10004D2C8(v8);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((void *)self + 15) = 0;
  return self;
}

@end