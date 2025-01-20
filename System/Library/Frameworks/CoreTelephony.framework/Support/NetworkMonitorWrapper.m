@interface NetworkMonitorWrapper
- (NetworkMonitorWrapper)initWithQueue:(queue)a3 registry:(shared_ptr<const Registry>)a4 carrier:()basic_string<char domain:()std:(std::allocator<char>> *)a5 :char_traits<char>;
- (id).cxx_construct;
- (unint64_t)usage;
- (void)configure;
- (void)dealloc;
- (void)statsManager:(id)a3 didReceiveNWSnapshot:(id)a4;
- (void)submitUsageMetricWithTransport:(unsigned __int8)a3;
- (void)syncAndSubmitUsageMetricWithTransport:(unsigned __int8)a3 completion:(id)a4;
@end

@implementation NetworkMonitorWrapper

- (NetworkMonitorWrapper)initWithQueue:(queue)a3 registry:(shared_ptr<const Registry>)a4 carrier:()basic_string<char domain:()std:(std::allocator<char>> *)a5 :char_traits<char>
{
  cntrl = a4.__cntrl_;
  ptr = a4.__ptr_;
  dispatch_object_t v22 = *(dispatch_object_t *)a3.fObj.fObj;
  if (v22) {
    dispatch_retain(v22);
  }
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v21, kCtLoggingSystemName, "cp.pur.usage");
  v20.receiver = self;
  v20.super_class = (Class)NetworkMonitorWrapper;
  id v10 = [(NetworkMonitorWrapper *)&v20 initWithQueue:&v22 logContext:v21];
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v21);
  if (v22) {
    dispatch_release(v22);
  }
  if (v10)
  {
    id v11 = [objc_alloc((Class)NWStatsManager) initWithQueue:*(void *)a3.fObj.fObj];
    v12 = (void *)*((void *)v10 + 1);
    *((void *)v10 + 1) = v11;

    [*((id *)v10 + 1) setDelegate:v10];
    v13 = (void *)*((void *)v10 + 2);
    *((void *)v10 + 2) = &off_101AE8038;

    uint64_t v15 = *(void *)ptr;
    uint64_t v14 = *((void *)ptr + 1);
    if (v14) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v14 + 16), 1uLL, memory_order_relaxed);
    }
    v16 = (std::__shared_weak_count *)*((void *)v10 + 13);
    *((void *)v10 + 12) = v15;
    *((void *)v10 + 13) = v14;
    if (v16) {
      std::__shared_weak_count::__release_weak(v16);
    }
    std::string::operator=((std::string *)v10 + 2, (const std::string *)cntrl);
    std::string::operator=((std::string *)v10 + 3, (const std::string *)a5);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1007B6BE4;
    v18[3] = &unk_101999238;
    id v19 = v10;
    [v19 executeBlock:v18];
  }
  return (NetworkMonitorWrapper *)v10;
}

- (void)dealloc
{
  [(NetworkMonitorWrapper *)self getLogContext];
  v3 = v6;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "invalidate NWStatsManager", buf, 2u);
  }
  [(NWStatsManager *)self->mgr invalidate];
  v4.receiver = self;
  v4.super_class = (Class)NetworkMonitorWrapper;
  [(NetworkMonitorWrapper *)&v4 dealloc];
}

- (void)configure
{
  uint64_t v4 = kNWStatsParameterDomainInfo;
  v5 = &__kCFBooleanTrue;
  v3 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  [(NWStatsManager *)self->mgr configure:v3];
}

- (unint64_t)usage
{
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, unsigned long long>, void *>>> *)self->usagePerDomain.__tree_.__begin_node_;
  if (begin_node == &self->usagePerDomain.__tree_.__pair1_) {
    return 0;
  }
  int v3 = 0;
  do
  {
    left = (NetworkMonitorWrapper *)begin_node[1].__value_.__left_;
    v5 = (NetworkMonitorWrapper *)begin_node;
    if (left)
    {
      do
      {
        interests = left;
        left = *(NetworkMonitorWrapper **)left->OCSharedLoggable_opaque;
      }
      while (left);
    }
    else
    {
      do
      {
        interests = (NetworkMonitorWrapper *)v5->interests;
        BOOL v7 = *(void *)interests->OCSharedLoggable_opaque == (void)v5;
        v5 = interests;
      }
      while (!v7);
    }
    v3 += LODWORD(begin_node[7].__value_.__left_);
    begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, unsigned long long>, void *>>> *)interests;
  }
  while (interests != (NetworkMonitorWrapper *)&self->usagePerDomain.__tree_.__pair1_);
  return v3;
}

