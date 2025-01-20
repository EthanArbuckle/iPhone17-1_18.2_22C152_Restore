@interface DataUsageDatabaseMonitor
+ (BOOL)foundBreadcrumb:(id)a3 withRegistry:(const void *)a4;
+ (BOOL)foundDeletePersistentStoreBreadcrumb;
+ (BOOL)foundDestroyPersistentStoreBreadcrumb;
+ (BOOL)foundInitialWorkspaceSaveBreadcrumb;
+ (BOOL)foundIntegrityCheckBreadcrumbAboveThreshold:(BOOL)a3;
+ (BOOL)launchHealthCheck:(id)a3 withRegistry:(const void *)a4;
+ (unint64_t)integrityCheckBreadcrumbCount;
+ (void)appendLaunchTime;
+ (void)clearDeletePersistentStoreBreadcrumb;
+ (void)clearDestroyPersistentStoreBreadcrumb;
+ (void)clearInitialWorkspaceSaveBreadcrumb;
+ (void)clearIntegrityCheckBreadcrumb;
+ (void)leaveBreadcrumbForDeletePersistentStore;
+ (void)leaveBreadcrumbForDestroyPersistentStore;
+ (void)leaveBreadcrumbForInitialWorkspaceSave;
+ (void)leaveBreadcrumbForIntegrityCheck;
- (BOOL)deleteDatabaseIfCorrupted;
- (DataUsageDatabaseMonitor)initWithRegistry:(const void *)a3;
- (id).cxx_construct;
- (int64_t)handleFaultingError:(id)a3 fromContext:(id)a4;
- (void)deleteDatabaseCompleted:(BOOL)a3 error:(id)a4;
- (void)deleteDatabaseStarted;
- (void)destroyPersistentStoreCompleted:(BOOL)a3 error:(id)a4;
- (void)destroyPersistentStoreStarted;
- (void)integrityCheckCompleted:(BOOL)a3 error:(id)a4;
- (void)integrityCheckStarted;
- (void)launchBreadcrumbingProcess:(id)a3;
@end

@implementation DataUsageDatabaseMonitor

- (DataUsageDatabaseMonitor)initWithRegistry:(const void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DataUsageDatabaseMonitor;
  v4 = [(DataUsageDatabaseMonitor *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v7 = *(Registry **)a3;
    uint64_t v6 = *((void *)a3 + 1);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_registry.__cntrl_;
    v5->_registry.__ptr_ = v7;
    v5->_registry.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl) {
      sub_10004D2C8(cntrl);
    }
  }
  return v5;
}

- (BOOL)deleteDatabaseIfCorrupted
{
  BOOL v3 = +[DataUsageDatabaseMonitor foundDeletePersistentStoreBreadcrumb];
  v4 = *(NSObject **)getDataUsageLog();
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "DATA LOSS: Attempting to force delete database file due to corruption", (uint8_t *)&buf, 2u);
    }
    xpc_object_t v81 = 0;
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t v6 = v5;
    if (v5)
    {
      xpc_object_t v81 = v5;
    }
    else
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_object_t v81 = v6;
      if (!v6)
      {
        xpc_object_t v7 = xpc_null_create();
        xpc_object_t v6 = 0;
        goto LABEL_13;
      }
    }
    if (xpc_get_type(v6) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v6);
      goto LABEL_14;
    }
    xpc_object_t v7 = xpc_null_create();
LABEL_13:
    xpc_object_t v81 = v7;
