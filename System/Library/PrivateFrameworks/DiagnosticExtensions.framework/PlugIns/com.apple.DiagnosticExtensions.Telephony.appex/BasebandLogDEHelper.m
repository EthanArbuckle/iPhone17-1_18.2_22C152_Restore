@interface BasebandLogDEHelper
- (BOOL)checkBasebandBootStateAndReset;
- (BOOL)checkBasebandOperatingModeAndSet;
- (BOOL)checkifBasebandTraceEnabled;
- (BOOL)checkifDefaultBasebandProfileInstalled;
- (BOOL)disableBasebandLog;
- (BOOL)enableBasebandLog:(id)a3;
- (BOOL)installDELoggingProfile;
- (BOOL)isCompressionModeOff;
- (BOOL)triggerBasebandBlindScanning;
- (BOOL)triggerBasebandDiagnostics;
- (BOOL)uninstallDELoggingProfile;
- (BOOL)updateTraceProperties:(array)a3;
- (BasebandLogDEHelper)init;
- (id).cxx_construct;
- (id)collectAttachments:(id)a3;
- (id)dumpLogWithBasebandReset:(id)a3 :(id)a4;
- (id)dumpTelephonyLogs:(id)a3 :(BOOL)a4 :(id)a5;
- (id)previousDumpTimestamp:(id)a3;
- (unsigned)getAgeLimitForAttachment;
- (unsigned)getBasebandLogHistorySize;
- (void)dealloc;
- (void)start;
- (void)stop;
@end

@implementation BasebandLogDEHelper

- (BasebandLogDEHelper)init
{
  v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v4 = (dispatch_object_s *)dispatch_queue_create("BasebandLog.DEHelper.queue", v3);
  fObj = self->fQueue.fObj.fObj;
  self->fQueue.fObj.fObj = v4;
  if (fObj) {
    dispatch_release(fObj);
  }
  v6 = (const void *)abm::helper::kBasebandLogDEHelperName;
  size_t v7 = strlen(abm::helper::kBasebandLogDEHelperName);
  if (v7 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100006DCC();
  }
  v8 = (void *)v7;
  if (v7 >= 0x17)
  {
    uint64_t v10 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17) {
      uint64_t v10 = v7 | 7;
    }
    uint64_t v11 = v10 + 1;
    v9 = (void **)operator new(v10 + 1);
    __dst[1] = v8;
    unint64_t v23 = v11 | 0x8000000000000000;
    __dst[0] = v9;
  }
  else
  {
    HIBYTE(v23) = v7;
    v9 = __dst;
    if (!v7) {
      goto LABEL_11;
    }
  }
  memmove(v9, v6, (size_t)v8);
LABEL_11:
  *((unsigned char *)v8 + (void)v9) = 0;
  abm::client::CreateManager();
  shared_ptr<abm::client::Manager> v12 = v24;
  shared_ptr<abm::client::Manager> v24 = (shared_ptr<abm::client::Manager>)0;
  cntrl = self->fManager.__cntrl_;
  self->fManager = v12;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  v14 = (std::__shared_weak_count *)v24.__cntrl_;
  if (!v24.__cntrl_ || atomic_fetch_add((atomic_ullong *volatile)v24.__cntrl_ + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    if ((SHIBYTE(v23) & 0x80000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
  std::__shared_weak_count::__release_weak(v14);
  if (SHIBYTE(v23) < 0) {
LABEL_17:
  }
    operator delete(__dst[0]);
LABEL_18:
  v15 = (char *)dispatch_group_create();
  gr_name = self->fGroupLogDump.gr_name;
  self->fGroupLogDump.gr_name = v15;
  if (gr_name) {
    dispatch_release((dispatch_object_t)gr_name);
  }
  v17 = (char *)dispatch_group_create();
  gr_passwd = self->fGroupLogDump.gr_passwd;
  self->fGroupLogDump.gr_passwd = v17;
  if (gr_passwd) {
    dispatch_release((dispatch_object_t)gr_passwd);
  }
  v19 = *(NSObject **)&self->fGroupLogDump.gr_gid;
  *(void *)&self->fGroupLogDump.gr_gid = 0;
  if (v19)
  {
    dispatch_group_leave(v19);
    dispatch_release(v19);
  }
  gr_mem = self->fGroupLogDump.gr_mem;
  self->fGroupLogDump.gr_mem = 0;
  if (gr_mem)
  {
    dispatch_group_leave((dispatch_group_t)gr_mem);
    dispatch_release((dispatch_object_t)gr_mem);
  }
  LOBYTE(self->fGroupUpdate.gr_mem) = 8;
  return self;
}

- (void)start
{
  if (self->fManager.__ptr_)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    cntrl = self->fManager.__cntrl_;
    ptr = self->fManager.__ptr_;
    v35 = cntrl;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    v4 = (const void *)abm::kEventTracePostProcessingEnd;
    size_t v5 = strlen(abm::kEventTracePostProcessingEnd);
    if (v5 > 0x7FFFFFFFFFFFFFF7) {
      sub_100006DCC();
    }
    size_t v6 = v5;
    if (v5 >= 0x17)
    {
      uint64_t v9 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v5 | 7) != 0x17) {
        uint64_t v9 = v5 | 7;
      }
      uint64_t v10 = v9 + 1;
      size_t v7 = operator new(v9 + 1);
      size_t v32 = v6;
      unint64_t v33 = v10 | 0x8000000000000000;
      *(void *)buf = v7;
    }
    else
    {
      HIBYTE(v33) = v5;
      size_t v7 = buf;
      if (!v5)
      {
LABEL_14:
        v7[v6] = 0;
        v26 = _NSConcreteStackBlock;
        uint64_t v27 = 3221225472;
        v28 = sub_10002086C;
        v29 = &unk_100031100;
        objc_copyWeak(&v30, &location);
        abm::client::RegisterEventHandler();
        if (SHIBYTE(v33) < 0) {
          operator delete(*(void **)buf);
        }
        uint64_t v11 = (std::__shared_weak_count *)v35;
        if (v35 && !atomic_fetch_add((atomic_ullong *volatile)v35 + 1, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
        shared_ptr<abm::client::Manager> v12 = self->fManager.__cntrl_;
        v24[1] = self->fManager.__ptr_;
        v25 = v12;
        if (v12) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)v12 + 1, 1uLL, memory_order_relaxed);
        }
        v13 = (const void *)abm::kEventBasebandOperatingModeChange;
        size_t v14 = strlen(abm::kEventBasebandOperatingModeChange);
        if (v14 > 0x7FFFFFFFFFFFFFF7) {
          sub_100006DCC();
        }
        size_t v15 = v14;
        if (v14 >= 0x17)
        {
          uint64_t v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v14 | 7) != 0x17) {
            uint64_t v17 = v14 | 7;
          }
          uint64_t v18 = v17 + 1;
          v16 = operator new(v17 + 1);
          size_t v32 = v15;
          unint64_t v33 = v18 | 0x8000000000000000;
          *(void *)buf = v16;
        }
        else
        {
          HIBYTE(v33) = v14;
          v16 = buf;
          if (!v14) {
            goto LABEL_29;
          }
        }
        memmove(v16, v13, v15);
LABEL_29:
        *((unsigned char *)v16 + v15) = 0;
        objc_copyWeak(v24, &location);
        abm::client::RegisterEventHandler();
        if (SHIBYTE(v33) < 0) {
          operator delete(*(void **)buf);
        }
        v19 = (std::__shared_weak_count *)v25;
        if (v25 && !atomic_fetch_add((atomic_ullong *volatile)v25 + 1, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
          std::__shared_weak_count::__release_weak(v19);
        }
        v20 = self->fManager.__cntrl_;
        unint64_t v23 = (std::__shared_weak_count *)v20;
        if (v20) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)v20 + 1, 1uLL, memory_order_relaxed);
        }
        abm::client::EventsOff();
        if (v23 && !atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
          std::__shared_weak_count::__release_weak(v23);
        }
        v21 = self->fManager.__cntrl_;
        v22 = (std::__shared_weak_count *)v21;
        if (v21) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)v21 + 1, 1uLL, memory_order_relaxed);
        }
        abm::client::EventsOn();
        if (v22)
        {
          if (!atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
            std::__shared_weak_count::__release_weak(v22);
          }
        }
        objc_destroyWeak(v24);
        objc_destroyWeak(&v30);
        objc_destroyWeak(&location);
        return;
      }
    }
    memmove(v7, v4, v6);
    goto LABEL_14;
  }
  v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_ERROR, "Invalid manager", buf, 2u);
  }
}

- (void)stop
{
  cntrl = self->fManager.__cntrl_;
  v3 = (std::__shared_weak_count *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  abm::client::EventsOff();
  if (v3)
  {
    if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

- (void)dealloc
{
  cntrl = self->fManager.__cntrl_;
  self->fManager.__ptr_ = 0;
  self->fManager.__cntrl_ = 0;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  v4 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_DEFAULT, "BasebandLogDEHelper dealloc", buf, 2u);
  }
  v5.receiver = self;
  v5.super_class = (Class)BasebandLogDEHelper;
  [(BasebandLogDEHelper *)&v5 dealloc];
}

- (id)previousDumpTimestamp:(id)a3
{
  id v4 = a3;
  objc_super v5 = (const char *)[(BasebandLogDEHelper *)self getAgeLimitForAttachment];
  memset(__p, 170, sizeof(__p));
  size_t v6 = (util *)abm::trace::kSnapshotFolder;
  size_t v7 = (const char *)abm::trace::kLogDirPrefix;
  id v8 = v4;
  util::findLastLogDumpTimestamp(v6, v7, v5, 1, (char *)[v8 UTF8String], __p);
  if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
  {
    if (!HIBYTE(__p[2]))
    {
      uint64_t v10 = 0;
      goto LABEL_11;
    }
    uint64_t v9 = __p;
    goto LABEL_6;
  }
  if (__p[1])
  {
    uint64_t v9 = (void **)__p[0];
LABEL_6:
    uint64_t v10 = +[NSString stringWithUTF8String:v9];
    if ((SHIBYTE(__p[2]) & 0x80000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v10 = 0;
LABEL_10:
  operator delete(__p[0]);
LABEL_11:

  return v10;
}

- (id)collectAttachments:(id)a3
{
  id v4 = a3;
  v101 = v4;
  id v104 = objc_alloc_init((Class)NSMutableArray);
  __p = 0;
  long long v107 = 0uLL;
  if ([v4 isEqualToString:@"BasebandSnapshotFolder"])
  {
    if (SHIBYTE(v107) < 0)
    {
      *(void *)&long long v107 = 2;
      p_p = (char *)__p;
    }
    else
    {
      HIBYTE(v107) = 2;
      p_p = (char *)&__p;
    }
    strcpy(p_p, ".*");
    goto LABEL_109;
  }
  if (![v4 isEqualToString:@"Crash"])
  {
    if ([v4 isEqualToString:@"basebandLogLastDumped"])
    {
      shared_ptr<abm::client::Manager> v12 = (const char *)[(BasebandLogDEHelper *)self getAgeLimitForAttachment];
      int v13 = (int)v12;
      memset(&v120, 170, 24);
      util::findLastLogDumpTimestamp(abm::trace::kSnapshotFolder, abm::trace::kLogDirPrefix, v12, 1, 0, (void **)&v120);
      if ((v120.st_gid & 0x80000000) == 0) {
        __darwin_ino64_t st_gid_high = HIBYTE(v120.st_gid);
      }
      else {
        __darwin_ino64_t st_gid_high = v120.st_ino;
      }
      if (!st_gid_high)
      {
        v59 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
        if (os_log_type_enabled((os_log_t)v59, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v116 = 67109120;
          *(_DWORD *)&v116[4] = v13;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v59, OS_LOG_TYPE_DEFAULT, "Finding the last dumped log: No log found in last %d sec", v116, 8u);
        }
        goto LABEL_103;
      }
      *((unsigned char *)&v109.__r_.__value_.__s + 23) = 2;
      strcpy((char *)&v109, ".*");
      if ((v120.st_gid & 0x80000000) == 0) {
        size_t v15 = &v120;
      }
      else {
        size_t v15 = *(stat **)&v120.st_dev;
      }
      v16 = std::string::append(&v109, (const std::string::value_type *)v15, st_gid_high);
      long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
      *(void *)&v116[16] = *((void *)&v16->__r_.__value_.__l + 2);
      *(_OWORD *)v116 = v17;
      v16->__r_.__value_.__l.__size_ = 0;
      v16->__r_.__value_.__r.__words[2] = 0;
      v16->__r_.__value_.__r.__words[0] = 0;
      HIBYTE(v119) = 2;
      strcpy((char *)&__s, ".*");
      uint64_t v18 = std::string::append((std::string *)v116, (const std::string::value_type *)&__s, 2uLL);
      v19 = (void *)v18->__r_.__value_.__r.__words[0];
      *(void *)&long long __dst = v18->__r_.__value_.__l.__size_;
      *(void *)((char *)&__dst + 7) = *(std::string::size_type *)((char *)&v18->__r_.__value_.__r.__words[1] + 7);
      char v20 = HIBYTE(v18->__r_.__value_.__r.__words[2]);
      v18->__r_.__value_.__l.__size_ = 0;
      v18->__r_.__value_.__r.__words[2] = 0;
      v18->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v107) < 0) {
        operator delete(__p);
      }
      __p = v19;
      *(void *)&long long v107 = __dst;
      *(void *)((char *)&v107 + 7) = *(void *)((char *)&__dst + 7);
      HIBYTE(v107) = v20;
      if (SHIBYTE(v119) < 0)
      {
        operator delete((void *)__s);
        if ((v116[23] & 0x80000000) == 0)
        {
LABEL_22:
          if (SHIBYTE(v109.__r_.__value_.__r.__words[2]) < 0) {
            goto LABEL_102;
          }
          goto LABEL_103;
        }
      }
      else if ((v116[23] & 0x80000000) == 0)
      {
        goto LABEL_22;
      }
      operator delete(*(void **)v116);
      if (SHIBYTE(v109.__r_.__value_.__r.__words[2]) < 0) {
LABEL_102:
      }
        operator delete(v109.__r_.__value_.__l.__data_);
LABEL_103:
      if ((SHIBYTE(v120.st_gid) & 0x80000000) == 0) {
        goto LABEL_109;
      }
      v60 = *(void **)&v120.st_dev;
      goto LABEL_108;
    }
    if (![v4 length]) {
      goto LABEL_109;
    }
    v116[23] = 2;
    strcpy(v116, ".*");
    v21 = (const char *)[v4 UTF8String];
    std::string::size_type v22 = strlen(v21);
    unint64_t v23 = std::string::append((std::string *)v116, v21, v22);
    long long v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
    *(void *)&v120.st_uid = *((void *)&v23->__r_.__value_.__l + 2);
    *(_OWORD *)&v120.st_dev = v24;
    v23->__r_.__value_.__l.__size_ = 0;
    v23->__r_.__value_.__r.__words[2] = 0;
    v23->__r_.__value_.__r.__words[0] = 0;
    *((unsigned char *)&v109.__r_.__value_.__s + 23) = 2;
    strcpy((char *)&v109, ".*");
    v25 = std::string::append((std::string *)&v120, (const std::string::value_type *)&v109, 2uLL);
    v26 = (void *)v25->__r_.__value_.__r.__words[0];
    *(void *)&long long __s = v25->__r_.__value_.__l.__size_;
    *(void *)((char *)&__s + 7) = *(std::string::size_type *)((char *)&v25->__r_.__value_.__r.__words[1] + 7);
    char v27 = HIBYTE(v25->__r_.__value_.__r.__words[2]);
    v25->__r_.__value_.__l.__size_ = 0;
    v25->__r_.__value_.__r.__words[2] = 0;
    v25->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v107) < 0) {
      operator delete(__p);
    }
    __p = v26;
    *(void *)&long long v107 = __s;
    *(void *)((char *)&v107 + 7) = *(void *)((char *)&__s + 7);
    HIBYTE(v107) = v27;
    if (SHIBYTE(v109.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v109.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v120.st_gid) & 0x80000000) == 0)
      {
LABEL_31:
        if ((v116[23] & 0x80000000) == 0) {
          goto LABEL_109;
        }
LABEL_107:
        v60 = *(void **)v116;
LABEL_108:
        operator delete(v60);
        goto LABEL_109;
      }
    }
    else if ((SHIBYTE(v120.st_gid) & 0x80000000) == 0)
    {
      goto LABEL_31;
    }
    operator delete(*(void **)&v120.st_dev);
    if ((v116[23] & 0x80000000) == 0) {
      goto LABEL_109;
    }
    goto LABEL_107;
  }
  size_t v6 = (const char *)abm::trace::kMobileCrashReporterFolder;
  xpc_object_t xarray = v104;
  long long __s = 0uLL;
  uint64_t v119 = 0;
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v116[32] = v7;
  long long v117 = v7;
  *(_OWORD *)v116 = v7;
  *(_OWORD *)&v116[16] = v7;
  sub_1000074D4((uint64_t)v116, "CommCenter-.*ips.*", 0);
  id v8 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (!os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG))
  {
    size_t v9 = strlen(v6);
    if (v9 <= 0x7FFFFFFFFFFFFFF7) {
      goto LABEL_7;
    }
LABEL_177:
    sub_100006DCC();
  }
  v120.st_dev = 136315650;
  *(void *)&v120.st_mode = v6;
  WORD2(v120.st_ino) = 2080;
  *(__darwin_ino64_t *)((char *)&v120.st_ino + 6) = (__darwin_ino64_t)"CommCenter-.*ips.*";
  HIWORD(v120.st_gid) = 1024;
  v120.st_rdev = 3;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_DEBUG, "search files and attach: basedir [%s], pattern [%s], maxAttachments [%d]", (uint8_t *)&v120, 0x1Cu);
  size_t v9 = strlen(v6);
  if (v9 > 0x7FFFFFFFFFFFFFF7) {
    goto LABEL_177;
  }
