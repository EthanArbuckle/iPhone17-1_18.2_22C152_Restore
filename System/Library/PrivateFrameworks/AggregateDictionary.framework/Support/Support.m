char *sub_1000015B4()
{
  uint64_t v0;
  const void *v1;
  id v2;
  void *Value;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  CFStringRef v14;
  CFStringRef v15;
  CFStringRef v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  CFStringRef v23;
  CFStringRef v24;
  CFStringRef v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  CFStringRef v35;
  CFStringRef v36;
  void *i;
  void *v38;
  id v39;
  id v40;
  CFStringRef v41;
  CFStringRef v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  char *v48;
  char *v49;
  uint64_t v50;
  char *j;
  NSSet *v52;
  uint64_t v53;
  uint64_t v54;
  char *result;
  char *v56;
  uint64_t v57;
  char *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  uint64_t v64;
  long long v65;
  long long v66;
  long long v67;
  long long v68;
  long long v69;
  long long v70;
  long long v71;
  long long v72;
  long long v73;
  long long v74;
  long long v75;
  long long v76;
  long long v77;
  long long v78;
  long long v79;
  long long v80;
  unsigned char v81[128];
  unsigned char v82[128];
  unsigned char v83[128];
  uint8_t v84[128];
  uint8_t buf[4];
  id v86;
  __int16 v87;
  id v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  id v92;
  void v93[2];
  void v94[2];

  v0 = ADDaysSince1970();
  v1 = (const void *)_CFCopySystemVersionDictionary();
  v2 = [(id)(id)CFMakeCollectable(v1) objectForKeyedSubscript:@"ProductBuildVersion"];
  Value = (void *)OSAPreferencesGetValue();
  if (v2)
  {
    v4 = Value;
    if ((objc_msgSend(objc_msgSend(Value, "objectForKeyedSubscript:", @"version"), "isEqualToString:", v2) & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v86 = [v4 objectForKeyedSubscript:@"version"];
        v87 = 2114;
        v88 = v2;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "OS change since last run (%{public}@ -> %{public}@)", buf, 0x16u);
      }
      v93[0] = @"version";
      v93[1] = @"day";
      v94[0] = v2;
      v94[1] = +[NSNumber numberWithInt:v0];
      +[NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:2];
      OSAPreferencesSetValue();
    }
  }
  v5 = [+[OSASystemConfiguration sharedInstance] getPrefsKey:@"ScheduledTasking" forDomain:@"com.apple.OTACrashCopier" withOptions:0];
  if (v5)
  {
    v6 = v5;
    v61 = [v5 objectForKeyedSubscript:@"TaskingID"];
    if (v61)
    {
      v7 = (void *)OSAPreferencesGetValue();
      v8 = (void *)OSAPreferencesGetValue();
      v9 = +[NSMutableSet set];
      v62 = v9;
      if (v7)
      {
        if ([v7 isEqualToString:v61]
          && ([v8 isEqualToString:v2] & 1) != 0)
        {
          goto LABEL_51;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          v86 = v7;
          v87 = 2114;
          v88 = v61;
          v89 = 2114;
          v90 = v8;
          v91 = 2114;
          v92 = v2;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Tasking update (%{public}@ -> %{public}@, %{public}@ -> %{public}@)", buf, 0x2Au);
        }
        v10 = (void *)OSAPreferencesGetValue();
        if (v10)
        {
          v11 = v10;
          v59 = v6;
          v79 = 0u;
          v80 = 0u;
          v77 = 0u;
          v78 = 0u;
          v12 = [v10 countByEnumeratingWithState:&v77 objects:v84 count:16];
          if (v12)
          {
            v13 = v12;
            v14 = @"Domain";
            v15 = @"User";
            v16 = @"mobile";
            v17 = *(void *)v78;
            do
            {
              v18 = 0;
              v63 = v13;
              do
              {
                if (*(void *)v78 != v17) {
                  objc_enumerationMutation(v11);
                }
                v19 = *(void **)(*((void *)&v77 + 1) + 8 * (void)v18);
                v20 = [v19 objectForKeyedSubscript:v14];
                v21 = [v19 objectForKeyedSubscript:v15];
                if ([v21 isEqualToString:v16])
                {
                  [v19 objectForKeyedSubscript:@"Key"];
                  OSAPreferencesSetValue();
                  [v62 addObject:v20];
                }
                else if ([v21 isEqualToString:@"__osanalytics__"])
                {
                  -[OSASystemConfiguration setPrefsKey:value:forDomain:withSync:](+[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance"), "setPrefsKey:value:forDomain:withSync:", [v19 objectForKeyedSubscript:@"Key"], 0, v20, 0);
                }
                else
                {
                  v22 = v17;
                  v23 = v16;
                  v24 = v15;
                  v25 = v14;
                  v26 = v11;
                  v27 = +[OSAServicesClient sharedClient];
                  v28 = [v19 objectForKeyedSubscript:@"Key"];
                  v29 = v27;
                  v11 = v26;
                  v14 = v25;
                  v15 = v24;
                  v16 = v23;
                  v17 = v22;
                  v13 = v63;
                  [v29 deletePreference:v28 forUser:v21 inDomain:v20];
                }
                v18 = (char *)v18 + 1;
              }
              while (v13 != v18);
              v13 = [v11 countByEnumeratingWithState:&v77 objects:v84 count:16];
            }
            while (v13);
          }
          OSAPreferencesSetValue();
          OSAPreferencesSetValue();
          OSAPreferencesSetValue();
          v9 = v62;
          [v62 addObject:@"com.apple.aggregated.addaily"];
          v6 = v59;
        }
      }
      v30 = [v6 objectForKeyedSubscript:@"TaskingPayload"];
      if (v30)
      {
        v31 = v30;
        v60 = v6;
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v32 = [v30 countByEnumeratingWithState:&v73 objects:v83 count:16];
        v33 = v31;
        if (v32)
        {
          v34 = v32;
          v35 = @"Domain";
          v36 = @"User";
          v64 = *(void *)v74;
          do
          {
            for (i = 0; i != v34; i = (char *)i + 1)
            {
              if (*(void *)v74 != v64) {
                objc_enumerationMutation(v33);
              }
              v38 = *(void **)(*((void *)&v73 + 1) + 8 * i);
              v39 = [v38 objectForKeyedSubscript:v35];
              v40 = [v38 objectForKeyedSubscript:v36];
              if ([v40 isEqualToString:@"mobile"])
              {
                [v38 objectForKeyedSubscript:@"Key"];
                [v38 objectForKeyedSubscript:@"Value"];
                OSAPreferencesSetValue();
                [v9 addObject:v39];
              }
              else
              {
                v41 = v36;
                v42 = v35;
                v43 = v33;
                if ([v40 isEqualToString:@"__osanalytics__"])
                {
                  -[OSASystemConfiguration setPrefsKey:value:forDomain:withSync:](+[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance"), "setPrefsKey:value:forDomain:withSync:", [v38 objectForKeyedSubscript:@"Key"], objc_msgSend(v38, "objectForKeyedSubscript:", @"Value"), v39, 1);
                }
                else
                {
                  v44 = +[OSAServicesClient sharedClient];
                  v45 = [v38 objectForKeyedSubscript:@"Key"];
                  v46 = [v38 objectForKeyedSubscript:@"Value"];
                  v47 = v45;
                  v9 = v62;
                  [v44 setPreference:v47 forUser:v40 inDomain:v39 toValue:v46];
                }
                v33 = v43;
                v35 = v42;
                v36 = v41;
              }
            }
            v34 = [v33 countByEnumeratingWithState:&v73 objects:v83 count:16];
          }
          while (v34);
        }
        OSAPreferencesSetValue();
        OSAPreferencesSetValue();
        [v60 objectForKeyedSubscript:@"TaskingDigest"];
        OSAPreferencesSetValue();
        OSAPreferencesSetValue();
        [v9 addObject:@"com.apple.aggregated.addaily"];
      }
      if ([v9 count])
      {
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v48 = (char *)[v9 countByEnumeratingWithState:&v69 objects:v82 count:16];
        if (v48)
        {
          v49 = v48;
          v50 = *(void *)v70;
          do
          {
            for (j = 0; j != v49; ++j)
            {
              if (*(void *)v70 != v50) {
                objc_enumerationMutation(v9);
              }
              OSAPreferencesSynchronize();
            }
            v49 = (char *)[v9 countByEnumeratingWithState:&v69 objects:v82 count:16];
          }
          while (v49);
        }
      }
      notify_post("com.apple.da.tasking_changed");
    }
  }
LABEL_51:
  v52 = (NSSet *)[+[OSASystemConfiguration sharedInstance] getLogBlacklist];
  v53 = OSAPreferencesGetValue();
  if (v53)
  {
    v54 = v53;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v52 = +[NSSet setWithArray:v54];
    }
  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  result = (char *)[(NSSet *)v52 countByEnumeratingWithState:&v65 objects:v81 count:16];
  if (result)
  {
    v56 = result;
    v57 = *(void *)v66;
    do
    {
      v58 = 0;
      do
      {
        if (*(void *)v66 != v57) {
          objc_enumerationMutation(v52);
        }
        AnalyticsSendEventLazy();
        ++v58;
      }
      while (v56 != v58);
      result = (char *)[(NSSet *)v52 countByEnumeratingWithState:&v65 objects:v81 count:16];
      v56 = result;
    }
    while (result);
  }
  return result;
}

NSDictionary *sub_100001EBC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CFStringRef v3 = @"bugType";
  uint64_t v4 = v1;
  return +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];
}

uint64_t start(int a1, uint64_t a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "addaily started", (uint8_t *)&v11, 2u);
  }
  if (a1 == 1)
  {
    mach_service = xpc_connection_create_mach_service("com.apple.aggregated.addaily", (dispatch_queue_t)&_dispatch_main_q, 1uLL);
    if (mach_service)
    {
      v6 = mach_service;
      xpc_connection_set_event_handler(mach_service, &stru_100004310);
      xpc_connection_resume(v6);
    }
    while (CFRunLoopRunInMode(kCFRunLoopDefaultMode, 10.0, 1u) != kCFRunLoopRunTimedOut)
      ;
    goto LABEL_18;
  }
  if (a1 < 2) {
    goto LABEL_18;
  }
  int v7 = ADDaysSince1970();
  v8 = *(const char **)(a2 + 8);
  if (!strcmp(v8, "-d"))
  {
    sub_1000023D0();
    goto LABEL_18;
  }
  if (!strcmp(v8, "-f"))
  {
    int v9 = v7 - 1;
LABEL_17:
    sub_10000213C(v9);
    goto LABEL_18;
  }
  if (!strcmp(v8, "-t"))
  {
    int v9 = v7;
    goto LABEL_17;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unknown arg: %s", (uint8_t *)&v11, 0xCu);
  }
