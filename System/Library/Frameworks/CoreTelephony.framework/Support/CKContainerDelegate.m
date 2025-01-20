@interface CKContainerDelegate
- (CKContainerDelegate)initWithQueue:(const queue *)a3 settings:(const void *)a4 delegate:(const void *)a5 awdHelper:(const void *)a6 persistenceController:(const void *)a7;
- (id).cxx_construct;
- (void)_cloudKitAccountStatusChanged:(id)a3;
- (void)_handleManateeAccessLatency:(BOOL)a3;
- (void)_updateManateeAccessLatency:(BOOL)a3 manateeAccessLatency:(unint64_t)a4;
- (void)dealloc;
@end

@implementation CKContainerDelegate

- (CKContainerDelegate)initWithQueue:(const queue *)a3 settings:(const void *)a4 delegate:(const void *)a5 awdHelper:(const void *)a6 persistenceController:(const void *)a7
{
  fObj = a3->fObj.fObj;
  dispatch_object_t object = fObj;
  if (fObj) {
    dispatch_retain(fObj);
  }
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v37, kCtLoggingSystemName, "ck.acct");
  v36.receiver = self;
  v36.super_class = (Class)CKContainerDelegate;
  v14 = [(CKContainerDelegate *)&v36 initWithQueue:&object logContext:v37];
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v37);
  if (object) {
    dispatch_release(object);
  }
  if (v14)
  {
    v16 = *(CellularPlanSettings **)a4;
    uint64_t v15 = *((void *)a4 + 1);
    if (v15) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v15 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v14->fSettings.__cntrl_;
    v14->fSettings.__ptr_ = v16;
    v14->fSettings.__cntrl_ = (__shared_weak_count *)v15;
    if (cntrl) {
      sub_10004D2C8(cntrl);
    }
    v19 = *(CellularPlanCloudMonitorDelegate **)a5;
    uint64_t v18 = *((void *)a5 + 1);
    if (v18) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v18 + 16), 1uLL, memory_order_relaxed);
    }
    v20 = (std::__shared_weak_count *)v14->fDelegate.__cntrl_;
    v14->fDelegate.__ptr_ = v19;
    v14->fDelegate.__cntrl_ = (__shared_weak_count *)v18;
    if (v20) {
      std::__shared_weak_count::__release_weak(v20);
    }
    v21 = a3->fObj.fObj;
    if (v21) {
      dispatch_retain(v21);
    }
    v22 = v14->fQueue.fObj.fObj;
    v14->fQueue.fObj.fObj = (dispatch_object_s *)v21;
    if (v22) {
      dispatch_release(v22);
    }
    v24 = *(CellularPlanAwdHelper **)a6;
    uint64_t v23 = *((void *)a6 + 1);
    if (v23) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v23 + 8), 1uLL, memory_order_relaxed);
    }
    v25 = (std::__shared_weak_count *)v14->fAwdHelper.__cntrl_;
    v14->fAwdHelper.__ptr_ = v24;
    v14->fAwdHelper.__cntrl_ = (__shared_weak_count *)v23;
    if (v25) {
      sub_10004D2C8(v25);
    }
    v27 = *(CellularPlanPersistenceController **)a7;
    uint64_t v26 = *((void *)a7 + 1);
    if (v26) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v26 + 8), 1uLL, memory_order_relaxed);
    }
    v28 = (std::__shared_weak_count *)v14->fPersistenceController.__cntrl_;
    v14->fPersistenceController.__ptr_ = v27;
    v14->fPersistenceController.__cntrl_ = (__shared_weak_count *)v26;
    if (v28) {
      sub_10004D2C8(v28);
    }
    v14->fIsManateeAvailable = 0;
    v29 = +[CKContainer containerWithIdentifier:@"com.apple.iCloud.CommCenter"];
    if (v29)
    {
      objc_storeStrong((id *)&v14->fContainer, v29);
      [(CKContainer *)v14->fContainer fetchFullNameAndFormattedUsernameOfAccountWithCompletionHandler:&stru_1019AC8B8];
      v30 = +[NSNotificationCenter defaultCenter];
      [v30 addObserver:v14 selector:"_cloudKitAccountStatusChanged:" name:CKAccountChangedNotification object:0];

      [(CKContainerDelegate *)v14 getLogContext];
      v31 = v35;
      ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v34);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "CKContainerDelegate registered for CKAccountChangedNotification", v34, 2u);
      }
    }
    else
    {
      [(CKContainerDelegate *)v14 getLogContext];
      v32 = v35;
      ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v34);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v34 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to create container", v34, 2u);
      }
    }
  }
  return v14;
}

- (void)_cloudKitAccountStatusChanged:(id)a3
{
  fContainer = self->fContainer;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100215A00;
  v4[3] = &unk_1019AC8E0;
  v4[4] = self;
  [(CKContainer *)fContainer accountInfoWithCompletionHandler:v4];
}

