@interface SatMsg_IDSOffGridStateManagerObjC
- (IDSOffGridStateManager)fManager;
- (SatMsg_IDSOffGridStateManagerObjC)initWithQueue:(const queue *)a3 delegate:(weak_ptr<SatMsg_IDSOffGridStateManagerDelegate>)a4;
- (id).cxx_construct;
- (optional<BOOL>)getCachedOffGridMode;
- (shared_ptr<std::vector<ctu::cf::CFSharedRef<const)addPrimaryContacts:(id)a3 dst:(void *)a4;
- (shared_ptr<std::vector<ctu::cf::CFSharedRef<const)getContacts;
- (void)dealloc;
- (void)doInitManagerAndFetch;
- (void)doInitManagerIfRequired;
- (void)fetchOffGridMode;
- (void)initManagerAndFetch;
- (void)manager:(id)a3 contactInfoUpdated:(id)a4;
- (void)manager:(id)a3 offGridModeUpdated:(int64_t)a4 publishStatus:(int64_t)a5 context:(id)a6;
- (void)setContacts:(const void *)a3;
- (void)setFManager:(id)a3;
- (void)setOffGridMode:(BOOL)a3 entryPoint:(const void *)a4;
- (void)updateOffGridMode:(int64_t)a3;
@end

@implementation SatMsg_IDSOffGridStateManagerObjC

- (SatMsg_IDSOffGridStateManagerObjC)initWithQueue:(const queue *)a3 delegate:(weak_ptr<SatMsg_IDSOffGridStateManagerDelegate>)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SatMsg_IDSOffGridStateManagerObjC;
  if ([(SatMsg_IDSOffGridStateManagerObjC *)&v5 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  [(SatMsg_IDSOffGridStateManagerObjC *)self setFManager:0];
  fObj = self->fManagerQueue.fObj.fObj;
  self->fManagerQueue.fObj.fObj = 0;

  v4 = self->fStewieQueue.fObj.fObj;
  self->fStewieQueue.fObj.fObj = 0;

  v5.receiver = self;
  v5.super_class = (Class)SatMsg_IDSOffGridStateManagerObjC;
  [(SatMsg_IDSOffGridStateManagerObjC *)&v5 dealloc];
}

- (void)initManagerAndFetch
{
  p_fManagerQueue = &self->fManagerQueue;
  v3 = self;
  sub_100200FB4((id *)&p_fManagerQueue->fObj.fObj);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  operator new();
}

- (void)doInitManagerIfRequired
{
  p_fManagerQueue = &self->fManagerQueue;
  id v4 = sub_100200FB4((id *)&self->fManagerQueue.fObj.fObj);
  dispatch_assert_queue_V2(v4);

  objc_super v5 = [(SatMsg_IDSOffGridStateManagerObjC *)self fManager];

  if (!v5)
  {
    id v6 = objc_alloc((Class)IDSOffGridStateManager);
    v7 = sub_100200FB4((id *)&p_fManagerQueue->fObj.fObj);
    id v11 = 0;
    id v8 = [v6 initWithQueue:v7 error:&v11];
    id v9 = v11;

    if (v9)
    {
      v10 = sub_100200FB4((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "failed to create IDSOffGridStateManager, error: %@", buf, 0xCu);
      }
    }
    else
    {
      [(SatMsg_IDSOffGridStateManagerObjC *)self setFManager:v8];
      v10 = [(SatMsg_IDSOffGridStateManagerObjC *)self fManager];
      [v10 setDelegate:self];
    }
  }
}

- (void)doInitManagerAndFetch
{
  v3 = sub_100200FB4((id *)&self->fManagerQueue.fObj.fObj);
  dispatch_assert_queue_V2(v3);

  if (!self->fInFetch)
  {
    self->fInFetch = 1;
    [(SatMsg_IDSOffGridStateManagerObjC *)self doInitManagerIfRequired];
    id v4 = [(SatMsg_IDSOffGridStateManagerObjC *)self fManager];

    if (v4)
    {
      objc_super v5 = sub_100200FB4((id *)self->logger.__ptr_.__value_);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I IDS contacts initial fetch started", buf, 2u);
      }

      *(void *)buf = 0;
      objc_initWeak((id *)buf, self);
      id v6 = [(SatMsg_IDSOffGridStateManagerObjC *)self fManager];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100ACB25C;
      v7[3] = &unk_101A388F0;
      objc_copyWeak(&v8, (id *)buf);
      [v6 fetchContactsOfType:1 completion:v7];

      objc_destroyWeak(&v8);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      self->fInFetch = 0;
    }
  }
}