LABEL_18:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "addaily ended", (uint8_t *)&v11, 2u);
  }
  return 0;
}

void sub_10000213C(int a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "daily tasks for day %d", (uint8_t *)v3, 8u);
  }
  sub_1000024B4();
  CRDumpAllOldStructuredDataLogs();
  sub_1000015B4();
  rollAppleCareLogs();
}

void sub_1000021FC(id a1, OS_xpc_object *a2)
{
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_connection)
  {
    xpc_connection_set_target_queue(a2, (dispatch_queue_t)&_dispatch_main_q);
    xpc_connection_set_event_handler(a2, &stru_100004330);
    xpc_connection_resume(a2);
  }
}

void sub_100002274(id a1, OS_xpc_object *a2)
{
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100002330;
    block[3] = &unk_100004358;
    block[4] = a2;
    if (qword_100008110 != -1) {
      dispatch_once(&qword_100008110, block);
    }
  }
}

void sub_100002330(uint64_t a1)
{
  int int64 = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 32), "operation");
  if (int64 == 3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received an XPC request to run yesterday's daily tasks", v2, 2u);
    }
    sub_1000023D0();
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100002E70(int64);
  }
}

void sub_1000023D0()
{
  uint64_t v0 = ADDaysSince1970() - 1;
  if (OSAPreferencesGetIntegerValue() >= (int)v0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v1 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Day unchanged since last run", v1, 2u);
    }
  }
  else
  {
    sub_10000213C(v0);
    +[NSNumber numberWithInt:v0];
    OSAPreferencesSetValue();
    OSAPreferencesSynchronize();
  }
}

