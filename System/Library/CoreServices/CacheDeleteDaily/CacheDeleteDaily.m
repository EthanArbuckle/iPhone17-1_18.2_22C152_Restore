void sub_100003028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

int main(int argc, const char **argv, const char **envp)
{
  v4 = CDGetLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "ENTRY, daily CacheDelete service", buf, 2u);
  }

  CFStringRef v6 = @"CACHE_DELETE_REQUIRED_ENTITLEMENTS";
  v7 = &off_100009948;
  +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  objc_claimAutoreleasedReturnValue();
  register_activity();
  CacheDeleteRegisterCallback();
  id v5 = getLocalCloudDocsURLs();
  dispatch_main();
}

void register_activity()
{
}

__CFDictionary *__cdecl __main_block_invoke(id a1, __CFDictionary *a2)
{
  v2 = a2;
  v3 = [(__CFDictionary *)v2 objectForKeyedSubscript:@"CACHE_DELETE_OPERATIONS"];
  v24 = (__CFDictionary *)objc_opt_new();
  v4 = CDGetLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "com.apple.mobile.cache_delete_daily Callback ENTRY, info: %@", buf, 0xCu);
  }
  v23 = v2;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        unsigned int v10 = [v9 isEqualToString:@"CACHE_DELETE_ANALYTICS_REPORT"];
        v11 = CDGetLogHandle();
        BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        if (v10)
        {
          if (v12)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received Analytics Report Request!", buf, 2u);
          }

          v13 = storageDailyStatsFilename();
          if (v13)
          {
            v14 = +[NSData dataWithContentsOfFile:v13];
            if (v14)
            {
              *(void *)buf = 0;
              v11 = +[NSPropertyListSerialization propertyListWithData:v14 options:0 format:0 error:buf];
              id v15 = *(id *)buf;
              if (!v11)
              {
                v16 = CDGetLogHandle();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)v30 = 0;
                  _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Unable to de-serialize stats", v30, 2u);
                }
                goto LABEL_22;
              }
            }
            else
            {
              v16 = CDGetLogHandle();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                v19 = __error();
                v20 = strerror(*v19);
                *(_DWORD *)buf = 136315138;
                *(void *)&buf[4] = v20;
                _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Unable to read stats: %s", buf, 0xCu);
              }
              id v15 = 0;
LABEL_22:

              v11 = 0;
            }
            unlink((const char *)[v13 UTF8String]);
          }
          else
          {
            v11 = 0;
          }

          if ([v11 count])
          {
            v17 = v24;
            v18 = v11;
          }
          else
          {
            v17 = v24;
            v18 = &__NSDictionary0__struct;
          }
          [(__CFDictionary *)v17 setObject:v18 forKeyedSubscript:v9];
          goto LABEL_28;
        }
        if (v12)
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v9;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Storage Daily ignoring %@", buf, 0xCu);
        }
LABEL_28:
      }
      id v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }

  v21 = CDGetLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v24;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Storage Daily returning: %@", buf, 0xCu);
  }

  return v24;
}

id getLocalCloudDocsURLs()
{
  int v0 = MKBDeviceUnlockedSinceBoot();
  char v1 = BYSetupAssistantNeedsToRun();
  id v2 = &__NSArray0__struct;
  if (v0 && (v1 & 1) == 0)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    if ((atomic_exchange((atomic_uchar *volatile)byte_10000C38B, 1u) & 1) == 0)
    {
      uint64_t v4 = objc_opt_new();
      id v5 = (void *)qword_10000C3B0;
      qword_10000C3B0 = v4;

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = __getLocalCloudDocsURLs_block_invoke;
      v20[3] = &unk_100008598;
      id v6 = v3;
      v21 = v6;
      uint64_t v7 = +[FPProviderDomain beginMonitoringProviderDomainChangesWithHandler:v20];
      v8 = (void *)qword_10000C3B8;
      qword_10000C3B8 = v7;

      dispatch_time_t v9 = dispatch_time(0, 5000000000);
      dispatch_semaphore_wait(v6, v9);
      if (qword_10000C3B8)
      {
        +[FPProviderDomain endMonitoringProviderDomainChanges:](FPProviderDomain, "endMonitoringProviderDomainChanges:");
        unsigned int v10 = (void *)qword_10000C3B8;
        qword_10000C3B8 = 0;
      }
    }
    uint64_t v14 = 0;
    id v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy_;
    v18 = __Block_byref_object_dispose_;
    id v19 = (id)objc_opt_new();
    id v11 = [(id)qword_10000C3B0 copy];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __getLocalCloudDocsURLs_block_invoke_441;
    v13[3] = &unk_1000085C0;
    v13[4] = &v14;
    [v11 enumerateObjectsUsingBlock:v13];

    id v2 = (id)v15[5];
    _Block_object_dispose(&v14, 8);
  }

  return v2;
}