LABEL_14:
    xpc_release(v6);
    v59 = self;
    long long buf = 0uLL;
    int64_t v80 = 0;
    v8 = sub_1001D2EC8();
    v9 = (char *)v8;
    if (*((char *)v8 + 23) >= 0) {
      size_t v10 = *((unsigned __int8 *)v8 + 23);
    }
    else {
      size_t v10 = *((void *)v8 + 1);
    }
    memset(&v77, 0, sizeof(v77));
    sub_1000C140C((uint64_t)&v77, v10 + 1);
    if ((v77.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v11 = &v77;
    }
    else {
      v11 = (std::string *)v77.__r_.__value_.__r.__words[0];
    }
    if (v10)
    {
      if (v9[23] >= 0) {
        v12 = v9;
      }
      else {
        v12 = *(char **)v9;
      }
      memmove(v11, v12, v10);
    }
    *(_WORD *)((char *)&v11->__r_.__value_.__l.__data_ + v10) = 47;
    sub_100058DB0(&v82, "DataUsage");
    if ((v83 & 0x80u) == 0) {
      v13 = (const std::string::value_type *)&v82;
    }
    else {
      v13 = (const std::string::value_type *)v82;
    }
    if ((v83 & 0x80u) == 0) {
      std::string::size_type v14 = v83;
    }
    else {
      std::string::size_type v14 = *((void *)&v82 + 1);
    }
    v15 = std::string::append(&v77, v13, v14);
    long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
    v78.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v78.__r_.__value_.__l.__data_ = v16;
    v15->__r_.__value_.__l.__size_ = 0;
    v15->__r_.__value_.__r.__words[2] = 0;
    v15->__r_.__value_.__r.__words[0] = 0;
    v17 = std::string::append(&v78, ".sqlite", 7uLL);
    long long v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
    int64_t v80 = v17->__r_.__value_.__r.__words[2];
    long long buf = v18;
    v17->__r_.__value_.__l.__size_ = 0;
    v17->__r_.__value_.__r.__words[2] = 0;
    v17->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v78.__r_.__value_.__l.__data_);
    }
    if ((char)v83 < 0) {
      operator delete((void *)v82);
    }
    if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v77.__r_.__value_.__l.__data_);
    }
    if (v80 >= 0) {
      size_t v19 = HIBYTE(v80);
    }
    else {
      size_t v19 = *((void *)&buf + 1);
    }
    memset(&v78, 0, sizeof(v78));
    v20 = &v78;
    sub_1000C140C((uint64_t)&v78, v19 + 4);
    if ((v78.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      v20 = (std::string *)v78.__r_.__value_.__r.__words[0];
    }
    if (v19)
    {
      if (v80 >= 0) {
        p_long long buf = &buf;
      }
      else {
        p_long long buf = (long long *)buf;
      }
      memmove(v20, p_buf, v19);
    }
    strcpy((char *)v20 + v19, "-wal");
    if (v80 >= 0) {
      size_t v22 = HIBYTE(v80);
    }
    else {
      size_t v22 = *((void *)&buf + 1);
    }
    memset(&v77, 0, sizeof(v77));
    v23 = &v77;
    sub_1000C140C((uint64_t)&v77, v22 + 4);
    if ((v77.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      v23 = (std::string *)v77.__r_.__value_.__r.__words[0];
    }
    if (v22)
    {
      if (v80 >= 0) {
        v24 = &buf;
      }
      else {
        v24 = (long long *)buf;
      }
      memmove(v23, v24, v22);
    }
    strcpy((char *)v23 + v22, "-shm");
    v25 = +[NSFileManager defaultManager];
    if (v80 >= 0) {
      v26 = &buf;
    }
    else {
      v26 = (long long *)buf;
    }
    v27 = +[NSString stringWithUTF8String:v26];
    v28 = +[NSURL fileURLWithPath:v27];
    id v76 = 0;
    unsigned int v29 = [v25 removeItemAtURL:v28 error:&v76];
    id v60 = v76;

    if (v29)
    {
      v30 = *(NSObject **)getDataUsageLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v82) = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#I Successfully deleted corrupt database main file", (uint8_t *)&v82, 2u);
      }
      xpc_object_t v74 = xpc_BOOL_create(1);
      if (!v74) {
        xpc_object_t v74 = xpc_null_create();
      }
      *(void *)&long long v82 = &v81;
      *((void *)&v82 + 1) = "dbDeleted";
      sub_100035E70((uint64_t)&v82, &v74, &object);
      xpc_release(object);
      xpc_object_t object = 0;
      xpc_release(v74);
      xpc_object_t v74 = 0;
    }
    else
    {
      v31 = *(NSObject **)getDataUsageLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v82) = 138412290;
        *(void *)((char *)&v82 + 4) = v60;
        _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to delete the corrupt database main file with error: %@", (uint8_t *)&v82, 0xCu);
      }
      xpc_object_t v72 = xpc_BOOL_create(0);
      if (!v72) {
        xpc_object_t v72 = xpc_null_create();
      }
      *(void *)&long long v82 = &v81;
      *((void *)&v82 + 1) = "dbDeleted";
      sub_100035E70((uint64_t)&v82, &v72, &v73);
      xpc_release(v73);
      xpc_object_t v73 = 0;
      xpc_release(v72);
      xpc_object_t v72 = 0;
    }
    if ((v78.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v32 = &v78;
    }
    else {
      v32 = (std::string *)v78.__r_.__value_.__r.__words[0];
    }
    v33 = +[NSString stringWithUTF8String:v32];
    v34 = +[NSURL fileURLWithPath:v33];
    id v71 = 0;
    unsigned int v35 = [v25 removeItemAtURL:v34 error:&v71];
    id v36 = v71;

    if (v35)
    {
      v37 = *(NSObject **)getDataUsageLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v82) = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "#I Successfully deleted corrupt database WAL file", (uint8_t *)&v82, 2u);
      }
      xpc_object_t v69 = xpc_BOOL_create(1);
      if (!v69) {
        xpc_object_t v69 = xpc_null_create();
      }
      *(void *)&long long v82 = &v81;
      *((void *)&v82 + 1) = "dbWalDeleted";
      sub_100035E70((uint64_t)&v82, &v69, &v70);
      xpc_release(v70);
      xpc_object_t v70 = 0;
      xpc_release(v69);
      xpc_object_t v69 = 0;
    }
    else
    {
      v38 = *(NSObject **)getDataUsageLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v82) = 138412290;
        *(void *)((char *)&v82 + 4) = v36;
        _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Failed to delete the corrupt database WAL file with error: %@", (uint8_t *)&v82, 0xCu);
      }
      xpc_object_t v67 = xpc_BOOL_create(0);
      if (!v67) {
        xpc_object_t v67 = xpc_null_create();
      }
      *(void *)&long long v82 = &v81;
      *((void *)&v82 + 1) = "dbWalDeleted";
      sub_100035E70((uint64_t)&v82, &v67, &v68);
      xpc_release(v68);
      xpc_object_t v68 = 0;
      xpc_release(v67);
      xpc_object_t v67 = 0;
    }
    if ((v77.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v39 = &v77;
    }
    else {
      v39 = (std::string *)v77.__r_.__value_.__r.__words[0];
    }
    v40 = +[NSString stringWithUTF8String:v39];
    v41 = +[NSURL fileURLWithPath:v40];
    id v66 = 0;
    unsigned int v42 = [v25 removeItemAtURL:v41 error:&v66];
    id v43 = v66;

    if (v42)
    {
      v44 = *(NSObject **)getDataUsageLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v82) = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "#I Successfully deleted corrupt database SHM file", (uint8_t *)&v82, 2u);
      }
      xpc_object_t v64 = xpc_BOOL_create(1);
      if (!v64) {
        xpc_object_t v64 = xpc_null_create();
      }
      *(void *)&long long v82 = &v81;
      *((void *)&v82 + 1) = "dbShmDeleted";
      sub_100035E70((uint64_t)&v82, &v64, &v65);
      xpc_release(v65);
      xpc_object_t v65 = 0;
      xpc_release(v64);
      xpc_object_t v64 = 0;
      if ((v29 & v35) == 1)
      {
        v45 = *(NSObject **)getDataUsageLog();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v82) = 0;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "#I All corrupt database files deleted successfully, DataUsage service starting with a fresh database", (uint8_t *)&v82, 2u);
        }
        +[DataUsageDatabaseMonitor clearDeletePersistentStoreBreadcrumb];
        goto LABEL_104;
      }
    }
    else
    {
      v46 = *(NSObject **)getDataUsageLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v82) = 138412290;
        *(void *)((char *)&v82 + 4) = v43;
        _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Failed to delete the corrupt database SHM file with error: %@", (uint8_t *)&v82, 0xCu);
      }
      xpc_object_t v62 = xpc_BOOL_create(0);
      if (!v62) {
        xpc_object_t v62 = xpc_null_create();
      }
      *(void *)&long long v82 = &v81;
      *((void *)&v82 + 1) = "dbShmDeleted";
      sub_100035E70((uint64_t)&v82, &v62, &v63);
      xpc_release(v63);
      xpc_object_t v63 = 0;
      xpc_release(v62);
      xpc_object_t v62 = 0;
    }
    v47 = *(NSObject **)getDataUsageLog();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v82) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "At least one database file deleted unsuccessfully, DataUsage service may be starting with a corrupt database", (uint8_t *)&v82, 2u);
    }