void sub_1000024B4()
{
  uint64_t v1 = (void *)MGCopyAnswer();
  if (v1)
  {
    v2 = v1;
    uint64_t v3 = kMGQDiskUsageTotalDiskCapacity;
    if ([v1 objectForKeyedSubscript:kMGQDiskUsageTotalDiskCapacity]) {
      objc_msgSend(objc_msgSend(v2, "objectForKeyedSubscript:", v3), "longLongValue");
    }
    uint64_t v4 = kMGQDiskUsageTotalDataAvailable;
    if ([v2 objectForKeyedSubscript:kMGQDiskUsageTotalDataAvailable]) {
      objc_msgSend(objc_msgSend(v2, "objectForKeyedSubscript:", v4), "longLongValue");
    }
  }
  ADClientSetValueForScalarKey();
  ADClientSetValueForScalarKey();
  id v5 = objc_alloc((Class)AnalyticsWorkspace);
  id v6 = [v5 initWorkspaceWithService:kSymptomAnalyticsServiceEndpoint];
  id v7 = [objc_alloc((Class)UsageFeed) initWithWorkspace:v6];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3052000000;
  v23 = sub_1000027E0;
  v24 = sub_1000027F0;
  dispatch_semaphore_t v25 = 0;
  dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
  dispatch_retain((dispatch_object_t)v21[5]);
  id v8 = v6;
  id v9 = v7;
  v10 = +[NSSet set];
  cf[0] = _NSConcreteStackBlock;
  cf[1] = (CFTypeRef)3221225472;
  cf[2] = sub_1000027FC;
  cf[3] = &unk_100004380;
  cf[5] = v6;
  cf[6] = &v20;
  cf[4] = v7;
  [v7 usageToDateFor:v10 nameKind:kUsageProcessProcName reply:cf];
  dispatch_time_t v11 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait((dispatch_semaphore_t)v21[5], v11)
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Symptoms timed out, no datausage available", v18, 2u);
  }
  dispatch_release((dispatch_object_t)v21[5]);

  _Block_object_dispose(&v20, 8);
  uint64_t v12 = IOReportCopyChannelsInCategories();
  if (v12)
  {
    v13 = (const void *)v12;
    IOReportPrune();
    cf[0] = 0;
    uint64_t Subscription = IOReportCreateSubscription();
    if (Subscription)
    {
      v15 = (const void *)Subscription;
      uint64_t Samples = IOReportCreateSamples();
      if (Samples)
      {
        v17 = (const void *)Samples;
        IOReportIterate();
        CFRelease(v17);
      }
      if (cf[0]) {
        CFRelease(cf[0]);
      }
      CFRelease(v15);
    }
    CFRelease(v13);
  }
}

