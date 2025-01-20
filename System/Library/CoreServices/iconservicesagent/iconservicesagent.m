void start()
{
  NSObject *v0;
  void *v1;
  IconCacheService *v2;
  void *v3;
  IconCacheService *v4;
  int v5;
  const char *v6;
  uint8_t buf[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "iconservicesagent launched.", buf, 2u);
  }
  v0 = _ISDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "com.apple.iconservices";
    _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Stating IconServices agent service with name: %s", (uint8_t *)&v5, 0xCu);
  }

  v2 = [IconCacheService alloc];
  v3 = +[NSString stringWithUTF8String:"com.apple.iconservices"];
  v4 = [(IconCacheService *)v2 initWithServiceName:v3];

  [(IconCacheService *)v4 start];
  dispatch_main();
}

void sub_100002FF8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [objc_alloc((Class)LSRecord) initWithPersistentIdentifier:v6];

  if (!v7)
  {
    v8 = _ISDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Removing store unit: %@", (uint8_t *)&v12, 0xCu);
    }

    v9 = [*(id *)(a1 + 32) store];
    unsigned int v10 = [v9 removeUnitForUUID:v5];

    if (v10)
    {
      v11 = [*(id *)(a1 + 32) unitSourceRegistry];
      [v11 removeDataForUUID:v5];
    }
  }
}

void sub_100003438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003454(uint64_t a1)
{
  v2 = _ISDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100004C8C(v2);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained[8];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000351C;
    block[3] = &unk_100008380;
    id v7 = WeakRetained;
    dispatch_async(v5, block);
  }
}

id sub_10000351C(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearCache];
}

void sub_100003604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000389C(id a1)
{
  v1 = _ISDefaultLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "InterruptionHandler called", v2, 2u);
  }
}

void sub_100003904(id a1)
{
  v1 = _ISDefaultLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "InvalidationHandler called", v2, 2u);
  }
}

void sub_100003AB8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) icon];
  v3 = [*(id *)(a1 + 32) imageDescriptor];
  v4 = _ISDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v15 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v30 = v15;
    *(_WORD *)&v30[4] = 2112;
    *(void *)&v30[6] = v2;
    *(_WORD *)&v30[14] = 2112;
    *(void *)&v30[16] = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Processing generation request from %d icon: %@ image descriptor: %@", buf, 0x1Cu);
  }

  if (v2 && v3)
  {
    if ([v3 ignoreCache])
    {
      id v5 = _ISDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_100004E9C(a1, v5);
      }
      id v6 = 0;
      id v7 = 0;
    }
    else
    {
      v11 = [*(id *)(a1 + 40) iconCache];
      id v27 = 0;
      id v28 = 0;
      unsigned int v12 = [v11 findStoreUnitForIcon:v2 descriptor:v3 UUID:&v28 validationToken:&v27];
      id v6 = v28;
      id v7 = v27;

      if (!v12)
      {
LABEL_18:
        v18 = v7;
        uint64_t v20 = *(void *)(a1 + 32);
        v19 = *(void **)(a1 + 40);
        id v26 = v7;
        v17 = [v19 generateStoreUnitWithRequest:v20 validationToken:&v26];
        id v7 = v26;

        if (!v17)
        {
          v17 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-2582 userInfo:0];
          v25 = _ISDefaultLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            sub_100004DA0();
          }

          id v10 = [objc_alloc((Class)ISGenerationResponse) initWithError:v17];
          goto LABEL_25;
        }
LABEL_19:
        id v21 = objc_alloc((Class)ISGenerationResponse);
        v22 = [v17 data];
        v23 = [v17 UUID];
        id v10 = [v21 initWithData:v22 uuid:v23 validationToken:v7];

        v24 = _ISDefaultLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          sub_100004E08(v10, v24);
        }

LABEL_25:
        goto LABEL_26;
      }
      id v13 = [v2 assessValidationToken:v7];
      if (!v13)
      {
        v16 = [*(id *)(a1 + 40) iconCache];
        v17 = [v16 storeUnitForUUID:v6];

        if (v17) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
      id v14 = v13;
      id v5 = _ISDefaultLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)v30 = v2;
        *(_WORD *)&v30[8] = 2112;
        *(void *)&v30[10] = v3;
        *(_WORD *)&v30[18] = 2048;
        *(void *)&v30[20] = v14;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Rejected cached image for %@ : %@ validation state %lu ", buf, 0x20u);
      }
    }

    goto LABEL_18;
  }
  v8 = _ISDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to queue nil generation request for pid %d", buf, 8u);
  }

  id v6 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:0];
  id v10 = [objc_alloc((Class)ISGenerationResponse) initWithError:v6];