- (void)syncAndSubmitUsageMetricWithTransport:(unsigned __int8)a3 completion:(id)a4
{
  id v6 = a4;
  BOOL v7 = v6;
  if (self->mgr)
  {
    id location = 0;
    objc_initWeak(&location, self);
    mgr = self->mgr;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1007B6F18;
    v9[3] = &unk_101A09078;
    objc_copyWeak(&v11, &location);
    id v10 = v7;
    unsigned __int8 v12 = a3;
    [(NWStatsManager *)mgr refresh:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id))v6 + 2))(v6);
  }
}

- (void)submitUsageMetricWithTransport:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v4 = self;
  unint64_t v5 = [(NetworkMonitorWrapper *)self usage];
  if (v5)
  {
    unint64_t v6 = v5;
    p_size = (Registry **)&v4->domainName.__r_.__value_.var0.var1.__size_;
    v8 = (std::__shared_weak_count *)*((void *)&v4->domainName.__r_.__value_.var0.var1 + 2);
    if (v8)
    {
      v9 = std::__shared_weak_count::lock(v8);
      if (v9 && *p_size)
      {
        v55 = v9;
        ServiceMap = (std::mutex *)Registry::getServiceMap(*p_size);
        id v11 = ServiceMap;
        if (v12 < 0)
        {
          v13 = (unsigned __int8 *)(v12 & 0x7FFFFFFFFFFFFFFFLL);
          uint64_t v14 = 5381;
          do
          {
            uint64_t v12 = v14;
            unsigned int v15 = *v13++;
            uint64_t v14 = (33 * v14) ^ v15;
          }
          while (v15);
        }
        std::mutex::lock(ServiceMap);
        *(void *)buf = v12;
        v16 = sub_10004D37C(&v11[1].__m_.__sig, (unint64_t *)buf);
        if (v16)
        {
          uint64_t v17 = v16[3];
          v18 = (std::__shared_weak_count *)v16[4];
          if (v18)
          {
            atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
            std::mutex::unlock(v11);
            atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
            sub_10004D2C8(v18);
            char v19 = 0;
            goto LABEL_21;
          }
        }
        else
        {
          uint64_t v17 = 0;
        }
        std::mutex::unlock(v11);
        v18 = 0;
        char v19 = 1;
LABEL_21:
        v53 = v18;
        char v54 = v19;
        if (!v17)
        {
          [(NetworkMonitorWrapper *)v4 getLogContext];
          v24 = *(NSObject **)&buf[8];
          ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "invalid Analytics", buf, 2u);
          }
LABEL_94:
          if ((v54 & 1) == 0) {
            sub_10004D2C8(v53);
          }
LABEL_16:
          if (v9) {
            sub_10004D2C8(v9);
          }
          return;
        }
        __p = 0;
        uint64_t v70 = 0;
        uint64_t v71 = 0;
        sub_100058DB0(&__p, "unknown");
        if (v3 == 1)
        {
          if (SHIBYTE(v71) < 0)
          {
            uint64_t v70 = 4;
            p_p = __p;
            dispatch_object_t v22 = (uint64_t *)((char *)__p + 4);
          }
          else
          {
            dispatch_object_t v22 = (uint64_t *)((char *)&__p + 4);
            HIBYTE(v71) = 4;
            p_p = &__p;
          }
          _DWORD *p_p = 1768319351;
        }
        else
        {
          if (v3 == 2)
          {
            if (SHIBYTE(v71) < 0)
            {
              uint64_t v70 = 8;
              v23 = __p;
              dispatch_object_t v22 = (uint64_t *)((char *)__p + 8);
            }
            else
            {
              dispatch_object_t v22 = &v70;
              HIBYTE(v71) = 8;
              v23 = &__p;
            }
            uint64_t v26 = 0x72616C756C6C6563;
          }
          else
          {
            if (v3 != 3)
            {
LABEL_41:
              [(NetworkMonitorWrapper *)v4 getLogContext];
              v27 = *(NSObject **)&buf[8];
              ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
              v28 = &selRef_enterLoopBackMode_;
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                p_carrierName = (__long *)&v4->carrierName;
                if (*((char *)&v4->carrierName.__r_.__value_.var0.var1 + 23) < 0) {
                  p_carrierName = (__long *)p_carrierName->__data_;
                }
                p_var0 = &v4->carrierName.__r_.var0;
                if (v4->domainName.__r_.__value_.var0.var0.__data_[7] < 0) {
                  p_var0 = *(int **)p_var0;
                }
                *(_DWORD *)buf = 136315650;
                *(void *)&buf[4] = p_carrierName;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v6;
                *(_WORD *)&buf[22] = 2080;
                v77 = p_var0;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s uses %llu bytes totally. main domain:%s", buf, 0x20u);
              }
              p_usagePerDomain = (uint64_t **)&v4->usagePerDomain;
              begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, unsigned long long>, void *>>> *)v4->usagePerDomain.__tree_.__begin_node_;
              p_pair1 = &v4->usagePerDomain.__tree_.__pair1_;
              if (begin_node != &v4->usagePerDomain.__tree_.__pair1_)
              {
                v32 = "domain";
                do
                {
                  [(NetworkMonitorWrapper *)v4 getLogContext];
                  v33 = (const char *)&begin_node[4];
                  v34 = *(NSObject **)&buf[8];
                  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                  {
                    v35 = v4;
                    uint64_t v36 = v17;
                    v37 = v32;
                    v38 = v28;
                    v39 = (const char *)&begin_node[4];
                    if (SHIBYTE(begin_node[6].__value_.__left_) < 0) {
                      v39 = *(const char **)v33;
                    }
                    uint64_t v72 = 0;
                    v40 = (uint64_t **)sub_100046ED4((uint64_t)p_usagePerDomain, &v72, &begin_node[4].__value_.__left_);
                    v41 = *v40;
                    if (!*v40)
                    {
                      *(void *)&buf[16] = 0;
                      v41 = (uint64_t *)operator new(0x40uLL);
                      *(void *)&uint8_t buf[8] = p_pair1;
                      buf[16] = 0;
                      v42 = v41 + 4;
                      if (SHIBYTE(begin_node[6].__value_.__left_) < 0)
                      {
                        sub_10004FC84(v42, begin_node[4].__value_.__left_, (unint64_t)begin_node[5].__value_.__left_);
                      }
                      else
                      {
                        long long v43 = *(_OWORD *)v33;
                        v41[6] = (uint64_t)begin_node[6].__value_.__left_;
                        *(_OWORD *)v42 = v43;
                      }
                      v41[7] = 0;
                      sub_100046C38(p_usagePerDomain, v72, v40, v41);
                    }
                    uint64_t v44 = v41[7];
                    *(_DWORD *)v73 = 136315394;
                    *(void *)&v73[4] = v39;
                    __int16 v74 = 2048;
                    uint64_t v75 = v44;
                    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, ">> %s uses %llu bytes.", v73, 0x16u);
                    v9 = v55;
                    v28 = v38;
                    v32 = v37;
                    uint64_t v17 = v36;
                    uint64_t v4 = v35;
                  }
                  *(void *)v73 = 0;
                  xpc_object_t v45 = xpc_dictionary_create(0, 0, 0);
                  xpc_object_t v46 = v45;
                  if (v45)
                  {
                    *(void *)v73 = v45;
                  }
                  else
                  {
                    xpc_object_t v46 = xpc_null_create();
                    *(void *)v73 = v46;
                    if (!v46)
                    {
                      xpc_object_t v47 = xpc_null_create();
                      xpc_object_t v46 = 0;
                      goto LABEL_65;
                    }
                  }
                  if (xpc_get_type(v46) != (xpc_type_t)&_xpc_type_dictionary)
                  {
                    xpc_object_t v47 = xpc_null_create();
LABEL_65:
                    *(void *)v73 = v47;
                    goto LABEL_66;
                  }
                  xpc_retain(v46);
LABEL_66:
                  xpc_release(v46);
                  if (SHIBYTE(begin_node[6].__value_.__left_) < 0) {
                    v33 = *(const char **)v33;
                  }
                  xpc_object_t v67 = xpc_string_create(v33);
                  if (!v67) {
                    xpc_object_t v67 = xpc_null_create();
                  }
                  *(void *)buf = v73;
                  *(void *)&uint8_t buf[8] = v32;
                  sub_100035E70((uint64_t)buf, &v67, &object);
                  xpc_release(object);
                  xpc_object_t object = 0;
                  xpc_release(v67);
                  xpc_object_t v67 = 0;
                  xpc_object_t v65 = xpc_uint64_create((uint64_t)begin_node[7].__value_.__left_);
                  if (!v65) {
                    xpc_object_t v65 = xpc_null_create();
                  }
                  *(void *)buf = v73;
                  *(void *)&uint8_t buf[8] = "totalBytes";
                  sub_100035E70((uint64_t)buf, &v65, &v66);
                  xpc_release(v66);
                  xpc_object_t v66 = 0;
                  xpc_release(v65);
                  xpc_object_t v65 = 0;
                  v48 = (const char *)&v4->OCSharedLoggable_opaque[*((int *)v28 + 572)];
                  if (v48[23] < 0) {
                    v48 = *(const char **)v48;
                  }
                  xpc_object_t v63 = xpc_string_create(v48);
                  if (!v63) {
                    xpc_object_t v63 = xpc_null_create();
                  }
                  *(void *)buf = v73;
                  *(void *)&uint8_t buf[8] = "carrierName";
                  sub_100035E70((uint64_t)buf, &v63, &v64);
                  xpc_release(v64);
                  xpc_object_t v64 = 0;
                  xpc_release(v63);
                  xpc_object_t v63 = 0;
                  if (v71 >= 0) {
                    v49 = (const char *)&__p;
                  }
                  else {
                    v49 = (const char *)__p;
                  }
                  xpc_object_t v61 = xpc_string_create(v49);
                  if (!v61) {
                    xpc_object_t v61 = xpc_null_create();
                  }
                  *(void *)buf = v73;
                  *(void *)&uint8_t buf[8] = "transportType";
                  sub_100035E70((uint64_t)buf, &v61, &v62);
                  xpc_release(v62);
                  xpc_object_t v62 = 0;
                  xpc_release(v61);
                  xpc_object_t v61 = 0;
                  xpc_object_t v59 = xpc_string_create("jasmine");
                  if (!v59) {
                    xpc_object_t v59 = xpc_null_create();
                  }
                  *(void *)buf = v73;
                  *(void *)&uint8_t buf[8] = "flowType";
                  sub_100035E70((uint64_t)buf, &v59, &v60);
                  xpc_release(v60);
                  xpc_object_t v60 = 0;
                  xpc_release(v59);
                  xpc_object_t v58 = *(xpc_object_t *)v73;
                  xpc_object_t v59 = 0;
                  if (*(void *)v73) {
                    xpc_retain(*(xpc_object_t *)v73);
                  }
                  else {
                    xpc_object_t v58 = xpc_null_create();
                  }
                  (*(void (**)(uint64_t, const char *, xpc_object_t *))(*(void *)v17 + 16))(v17, "commCenterPurchasePageDataUsage", &v58);
                  xpc_release(v58);
                  xpc_object_t v58 = 0;
                  xpc_release(*(xpc_object_t *)v73);
                  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, unsigned long long>, void *>>> *)begin_node[1].__value_.__left_;
                  if (left)
                  {
                    do
                    {
                      v51 = left;
                      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, unsigned long long>, void *>>> *)left->__value_.__left_;
                    }
                    while (left);
                  }
                  else
                  {
                    do
                    {
                      v51 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, unsigned long long>, void *>>> *)begin_node[2].__value_.__left_;
                      BOOL v52 = v51->__value_.__left_ == begin_node;
                      begin_node = v51;
                    }
                    while (!v52);
                  }
                  begin_node = v51;
                }
                while (v51 != p_pair1);
              }
              if (SHIBYTE(v71) < 0) {
                operator delete(__p);
              }
              goto LABEL_94;
            }
            if (SHIBYTE(v71) < 0)
            {
              uint64_t v70 = 9;
              v23 = __p;
              dispatch_object_t v22 = (uint64_t *)((char *)__p + 9);
            }
            else
            {
              dispatch_object_t v22 = (uint64_t *)((char *)&v70 + 1);
              HIBYTE(v71) = 9;
              v23 = &__p;
            }
            v23[8] = 112;
            uint64_t v26 = *(void *)"bootstrap";
          }
          *(void *)v23 = v26;
        }
        *(unsigned char *)dispatch_object_t v22 = 0;
        goto LABEL_41;
      }
    }
    else
    {
      v9 = 0;
    }
    [(NetworkMonitorWrapper *)v4 getLogContext];
    v21 = *(NSObject **)&buf[8];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "invalid Registry", buf, 2u);
    }
    goto LABEL_16;
  }
  [(NetworkMonitorWrapper *)v4 getLogContext];
  objc_super v20 = *(NSObject **)&buf[8];
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "unfortuanately, data usage is not captured in this session", buf, 2u);
  }
}

