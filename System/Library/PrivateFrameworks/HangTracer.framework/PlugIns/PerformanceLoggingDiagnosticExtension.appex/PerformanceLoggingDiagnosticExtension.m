double timebaseConversionFactor()
{
  if (qword_100015FE8 != -1) {
    dispatch_once(&qword_100015FE8, &stru_1000103A8);
  }
  return *(double *)&qword_100015FE0;
}

void sub_10000170C(id a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  *(double *)&qword_100015FE0 = (float)((float)((float)info.numer * 0.000001) / (float)info.denom);
}

uint64_t applyTailspinConfig(uint64_t a1)
{
  v2 = shared_ht_log_handle();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (a1)
  {
    if (v3)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "ApplyTailspinConfig: change tailspin config", buf, 2u);
    }

    return tailspin_config_apply_sync();
  }
  else
  {
    if (v3)
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "ApplyTailspinConfig: provided desiredConfig is null", v5, 2u);
    }

    return 0;
  }
}

BOOL sub_10000180C()
{
  v0 = arrayOfCFPrefsWithPrefix(@"com.apple.da", @"mobile", @"HTThirdPartyDevSupport");
  BOOL v1 = [v0 count] != 0;

  return v1;
}

uint64_t configureTailspinForEPL(int a1)
{
  unsigned __int8 v2 = +[PerfDiagsSelfEnablementController isAnyModeActive];
  BOOL v3 = sub_10000180C();
  v4 = shared_ht_log_handle();
  v5 = v4;
  if ((v2 & 1) != 0 || v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      v9 = "ConfigureTailspinForEPL: A different HangTracer enablement mode is ACTIVE, do not attempt to configure tailspin";
      v10 = (uint8_t *)&v12;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
LABEL_14:

    return 0;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "ConfigureTailspinForEPL: Other HangTracer enablement modes are NOT active, attempt to configure tailspin", buf, 2u);
  }

  uint64_t v6 = tailspin_config_create_with_default_config();
  if (!v6)
  {
    v5 = shared_ht_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      v9 = "ConfigureTailspinForEPL: Failed to create tailspin config object";
      v10 = v13;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  uint64_t v7 = v6;
  if (a1) {
    tailspin_enabled_set();
  }
  uint64_t v8 = applyTailspinConfig(v7);
  tailspin_config_free();
  return v8;
}

void sub_100001A04(id a1)
{
  v3[0] = @"HTProfile";
  v3[1] = @"HTEPL";
  v3[2] = @"HTThirdPartyDevSupport";
  v3[3] = @"PLTasking";
  v3[4] = &stru_100010A50;
  v3[5] = @"PDSEHangTracer";
  v3[6] = @"PDSEHTBadDay";
  v3[7] = @"PDSEHTThirdParty";
  v3[8] = @"PDSEWorkflowResponsiveness";
  v3[9] = @"PDSEHTRateOnly";
  v3[10] = @"PDSESentry";
  v3[11] = @"PDSEAppLaunch";
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:12];
  unsigned __int8 v2 = (void *)qword_100015FF8;
  qword_100015FF8 = v1;
}

void sub_1000038A4(id a1)
{
  qword_100016000 = objc_alloc_init(HTPrefs);
  _objc_release_x1();
}

void sub_100005ABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  objc_destroyWeak(v33);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v34 - 208), 8);
  _Block_object_dispose((const void *)(v34 - 176), 8);
  _Block_object_dispose((const void *)(v34 - 144), 8);
  objc_destroyWeak((id *)(v34 - 104));
  _Unwind_Resume(a1);
}

void sub_100005B20(uint64_t a1, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == a2)
  {
    BOOL v3 = shared_ht_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v4 = "HTPrefs: Tasking Changed";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v4, buf, 2u);
    }
  }
  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == a2)
  {
    BOOL v3 = shared_ht_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v4 = "HTPrefs: Telemetry Changed";
      goto LABEL_16;
    }
  }
  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == a2)
  {
    BOOL v3 = shared_ht_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v4 = "HTPrefs: Profile List Changed";
      goto LABEL_16;
    }
  }
  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == a2)
  {
    BOOL v3 = shared_ht_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v4 = "HTPrefs: EPL State Changed";
      goto LABEL_16;
    }
  }
  else
  {
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) != a2) {
      goto LABEL_18;
    }
    BOOL v3 = shared_ht_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v4 = "HTPrefs: HT Self-Enablement State Changed Triggered Refresh";
      goto LABEL_16;
    }
  }