void sub_1000027C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000027E0(uint64_t a1, uint64_t a2)
{
}

void sub_1000027F0(uint64_t a1)
{
}

void sub_1000027FC(uint64_t a1, void *a2)
{
  int v2 = ADDaysSince1970();
  uint64_t v3 = +[NSArray arrayWithObjects:@"wifiInBytes", @"wifiOutBytes", @"wwanInBytes", @"wwanOutBytes", 0];
  id v38 = +[NSMutableDictionary dictionary];
  uint64_t Value = OSAPreferencesGetValue();
  if (!Value || (id v5 = (NSDictionary *)Value, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    id v5 = +[NSDictionary dictionary];
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v39 = [a2 countByEnumeratingWithState:&v52 objects:v58 count:16];
  if (v39)
  {
    signed int v43 = v2 - 1;
    uint64_t v35 = kUsageSinceTime;
    uint64_t v36 = *(void *)v53;
    v41 = v3;
    v37 = v5;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v53 != v36) {
          objc_enumerationMutation(a2);
        }
        id v7 = *(void **)(*((void *)&v52 + 1) + 8 * v6);
        id v8 = [v7 objectForKey:@"bundleName"];
        uint64_t v40 = v6;
        if (v8)
        {
          CFStringRef v42 = &stru_1000047E0;
          id v9 = v8;
        }
        else
        {
          id v9 = [v7 objectForKey:@"procName"];
          CFStringRef v42 = @"com.apple.";
        }
        v10 = +[NSMutableArray arrayWithCapacity:(char *)[(NSArray *)v3 count] + 1];
        id v11 = [v7 objectForKey:v35];
        [(NSMutableArray *)v10 addObject:v11];
        id v12 = [(NSDictionary *)v5 objectForKey:v9];
        if (v12
          && (v13 = v12, objc_msgSend(v11, "isEqualToDate:", objc_msgSend(v12, "objectAtIndex:", 0))))
        {
          uint64_t v14 = (uint64_t)v9;
          id v15 = [v13 objectEnumerator];
          [v15 nextObject];
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v16 = [(NSArray *)v3 countByEnumeratingWithState:&v48 objects:v57 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v49;
            do
            {
              for (i = 0; i != v17; i = (char *)i + 1)
              {
                if (*(void *)v49 != v18) {
                  objc_enumerationMutation(v41);
                }
                uint64_t v20 = *(void **)(*((void *)&v48 + 1) + 8 * i);
                id v21 = [v7 objectForKey:v20];
                [(NSMutableArray *)v10 addObject:v21];
                id v22 = [v15 nextObject];
                v23 = [v21 longLongValue];
                uint64_t v24 = v23 - (unsigned char *)[v22 longLongValue];
                if (v24 < 1)
                {
                  if (v24 < 0)
                  {
                    +[NSString stringWithFormat:@"datausage.baddata.%@%@", v42, v14];
                    ADClientAddValueForScalarKey();
                  }
                }
                else
                {
                  sub_100002CFC(v20, (uint64_t)v42, v14, v24);
                }
              }
              id v17 = [(NSArray *)v41 countByEnumeratingWithState:&v48 objects:v57 count:16];
            }
            while (v17);
          }
        }
        else
        {
          uint64_t v14 = (uint64_t)v9;
          signed int v25 = [v11 daysSince1970];
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          id v26 = [(NSArray *)v3 countByEnumeratingWithState:&v44 objects:v56 count:16];
          if (v26)
          {
            id v27 = v26;
            uint64_t v28 = *(void *)v45;
            do
            {
              for (j = 0; j != v27; j = (char *)j + 1)
              {
                if (*(void *)v45 != v28) {
                  objc_enumerationMutation(v3);
                }
                v30 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
                id v31 = [v7 objectForKey:v30];
                [(NSMutableArray *)v10 addObject:v31];
                if (v25 >= v43) {
                  sub_100002CFC(v30, (uint64_t)v42, v14, (uint64_t)[v31 longLongValue]);
                }
              }
              id v27 = [(NSArray *)v3 countByEnumeratingWithState:&v44 objects:v56 count:16];
            }
            while (v27);
          }
          if (v25 < v43)
          {
            +[NSString stringWithFormat:@"datausage.olddata.%@%@", v42, v14];
            ADClientAddValueForScalarKey();
          }
        }
        [v38 setObject:v10 forKey:v14];
        uint64_t v6 = v40 + 1;
        uint64_t v3 = v41;
        id v5 = v37;
      }
      while ((id)(v40 + 1) != v39);
      id v39 = [a2 countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v39);
  }
  OSAPreferencesSetValue();
  OSAPreferencesSynchronize();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));

  dispatch_release(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
}