LABEL_104:
    ServiceMap = (std::mutex *)Registry::getServiceMap(v59->_registry.__ptr_);
    v49 = ServiceMap;
    if (v50 < 0)
    {
      v51 = (unsigned __int8 *)(v50 & 0x7FFFFFFFFFFFFFFFLL);
      uint64_t v52 = 5381;
      do
      {
        uint64_t v50 = v52;
        unsigned int v53 = *v51++;
        uint64_t v52 = (33 * v52) ^ v53;
      }
      while (v53);
    }
    std::mutex::lock(ServiceMap);
    *(void *)&long long v82 = v50;
    v54 = sub_10004D37C(&v49[1].__m_.__sig, (unint64_t *)&v82);
    if (v54)
    {
      uint64_t v56 = v54[3];
      v55 = (std::__shared_weak_count *)v54[4];
      if (v55)
      {
        atomic_fetch_add_explicit(&v55->__shared_owners_, 1uLL, memory_order_relaxed);
        std::mutex::unlock(v49);
        atomic_fetch_add_explicit(&v55->__shared_owners_, 1uLL, memory_order_relaxed);
        sub_10004D2C8(v55);
        char v57 = 0;
        if (!v56) {
          goto LABEL_117;
        }
        goto LABEL_113;
      }
    }
    else
    {
      uint64_t v56 = 0;
    }
    std::mutex::unlock(v49);
    v55 = 0;
    char v57 = 1;
    if (!v56)
    {
LABEL_117:
      if ((v57 & 1) == 0) {
        sub_10004D2C8(v55);
      }

      if (SHIBYTE(v77.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v77.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v78.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v80) < 0) {
        operator delete((void *)buf);
      }
      xpc_release(v81);
      return v3;
    }
LABEL_113:
    xpc_object_t v61 = v81;
    if (v81) {
      xpc_retain(v81);
    }
    else {
      xpc_object_t v61 = xpc_null_create();
    }
    (*(void (**)(uint64_t, const char *, xpc_object_t *))(*(void *)v56 + 16))(v56, "DuDbMonitor.deleteCorruptDatabase", &v61);
    xpc_release(v61);
    xpc_object_t v61 = 0;
    goto LABEL_117;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I No DataUsage database files detected to be corrupt from faulting, DataUsage service starting with a valid existing database", (uint8_t *)&buf, 2u);
  }
  return v3;
}

- (void)launchBreadcrumbingProcess:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    xpc_object_t v6 = *(NSObject **)getDataUsageLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I Breadcrumbing process started", (uint8_t *)&v13, 2u);
    }
    [v5 setHealthDelegate:self];
    objc_storeStrong((id *)&self->_workspace, a3);
    unsigned int v7 = +[DataUsageDatabaseMonitor launchHealthCheck:v5 withRegistry:&self->_registry];
    if (v7) {
      +[DataUsageDatabaseMonitor leaveBreadcrumbForInitialWorkspaceSave];
    }
    unsigned __int8 v8 = [v5 save];
    v9 = [v5 persistentStoreCoordinator];
    [v9 setDelegate:self];

    if (v7) {
      +[DataUsageDatabaseMonitor clearInitialWorkspaceSaveBreadcrumb];
    }
    [v5 setHealthDelegate:0];
    if ((v8 & 1) == 0)
    {
      size_t v10 = *(NSObject **)getDataUsageLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = [v5 persistentStoreError];
        int v13 = 138412290;
        std::string::size_type v14 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Workspace allocated but non functional due to: %@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  else
  {
    v12 = *(NSObject **)getDataUsageLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Attempted to start breadcrumbing process with invalid workspace", (uint8_t *)&v13, 2u);
    }
  }
}

