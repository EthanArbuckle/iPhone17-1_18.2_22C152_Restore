@interface ObjCDataUsageReader
- (ObjCDataUsageReader)initWithRegistry:(const void *)a3 withQueue:(queue)a4;
- (id).cxx_construct;
- (void)checkDataUsageRecords_sync:(id)a3 withLastBillingPeriod:(id)a4 withCurrentSubtag:(unsigned int)a5;
- (void)fillDataUsage_sync:(id)a3 withPeriod:(unint64_t)a4 withCurrentBillingPeriod:(id)a5 withLastBillingPeriod:(id)a6 withCurrentEffectiveSubtag:(unsigned int)a7 withPreferredLanguages:(id)a8 withBlockedBundleIds:(id)a9;
- (void)logPerAppUsageData_sync:(BOOL)a3 withCurrentSubtag:(unsigned int)a4 withCallback:(function<void)(BOOL;
- (void)resetWorkspace_sync;
- (void)seedDataUsageWithProcesses_sync:(id)a3 withPreferredLanguages:(id)a4 withBlockedBundleIds:(id)a5;
@end

@implementation ObjCDataUsageReader

- (ObjCDataUsageReader)initWithRegistry:(const void *)a3 withQueue:(queue)a4
{
  v22.receiver = self;
  v22.super_class = (Class)ObjCDataUsageReader;
  v5 = [(ObjCDataUsageReader *)&v22 init];
  v6 = v5;
  if (v5)
  {
    v8 = *(Registry **)a3;
    uint64_t v7 = *((void *)a3 + 1);
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v5->_registry.__cntrl_;
    v6->_registry.__ptr_ = v8;
    v6->_registry.__cntrl_ = (__shared_weak_count *)v7;
    if (cntrl) {
      sub_10000921C(cntrl);
    }
    id v10 = objc_alloc((Class)AnalyticsWorkspace);
    v11 = +[NSString stringWithUTF8String:sub_10000241C()];
    v12 = sub_100002310();
    if ((v12->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v13 = v12;
    }
    else {
      v13 = (std::string *)v12->__r_.__value_.__r.__words[0];
    }
    v14 = +[NSString stringWithUTF8String:v13];
    v15 = (AnalyticsWorkspace *)[v10 initWorkspaceWithName:v11 atPath:v14 useReadOnly:1];
    workspace = v6->_workspace;
    v6->_workspace = v15;

    v17 = (ProcessAnalytics *)[objc_alloc((Class)ProcessAnalytics) initWithWorkspace:v6->_workspace withCache:0];
    processSpace = v6->_processSpace;
    v6->_processSpace = v17;

    v19 = (UsageAnalytics *)[objc_alloc((Class)UsageAnalytics) initWithWorkspace:v6->_workspace withCache:0];
    usageSpace = v6->_usageSpace;
    v6->_usageSpace = v19;
  }
  return v6;
}

- (void)resetWorkspace_sync
{
  [(AnalyticsWorkspace *)self->_workspace save];
  [(AnalyticsWorkspace *)self->_workspace reset];
}

- (void)seedDataUsageWithProcesses_sync:(id)a3 withPreferredLanguages:(id)a4 withBlockedBundleIds:(id)a5
{
}

- (void)fillDataUsage_sync:(id)a3 withPeriod:(unint64_t)a4 withCurrentBillingPeriod:(id)a5 withLastBillingPeriod:(id)a6 withCurrentEffectiveSubtag:(unsigned int)a7 withPreferredLanguages:(id)a8 withBlockedBundleIds:(id)a9
{
  uint64_t v10 = *(void *)&a7;
  id v20 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = a9;
  DataUsageLog = (os_log_t *)getDataUsageLog();
  sub_1000026C8(v20, a4, v15, v16, v10, v17, v18, DataUsageLog, self->_usageSpace);
}

- (void)checkDataUsageRecords_sync:(id)a3 withLastBillingPeriod:(id)a4 withCurrentSubtag:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  v8 = a3;
  v9 = a4;
  v34 = v8;
  if (v8 && v9)
  {
    v33 = v9;
    memset(v49, 0, sizeof(v49));
    uint64_t v10 = *(void **)getDataUsageLog();
    DataUsageLog = (os_log_t *)getDataUsageLog();
    uint64_t v12 = os_signpost_id_generate(*DataUsageLog);
    v13 = (os_log_t *)getDataUsageLog();
    if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = *v13;
      if (os_signpost_enabled(*v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "DataUsageCheckRecords", (const char *)&unk_100066D5E, buf, 2u);
      }
    }
    *(void *)buf = off_10006F7D0;
    v44 = buf;
    v48[0] = v12;
    v48[1] = (uint64_t)os_retain(v10);
    sub_100039CB4((uint64_t)v49, (uint64_t)buf);
    sub_100039AF4(buf);
    id v15 = +[NSNumber numberWithUnsignedInt:v5];
    v32 = +[NSPredicate predicateWithFormat:@"tag == %@ and kind == 0 and billCycleEnd < %@ && billCycleEnd > %@", v15, v34, v33];

    [(UsageAnalytics *)self->_usageSpace fetchEntityDictionariesWithProperties:&off_1000764F8 predicate:v32];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v16 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v37;
      do
      {
        id v18 = 0;
        do
        {
          if (*(void *)v37 != v17) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v18);
          id v20 = [v19 objectForKeyedSubscript:@"billCycleEnd"];
          v21 = [v19 objectForKeyedSubscript:@"hasProcess.bundleName"];
          uint64_t v22 = [v19 objectForKeyedSubscript:@"hasProcess.procName"];
          v23 = (void *)v22;
          if (v21)
          {
            v24 = *(NSObject **)getDataUsageLog();
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_19;
            }
            *(_DWORD *)buf = 138413058;
            *(void *)&buf[4] = v21;
            __int16 v41 = 2112;
            v42 = v20;
            __int16 v43 = 2112;
            v44 = v34;
            __int16 v45 = 2112;
            v46 = v33;
            v25 = v24;
            v26 = "#N lu record for bundle id %@ has billing cycle %@, between %@ and %@";
LABEL_17:
            uint32_t v28 = 42;
LABEL_18:
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
            goto LABEL_19;
          }
          if (v22)
          {
            v27 = *(NSObject **)getDataUsageLog();
            if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_19;
            }
            *(_DWORD *)buf = 138413058;
            *(void *)&buf[4] = v23;
            __int16 v41 = 2112;
            v42 = v20;
            __int16 v43 = 2112;
            v44 = v34;
            __int16 v45 = 2112;
            v46 = v33;
            v25 = v27;
            v26 = "#N lu record for process name %@ has billing cycle %@, between %@ and %@";
            goto LABEL_17;
          }
          v29 = *(NSObject **)getDataUsageLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)&buf[4] = v20;
            __int16 v41 = 2112;
            v42 = v34;
            __int16 v43 = 2112;
            v44 = v33;
            v25 = v29;
            v26 = "#N lu record without process name has billing cycle %@, between %@ and %@";
            uint32_t v28 = 32;
            goto LABEL_18;
          }