LABEL_7:
  size_t v10 = v9;
  if (v9 >= 0x17)
  {
    uint64_t v28 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17) {
      uint64_t v28 = v9 | 7;
    }
    uint64_t v29 = v28 + 1;
    p_dst = (long long *)operator new(v28 + 1);
    *((void *)&__dst + 1) = v10;
    unint64_t v115 = v29 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
    goto LABEL_36;
  }
  HIBYTE(v115) = v9;
  p_dst = &__dst;
  if (v9) {
LABEL_36:
  }
    memcpy(p_dst, v6, v10);
  *((unsigned char *)p_dst + v10) = 0;
  std::locale::locale((std::locale *)&v109, (const std::locale *)v116);
  *(_OWORD *)&v109.__r_.__value_.__r.__words[1] = *(_OWORD *)&v116[8];
  long long v110 = *(_OWORD *)&v116[24];
  uint64_t v111 = *(void *)&v116[40];
  v112 = (std::__shared_weak_count *)v117;
  if ((void)v117) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v117 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v113 = *((void *)&v117 + 1);
  BOOL v30 = sub_100006658((const char *)&__dst, (uint64_t)&v109, (uint64_t)&__s, 0);
  v31 = v112;
  if (v112 && !atomic_fetch_add(&v112->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
    std::__shared_weak_count::__release_weak(v31);
    std::locale::~locale((std::locale *)&v109);
    if ((SHIBYTE(v115) & 0x80000000) == 0)
    {
LABEL_42:
      if (v30) {
        goto LABEL_43;
      }
LABEL_84:
      v54 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_DEFAULT))
      {
        v120.st_dev = 136315394;
        *(void *)&v120.st_mode = v6;
        WORD2(v120.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&v120.st_ino + 6) = (__darwin_ino64_t)"CommCenter-.*ips.*";
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v54, OS_LOG_TYPE_DEFAULT, "No file found: dir [%s] pattern [%s]", (uint8_t *)&v120, 0x16u);
      }
      goto LABEL_86;
    }
  }
  else
  {
    std::locale::~locale((std::locale *)&v109);
    if ((SHIBYTE(v115) & 0x80000000) == 0) {
      goto LABEL_42;
    }
  }
  operator delete((void *)__dst);
  if (!v30) {
    goto LABEL_84;
  }
LABEL_43:
  unint64_t v32 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&__s + 1) - __s) >> 3));
  if (*((void *)&__s + 1) == (void)__s) {
    uint64_t v33 = 0;
  }
  else {
    uint64_t v33 = v32;
  }
  sub_10001CA38(__s, *((const void ***)&__s + 1), (uint64_t)&v120, v33, 1);
  uint64_t v34 = __s;
  if ((void)__s != *((void *)&__s + 1))
  {
    unsigned int v35 = 0;
    while (1)
    {
      memset(v108, 170, sizeof(v108));
      size_t v36 = strlen(v6);
      if (v36 > 0x7FFFFFFFFFFFFFF7) {
        sub_100006DCC();
      }
      __darwin_ino64_t v37 = v36;
      if (v36 >= 0x17)
      {
        uint64_t v39 = (v36 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v36 | 7) != 0x17) {
          uint64_t v39 = v36 | 7;
        }
        uint64_t v40 = v39 + 1;
        v38 = operator new(v39 + 1);
        v120.st_ino = v37;
        *(void *)&v120.st_uid = v40 | 0x8000000000000000;
        *(void *)&v120.st_dev = v38;
      }
      else
      {
        HIBYTE(v120.st_gid) = v36;
        v38 = &v120;
        if (!v36) {
          goto LABEL_56;
        }
      }
      memcpy(v38, v6, v37);
LABEL_56:
      *((unsigned char *)v38 + v37) = 0;
      int v41 = *(char *)(v34 + 23);
      if (v41 >= 0) {
        v42 = (const std::string::value_type *)v34;
      }
      else {
        v42 = *(const std::string::value_type **)v34;
      }
      if (v41 >= 0) {
        std::string::size_type v43 = *(unsigned __int8 *)(v34 + 23);
      }
      else {
        std::string::size_type v43 = *(void *)(v34 + 8);
      }
      v44 = std::string::append((std::string *)&v120, v42, v43);
      long long v45 = *(_OWORD *)&v44->__r_.__value_.__l.__data_;
      v108[2] = (void *)v44->__r_.__value_.__r.__words[2];
      *(_OWORD *)v108 = v45;
      v44->__r_.__value_.__l.__size_ = 0;
      v44->__r_.__value_.__r.__words[2] = 0;
      v44->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v120.st_gid) < 0) {
        operator delete(*(void **)&v120.st_dev);
      }
      v46.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v46.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      *(timespec *)&v120.st_blksize = v46;
      *(timespec *)v120.st_qspare = v46;
      v120.st_birthtimespec = v46;
      *(timespec *)&v120.st_size = v46;
      v120.st_mtimespec = v46;
      v120.st_ctimespec = v46;
      *(timespec *)&v120.st_uid = v46;
      v120.st_atimespec = v46;
      *(timespec *)&v120.st_dev = v46;
      if (SHIBYTE(v108[2]) >= 0) {
        v47 = v108;
      }
      else {
        v47 = (void **)v108[0];
      }
      if (!stat((const char *)v47, &v120))
      {
        v48 = SHIBYTE(v108[2]) >= 0 ? (const char *)v108 : (const char *)v108[0];
        v49 = opendir(v48);
        v50 = v49;
        if (v49)
        {
          readdir(v49);
          closedir(v50);
        }
      }
      if (SHIBYTE(v108[2]) >= 0) {
        v51 = v108;
      }
      else {
        v51 = (void **)v108[0];
      }
      v52 = +[NSString stringWithFormat:@"%s", v51, v101];
      [xarray addObject:v52];

      if (SHIBYTE(v108[2]) < 0) {
        operator delete(v108[0]);
      }
      v34 += 24;
      if (v34 != *((void *)&__s + 1) && v35++ < 2) {
        continue;
      }
      break;
    }
  }
LABEL_86:
  v55 = (std::__shared_weak_count *)v117;
  if ((void)v117 && !atomic_fetch_add((atomic_ullong *volatile)(v117 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
    std::__shared_weak_count::__release_weak(v55);
  }
  std::locale::~locale((std::locale *)v116);
  uint64_t v56 = __s;
  if ((void)__s)
  {
    uint64_t v57 = *((void *)&__s + 1);
    v58 = (void *)__s;
    if (*((void *)&__s + 1) != (void)__s)
    {
      do
      {
        if (*(char *)(v57 - 1) < 0) {
          operator delete(*(void **)(v57 - 24));
        }
        v57 -= 24;
      }
      while (v57 != v56);
      v58 = (void *)__s;
    }
    *((void *)&__s + 1) = v56;
    operator delete(v58);
  }

LABEL_109:
  uint64_t v61 = HIBYTE(v107);
  char v62 = HIBYTE(v107);
  if (v107 < 0) {
    uint64_t v61 = v107;
  }
  if (v61)
  {
    *(void *)&long long __dst = 0xAAAAAAAAAAAAAAAALL;
    xpc_object_t v63 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t v64 = v63;
    if (v63)
    {
      *(void *)&long long __dst = v63;
    }
    else
    {
      xpc_object_t v64 = xpc_null_create();
      *(void *)&long long __dst = v64;
      if (!v64)
      {
        xpc_object_t v65 = xpc_null_create();
        xpc_object_t v64 = 0;
        goto LABEL_119;
      }
    }
    if (xpc_get_type(v64) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v64);
      goto LABEL_120;
    }
    xpc_object_t v65 = xpc_null_create();
LABEL_119:
    *(void *)&long long __dst = v65;
LABEL_120:
    xpc_release(v64);
    v109.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
    v109.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
    abm::HelperClient::create();
    if (!v109.__r_.__value_.__r.__words[0])
    {
LABEL_156:
      size = (std::__shared_weak_count *)v109.__r_.__value_.__l.__size_;
      if (v109.__r_.__value_.__l.__size_
        && !atomic_fetch_add((atomic_ullong *volatile)(v109.__r_.__value_.__l.__size_ + 8), 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
        std::__shared_weak_count::__release_weak(size);
      }
      xpc_release((xpc_object_t)__dst);
      char v62 = HIBYTE(v107);
      goto LABEL_160;
    }
    xpc_object_t v66 = xpc_dictionary_create(0, 0, 0);
    if (v66 || (xpc_object_t v66 = xpc_null_create()) != 0)
    {
      if (xpc_get_type(v66) == (xpc_type_t)&_xpc_type_dictionary)
      {
        xpc_retain(v66);
        xpc_object_t v67 = v66;
      }
      else
      {
        xpc_object_t v67 = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t v67 = xpc_null_create();
      xpc_object_t v66 = 0;
    }
    xpc_release(v66);
    xpc_object_t v68 = xpc_array_create(0, 0);
    if (v68 || (xpc_object_t v68 = xpc_null_create()) != 0)
    {
      if (xpc_get_type(v68) == (xpc_type_t)&_xpc_type_array)
      {
        xpc_retain(v68);
        xpc_object_t xarraya = v68;
      }
      else
      {
        xpc_object_t xarraya = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t xarraya = xpc_null_create();
      xpc_object_t v68 = 0;
    }
    xpc_release(v68);
    if (v107 >= 0) {
      v69 = (const char *)&__p;
    }
    else {
      v69 = (const char *)__p;
    }
    xpc_object_t v70 = xpc_string_create(v69);
    if (!v70) {
      xpc_object_t v70 = xpc_null_create();
    }
    xpc_array_append_value(xarraya, v70);
    xpc_release(v70);
    xpc_object_t v71 = xarraya;
    if (xarraya) {
      xpc_retain(xarraya);
    }
    else {
      xpc_object_t v71 = xpc_null_create();
    }
    xpc_dictionary_set_value(v67, abm::helper::kKeyMatchingPattern, v71);
    xpc_object_t v72 = xpc_null_create();
    xpc_release(v71);
    xpc_release(v72);
    xpc_object_t v73 = xpc_BOOL_create(1);
    if (!v73) {
      xpc_object_t v73 = xpc_null_create();
    }
    xpc_dictionary_set_value(v67, abm::helper::kKeyAllowToDelete, v73);
    xpc_object_t v74 = xpc_null_create();
    xpc_release(v73);
    xpc_release(v74);
    v75 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v75, OS_LOG_TYPE_ERROR))
    {
      v78 = &__p;
      if (v107 < 0) {
        v78 = __p;
      }
      v120.st_dev = 136315138;
      *(void *)&v120.st_mode = v78;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v75, OS_LOG_TYPE_ERROR, "Getting baseband snapshot logs with [%s]", (uint8_t *)&v120, 0xCu);
      *(void *)&long long v79 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v79 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&v120.st_dev = v79;
      *(_OWORD *)&v120.st_uid = v79;
      xpc_object_t object = v67;
      if (v67) {
        goto LABEL_145;
      }
    }
    else
    {
      *(void *)&long long v76 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v76 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&v120.st_dev = v76;
      *(_OWORD *)&v120.st_uid = v76;
      xpc_object_t object = v67;
      if (v67)
      {
LABEL_145:
        xpc_retain(v67);
        v77 = xarraya;
LABEL_150:
        abm::HelperClient::perform();
        xpc_release(object);
        if (v120.st_dev || xpc_get_type((xpc_object_t)__dst) != (xpc_type_t)&_xpc_type_dictionary)
        {
          v80 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
          if (os_log_type_enabled((os_log_t)v80, OS_LOG_TYPE_ERROR))
          {
            sub_100022424(v116, (uint64_t)&v120);
            v88 = v116[23] >= 0 ? v116 : *(unsigned char **)v116;
            LODWORD(__s) = 136315138;
            *(void *)((char *)&__s + 4) = v88;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v80, OS_LOG_TYPE_ERROR, "Failed to get baseband snapshot logs: %s", (uint8_t *)&__s, 0xCu);
            if ((v116[23] & 0x80000000) != 0) {
              operator delete(*(void **)v116);
            }
          }
LABEL_153:
          if (*((char *)&v120.st_rdev + 7) < 0) {
            operator delete((void *)v120.st_ino);
          }
          xpc_release(v77);
          xpc_release(v67);
          goto LABEL_156;
        }
        xpc_object_t value = xpc_dictionary_get_value((xpc_object_t)__dst, abm::helper::kKeyFoundList);
        xpc_object_t v85 = value;
        if (value) {
          xpc_retain(value);
        }
        else {
          xpc_object_t v85 = xpc_null_create();
        }
        xpc_object_t v86 = xpc_null_create();
        if (v85 && xpc_get_type(v85) == (xpc_type_t)&_xpc_type_array)
        {
          xpc_retain(v85);
          xpc_object_t v87 = v85;
        }
        else
        {
          xpc_object_t v87 = xpc_null_create();
        }
        if (xpc_get_type(v87) != (xpc_type_t)&_xpc_type_array)
        {
          if (v86)
          {
            xpc_retain(v86);
            xpc_object_t v89 = v86;
          }
          else
          {
            xpc_object_t v89 = xpc_null_create();
          }
          xpc_release(v87);
          xpc_object_t v87 = v89;
        }
        xpc_release(v86);
        xpc_release(v85);
        if (v87)
        {
          xpc_retain(v87);
          xpc_object_t v90 = v87;
        }
        else
        {
          xpc_object_t v90 = xpc_null_create();
          if (!v90)
          {
            xpc_object_t v90 = xpc_null_create();
            v91 = 0;
            goto LABEL_188;
          }
        }
        xpc_retain(v90);
        v91 = v90;
LABEL_188:
        xpc_release(v91);
        for (size_t i = 0; ; ++i)
        {
          if (v87)
          {
            xpc_retain(v87);
            xpc_object_t v94 = v87;
          }
          else
          {
            xpc_object_t v94 = xpc_null_create();
          }
          if (xpc_get_type(v87) == (xpc_type_t)&_xpc_type_array)
          {
            size_t count = xpc_array_get_count(v87);
            if (!v94)
            {
LABEL_198:
              xpc_object_t v96 = xpc_null_create();
              goto LABEL_199;
            }
          }
          else
          {
            size_t count = 0;
            if (!v94) {
              goto LABEL_198;
            }
          }
          xpc_retain(v94);
          xpc_object_t v96 = v94;
LABEL_199:
          xpc_release(v94);
          xpc_release(v96);
          if (i == count && v90 == v96)
          {
            xpc_release(v90);
            xpc_release(v87);
            v77 = xarraya;
            goto LABEL_153;
          }
          memset(v116, 170, 24);
          xpc_object_t v97 = xpc_array_get_value(v90, i);
          *(void *)&long long __s = v97;
          if (v97) {
            xpc_retain(v97);
          }
          else {
            *(void *)&long long __s = xpc_null_create();
          }
          xpc::dyn_cast_or_default((uint64_t *)v116, (xpc *)&__s, (const object *)"", v98);
          xpc_release((xpc_object_t)__s);
          if ((v116[23] & 0x80000000) == 0)
          {
            if (!v116[23]) {
              goto LABEL_211;
            }
            v99 = v116;
LABEL_209:
            v100 = +[NSString stringWithUTF8String:v99];
            [v104 addObject:v100];

            if ((v116[23] & 0x80000000) == 0) {
              goto LABEL_211;
            }
            goto LABEL_210;
          }
          if (*(void *)&v116[8])
          {
            v99 = *(unsigned char **)v116;
            goto LABEL_209;
          }
LABEL_210:
          operator delete(*(void **)v116);
LABEL_211:
          if (v90)
          {
            xpc_retain(v90);
            xpc_object_t v93 = v90;
          }
          else
          {
            xpc_object_t v93 = xpc_null_create();
          }
          xpc_release(v93);
        }
      }
    }
    v77 = xarraya;
    xpc_object_t object = xpc_null_create();
    goto LABEL_150;
  }