+ (BOOL)launchHealthCheck:(id)a3 withRegistry:(const void *)a4
{
  id v5 = a3;
  xpc_object_t v6 = *(NSObject **)getDataUsageLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I Launching health check", buf, 2u);
  }
  unsigned int v7 = &selRef_enterLoopBackMode_;
  unsigned int v8 = +[DataUsageDatabaseMonitor foundBreadcrumb:v5 withRegistry:a4];
  char v9 = v8 ^ 1;
  size_t v10 = *(NSObject **)getDataUsageLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)&buf[4] = v8 ^ 1;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I Health check passed: %hhd", buf, 8u);
  }
  if (v8)
  {
    v11 = *(NSObject **)getDataUsageLog();
    char v9 = 0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#I Tossing launch times because we've taken some other action", buf, 2u);
      char v9 = 0;
    }
LABEL_40:
    v27 = *(NSObject **)getDataUsageLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#I Tossing existing launch times", buf, 2u);
    }
    *(void *)long long buf = 0;
    CFStringRef v28 = (const __CFString *)kCommCenterPreferencesNoBackupAppID;
    CFDictionaryRef theDict = (CFDictionaryRef)CFPreferencesCopyValue(@"dataUsageBreadcrumbsSection", kCommCenterPreferencesNoBackupAppID, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    sub_100084068(buf, (CFTypeRef *)&theDict);
    if (*(void *)buf) {
      unsigned int v29 = sub_100080778;
    }
    else {
      unsigned int v29 = 0;
    }
    if (v29)
    {
      CFDictionaryRef theDict = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)buf);
      CFDictionaryRemoveValue(theDict, @"launchTimestamps");
    }
    else
    {
      CFDictionaryRef theDict = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    CFPreferencesSetValue(@"dataUsageBreadcrumbsSection", theDict, v28, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    CFPreferencesAppSynchronize(v28);
    sub_10005717C((const void **)&theDict);
    sub_100057D78((const void **)buf);
    goto LABEL_49;
  }
  CFDictionaryRef theDict = 0;
  *(void *)long long buf = CFPreferencesCopyValue(@"dataUsageBreadcrumbsSection", kCommCenterPreferencesNoBackupAppID, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  sub_100084068(&theDict, (CFTypeRef *)buf);
  if (theDict) {
    v12 = sub_100080778;
  }
  else {
    v12 = 0;
  }
  if (!v12)
  {
    sub_100057D78((const void **)&theDict);
    char v9 = 1;
    goto LABEL_49;
  }
  id v36 = 0;
  *(void *)long long buf = CFDictionaryGetValue(theDict, @"launchTimestamps");
  sub_100044D6C(&v36, (CFTypeRef *)buf);
  if (v36) {
    int v13 = sub_100083F10;
  }
  else {
    int v13 = 0;
  }
  if (v13)
  {
    std::string::size_type v14 = v36;
    id v15 = [v14 count];
    if ((unint64_t)v15 < 4)
    {
      int v24 = 0;
      char v9 = 1;
    }
    else
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v16 = v14;
      v31 = v14;
      id v17 = [v16 countByEnumeratingWithState:&v32 objects:v43 count:16];
      if (v17)
      {
        long long v18 = 0;
        unint64_t v19 = 0;
        uint64_t v20 = *(void *)v33;
        while (2)
        {
          v21 = 0;
          size_t v22 = v18;
          do
          {
            if (*(void *)v33 != v20) {
              objc_enumerationMutation(v16);
            }
            v23 = (char *)[*(id *)(*((void *)&v32 + 1) + 8 * (void)v21) unsignedLongLongValue];
            long long v18 = v23;
            if (v22)
            {
              if ((unint64_t)(v23 - v22) > 0xE10)
              {

                unsigned int v7 = &selRef_enterLoopBackMode_;
                int v24 = 1;
                std::string::size_type v14 = v31;
                goto LABEL_38;
              }
              v19 += v23 - v22;
            }
            v21 = (char *)v21 + 1;
            size_t v22 = v23;
          }
          while (v17 != v21);
          id v17 = [v16 countByEnumeratingWithState:&v32 objects:v43 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }
      else
      {
        unint64_t v19 = 0;
      }

      unsigned int v7 = &selRef_enterLoopBackMode_;
      unint64_t v25 = v19 / ((unint64_t)v15 - 1);
      std::string::size_type v14 = v31;
      if (v25 > 0x257)
      {
        int v24 = 0;
      }
      else
      {
        v26 = *(NSObject **)getDataUsageLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 134218498;
          *(void *)&buf[4] = v25;
          __int16 v39 = 2048;
          uint64_t v40 = 600;
          __int16 v41 = 2112;
          id v42 = v16;
          _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "DATA INTEGRITY: Average launch interval is too low (%llu < %llu). Will force integrity check. [launch times: %@]", buf, 0x20u);
        }
        int v24 = 1;
        [v5 setForceIntegrityCheck:1];
        char v9 = 0;
      }
    }
LABEL_38:
  }
  else
  {
    int v24 = 0;
    char v9 = 1;
  }
  sub_100044D00((const void **)&v36);
  sub_100057D78((const void **)&theDict);
  if (v24) {
    goto LABEL_40;
  }
LABEL_49:
  [v7 + 507 appendLaunchTime];

  return v9;
}