void sub_100003D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __register_activity_block_invoke(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  v55 = (void *)os_transaction_create();
  xpc_activity_t activity = v2;
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  xpc_object_t v56 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v56, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  uint64_t v4 = CDGetLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = state;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CacheDeleteDaily recieved XPC_ACTIVITY_STATE: %ld", buf, 0xCu);
  }

  if (state == 2)
  {
    id v6 = CDGetLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Processing CacheDeleteDaily XPC_ACTIVITY_STATE_RUN", buf, 2u);
    }

    atomic_store(0, (unsigned __int8 *)&_MergedGlobals);
    atomic_store(xpc_activity_should_defer(v2), (unsigned __int8 *)&unk_10000C38A);
    uint64_t v7 = CDGetLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v8 = atomic_load((unsigned __int8 *)&unk_10000C38A);
      if (v8) {
        dispatch_time_t v9 = "YES";
      }
      else {
        dispatch_time_t v9 = "NO";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "XPC_ACTIVITY_STATE_RUN, should_defer: %s", buf, 0xCu);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __register_activity_block_invoke_31;
    block[3] = &unk_1000084C0;
    v63 = v2;
    if (qword_10000C3A0 != -1) {
      dispatch_once(&qword_10000C3A0, block);
    }
    if ((atomic_exchange((atomic_uchar *volatile)&unk_10000C389, 1u) & 1) == 0)
    {
      unsigned int v10 = CDGetLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = 245;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "********** %d resuming timer", buf, 8u);
      }

      dispatch_resume((dispatch_object_t)qword_10000C390);
    }
    id v11 = (id)qword_10000C398;
    BOOL v12 = +[CacheDeleteVolume volumeWithPath:@"/private/var/"];
    id v13 = [v12 freespace];
    id v14 = v12;
    id v15 = [v14 size];
    uint64_t v16 = [v14 thresholds];

    v17 = [v16 objectForKeyedSubscript:@"DESIRED_DISK_THRESHOLD"];
    v18 = evaluateNumberProperty();

    if (v18)
    {
      unint64_t v19 = 3 * (void)[v18 unsignedLongLongValue];
    }
    else
    {
      unint64_t v26 = (unint64_t)((double)(unint64_t)v15 * 0.01);
      if (v26 >= 0x500000000) {
        unint64_t v26 = 0x500000000;
      }
      if (v26 <= 0xC0000000) {
        unint64_t v19 = 3221225472;
      }
      else {
        unint64_t v19 = v26;
      }
    }

    long long v27 = CDGetLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "com.apple.storage.daily";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2048;
      *(void *)&unsigned char buf[24] = v19;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s performDailyTasks calculation: %llu (freespace) vs %llu (prune_threshold)", buf, 0x20u);
    }

    BOOL v28 = (unint64_t)v13 < v19;
    long long v29 = CDGetLogHandle();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    if (v28)
    {
      if (v30)
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "com.apple.storage.daily";
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s performDailyTasks performing maintenance", buf, 0xCu);
      }

      [v11 pruneSystemTmp];
      [v11 pruneUserTmp];
      [v11 pruneContainerTmps];
    }
    else
    {
      if (v30)
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = "com.apple.storage.daily";
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s performDailyTasks skipping maintenance", buf, 0xCu);
      }
    }
    v31 = objc_opt_new();
    uint64_t v32 = mach_absolute_time();
    v33 = CDGetLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Calling populateUsage", buf, 2u);
    }

    id v54 = v31;
    if (updateUsage(&off_100009960, &off_100009978, @"media", v54)
      && updateUsage(&off_100009990, &off_1000099A8, @"photos", v54))
    {
      v34 = getLocalCloudDocsURLs();
      v35 = objc_opt_new();
      [v35 addObjectsFromArray:&off_1000099C0];
      [v35 addObjectsFromArray:v34];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      *(void *)&unsigned char buf[24] = __Block_byref_object_copy_;
      *(void *)&buf[32] = __Block_byref_object_dispose_;
      id v67 = (id)objc_opt_new();
      [*(id *)(*(void *)&buf[8] + 40) addObjectsFromArray:&off_1000099D8];
      v64[0] = _NSConcreteStackBlock;
      v64[1] = (id)3221225472;
      v64[2] = __populateUsage_block_invoke;
      v64[3] = &unk_1000084E8;
      v64[4] = buf;
      [v34 enumerateObjectsUsingBlock:v64];
      if (updateUsage(v35, *(void **)(*(void *)&buf[8] + 40), @"apps", v54)
        && updateUsage(&off_1000099F0, 0, @"books", v54)
        && updateUsage(&off_100009A08, &off_100009A20, @"userdata", v54)
        && updateUsage(&off_100009A38, &off_100009A50, @"logs", v54))
      {
        BOOL updated = updateUsage(&off_100009A68, &off_100009A80, @"system", v54);
        _Block_object_dispose(buf, 8);

        if (updated)
        {
          v37 = CDGetLogHandle();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v38 = mach_absolute_time();
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&buf[4] = 259;
            *(_WORD *)&buf[8] = 2048;
            *(double *)&buf[10] = gTimebaseConversion * ((double)v38 - (double)v32) / 1000000000.0;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%d populateUsage COMPLETE, ET: %f seconds", buf, 0x12u);
          }

          v39 = CDGetLogHandle();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = "com.apple.storage.daily";
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%s writing stats:", buf, 0xCu);
          }

          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          id v40 = v54;
          id v41 = [v40 countByEnumeratingWithState:&v58 objects:v65 count:16];
          if (v41)
          {
            uint64_t v42 = *(void *)v59;
            do
            {
              for (i = 0; i != v41; i = (char *)i + 1)
              {
                if (*(void *)v59 != v42) {
                  objc_enumerationMutation(v40);
                }
                uint64_t v44 = *(void *)(*((void *)&v58 + 1) + 8 * i);
                v45 = CDGetLogHandle();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                {
                  v46 = [v40 objectForKeyedSubscript:v44];
                  *(_DWORD *)buf = 138412546;
                  *(void *)&buf[4] = v44;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v46;
                  _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "\t%@ : %@", buf, 0x16u);
                }
              }
              id v41 = [v40 countByEnumeratingWithState:&v58 objects:v65 count:16];
            }
            while (v41);
          }

          id v47 = v40;
          v48 = storageDailyStatsFilename();
          if (v48)
          {
            v64[0] = 0;
            v49 = +[NSPropertyListSerialization dataWithPropertyList:v47 format:200 options:0 error:v64];
            id v50 = v64[0];
            if (v49)
            {
              [v49 writeToFile:v48 atomically:0];
            }
            else
            {
              v53 = CDGetLogHandle();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)&buf[4] = v50;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v47;
                _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Unable to flatten dict, err: %@ for %@", buf, 0x16u);
              }
            }
          }

