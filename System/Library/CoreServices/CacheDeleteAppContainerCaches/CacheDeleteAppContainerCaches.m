void sub_100004148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __RegisterCacheManagementAssetsService_block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 44))
  {
    v1 = (void *)qword_1000108D8;
    qword_1000108D8 = 0;
  }
  else
  {
    if (*(void *)(a1 + 32)) {
      BOOL v2 = qword_1000108D8 == 0;
    }
    else {
      BOOL v2 = 0;
    }
    if (v2)
    {
      qword_1000108D8 = +[CacheDeleteManagedAssets cacheDeleteManagedAssetsWithInfo:atUrgency:](CacheDeleteManagedAssets, "cacheDeleteManagedAssetsWithInfo:atUrgency:");
      _objc_release_x1();
    }
    else if (qword_1000108D8 && *(unsigned char *)(a1 + 45))
    {
      v3 = (void *)qword_1000108D8;
      [v3 cancelPurge];
    }
  }
}

void *__RegisterCacheManagementAssetsService_block_invoke_4(uint64_t a1, void *a2)
{
  v69 = +[NSMutableDictionary dictionary];
  id v4 = a2;
  v5 = [v4 objectForKeyedSubscript:@"CACHE_DELETE_OPERATIONS"];
  v6 = CDGetLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v91 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "com.apple.mobile.cache_delete_managed_assets Callback ENTRY, info: %@", buf, 0xCu);
  }
  v64 = v4;

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v77 objects:v92 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v70 = *(void *)v78;
    id v67 = v7;
    uint64_t v66 = a1;
    do
    {
      v10 = 0;
      id v68 = v9;
      do
      {
        if (*(void *)v78 != v70) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v77 + 1) + 8 * (void)v10);
        v12 = [v7 objectForKeyedSubscript:v11];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v71 = +[TestTelemetry testTelemetryWithInfo:v12];
          v13 = [v12 objectForKeyedSubscript:@"CACHE_DELETE_URGENCY"];
          [v13 integerValue];

          v14 = [v12 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
          v15 = evaluateStringProperty();
          v16 = +[CacheDeleteVolume volumeWithPath:v15];

          v17 = CDGetLogHandle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = [v16 mountPoint];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v91 = 496;
            *(_WORD *)&v91[4] = 2112;
            *(void *)&v91[6] = v18;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%d CacheManagmentAssets volume: %@", buf, 0x12u);
          }
          if ([v11 isEqualToString:@"CACHE_DELETE_PURGE_OPERATION"])
          {
            v19 = [v12 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
            v20 = evaluateNumberProperty();

            v21 = [v16 mountPoint];
            if (hasUserVolume()) {
              v22 = "/private/var/mobile";
            }
            else {
              v22 = "/private/var";
            }
            v23 = +[NSString stringWithUTF8String:v22];
            if ([v21 isEqualToString:v23] && v20)
            {
              uint64_t v24 = (uint64_t)[v20 longLongValue];

              if (v24 >= 1)
              {
                v25 = (*(void (**)(void))(*(void *)(v66 + 32) + 16))();
                if (v25)
                {
                  id v26 = objc_msgSend(v25, "purgeAssets:testObject:", objc_msgSend(v20, "unsignedLongLongValue"), v71);
                  id v27 = (id)(*(uint64_t (**)(void))(*(void *)(v66 + 32) + 16))();
                  v88[0] = @"CACHE_DELETE_AMOUNT";
                  v28 = +[NSNumber numberWithLongLong:v26];
                  v88[1] = @"CACHE_DELETE_VOLUME";
                  v89[0] = v28;
                  v29 = [v25 volume];
                  v89[1] = v29;
                  v30 = +[NSDictionary dictionaryWithObjects:v89 forKeys:v88 count:2];

                  goto LABEL_43;
                }
                v30 = &off_10000CF28;
                id v7 = v67;
LABEL_44:

                [v69 setObject:v30 forKeyedSubscript:@"CACHE_DELETE_PURGE_OPERATION"];
LABEL_63:

                id v9 = v68;
                goto LABEL_64;
              }
            }
            else
            {
            }
            v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Amount doesn't make sense: %lld", [v20 longLongValue], v64);
            CFStringRef v86 = @"CACHE_DELETE_ERROR";
            v87 = v25;
            v30 = +[NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
LABEL_43:
            id v7 = v67;
            goto LABEL_44;
          }
          if ([v11 isEqualToString:@"CACHE_DELETE_PURGEABLE_OPERATION"])
          {
            v32 = [v16 mountPoint];
            if (hasUserVolume()) {
              v33 = "/private/var/mobile";
            }
            else {
              v33 = "/private/var";
            }
            v34 = +[NSString stringWithUTF8String:v33];
            unsigned int v35 = [v32 isEqualToString:v34];

            if (v35)
            {
              v36 = (*(void (**)(void))(*(void *)(v66 + 32) + 16))();
              if (v36)
              {
                uint64_t v76 = 0;
                v65 = v36;
                v37 = [v36 sizeEligibleAsset:&v76];
                id v38 = (id)(*(uint64_t (**)(void))(*(void *)(v66 + 32) + 16))();
                v39 = CDGetLogHandle();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "purgeableAssets:", buf, 2u);
                }

                long long v74 = 0u;
                long long v75 = 0u;
                long long v72 = 0u;
                long long v73 = 0u;
                id v40 = v37;
                id v41 = [v40 countByEnumeratingWithState:&v72 objects:v85 count:16];
                if (v41)
                {
                  id v42 = v41;
                  uint64_t v43 = *(void *)v73;
                  do
                  {
                    for (i = 0; i != v42; i = (char *)i + 1)
                    {
                      if (*(void *)v73 != v43) {
                        objc_enumerationMutation(v40);
                      }
                      uint64_t v45 = *(void *)(*((void *)&v72 + 1) + 8 * i);
                      v46 = CDGetLogHandle();
                      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        *(void *)v91 = v45;
                        _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                      }
                    }
                    id v42 = [v40 countByEnumeratingWithState:&v72 objects:v85 count:16];
                  }
                  while (v42);
                }

                v83[0] = @"CACHE_DELETE_AMOUNT";
                v47 = +[NSNumber numberWithLongLong:v76];
                v83[1] = @"CACHE_DELETE_VOLUME";
                v84[0] = v47;
                v48 = [v65 volume];
                v84[1] = v48;
                v49 = +[NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:2];

                v50 = v65;
              }
              else
              {
                v50 = 0;
                v49 = &off_10000CF50;
              }
            }
            else
            {
              v52 = CDGetLogHandle();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
              {
                v53 = [v12 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v91 = 544;
                *(_WORD *)&v91[4] = 2112;
                *(void *)&v91[6] = v53;
                _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%d CacheManagementAssets Purgeable skipping volume: %@", buf, 0x12u);
              }
              v81[0] = @"CACHE_DELETE_AMOUNT";
              v81[1] = @"CACHE_DELETE_VOLUME";
              v82[0] = &off_10000CE70;
              v50 = objc_msgSend(v12, "objectForKeyedSubscript:");
              v82[1] = v50;
              v49 = +[NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:2];
            }

            [v69 setObject:v49 forKeyedSubscript:@"CACHE_DELETE_PURGEABLE_OPERATION"];
          }
          else
          {
            if ([v11 isEqualToString:@"CACHE_DELETE_PURGE_CANCEL_OPERATION"])
            {
              id v51 = (id)(*(uint64_t (**)(void))(*(void *)(v66 + 32) + 16))();
              goto LABEL_63;
            }
            if (![v11 isEqualToString:@"CACHE_DELETE_PERIODIC_OPERATION"])
            {
              if ([v11 isEqualToString:@"CACHE_DELETE_ANALYTICS_REPORT"])
              {
                id v58 = objc_alloc_init((Class)NSMutableDictionary);
                for (int j = 1; j != 5; ++j)
                {
                  v60 = (*(void (**)(void))(*(void *)(v66 + 32) + 16))();
                  v61 = [v60 analytics];
                  [v58 addEntriesFromDictionary:v61];

                  id v62 = (id)(*(uint64_t (**)(void))(*(void *)(v66 + 32) + 16))();
                }
                [v69 setObject:v58 forKeyedSubscript:@"CACHE_DELETE_ANALYTICS_REPORT"];

                id v7 = v67;
              }
              goto LABEL_63;
            }
            v54 = (*(void (**)(void))(*(void *)(v66 + 32) + 16))();
            v55 = v54;
            if (v54)
            {
              [v54 periodic:v71];
              id v56 = (id)(*(uint64_t (**)(void))(*(void *)(v66 + 32) + 16))();
              v57 = 0;
            }
            else
            {
              v57 = &off_10000CF78;
            }
            [v69 setObject:v57 forKeyedSubscript:@"CACHE_DELETE_PERIODIC_OPERATION"];
          }
          id v7 = v67;
          goto LABEL_63;
        }
        v31 = CDGetLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v91 = v12;
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "operation info is not a dictionary: %@", buf, 0xCu);
        }

        [v69 setObject:&off_10000CF00 forKeyedSubscript:@"CACHE_DELETE_SERVICE_REQUEST_OPERATION"];