+ (void)appendLaunchTime
{
  v2 = +[NSMutableArray array];
  v3.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
  CFDictionaryRef theDict = 0;
  CFStringRef v4 = (const __CFString *)kCommCenterPreferencesNoBackupAppID;
  value = (void *)CFPreferencesCopyValue(@"dataUsageBreadcrumbsSection", kCommCenterPreferencesNoBackupAppID, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  sub_100084068(&theDict, (CFTypeRef *)&value);
  if (theDict) {
    id v5 = sub_100080778;
  }
  else {
    id v5 = 0;
  }
  if (v5)
  {
    value = 0;
    CFPropertyListRef MutableCopy = CFDictionaryGetValue(theDict, @"launchTimestamps");
    sub_100044D6C(&value, &MutableCopy);
    if (value) {
      xpc_object_t v6 = sub_100083F10;
    }
    else {
      xpc_object_t v6 = 0;
    }
    if (v6) {
      objc_msgSend(v2, "addObjectsFromArray:");
    }
    sub_100044D00((const void **)&value);
  }
  unsigned int v7 = +[NSNumber numberWithLongLong:v3.__d_.__rep_ / 1000000];
  [v2 addObject:v7];

  if ((unint64_t)[v2 count] >= 0xB) {
    [v2 removeObjectAtIndex:0];
  }
  value = v2;
  if (v2)
  {
    unsigned int v8 = sub_100083F10;
    CFRetain(v2);
  }
  else
  {
    unsigned int v8 = 0;
  }
  if (v8)
  {
    if (theDict) {
      char v9 = sub_100080778;
    }
    else {
      char v9 = 0;
    }
    if (v9) {
      CFPropertyListRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
    }
    else {
      CFPropertyListRef MutableCopy = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    CFDictionarySetValue((CFMutableDictionaryRef)MutableCopy, @"launchTimestamps", value);
    CFPreferencesSetValue(@"dataUsageBreadcrumbsSection", MutableCopy, v4, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    CFPreferencesAppSynchronize(v4);
    sub_10005717C(&MutableCopy);
  }
  sub_100044D00((const void **)&value);
  sub_100057D78((const void **)&theDict);
}

+ (BOOL)foundBreadcrumb:(id)a3 withRegistry:(const void *)a4
{
  id v4 = a3;
  if (+[DataUsageDatabaseMonitor foundDestroyPersistentStoreBreadcrumb])
  {
    id v5 = *(NSObject **)getDataUsageLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "DATA LOSS: Uncompleted DestroyPersistentStoreInProgress breadcrumb discovered. Will force delete database and delete the breadcrumb", buf, 2u);
    }
    [v4 setForceDeleteFile:1];
    +[DataUsageDatabaseMonitor clearDestroyPersistentStoreBreadcrumb];
LABEL_5:
    BOOL v6 = 1;
    goto LABEL_18;
  }
  if (+[DataUsageDatabaseMonitor foundIntegrityCheckBreadcrumbAboveThreshold:1])
  {
    unsigned int v7 = *(NSObject **)getDataUsageLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "DATA LOSS: Uncompleted IntegrityCheckInProgress breadcrumb discovered. Will force destroy persistent store and delete the breadcrumb", v11, 2u);
    }
    [v4 setForceDestroyPersistentStore:1];
    +[DataUsageDatabaseMonitor clearIntegrityCheckBreadcrumb];
    BOOL v6 = 1;
  }
  else if (+[DataUsageDatabaseMonitor foundIntegrityCheckBreadcrumbAboveThreshold:0])
  {
    BOOL v6 = 1;
    [v4 setForceIntegrityCheck:1];
  }
  else
  {
    BOOL v6 = 0;
  }
  if (([v4 forceDestroyPersistentStore] & 1) == 0
    && +[DataUsageDatabaseMonitor foundInitialWorkspaceSaveBreadcrumb])
  {
    unsigned int v8 = *(NSObject **)getDataUsageLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)size_t v10 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "DATA INTEGRITY: Uncompleted InitialWorkspaceSaveInProgress breadcrumb discovered. Will force integrity check and delete the breadcrumb", v10, 2u);
    }
    [v4 setForceIntegrityCheck:1];
    +[DataUsageDatabaseMonitor clearInitialWorkspaceSaveBreadcrumb];
    goto LABEL_5;
  }
LABEL_18:

  return v6;
}