- (void)statsManager:(id)a3 didReceiveNWSnapshot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 domainName];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    if ([v9 deltaRxBytes])
    {
      interests = self->interests;
      id v11 = [v9 attributedEntity];
      uint64_t v12 = [(NSDictionary *)interests objectForKey:v11];

      if (v12)
      {
        v13 = [v9 processName];
        unsigned __int8 v14 = [v12 containsObject:v13];

        if (v14)
        {
          [(NetworkMonitorWrapper *)self getLogContext];
          unsigned int v15 = *(NSObject **)&buf[8];
          ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = [v9 attributedEntity];
            uint64_t v17 = [v9 processName];
            id v18 = [v9 deltaRxBytes];
            *(_DWORD *)buf = 138413058;
            *(void *)&buf[4] = v16;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v17;
            __int16 v31 = 2112;
            v32 = v8;
            __int16 v33 = 2048;
            id v34 = v18;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@:%@:%@ uses %llu", buf, 0x2Au);
          }
          id v19 = v8;
          sub_100058DB0(buf, (char *)[v19 UTF8String]);
          p_usagePerDomain = &self->usagePerDomain;
          p_pair1 = &p_usagePerDomain->__tree_.__pair1_;
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, unsigned long long>, void *>>> *)p_usagePerDomain->__tree_.__pair1_.__value_.__left_;
          if (!left) {
            goto LABEL_17;
          }
          v23 = &p_usagePerDomain->__tree_.__pair1_;
          do
          {
            char v24 = sub_100046FE8(&left[4].__value_.__left_, (void **)buf);
            if (v24 >= 0) {
              v25 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, unsigned long long>, void *>>> **)left;
            }
            else {
              v25 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, unsigned long long>, void *>>> **)&left[1];
            }
            if (v24 >= 0) {
              v23 = left;
            }
            left = *v25;
          }
          while (*v25);
          if (v23 == p_pair1 || (sub_100046FE8(buf, &v23[4].__value_.__left_) & 0x80) != 0) {
LABEL_17:
          }
            v23 = &p_usagePerDomain->__tree_.__pair1_;
          if (SHIBYTE(v31) < 0) {
            operator delete(*(void **)buf);
          }
          if (p_pair1 == v23)
          {
            id v28 = [v9 deltaRxBytes];
            sub_100058DB0(buf, (char *)[v19 UTF8String]);
            v29 = buf;
            *((void *)sub_1007B8270((uint64_t **)p_usagePerDomain, (void **)buf, &v29) + 7) = v28;
          }
          else
          {
            id v26 = [v9 deltaRxBytes];
            sub_100058DB0(buf, (char *)[v19 UTF8String]);
            v29 = buf;
            v27 = sub_1007B8270((uint64_t **)p_usagePerDomain, (void **)buf, &v29);
            *((void *)v27 + 7) += v26;
          }
          if (SHIBYTE(v31) < 0) {
            operator delete(*(void **)buf);
          }
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  int v3 = (std::__shared_weak_count *)*((void *)&self->domainName.__r_.__value_.var0.var1 + 2);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  if (self->domainName.__r_.__value_.var0.var0.__data_[7] < 0) {
    operator delete(*(void **)&self->carrierName.__r_.var0);
  }
  if (*((char *)&self->carrierName.__r_.__value_.var0.var1 + 23) < 0) {
    operator delete(self->carrierName.__r_.__value_.var0.var1.__data_);
  }
  sub_10005CD2C((uint64_t)&self->usagePerDomain, (char *)self->usagePerDomain.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->interests, 0);

  objc_storeStrong((id *)&self->mgr, 0);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 3) = (char *)self + 32;
  *(_OWORD *)((char *)self + 56) = 0uLL;
  *((void *)self + 6) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 9) = 0;
  *((_OWORD *)self + 6) = 0uLL;
  return self;
}

@end