LABEL_64:

        v10 = (char *)v10 + 1;
      }
      while (v10 != v9);
      id v9 = [v7 countByEnumeratingWithState:&v77 objects:v92 count:16];
    }
    while (v9);
  }

  return v69;
}

uint64_t RegisterCacheDeleteAppFreezerService()
{
  if (RegisterCacheDeleteAppFreezerService_onceToken != -1) {
    dispatch_once(&RegisterCacheDeleteAppFreezerService_onceToken, &__block_literal_global);
  }

  return _CacheDeleteRegisterInfoCallbacks(@"com.apple.mobile.cache_delete_app_freezer", &__block_literal_global_11, &__block_literal_global_26, 0, &__block_literal_global_30);
}

void maybeReenableAppFreezer()
{
  if (isAppFreezerEnabled()) {
    return;
  }
  int v8 = 0;
  id v0 = objc_alloc_init((Class)NSUserDefaults);
  if (fsctl("/private/var", 0x40046818uLL, &v8, 0))
  {
    int v1 = *__error();
    BOOL v2 = CDGetLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v7 = strerror(v1);
      *(_DWORD *)buf = 136315394;
      v10 = "/private/var";
      __int16 v11 = 2080;
      v12 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Failed to determine the state of volume %s: %s", buf, 0x16u);
    }
LABEL_5:

    setAppFreezeEnabled(1);
    return;
  }
  int v3 = v8 & 0x2204;
  if (v0)
  {
    unsigned __int8 v4 = [v0 BOOLForKey:@"AppFreezerDisabledByCDKey"];
    if (v3)
    {
LABEL_14:
      if (!v3)
      {
        BOOL v2 = CDGetLogHandle();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "SHOULD reenable app freezer as freezer was disabled by CD", buf, 2u);
        }
        goto LABEL_5;
      }
      goto LABEL_15;
    }
  }
  else
  {
    unsigned __int8 v4 = 0;
    if ((v8 & 0x2204) != 0) {
      goto LABEL_14;
    }
  }
  if (v4) {
    goto LABEL_14;
  }
  v5 = CDGetLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SHOULD not reenable app freezer as freezer was not disabled by CD", buf, 2u);
  }