LABEL_160:
  id v82 = v104;
  if (v62 < 0) {
    operator delete(__p);
  }

  return v82;
}

- (BOOL)triggerBasebandDiagnostics
{
  v3 = dispatch_group_create();
  id v4 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 67109120;
    int v12 = 30;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_DEFAULT, "Log monitor timer1 [%ds] started", (uint8_t *)&v11, 8u);
  }
  if (v3)
  {
    dispatch_retain(v3);
    dispatch_group_enter(v3);
  }
  dispatch_time_t v5 = dispatch_time(0, 30000000000);
  dispatch_group_wait(v3, v5);
  size_t v6 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "Log monitor timer1 completed", (uint8_t *)&v11, 2u);
  }
  if (v3)
  {
    dispatch_group_leave(v3);
    dispatch_release(v3);
  }
  if (![(BasebandLogDEHelper *)self checkBasebandBootStateAndReset]
    && ![(BasebandLogDEHelper *)self checkBasebandOperatingModeAndSet])
  {
    [(BasebandLogDEHelper *)self triggerBasebandBlindScanning];
  }
  long long v7 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 67109120;
    int v12 = 90;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "Log monitor timer2 [%ds] started", (uint8_t *)&v11, 8u);
  }
  if (v3)
  {
    dispatch_retain(v3);
    dispatch_group_enter(v3);
  }
  dispatch_time_t v8 = dispatch_time(0, 90000000000);
  dispatch_group_wait(v3, v8);
  size_t v9 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "Log monitor timer2 completed", (uint8_t *)&v11, 2u);
  }
  if (v3)
  {
    dispatch_group_leave(v3);
    dispatch_release(v3);
    dispatch_release(v3);
  }
  return 1;
}

- (BOOL)triggerBasebandBlindScanning
{
  v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Try baseband blind scanning", buf, 2u);
  }
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  if (v4 || (xpc_object_t v4 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v4);
      xpc_object_t v5 = v4;
    }
    else
    {
      xpc_object_t v5 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    xpc_object_t v4 = 0;
  }
  xpc_release(v4);
  xpc_object_t v6 = xpc_int64_create(5000);
  if (!v6) {
    xpc_object_t v6 = xpc_null_create();
  }
  xpc_dictionary_set_value(v5, abm::kKeyTimeout, v6);
  xpc_object_t v7 = xpc_null_create();
  xpc_release(v6);
  xpc_release(v7);
  cntrl = self->fManager.__cntrl_;
  ptr = self->fManager.__ptr_;
  unint64_t v23 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  size_t v9 = (const void *)abm::kCommandTryBlindScanning;
  size_t v10 = strlen(abm::kCommandTryBlindScanning);
  if (v10 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100006DCC();
  }
  int v11 = (void *)v10;
  if (v10 >= 0x17)
  {
    uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v13 = v10 | 7;
    }
    uint64_t v14 = v13 + 1;
    int v12 = (void **)operator new(v13 + 1);
    __dst[1] = v11;
    unint64_t v21 = v14 | 0x8000000000000000;
    __dst[0] = v12;
    goto LABEL_20;
  }
  HIBYTE(v21) = v10;
  int v12 = __dst;
  if (v10) {
LABEL_20:
  }
    memmove(v12, v9, (size_t)v11);
  *((unsigned char *)v11 + (void)v12) = 0;
  abm::client::PerformCommand();
  int v15 = *(_DWORD *)buf;
  v16 = v25;
  int v17 = v26;
  char v26 = 0;
  LOBYTE(v25) = 0;
  if (SHIBYTE(v21) < 0) {
    operator delete(__dst[0]);
  }
  uint64_t v18 = (std::__shared_weak_count *)v23;
  if (v23 && !atomic_fetch_add((atomic_ullong *volatile)v23 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
  }
  xpc_release(v5);
  if (v17 < 0) {
    operator delete(v16);
  }
  return v15 == 0;
}

- (BOOL)checkBasebandOperatingModeAndSet
{
  unint64_t v69 = 0xAAAAAAAAE020E002;
  long long __p = 0uLL;
  uint64_t v71 = 0;
  xpc_object_t object = xpc_null_create();
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if (v3 || (xpc_object_t v3 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v3);
      xpc_object_t v4 = v3;
    }
    else
    {
      xpc_object_t v4 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    xpc_object_t v3 = 0;
  }
  xpc_release(v3);
  xpc_object_t v5 = xpc_int64_create(5000);
  if (!v5) {
    xpc_object_t v5 = xpc_null_create();
  }
  xpc_object_t v6 = (const char *)abm::kKeyTimeout;
  xpc_dictionary_set_value(v4, abm::kKeyTimeout, v5);
  xpc_object_t v7 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v7);
  cntrl = self->fManager.__cntrl_;
  xpc_object_t v67 = (std::__shared_weak_count *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  size_t v9 = (const void *)abm::kCommandGetBasebandOperatingMode;
  size_t v10 = strlen(abm::kCommandGetBasebandOperatingMode);
  xpc_object_t v63 = v4;
  if (v10 > 0x7FFFFFFFFFFFFFF7) {
    sub_100006DCC();
  }
  size_t v11 = v10;
  if (v10 >= 0x17)
  {
    uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v13 = v10 | 7;
    }
    uint64_t v14 = v13 + 1;
    int v12 = operator new(v13 + 1);
    *(void *)&__dst[8] = v11;
    *(void *)&__dst[16] = v14 | 0x8000000000000000;
    *(void *)long long __dst = v12;
    goto LABEL_18;
  }
  __dst[23] = v10;
  int v12 = __dst;
  if (v10) {
LABEL_18:
  }
    memmove(v12, v9, v11);
  v12[v11] = 0;
  abm::client::PerformCommand();
  LODWORD(v69) = *(_DWORD *)buf;
  if (SHIBYTE(v71) < 0) {
    operator delete((void *)__p);
  }
  long long __p = *(_OWORD *)&buf[8];
  uint64_t v71 = *(void *)&buf[24];
  buf[31] = 0;
  uint8_t buf[8] = 0;
  if ((__dst[23] & 0x80000000) != 0) {
    operator delete(*(void **)__dst);
  }
  if (v67 && !atomic_fetch_add(&v67->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
    std::__shared_weak_count::__release_weak(v67);
    xpc_object_t v15 = object;
    if (object) {
      goto LABEL_29;
    }
  }
  else
  {
    xpc_object_t v15 = object;
    if (object) {
      goto LABEL_29;
    }
  }
  xpc_object_t v15 = xpc_null_create();
  if (!v15)
  {
    xpc_object_t v16 = xpc_null_create();
    xpc_object_t v15 = 0;
    goto LABEL_32;
  }
LABEL_29:
  if (xpc_get_type(v15) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_retain(v15);
    xpc_object_t v16 = v15;
  }
  else
  {
    xpc_object_t v16 = xpc_null_create();
  }
LABEL_32:
  xpc_release(v15);
  if (v69)
  {
    int v17 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
    {
      sub_100022424(buf, (uint64_t)&v69);
      uint64_t v18 = (buf[23] & 0x80u) == 0 ? buf : *(uint8_t **)buf;
      *(_DWORD *)long long __dst = 136315138;
      *(void *)&__dst[4] = v18;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v17, OS_LOG_TYPE_ERROR, "Getting baseband operating mode failed : %s", __dst, 0xCu);
      if ((char)buf[23] < 0) {
        operator delete(*(void **)buf);
      }
    }
    goto LABEL_40;
  }
  if (xpc_get_type(v16) != (xpc_type_t)&_xpc_type_dictionary)
  {
LABEL_40:
    char v19 = 8;
    goto LABEL_41;
  }
  xpc_object_t value = xpc_dictionary_get_value(v16, abm::kKeyBasebandOperatingMode);
  *(void *)buf = value;
  if (value) {
    xpc_retain(value);
  }
  else {
    *(void *)buf = xpc_null_create();
  }
  char v19 = xpc::dyn_cast_or_default((xpc *)buf, (const object *)8, v28);
  xpc_release(*(xpc_object_t *)buf);
LABEL_41:
  char v20 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
  {
    if (v19 > 7u) {
      unint64_t v21 = "Unknown";
    }
    else {
      unint64_t v21 = (&off_100031148)[v19];
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v21;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "Baseband operating mode: %s", buf, 0xCu);
  }
  id v22 = objc_alloc_init((Class)RadiosPreferences);
  if ([v22 airplaneMode])
  {
    unint64_t v23 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      if (v19 > 7u) {
        long long v24 = "Unknown";
      }
      else {
        long long v24 = (&off_100031148)[v19];
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v24;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_DEFAULT, "Airplane mode enabled. continue with [%s] mode", buf, 0xCu);
    }
    goto LABEL_116;
  }
  v25 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
  {
    if (v19 > 7u) {
      char v26 = "Unknown";
    }
    else {
      char v26 = (&off_100031148)[v19];
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v26;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v25, OS_LOG_TYPE_DEFAULT, "BB mode [%s], airplane mode OFF. Toggling BB mode", buf, 0xCu);
  }
  xpc_object_t v29 = xpc_dictionary_create(0, 0, 0);
  if (v29 || (xpc_object_t v29 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v29) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v29);
      xpc_object_t v30 = v29;
    }
    else
    {
      xpc_object_t v30 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v30 = xpc_null_create();
    xpc_object_t v29 = 0;
  }
  xpc_release(v29);
  xpc_object_t v31 = xpc_int64_create(1);
  if (!v31) {
    xpc_object_t v31 = xpc_null_create();
  }
  unint64_t v32 = (const char *)abm::kKeyBasebandOperatingMode;
  xpc_dictionary_set_value(v30, abm::kKeyBasebandOperatingMode, v31);
  xpc_object_t v33 = xpc_null_create();
  xpc_release(v31);
  xpc_release(v33);
  xpc_object_t v34 = xpc_int64_create(5000);
  if (!v34) {
    xpc_object_t v34 = xpc_null_create();
  }
  xpc_dictionary_set_value(v30, v6, v34);
  xpc_object_t v35 = xpc_null_create();
  xpc_release(v34);
  xpc_release(v35);
  LOBYTE(self->fGroupUpdate.gr_mem) = 1;
  gr_passwd = self->fGroupLogDump.gr_passwd;
  if (gr_passwd)
  {
    dispatch_retain((dispatch_object_t)self->fGroupLogDump.gr_passwd);
    dispatch_group_enter((dispatch_group_t)gr_passwd);
  }
  gr_mem = self->fGroupLogDump.gr_mem;
  self->fGroupLogDump.gr_mem = (char **)gr_passwd;
  if (gr_mem)
  {
    dispatch_group_leave((dispatch_group_t)gr_mem);
    dispatch_release((dispatch_object_t)gr_mem);
  }
  *(void *)&long long v38 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v38 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v38;
  *(_OWORD *)&uint8_t buf[16] = v38;
  uint64_t v39 = self->fManager.__cntrl_;
  xpc_object_t v66 = (std::__shared_weak_count *)v39;
  if (v39) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v39 + 1, 1uLL, memory_order_relaxed);
  }
  uint64_t v40 = (const void *)abm::kCommandSetBasebandOperatingMode;
  size_t v41 = strlen(abm::kCommandSetBasebandOperatingMode);
  if (v41 > 0x7FFFFFFFFFFFFFF7) {
    sub_100006DCC();
  }
  size_t v42 = v41;
  if (v41 >= 0x17)
  {
    uint64_t v44 = (v41 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v41 | 7) != 0x17) {
      uint64_t v44 = v41 | 7;
    }
    uint64_t v45 = v44 + 1;
    std::string::size_type v43 = operator new(v44 + 1);
    *(void *)&__dst[8] = v42;
    *(void *)&__dst[16] = v45 | 0x8000000000000000;
    *(void *)long long __dst = v43;
    goto LABEL_82;
  }
  __dst[23] = v41;
  std::string::size_type v43 = __dst;
  if (v41) {
LABEL_82:
  }
    memmove(v43, v40, v42);
  v43[v42] = 0;
  abm::client::PerformCommand();
  if ((__dst[23] & 0x80000000) != 0) {
    operator delete(*(void **)__dst);
  }
  if (v66 && !atomic_fetch_add(&v66->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
    std::__shared_weak_count::__release_weak(v66);
    if (!*(_DWORD *)buf) {
      goto LABEL_89;
    }
  }
  else if (!*(_DWORD *)buf)
  {
    goto LABEL_89;
  }
  timespec v46 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_ERROR))
  {
    sub_100022424(__dst, (uint64_t)buf);
    uint64_t v61 = __dst[23] >= 0 ? __dst : *(unsigned char **)__dst;
    LODWORD(v72) = 136315138;
    *(void *)((char *)&v72 + 4) = v61;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v46, OS_LOG_TYPE_ERROR, "Setting BB mode to LowPower failed : %s", (uint8_t *)&v72, 0xCu);
    if ((__dst[23] & 0x80000000) != 0) {
      operator delete(*(void **)__dst);
    }
  }
LABEL_89:
  v47 = self->fGroupLogDump.gr_passwd;
  dispatch_time_t v48 = dispatch_time(0, 5000000000);
  if (!dispatch_group_wait((dispatch_group_t)v47, v48)) {
    goto LABEL_93;
  }
  v49 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (!os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_ERROR))
  {
    v50 = self->fGroupLogDump.gr_mem;
    self->fGroupLogDump.gr_mem = 0;
    if (!v50) {
      goto LABEL_93;
    }
    goto LABEL_92;
  }
  *(_WORD *)long long __dst = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v49, OS_LOG_TYPE_ERROR, "Setting BB mode timed out", __dst, 2u);
  v50 = self->fGroupLogDump.gr_mem;
  self->fGroupLogDump.gr_mem = 0;
  if (v50)
  {
LABEL_92:
    dispatch_group_leave((dispatch_group_t)v50);
    dispatch_release((dispatch_object_t)v50);
  }