- (void)_handleManateeAccessLatency:(BOOL)a3
{
  if (a3)
  {
    v4 = +[ACAccountStore defaultStore];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100215D0C;
    v5[3] = &unk_1019AC908;
    v5[4] = self;
    objc_msgSend(v4, "aa_primaryAppleAccountWithCompletion:", v5);
  }
  else
  {
    [(CKContainerDelegate *)self _updateManateeAccessLatency:0 manateeAccessLatency:0];
  }
}

- (void)_updateManateeAccessLatency:(BOOL)a3 manateeAccessLatency:(unint64_t)a4
{
  if (self->fIsManateeAvailable != a3)
  {
    self->fIsManateeAvailable = a3;
    if (a3)
    {
      [(CKContainerDelegate *)self getLogContext];
      v6 = *(NSObject **)&buf[8];
      ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = a4;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Manatee access duration %llu sec", buf, 0xCu);
      }
      (*(void (**)(CellularPlanAwdHelper *, unint64_t))(*(void *)self->fAwdHelper.__ptr_ + 256))(self->fAwdHelper.__ptr_, a4);
      if (!a4)
      {
        *(_OWORD *)&buf[8] = 0u;
        uint64_t v33 = 0x400000000000000;
        long long v32 = 0u;
        *(_OWORD *)&uint8_t v34[8] = 0u;
        long long v38 = 0u;
        long long v37 = 0u;
        memset(&v35, 0, sizeof(v35));
        uint64_t v36 = 23;
        buf[23] = 8;
        *(void *)buf = 0x72616C756C6C6543;
        LODWORD(v32) = 1296651109;
        v34[23] = 14;
        qmemcpy(v34, "iCloud Sign in", 14);
        sub_10003ECB8(&v35, "Manatee Access Duration", 0x17uLL);
        v36 |= 1uLL;
        (**(void (***)(Registry **__return_ptr))self->fSettings.__ptr_)(&v27);
        ServiceMap = (std::mutex *)Registry::getServiceMap(v27);
        v8 = ServiceMap;
        if ((v9 & 0x8000000000000000) != 0)
        {
          v10 = (unsigned __int8 *)(v9 & 0x7FFFFFFFFFFFFFFFLL);
          uint64_t v11 = 5381;
          do
          {
            unint64_t v9 = v11;
            unsigned int v12 = *v10++;
            uint64_t v11 = (33 * v11) ^ v12;
          }
          while (v12);
        }
        std::mutex::lock(ServiceMap);
        unint64_t v29 = v9;
        v13 = sub_10004D37C(&v8[1].__m_.__sig, &v29);
        if (v13)
        {
          uint64_t v15 = v13[3];
          v14 = (std::__shared_weak_count *)v13[4];
          if (v14)
          {
            atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
            std::mutex::unlock(v8);
            atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
            sub_10004D2C8(v14);
            char v16 = 0;
LABEL_14:
            sub_1000DB86C((char *)v17, (long long *)buf);
            v30[3] = 0;
            (*(void (**)(uint64_t, void **, void *))(*(void *)v15 + 16))(v15, v17, v30);
            sub_1000DBADC(v30);
            if (v26 < 0) {
              operator delete(__p);
            }
            if (v24 < 0) {
              operator delete(v23);
            }
            if (v22 < 0) {
              operator delete(v21);
            }
            if (v20 < 0) {
              operator delete(v19);
            }
            if (v18 < 0) {
              operator delete(v17[0]);
            }
            if ((v16 & 1) == 0) {
              sub_10004D2C8(v14);
            }
            if (v28) {
              sub_10004D2C8(v28);
            }
            if (SBYTE7(v38) < 0) {
              operator delete((void *)v37);
            }
            if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v35.__r_.__value_.__l.__data_);
            }
            if ((v34[23] & 0x80000000) != 0) {
              operator delete(*(void **)v34);
            }
            if (SHIBYTE(v33) < 0) {
              operator delete((void *)v32);
            }
            if ((buf[23] & 0x80000000) != 0) {
              operator delete(*(void **)buf);
            }
            return;
          }
        }
        else
        {
          uint64_t v15 = 0;
        }
        std::mutex::unlock(v8);
        v14 = 0;
        char v16 = 1;
        goto LABEL_14;
      }
    }
  }
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:CKAccountChangedNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)CKContainerDelegate;
  [(CKContainerDelegate *)&v4 dealloc];
}

- (void).cxx_destruct
{
  cntrl = self->fPersistenceController.__cntrl_;
  if (cntrl) {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
  }
  objc_super v4 = self->fAwdHelper.__cntrl_;
  if (v4) {
    sub_10004D2C8((std::__shared_weak_count *)v4);
  }
  v5 = self->fDelegate.__cntrl_;
  if (v5) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v5);
  }
  fObj = self->fQueue.fObj.fObj;
  if (fObj) {
    dispatch_release(fObj);
  }
  v7 = self->fSettings.__cntrl_;
  if (v7) {
    sub_10004D2C8((std::__shared_weak_count *)v7);
  }

  objc_storeStrong((id *)&self->fContainer, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  return self;
}

@end