LABEL_18:
  v5 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  unsigned int v7 = [WeakRetained hangtracerDaemonEnabled];

  [*(id *)(a1 + 32) refreshHTPrefs];
  id v8 = objc_loadWeakRetained((id *)(a1 + 80));
  LODWORD(WeakRetained) = [v8 hangtracerDaemonEnabled];

  if (v7 != WeakRetained)
  {
    v9 = shared_ht_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if (v7) {
        CFStringRef v10 = @"ON";
      }
      else {
        CFStringRef v10 = @"OFF";
      }
      id v11 = objc_loadWeakRetained(v5);
      if ([v11 hangtracerDaemonEnabled]) {
        CFStringRef v12 = @"ON";
      }
      else {
        CFStringRef v12 = @"OFF";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v21 = v10;
      __int16 v22 = 2112;
      CFStringRef v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "HTPrefs: HangTracer Enabled State Changed: %@ -> %@", buf, 0x16u);
    }
    id v13 = objc_loadWeakRetained(v5);
    v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v13, "hangtracerDaemonEnabled", @"Enabled"));
    v19 = v14;
    v15 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];

    v16 = +[NSNotificationCenter defaultCenter];
    id v17 = objc_loadWeakRetained(v5);
    [v16 postNotificationName:@"com.apple.hangtracer.daemonstate" object:v17 userInfo:v15];
  }
}

void sub_100005E74(uint64_t a1, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == a2)
  {
    unsigned __int8 v2 = shared_ht_log_handle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "HTPrefs: Test Reset Log Limits", v3, 2u);
    }
  }
}

void sub_1000068F4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void cleanupDiagnosticLogsDirectory(void *a1)
{
  id v1 = a1;
  unsigned __int8 v2 = +[NSFileManager defaultManager];
  BOOL v3 = shared_ht_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000091C8((uint64_t)v1, v3);
  }

  v16 = v1;
  uint64_t v4 = +[NSURL URLWithString:v1];
  v5 = [v2 enumeratorAtURL:v4 includingPropertiesForKeys:0 options:0 errorHandler:&stru_100010478];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v17 = 0;
        unsigned __int8 v12 = [v2 removeItemAtURL:v11 error:&v17];
        id v13 = v17;
        v14 = shared_ht_log_handle();
        v15 = v14;
        if (v12)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v23 = v11;
            _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Successfully deleted file at %@", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v23 = v11;
          __int16 v24 = 2112;
          id v25 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to delete file at %@ : %@", buf, 0x16u);
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v8);
  }
}

BOOL sub_100006B9C(id a1, NSURL *a2, NSError *a3)
{
  uint64_t v4 = a2;
  v5 = a3;
  id v6 = shared_ht_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to enumerate file at %@ : %@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

void persistAndUnredactLogs(int a1)
{
  CFStringRef v24 = @"Subsystems";
  v22[0] = @"com.apple.hangtracer";
  v22[1] = @"com.apple.performancelogging";
  v23[0] = &off_100011C90;
  v23[1] = &off_100011C90;
  v22[2] = @"com.apple.Sentry.Framework";
  v23[2] = &off_100011C90;
  unsigned __int8 v2 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
  id v25 = v2;
  BOOL v3 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];

  int v4 = OSLogValidateProfilePayload();
  id v5 = 0;
  id v6 = v5;
  if (v4)
  {
    id v7 = shared_ht_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Successfully validated profile payload", buf, 2u);
    }

    if (a1)
    {
      int v8 = OSLogInstallProfilePayload();
      uint64_t v9 = 0;
      __int16 v10 = v9;
      if (v8)
      {
        uint64_t v11 = shared_ht_log_handle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          unsigned __int8 v12 = "Successfully installed profile payload";
LABEL_14:
          id v13 = v11;
          os_log_type_t v14 = OS_LOG_TYPE_INFO;
          uint32_t v15 = 2;
          goto LABEL_15;
        }
        goto LABEL_23;
      }
      if (v9)
      {
        uint64_t v11 = shared_ht_log_handle();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        long long v18 = [v10 localizedDescription];
        *(_DWORD *)buf = 138412290;
        long long v21 = v18;
        long long v19 = "Failed to install os log profile payload with error: %@";
LABEL_22:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);

        goto LABEL_23;
      }
    }
    else
    {
      int v16 = OSLogRemoveProfilePayload();
      id v17 = 0;
      __int16 v10 = v17;
      if (v16)
      {
        uint64_t v11 = shared_ht_log_handle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          unsigned __int8 v12 = "Successfully removed profile payload";
          goto LABEL_14;
        }
LABEL_23:

        goto LABEL_24;
      }
      if (v17)
      {
        uint64_t v11 = shared_ht_log_handle();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_23;
        }
        long long v18 = [v10 localizedDescription];
        *(_DWORD *)buf = 138412290;
        long long v21 = v18;
        long long v19 = "Failed to remove os log profile payload with error: %@";
        goto LABEL_22;
      }
    }