LABEL_93:
  LOBYTE(self->fGroupUpdate.gr_mem) = 8;
  xpc_object_t v51 = xpc_int64_create(0);
  if (!v51) {
    xpc_object_t v51 = xpc_null_create();
  }
  xpc_dictionary_set_value(v30, v32, v51);
  xpc_object_t v52 = xpc_null_create();
  xpc_release(v51);
  xpc_release(v52);
  v53 = self->fManager.__cntrl_;
  xpc_object_t v65 = (std::__shared_weak_count *)v53;
  if (v53) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v53 + 1, 1uLL, memory_order_relaxed);
  }
  size_t v54 = strlen((const char *)v40);
  if (v54 > 0x7FFFFFFFFFFFFFF7) {
    sub_100006DCC();
  }
  size_t v55 = v54;
  if (v54 >= 0x17)
  {
    uint64_t v57 = (v54 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v54 | 7) != 0x17) {
      uint64_t v57 = v54 | 7;
    }
    uint64_t v58 = v57 + 1;
    uint64_t v56 = (long long *)operator new(v57 + 1);
    *((void *)&v72 + 1) = v55;
    unint64_t v73 = v58 | 0x8000000000000000;
    *(void *)&long long v72 = v56;
    goto LABEL_104;
  }
  HIBYTE(v73) = v54;
  uint64_t v56 = &v72;
  if (v54) {
LABEL_104:
  }
    memmove(v56, v40, v55);
  *((unsigned char *)v56 + v55) = 0;
  abm::client::PerformCommand();
  *(_DWORD *)buf = *(_DWORD *)__dst;
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  *(_OWORD *)&uint8_t buf[8] = *(_OWORD *)&__dst[8];
  *(void *)&buf[24] = v75;
  HIBYTE(v75) = 0;
  __dst[8] = 0;
  if (SHIBYTE(v73) < 0) {
    operator delete((void *)v72);
  }
  if (v65 && !atomic_fetch_add(&v65->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
    std::__shared_weak_count::__release_weak(v65);
    if (*(_DWORD *)buf) {
      goto LABEL_112;
    }
  }
  else if (*(_DWORD *)buf)
  {
LABEL_112:
    v59 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v59, OS_LOG_TYPE_ERROR))
    {
      sub_100022424(__dst, (uint64_t)buf);
      char v62 = __dst[23] >= 0 ? __dst : *(unsigned char **)__dst;
      LODWORD(v72) = 136315138;
      *(void *)((char *)&v72 + 4) = v62;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v59, OS_LOG_TYPE_ERROR, "Setting BB mode to Online failed : %s", (uint8_t *)&v72, 0xCu);
      if ((__dst[23] & 0x80000000) != 0) {
        operator delete(*(void **)__dst);
      }
    }
  }
  if ((char)buf[31] < 0) {
    operator delete(*(void **)&buf[8]);
  }
  xpc_release(v30);
LABEL_116:

  xpc_release(v16);
  xpc_release(v64);
  if (SHIBYTE(v71) < 0) {
    operator delete((void *)__p);
  }
  return 1;
}

- (BOOL)checkBasebandBootStateAndReset
{
  unint64_t v72 = 0xAAAAAAAAE020E002;
  long long __p = 0uLL;
  uint64_t v74 = 0;
  xpc_object_t object = xpc_null_create();
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if (v3 || (xpc_object_t v3 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v3);
      xpc_object_t v4 = v3;
    }
    else
    {
      xpc_object_t v4 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    xpc_object_t v3 = 0;
  }
  xpc_release(v3);
  xpc_object_t v5 = xpc_int64_create(5000);
  if (!v5) {
    xpc_object_t v5 = xpc_null_create();
  }
  xpc_object_t v6 = (const char *)abm::kKeyTimeout;
  xpc_dictionary_set_value(v4, abm::kKeyTimeout, v5);
  xpc_object_t v7 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v7);
  cntrl = self->fManager.__cntrl_;
  ptr = self->fManager.__ptr_;
  xpc_object_t v70 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  size_t v9 = (const void *)abm::kCommandGetBasebandBootState;
  size_t v10 = strlen(abm::kCommandGetBasebandBootState);
  if (v10 > 0x7FFFFFFFFFFFFFF7) {
    sub_100006DCC();
  }
  size_t v11 = v10;
  if (v10 >= 0x17)
  {
    uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v13 = v10 | 7;
    }
    uint64_t v14 = v13 + 1;
    int v12 = operator new(v13 + 1);
    *(void *)&__dst[8] = v11;
    *(void *)&__dst[16] = v14 | 0x8000000000000000;
    *(void *)long long __dst = v12;
    goto LABEL_18;
  }
  __dst[23] = v10;
  int v12 = __dst;
  if (v10) {
LABEL_18:
  }
    memmove(v12, v9, v11);
  v12[v11] = 0;
  abm::client::PerformCommand();
  LODWORD(v72) = *(_DWORD *)v76;
  if (SHIBYTE(v74) < 0) {
    operator delete((void *)__p);
  }
  long long __p = *(_OWORD *)&v76[8];
  uint64_t v74 = v77;
  HIBYTE(v77) = 0;
  v76[8] = 0;
  if ((__dst[23] & 0x80000000) != 0)
  {
    operator delete(*(void **)__dst);
    xpc_object_t v15 = (std::__shared_weak_count *)v70;
    if (!v70) {
      goto LABEL_26;
    }
  }
  else
  {
    xpc_object_t v15 = (std::__shared_weak_count *)v70;
    if (!v70) {
      goto LABEL_26;
    }
  }
  if (!atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
    xpc_object_t v16 = object;
    if (object) {
      goto LABEL_30;
    }
    goto LABEL_27;
  }
LABEL_26:
  xpc_object_t v16 = object;
  if (object) {
    goto LABEL_30;
  }
LABEL_27:
  xpc_object_t v16 = xpc_null_create();
  if (!v16)
  {
    xpc_object_t xdict = xpc_null_create();
    xpc_object_t v16 = 0;
    goto LABEL_33;
  }
LABEL_30:
  if (xpc_get_type(v16) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_retain(v16);
    xpc_object_t xdict = v16;
  }
  else
  {
    xpc_object_t xdict = xpc_null_create();
  }
LABEL_33:
  xpc_release(v16);
  memset(__dst, 170, sizeof(__dst));
  int v17 = (const object *)abm::kBasebandBootStateUnknown;
  size_t v18 = strlen(abm::kBasebandBootStateUnknown);
  if (v18 > 0x7FFFFFFFFFFFFFF7) {
    sub_100006DCC();
  }
  size_t v19 = v18;
  if (v18 >= 0x17)
  {
    uint64_t v23 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v18 | 7) != 0x17) {
      uint64_t v23 = v18 | 7;
    }
    uint64_t v24 = v23 + 1;
    char v20 = operator new(v23 + 1);
    *(void *)&__dst[8] = v19;
    *(void *)&__dst[16] = v24 | 0x8000000000000000;
    *(void *)long long __dst = v20;
LABEL_46:
    memmove(v20, v17, v19);
    v20[v19] = 0;
    if (v72) {
      goto LABEL_37;
    }
    goto LABEL_47;
  }
  __dst[23] = v18;
  char v20 = __dst;
  if (v18) {
    goto LABEL_46;
  }
  __dst[0] = 0;
  if (v72)
  {
LABEL_37:
    unint64_t v21 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
    {
      sub_100022424(v76, (uint64_t)&v72);
      id v22 = v76[23] >= 0 ? v76 : *(unsigned char **)v76;
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v22;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v21, OS_LOG_TYPE_ERROR, "Check baseband boot state failed : %s", (uint8_t *)&buf, 0xCu);
      if ((v76[23] & 0x80000000) != 0) {
        operator delete(*(void **)v76);
      }
    }
    goto LABEL_54;
  }
LABEL_47:
  if (xpc_get_type(xdict) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t value = xpc_dictionary_get_value(xdict, abm::kKeyBasebandBootState);
    buf.__r_.__value_.__r.__words[0] = (std::string::size_type)value;
    if (value) {
      xpc_retain(value);
    }
    else {
      buf.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
    }
    xpc::dyn_cast_or_default((uint64_t *)v76, (xpc *)&buf, v17, v26);
    if ((__dst[23] & 0x80000000) != 0) {
      operator delete(*(void **)__dst);
    }
    *(_OWORD *)long long __dst = *(_OWORD *)v76;
    *(void *)&__dst[16] = *(void *)&v76[16];
    v76[23] = 0;
    v76[0] = 0;
    xpc_release(buf.__r_.__value_.__l.__data_);
  }
LABEL_54:
  char v27 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = __dst;
    if (__dst[23] < 0) {
      uint64_t v28 = *(unsigned char **)__dst;
    }
    *(_DWORD *)long long v76 = 136315138;
    *(void *)&v76[4] = v28;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v27, OS_LOG_TYPE_DEFAULT, "Baseband boot state: %s", v76, 0xCu);
  }
  int v29 = __dst[23];
  if (__dst[23] >= 0) {
    size_t v30 = __dst[23];
  }
  else {
    size_t v30 = *(void *)&__dst[8];
  }
  if (v30 != strlen((const char *)v17)
    || (__dst[23] >= 0 ? (xpc_object_t v31 = __dst) : (xpc_object_t v31 = *(unsigned char **)__dst), memcmp(v31, v17, v30)))
  {
    if (v30 != strlen(abm::kBasebandBootStateIsReady)
      || (v29 >= 0 ? (unint64_t v32 = __dst) : (unint64_t v32 = *(unsigned char **)__dst), memcmp(v32, abm::kBasebandBootStateIsReady, v30)))
    {
      xpc_object_t v33 = xpc_dictionary_create(0, 0, 0);
      if (v33 || (xpc_object_t v33 = xpc_null_create()) != 0)
      {
        if (xpc_get_type(v33) == (xpc_type_t)&_xpc_type_dictionary)
        {
          xpc_retain(v33);
          xpc_object_t v34 = v33;
        }
        else
        {
          xpc_object_t v34 = xpc_null_create();
        }
      }
      else
      {
        xpc_object_t v34 = xpc_null_create();
        xpc_object_t v33 = 0;
      }
      xpc_release(v33);
      xpc_object_t v36 = xpc_int64_create(5000);
      if (!v36) {
        xpc_object_t v36 = xpc_null_create();
      }
      xpc_dictionary_set_value(v34, v6, v36);
      xpc_object_t v37 = xpc_null_create();
      xpc_release(v36);
      xpc_release(v37);
      xpc_object_t v38 = xpc_string_create(abm::kBasebandResetTypeSoft);
      if (!v38) {
        xpc_object_t v38 = xpc_null_create();
      }
      xpc_dictionary_set_value(v34, abm::kKeyBasebandResetType, v38);
      xpc_object_t v39 = xpc_null_create();
      xpc_release(v38);
      xpc_release(v39);
      xpc_object_t v40 = xpc_string_create(abm::kBasebandResetSubTypeOtherErrors);
      if (!v40) {
        xpc_object_t v40 = xpc_null_create();
      }
      xpc_dictionary_set_value(v34, abm::kKeyBasebandResetSubType, v40);
      xpc_object_t v41 = xpc_null_create();
      xpc_release(v40);
      xpc_release(v41);
      size_t v42 = (const void *)abm::helper::kBasebandLogDEHelperName;
      size_t v43 = strlen(abm::helper::kBasebandLogDEHelperName);
      if (v43 > 0x7FFFFFFFFFFFFFF7) {
        sub_100006DCC();
      }
      std::string::size_type v44 = v43;
      if (v43 >= 0x17)
      {
        uint64_t v46 = (v43 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v43 | 7) != 0x17) {
          uint64_t v46 = v43 | 7;
        }
        uint64_t v47 = v46 + 1;
        p_std::string buf = (std::string *)operator new(v46 + 1);
        buf.__r_.__value_.__l.__size_ = v44;
        buf.__r_.__value_.__r.__words[2] = v47 | 0x8000000000000000;
        buf.__r_.__value_.__r.__words[0] = (std::string::size_type)p_buf;
      }
      else
      {
        *((unsigned char *)&buf.__r_.__value_.__s + 23) = v43;
        p_std::string buf = &buf;
        if (!v43)
        {
LABEL_93:
          p_buf->__r_.__value_.__s.__data_[v44] = 0;
          dispatch_time_t v48 = (char *)operator new(0x38uLL);
          strcpy(v48, ": Detected baseband is not ready, attempting reset.");
          v49 = std::string::append(&buf, v48, 0x33uLL);
          long long v50 = *(_OWORD *)&v49->__r_.__value_.__l.__data_;
          *(void *)&v76[16] = *((void *)&v49->__r_.__value_.__l + 2);
          *(_OWORD *)long long v76 = v50;
          v49->__r_.__value_.__l.__size_ = 0;
          v49->__r_.__value_.__r.__words[2] = 0;
          v49->__r_.__value_.__r.__words[0] = 0;
          if (v76[23] >= 0) {
            xpc_object_t v51 = v76;
          }
          else {
            xpc_object_t v51 = *(const char **)v76;
          }
          xpc_object_t v52 = xpc_string_create(v51);
          if (!v52) {
            xpc_object_t v52 = xpc_null_create();
          }
          xpc_dictionary_set_value(v34, abm::kKeyBasebandResetReason, v52);
          xpc_object_t v53 = xpc_null_create();
          xpc_release(v52);
          xpc_release(v53);
          if ((v76[23] & 0x80000000) != 0)
          {
            operator delete(*(void **)v76);
            operator delete(v48);
            if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
LABEL_100:
              size_t v54 = self->fManager.__cntrl_;
              xpc_object_t v67 = v54;
              if (!v54) {
                goto LABEL_102;
              }
              goto LABEL_101;
            }
          }
          else
          {
            operator delete(v48);
            if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
              goto LABEL_100;
            }
          }
          operator delete(buf.__r_.__value_.__l.__data_);
          size_t v54 = self->fManager.__cntrl_;
          xpc_object_t v67 = v54;
          if (!v54)
          {
LABEL_102:
            size_t v55 = (const void *)abm::kCommandResetBaseband;
            size_t v56 = strlen(abm::kCommandResetBaseband);
            if (v56 > 0x7FFFFFFFFFFFFFF7) {
              sub_100006DCC();
            }
            std::string::size_type v57 = v56;
            if (v56 >= 0x17)
            {
              uint64_t v59 = (v56 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v56 | 7) != 0x17) {
                uint64_t v59 = v56 | 7;
              }
              uint64_t v60 = v59 + 1;
              uint64_t v58 = (std::string *)operator new(v59 + 1);
              buf.__r_.__value_.__l.__size_ = v57;
              buf.__r_.__value_.__r.__words[2] = v60 | 0x8000000000000000;
              buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v58;
            }
            else
            {
              *((unsigned char *)&buf.__r_.__value_.__s + 23) = v56;
              uint64_t v58 = &buf;
              if (!v56)
              {
LABEL_110:
                v58->__r_.__value_.__s.__data_[v57] = 0;
                abm::client::PerformCommand();
                LODWORD(v72) = *(_DWORD *)v76;
                if (SHIBYTE(v74) < 0) {
                  operator delete((void *)__p);
                }
                long long __p = *(_OWORD *)&v76[8];
                uint64_t v74 = v77;
                HIBYTE(v77) = 0;
                v76[8] = 0;
                if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
                {
                  operator delete(buf.__r_.__value_.__l.__data_);
                  uint64_t v61 = (std::__shared_weak_count *)v67;
                  if (!v67) {
                    goto LABEL_120;
                  }
                }
                else
                {
                  uint64_t v61 = (std::__shared_weak_count *)v67;
                  if (!v67) {
                    goto LABEL_120;
                  }
                }
                if (!atomic_fetch_add(&v61->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                {
                  ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
                  std::__shared_weak_count::__release_weak(v61);
                  if (v72) {
                    goto LABEL_121;
                  }
                  goto LABEL_128;
                }
LABEL_120:
                if (v72)
                {
LABEL_121:
                  char v62 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
                  if (os_log_type_enabled((os_log_t)v62, OS_LOG_TYPE_ERROR))
                  {
                    sub_100022424(v76, (uint64_t)&v72);
                    xpc_object_t v63 = v76[23] >= 0 ? v76 : *(unsigned char **)v76;
                    LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
                    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v63;
                    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v62, OS_LOG_TYPE_ERROR, "Baseband soft-reset failed : %s", (uint8_t *)&buf, 0xCu);
                    if ((v76[23] & 0x80000000) != 0) {
                      operator delete(*(void **)v76);
                    }
                  }
                  goto LABEL_130;
                }
LABEL_128:
                xpc_object_t v64 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
                if (os_log_type_enabled((os_log_t)v64, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)long long v76 = 0;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)v64, OS_LOG_TYPE_DEFAULT, "Baseband soft-reset success", v76, 2u);
                }
LABEL_130:
                xpc_release(v34);
                BOOL v35 = 1;
                if ((__dst[23] & 0x80) == 0) {
                  goto LABEL_132;
                }
                goto LABEL_131;
              }
            }
            memmove(v58, v55, v57);
            goto LABEL_110;
          }
LABEL_101:
          atomic_fetch_add_explicit((atomic_ullong *volatile)v54 + 1, 1uLL, memory_order_relaxed);
          goto LABEL_102;
        }
      }
      memmove(p_buf, v42, v44);
      goto LABEL_93;
    }
  }
  BOOL v35 = 0;
  if ((v29 & 0x80) == 0) {
    goto LABEL_132;
  }