id sub_100002CFC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id result = [a1 rangeOfString:@"Bytes"];
  if ((unint64_t)(a4 + 1023) >= 0x7FF && result != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"datausage.%@KB.%@%@", [a1 substringToIndex:result], a2, a3);
    return (id)ADClientAddValueForScalarKey();
  }
  return result;
}

int sub_100002DCC(id a1, __CFDictionary *a2)
{
  return 16 * (IOReportChannelGetFormat() != 1);
}

int sub_100002DF4(id a1, __CFDictionary *a2)
{
  if (IOReportChannelGetFormat() == 1)
  {
    +[NSString stringWithFormat:@"com.apple.ioreport.%@", IOReportChannelGetChannelName()];
    IOReportSimpleGetIntegerValue();
    ADClientSetValueForScalarKey();
  }
  return 0;
}

void sub_100002E70(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Received an unsupported XPC request: %u", (uint8_t *)v1, 8u);
}

uint64_t ADClientAddValueForScalarKey()
{
  return _ADClientAddValueForScalarKey();
}

uint64_t ADClientSetValueForScalarKey()
{
  return _ADClientSetValueForScalarKey();
}

uint64_t ADDaysSince1970()
{
  return _ADDaysSince1970();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return _CFMakeCollectable(cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

uint64_t CRDumpAllOldStructuredDataLogs()
{
  return _CRDumpAllOldStructuredDataLogs();
}

uint64_t IOReportChannelGetChannelName()
{
  return _IOReportChannelGetChannelName();
}

uint64_t IOReportChannelGetFormat()
{
  return _IOReportChannelGetFormat();
}

uint64_t IOReportCopyChannelsInCategories()
{
  return _IOReportCopyChannelsInCategories();
}

uint64_t IOReportCreateSamples()
{
  return _IOReportCreateSamples();
}

uint64_t IOReportCreateSubscription()
{
  return _IOReportCreateSubscription();
}

uint64_t IOReportIterate()
{
  return _IOReportIterate();
}

uint64_t IOReportPrune()
{
  return _IOReportPrune();
}

uint64_t IOReportSimpleGetIntegerValue()
{
  return _IOReportSimpleGetIntegerValue();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t OSAPreferencesGetIntegerValue()
{
  return _OSAPreferencesGetIntegerValue();
}

uint64_t OSAPreferencesGetValue()
{
  return _OSAPreferencesGetValue();
}

uint64_t OSAPreferencesSetValue()
{
  return _OSAPreferencesSetValue();
}

uint64_t OSAPreferencesSynchronize()
{
  return _OSAPreferencesSynchronize();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t rollAppleCareLogs()
{
  return _rollAppleCareLogs();
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_daysSince1970(void *a1, const char *a2, ...)
{
  return [a1 daysSince1970];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_getLogBlacklist(void *a1, const char *a2, ...)
{
  return [a1 getLogBlacklist];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedClient(void *a1, const char *a2, ...)
{
  return [a1 sharedClient];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_usageToDateFor_nameKind_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usageToDateFor:nameKind:reply:");
}