LABEL_24:

    goto LABEL_25;
  }
  if (v5)
  {
    __int16 v10 = shared_ht_log_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v6 localizedDescription];
      *(_DWORD *)buf = 138412290;
      long long v21 = v11;
      unsigned __int8 v12 = "Failed to validate os log profile payload with error: %@";
      id v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      uint32_t v15 = 12;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, buf, v15);
      goto LABEL_23;
    }
    goto LABEL_24;
  }
LABEL_25:
}

void sub_1000077B0(id a1)
{
  id v1 = dlopen("/usr/lib/libMemoryResourceException.dylib", 1);
  qword_100016018 = (uint64_t)v1;
  if (v1)
  {
    qword_100016020 = (uint64_t)dlsym(v1, "OBJC_CLASS_$_RMECacheEnumerator");
  }
  else
  {
    unsigned __int8 v2 = shared_pl_log_handle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "libMemoryResourceException.dylib is not present", v3, 2u);
    }
  }
}

void sub_100008934(id a1)
{
  qword_100016010 = (uint64_t)objc_alloc_init((Class)NSLock);
  _objc_release_x1();
}

id shared_pl_log_handle()
{
  if (qword_100016048 != -1) {
    dispatch_once(&qword_100016048, &stru_100010850);
  }
  v0 = (void *)qword_100016040;
  return v0;
}

void sub_100008B70(id a1)
{
  qword_100016040 = (uint64_t)os_log_create("com.apple.performancelogging", "");
  _objc_release_x1();
}

id arrayOfCFPrefsWithPrefix(const __CFString *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[NSString stringWithFormat:@"%@.", a3];
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  CFArrayRef v8 = CFPreferencesCopyKeyList(a1, v5, kCFPreferencesAnyHost);
  id v9 = [(__CFArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v13 hasPrefix:v6]) {
          [v7 addObject:v13];
        }
      }
      id v10 = [(__CFArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

id shared_ht_log_handle()
{
  if (qword_100016058 != -1) {
    dispatch_once(&qword_100016058, &stru_100010870);
  }
  v0 = (void *)qword_100016050;
  return v0;
}

void sub_100008D90(id a1)
{
  qword_100016050 = (uint64_t)os_log_create("com.apple.hangtracer", "");
  _objc_release_x1();
}

void sub_100008DD4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "HTPrefs: %@ was not found in the %@ domain, a profile, by EPL, by PowerLog Tasking domain, by HT Self Enablement or by HT Sentry Enablement", (uint8_t *)&v3, 0x16u);
}