LABEL_26:

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_1000042B8(uint64_t a1)
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v2 = objc_msgSend(*(id *)(a1 + 32), "iconCache", 0);
  v3 = [v2 mutableStoreIndex];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100004538;
  v21[3] = &unk_100008458;
  long long v4 = *(_OWORD *)(a1 + 128);
  long long v28 = *(_OWORD *)(a1 + 112);
  long long v29 = v4;
  long long v30 = *(_OWORD *)(a1 + 144);
  int v31 = *(_DWORD *)(a1 + 160);
  long long v5 = *(_OWORD *)(a1 + 64);
  long long v24 = *(_OWORD *)(a1 + 48);
  long long v25 = v5;
  long long v6 = *(_OWORD *)(a1 + 96);
  long long v26 = *(_OWORD *)(a1 + 80);
  long long v27 = v6;
  v23 = &v15;
  id v22 = *(id *)(a1 + 40);
  [v3 removeValuePassingTest:v21];

  if (*((unsigned char *)v16 + 24))
  {
    id v7 = _ISDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v8;
      int v9 = "UPDATEING_EXISTING_INDEX_ITEM: %@";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v9, buf, 0xCu);
    }
  }
  else
  {
    id v10 = [*(id *)(a1 + 32) iconCache];
    v11 = [v10 mutableStoreIndex];
    unsigned int v12 = [v11 addValue:a1 + 48];

    if (v12)
    {
      id v7 = _ISDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v13;
        int v9 = "ADDED_INDEX_ITEM: %@";
        goto LABEL_9;
      }
    }
    else
    {
      id v7 = _ISDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v14;
        int v9 = "FAILED_TO_ADD_INDEX_ITEM: %@";
        goto LABEL_9;
      }
    }
  }

  _Block_object_dispose(&v15, 8);
}

void sub_10000450C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_100004538(uint64_t a1, unsigned __int8 *uu2)
{
  if (*(_DWORD *)(a1 + 88) != *((_DWORD *)uu2 + 10)) {
    return 0;
  }
  double v4 = *(double *)(a1 + 80);
  if (v4 < *((double *)uu2 + 2)
    || v4 > *((double *)uu2 + 3)
    || uuid_compare((const unsigned __int8 *)(a1 + 48), uu2)
    || uuid_compare((const unsigned __int8 *)(a1 + 92), uu2 + 44))
  {
    return 0;
  }
  if (uuid_compare((const unsigned __int8 *)(a1 + 108), uu2 + 60)
    || (uint64_t result = memcmp((const void *)(a1 + 124), uu2 + 76, 0x28uLL), result))
  {
    long long v6 = _ISDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "REMOVE_INDEX_ITEM: %@", (uint8_t *)&v8, 0xCu);
    }

    return 1;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t sub_100004674(void *a1)
{
  id v10 = 0;
  acl_t accessControlList = 0;
  id v9 = 0;
  unsigned int v1 = [a1 getResourceValue:&v10 forKey:NSURLFileSecurityKey error:&v9];
  v2 = (__CFFileSecurity *)v10;
  id v3 = v9;
  if (v1) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    long long v5 = _ISDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100005028();
    }

    goto LABEL_11;
  }
  if (!CFFileSecurityCopyAccessControlList(v2, &accessControlList))
  {
LABEL_11:
    uint64_t v7 = 0;
    goto LABEL_12;
  }
  acl_free(accessControlList);
  uint64_t v7 = 1;
LABEL_12:

  return v7;
}

void sub_100004748(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100004770(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1000047F8()
{
  sub_100004764();
  sub_100004748((void *)&_mh_execute_header, v0, v1, "Store index at: %@", v2, v3, v4, v5, v6);
}

void sub_100004860(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid cache url", v1, 2u);
}

void sub_1000048A4(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 domain];
  int v5 = 138412546;
  uint8_t v6 = v4;
  __int16 v7 = 2048;
  id v8 = [a1 code];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not serialize cache info file. Error domain: %@ code %ld", (uint8_t *)&v5, 0x16u);
}

void sub_10000495C(void *a1, void *a2, NSObject *a3)
{
  int v5 = [a1 path];
  uint8_t v6 = [a2 domain];
  int v7 = 138412802;
  id v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  __int16 v11 = 2048;
  id v12 = [a2 code];
  _os_log_fault_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_FAULT, "Could not write cache info file to %@. Error domain: %@ code %ld", (uint8_t *)&v7, 0x20u);
}

void sub_100004A34(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Failed to set ACL", v1, 2u);
}

void sub_100004A78()
{
  sub_100004764();
}

void sub_100004AE0()
{
  sub_100004764();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_fault_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_FAULT, "Error creating cache folder at path: %@ with error: %@", v2, 0x16u);
}

void sub_100004B64()
{
  CFAbsoluteTimeGetCurrent();
  sub_100004790();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Activity: %s duration: %lfsec", v2, v3, v4, v5, 2u);
}

