@interface WiFiPathObserver
- (BOOL)isWifiAvailable;
- (NWPathEvaluator)evaluator;
- (WiFiPathObserver)initWithMonitor:(weak_ptr<DataNetworkMonitor>)a3 logger:(void *)a4;
- (id).cxx_construct;
- (id)getInterfaceName;
- (void)dealloc;
- (void)doStartObserving;
- (void)doUpdateWifiAvailability;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setEvaluator:(id)a3;
@end

@implementation WiFiPathObserver

- (WiFiPathObserver)initWithMonitor:(weak_ptr<DataNetworkMonitor>)a3 logger:(void *)a4
{
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v14.receiver = self;
  v14.super_class = (Class)WiFiPathObserver;
  v6 = [(WiFiPathObserver *)&v14 init];
  v7 = v6;
  if (v6)
  {
    v9 = *(DataNetworkMonitor **)ptr;
    uint64_t v8 = *((void *)ptr + 1);
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 16), 1uLL, memory_order_relaxed);
    }
    v10 = (std::__shared_weak_count *)v6->_netMonitor.__cntrl_;
    v7->_netMonitor.__ptr_ = v9;
    v7->_netMonitor.__cntrl_ = (__shared_weak_count *)v8;
    if (v10) {
      std::__shared_weak_count::__release_weak(v10);
    }
    v7->_logger = cntrl;
    v7->_wifiAvailable = 0;
    v11 = *(NSObject **)cntrl;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I WiFiPathObserver created", v13, 2u);
    }
  }
  return v7;
}

- (void)dealloc
{
  evaluator = self->_evaluator;
  if (evaluator)
  {
    [(NWPathEvaluator *)evaluator removeObserver:self forKeyPath:@"path"];
    v4 = self->_evaluator;
    self->_evaluator = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)WiFiPathObserver;
  [(WiFiPathObserver *)&v5 dealloc];
}

- (void)doStartObserving
{
  id v4 = objc_alloc_init((Class)NWParameters);
  [v4 setRequiredInterfaceType:1];
  id v5 = [objc_alloc((Class)NWPathEvaluator) initWithEndpoint:0 parameters:v4];
  [(WiFiPathObserver *)self setEvaluator:v5];

  v6 = [(WiFiPathObserver *)self evaluator];

  if (!v6)
  {
    v7 = *(NSObject **)self->_logger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[NWPathEvaluator initWithEndpoint] failed", v9, 2u);
    }
  }
  uint64_t v8 = [(WiFiPathObserver *)self evaluator];
  [v8 addObserver:self forKeyPath:@"path" options:5 context:0];
}

- (BOOL)isWifiAvailable
{
  return self->_wifiAvailable;
}