LABEL_74:
          atomic_store(1u, (unsigned __int8 *)&_MergedGlobals);

          goto LABEL_75;
        }
      }
      else
      {
        _Block_object_dispose(buf, 8);
      }
    }
    else
    {
    }
    v51 = CDGetLogHandle();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v52 = mach_absolute_time();
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = 266;
      *(_WORD *)&buf[8] = 2048;
      *(double *)&buf[10] = gTimebaseConversion * ((double)v52 - (double)v32) / 1000000000.0;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%d populateUsage DEFERRED, ET: %f seconds", buf, 0x12u);
    }

    goto LABEL_74;
  }
  if (state)
  {
    v20 = CDGetLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "CacheDeleteDaily uncaught XPC state", buf, 2u);
    }

    v21 = CDGetLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [&off_100009A98 objectAtIndexedSubscript:state];
      v23 = (void *)v22;
      unsigned __int8 v24 = atomic_load((unsigned __int8 *)&unk_10000C38A);
      v25 = "YES";
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&buf[4] = 272;
      *(_WORD *)&buf[8] = 2080;
      if ((v24 & 1) == 0) {
        v25 = "NO";
      }
      *(void *)&buf[10] = "com.apple.storage.daily";
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = state;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v22;
      *(_WORD *)&buf[38] = 2080;
      id v67 = (id)v25;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%d %s handler, state: %ld (%@), should_defer: %s", buf, 0x30u);
    }
  }
  else
  {
    id v5 = CDGetLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Processing CacheDeleteDaily XPC_ACTIVITY_STATE_CHECK_IN", buf, 2u);
    }

    xpc_activity_set_criteria(v2, v56);
  }
LABEL_75:
}