LABEL_131:
  operator delete(*(void **)__dst);
LABEL_132:
  xpc_release(xdict);
  xpc_release(v4);
  if (SHIBYTE(v74) < 0) {
    operator delete((void *)__p);
  }
  return v35;
}

- (BOOL)isCompressionModeOff
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if (v3 || (xpc_object_t v3 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v3);
      xpc_object_t v4 = v3;
    }
    else
    {
      xpc_object_t v4 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    xpc_object_t v3 = 0;
  }
  xpc_release(v3);
  xpc_object_t v5 = xpc_string_create(abm::kTraceCompression);
  if (!v5) {
    xpc_object_t v5 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, abm::kKeyTraceName, v5);
  xpc_object_t v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
  xpc_object_t v7 = xpc_string_create(abm::helper::kKeyMode);
  if (!v7) {
    xpc_object_t v7 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, abm::kKeyTracePropertyName, v7);
  xpc_object_t v8 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v8);
  xpc_object_t v9 = xpc_int64_create(5000);
  if (!v9) {
    xpc_object_t v9 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, abm::kKeyTimeout, v9);
  xpc_object_t v10 = xpc_null_create();
  xpc_release(v9);
  xpc_release(v10);
  xpc_object_t v39 = xpc_null_create();
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)long long __p = v11;
  long long v38 = v11;
  cntrl = self->fManager.__cntrl_;
  ptr = self->fManager.__ptr_;
  xpc_object_t v36 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  uint64_t v13 = (const void *)abm::kCommandGetTraceProperty;
  size_t v14 = strlen(abm::kCommandGetTraceProperty);
  if (v14 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100006DCC();
  }
  std::string::size_type v15 = v14;
  if (v14 >= 0x17)
  {
    uint64_t v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17) {
      uint64_t v17 = v14 | 7;
    }
    uint64_t v18 = v17 + 1;
    p_dst = (std::string *)operator new(v17 + 1);
    __dst.__r_.__value_.__l.__size_ = v15;
    __dst.__r_.__value_.__r.__words[2] = v18 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_22;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v14;
  p_dst = &__dst;
  if (v14) {
LABEL_22:
  }
    memmove(p_dst, v13, v15);
  p_dst->__r_.__value_.__s.__data_[v15] = 0;
  abm::client::PerformCommand();
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  size_t v19 = (std::__shared_weak_count *)v36;
  if (v36 && !atomic_fetch_add((atomic_ullong *volatile)v36 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
    xpc_object_t v20 = v39;
    if (v39) {
      goto LABEL_31;
    }
  }
  else
  {
    xpc_object_t v20 = v39;
    if (v39) {
      goto LABEL_31;
    }
  }
  xpc_object_t v20 = xpc_null_create();
  if (!v20)
  {
    xpc_object_t v21 = xpc_null_create();
    xpc_object_t v20 = 0;
    goto LABEL_34;
  }
LABEL_31:
  if (xpc_get_type(v20) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_retain(v20);
    xpc_object_t v21 = v20;
  }
  else
  {
    xpc_object_t v21 = xpc_null_create();
  }
LABEL_34:
  xpc_release(v20);
  memset(&__dst, 0, sizeof(__dst));
  if (!LODWORD(__p[0]) && xpc_get_type(v21) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t value = xpc_dictionary_get_value(v21, abm::kKeyTracePropertyValue);
    xpc_object_t object = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    xpc::dyn_cast_or_default((uint64_t *)&v33, (xpc *)&object, abm::kUnknown, v23);
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__dst.__r_.__value_.__l.__data_);
    }
    std::string __dst = v33;
    *((unsigned char *)&v33.__r_.__value_.__s + 23) = 0;
    v33.__r_.__value_.__s.__data_[0] = 0;
    xpc_release(object);
  }
  std::to_string(&v33, 0);
  int v24 = SHIBYTE(__dst.__r_.__value_.__r.__words[2]);
  v25 = (void *)__dst.__r_.__value_.__r.__words[0];
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v26 = &__dst;
  }
  else {
    char v26 = (std::string *)__dst.__r_.__value_.__r.__words[0];
  }
  int v27 = SHIBYTE(v33.__r_.__value_.__r.__words[2]);
  uint64_t v28 = (void *)v33.__r_.__value_.__r.__words[0];
  if ((v33.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v29 = &v33;
  }
  else {
    int v29 = (std::string *)v33.__r_.__value_.__r.__words[0];
  }
  int v30 = strcasecmp((const char *)v26, (const char *)v29);
  if (v27 < 0)
  {
    operator delete(v28);
    if ((v24 & 0x80000000) == 0) {
      goto LABEL_50;
    }
  }
  else if ((v24 & 0x80000000) == 0)
  {
    goto LABEL_50;
  }
  operator delete(v25);
LABEL_50:
  xpc_release(v21);
  if (SHIBYTE(v38) < 0) {
    operator delete(__p[1]);
  }
  xpc_release(v4);
  return v30 == 0;
}

- (unsigned)getBasebandLogHistorySize
{
  unsigned int v34 = 0;
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if (v3 || (xpc_object_t v3 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v3);
      xpc_object_t v4 = v3;
    }
    else
    {
      xpc_object_t v4 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    xpc_object_t v3 = 0;
  }
  xpc_release(v3);
  xpc_object_t v5 = xpc_string_create(abm::kTraceBaseband);
  if (!v5) {
    xpc_object_t v5 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, abm::kKeyTraceName, v5);
  xpc_object_t v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
  xpc_object_t v7 = xpc_string_create(abm::kKeyTraceHistory);
  if (!v7) {
    xpc_object_t v7 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, abm::kKeyTracePropertyName, v7);
  xpc_object_t v8 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v8);
  xpc_object_t v9 = xpc_int64_create(5000);
  if (!v9) {
    xpc_object_t v9 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, abm::kKeyTimeout, v9);
  xpc_object_t v10 = xpc_null_create();
  xpc_release(v9);
  xpc_release(v10);
  xpc_object_t v33 = xpc_null_create();
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)long long __p = v11;
  long long v32 = v11;
  cntrl = self->fManager.__cntrl_;
  ptr = self->fManager.__ptr_;
  int v30 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  uint64_t v13 = (const void *)abm::kCommandGetTraceProperty;
  size_t v14 = strlen(abm::kCommandGetTraceProperty);
  if (v14 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100006DCC();
  }
  std::string::size_type v15 = v14;
  if (v14 >= 0x17)
  {
    uint64_t v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17) {
      uint64_t v17 = v14 | 7;
    }
    uint64_t v18 = v17 + 1;
    p_dst = (std::string *)operator new(v17 + 1);
    __dst.__r_.__value_.__l.__size_ = v15;
    __dst.__r_.__value_.__r.__words[2] = v18 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_22;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v14;
  p_dst = &__dst;
  if (v14) {
LABEL_22:
  }
    memmove(p_dst, v13, v15);
  p_dst->__r_.__value_.__s.__data_[v15] = 0;
  abm::client::PerformCommand();
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  size_t v19 = (std::__shared_weak_count *)v30;
  if (v30 && !atomic_fetch_add((atomic_ullong *volatile)v30 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
    xpc_object_t v20 = v33;
    if (v33) {
      goto LABEL_31;
    }
  }
  else
  {
    xpc_object_t v20 = v33;
    if (v33) {
      goto LABEL_31;
    }
  }
  xpc_object_t v20 = xpc_null_create();
  if (!v20)
  {
    xpc_object_t v21 = xpc_null_create();
    xpc_object_t v20 = 0;
    goto LABEL_34;
  }
LABEL_31:
  if (xpc_get_type(v20) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_retain(v20);
    xpc_object_t v21 = v20;
  }
  else
  {
    xpc_object_t v21 = xpc_null_create();
  }
LABEL_34:
  xpc_release(v20);
  memset(&__dst, 0, sizeof(__dst));
  if (!LODWORD(__p[0]) && xpc_get_type(v21) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t value = xpc_dictionary_get_value(v21, abm::kKeyTracePropertyValue);
    xpc_object_t object = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    xpc::dyn_cast_or_default((uint64_t *)&v27, (xpc *)&object, (const object *)"0", v23);
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__dst.__r_.__value_.__l.__data_);
    }
    std::string __dst = v27;
    *((unsigned char *)&v27.__r_.__value_.__s + 23) = 0;
    v27.__r_.__value_.__s.__data_[0] = 0;
    xpc_release(object);
    sub_10002536C(&__dst, &v34);
  }
  unsigned int v24 = v34;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  xpc_release(v21);
  if (SHIBYTE(v32) < 0) {
    operator delete(__p[1]);
  }
  xpc_release(v4);
  return v24;
}

- (unsigned)getAgeLimitForAttachment
{
  unsigned int v33 = 43200;
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if (v3 || (xpc_object_t v3 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v3);
      xpc_object_t v4 = v3;
    }
    else
    {
      xpc_object_t v4 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    xpc_object_t v3 = 0;
  }
  xpc_release(v3);
  xpc_object_t v5 = xpc_string_create(abm::kTraceTapToRadar);
  if (!v5) {
    xpc_object_t v5 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, abm::kKeyTraceName, v5);
  xpc_object_t v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
  xpc_object_t v7 = xpc_string_create(abm::kKeyTraceAttachmentAgeLimit);
  if (!v7) {
    xpc_object_t v7 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, abm::kKeyTracePropertyName, v7);
  xpc_object_t v8 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v8);
  xpc_object_t v9 = xpc_int64_create(5000);
  if (!v9) {
    xpc_object_t v9 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, abm::kKeyTimeout, v9);
  xpc_object_t v10 = xpc_null_create();
  xpc_release(v9);
  xpc_release(v10);
  xpc_object_t object = xpc_null_create();
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)int v30 = v11;
  long long v31 = v11;
  cntrl = self->fManager.__cntrl_;
  ptr = self->fManager.__ptr_;
  int v29 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  uint64_t v13 = (const void *)abm::kCommandGetTraceProperty;
  size_t v14 = strlen(abm::kCommandGetTraceProperty);
  if (v14 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100006DCC();
  }
  std::string::size_type v15 = v14;
  if (v14 >= 0x17)
  {
    uint64_t v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17) {
      uint64_t v17 = v14 | 7;
    }
    uint64_t v18 = v17 + 1;
    p_dst = (std::string *)operator new(v17 + 1);
    __dst.__r_.__value_.__l.__size_ = v15;
    __dst.__r_.__value_.__r.__words[2] = v18 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_22;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v14;
  p_dst = &__dst;
  if (v14) {
LABEL_22:
  }
    memmove(p_dst, v13, v15);
  p_dst->__r_.__value_.__s.__data_[v15] = 0;
  abm::client::PerformCommand();
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  if (v29 && !atomic_fetch_add((atomic_ullong *volatile)v29 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v29 + 16))(v29);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v29);
    xpc_object_t v19 = object;
    if (object) {
      goto LABEL_31;
    }
  }
  else
  {
    xpc_object_t v19 = object;
    if (object) {
      goto LABEL_31;
    }
  }
  xpc_object_t v19 = xpc_null_create();
  if (!v19)
  {
    xpc_object_t v20 = xpc_null_create();
    xpc_object_t v19 = 0;
    goto LABEL_34;
  }
LABEL_31:
  if (xpc_get_type(v19) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_retain(v19);
    xpc_object_t v20 = v19;
  }
  else
  {
    xpc_object_t v20 = xpc_null_create();
  }
LABEL_34:
  xpc_release(v19);
  if (!LODWORD(v30[0]) && xpc_get_type(v20) == (xpc_type_t)&_xpc_type_dictionary)
  {
    memset(&__dst, 170, sizeof(__dst));
    xpc_object_t value = xpc_dictionary_get_value(v20, abm::kKeyTracePropertyValue);
    xpc_object_t v27 = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      xpc_object_t v27 = xpc_null_create();
    }
    std::to_string(&__p, v33);
    xpc::dyn_cast_or_default();
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    xpc_release(v27);
    sub_10002536C(&__dst, &v33);
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__dst.__r_.__value_.__l.__data_);
    }
  }
  id v22 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  BOOL v23 = os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT);
  unsigned int v24 = v33;
  if (v23)
  {
    LODWORD(__dst.__r_.__value_.__l.__data_) = 67109120;
    HIDWORD(__dst.__r_.__value_.__r.__words[0]) = v33;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v22, OS_LOG_TYPE_DEFAULT, "log age limit for attachement = %d sec", (uint8_t *)&__dst, 8u);
  }
  xpc_release(v20);
  if (SHIBYTE(v31) < 0) {
    operator delete(v30[1]);
  }
  xpc_release(v4);
  return v24;
}

- (id)dumpTelephonyLogs:(id)a3 :(BOOL)a4 :(id)a5
{
  BOOL v6 = a4;
  id v67 = a3;
  id v68 = a5;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  if (v8 || (xpc_object_t v8 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v8) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v8);
      xpc_object_t v9 = v8;
    }
    else
    {
      xpc_object_t v9 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v9 = xpc_null_create();
    xpc_object_t v8 = 0;
  }
  xpc_release(v8);
  xpc_object_t v10 = xpc_string_create(abm::kCollectTelephonyLogs);
  if (!v10) {
    xpc_object_t v10 = xpc_null_create();
  }
  xpc_dictionary_set_value(v9, abm::kKeyTraceAction, v10);
  xpc_object_t v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
  Timestamp::Timestamp((Timestamp *)&buf);
  Timestamp::asString();
  p_fGroupUpdate = &self->fGroupUpdate;
  if (&self->fGroupUpdate != (group *)__p)
  {
    if (*((char *)&self->fGroupUpdate.gr_gid + 7) < 0)
    {
      if (SHIBYTE(__p[2]) >= 0) {
        uint64_t v13 = __p;
      }
      else {
        uint64_t v13 = (void **)__p[0];
      }
      if (SHIBYTE(__p[2]) >= 0) {
        size_t v14 = HIBYTE(__p[2]);
      }
      else {
        size_t v14 = (size_t)__p[1];
      }
      sub_10000738C((void **)&self->fGroupUpdate.gr_name, v13, v14);
    }
    else if ((HIBYTE(__p[2]) & 0x80) != 0)
    {
      sub_1000072C4(&self->fGroupUpdate.gr_name, __p[0], (size_t)__p[1]);
    }
    else
    {
      *(_OWORD *)&p_fGroupUpdate->gr_name = *(_OWORD *)__p;
      *(void **)&self->fGroupUpdate.gr_gid = __p[2];
    }
  }
  if (SHIBYTE(__p[2]) < 0)
  {
    operator delete(__p[0]);
    sub_1000295E4((void *)buf.__r_.__value_.__l.__size_);
    gr_name = &self->fGroupUpdate;
    if ((*((char *)&self->fGroupUpdate.gr_gid + 7) & 0x80000000) == 0) {
      goto LABEL_23;
    }
  }
  else
  {
    sub_1000295E4((void *)buf.__r_.__value_.__l.__size_);
    gr_name = &self->fGroupUpdate;
    if ((*((char *)&self->fGroupUpdate.gr_gid + 7) & 0x80000000) == 0) {
      goto LABEL_23;
    }
  }
  gr_name = (group *)p_fGroupUpdate->gr_name;