- (void)setContacts:(const void *)a3
{
  p_fStewieQueue = &self->fStewieQueue;
  objc_super v5 = self;
  uint64_t v6 = *((void *)a3 + 1);
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  sub_100200FB4((id *)&p_fStewieQueue->fObj.fObj);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  operator new();
}

- (shared_ptr<std::vector<ctu::cf::CFSharedRef<const)getContacts
{
  id v4 = v2;
  objc_super v5 = sub_100200FB4((id *)&self->fStewieQueue.fObj.fObj);
  dispatch_assert_queue_V2(v5);

  ptr = self->fContacts.__ptr_;
  if (!ptr)
  {
    id v6 = [(SatMsg_IDSOffGridStateManagerObjC *)self initManagerAndFetch];
    ptr = self->fContacts.__ptr_;
  }
  cntrl = self->fContacts.__cntrl_;
  void *v4 = ptr;
  v4[1] = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = v7;
  result.__ptr_ = v6;
  return result;
}

- (void)fetchOffGridMode
{
  v3 = sub_100200FB4((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I fetchOffGridMode", buf, 2u);
  }

  id v4 = self;
  sub_100200FB4((id *)&self->fManagerQueue.fObj.fObj);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  operator new();
}

- (void)updateOffGridMode:(int64_t)a3
{
  id v5 = sub_100200FB4((id *)&self->fManagerQueue.fObj.fObj);
  dispatch_assert_queue_V2(v5);

  id location = 0;
  objc_initWeak(&location, self);
  objc_copyWeak(to, &location);
  cntrl = self->fDelegate.__cntrl_;
  to[1] = self->fDelegate.__ptr_;
  to[2] = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 2, 1uLL, memory_order_relaxed);
  }
  to[3] = (id)a3;
  sub_100200FB4((id *)&self->fStewieQueue.fObj.fObj);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  operator new();
}

- (optional<BOOL>)getCachedOffGridMode
{
  v3 = sub_100200FB4((id *)&self->fStewieQueue.fObj.fObj);
  dispatch_assert_queue_V2(v3);

  return self->fCachedOffGridMode;
}

- (void)setOffGridMode:(BOOL)a3 entryPoint:(const void *)a4
{
  id v5 = self;
  if (*((char *)a4 + 23) < 0)
  {
    sub_10004FC84(__p, *(void **)a4, *((void *)a4 + 1));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a4;
    __p[2] = *((void **)a4 + 2);
  }
  sub_100200FB4((id *)&v5->fManagerQueue.fObj.fObj);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  operator new();
}

- (void)manager:(id)a3 offGridModeUpdated:(int64_t)a4 publishStatus:(int64_t)a5 context:(id)a6
{
  id v9 = sub_100200FB4((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a4 > 2) {
      v10 = "???";
    }
    else {
      v10 = off_101A38A08[a4];
    }
    if ((unint64_t)a5 > 2) {
      id v11 = "???";
    }
    else {
      id v11 = off_101A38A20[a5];
    }
    int v12 = 136315394;
    id v13 = v10;
    __int16 v14 = 2080;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I OffGridMode updated: mode = %s, publishStatus = %s", (uint8_t *)&v12, 0x16u);
  }

  [(SatMsg_IDSOffGridStateManagerObjC *)self updateOffGridMode:a4];
}