void sub_100004BF8()
{
  CFAbsoluteTimeGetCurrent();
  sub_100004790();
  sub_100004770((void *)&_mh_execute_header, v0, v1, "Activity: %s duration: %lfsec", v2, v3, v4, v5, 2u);
}

void sub_100004C8C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Clear Timer fired.", v1, 2u);
}

void sub_100004CD0()
{
  sub_100004764();
  sub_100004748((void *)&_mh_execute_header, v0, v1, "Clearing with: %@ ", v2, v3, v4, v5, v6);
}

void sub_100004D38()
{
  sub_100004764();
  sub_100004748((void *)&_mh_execute_header, v0, v1, "Accepting connection %@", v2, v3, v4, v5, v6);
}

void sub_100004DA0()
{
  sub_100004764();
  sub_100004748((void *)&_mh_execute_header, v0, v1, "Failed to generate data with error: %@", v2, v3, v4, v5, v6);
}

void sub_100004E08(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 uuid];
  sub_100004764();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Returning data with UUID: %@", v4, 0xCu);
}

void sub_100004E9C(uint64_t a1, NSObject *a2)
{
  int v2 = *(_DWORD *)(a1 + 64);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Ignoring cache for request from %d", (uint8_t *)v3, 8u);
}

void sub_100004F18(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 138412802;
  *(void *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = &stru_1000085A0;
  *((_WORD *)buf + 11) = 2048;
  *((void *)buf + 3) = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Generated image for icon %@ -- Validation token DB UUID %@ seq No %llu", buf, 0x20u);
}

void sub_100004F80(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  id v8 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:a1];
  uint64_t v9 = *(void *)(a1 + 16);
  *(_DWORD *)a2 = 138412802;
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = v8;
  *(_WORD *)(a2 + 22) = 2048;
  *(void *)(a2 + 24) = v9;
  _os_log_debug_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "Generated image for icon %@ -- Validation token DB UUID %@ seq No %llu", (uint8_t *)a2, 0x20u);
}

void sub_100005028()
{
  sub_100004764();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

Boolean CFFileSecurityCopyAccessControlList(CFFileSecurityRef fileSec, acl_t *accessControlList)
{
  return _CFFileSecurityCopyAccessControlList(fileSec, accessControlList);
}

Boolean CFFileSecuritySetAccessControlList(CFFileSecurityRef fileSec, acl_t accessControlList)
{
  return _CFFileSecuritySetAccessControlList(fileSec, accessControlList);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _ISDefaultLog()
{
  return __ISDefaultLog();
}

uint64_t _ISTraceLog()
{
  return __ISTraceLog();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int acl_free(void *obj_p)
{
  return _acl_free(obj_p);
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

void dispatch_main(void)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return _dispatch_workloop_create(label);
}

void free(void *a1)
{
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

uint64_t sandbox_extension_issue_file()
{
  return _sandbox_extension_issue_file();
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return _uuid_compare(uu1, uu2);
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend__deviceLanguage(void *a1, const char *a2, ...)
{
  return [a1 _deviceLanguage];
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return [a1 anonymousListener];
}

id objc_msgSend_bitmapData(void *a1, const char *a2, ...)
{
  return [a1 bitmapData];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cacheURL(void *a1, const char *a2, ...)
{
  return [a1 cacheURL];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_digest(void *a1, const char *a2, ...)
{
  return [a1 digest];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_fileOwnerAccountName(void *a1, const char *a2, ...)
{
  return [a1 fileOwnerAccountName];
}

id objc_msgSend_icon(void *a1, const char *a2, ...)
{
  return [a1 icon];
}

id objc_msgSend_iconCache(void *a1, const char *a2, ...)
{
  return [a1 iconCache];
}

id objc_msgSend_iconSize(void *a1, const char *a2, ...)
{
  return [a1 iconSize];
}

id objc_msgSend_ignoreCache(void *a1, const char *a2, ...)
{
  return [a1 ignoreCache];
}

id objc_msgSend_imageDescriptor(void *a1, const char *a2, ...)
{
  return [a1 imageDescriptor];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_largest(void *a1, const char *a2, ...)
{
  return [a1 largest];
}

id objc_msgSend_minimumSize(void *a1, const char *a2, ...)
{
  return [a1 minimumSize];
}

id objc_msgSend_mutableStoreIndex(void *a1, const char *a2, ...)
{
  return [a1 mutableStoreIndex];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_removeAll(void *a1, const char *a2, ...)
{
  return [a1 removeAll];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_unitSourceRegistry(void *a1, const char *a2, ...)
{
  return [a1 unitSourceRegistry];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_validationToken(void *a1, const char *a2, ...)
{
  return [a1 validationToken];
}

id objc_msgSend_workLoop(void *a1, const char *a2, ...)
{
  return [a1 workLoop];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}