- (id)getInterfaceName
{
  v2 = [(WiFiPathObserver *)self evaluator];
  v3 = [v2 path];

  if (v3)
  {
    id v4 = [v3 interface];
    id v5 = [v4 interfaceName];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)doUpdateWifiAvailability
{
  v3 = [(WiFiPathObserver *)self evaluator];
  id v4 = [v3 path];

  if (v4)
  {
    id v5 = [v4 status];
    unsigned int v6 = [v4 usesInterfaceType:1];
    v7 = *(NSObject **)self->_logger;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = asStringBool(v5 == (id)1);
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = asStringBool(v6);
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I update result: isPathAvailable = %s, wifiAvailable = %s", buf, 0x16u);
    }
    if (v5 == (id)1) {
      unsigned int v8 = v6;
    }
    else {
      unsigned int v8 = 0;
    }
    if (v8 == 1)
    {
      id v9 = objc_alloc_init((Class)CWFInterface);
      [v9 activate];
      v10 = [v9 currentKnownNetworkProfile];
      v11 = v10;
      if (v10)
      {
        unsigned int v12 = [v10 isCarPlay];
        v13 = *(NSObject **)self->_logger;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = asStringBool(v12);
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I Network profile is a CarPlay: %s", buf, 0xCu);
        }
        int v15 = v12 ^ 1;
      }
      else
      {
        v17 = *(NSObject **)self->_logger;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#I Couldn't obtain network profile", buf, 2u);
        }
        int v15 = 1;
      }
      [v9 invalidate];
    }
    else
    {
      int v15 = 0;
    }
    if (self->_wifiAvailable != v15)
    {
      self->_wifiAvailable = v15;
      v18 = [(WiFiPathObserver *)self evaluator];
      v19 = [v18 path];
      v20 = [v19 interface];
      v21 = [v20 interfaceName];

      v58 = 0;
      v59 = 0;
      uint64_t v60 = 0;
      v56[0] = 0;
      v56[1] = 0;
      uint64_t v57 = 0;
      ctu::cf::assign();
      v59 = (long long *)sub_100048008((uint64_t *)&v58, (long long *)v56);
      v54 = 0;
      uint64_t v55 = 0;
      v53 = 0;
      sub_1000302C0((char *)&v53, v58, v59, 0xAAAAAAAAAAAAAAABLL * (((char *)v59 - (char *)v58) >> 3));
      uint64_t v61 = 0;
      uint64_t v62 = 0;
      uint64_t v63 = 0;
      sub_1000302C0((char *)&v61, v53, v54, 0xAAAAAAAAAAAAAAABLL * (((char *)v54 - (char *)v53) >> 3));
      v87 = 0;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      memset(buf, 0, sizeof(buf));
      sub_10004DE24((uint64_t)buf);
      v22 = (void *)std::ostream::operator<<();
      v23 = sub_10004B96C(v22, (uint64_t)", ", 2);
      LOBYTE(v65) = 123;
      sub_10004B96C(v23, (uint64_t)&v65, 1);
      uint64_t v24 = v61;
      uint64_t v25 = v62;
      if (v61 != v62)
      {
        char v26 = 0;
        do
        {
          if (v26)
          {
            LOBYTE(v65) = 44;
            sub_10004B96C(v23, (uint64_t)&v65, 1);
          }
          int v27 = *(char *)(v24 + 23);
          if (v27 >= 0) {
            uint64_t v28 = v24;
          }
          else {
            uint64_t v28 = *(void *)v24;
          }
          if (v27 >= 0) {
            uint64_t v29 = *(unsigned __int8 *)(v24 + 23);
          }
          else {
            uint64_t v29 = *(void *)(v24 + 8);
          }
          sub_10004B96C(v23, v28, v29);
          v24 += 24;
          char v26 = 1;
        }
        while (v24 != v25);
      }
      LOBYTE(v65) = 125;
      sub_10004B96C(v23, (uint64_t)&v65, 1);
      sub_10004BC98((uint64_t)&buf[8], &__p);
      sub_1001AA668(&event::data::dataWifiAvailable[3], (uint64_t *)&__p);
      if (SBYTE7(v71) < 0) {
        operator delete((void *)__p);
      }
      if (SHIBYTE(v76) < 0) {
        operator delete(*((void **)&v75 + 1));
      }
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      std::ios::~ios();
      *(void *)buf = &v61;
      sub_100047F64((void ***)buf);
      v30 = (uint64_t *)sub_1001667F8(&event::data::dataWifiAvailable[1]);
      char v69 = v15;
      long long v68 = 0uLL;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      memset(buf, 0, sizeof(buf));
      v31 = (pthread_mutex_t *)sub_100060E64(v30 + 3);
      sub_100061F70(buf, v31);
      uint64_t v32 = v30[1];
      if (v32)
      {
        if (atomic_load_explicit((atomic_uint *volatile)(v32 + 8), memory_order_acquire) == 1) {
          sub_100166E68(v30, buf, 0, 1);
        }
        uint64_t v33 = *v30;
        uint64_t v34 = v30[1];
        if (v34) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(v34 + 8), 1u, memory_order_relaxed);
        }
      }
      else
      {
        uint64_t v34 = 0;
        uint64_t v33 = *v30;
      }
      long long v35 = v68;
      *(void *)&long long v68 = v33;
      *((void *)&v68 + 1) = v34;
      long long __p = v35;
      sub_10000A740((atomic_uint **)&__p + 1);
      sub_10000A6C8(*((pthread_mutex_t **)&v82 + 1));
      sub_10000A5F8(buf);
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v73 = 0u;
      memset(buf, 0, sizeof(buf));
      *(void *)&long long v86 = 0;
      *((void *)&v86 + 1) = 10;
      v87 = &buf[8];
      uint64_t v88 = 0;
      v89 = &v69;
      v90 = &v53;
      uint64_t v92 = 0;
      uint64_t v91 = 0;
      v36 = (uint64_t *)sub_100166AC4((uint64_t *)&v68);
      uint64_t v37 = sub_100167E28(v36);
      v67[0] = buf;
      v67[1] = v30;
      v67[2] = v37;
      uint64_t v38 = sub_100166AC4((uint64_t *)&v68);
      sub_100060EA8((uint64_t *)(v38 + 16));
      v39 = (uint64_t *)sub_100166AC4((uint64_t *)&v68);
      uint64_t v40 = *(void *)(sub_100167E28(v39) + 8);
      v41 = (uint64_t *)sub_100166AC4((uint64_t *)&v68);
      uint64_t v42 = sub_100167E28(v41);
      *(void *)&long long v65 = v40;
      *((void *)&v65 + 1) = v42;
      *(void *)&long long v66 = buf;
      *((void *)&v66 + 1) = v42;
      sub_100717D74((uint64_t *)&v65);
      v43 = (uint64_t *)sub_100166AC4((uint64_t *)&v68);
      uint64_t v44 = sub_100167E28(v43);
      v45 = (uint64_t *)sub_100166AC4((uint64_t *)&v68);
      uint64_t v46 = sub_100167E28(v45);
      v64[0] = v44;
      v64[1] = v46;
      v64[2] = (uint64_t)buf;
      v64[3] = v46;
      sub_100717D74(v64);
      long long __p = v65;
      long long v71 = v66;
      uint64_t v47 = v64[0];
      uint64_t v48 = v65;
      if ((void)v65 != v64[0])
      {
        v49 = (unsigned char *)v71;
        BOOL v50 = *(unsigned char *)v71 == 0;
        do
        {
          if (v50)
          {
            uint64_t v51 = sub_100166B08((uint64_t *)(v48 + 16));
            uint64_t v52 = sub_1001675B8((uint64_t *)(v51 + 32));
            sub_1001686AC((void *)(v52 + 24));
            if (!*v49) {
              unsigned char *v49 = 1;
            }
          }
          if (!*(unsigned char *)v71) {
            __assert_rtn("get", "optional.hpp", 1212, "this->is_initialized()");
          }
          *(void *)&long long __p = *(void *)(__p + 8);
          sub_100717D74((uint64_t *)&__p);
          v49 = (unsigned char *)v71;
          if (*(unsigned char *)v71) {
            *(unsigned char *)long long v71 = 0;
          }
          uint64_t v48 = __p;
          BOOL v50 = 1;
        }
        while ((void)__p != v47);
      }
      sub_1007180F0(v67);
      sub_1007182B8((uint64_t)buf);
      sub_10000A740((atomic_uint **)&v68 + 1);
      *(void *)buf = &v53;
      sub_100047F64((void ***)buf);
      if (SHIBYTE(v57) < 0) {
        operator delete(v56[0]);
      }
      *(void *)buf = &v58;
      sub_100047F64((void ***)buf);
    }
  }
  else
  {
    v16 = *(NSObject **)self->_logger;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[NWPathEvaluator path] empty", buf, 2u);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v10;
  cntrl = self->_netMonitor.__cntrl_;
  if (cntrl)
  {
    uint64_t v14 = std::__shared_weak_count::lock((std::__shared_weak_count *)cntrl);
    if (v14)
    {
      int v15 = v14;
      ptr = self->_netMonitor.__ptr_;
      if (ptr)
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100717D30;
        v17[3] = &unk_1019A1BF8;
        v17[4] = ptr;
        sub_10071857C((uint64_t *)ptr + 1, v17);
      }
      sub_10004D2C8(v15);
    }
  }
}

- (NWPathEvaluator)evaluator
{
  return self->_evaluator;
}

- (void)setEvaluator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluator, 0);
  cntrl = self->_netMonitor.__cntrl_;
  if (cntrl)
  {
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