void sub_100008E5C(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138412802;
  *(void *)&v3[4] = @"enablementPrefix";
  *(_WORD *)&void v3[12] = 2112;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  sub_1000068F4((void *)&_mh_execute_header, (uint64_t)a2, a3, "HTPrefs: %@: %@ -> %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *a2);
}

void sub_100008EE8()
{
  sub_100006914();
  sub_100006924();
  sub_1000068F4((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
}

void sub_100008F84()
{
  sub_100006914();
  sub_100006924();
  sub_1000068F4((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
}

void sub_100009020()
{
  sub_100006914();
  sub_100006924();
  sub_1000068F4((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
}

void sub_1000090BC()
{
  sub_100006914();
  sub_100006924();
  sub_1000068F4((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
}

void sub_100009158(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Preparing prefInitList", v1, 2u);
}

void sub_10000919C()
{
  __assert_rtn("-[HTPrefs setupPrefsWithQueue:]", "HTPrefs.m", 1486, "prefsQueue != NULL");
}

void sub_1000091C8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Cleaning up %@", (uint8_t *)&v2, 0xCu);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyKeyList(applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t OSLogInstallProfilePayload()
{
  return _OSLogInstallProfilePayload();
}

uint64_t OSLogRemoveProfilePayload()
{
  return _OSLogRemoveProfilePayload();
}

uint64_t OSLogValidateProfilePayload()
{
  return _OSLogValidateProfilePayload();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

uint64_t tailspin_config_apply_sync()
{
  return _tailspin_config_apply_sync();
}

uint64_t tailspin_config_create_with_default_config()
{
  return _tailspin_config_create_with_default_config();
}

uint64_t tailspin_config_free()
{
  return _tailspin_config_free();
}

uint64_t tailspin_enabled_set()
{
  return _tailspin_enabled_set();
}

int truncate(const char *a1, off_t a2)
{
  return _truncate(a1, a2);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend___createInternalSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__createInternalSettings");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attachmentWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachmentWithPath:");
}

id objc_msgSend_BOOLProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLProperty:contextPrefixOut:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingComponents_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingComponents:toDate:options:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_doubleProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleProperty:contextPrefixOut:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_earlyInitNecessaryPrefs(void *a1, const char *a2, ...)
{
  return _[a1 earlyInitNecessaryPrefs];
}

id objc_msgSend_enableReportMemoryException_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableReportMemoryException:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_getEPLProfilePath(void *a1, const char *a2, ...)
{
  return _[a1 getEPLProfilePath];
}

id objc_msgSend_hangtracerDaemonEnabled(void *a1, const char *a2, ...)
{
  return _[a1 hangtracerDaemonEnabled];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hudEnabled(void *a1, const char *a2, ...)
{
  return _[a1 hudEnabled];
}

id objc_msgSend_intProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intProperty:contextPrefixOut:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_isAnyModeActive(void *a1, const char *a2, ...)
{
  return _[a1 isAnyModeActive];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isInternal(void *a1, const char *a2, ...)
{
  return _[a1 isInternal];
}

id objc_msgSend_keyWithPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyWithPrefix:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_linkRMEAndGetEPLProfilePath(void *a1, const char *a2, ...)
{
  return _[a1 linkRMEAndGetEPLProfilePath];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectProperty_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectProperty:matchingSelector:contextPrefixOut:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_prefContextPrefixPriorityOrder(void *a1, const char *a2, ...)
{
  return _[a1 prefContextPrefixPriorityOrder];
}

id objc_msgSend_prefInitList(void *a1, const char *a2, ...)
{
  return _[a1 prefInitList];
}

id objc_msgSend_prefNamed_domain_profile_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prefNamed:domain:profile:matchingSelector:contextPrefixOut:");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 preferredLanguages];
}

id objc_msgSend_refreshHTPrefs(void *a1, const char *a2, ...)
{
  return _[a1 refreshHTPrefs];
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeKey_domain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeKey:domain:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setBool_key_domain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:key:domain:");
}

id objc_msgSend_setDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDay:");
}

id objc_msgSend_setDeleteOnAttach_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeleteOnAttach:");
}

id objc_msgSend_setDouble_key_domain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDouble:key:domain:");
}

id objc_msgSend_setEPLKeysForParameters_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEPLKeysForParameters:error:");
}

id objc_msgSend_setInteger_key_domain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteger:key:domain:");
}

id objc_msgSend_setMemoryLoggingIntervalSec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMemoryLoggingIntervalSec:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setShouldPostHTPrefsChangedNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPostHTPrefsChangedNotification:");
}

id objc_msgSend_setString_key_domain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setString:key:domain:");
}

id objc_msgSend_setupPrefsWithQueue_profilePath_taskingDomainName_hangtracerDomain_setupInternalPrefs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPrefsWithQueue:profilePath:taskingDomainName:hangtracerDomain:setupInternalPrefs:");
}

id objc_msgSend_shouldPostHTPrefsChangedNotification(void *a1, const char *a2, ...)
{
  return _[a1 shouldPostHTPrefsChangedNotification];
}

id objc_msgSend_stringProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringProperty:contextPrefixOut:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_sysdiagnoseParamsFromDEParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sysdiagnoseParamsFromDEParams:");
}

id objc_msgSend_sysdiagnoseWithMetadata_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sysdiagnoseWithMetadata:withError:");
}

id objc_msgSend_takeSysdiagnose_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "takeSysdiagnose:error:");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unsignedIntProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntProperty:contextPrefixOut:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedLongProperty:contextPrefixOut:");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongValue];
}