LABEL_23:
  xpc_object_t v16 = xpc_string_create((const char *)gr_name);
  if (!v16) {
    xpc_object_t v16 = xpc_null_create();
  }
  xpc_dictionary_set_value(v9, abm::kKeyTimestampString, v16);
  xpc_object_t v17 = xpc_null_create();
  xpc_release(v16);
  xpc_release(v17);
  if (TelephonyUtilIsInternalBuild() & 1) != 0 || (TelephonyUtilIsCarrierBuild())
  {
    if ([(BasebandLogDEHelper *)self isCompressionModeOff])
    {
      unsigned int v18 = [(BasebandLogDEHelper *)self getBasebandLogHistorySize];
      if (v18 <= 0x200) {
        int64_t v19 = 1;
      }
      else {
        int64_t v19 = 2;
      }
      xpc_object_t v20 = xpc_int64_create(v19);
      if (!v20) {
        xpc_object_t v20 = xpc_null_create();
      }
      xpc_dictionary_set_value(v9, abm::kKeyTraceDumpStatePerformCompression, v20);
      xpc_object_t v21 = xpc_null_create();
      xpc_release(v20);
      xpc_release(v21);
      id v22 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
      {
        abm::helper::asString();
        BOOL v23 = SHIBYTE(__p[2]) >= 0 ? __p : (void **)__p[0];
        LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v23;
        WORD2(buf.__r_.__value_.__r.__words[1]) = 1024;
        *(_DWORD *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v18;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v22, OS_LOG_TYPE_DEFAULT, "Setting compression to %s for log dump based on baseband history size [%d]", (uint8_t *)&buf, 0x12u);
        if (SHIBYTE(__p[2]) < 0) {
          operator delete(__p[0]);
        }
      }
    }
    unsigned int v24 = 1500;
  }
  else
  {
    xpc_object_t v25 = xpc_int64_create(2);
    if (!v25) {
      xpc_object_t v25 = xpc_null_create();
    }
    xpc_dictionary_set_value(v9, abm::kKeyTraceDumpStatePerformCompression, v25);
    xpc_object_t v26 = xpc_null_create();
    xpc_release(v25);
    xpc_release(v26);
    unsigned int v24 = 300;
  }
  xpc_object_t v27 = xpc_int64_create(v6);
  if (!v27) {
    xpc_object_t v27 = xpc_null_create();
  }
  xpc_dictionary_set_value(v9, abm::kTraceSystemLogs, v27);
  xpc_object_t v28 = xpc_null_create();
  xpc_release(v27);
  xpc_release(v28);
  memset(__p, 170, 24);
  id v29 = v67;
  int v30 = (const char *)[v29 UTF8String];
  size_t v31 = strlen(v30);
  if (v31 > 0x7FFFFFFFFFFFFFF7) {
    sub_100006DCC();
  }
  std::string::size_type v32 = v31;
  if (v31 >= 0x17)
  {
    uint64_t v34 = (v31 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v31 | 7) != 0x17) {
      uint64_t v34 = v31 | 7;
    }
    uint64_t v35 = v34 + 1;
    p_dst = (std::string *)operator new(v34 + 1);
    __dst.__r_.__value_.__l.__size_ = v32;
    __dst.__r_.__value_.__r.__words[2] = v35 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_54;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v31;
  p_dst = &__dst;
  if (v31) {
LABEL_54:
  }
    memmove(p_dst, v30, v32);
  p_dst->__r_.__value_.__s.__data_[v32] = 0;
  xpc_object_t v36 = std::string::append(&__dst, ": ", 2uLL);
  long long v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
  buf.__r_.__value_.__r.__words[2] = v36->__r_.__value_.__r.__words[2];
  *(_OWORD *)&buf.__r_.__value_.__l.__data_ = v37;
  v36->__r_.__value_.__l.__size_ = 0;
  v36->__r_.__value_.__r.__words[2] = 0;
  v36->__r_.__value_.__r.__words[0] = 0;
  std::string::size_type v38 = strlen(abm::trace::kDiagnosticExtensionDumpingReason);
  xpc_object_t v39 = std::string::append(&buf, abm::trace::kDiagnosticExtensionDumpingReason, v38);
  long long v40 = *(_OWORD *)&v39->__r_.__value_.__l.__data_;
  __p[2] = (void *)v39->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v40;
  v39->__r_.__value_.__l.__size_ = 0;
  v39->__r_.__value_.__r.__words[2] = 0;
  v39->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(buf.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_57:
      if (!v68) {
        goto LABEL_63;
      }
      goto LABEL_61;
    }
  }
  else if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_57;
  }
  operator delete(__dst.__r_.__value_.__l.__data_);
  if (!v68) {
    goto LABEL_63;
  }
LABEL_61:
  if (objc_msgSend(v68, "length", v67)) {
    sub_10001E880(__p, (char *)[v68 UTF8String]);
  }
LABEL_63:
  if (SHIBYTE(__p[2]) >= 0) {
    xpc_object_t v41 = __p;
  }
  else {
    xpc_object_t v41 = (void **)__p[0];
  }
  xpc_object_t v42 = xpc_string_create((const char *)v41);
  if (!v42) {
    xpc_object_t v42 = xpc_null_create();
  }
  xpc_dictionary_set_value(v9, abm::kKeyTraceDumpStateReason, v42);
  xpc_object_t v43 = xpc_null_create();
  xpc_release(v42);
  xpc_release(v43);
  xpc_object_t v44 = xpc_int64_create(1000 * v24 - 1000);
  if (!v44) {
    xpc_object_t v44 = xpc_null_create();
  }
  xpc_dictionary_set_value(v9, abm::kKeyTimeout, v44);
  xpc_object_t v45 = xpc_null_create();
  xpc_release(v44);
  xpc_release(v45);
  uint64_t v46 = self->fGroupLogDump.gr_name;
  if (v46)
  {
    dispatch_retain((dispatch_object_t)self->fGroupLogDump.gr_name);
    dispatch_group_enter((dispatch_group_t)v46);
  }
  uint64_t v47 = *(NSObject **)&self->fGroupLogDump.gr_gid;
  *(void *)&self->fGroupLogDump.gr_gid = v46;
  if (v47)
  {
    dispatch_group_leave(v47);
    dispatch_release(v47);
  }
  dispatch_time_t v48 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v48, OS_LOG_TYPE_DEFAULT))
  {
    v49 = &self->fGroupUpdate;
    if (*((char *)&self->fGroupUpdate.gr_gid + 7) < 0) {
      v49 = (group *)p_fGroupUpdate->gr_name;
    }
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v49;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v48, OS_LOG_TYPE_DEFAULT, "Trigger telephony log dump: %s", (uint8_t *)&buf, 0xCu);
  }
  __dst.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)&__dst.__r_.__value_.__l.__data_, self);
  cntrl = self->fManager.__cntrl_;
  v69[1] = self->fManager.__ptr_;
  xpc_object_t v70 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  xpc_object_t v51 = (const void *)abm::kCommandTraceDumpState;
  size_t v52 = strlen(abm::kCommandTraceDumpState);
  if (v52 > 0x7FFFFFFFFFFFFFF7) {
    sub_100006DCC();
  }
  std::string::size_type v53 = v52;
  if (v52 >= 0x17)
  {
    uint64_t v55 = (v52 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v52 | 7) != 0x17) {
      uint64_t v55 = v52 | 7;
    }
    uint64_t v56 = v55 + 1;
    p_std::string buf = (std::string *)operator new(v55 + 1);
    buf.__r_.__value_.__l.__size_ = v53;
    buf.__r_.__value_.__r.__words[2] = v56 | 0x8000000000000000;
    buf.__r_.__value_.__r.__words[0] = (std::string::size_type)p_buf;
    goto LABEL_87;
  }
  *((unsigned char *)&buf.__r_.__value_.__s + 23) = v52;
  p_std::string buf = &buf;
  if (v52) {
LABEL_87:
  }
    memmove(p_buf, v51, v53);
  p_buf->__r_.__value_.__s.__data_[v53] = 0;
  objc_copyWeak(v69, (id *)&__dst.__r_.__value_.__l.__data_);
  abm::client::PerformCommand();
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(buf.__r_.__value_.__l.__data_);
  }
  std::string::size_type v57 = (std::__shared_weak_count *)v70;
  if (v70 && !atomic_fetch_add((atomic_ullong *volatile)v70 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
    std::__shared_weak_count::__release_weak(v57);
  }
  uint64_t v58 = self->fGroupLogDump.gr_name;
  dispatch_time_t v59 = dispatch_time(0, 1000000000 * v24);
  if (dispatch_group_wait((dispatch_group_t)v58, v59))
  {
    uint64_t v60 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v60, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 67109120;
      HIDWORD(buf.__r_.__value_.__r.__words[0]) = v24;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v60, OS_LOG_TYPE_ERROR, "Dumping telephony logs not completed in %d sec", (uint8_t *)&buf, 8u);
      uint64_t v61 = *(NSObject **)&self->fGroupLogDump.gr_gid;
      *(void *)&self->fGroupLogDump.gr_gid = 0;
      if (!v61) {
        goto LABEL_97;
      }
    }
    else
    {
      uint64_t v61 = *(NSObject **)&self->fGroupLogDump.gr_gid;
      *(void *)&self->fGroupLogDump.gr_gid = 0;
      if (!v61)
      {
LABEL_97:
        char v62 = &stru_1000313A8;
        goto LABEL_108;
      }
    }
    dispatch_group_leave(v61);
    dispatch_release(v61);
    goto LABEL_97;
  }
  xpc_object_t v63 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v63, OS_LOG_TYPE_DEFAULT))
  {
    xpc_object_t v64 = &self->fGroupUpdate;
    if (*((char *)&self->fGroupUpdate.gr_gid + 7) < 0) {
      xpc_object_t v64 = (group *)p_fGroupUpdate->gr_name;
    }
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v64;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v63, OS_LOG_TYPE_DEFAULT, "Dumping telephony logs [%s] completed", (uint8_t *)&buf, 0xCu);
  }
  if (*((char *)&self->fGroupUpdate.gr_gid + 7) < 0)
  {
    if (!self->fGroupUpdate.gr_passwd) {
      goto LABEL_97;
    }
    p_fGroupUpdate = (group *)p_fGroupUpdate->gr_name;
  }
  else if (!*((unsigned char *)&self->fGroupUpdate.gr_gid + 7))
  {
    char v62 = &stru_1000313A8;
LABEL_109:
    LOBYTE(self->fGroupUpdate.gr_name) = 0;
    *((unsigned char *)&self->fGroupUpdate.gr_gid + 7) = 0;
    goto LABEL_111;
  }
  char v62 = +[NSString stringWithUTF8String:p_fGroupUpdate];
LABEL_108:
  if ((*((char *)&self->fGroupUpdate.gr_gid + 7) & 0x80000000) == 0) {
    goto LABEL_109;
  }
  *self->fGroupUpdate.gr_name = 0;
  self->fGroupUpdate.gr_passwd = 0;
LABEL_111:
  xpc_object_t v65 = v62;
  objc_destroyWeak(v69);
  objc_destroyWeak((id *)&__dst.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }

  xpc_release(v9);
  return v65;
}

- (id)dumpLogWithBasebandReset:(id)a3 :(id)a4
{
  id v57 = a3;
  id v58 = a4;
  Timestamp::Timestamp((Timestamp *)&v63);
  Timestamp::asString();
  p_fGroupUpdate = &self->fGroupUpdate;
  if (&self->fGroupUpdate != (group *)__p)
  {
    if (*((char *)&self->fGroupUpdate.gr_gid + 7) < 0)
    {
      if (SHIBYTE(__p[2]) >= 0) {
        xpc_object_t v7 = __p;
      }
      else {
        xpc_object_t v7 = (void **)__p[0];
      }
      if (SHIBYTE(__p[2]) >= 0) {
        size_t v8 = HIBYTE(__p[2]);
      }
      else {
        size_t v8 = (size_t)__p[1];
      }
      sub_10000738C((void **)&self->fGroupUpdate.gr_name, v7, v8);
    }
    else if ((HIBYTE(__p[2]) & 0x80) != 0)
    {
      sub_1000072C4(&self->fGroupUpdate.gr_name, __p[0], (size_t)__p[1]);
    }
    else
    {
      *(_OWORD *)&p_fGroupUpdate->gr_name = *(_OWORD *)__p;
      *(void **)&self->fGroupUpdate.gr_gid = __p[2];
    }
  }
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  sub_1000295E4((void *)v63.__r_.__value_.__l.__size_);
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  if (v9 || (xpc_object_t v9 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v9) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v9);
      xpc_object_t v10 = v9;
    }
    else
    {
      xpc_object_t v10 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v10 = xpc_null_create();
    xpc_object_t v9 = 0;
  }
  xpc_release(v9);
  xpc_object_t v11 = xpc_string_create(abm::kBasebandResetTypeHard);
  if (!v11) {
    xpc_object_t v11 = xpc_null_create();
  }
  xpc_dictionary_set_value(v10, abm::kKeyBasebandResetType, v11);
  xpc_object_t v12 = xpc_null_create();
  xpc_release(v11);
  xpc_release(v12);
  gr_name = &self->fGroupUpdate;
  if (*((char *)&self->fGroupUpdate.gr_gid + 7) < 0) {
    gr_name = (group *)p_fGroupUpdate->gr_name;
  }
  xpc_object_t v14 = xpc_string_create((const char *)gr_name);
  if (!v14) {
    xpc_object_t v14 = xpc_null_create();
  }
  xpc_dictionary_set_value(v10, abm::kKeyTimestampString, v14);
  xpc_object_t v15 = xpc_null_create();
  xpc_release(v14);
  xpc_release(v15);
  xpc_object_t v16 = xpc_string_create(abm::kBasebandResetSubTypeOtherErrors);
  if (!v16) {
    xpc_object_t v16 = xpc_null_create();
  }
  xpc_dictionary_set_value(v10, abm::kKeyBasebandResetSubType, v16);
  xpc_object_t v17 = xpc_null_create();
  xpc_release(v16);
  xpc_release(v17);
  memset(__p, 170, 24);
  id v18 = v57;
  int64_t v19 = (const char *)[v18 UTF8String];
  size_t v20 = strlen(v19);
  if (v20 > 0x7FFFFFFFFFFFFFF7) {
    sub_100006DCC();
  }
  std::string::size_type v21 = v20;
  if (v20 >= 0x17)
  {
    uint64_t v23 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v20 | 7) != 0x17) {
      uint64_t v23 = v20 | 7;
    }
    uint64_t v24 = v23 + 1;
    p_dst = (std::string *)operator new(v23 + 1);
    __dst.__r_.__value_.__l.__size_ = v21;
    __dst.__r_.__value_.__r.__words[2] = v24 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_36;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v20;
  p_dst = &__dst;
  if (v20) {
LABEL_36:
  }
    memmove(p_dst, v19, v21);
  p_dst->__r_.__value_.__s.__data_[v21] = 0;
  xpc_object_t v25 = v58;
  xpc_object_t v26 = std::string::append(&__dst, ": ", 2uLL);
  long long v27 = *(_OWORD *)&v26->__r_.__value_.__l.__data_;
  v63.__r_.__value_.__r.__words[2] = v26->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v63.__r_.__value_.__l.__data_ = v27;
  v26->__r_.__value_.__l.__size_ = 0;
  v26->__r_.__value_.__r.__words[2] = 0;
  v26->__r_.__value_.__r.__words[0] = 0;
  std::string::size_type v28 = strlen(abm::trace::kDiagnosticExtensionDumpingReason);
  id v29 = std::string::append(&v63, abm::trace::kDiagnosticExtensionDumpingReason, v28);
  long long v30 = *(_OWORD *)&v29->__r_.__value_.__l.__data_;
  __p[2] = (void *)v29->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v30;
  v29->__r_.__value_.__l.__size_ = 0;
  v29->__r_.__value_.__r.__words[2] = 0;
  v29->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v63.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_39:
      if (!v58) {
        goto LABEL_45;
      }
      goto LABEL_43;
    }
  }
  else if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_39;
  }
  operator delete(__dst.__r_.__value_.__l.__data_);
  if (!v58) {
    goto LABEL_45;
  }
LABEL_43:
  if (objc_msgSend(v58, "length", v57)) {
    sub_10001E880(__p, (char *)[v58 UTF8String]);
  }