void sub_100004A3C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void __register_activity_block_invoke_31(uint64_t a1)
{
  id v2 = [[CacheDeletePruner alloc] initWithFileAge:259200.0 dirAge:86400.0];
  dispatch_semaphore_t v3 = (void *)qword_10000C398;
  qword_10000C398 = (uint64_t)v2;

  uint64_t v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.storage.daily.should_defer", v4);
  id v6 = (void *)qword_10000C3A8;
  qword_10000C3A8 = (uint64_t)v5;

  dispatch_source_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_10000C3A8);
  unsigned __int8 v8 = (void *)qword_10000C390;
  qword_10000C390 = (uint64_t)v7;

  dispatch_source_set_timer((dispatch_source_t)qword_10000C390, 0, 0x12A05F200uLL, 0x3B9ACA00uLL);
  dispatch_time_t v9 = qword_10000C390;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __register_activity_block_invoke_2;
  handler[3] = &unk_1000084C0;
  id v11 = *(id *)(a1 + 32);
  dispatch_source_set_event_handler(v9, handler);
}

void __register_activity_block_invoke_2(uint64_t a1)
{
  atomic_store(xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)), (unsigned __int8 *)&unk_10000C38A);
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&unk_10000C38A);
  if (v2)
  {
    dispatch_queue_t v5 = CDGetLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 67109120;
      int v8 = 229;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "********** %d suspending timer, should_defer = YES", (uint8_t *)&v7, 8u);
    }

    dispatch_suspend((dispatch_object_t)qword_10000C390);
    atomic_store(0, (unsigned __int8 *)&unk_10000C389);
    [(id)qword_10000C398 stop];
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3))
    {
      id v6 = CDGetLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v7) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "xpc_activity_set_state(XPC_ACTIVITY_STATE_DEFER) failed", (uint8_t *)&v7, 2u);
      }
    }
  }
  else
  {
    unsigned __int8 v3 = atomic_load((unsigned __int8 *)&_MergedGlobals);
    if (v3)
    {
      uint64_t v4 = CDGetLogHandle();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 67109120;
        int v8 = 237;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "********** %d suspending timer, activity_finished = YES", (uint8_t *)&v7, 8u);
      }

      dispatch_suspend((dispatch_object_t)qword_10000C390);
      atomic_store(0, (unsigned __int8 *)&unk_10000C389);
    }
  }
}

BOOL updateUsage(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v37 = a2;
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = v9;
  unsigned __int8 v11 = atomic_load((unsigned __int8 *)&unk_10000C38A);
  if (v11)
  {
    BOOL v28 = 0;
  }
  else
  {
    v31 = v9;
    id v32 = v8;
    BOOL v12 = +[NSMutableDictionary dictionary];
    uint64_t v30 = diskUsage(v7, &__block_literal_global_400);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v33 = v7;
    id obj = v7;
    id v36 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v36)
    {
      uint64_t v35 = *(void *)v43;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v43 != v35) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v42 + 1) + 8 * v13);
        id v47 = v14;
        id v15 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v47, 1, v30);
        uint64_t v16 = diskUsage(v15, &__block_literal_global_403);

        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v17 = v37;
        id v18 = [v17 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v39;
          double v21 = (double)(unint64_t)v16;
          do
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v39 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v23 = *(void *)(*((void *)&v38 + 1) + 8 * i);
              if ([v14 hasSuffix:v23])
              {
                unsigned __int8 v24 = +[NSNumber numberWithDouble:v21];
                [v12 setObject:v24 forKeyedSubscript:v23];
              }
            }
            id v19 = [v17 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }
          while (v19);
        }

        unsigned __int8 v25 = atomic_load((unsigned __int8 *)&unk_10000C38A);
        if (v25) {
          break;
        }
        if ((id)++v13 == v36)
        {
          id v36 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
          if (v36) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    unint64_t v26 = +[NSNumber numberWithDouble:(double)(unint64_t)v30];
    [v12 setObject:v26 forKeyedSubscript:@"total"];

    unsigned int v10 = v31;
    id v8 = v32;
    [v31 setObject:v12 forKeyedSubscript:v32];
    unsigned __int8 v27 = atomic_load((unsigned __int8 *)&unk_10000C38A);
    BOOL v28 = (v27 & 1) == 0;

    id v7 = v33;
  }

  return v28;
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

void __populateUsage_block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 isAbsolutePath])
  {
    unsigned __int8 v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v4 = [v5 lastPathComponent];
    [v3 addObject:v4];
  }
}