LABEL_15:
  v6 = CDGetLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SHOULD NOT reenable app freezer", buf, 2u);
  }
}

void sub_100005760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __RegisterCacheDeleteAppFreezerService_block_invoke_19(uint64_t a1)
{
  uint64_t result = isAppFreezerEnabled();
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[NSNumber numberWithUnsignedLongLong:sizeOfFreezeFiles()];
    return _objc_release_x1();
  }
  return result;
}

BOOL isAppFreezerEnabled()
{
  int v7 = 0;
  size_t v6 = 4;
  if (sysctlbyname("vm.freeze_enabled", &v7, &v6, 0, 0))
  {
    int v0 = *__error();
    int v1 = CDGetLogHandle();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      v5 = strerror(v0);
      *(_DWORD *)buf = 136315138;
      id v9 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Failed to determine freezer state: %s", buf, 0xCu);
    }

    int v7 = 0;
LABEL_5:
    BOOL v2 = CDGetLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v3 = "App freezer NOT enabled";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, v3, buf, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (!v7) {
    goto LABEL_5;
  }
  BOOL v2 = CDGetLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    int v3 = "App freezer enabled";
    goto LABEL_10;
  }
LABEL_11:

  return v7 != 0;
}

uint64_t sizeOfFreezeFiles()
{
  uint64_t v2 = 0;
  int v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v5 = 0;
  traverse_directory();
  uint64_t v0 = v3[3];
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_100005A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005BF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
}

void __RegisterCacheDeleteAppFreezerService_block_invoke_3_27(uint64_t a1)
{
  if (isAppFreezerEnabled())
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sizeOfFreezeFiles();
    setAppFreezeEnabled(0);
  }
}