LABEL_45:
  if (SHIBYTE(__p[2]) >= 0) {
    size_t v31 = __p;
  }
  else {
    size_t v31 = (void **)__p[0];
  }
  xpc_object_t v32 = xpc_string_create((const char *)v31);
  if (!v32) {
    xpc_object_t v32 = xpc_null_create();
  }
  xpc_dictionary_set_value(v10, abm::kKeyBasebandResetReason, v32);
  xpc_object_t v33 = xpc_null_create();
  xpc_release(v32);
  xpc_release(v33);
  xpc_object_t v34 = xpc_int64_create(1499000);
  if (!v34) {
    xpc_object_t v34 = xpc_null_create();
  }
  xpc_dictionary_set_value(v10, abm::kKeyTimeout, v34);
  xpc_object_t v35 = xpc_null_create();
  xpc_release(v34);
  xpc_release(v35);
  xpc_object_t v36 = self->fGroupLogDump.gr_name;
  if (v36)
  {
    dispatch_retain((dispatch_object_t)self->fGroupLogDump.gr_name);
    dispatch_group_enter((dispatch_group_t)v36);
  }
  long long v37 = *(NSObject **)&self->fGroupLogDump.gr_gid;
  *(void *)&self->fGroupLogDump.gr_gid = v36;
  if (v37)
  {
    dispatch_group_leave(v37);
    dispatch_release(v37);
  }
  std::string::size_type v38 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEFAULT))
  {
    xpc_object_t v39 = &self->fGroupUpdate;
    if (*((char *)&self->fGroupUpdate.gr_gid + 7) < 0) {
      xpc_object_t v39 = (group *)p_fGroupUpdate->gr_name;
    }
    LODWORD(v63.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)v63.__r_.__value_.__r.__words + 4) = (std::string::size_type)v39;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v38, OS_LOG_TYPE_DEFAULT, "Reset baseband: %s", (uint8_t *)&v63, 0xCu);
  }
  __dst.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)&__dst.__r_.__value_.__l.__data_, self);
  cntrl = self->fManager.__cntrl_;
  v59[1] = self->fManager.__ptr_;
  uint64_t v60 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  xpc_object_t v41 = (const void *)abm::kCommandResetBaseband;
  size_t v42 = strlen(abm::kCommandResetBaseband);
  if (v42 > 0x7FFFFFFFFFFFFFF7) {
    sub_100006DCC();
  }
  std::string::size_type v43 = v42;
  if (v42 >= 0x17)
  {
    uint64_t v45 = (v42 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v42 | 7) != 0x17) {
      uint64_t v45 = v42 | 7;
    }
    uint64_t v46 = v45 + 1;
    xpc_object_t v44 = operator new(v45 + 1);
    v63.__r_.__value_.__l.__size_ = v43;
    v63.__r_.__value_.__r.__words[2] = v46 | 0x8000000000000000;
    v63.__r_.__value_.__r.__words[0] = (std::string::size_type)v44;
    xpc_object_t v25 = v58;
    goto LABEL_69;
  }
  *((unsigned char *)&v63.__r_.__value_.__s + 23) = v42;
  xpc_object_t v44 = &v63;
  if (v42) {
LABEL_69:
  }
    memmove(v44, v41, v43);
  *((unsigned char *)v44 + v43) = 0;
  objc_copyWeak(v59, (id *)&__dst.__r_.__value_.__l.__data_);
  abm::client::PerformCommand();
  if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v63.__r_.__value_.__l.__data_);
  }
  uint64_t v47 = (std::__shared_weak_count *)v60;
  if (v60 && !atomic_fetch_add((atomic_ullong *volatile)v60 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
    std::__shared_weak_count::__release_weak(v47);
  }
  dispatch_time_t v48 = self->fGroupLogDump.gr_name;
  dispatch_time_t v49 = dispatch_time(0, 1500000000000);
  if (dispatch_group_wait((dispatch_group_t)v48, v49))
  {
    long long v50 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_ERROR))
    {
      v63.__r_.__value_.__r.__words[0] = 0x5DC04000100;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v50, OS_LOG_TYPE_ERROR, "Dumping telephony logs with baseband reset not completed in %d sec", (uint8_t *)&v63, 8u);
      xpc_object_t v51 = *(NSObject **)&self->fGroupLogDump.gr_gid;
      *(void *)&self->fGroupLogDump.gr_gid = 0;
      if (!v51) {
        goto LABEL_79;
      }
    }
    else
    {
      xpc_object_t v51 = *(NSObject **)&self->fGroupLogDump.gr_gid;
      *(void *)&self->fGroupLogDump.gr_gid = 0;
      if (!v51)
      {
LABEL_79:
        size_t v52 = &stru_1000313A8;
        goto LABEL_90;
      }
    }
    dispatch_group_leave(v51);
    dispatch_release(v51);
    goto LABEL_79;
  }
  std::string::size_type v53 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_DEFAULT))
  {
    size_t v54 = &self->fGroupUpdate;
    if (*((char *)&self->fGroupUpdate.gr_gid + 7) < 0) {
      size_t v54 = (group *)p_fGroupUpdate->gr_name;
    }
    LODWORD(v63.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)v63.__r_.__value_.__r.__words + 4) = (std::string::size_type)v54;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v53, OS_LOG_TYPE_DEFAULT, "Dumping telephony logs [%s] completed", (uint8_t *)&v63, 0xCu);
  }
  if (*((char *)&self->fGroupUpdate.gr_gid + 7) < 0)
  {
    if (!self->fGroupUpdate.gr_passwd) {
      goto LABEL_79;
    }
    p_fGroupUpdate = (group *)p_fGroupUpdate->gr_name;
  }
  else if (!*((unsigned char *)&self->fGroupUpdate.gr_gid + 7))
  {
    size_t v52 = &stru_1000313A8;
LABEL_91:
    LOBYTE(self->fGroupUpdate.gr_name) = 0;
    *((unsigned char *)&self->fGroupUpdate.gr_gid + 7) = 0;
    goto LABEL_93;
  }
  size_t v52 = +[NSString stringWithUTF8String:p_fGroupUpdate];
LABEL_90:
  if ((*((char *)&self->fGroupUpdate.gr_gid + 7) & 0x80000000) == 0) {
    goto LABEL_91;
  }
  *self->fGroupUpdate.gr_name = 0;
  self->fGroupUpdate.gr_passwd = 0;
LABEL_93:
  uint64_t v55 = v52;
  objc_destroyWeak(v59);
  objc_destroyWeak((id *)&__dst.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p[2]) < 0) {
    operator delete(__p[0]);
  }
  xpc_release(v10);

  return v55;
}

- (BOOL)checkifBasebandTraceEnabled
{
  unint64_t v46 = 0xAAAAAAAAE020E002;
  long long __p = 0uLL;
  uint64_t v48 = 0;
  xpc_object_t object = xpc_null_create();
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if (v3 || (xpc_object_t v3 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v3);
      xpc_object_t v4 = v3;
    }
    else
    {
      xpc_object_t v4 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    xpc_object_t v3 = 0;
  }
  xpc_release(v3);
  xpc_object_t v5 = xpc_string_create(abm::kTraceBaseband);
  if (!v5) {
    xpc_object_t v5 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, abm::kKeyTraceName, v5);
  xpc_object_t v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
  xpc_object_t v7 = xpc_string_create(abm::kKeyEnabled);
  if (!v7) {
    xpc_object_t v7 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, abm::kKeyTracePropertyName, v7);
  xpc_object_t v8 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v8);
  xpc_object_t v9 = xpc_int64_create(5000);
  if (!v9) {
    xpc_object_t v9 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, abm::kKeyTimeout, v9);
  xpc_object_t v10 = xpc_null_create();
  xpc_release(v9);
  xpc_release(v10);
  cntrl = self->fManager.__cntrl_;
  v41[1] = self->fManager.__ptr_;
  size_t v42 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  xpc_object_t v12 = (const void *)abm::kCommandGetTraceProperty;
  size_t v13 = strlen(abm::kCommandGetTraceProperty);
  if (v13 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100006DCC();
  }
  std::string::size_type v14 = v13;
  if (v13 >= 0x17)
  {
    uint64_t v16 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17) {
      uint64_t v16 = v13 | 7;
    }
    uint64_t v17 = v16 + 1;
    p_dst = (std::string *)operator new(v16 + 1);
    __dst.__r_.__value_.__l.__size_ = v14;
    __dst.__r_.__value_.__r.__words[2] = v17 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_22;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v13;
  p_dst = &__dst;
  if (v13) {
LABEL_22:
  }
    memmove(p_dst, v12, v14);
  p_dst->__r_.__value_.__s.__data_[v14] = 0;
  abm::client::PerformCommand();
  LODWORD(v46) = v43.__r_.__value_.__l.__data_;
  if (SHIBYTE(v48) < 0) {
    operator delete((void *)__p);
  }
  long long __p = *(_OWORD *)&v43.__r_.__value_.__r.__words[1];
  uint64_t v48 = v44;
  HIBYTE(v44) = 0;
  v43.__r_.__value_.__s.__data_[8] = 0;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  if (v42 && !atomic_fetch_add((atomic_ullong *volatile)v42 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v42 + 16))(v42);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v42);
    xpc_object_t v18 = object;
    if (object) {
      goto LABEL_33;
    }
  }
  else
  {
    xpc_object_t v18 = object;
    if (object) {
      goto LABEL_33;
    }
  }
  xpc_object_t v18 = xpc_null_create();
  if (!v18)
  {
    xpc_object_t v19 = xpc_null_create();
    xpc_object_t v18 = 0;
    goto LABEL_36;
  }
LABEL_33:
  if (xpc_get_type(v18) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_retain(v18);
    xpc_object_t v19 = v18;
  }
  else
  {
    xpc_object_t v19 = xpc_null_create();
  }
LABEL_36:
  xpc_release(v18);
  if (v46 || xpc_get_type(v19) != (xpc_type_t)&_xpc_type_dictionary)
  {
    size_t v20 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
    {
      sub_100022424(&v43, (uint64_t)&v46);
      std::string::size_type v38 = (v43.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &v43
          : (std::string *)v43.__r_.__value_.__r.__words[0];
      LODWORD(__dst.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)__dst.__r_.__value_.__r.__words + 4) = (std::string::size_type)v38;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_ERROR, "Failed to check if baseband trace enabled: %s", (uint8_t *)&__dst, 0xCu);
      if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v43.__r_.__value_.__l.__data_);
      }
    }
    LOBYTE(v21) = 0;
    goto LABEL_40;
  }
  xpc_object_t value = xpc_dictionary_get_value(v19, abm::kKeyTracePropertyValue);
  v41[0] = value;
  if (value) {
    xpc_retain(value);
  }
  else {
    v41[0] = xpc_null_create();
  }
  xpc::dyn_cast_or_default((uint64_t *)&__dst, (xpc *)v41, abm::kUnknown, v24);
  memset(&buf, 0, sizeof(buf));
  std::to_string(&v43, 1);
  std::string buf = v43;
  char v25 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __dst.__r_.__value_.__l.__size_;
  }
  std::string::size_type v27 = HIBYTE(buf.__r_.__value_.__r.__words[2]);
  int v28 = SHIBYTE(buf.__r_.__value_.__r.__words[2]);
  if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v27 = buf.__r_.__value_.__l.__size_;
  }
  if (size == v27)
  {
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_std::string buf = &buf;
    }
    else {
      p_std::string buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    }
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    {
      BOOL v21 = memcmp(__dst.__r_.__value_.__l.__data_, p_buf, __dst.__r_.__value_.__l.__size_) == 0;
    }
    else
    {
      if (!*((unsigned char *)&__dst.__r_.__value_.__s + 23))
      {
        BOOL v21 = 1;
        if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_74;
        }
        goto LABEL_73;
      }
      uint64_t v30 = HIBYTE(__dst.__r_.__value_.__r.__words[2]) - 1;
      size_t v31 = &__dst;
      do
      {
        int v33 = v31->__r_.__value_.__s.__data_[0];
        size_t v31 = (std::string *)((char *)v31 + 1);
        int v32 = v33;
        int v35 = p_buf->__r_.__value_.__s.__data_[0];
        p_std::string buf = (std::string *)((char *)p_buf + 1);
        int v34 = v35;
        BOOL v37 = v30-- != 0;
        BOOL v21 = v32 == v34;
      }
      while (v32 == v34 && v37);
    }
    if (v28 < 0)
    {
LABEL_73:
      operator delete(buf.__r_.__value_.__l.__data_);
      char v25 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
    }
  }
  else
  {
    BOOL v21 = 0;
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_73;
    }
  }
LABEL_74:
  if (v25 < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  xpc_release(v41[0]);
  xpc_object_t v39 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_DEFAULT))
  {
    memset(&__dst, 0, sizeof(__dst));
    std::to_string(&v43, v21);
    std::string __dst = v43;
    long long v40 = &__dst;
    if ((v43.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      long long v40 = (std::string *)__dst.__r_.__value_.__r.__words[0];
    }
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v40;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v39, OS_LOG_TYPE_DEFAULT, "Baseband trace enabled: %s", (uint8_t *)&buf, 0xCu);
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__dst.__r_.__value_.__l.__data_);
    }
  }
LABEL_40:
  xpc_release(v19);
  xpc_release(v4);
  if (SHIBYTE(v48) < 0) {
    operator delete((void *)__p);
  }
  return v21;
}