uint64_t diskUsage(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = objc_opt_new();
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  uint64_t v7 = 0;
  id v8 = [v6 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v6);
      }
      if (v4)
      {
        id v13 = v4;
        uint64_t v11 = traverse_dir_with_state();
      }
      else
      {
        uint64_t v11 = traverse_dir_with_state();
      }
      v7 += v11;
      if (!*((unsigned char *)v19 + 24)) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  _Block_object_dispose(&v18, 8);
  return v7;
}

void sub_100005308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL __updateUsage_block_invoke(id a1, const char *a2, $73E2D91FB0D0F26A7F30E74A8C023B7C *a3)
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&unk_10000C38A);
  return (v3 & 1) == 0;
}

BOOL __updateUsage_block_invoke_2(id a1, const char *a2, $A82AD4AF21F61F38A3A46F4881C1F3DF *a3)
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&unk_10000C38A);
  return (v3 & 1) == 0;
}

uint64_t __diskUsage_block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

id storageDailyStatsFilename()
{
  int v0 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  if (![v0 count])
  {
    id v6 = CDGetLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Unable to get path to Caches Directory", (uint8_t *)&v12, 2u);
    }

    id v4 = 0;
    unsigned __int8 v3 = 0;
    uint64_t v1 = 0;
    goto LABEL_11;
  }
  uint64_t v1 = [v0 objectAtIndexedSubscript:0];
  unsigned __int8 v2 = [v1 stringByAppendingPathComponent:@"com.apple.storage.daily"];
  unsigned __int8 v3 = [v2 stringByAppendingPathComponent:@"com.apple.storage.daily.stats"];
  id v4 = v2;
  if (mkdir((const char *)[v4 fileSystemRepresentation], 0x1C0u) && *__error() != 17)
  {
    uint64_t v7 = CDGetLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = __error();
      uint64_t v11 = strerror(*v10);
      int v12 = 138412546;
      uint64_t v13 = 0;
      __int16 v14 = 2080;
      long long v15 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "unable to create directory at %@ : %s", (uint8_t *)&v12, 0x16u);
    }

LABEL_11:
    id v5 = 0;
    goto LABEL_12;
  }
  id v5 = v3;
  unsigned __int8 v3 = v5;
LABEL_12:
  id v8 = v5;

  return v8;
}

void __getLocalCloudDocsURLs_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = CDGetLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Unable to get domains for cloud doc usage statistics. Error: %@", buf, 0xCu);
    }

    atomic_store(0, byte_10000C38B);
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = objc_msgSend(a2, "allValues", 0);
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v12 isiCloudDriveProvider])
          {
            uint64_t v13 = (void *)qword_10000C3B0;
            __int16 v14 = [v12 storageURLs];
            [v13 addObjectsFromArray:v14];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __getLocalCloudDocsURLs_block_invoke_441(uint64_t a1, void *a2)
{
  unsigned __int8 v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [a2 path];
  [v2 addObject:v3];
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return _BYSetupAssistantNeedsToRun();
}

uint64_t CDGetLogHandle()
{
  return _CDGetLogHandle();
}

uint64_t CacheDeleteRegisterCallback()
{
  return _CacheDeleteRegisterCallback();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
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

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return _dispatch_block_create_with_qos_class(flags, qos_class, relative_priority, block);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
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

void dispatch_suspend(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t evaluateNumberProperty()
{
  return _evaluateNumberProperty();
}

uint64_t getRootVolume()
{
  return _getRootVolume();
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
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

uint64_t traverse_dir_with_state()
{
  return _traverse_dir_with_state();
}

uint64_t traverse_directory()
{
  return _traverse_directory();
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
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

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_freespace(void *a1, const char *a2, ...)
{
  return [a1 freespace];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isAbsolutePath(void *a1, const char *a2, ...)
{
  return [a1 isAbsolutePath];
}

id objc_msgSend_isiCloudDriveProvider(void *a1, const char *a2, ...)
{
  return [a1 isiCloudDriveProvider];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pruneContainerTmps(void *a1, const char *a2, ...)
{
  return [a1 pruneContainerTmps];
}

id objc_msgSend_pruneSystemTmp(void *a1, const char *a2, ...)
{
  return [a1 pruneSystemTmp];
}

id objc_msgSend_pruneUserTmp(void *a1, const char *a2, ...)
{
  return [a1 pruneUserTmp];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_storageURLs(void *a1, const char *a2, ...)
{
  return [a1 storageURLs];
}

id objc_msgSend_testObject(void *a1, const char *a2, ...)
{
  return [a1 testObject];
}

id objc_msgSend_thresholds(void *a1, const char *a2, ...)
{
  return [a1 thresholds];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}