void setAppFreezeEnabled(int a1)
{
  HIDWORD(v10) = a1;
  id v2 = objc_alloc_init((Class)NSUserDefaults);
  LODWORD(v10) = 0;
  size_t v9 = 4;
  int v3 = CDGetLogHandle();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (a1)
  {
    if (!v4) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v5 = "Enabling app freezer";
  }
  else
  {
    if (!v4) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v5 = "Disabling app freezer";
  }
  _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v5, buf, 2u);
LABEL_7:

  if (sysctlbyname("vm.freeze_enabled", &v10, &v9, (char *)&v10 + 4, 4uLL))
  {
    int v6 = *__error();
    int v7 = CDGetLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = strerror(v6);
      *(_DWORD *)buf = 136315138;
      v12 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to disable app freezing: %s", buf, 0xCu);
    }
  }
  else if (v2)
  {
    objc_msgSend(v2, "setBool:forKey:", a1 ^ 1u, @"AppFreezerDisabledByCDKey", v9, v10);
  }
}

uint64_t __sizeOfFreezeFiles_block_invoke(uint64_t a1, const char *a2, uint64_t a3)
{
  int v6 = *(const char **)(a1 + 40);
  size_t v7 = strlen(v6);
  if (!strncmp(a2, v6, v7)) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += *(void *)(a3 + 8);
  }
  return 1;
}

int main(int argc, const char **argv, const char **envp)
{
  RegisterCacheManagementAssetsService();
  RegisterCacheDeleteAppFreezerService();
  dispatch_main();
}

void sub_100006264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_100007FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

void RegisterCacheManagementAssetsService()
{
  if (RegisterCacheManagementAssetsService_once != -1) {
    dispatch_once(&RegisterCacheManagementAssetsService_once, &__block_literal_global_114);
  }
  CFStringRef v1 = @"CACHE_DELETE_REQUIRED_ENTITLEMENTS";
  id v2 = &off_10000CEE8;
  uint64_t v0 = +[NSDictionary dictionaryWithObjects:&v2 forKeys:&v1 count:1];
  CacheDeleteRegisterCallback();
}

uint64_t CDGetLogHandle()
{
  return _CDGetLogHandle();
}

uint64_t CacheDeleteRegisterCallback()
{
  return _CacheDeleteRegisterCallback();
}

uint64_t CacheDeleteUserManagedAssetsPurgeable()
{
  return _CacheDeleteUserManagedAssetsPurgeable();
}

uint64_t CacheManagementEnumerateAssets()
{
  return _CacheManagementEnumerateAssets();
}

uint64_t CacheManagementRemove()
{
  return _CacheManagementRemove();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t assert_group_cache_deletion()
{
  return _assert_group_cache_deletion();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return _dispatch_block_create_with_qos_class(flags, qos_class, relative_priority, block);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t evaluateNumberProperty()
{
  return _evaluateNumberProperty();
}

uint64_t evaluateStringProperty()
{
  return _evaluateStringProperty();
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _fsctl(a1, a2, a3, a4);
}

uint64_t getRootVolume()
{
  return _getRootVolume();
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

uint64_t hasUserVolume()
{
  return _hasUserVolume();
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
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

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int rmdir(const char *a1)
{
  return _rmdir(a1);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

uint64_t traverse_directory()
{
  return _traverse_directory();
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

id objc_msgSend_analytics(void *a1, const char *a2, ...)
{
  return [a1 analytics];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelPurge(void *a1, const char *a2, ...)
{
  return [a1 cancelPurge];
}

id objc_msgSend_consumedDate(void *a1, const char *a2, ...)
{
  return [a1 consumedDate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return [a1 dataContainerURL];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_downloadCompletionDate(void *a1, const char *a2, ...)
{
  return [a1 downloadCompletionDate];
}

id objc_msgSend_downloadStartDate(void *a1, const char *a2, ...)
{
  return [a1 downloadStartDate];
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return [a1 expirationDate];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return [a1 info];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mountPoint(void *a1, const char *a2, ...)
{
  return [a1 mountPoint];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_q(void *a1, const char *a2, ...)
{
  return [a1 q];
}

id objc_msgSend_removeFailures(void *a1, const char *a2, ...)
{
  return [a1 removeFailures];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_terminationFailures(void *a1, const char *a2, ...)
{
  return [a1 terminationFailures];
}

id objc_msgSend_testObject(void *a1, const char *a2, ...)
{
  return [a1 testObject];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_urgency(void *a1, const char *a2, ...)
{
  return [a1 urgency];
}

id objc_msgSend_volume(void *a1, const char *a2, ...)
{
  return [a1 volume];
}

id objc_msgSend_volumeWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumeWithPath:");
}