LABEL_19:

          id v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v30 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
        id v16 = v30;
      }
      while (v30);
    }

    sub_100039980(v48);
    v9 = v33;
  }
}

- (void)logPerAppUsageData_sync:(BOOL)a3 withCurrentSubtag:(unsigned int)a4 withCallback:(function<void)(BOOL
{
  BOOL v7 = a3;
  v63[0] = 0;
  v63[1] = 0;
  unint64_t v61 = 0;
  v62 = v63;
  unint64_t v59 = 0;
  unint64_t v60 = 0;
  workspace = self->_workspace;
  DataUsageLog = (os_log_t *)getDataUsageLog();
  sub_1000031B0(workspace, (uint64_t)&v62, a4, DataUsageLog, &v59);
  uint64_t v12 = *(NSObject **)getDataUsageLog();
  if (v7)
  {
    uint64_t v58 = 0;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    *(_OWORD *)v46 = 0u;
    long long v47 = 0u;
    *(_OWORD *)v44 = 0u;
    memset(v45, 0, sizeof(v45));
    sub_100002B94((uint64_t)v44);
    v13 = v44[0];
    *(void *)((char *)v45 + *((void *)v44[0] - 3) + 8) = 30;
    *(_DWORD *)((char *)&v44[1] + *(v13 - 3)) = *(_DWORD *)((unsigned char *)&v44[1] + *(v13 - 3)) & 0xFFFFFF4F | 0x80;
    v14 = (uint64_t *)sub_100004BA4((uint64_t)v44);
    uint64_t v15 = *v14;
    *(uint64_t *)((char *)v14 + *(void *)(*v14 - 24) + 24) = 30;
    *(_DWORD *)((char *)v14 + *(void *)(v15 - 24) + 8) = *(_DWORD *)((unsigned char *)v14 + *(void *)(v15 - 24) + 8) & 0xFFFFFF4F | 0x80;
    LOBYTE(v68[0].__locale_) = 124;
    id v16 = (uint64_t *)sub_100004BA4((uint64_t)v14);
    uint64_t v17 = *v16;
    *(uint64_t *)((char *)v16 + *(void *)(*v16 - 24) + 24) = 25;
    *(_DWORD *)((char *)v16 + *(void *)(v17 - 24) + 8) = *(_DWORD *)((unsigned char *)v16 + *(void *)(v17 - 24) + 8) & 0xFFFFFF4F | 0x80;
    id v18 = (uint64_t *)sub_100004BA4((uint64_t)v16);
    uint64_t v19 = *v18;
    *(uint64_t *)((char *)v18 + *(void *)(*v18 - 24) + 24) = 25;
    *(_DWORD *)((char *)v18 + *(void *)(v19 - 24) + 8) = *(_DWORD *)((unsigned char *)v18 + *(void *)(v19 - 24) + 8) & 0xFFFFFF4F | 0x80;
    LOBYTE(v68[0].__locale_) = 124;
    id v20 = (void *)sub_100004BA4((uint64_t)v18);
    *(void *)((char *)v20 + *(void *)(*v20 - 24) + 24) = 15;
    v21 = (void *)sub_100004BA4((uint64_t)v20);
    *(void *)((char *)v21 + *(void *)(*v21 - 24) + 24) = 15;
    LOBYTE(v68[0].__locale_) = 124;
    uint64_t v22 = (void *)sub_100004BA4((uint64_t)v21);
    *(void *)((char *)v22 + *(void *)(*v22 - 24) + 24) = 15;
    v23 = (void *)sub_100004BA4((uint64_t)v22);
    *(void *)((char *)v23 + *(void *)(*v23 - 24) + 24) = 15;
    LOBYTE(v68[0].__locale_) = 124;
    v24 = (void *)sub_100004BA4((uint64_t)v23);
    *(void *)((char *)v24 + *(void *)(*v24 - 24) + 24) = 15;
    v25 = (void *)sub_100004BA4((uint64_t)v24);
    *(void *)((char *)v25 + *(void *)(*v25 - 24) + 24) = 15;
    LOBYTE(v68[0].__locale_) = 124;
    v26 = (void *)sub_100004BA4((uint64_t)v25);
    *(void *)((char *)v26 + *(void *)(*v26 - 24) + 24) = 15;
    v27 = (void *)sub_100004BA4((uint64_t)v26);
    *(void *)((char *)v27 + *(void *)(*v27 - 24) + 24) = 15;
    LOBYTE(v68[0].__locale_) = 124;
    uint32_t v28 = (void *)sub_100004BA4((uint64_t)v27);
    *(void *)((char *)v28 + *(void *)(*v28 - 24) + 24) = 15;
    v29 = (void *)sub_100004BA4((uint64_t)v28);
    *(void *)((char *)v29 + *(void *)(*v29 - 24) + 24) = 15;
    LOBYTE(v68[0].__locale_) = 124;
    id v30 = (void *)sub_100004BA4((uint64_t)v29);
    std::ios_base::getloc((const std::ios_base *)((char *)v30 + *(void *)(*v30 - 24)));
    v31 = std::locale::use_facet(v68, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v31->__vftable[2].~facet_0)(v31, 10);
    std::locale::~locale(v68);
    std::ostream::put();
    std::ostream::flush();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      sub_100004F88((uint64_t)&v44[1], v68);
      v32 = (SBYTE7(v69) & 0x80u) == 0 ? v68 : (std::locale *)v68[0].__locale_;
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = v32;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      if (SBYTE7(v69) < 0) {
        operator delete(v68[0].__locale_);
      }
    }
    __int16 v43 = self;
    v33 = v62;
    if (v62 != v63)
    {
      do
      {
        uint64_t v84 = 0;
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
        *(_OWORD *)__p = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        *(_OWORD *)&v68[0].__locale_ = 0u;
        long long v69 = 0u;
        sub_100002B94((uint64_t)v68);
        sub_100003E68((uint64_t *)v68, v33 + 7);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          sub_100004F88((uint64_t)&v68[1], buf);
          long long v36 = buf;
          if (v65 < 0) {
            long long v36 = *(unsigned char **)buf;
          }
          *(_DWORD *)v66 = 136446210;
          v67 = v36;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", v66, 0xCu);
          if (v65 < 0) {
            operator delete(*(void **)buf);
          }
        }
        v68[0].__locale_ = v34;
        *(std::locale::__imp **)((char *)&v68[0].__locale_ + *((void *)v34 - 3)) = v35;
        if (SHIBYTE(v73) < 0) {
          operator delete(__p[1]);
        }
        std::streambuf::~streambuf();
        std::ostream::~ostream();
        std::ios::~ios();
        long long v37 = (void *)v33[1];
        if (v37)
        {
          do
          {
            long long v38 = (void **)v37;
            long long v37 = (void *)*v37;
          }
          while (v37);
        }
        else
        {
          do
          {
            long long v38 = (void **)v33[2];
            BOOL v39 = *v38 == v33;
            v33 = v38;
          }
          while (!v39);
        }
        v33 = v38;
      }
      while (v38 != v63);
    }
    v44[0] = v34;
    *(void **)((char *)v44 + *((void *)v34 - 3)) = v35;
    if (SHIBYTE(v47) < 0) {
      operator delete(v46[1]);
    }
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    std::ios::~ios();
    self = v43;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    sub_100002E30(v59, v44);
    v40 = (SBYTE7(v45[0]) & 0x80u) == 0 ? (std::locale::__imp *)v44 : (std::locale::__imp *)v44[0];
    LODWORD(v68[0].__locale_) = 136446210;
    *(std::locale::__imp **)((char *)&v68[0].__locale_ + 4) = v40;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Total cellular data usage: %{public}s ", (uint8_t *)v68, 0xCu);
    if (SBYTE7(v45[0]) < 0) {
      operator delete(v44[0]);
    }
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    sub_100002E30(v60, v44);
    __int16 v41 = (SBYTE7(v45[0]) & 0x80u) == 0 ? (std::locale::__imp *)v44 : (std::locale::__imp *)v44[0];
    LODWORD(v68[0].__locale_) = 136446210;
    *(std::locale::__imp **)((char *)&v68[0].__locale_ + 4) = v41;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Total cellular data usage (System): %{public}s", (uint8_t *)v68, 0xCu);
    if (SBYTE7(v45[0]) < 0) {
      operator delete(v44[0]);
    }
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    sub_100002E30(v61, v44);
    if ((SBYTE7(v45[0]) & 0x80u) == 0) {
      v42 = v44;
    }
    else {
      v42 = (void **)v44[0];
    }
    LODWORD(v68[0].__locale_) = 136446210;
    *(std::locale::__imp **)((char *)&v68[0].__locale_ + 4) = (std::locale::__imp *)v42;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Total cellular data usage (System with no bundle): %{public}s", (uint8_t *)v68, 0xCu);
    if (SBYTE7(v45[0]) < 0) {
      operator delete(v44[0]);
    }
  }
  sub_100005074((uint64_t)&v62, v63[0]);
  [(ObjCDataUsageReader *)self resetWorkspace_sync];
  sub_1000389E0((uint64_t)a5, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageSpace, 0);
  objc_storeStrong((id *)&self->_processSpace, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  cntrl = self->_registry.__cntrl_;
  if (cntrl)
  {
    sub_10000921C((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end