- (BOOL)checkifDefaultBasebandProfileInstalled
{
  unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v26 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  abm::HelperClient::create();
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (v2 || (xpc_object_t v2 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v2);
      xpc_object_t v3 = v2;
    }
    else
    {
      xpc_object_t v3 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
    xpc_object_t v2 = 0;
  }
  xpc_release(v2);
  xpc_object_t v4 = xpc_string_create(abm::helper::kDefaultCarrierLoggingProfileName);
  if (!v4) {
    xpc_object_t v4 = xpc_null_create();
  }
  xpc_dictionary_set_value(v3, abm::helper::kKeyProfileName, v4);
  xpc_object_t v5 = xpc_null_create();
  xpc_release(v4);
  xpc_release(v5);
  xpc_object_t xdict = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v7 = v6;
  if (v6)
  {
    xpc_object_t xdict = v6;
  }
  else
  {
    xpc_object_t v7 = xpc_null_create();
    xpc_object_t xdict = v7;
    if (!v7)
    {
      xpc_object_t v8 = xpc_null_create();
      xpc_object_t v7 = 0;
      goto LABEL_16;
    }
  }
  if (xpc_get_type(v7) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_retain(v7);
    goto LABEL_17;
  }
  xpc_object_t v8 = xpc_null_create();
LABEL_16:
  xpc_object_t xdict = v8;
LABEL_17:
  xpc_release(v7);
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)long long __p = v9;
  long long v21 = v9;
  xpc_object_t object = v3;
  if (v3) {
    xpc_retain(v3);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  abm::HelperClient::perform();
  xpc_release(object);
  if (!LODWORD(__p[0]) && xpc_get_type(xdict) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_object_t value = xpc_dictionary_get_value(xdict, abm::helper::kKeyProfileIsInstalled);
    *(void *)std::string::size_type v27 = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      *(void *)std::string::size_type v27 = xpc_null_create();
    }
    int v11 = xpc::dyn_cast_or_default((xpc *)v27, 0, v15);
    xpc_release(*(xpc_object_t *)v27);
    uint64_t v16 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = "not found";
      if (v11) {
        uint64_t v17 = "found";
      }
      *(_DWORD *)std::string::size_type v27 = 136315138;
      *(void *)&v27[4] = v17;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "Installed baseband profile %s", v27, 0xCu);
    }
  }
  else
  {
    xpc_object_t v10 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      sub_100022424(v27, (uint64_t)__p);
      xpc_object_t v18 = v28 >= 0 ? v27 : *(unsigned char **)v27;
      *(_DWORD *)std::string buf = 136315138;
      uint64_t v30 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_ERROR, "Failed to check if baseband profile installed: %s", buf, 0xCu);
      if (v28 < 0) {
        operator delete(*(void **)v27);
      }
    }
    LOBYTE(v11) = 0;
  }
  if (SHIBYTE(v21) < 0) {
    operator delete(__p[1]);
  }
  xpc_release(xdict);
  xpc_release(v3);
  xpc_object_t v12 = (std::__shared_weak_count *)v26;
  if (v26 && !atomic_fetch_add((atomic_ullong *volatile)(v26 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  return v11;
}

- (BOOL)installDELoggingProfile
{
  unint64_t v26 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  abm::HelperClient::create();
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (v2 || (xpc_object_t v2 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v2);
      xpc_object_t v3 = v2;
    }
    else
    {
      xpc_object_t v3 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
    xpc_object_t v2 = 0;
  }
  xpc_release(v2);
  xpc_object_t v4 = xpc_string_create(abm::helper::kDefaultDELoggingProfileName);
  if (!v4) {
    xpc_object_t v4 = xpc_null_create();
  }
  xpc_dictionary_set_value(v3, abm::helper::kKeyProfileName, v4);
  xpc_object_t v5 = xpc_null_create();
  xpc_release(v4);
  xpc_release(v5);
  xpc_object_t v6 = xpc_BOOL_create(0);
  if (!v6) {
    xpc_object_t v6 = xpc_null_create();
  }
  xpc_dictionary_set_value(v3, abm::helper::kKeyRequireUserConfirmation, v6);
  xpc_object_t v7 = xpc_null_create();
  xpc_release(v6);
  xpc_release(v7);
  xpc_object_t v23 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v9 = v8;
  if (v8)
  {
    xpc_object_t v23 = v8;
  }
  else
  {
    xpc_object_t v9 = xpc_null_create();
    xpc_object_t v23 = v9;
    if (!v9)
    {
      xpc_object_t v10 = xpc_null_create();
      xpc_object_t v9 = 0;
      goto LABEL_18;
    }
  }
  if (xpc_get_type(v9) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_retain(v9);
    goto LABEL_19;
  }
  xpc_object_t v10 = xpc_null_create();
LABEL_18:
  xpc_object_t v23 = v10;
LABEL_19:
  xpc_release(v9);
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)long long v21 = v11;
  long long v22 = v11;
  xpc_object_t object = v3;
  if (v3) {
    xpc_retain(v3);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  abm::HelperClient::perform();
  xpc_release(object);
  xpc_object_t object = 0;
  if (LODWORD(v21[0]))
  {
    xpc_object_t v12 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
      sub_100022424(__p, (uint64_t)v21);
      size_t v13 = v19 >= 0 ? __p : (void **)__p[0];
      *(_DWORD *)std::string buf = 136315138;
      id v29 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_ERROR, "Install logging profile failed : %s", buf, 0xCu);
      if (v19 < 0) {
        operator delete(__p[0]);
      }
    }
  }
  else
  {
    std::string::size_type v14 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "Install logging profile success", (uint8_t *)__p, 2u);
    }
  }
  int v15 = (int)v21[0];
  if (SHIBYTE(v22) < 0) {
    operator delete(v21[1]);
  }
  xpc_release(v23);
  xpc_release(v3);
  uint64_t v16 = (std::__shared_weak_count *)v27;
  if (v27 && !atomic_fetch_add((atomic_ullong *volatile)(v27 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
  return v15 == 0;
}

- (BOOL)uninstallDELoggingProfile
{
  unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  abm::HelperClient::create();
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  if (v2 || (xpc_object_t v2 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v2);
      xpc_object_t v3 = v2;
    }
    else
    {
      xpc_object_t v3 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
    xpc_object_t v2 = 0;
  }
  xpc_release(v2);
  xpc_object_t v4 = xpc_string_create(abm::helper::kDefaultDELoggingProfileName);
  if (!v4) {
    xpc_object_t v4 = xpc_null_create();
  }
  xpc_dictionary_set_value(v3, abm::helper::kKeyProfileName, v4);
  xpc_object_t v5 = xpc_null_create();
  xpc_release(v4);
  xpc_release(v5);
  xpc_object_t v21 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v7 = v6;
  if (v6)
  {
    xpc_object_t v21 = v6;
  }
  else
  {
    xpc_object_t v7 = xpc_null_create();
    xpc_object_t v21 = v7;
    if (!v7)
    {
      xpc_object_t v8 = xpc_null_create();
      xpc_object_t v7 = 0;
      goto LABEL_16;
    }
  }
  if (xpc_get_type(v7) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_retain(v7);
    goto LABEL_17;
  }
  xpc_object_t v8 = xpc_null_create();
LABEL_16:
  xpc_object_t v21 = v8;
LABEL_17:
  xpc_release(v7);
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)char v19 = v9;
  long long v20 = v9;
  xpc_object_t object = v3;
  if (v3) {
    xpc_retain(v3);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  abm::HelperClient::perform();
  xpc_release(object);
  xpc_object_t object = 0;
  if (LODWORD(v19[0]))
  {
    xpc_object_t v10 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      sub_100022424(__p, (uint64_t)v19);
      long long v11 = v17 >= 0 ? __p : (void **)__p[0];
      *(_DWORD *)std::string buf = 136315138;
      unint64_t v27 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_ERROR, "Uninstall logging profile failed : %s", buf, 0xCu);
      if (v17 < 0) {
        operator delete(__p[0]);
      }
    }
  }
  else
  {
    xpc_object_t v12 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "Uninstall logging profile success", (uint8_t *)__p, 2u);
    }
  }
  int v13 = (int)v19[0];
  if (SHIBYTE(v20) < 0) {
    operator delete(v19[1]);
  }
  xpc_release(v21);
  xpc_release(v3);
  std::string::size_type v14 = (std::__shared_weak_count *)v25;
  if (v25 && !atomic_fetch_add((atomic_ullong *volatile)(v25 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
  }
  return v13 == 0;
}

- (BOOL)updateTraceProperties:(array)a3
{
  if (self->fManager.__ptr_)
  {
    fObj = a3.var0.fObj;
    xpc_object_t v4 = self;
    xpc_type_t type = xpc_get_type(*(xpc_object_t *)a3.var0.fObj);
    xpc_object_t v6 = (const _xpc_type_s *)&_xpc_type_array;
    xpc_object_t v7 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
    BOOL v8 = os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT);
    if (type != (xpc_type_t)&_xpc_type_array)
    {
      if (!v8)
      {
        char v10 = 0;
        return v10 & 1;
      }
      *(_WORD *)std::string buf = 0;
      long long v9 = "Invalid parameter";
      goto LABEL_7;
    }
    if (v8)
    {
      xpc::object::to_string((uint64_t *)buf, (xpc::object *)fObj);
      long long v11 = (SBYTE7(v52) & 0x80u) == 0 ? buf : *(uint8_t **)buf;
      *(_DWORD *)std::string::size_type v53 = 136315138;
      *(void *)&v53[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "Update trace properties: %s", v53, 0xCu);
      if (SBYTE7(v52) < 0) {
        operator delete(*(void **)buf);
      }
    }
    xpc_object_t v12 = *(xpc_object_t *)fObj;
    if (*(void *)fObj)
    {
      xpc_retain(*(xpc_object_t *)fObj);
    }
    else
    {
      xpc_object_t v12 = xpc_null_create();
      if (!v12)
      {
        xpc_object_t v12 = xpc_null_create();
        int v13 = 0;
        goto LABEL_19;
      }
    }
    xpc_retain(v12);
    int v13 = v12;
LABEL_19:
    xpc_release(v13);
    size_t v14 = 0;
    int v15 = (const char *)abm::kKeyTimeout;
    key = (char *)abm::kKeyTracePropertyWaitForCompletion;
    xpc_object_t v43 = v12;
    uint64_t v44 = (char *)abm::kKeyTraceName;
    long long __s = (char *)abm::kCommandSetTraceProperty;
    char v10 = 1;
    while (1)
    {
      xpc_object_t v17 = *(xpc_object_t *)fObj;
      if (*(void *)fObj) {
        xpc_retain(*(xpc_object_t *)fObj);
      }
      else {
        xpc_object_t v17 = xpc_null_create();
      }
      if (xpc_get_type(*(xpc_object_t *)fObj) == v6)
      {
        size_t count = xpc_array_get_count(*(xpc_object_t *)fObj);
        if (!v17)
        {
LABEL_29:
          xpc_object_t v19 = xpc_null_create();
          goto LABEL_30;
        }
      }
      else
      {
        size_t count = 0;
        if (!v17) {
          goto LABEL_29;
        }
      }
      xpc_retain(v17);
      xpc_object_t v19 = v17;
LABEL_30:
      xpc_release(v17);
      xpc_release(v19);
      if (v14 == count && v12 == v19)
      {
        xpc_release(v12);
        return v10 & 1;
      }
      xpc_object_t value = xpc_array_get_value(v12, v14);
      xpc_object_t v21 = value;
      if (value)
      {
        xpc_retain(value);
      }
      else
      {
        xpc_object_t v21 = xpc_null_create();
        if (!v21)
        {
          xpc_object_t v22 = xpc_null_create();
          xpc_object_t v21 = 0;
          goto LABEL_39;
        }
      }
      if (xpc_get_type(v21) == (xpc_type_t)&_xpc_type_dictionary)
      {
        xpc_retain(v21);
        xpc_object_t v22 = v21;
      }
      else
      {
        xpc_object_t v22 = xpc_null_create();
      }
LABEL_39:
      xpc_release(v21);
      xpc_object_t v23 = xpc_int64_create(5000);
      if (!v23) {
        xpc_object_t v23 = xpc_null_create();
      }
      xpc_dictionary_set_value(v22, v15, v23);
      xpc_object_t v24 = xpc_null_create();
      xpc_release(v23);
      xpc_release(v24);
      xpc_object_t v25 = xpc_BOOL_create(0);
      if (!v25) {
        xpc_object_t v25 = xpc_null_create();
      }
      xpc_dictionary_set_value(v22, key, v25);
      xpc_object_t v26 = xpc_null_create();
      xpc_release(v25);
      xpc_release(v26);
      memset(v53, 170, sizeof(v53));
      xpc_object_t v27 = xpc_dictionary_get_value(v22, v44);
      *(void *)std::string buf = v27;
      if (v27) {
        xpc_retain(v27);
      }
      else {
        *(void *)std::string buf = xpc_null_create();
      }
      xpc::dyn_cast_or_default((uint64_t *)v53, (xpc *)buf, (const object *)"", v28);
      xpc_release(*(xpc_object_t *)buf);
      *(void *)&long long v29 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)std::string buf = v29;
      long long v52 = v29;
      cntrl = v4->fManager.__cntrl_;
      ptr = v4->fManager.__ptr_;
      long long v50 = (std::__shared_weak_count *)cntrl;
      if (cntrl) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
      }
      size_t v31 = strlen(__s);
      if (v31 >= 0x7FFFFFFFFFFFFFF8) {
        sub_100006DCC();
      }
      int v32 = (void *)v31;
      if (v31 >= 0x17)
      {
        int v34 = fObj;
        int v35 = v15;
        xpc_object_t v36 = v4;
        BOOL v37 = v6;
        uint64_t v38 = (v31 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v31 | 7) != 0x17) {
          uint64_t v38 = v31 | 7;
        }
        uint64_t v39 = v38 + 1;
        int v33 = (void **)operator new(v38 + 1);
        __dst[1] = v32;
        unint64_t v48 = v39 | 0x8000000000000000;
        __dst[0] = v33;
        xpc_object_t v6 = v37;
        xpc_object_t v4 = v36;
        int v15 = v35;
        fObj = v34;
        xpc_object_t v12 = v43;
LABEL_55:
        memmove(v33, __s, (size_t)v32);
        goto LABEL_56;
      }
      HIBYTE(v48) = v31;
      int v33 = __dst;
      if (v31) {
        goto LABEL_55;
      }
LABEL_56:
      *((unsigned char *)v32 + (void)v33) = 0;
      abm::client::PerformCommand();
      if (SHIBYTE(v48) < 0)
      {
        operator delete(__dst[0]);
        long long v40 = v50;
        if (!v50) {
          goto LABEL_61;
        }
      }
      else
      {
        long long v40 = v50;
        if (!v50) {
          goto LABEL_61;
        }
      }
      if (atomic_fetch_add(&v40->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
LABEL_61:
        BOOL v41 = *(_DWORD *)buf == 0;
        if (SHIBYTE(v52) < 0) {
          goto LABEL_66;
        }
        goto LABEL_62;
      }
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
      BOOL v41 = *(_DWORD *)buf == 0;
      if (SHIBYTE(v52) < 0)
      {
LABEL_66:
        operator delete(*(void **)&buf[8]);
        if (((char)v53[23] & 0x80000000) == 0) {
          goto LABEL_63;
        }
        goto LABEL_67;
      }
LABEL_62:
      if (((char)v53[23] & 0x80000000) == 0) {
        goto LABEL_63;
      }
LABEL_67:
      operator delete(*(void **)v53);
LABEL_63:
      xpc_release(v22);
      if (v12)
      {
        xpc_retain(v12);
        xpc_object_t v16 = v12;
      }
      else
      {
        xpc_object_t v16 = xpc_null_create();
      }
      v10 &= v41;
      ++v14;
      xpc_release(v16);
    }
  }
  xpc_object_t v7 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  char v10 = 0;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    long long v9 = "Invalid manager";
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
    char v10 = 0;
  }
  return v10 & 1;
}

- (BOOL)enableBasebandLog:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = (const char *)[v4 UTF8String];
  size_t v6 = strlen(v5);
  if (v6 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100006DCC();
  }
  xpc_object_t v7 = (void *)v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    BOOL v8 = (void **)operator new(v9 + 1);
    __dst[1] = v7;
    unint64_t v22 = v10 | 0x8000000000000000;
    __dst[0] = v8;
  }
  else
  {
    HIBYTE(v22) = v6;
    BOOL v8 = __dst;
    if (!v6) {
      goto LABEL_9;
    }
  }
  memmove(v8, v5, (size_t)v7);
LABEL_9:
  *((unsigned char *)v7 + (void)v8) = 0;
  util::readPlistToCFDictionary((uint64_t)__dst, cf);
  long long v11 = *(void **)cf;
  if (!*(void *)cf || (CFTypeID v12 = CFGetTypeID(*(CFTypeRef *)cf), v12 != CFDictionaryGetTypeID()))
  {
    long long v11 = 0;
    xpc_object_t v23 = 0;
    int v13 = *(const void **)cf;
    if (!*(void *)cf) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  xpc_object_t v23 = v11;
  CFRetain(v11);
  int v13 = *(const void **)cf;
  if (*(void *)cf) {
LABEL_14:
  }
    CFRelease(v13);
LABEL_15:
  if (SHIBYTE(v22) < 0) {
    operator delete(__dst[0]);
  }
  size_t v14 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)cf = 138412290;
    *(void *)&cf[4] = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "Update trace property with logConfig: %@", cf, 0xCu);
  }
  ctu::cf_to_xpc((uint64_t *)cf, (ctu *)v11, v15);
  xpc_object_t v16 = *(void **)cf;
  xpc_object_t v19 = *(xpc_object_t *)cf;
  if (*(void *)cf && xpc_get_type(*(xpc_object_t *)cf) == (xpc_type_t)&_xpc_type_dictionary) {
    xpc_retain(v16);
  }
  else {
    xpc_object_t v19 = xpc_null_create();
  }
  logs::convertToTraceProperties(&v19, &object);
  BOOL v17 = [(BasebandLogDEHelper *)self updateTraceProperties:&object];
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v19);
  xpc_object_t v19 = 0;
  xpc_release(*(xpc_object_t *)cf);
  if (v11) {
    CFRelease(v11);
  }

  return v17;
}

- (BOOL)disableBasebandLog
{
  xpc_object_t v3 = +[ABMDiagnosticExtensionLogging getOSLogHandler];
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Update trace property to default setting", buf, 2u);
  }
  logs::getDefaultTraceProperties(&object);
  BOOL v4 = [(BasebandLogDEHelper *)self updateTraceProperties:&object];
  xpc_release(object);
  return v4;
}

- (void).cxx_destruct
{
  if (*((char *)&self->fGroupUpdate.gr_gid + 7) < 0)
  {
    operator delete(self->fGroupUpdate.gr_name);
    gr_mem = self->fGroupLogDump.gr_mem;
    if (!gr_mem) {
      goto LABEL_7;
    }
  }
  else
  {
    gr_mem = self->fGroupLogDump.gr_mem;
    if (!gr_mem) {
      goto LABEL_7;
    }
  }
  dispatch_group_leave((dispatch_group_t)gr_mem);
  BOOL v4 = self->fGroupLogDump.gr_mem;
  if (v4) {
    dispatch_release((dispatch_object_t)v4);
  }
LABEL_7:
  xpc_object_t v5 = *(NSObject **)&self->fGroupLogDump.gr_gid;
  if (v5)
  {
    dispatch_group_leave(v5);
    size_t v6 = *(NSObject **)&self->fGroupLogDump.gr_gid;
    if (v6) {
      dispatch_release(v6);
    }
  }
  gr_passwd = self->fGroupLogDump.gr_passwd;
  if (gr_passwd) {
    dispatch_release((dispatch_object_t)gr_passwd);
  }
  gr_name = self->fGroupLogDump.gr_name;
  if (gr_name) {
    dispatch_release((dispatch_object_t)gr_name);
  }
  cntrl = self->fManager.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    fObj = self->fQueue.fObj.fObj;
    if (!fObj) {
      return;
    }
  }
  else
  {
    fObj = self->fQueue.fObj.fObj;
    if (!fObj) {
      return;
    }
  }
  dispatch_release(fObj);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end