- (void)manager:(id)a3 contactInfoUpdated:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100200FB4((id *)&self->fManagerQueue.fObj.fObj);
  dispatch_assert_queue_V2(v8);

  id v9 = sub_100200FB4((id *)self->logger.__ptr_.__value_);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = [v7 count];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I contacts updated with %d records", buf, 8u);
  }

  v10 = [(SatMsg_IDSOffGridStateManagerObjC *)self fManager];
  unsigned int v11 = [v6 isEqual:v10];

  if (v11)
  {
    int v12 = operator new(0x30uLL);
    v12[1] = 0;
    v12[2] = 0;
    *int v12 = off_101999A28;
    v12[4] = 0;
    v12[5] = 0;
    v12[3] = 0;
    *(void *)buf = v12 + 3;
    *(void *)&uint8_t buf[8] = v12;
    [(SatMsg_IDSOffGridStateManagerObjC *)self addPrimaryContacts:v7 dst:buf];
    id v13 = *(std::__shared_weak_count **)&buf[8];
    *(_OWORD *)buf = v15;
    if (v13) {
      sub_10004D2C8(v13);
    }
    -[SatMsg_IDSOffGridStateManagerObjC setContacts:](self, "setContacts:", buf, 0);
    if (*(void *)&buf[8]) {
      sub_10004D2C8(*(std::__shared_weak_count **)&buf[8]);
    }
  }
  else
  {
    __int16 v14 = sub_100200FB4((id *)self->logger.__ptr_.__value_);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#I got manager:contactInfoUpdated callback - MANAGER is different", buf, 2u);
    }
  }
}

- (shared_ptr<std::vector<ctu::cf::CFSharedRef<const)addPrimaryContacts:(id)a3 dst:(void *)a4
{
  v26 = v4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = a3;
  id v7 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v7)
  {
    id v8 = 0;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        unsigned int v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        int v12 = [v11 uri];
        id v13 = [v12 unprefixedURI];
        int IsPhoneNumber = IMStringIsPhoneNumber();

        ++v8;
        if (IsPhoneNumber)
        {
          CFStringRef theString2 = 0;
          long long v15 = [v11 uri];
          CFStringRef v16 = [v15 unprefixedURI];
          v17 = (__CFString *)v16;
          CFStringRef theString2 = v16;
          if (v16) {
            CFRetain(v16);
          }

          v18 = **(CFStringRef ***)a4;
          v19 = *(CFStringRef **)(*(void *)a4 + 8);
          while (v18 != v19)
          {
            if (CFEqual(*v18, theString2)) {
              goto LABEL_19;
            }
            ++v18;
          }
          v22 = sub_100200FB4((id *)self->logger.__ptr_.__value_);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v34 = v8;
            __int16 v35 = 2112;
            CFStringRef v36 = theString2;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#I %zu, adding contact: %@", buf, 0x16u);
          }

          sub_1000C06D8(*(const void ****)a4, (const void **)&theString2);
LABEL_19:
          sub_1000558F4((const void **)&theString2);
        }
        else
        {
          v20 = sub_100200FB4((id *)self->logger.__ptr_.__value_);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = [v11 uri];
            *(_DWORD *)buf = 138412290;
            v34 = v21;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#I skipped contact: %@", buf, 0xCu);
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v7);
  }

  uint64_t v23 = *((void *)a4 + 1);
  void *v26 = *(void *)a4;
  v26[1] = v23;
  if (v23) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v23 + 8), 1uLL, memory_order_relaxed);
  }

  result.__cntrl_ = v25;
  result.__ptr_ = v24;
  return result;
}

- (IDSOffGridStateManager)fManager
{
  return (IDSOffGridStateManager *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fManager, 0);
  cntrl = self->fContacts.__cntrl_;
  if (cntrl) {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
  }
  id v4 = self->fDelegate.__cntrl_;
  if (v4) {
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v4);
  }
  fObj = self->fStewieQueue.fObj.fObj;
  self->fStewieQueue.fObj.fObj = 0;

  id v6 = self->fManagerQueue.fObj.fObj;
  self->fManagerQueue.fObj.fObj = 0;

  sub_100119D1C((ctu::OsLogLogger **)&self->logger, 0);
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 4) = 0;
  *((_WORD *)self + 28) = 0;
  return self;
}

@end