+ (BOOL)foundInitialWorkspaceSaveBreadcrumb
{
  CFDictionaryRef theDict = 0;
  CFPropertyListRef v7 = CFPreferencesCopyValue(@"dataUsageBreadcrumbsSection", kCommCenterPreferencesNoBackupAppID, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  sub_100084068(&theDict, &v7);
  if (theDict) {
    v2 = sub_100080778;
  }
  else {
    v2 = 0;
  }
  if (v2)
  {
    Value = CFDictionaryGetValue(theDict, @"initialWorkspaceSaveInProgress");
    CFPropertyListRef v7 = Value;
    if (Value)
    {
      id v4 = sub_100080934;
      CFRetain(Value);
    }
    else
    {
      id v4 = 0;
    }
    BOOL v5 = v4 != 0;
    sub_1000577C4(&v7);
  }
  else
  {
    BOOL v5 = 0;
  }
  sub_100057D78((const void **)&theDict);
  return v5;
}

+ (void)leaveBreadcrumbForInitialWorkspaceSave
{
  CFDictionaryRef theDict = 0;
  CFStringRef v2 = (const __CFString *)kCommCenterPreferencesNoBackupAppID;
  CFPropertyListRef value = CFPreferencesCopyValue(@"dataUsageBreadcrumbsSection", kCommCenterPreferencesNoBackupAppID, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  sub_100084068(&theDict, &value);
  if (theDict) {
    std::chrono::system_clock::time_point v3 = sub_100080778;
  }
  else {
    std::chrono::system_clock::time_point v3 = 0;
  }
  if (v3) {
    CFPropertyListRef value = CFDictionaryCreateMutableCopy(0, 0, theDict);
  }
  else {
    CFPropertyListRef value = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  CFDictionarySetValue((CFMutableDictionaryRef)value, @"initialWorkspaceSaveInProgress", kCFBooleanTrue);
  CFPreferencesSetValue(@"dataUsageBreadcrumbsSection", value, v2, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  CFPreferencesAppSynchronize(v2);
  sub_10005717C(&value);
  sub_100057D78((const void **)&theDict);
}

+ (void)clearInitialWorkspaceSaveBreadcrumb
{
  CFDictionaryRef theDict = 0;
  CFStringRef v2 = (const __CFString *)kCommCenterPreferencesNoBackupAppID;
  CFPropertyListRef value = CFPreferencesCopyValue(@"dataUsageBreadcrumbsSection", kCommCenterPreferencesNoBackupAppID, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  sub_100084068(&theDict, &value);
  if (theDict) {
    std::chrono::system_clock::time_point v3 = sub_100080778;
  }
  else {
    std::chrono::system_clock::time_point v3 = 0;
  }
  if (v3)
  {
    CFPropertyListRef value = CFDictionaryCreateMutableCopy(0, 0, theDict);
    CFDictionaryRemoveValue((CFMutableDictionaryRef)value, @"initialWorkspaceSaveInProgress");
    CFPreferencesSetValue(@"dataUsageBreadcrumbsSection", value, v2, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    CFPreferencesAppSynchronize(v2);
    sub_10005717C(&value);
  }
  sub_100057D78((const void **)&theDict);
}

+ (unint64_t)integrityCheckBreadcrumbCount
{
  CFDictionaryRef theDict = 0;
  *(void *)long long buf = CFPreferencesCopyValue(@"dataUsageBreadcrumbsSection", kCommCenterPreferencesNoBackupAppID, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  sub_100084068(&theDict, (CFTypeRef *)buf);
  if (theDict) {
    CFStringRef v2 = sub_100080778;
  }
  else {
    CFStringRef v2 = 0;
  }
  if (v2)
  {
    Value = CFDictionaryGetValue(theDict, @"integrityCheckInProgress");
    id v4 = Value;
    v12 = (void *)Value;
    if (Value)
    {
      BOOL v5 = sub_100080934;
      CFRetain(Value);
    }
    else
    {
      BOOL v5 = 0;
    }
    if (v5)
    {
      CFTypeID v7 = CFGetTypeID(v4);
      if (v7 == CFNumberGetTypeID())
      {
        unsigned int v8 = v12;
        id v6 = [v8 unsignedIntegerValue];
        char v9 = *(NSObject **)getDataUsageLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 134217984;
          *(void *)&buf[4] = v6;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#I IntegrityCheckInProgress breadcrumb count is %ld.", buf, 0xCu);
        }
LABEL_17:

LABEL_19:
        sub_1000577C4((const void **)&v12);
        goto LABEL_20;
      }
      if (v12)
      {
        unsigned int v8 = v12;
        size_t v10 = *(NSObject **)getDataUsageLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&buf[4] = v8;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I Found unexpected value stored for IntegrityCheckInProgress breadcrumb: %@", buf, 0xCu);
        }
        +[DataUsageDatabaseMonitor clearIntegrityCheckBreadcrumb];
        id v6 = 0;
        goto LABEL_17;
      }
    }
    id v6 = 0;
    goto LABEL_19;
  }
  id v6 = 0;
LABEL_20:
  sub_100057D78((const void **)&theDict);
  return (unint64_t)v6;
}

+ (BOOL)foundIntegrityCheckBreadcrumbAboveThreshold:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v4 = +[DataUsageDatabaseMonitor integrityCheckBreadcrumbCount];
  unint64_t v5 = 3;
  if (!v3) {
    unint64_t v5 = 0;
  }
  return v4 > v5;
}

+ (void)leaveBreadcrumbForIntegrityCheck
{
  unint64_t v2 = +[DataUsageDatabaseMonitor integrityCheckBreadcrumbCount];
  BOOL v3 = *(NSObject **)getDataUsageLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    *(void *)&buf[4] = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I Incrementing IntegrityCheckInProgress breadcrumb count from %ld.", buf, 0xCu);
  }
  unint64_t v4 = +[NSNumber numberWithUnsignedInteger:v2 + 1];
  *(void *)long long buf = 0;
  CFStringRef v5 = (const __CFString *)kCommCenterPreferencesNoBackupAppID;
  CFPropertyListRef value = CFPreferencesCopyValue(@"dataUsageBreadcrumbsSection", kCommCenterPreferencesNoBackupAppID, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  sub_100084068(buf, &value);
  if (*(void *)buf) {
    id v6 = sub_100080778;
  }
  else {
    id v6 = 0;
  }
  if (v6) {
    CFPropertyListRef value = CFDictionaryCreateMutableCopy(0, 0, *(CFDictionaryRef *)buf);
  }
  else {
    CFPropertyListRef value = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  CFDictionarySetValue((CFMutableDictionaryRef)value, @"integrityCheckInProgress", v4);
  CFPreferencesSetValue(@"dataUsageBreadcrumbsSection", value, v5, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  CFPreferencesAppSynchronize(v5);
  sub_10005717C(&value);
  sub_100057D78((const void **)buf);
}

+ (void)clearIntegrityCheckBreadcrumb
{
  CFDictionaryRef theDict = 0;
  CFStringRef v2 = (const __CFString *)kCommCenterPreferencesNoBackupAppID;
  CFPropertyListRef value = CFPreferencesCopyValue(@"dataUsageBreadcrumbsSection", kCommCenterPreferencesNoBackupAppID, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  sub_100084068(&theDict, &value);
  if (theDict) {
    BOOL v3 = sub_100080778;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    CFPropertyListRef value = CFDictionaryCreateMutableCopy(0, 0, theDict);
    CFDictionaryRemoveValue((CFMutableDictionaryRef)value, @"integrityCheckInProgress");
    CFPreferencesSetValue(@"dataUsageBreadcrumbsSection", value, v2, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    CFPreferencesAppSynchronize(v2);
    sub_10005717C(&value);
  }
  sub_100057D78((const void **)&theDict);
}

+ (BOOL)foundDestroyPersistentStoreBreadcrumb
{
  CFDictionaryRef theDict = 0;
  CFPropertyListRef v7 = CFPreferencesCopyValue(@"dataUsageBreadcrumbsSection", kCommCenterPreferencesNoBackupAppID, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  sub_100084068(&theDict, &v7);
  if (theDict) {
    CFStringRef v2 = sub_100080778;
  }
  else {
    CFStringRef v2 = 0;
  }
  if (v2)
  {
    Value = CFDictionaryGetValue(theDict, @"destroyPersistentStoreInProgress");
    CFPropertyListRef v7 = Value;
    if (Value)
    {
      unint64_t v4 = sub_100080934;
      CFRetain(Value);
    }
    else
    {
      unint64_t v4 = 0;
    }
    BOOL v5 = v4 != 0;
    sub_1000577C4(&v7);
  }
  else
  {
    BOOL v5 = 0;
  }
  sub_100057D78((const void **)&theDict);
  return v5;
}

+ (void)leaveBreadcrumbForDestroyPersistentStore
{
  CFDictionaryRef theDict = 0;
  CFStringRef v2 = (const __CFString *)kCommCenterPreferencesNoBackupAppID;
  CFPropertyListRef value = CFPreferencesCopyValue(@"dataUsageBreadcrumbsSection", kCommCenterPreferencesNoBackupAppID, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  sub_100084068(&theDict, &value);
  if (theDict) {
    BOOL v3 = sub_100080778;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3) {
    CFPropertyListRef value = CFDictionaryCreateMutableCopy(0, 0, theDict);
  }
  else {
    CFPropertyListRef value = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  CFDictionarySetValue((CFMutableDictionaryRef)value, @"destroyPersistentStoreInProgress", kCFBooleanTrue);
  CFPreferencesSetValue(@"dataUsageBreadcrumbsSection", value, v2, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  CFPreferencesAppSynchronize(v2);
  sub_10005717C(&value);
  sub_100057D78((const void **)&theDict);
}

+ (void)clearDestroyPersistentStoreBreadcrumb
{
  CFDictionaryRef theDict = 0;
  CFStringRef v2 = (const __CFString *)kCommCenterPreferencesNoBackupAppID;
  CFPropertyListRef value = CFPreferencesCopyValue(@"dataUsageBreadcrumbsSection", kCommCenterPreferencesNoBackupAppID, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  sub_100084068(&theDict, &value);
  if (theDict) {
    BOOL v3 = sub_100080778;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    CFPropertyListRef value = CFDictionaryCreateMutableCopy(0, 0, theDict);
    CFDictionaryRemoveValue((CFMutableDictionaryRef)value, @"destroyPersistentStoreInProgress");
    CFPreferencesSetValue(@"dataUsageBreadcrumbsSection", value, v2, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    CFPreferencesAppSynchronize(v2);
    sub_10005717C(&value);
  }
  sub_100057D78((const void **)&theDict);
}

+ (BOOL)foundDeletePersistentStoreBreadcrumb
{
  CFDictionaryRef theDict = 0;
  CFPropertyListRef v7 = CFPreferencesCopyValue(@"dataUsageBreadcrumbsSection", kCommCenterPreferencesNoBackupAppID, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  sub_100084068(&theDict, &v7);
  if (theDict) {
    CFStringRef v2 = sub_100080778;
  }
  else {
    CFStringRef v2 = 0;
  }
  if (v2)
  {
    Value = CFDictionaryGetValue(theDict, @"deletePersistentStoreInProgress");
    CFPropertyListRef v7 = Value;
    if (Value)
    {
      unint64_t v4 = sub_100080934;
      CFRetain(Value);
    }
    else
    {
      unint64_t v4 = 0;
    }
    BOOL v5 = v4 != 0;
    sub_1000577C4(&v7);
  }
  else
  {
    BOOL v5 = 0;
  }
  sub_100057D78((const void **)&theDict);
  return v5;
}

+ (void)leaveBreadcrumbForDeletePersistentStore
{
  CFDictionaryRef theDict = 0;
  CFStringRef v2 = (const __CFString *)kCommCenterPreferencesNoBackupAppID;
  CFPropertyListRef value = CFPreferencesCopyValue(@"dataUsageBreadcrumbsSection", kCommCenterPreferencesNoBackupAppID, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  sub_100084068(&theDict, &value);
  if (theDict) {
    BOOL v3 = sub_100080778;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3) {
    CFPropertyListRef value = CFDictionaryCreateMutableCopy(0, 0, theDict);
  }
  else {
    CFPropertyListRef value = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  CFDictionarySetValue((CFMutableDictionaryRef)value, @"deletePersistentStoreInProgress", kCFBooleanTrue);
  CFPreferencesSetValue(@"dataUsageBreadcrumbsSection", value, v2, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  CFPreferencesAppSynchronize(v2);
  sub_10005717C(&value);
  sub_100057D78((const void **)&theDict);
}

+ (void)clearDeletePersistentStoreBreadcrumb
{
  CFDictionaryRef theDict = 0;
  CFStringRef v2 = (const __CFString *)kCommCenterPreferencesNoBackupAppID;
  CFPropertyListRef value = CFPreferencesCopyValue(@"dataUsageBreadcrumbsSection", kCommCenterPreferencesNoBackupAppID, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  sub_100084068(&theDict, &value);
  if (theDict) {
    BOOL v3 = sub_100080778;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    CFPropertyListRef value = CFDictionaryCreateMutableCopy(0, 0, theDict);
    CFDictionaryRemoveValue((CFMutableDictionaryRef)value, @"deletePersistentStoreInProgress");
    CFPreferencesSetValue(@"dataUsageBreadcrumbsSection", value, v2, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    CFPreferencesAppSynchronize(v2);
    sub_10005717C(&value);
  }
  sub_100057D78((const void **)&theDict);
}

- (void)integrityCheckStarted
{
  CFStringRef v2 = *(NSObject **)getDataUsageLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#I Leaving breadcrumb for integrity check", v3, 2u);
  }
  +[DataUsageDatabaseMonitor leaveBreadcrumbForIntegrityCheck];
}

- (void)integrityCheckCompleted:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  if (v4)
  {
    id v6 = *(NSObject **)getDataUsageLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I Integrity check succeeded", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    CFPropertyListRef v7 = *(NSObject **)getDataUsageLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Integrity check failed because %@", (uint8_t *)&v8, 0xCu);
    }
  }
  +[DataUsageDatabaseMonitor clearIntegrityCheckBreadcrumb];
}

- (void)destroyPersistentStoreStarted
{
  CFStringRef v2 = *(NSObject **)getDataUsageLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#I Leaving breadcrumb for destroying persistent store", v3, 2u);
  }
  +[DataUsageDatabaseMonitor leaveBreadcrumbForDestroyPersistentStore];
}

- (void)destroyPersistentStoreCompleted:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  if (v4)
  {
    id v6 = *(NSObject **)getDataUsageLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I DATA LOSS: Destroyed the PersistentStore", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    CFPropertyListRef v7 = *(NSObject **)getDataUsageLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "DATA LOSS: Failure to destroy the PersistentStore because %@", (uint8_t *)&v8, 0xCu);
    }
  }
  +[DataUsageDatabaseMonitor clearDestroyPersistentStoreBreadcrumb];
}

- (void)deleteDatabaseStarted
{
  CFStringRef v2 = *(NSObject **)getDataUsageLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#I Leaving breadcrumb for deleting the database", v3, 2u);
  }
  +[DataUsageDatabaseMonitor leaveBreadcrumbForDeletePersistentStore];
}

- (void)deleteDatabaseCompleted:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  if (v4)
  {
    id v6 = *(NSObject **)getDataUsageLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I DATA LOSS: Deleted the database file", (uint8_t *)&v8, 2u);
    }
    +[DataUsageDatabaseMonitor clearDeletePersistentStoreBreadcrumb];
  }
  else
  {
    CFPropertyListRef v7 = *(NSObject **)getDataUsageLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "DATA LOSS: Failure to delete database file because %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (int64_t)handleFaultingError:(id)a3 fromContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = *(NSObject **)getDataUsageLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v15 = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Received faulting error: %@ from context: %@", (uint8_t *)&v15, 0x16u);
  }
  id v9 = [(AnalyticsWorkspace *)self->_workspace mainObjectContext];
  if (v9 != v7) {
    goto LABEL_12;
  }
  size_t v10 = [v6 domain];
  if (([v10 isEqualToString:NSSQLiteErrorDomain] & 1) == 0)
  {

    id v9 = v7;
LABEL_12:

    goto LABEL_13;
  }
  BOOL v11 = [v6 code] == (id)11;

  if (v11)
  {
    v12 = *(NSObject **)getDataUsageLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I Leaving breadcrumb for deleting database file due to corruption. Clearing all other breadcrumbs", (uint8_t *)&v15, 2u);
    }
    +[DataUsageDatabaseMonitor leaveBreadcrumbForDeletePersistentStore];
    +[DataUsageDatabaseMonitor clearInitialWorkspaceSaveBreadcrumb];
    +[DataUsageDatabaseMonitor clearIntegrityCheckBreadcrumb];
    +[DataUsageDatabaseMonitor clearDestroyPersistentStoreBreadcrumb];
    int v13 = *(NSObject **)getDataUsageLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I Resetting main object context to force a crash and relaunch", (uint8_t *)&v15, 2u);
    }
    id v9 = [(AnalyticsWorkspace *)self->_workspace mainObjectContext];
    [v9 reset];
    goto LABEL_12;
  }
LABEL_13:

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workspace, 0);
  cntrl = self->_registry.__cntrl_;
  if (cntrl)
  {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end