BOOL enumerateHangIntervalsInTimeRange(void *a1, void *a2, float *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  float v14;
  NSObject *v15;
  void *v16;
  id v18;
  rusage v19;
  rusage v20;
  void v21[4];
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;

  v7 = a4;
  v8 = a2;
  v9 = a1;
  v10 = objc_opt_new();
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100001F84;
  v21[3] = &unk_100014498;
  v11 = v7;
  v22 = v11;
  [v10 setIntervalCompletionProcessingBlock:v21];
  v12 = objc_opt_new();
  [v12 addSubsystem:@"com.apple.hangtracer" category:@"always_on_hang"];
  [v10 setSubsystemCategoryFilter:v12];
  memset(&v19, 0, sizeof(v19));
  memset(&v20, 0, sizeof(v20));
  getrusage(0, &v20);
  v18 = 0;
  [v10 processLogArchiveWithPath:0 startDate:v9 endDate:v8 errorOut:&v18];

  v13 = v18;
  getrusage(0, &v19);
  if (a3)
  {
    v14 = (float)((float)((float)v19.ru_stime.tv_usec / 1000000.0) + (float)v19.ru_stime.tv_sec)
        - (float)((float)((float)v20.ru_stime.tv_usec / 1000000.0) + (float)v20.ru_stime.tv_sec)
        + (float)((float)((float)v19.ru_utime.tv_usec / 1000000.0) + (float)v19.ru_utime.tv_sec)
        - (float)((float)((float)v20.ru_utime.tv_usec / 1000000.0) + (float)v20.ru_utime.tv_sec);
    *a3 = v14;
  }
  if (v13)
  {
    v15 = shared_ht_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [v13 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v24 = "enumerateHangIntervalsInTimeRange";
      v25 = 2112;
      v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s completed with error: %@\n", buf, 0x16u);
    }
  }

  return v13 == 0;
}

uint64_t sub_100001F84(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id getHangIntervalsInTimeRange(void *a1, void *a2, float *a3)
{
  id v5 = a2;
  id v6 = a1;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000209C;
  v10[3] = &unk_1000144C0;
  id v7 = (id)objc_opt_new();
  id v11 = v7;
  LODWORD(a3) = enumerateHangIntervalsInTimeRange(v6, v5, a3, v10);

  if (a3) {
    id v8 = [v7 copy];
  }
  else {
    id v8 = &__NSArray0__struct;
  }

  return v8;
}

uint64_t sub_10000209C(uint64_t a1, uint64_t a2)
{
  return 1;
}

id getHangHistoryInfo(int a1)
{
  v2 = +[NSDate dateWithTimeIntervalSinceNow:-86400.0];
  +[NSDate date];
  v81 = float v107 = 0.0;
  v3 = getHangIntervalsInTimeRange(v2, v81, &v107);
  v4 = +[NSMutableString stringWithString:&stru_100014DA8];
  v82 = v2;
  id v5 = +[NSDateFormatter localizedStringFromDate:v2 dateStyle:1 timeStyle:2];
  id v6 = +[NSString stringWithFormat:@"Progress: Reading back hang interval signposts starting from %@\n", v5];

  [v4 appendString:v6];
  id v7 = [v3 count];
  id v8 = +[NSString stringWithFormat:@"%.02fms", (float)(v107 * 1000.0)];
  v9 = +[NSString stringWithFormat:@"Found %zu hang intervals in last 24 hours which took %@\n", v7, v8];

  [v4 appendString:v9];
  v10 = @"hangWallTime hangDurationMS process[pid] ";
  [v4 appendString:@"hangWallTime hangDurationMS process[pid] "];
  int v93 = a1;
  if (a1) {
    CFStringRef v11 = @"windowLookupTimeMS\n";
  }
  else {
    CFStringRef v11 = @"\n";
  }
  [v4 appendString:v11];
  v83 = objc_opt_new();
  id v90 = objc_alloc_init((Class)NSMutableDictionary);
  id v92 = objc_alloc_init((Class)NSMutableDictionary);
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id obj = v3;
  v91 = v4;
  id v87 = [obj countByEnumeratingWithState:&v103 objects:v110 count:16];
  if (v87)
  {
    uint64_t v86 = *(void *)v104;
    do
    {
      v12 = 0;
      v13 = v10;
      do
      {
        v88 = v13;
        if (*(void *)v104 != v86) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v103 + 1) + 8 * (void)v12);
        v15 = [v14 beginEvent];
        v16 = [v15 beginDate];
        v17 = +[NSDate dateWithTimeInterval:v16 sinceDate:-5.0];

        v18 = [v14 endEvent];
        v19 = [v18 endDate];
        v20 = +[NSDate dateWithTimeInterval:v19 sinceDate:5.0];

        float v102 = 0.0;
        if (v93)
        {
          id v21 = getHangIntervalsInTimeRange(v17, v20, &v102);
          *(float *)&double v22 = v102;
          v23 = +[NSNumber numberWithFloat:v22];
          [v83 addObject:v23];
        }
        v24 = [v14 beginWallTimeStringWithTimeZoneName:0];
        [v14 durationSeconds];
        v26 = +[NSString stringWithFormat:@"%.02f", (float)(v25 * 1000.0)];
        v27 = [v14 beginEvent];
        v28 = [v27 processName];
        v29 = [v14 beginEvent];
        id v30 = [v29 processID];
        CFStringRef v31 = &stru_100014DA8;
        if (v93)
        {
          v85 = +[NSString stringWithFormat:@"%.02f", (float)(v102 * 1000.0)];
          CFStringRef v31 = v85;
        }
        v10 = +[NSString stringWithFormat:@"%@ %@ %@[%d] %@\n", v24, v26, v28, v30, v31];

        if (v93) {
        v4 = v91;
        }
        [v91 appendString:v10];
        v32 = [v14 beginEvent];
        v33 = [v32 processName];

        [v14 durationSeconds];
        float v35 = v34 * 1000.0;
        v36 = [v90 objectForKey:v33];

        if (v36)
        {
          v37 = [v90 objectForKey:v33];
          v38 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v37 intValue] + 1);
          [v90 setObject:v38 forKeyedSubscript:v33];

          v39 = [v92 objectForKey:v33];
          [v39 floatValue];
          *(float *)&double v41 = v35 + v40;
          v42 = +[NSNumber numberWithFloat:v41];
          [v92 setObject:v42 forKeyedSubscript:v33];
        }
        else
        {
          [v90 setObject:&off_100016508 forKeyedSubscript:v33];
          *(float *)&double v43 = v35;
          v37 = +[NSNumber numberWithFloat:v43];
          [v92 setObject:v37 forKeyedSubscript:v33];
        }

        v12 = (char *)v12 + 1;
        v13 = v10;
      }
      while (v87 != v12);
      id v87 = [obj countByEnumeratingWithState:&v103 objects:v110 count:16];
    }
    while (v87);
  }

  if (v93)
  {
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    id v44 = v83;
    id v45 = [v44 countByEnumeratingWithState:&v98 objects:v109 count:16];
    if (v45)
    {
      id v46 = v45;
      uint64_t v47 = *(void *)v99;
      float v48 = 0.0;
      float v49 = 3.4028e38;
      float v50 = 0.0;
      float v51 = 0.0;
      do
      {
        for (i = 0; i != v46; i = (char *)i + 1)
        {
          if (*(void *)v99 != v47) {
            objc_enumerationMutation(v44);
          }
          [*(id *)(*((void *)&v98 + 1) + 8 * i) floatValue];
          if (v53 < v49) {
            float v49 = v53;
          }
          if (v53 > v51) {
            float v51 = v53;
          }
          float v50 = v50 + 1.0;
          float v48 = (float)((float)(v48 * (float)(v50 + -1.0)) / v50) + (float)(v53 / v50);
        }
        id v46 = [v44 countByEnumeratingWithState:&v98 objects:v109 count:16];
      }
      while (v46);
      double v54 = (float)(v49 * 1000.0);
      double v55 = (float)(v51 * 1000.0);
      double v56 = (float)(v48 * 1000.0);
    }
    else
    {
      double v56 = 0.0;
      double v54 = INFINITY;
      double v55 = 0.0;
    }

    v57 = +[NSString stringWithFormat:@"%.02fms", *(void *)&v54];
    v58 = +[NSString stringWithFormat:@"%.02fms", *(void *)&v55];
    v59 = +[NSString stringWithFormat:@"%.02fms", *(void *)&v56];
    uint64_t v60 = +[NSString stringWithFormat:@"Retrieval time per window min %@ max %@ mean %@\n", v57, v58, v59];

    [v4 appendString:v60];
    v10 = (__CFString *)v60;
  }
  v61 = [v92 keysSortedByValueUsingSelector:"compare:"];
  v62 = [v61 reverseObjectEnumerator];
  v63 = [v62 allObjects];

  v64 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"\n%-15s %5s %15s %10s\n", [@"Process" UTF8String], objc_msgSend(@"Count", "UTF8String"), objc_msgSend(@"Duration(ms)", "UTF8String"), objc_msgSend(@"Mean(ms)", "UTF8String"));

  [v4 appendString:v64];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v65 = v63;
  id v66 = [v65 countByEnumeratingWithState:&v94 objects:v108 count:16];
  if (v66)
  {
    id v67 = v66;
    LODWORD(v68) = 0;
    uint64_t v69 = *(void *)v95;
    float v70 = 0.0;
    do
    {
      v71 = 0;
      v72 = v64;
      do
      {
        if (*(void *)v95 != v69) {
          objc_enumerationMutation(v65);
        }
        v73 = *(void **)(*((void *)&v94 + 1) + 8 * (void)v71);
        v74 = [v90 objectForKey:v73];
        id v75 = [v74 intValue];

        v76 = [v92 objectForKey:v73];
        [v76 floatValue];
        float v78 = v77;

        uint64_t v68 = (v75 + v68);
        float v70 = v70 + v78;
        v64 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%-15s %5d %15.0f %10.0f\n", [v73 UTF8String], v75, v78, (float)(v78 / (float)(int)v75));

        [v91 appendString:v64];
        v71 = (char *)v71 + 1;
        v72 = v64;
      }
      while (v67 != v71);
      id v67 = [v65 countByEnumeratingWithState:&v94 objects:v108 count:16];
    }
    while (v67);
  }
  else
  {
    uint64_t v68 = 0;
    float v70 = 0.0;
  }

  v79 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%-15s %5d %15.0f %10.0f\n", [@"Total" UTF8String], v68, v70, (float)(v70 / (float)(int)v68));

  [v91 appendString:v79];
  return v91;
}

uint64_t HTTelemetryHasRunThisBoot()
{
  v0 = sem_open("hangtelemetryd.onceatboot", 0);
  if (v0 == (sem_t *)-1)
  {
    if (*__error() == 2) {
      return 0;
    }
    v2 = shared_ht_log_handle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = *__error();
      v4[0] = 67109120;
      v4[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "sem_open() failed: %{errno}d", (uint8_t *)v4, 8u);
    }
  }
  else
  {
    sem_close(v0);
  }
  return 1;
}

void HTTelemetryCheckForUpdates(void *a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002C8C;
  block[3] = &unk_100014568;
  id v4 = a1;
  uint64_t v1 = qword_10001A1C8;
  id v2 = v4;
  if (v1 != -1) {
    dispatch_once(&qword_10001A1C8, block);
  }
}

void sub_100002C8C(uint64_t a1)
{
  int HasRunThisBoot = HTTelemetryHasRunThisBoot();
  int v3 = shared_ht_log_handle();
  empty = v3;
  if (HasRunThisBoot)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10000BAF0(empty);
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, empty, OS_LOG_TYPE_INFO, "Updating telemetry", (uint8_t *)&v10, 2u);
    }

    id v5 = dispatch_get_global_queue(21, 0);
    mach_service = xpc_connection_create_mach_service("com.apple.hangtelemetryd", v5, 0);

    xpc_connection_set_event_handler(mach_service, &stru_100014520);
    xpc_connection_activate(mach_service);
    empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_uint64(empty, "command", 1uLL);
    xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(mach_service, empty);
    if (xpc_get_type(v7) == (xpc_type_t)&_xpc_type_error)
    {
      id v8 = shared_ht_log_handle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        string = xpc_dictionary_get_string(v7, _xpc_error_key_description);
        int v10 = 136315138;
        CFStringRef v11 = string;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received error updating telemetry: %s", (uint8_t *)&v10, 0xCu);
      }
    }
    dispatch_sync(*(dispatch_queue_t *)(a1 + 32), &stru_100014540);
  }
}

void sub_100002E60(id a1)
{
  id v1 = +[HTPrefs sharedPrefs];
  [v1 refreshHTPrefs];
}

id sub_100002EA8(void *a1, void *a2, int a3)
{
  id v5 = a1;
  id v36 = a2;
  float v34 = objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v5;
  id v31 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v31)
  {
    uint64_t v30 = a3 ^ 1u;
    uint64_t v29 = *(void *)v50;
    NSURLResourceKey v6 = NSURLIsDirectoryKey;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v50 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v7;
        uint64_t v8 = +[NSURL URLWithString:*(void *)(*((void *)&v49 + 1) + 8 * v7)];
        v9 = +[NSFileManager defaultManager];
        v55[0] = v6;
        v55[1] = NSURLNameKey;
        int v10 = +[NSArray arrayWithObjects:v55 count:2];
        v32 = (void *)v8;
        CFStringRef v11 = [v9 enumeratorAtURL:v8 includingPropertiesForKeys:v10 options:v30 errorHandler:&stru_1000145A8];

        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v38 = v11;
        id v12 = [v38 countByEnumeratingWithState:&v45 objects:v54 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v46;
          uint64_t v35 = *(void *)v46;
          do
          {
            v15 = 0;
            id v37 = v13;
            do
            {
              if (*(void *)v46 != v14) {
                objc_enumerationMutation(v38);
              }
              v16 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v15);
              id v44 = 0;
              [v16 getResourceValue:&v44 forKey:v6 error:0];
              id v18 = v44;
              if (([v18 BOOLValue] & 1) == 0)
              {
                id v43 = 0;
                [v16 getResourceValue:&v43 forKey:NSURLNameKey error:0];
                id v19 = v43;
                v20 = [v19 lastPathComponent];
                long long v39 = 0u;
                long long v40 = 0u;
                long long v41 = 0u;
                long long v42 = 0u;
                id v21 = v36;
                id v22 = [v21 countByEnumeratingWithState:&v39 objects:v53 count:16];
                if (v22)
                {
                  id v23 = v22;
                  uint64_t v24 = *(void *)v40;
                  while (2)
                  {
                    for (i = 0; i != v23; i = (char *)i + 1)
                    {
                      if (*(void *)v40 != v24) {
                        objc_enumerationMutation(v21);
                      }
                      if ([v20 hasPrefix:*(void *)(*((void *)&v39 + 1) + 8 * i)])
                      {

                        id v21 = [v16 path];
                        [v34 addObject:v21];
                        goto LABEL_22;
                      }
                    }
                    id v23 = [v21 countByEnumeratingWithState:&v39 objects:v53 count:16];
                    if (v23) {
                      continue;
                    }
                    break;
                  }
LABEL_22:
                  NSURLResourceKey v6 = NSURLIsDirectoryKey;
                  uint64_t v14 = v35;
                }

                id v13 = v37;
              }

              v15 = (char *)v15 + 1;
            }
            while (v15 != v13);
            id v13 = [v38 countByEnumeratingWithState:&v45 objects:v54 count:16];
          }
          while (v13);
        }

        uint64_t v7 = v33 + 1;
      }
      while ((id)(v33 + 1) != v31);
      id v31 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
    }
    while (v31);
  }

  id v26 = [v34 copy];
  return v26;
}

id getListOfHangArchiveFiles(void *a1)
{
  uint64_t v7 = a1;
  id v1 = a1;
  id v2 = +[NSArray arrayWithObjects:&v7 count:1];
  CFStringRef v6 = @"ArchivedHangs";
  int v3 = +[NSArray arrayWithObjects:&v6 count:1];

  id v4 = sub_100002EA8(v2, v3, 0);

  return v4;
}

BOOL sub_100003368(id a1, NSURL *a2, NSError *a3)
{
  id v4 = a2;
  id v5 = a3;
  CFStringRef v6 = shared_ht_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    v9 = v4;
    __int16 v10 = 2112;
    CFStringRef v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Error handling url %@: %@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

double timebaseConversionFactor()
{
  if (qword_10001A1D8 != -1) {
    dispatch_once(&qword_10001A1D8, &stru_1000145C8);
  }
  return *(double *)&qword_10001A1D0;
}

void sub_100003480(id a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  *(double *)&qword_10001A1D0 = (float)((float)((float)info.numer * 0.000001) / (float)info.denom);
}

double MATU_TO_MS(unint64_t a1)
{
  if (qword_10001A1D8 != -1) {
    dispatch_once(&qword_10001A1D8, &stru_1000145C8);
  }
  return *(double *)&qword_10001A1D0 * (double)a1;
}

uint64_t checkForAssertionOverlap(unint64_t a1, unint64_t a2, uint64_t a3, int a4)
{
  uint64_t v7 = 0;
  unint64_t v33 = 0;
  int v8 = 0;
  unint64_t v30 = a2 - a1;
  uint64_t v32 = a3 + 32;
  do
  {
    if (*(void *)(a3 + v7))
    {
      ++v8;
      uint64_t v9 = a3 + v7;
      unint64_t v10 = *(void *)(a3 + v7 + 24);
      if (v10 >= *(void *)(a3 + v7 + 16)) {
        unint64_t v10 = *(void *)(a3 + v7 + 16);
      }
      unint64_t v11 = *(void *)(a3 + v7 + 8) <= a1 ? a1 : *(void *)(a3 + v7 + 8);
      unint64_t v12 = v10 >= a2 ? a2 : v10;
      if (v12 > v11)
      {
        id v13 = shared_ht_log_handle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          double v14 = *(double *)(a3 + v7);
          double v15 = *(double *)(v9 + 8);
          uint64_t v16 = *(void *)(v9 + 24);
          *(_DWORD *)buf = 134219266;
          double v37 = v14;
          __int16 v38 = 2080;
          *(void *)&double v39 = v32 + v7;
          __int16 v40 = 2048;
          double v41 = v15;
          __int16 v42 = 2048;
          uint64_t v43 = v16;
          __int16 v44 = 2048;
          unint64_t v45 = a1;
          __int16 v46 = 2048;
          unint64_t v47 = a2;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "HTAssertion: checkOverlap: hang overlaps with assertion, assertionid=%llu assertionname=(%s) start=%llu end=%llu, hangstart=%llu, hangend=%llu)", buf, 0x3Eu);
        }

        if (*(unsigned char *)(a3 + v7 + 96))
        {
          if (*(void *)(v9 + 24) < a2)
          {
            v17 = shared_ht_log_handle();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              id v18 = v17;
              id v19 = "HTAssertion: checkOverlap: not ignoring hang during screen turning on";
LABEL_21:
              uint32_t v20 = 2;
LABEL_22:
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, v19, buf, v20);
              goto LABEL_23;
            }
            goto LABEL_23;
          }
          if (*(void *)(v9 + 8) > a1)
          {
            v17 = shared_ht_log_handle();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              id v18 = v17;
              id v19 = "HTAssertion: checkOverlap: not ignoring hang during screen turning off";
              goto LABEL_21;
            }
LABEL_23:

            goto LABEL_30;
          }
          double v21 = MATU_TO_MS(v30);
          id v22 = shared_ht_log_handle();
          v17 = v22;
          if (v21 >= 1000.0)
          {
            if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
              goto LABEL_23;
            }
            double v23 = MATU_TO_MS(v30);
            *(_DWORD *)buf = 134217984;
            double v37 = v23;
            id v18 = v17;
            id v19 = "HTAssertion: checkOverlap: not ignoring hang during screen off with duration %.0fms";
            uint32_t v20 = 12;
            goto LABEL_22;
          }
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
            sub_10000BBBC(v34, v30, &v35, v17);
          }
        }
        v33 += v12 - v11;
        if (a4) {
          AnalyticsSendEventLazy();
        }
      }
    }
LABEL_30:
    v7 += 104;
  }
  while (v7 != 1040);
  if (!v8)
  {
    v28 = shared_ht_log_handle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      sub_10000BB34(v28);
    }
    goto LABEL_48;
  }
  double v24 = MATU_TO_MS(v33);
  double v25 = MATU_TO_MS(v30) - v24;
  if (v25 >= 250.0)
  {
    uint64_t v29 = shared_ht_log_handle();
    v28 = v29;
    if (v33)
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        double v37 = v25;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "HTAssertion: checkOverlap: hang partially overlaps assertions, since hangDurationWithoutOverlap=%fms does not qualify as assertion overlap", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      sub_10000BB78(v28);
    }
LABEL_48:

    return 0;
  }
  id v26 = shared_ht_log_handle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    double v37 = v24;
    __int16 v38 = 2048;
    double v39 = (double)v33 * 100.0 / (double)v30;
    __int16 v40 = 2048;
    double v41 = v25;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "HTAssertion: checkOverlap: hang overlaps assertion for %f ms (%f %%), hangDurationWithoutOverlap=%fms -> qualifies as assertion overlap", buf, 0x20u);
  }

  if (a4)
  {
    HTAggdPushValueForDistributionKey();
    HTAggdPushValueForDistributionKey();
    AnalyticsSendEventLazy();
  }
  return 1;
}

id sub_100003A58(void *a1)
{
  v6[0] = @"assertionOverlapMs";
  id v2 = +[NSNumber numberWithUnsignedLongLong:a1[4] - a1[5]];
  v6[1] = @"assertionOverlapName";
  v7[0] = v2;
  int v3 = +[NSString stringWithUTF8String:a1[6]];
  v7[1] = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

id sub_100003B40(uint64_t a1)
{
  v6[0] = @"hangDurationOverlapMs";
  id v2 = +[NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v6[1] = @"hangDurationOverlapPercent";
  v7[0] = v2;
  int v3 = +[NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v7[1] = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

void sub_100003C74(id a1)
{
  v3[0] = @"HTProfile";
  v3[1] = @"HTEPL";
  v3[2] = @"HTThirdPartyDevSupport";
  v3[3] = @"PLTasking";
  v3[4] = &stru_100014DA8;
  v3[5] = @"PDSEHangTracer";
  v3[6] = @"PDSEHTBadDay";
  v3[7] = @"PDSEHTThirdParty";
  v3[8] = @"PDSEWorkflowResponsiveness";
  v3[9] = @"PDSEHTRateOnly";
  v3[10] = @"PDSESentry";
  v3[11] = @"PDSEAppLaunch";
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:12];
  id v2 = (void *)qword_10001A1E8;
  qword_10001A1E8 = v1;
}

void sub_100005B14(id a1)
{
  qword_10001A1F0 = objc_alloc_init(HTPrefs);
  _objc_release_x1();
}

void sub_100007D2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
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

void sub_100007D90(uint64_t a1, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == a2)
  {
    int v3 = shared_ht_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v4 = "HTPrefs: Tasking Changed";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v4, buf, 2u);
    }
  }
  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == a2)
  {
    int v3 = shared_ht_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v4 = "HTPrefs: Telemetry Changed";
      goto LABEL_16;
    }
  }
  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == a2)
  {
    int v3 = shared_ht_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v4 = "HTPrefs: Profile List Changed";
      goto LABEL_16;
    }
  }
  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == a2)
  {
    int v3 = shared_ht_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v4 = "HTPrefs: EPL State Changed";
      goto LABEL_16;
    }
  }
  else
  {
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) != a2) {
      goto LABEL_18;
    }
    int v3 = shared_ht_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v4 = "HTPrefs: HT Self-Enablement State Changed Triggered Refresh";
      goto LABEL_16;
    }
  }

LABEL_18:
  id v5 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  unsigned int v7 = [WeakRetained hangtracerDaemonEnabled];

  [*(id *)(a1 + 32) refreshHTPrefs];
  id v8 = objc_loadWeakRetained((id *)(a1 + 80));
  LODWORD(WeakRetained) = [v8 hangtracerDaemonEnabled];

  if (v7 != WeakRetained)
  {
    uint64_t v9 = shared_ht_log_handle();
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
    double v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v13, "hangtracerDaemonEnabled", @"Enabled"));
    id v19 = v14;
    double v15 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];

    uint64_t v16 = +[NSNotificationCenter defaultCenter];
    id v17 = objc_loadWeakRetained(v5);
    [v16 postNotificationName:@"com.apple.hangtracer.daemonstate" object:v17 userInfo:v15];
  }
}

void sub_1000080E4(uint64_t a1, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == a2)
  {
    id v2 = shared_ht_log_handle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "HTPrefs: Test Reset Log Limits", v3, 2u);
    }
  }
}

void sub_100008B64(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

id alwaysOnSignpost()
{
  if (qword_10001A208 != -1) {
    dispatch_once(&qword_10001A208, &stru_1000146B8);
  }
  v0 = (void *)qword_10001A200;
  return v0;
}

void sub_100008BF4(id a1)
{
  qword_10001A200 = (uint64_t)os_log_create("com.apple.hangtracer", "always_on_hang");
  _objc_release_x1();
}

void signpostHangInterval(void *a1, void *a2, os_signpost_id_t a3, uint64_t a4, void *a5)
{
  uint64_t v9 = a1;
  CFStringRef v10 = a2;
  id v11 = a5;
  *(void *)buf = 0;
  mach_get_times();
  if (os_signpost_enabled(v11))
  {
    CFStringRef v12 = v11;
    id v13 = v12;
    if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      CFStringRef v14 = @"Unknown";
      *(_DWORD *)buf = 134349826;
      *(void *)&uint8_t buf[4] = a3;
      if (v10) {
        CFStringRef v15 = v10;
      }
      else {
        CFStringRef v15 = @"Unknown";
      }
      __int16 v17 = 2050;
      uint64_t v18 = a4;
      __int16 v19 = 2114;
      if (v9) {
        CFStringRef v14 = v9;
      }
      CFStringRef v20 = v15;
      __int16 v21 = 2114;
      CFStringRef v22 = v14;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, a3, "HangInterval", "%{public, signpost.description:begin_time}llu, %{public, signpost.description:end_time}llu, BundleIdOverride=%{public, signpost.description:attribute}@ type=%{public, signpost.telemetry:string2}@ enableTelemetry=YES ", buf, 0x2Au);
    }
  }
}

uint64_t isAppBeingDebugged(int a1)
{
  id v2 = +[NSProcessInfo processInfo];
  int v3 = [v2 environment];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"HT_DISABLE_DEBUGGER_CHECK"];
  unsigned int v5 = [v4 BOOLValue];

  if (v5)
  {
    CFStringRef v6 = shared_ht_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Check for app is being debugged is disabled", buf, 2u);
    }

    return 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  *(_OWORD *)buf = 0u;
  long long v16 = 0u;
  if (!proc_pidinfo(a1, 13, 1uLL, buf, 64))
  {
    id v8 = shared_ht_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Failed to check if app is being debugged", (uint8_t *)&v11, 2u);
    }
    uint64_t v7 = 0;
    goto LABEL_18;
  }
  if ((v17 & 2) != 0)
  {
    id v8 = +[NSString stringWithUTF8String:&v16];
    if (([v8 isEqualToString:@"xctest"] & 1) != 0
      || ([v8 isEqualToString:@"hangman"] & 1) != 0
      || [v8 hasSuffix:@"-Runner"])
    {
      uint64_t v9 = shared_ht_log_handle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543618;
        CFStringRef v12 = v8;
        __int16 v13 = 1024;
        int v14 = a1;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ [%d] is a test process, isAppBeingDebugged returning NO", (uint8_t *)&v11, 0x12u);
      }
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v9 = shared_ht_log_handle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "App is being debugged, do not track this hang", (uint8_t *)&v11, 2u);
      }
      uint64_t v7 = 1;
    }

LABEL_18:
    return v7;
  }
  return 0;
}

__CFString *getStringForSubtype(unint64_t a1)
{
  if (a1 <= 0xA) {
    a1 = *off_1000146D8[a1];
  }
  return (__CFString *)(id)a1;
}

uint64_t HTAggdPushValueForDistributionKey()
{
  return _ADClientPushValueForDistributionKey();
}

id HTGetHomeDirectoryURL()
{
  v0 = NSHomeDirectoryForUser(@"mobile");
  if (v0)
  {
    uint64_t v1 = +[NSURL fileURLWithPath:v0 isDirectory:1];
  }
  else
  {
    uint64_t v1 = 0;
  }

  return v1;
}

id HTCAQueue()
{
  if (qword_10001A218 != -1) {
    dispatch_once(&qword_10001A218, &stru_100014AD0);
  }
  v0 = (void *)qword_10001A210;
  return v0;
}

void sub_100009B44(id a1)
{
  uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v1 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.hangtracer.coreanalytics", v1);
  int v3 = (void *)qword_10001A210;
  qword_10001A210 = (uint64_t)v2;
}

id sub_100009BC8()
{
  if (qword_10001A230 != -1) {
    dispatch_once(&qword_10001A230, &stru_100014B90);
  }
  v0 = (void *)qword_10001A228;
  return v0;
}

void *hangEventCaptureUserActionCreateData(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = *(void (**)(void))(a1 + 376);
  if (!v1) {
    return 0;
  }
  dispatch_queue_t v2 = v1();
  int v3 = shared_ht_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    id v6 = [v2 length];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User action data captured with size: %lu", (uint8_t *)&v5, 0xCu);
  }

  return v2;
}

void sub_100009E8C()
{
  v0 = sub_100009ED4();
  dispatch_async(v0, &stru_100014BD0);
}

id sub_100009ED4()
{
  if (qword_10001A248 != -1) {
    dispatch_once(&qword_10001A248, &stru_100014C10);
  }
  v0 = (void *)qword_10001A240;
  return v0;
}

void sub_100009F28(uint64_t a1)
{
  if (qword_10001A220)
  {
    *(_OWORD *)keys = *(_OWORD *)off_100014AF0;
    id v6 = "startTime";
    values[0] = xpc_int64_create(6);
    values[1] = xpc_uint64_create(*(void *)(*(void *)(a1 + 32) + 8));
    values[2] = xpc_uint64_create(*(void *)(*(void *)(a1 + 32) + 16));
    xpc_object_t v2 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
    xpc_connection_send_message((xpc_connection_t)qword_10001A220, v2);

    for (uint64_t i = 2; i != -1; --i)
  }
}

void sub_10000A0AC(uint64_t a1)
{
  if (qword_10001A220)
  {
    *(_OWORD *)keys = *(_OWORD *)off_100014B30;
    long long v6 = *(_OWORD *)off_100014B40;
    v4[0] = xpc_int64_create(7);
    v4[1] = xpc_uint64_create(*(void *)(*(void *)(a1 + 32) + 8));
    _DWORD v4[2] = xpc_uint64_create(*(void *)(*(void *)(a1 + 32) + 16));
    v4[3] = xpc_uint64_create(*(void *)(a1 + 40));
    xpc_object_t v2 = xpc_dictionary_create((const char *const *)keys, v4, 4uLL);
    xpc_connection_send_message((xpc_connection_t)qword_10001A220, v2);

    for (uint64_t i = 3; i != -1; --i)
  }
}

void sub_10000A234(uint64_t a1)
{
  if (qword_10001A220)
  {
    *(_OWORD *)keys = *(_OWORD *)off_100014B30;
    long long v6 = *(_OWORD *)off_100014B40;
    v4[0] = xpc_int64_create(8);
    v4[1] = xpc_uint64_create(*(void *)(*(void *)(a1 + 32) + 8));
    _DWORD v4[2] = xpc_uint64_create(*(void *)(*(void *)(a1 + 32) + 16));
    v4[3] = xpc_uint64_create(*(void *)(a1 + 40));
    xpc_object_t v2 = xpc_dictionary_create((const char *const *)keys, v4, 4uLL);
    xpc_connection_send_message((xpc_connection_t)qword_10001A220, v2);

    for (uint64_t i = 3; i != -1; --i)
  }
}

void HTCollectHangLogsBundle(void *a1, char a2)
{
  id v3 = a1;
  sub_100009E8C();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_10000A3E8;
  v7[3] = &unk_100014B70;
  id v8 = v3;
  char v9 = a2;
  id v4 = v3;
  int v5 = objc_retainBlock(v7);
  long long v6 = sub_100009ED4();
  dispatch_sync(v6, v5);
}

void sub_10000A3E8(uint64_t a1)
{
  if (qword_10001A220)
  {
    *(_OWORD *)keys = *(_OWORD *)off_100014B50;
    long long v6 = "archiveCompressionBypass";
    values[0] = xpc_int64_create(11);
    values[1] = xpc_string_create((const char *)[*(id *)(a1 + 32) UTF8String]);
    values[2] = xpc_BOOL_create(*(unsigned char *)(a1 + 40));
    xpc_object_t v2 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
    xpc_connection_send_message((xpc_connection_t)qword_10001A220, v2);

    for (uint64_t i = 2; i != -1; --i)
  }
}

void HTCheckForHangForHTMonitor(uint64_t a1, uint64_t a2)
{
  id v4 = shared_ht_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = *(_DWORD *)(a1 + 48);
    v6[0] = 67109120;
    v6[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "HTCheckForHangForHTMonitor: check hang for  pid=%u ", (uint8_t *)v6, 8u);
  }

  sub_10000A598(a1, 1, a2);
}

void sub_10000A598(uint64_t a1, int a2, uint64_t a3)
{
  if (!*(unsigned char *)(a1 + 372))
  {
    uint64_t v6 = mach_absolute_time();
    os_signpost_id_t v7 = *(void *)a1;
    double v8 = MATU_TO_MS((unint64_t)((double)v6 - (double)*(unint64_t *)a1));
    if (v8 > 100.0) {
      kdebug_trace();
    }
    if (*(unsigned char *)(a1 + 29)) {
      BOOL v9 = v8 > (double)*(unint64_t *)(a1 + 8);
    }
    else {
      BOOL v9 = 0;
    }
    if (v8 < 250.0 && !v9)
    {
      if (!a2) {
        return;
      }
      CFStringRef v12 = shared_ht_log_handle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v16 = *(_DWORD *)(a1 + 48);
        *(_DWORD *)buf = 67109120;
        LODWORD(v55) = v16;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "checkForHang:Hang is not detected for pid @%u during user switched away from App", buf, 8u);
      }
      goto LABEL_68;
    }
    unint64_t v11 = 1;
    if (a2)
    {
      *(unsigned char *)(a1 + 372) = 1;
      unint64_t v11 = 10;
    }
    CFStringRef v12 = +[NSString stringWithUTF8String:a1 + 116];
    if (isAppBeingDebugged(*(_DWORD *)(a1 + 48)))
    {
      __int16 v13 = shared_ht_log_handle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v55 = v8 / 1000.0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Hang detected: %.2fs (debugger attached, not reporting)", buf, 0xCu);
      }

      +[NSString stringWithFormat:@"com.apple.ht_debugger_attached.%s.%s", a1 + 52, a1 + 116];
      HTAggdPushValueForDistributionKey();
      sub_10000B158(6, v12, v8);
      int v14 = alwaysOnSignpost();
      signpostHangInterval(@"Debugger Attached Runloop Hang", v12, v7, v6, v14);

      if (!*(unsigned char *)(a1 + 29)) {
        goto LABEL_68;
      }
      unint64_t v47 = _NSConcreteStackBlock;
      uint64_t v48 = 3221225472;
      long long v49 = sub_10000B218;
      long long v50 = &unk_100014C38;
      uint64_t v52 = 6;
      long long v51 = v12;
      double v53 = v8;
      AnalyticsSendEventLazy();
      CFStringRef v15 = v51;
LABEL_67:

LABEL_68:
      return;
    }
    if ((a2 & 1) == 0 && alm_app_measurement_ongoing())
    {
      long long v17 = shared_ht_log_handle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v55 = v8 / 1000.0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Hang detected: %.2fs (overlaps extended launch)", buf, 0xCu);
      }

      +[NSString stringWithFormat:@"com.apple.ht_extended_launch_overlap.%s.%s", a1 + 52, a1 + 116];
      HTAggdPushValueForDistributionKey();
      unint64_t v11 = 7;
    }
    if (a3 && checkForAssertionOverlap(v7, v6, a3, 1))
    {
      long long v18 = shared_ht_log_handle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v55 = v8 / 1000.0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Hang detected: %.2fs (overlaps with non-responsive assertion)", buf, 0xCu);
      }

      +[NSString stringWithFormat:@"com.apple.ht_assertion_overlap.%s.%s", a1 + 52, a1 + 116];
      HTAggdPushValueForDistributionKey();
      unint64_t v11 = 9;
      sub_10000B158(9, v12, v8);
    }
    else
    {
      __int16 v19 = shared_ht_log_handle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v55 = v8 / 1000.0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Hang detected: %.2fs (always-on hang reporting)", buf, 0xCu);
      }

      +[NSString stringWithFormat:@"com.apple.ht_always_on.%s.%s", a1 + 52, a1 + 116];
      HTAggdPushValueForDistributionKey();
      sub_10000B158(v11, v12, v8);
      CFStringRef v20 = getStringForSubtype(v11);
      __int16 v21 = +[NSString stringWithUTF8String:a1 + 116];
      CFStringRef v22 = alwaysOnSignpost();
      signpostHangInterval(v20, v21, v7, v6, v22);

      if (v8 < 250.0)
      {
        CFStringRef v23 = shared_ht_log_handle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          sub_10000C084(v23, v8);
        }
      }
    }
    if (!*(unsigned char *)(a1 + 29)) {
      goto LABEL_68;
    }
    BOOL v24 = v9;
    if (v8 < 250.0) {
      BOOL v24 = 1;
    }
    if (v24 || !*(unsigned char *)(a1 + 30))
    {
      BOOL v27 = 0;
    }
    else
    {
      double v25 = (double)arc4random_uniform(0xFFFFFFFF) * 100.0 / 4294967300.0;
      double v26 = *(double *)(a1 + 16);
      BOOL v27 = v25 < v26;
      v28 = shared_ht_log_handle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        CFStringRef v41 = *(const __CFString **)(a1 + 16);
        if (v25 >= v26) {
          CFStringRef v29 = @"(diceRoll over threshold)";
        }
        else {
          CFStringRef v29 = @"(diceRoll under threshold)";
        }
        unint64_t v30 = +[NSNumber numberWithBool:v25 < v26];
        *(_DWORD *)buf = 134218754;
        double v55 = v25;
        __int16 v56 = 2048;
        CFStringRef v57 = v41;
        __int16 v58 = 2112;
        CFStringRef v59 = v30;
        __int16 v60 = 2112;
        CFStringRef v61 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Micro Hang Sampling: random sampling diceRoll=%.2f samplingPercent=%.2f%% -> shouldCapture=%@ %@", buf, 0x2Au);

        BOOL v27 = v25 < v26;
      }
    }
    if (v8 < 250.0) {
      goto LABEL_68;
    }
    id v31 = shared_ht_log_handle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v32 = @"(over capture threshold)";
      if (!v9) {
        CFStringRef v32 = @"(not over capture threshold)";
      }
      *(_DWORD *)buf = 134218498;
      double v55 = v8 / 1000.0;
      __int16 v56 = 2112;
      CFStringRef v57 = v32;
      if (!v9 && v27) {
        CFStringRef v33 = @", (capture microhang)";
      }
      else {
        CFStringRef v33 = &stru_100014DA8;
      }
      __int16 v58 = 2112;
      CFStringRef v59 = v33;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Hang detected: %.2fs %@ %@", buf, 0x20u);
    }

    BOOL v43 = v27;
    if (a2)
    {
      CFDataRef v42 = 0;
      uint64_t v34 = 13;
    }
    else
    {
      CFDataRef Data = (const __CFData *)hangEventCaptureUserActionCreateData(a1);
      if (Data)
      {
        CFDataRef v36 = Data;
        if (CFDataGetLength(Data) <= 0x20000)
        {
          uint64_t v34 = 3;
          CFDataRef v42 = v36;
          goto LABEL_66;
        }
        double v37 = shared_ht_log_handle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          double v38 = COERCE_DOUBLE(CFDataGetLength(v36));
          *(_DWORD *)buf = 134217984;
          double v55 = v38;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "User action data size %ld exceeding limit", buf, 0xCu);
        }

        CFRelease(v36);
      }
      CFDataRef v42 = 0;
      uint64_t v34 = 3;
    }
LABEL_66:
    uint64_t v39 = *(void *)(a1 + 40);
    char v40 = *(unsigned char *)(a1 + 28);
    CFStringRef v15 = sub_100009ED4();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B32C;
    block[3] = &unk_100014CA0;
    void block[4] = v34;
    block[5] = a1 + 52;
    block[6] = v39;
    block[7] = v7;
    char v45 = v40;
    block[8] = v6;
    block[9] = v11;
    BOOL v46 = v43;
    block[10] = a1;
    block[11] = v42;
    dispatch_async(v15, block);
    goto LABEL_67;
  }
}

void sub_10000AE08(id a1)
{
  qword_10001A228 = (uint64_t)dispatch_queue_create("com.apple.hangtracer.prefsqueue", 0);
  _objc_release_x1();
}

void sub_10000AE48(id a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AEE0;
  block[3] = &unk_100014568;
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.hangtracer.fencePrefs", 0);
  uint64_t v1 = v3;
  dispatch_async(v1, block);
}

void sub_10000AEE0(uint64_t a1)
{
  id v2 = +[HTPrefs sharedPrefs];
  [v2 setupPrefsWithQueue:*(void *)(a1 + 32)];
}

void sub_10000AF38(id a1)
{
  if (!qword_10001A220)
  {
    uint64_t v1 = sub_100009ED4();
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.hangtracerd", v1, 0);
    dispatch_queue_t v3 = (void *)qword_10001A220;
    qword_10001A220 = (uint64_t)mach_service;

    xpc_connection_set_event_handler((xpc_connection_t)qword_10001A220, &stru_100014BF0);
    id v4 = (_xpc_connection_s *)qword_10001A220;
    xpc_connection_resume(v4);
  }
}

void sub_10000AFC0(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  dispatch_queue_t v3 = xpc_copy_description(v2);
  xpc_type_t type = xpc_get_type(v2);

  if (type != (xpc_type_t)&_xpc_type_error)
  {
    int v5 = shared_ht_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      uint64_t v8 = (uint64_t)v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received unhandled event from daemon: %s", (uint8_t *)&v7, 0xCu);
    }
LABEL_8:

    goto LABEL_9;
  }
  if (qword_10001A220)
  {
    uint64_t v6 = shared_ht_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134218242;
      uint64_t v8 = qword_10001A220;
      __int16 v9 = 2080;
      CFStringRef v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "XPC Error when we still had a connection (%p): %s", (uint8_t *)&v7, 0x16u);
    }

    int v5 = qword_10001A220;
    qword_10001A220 = 0;
    goto LABEL_8;
  }
LABEL_9:
  free(v3);
}

void sub_10000B118(id a1)
{
  qword_10001A240 = (uint64_t)dispatch_queue_create("com.apple.hangtracer.connectionqueue", 0);
  _objc_release_x1();
}

void sub_10000B158(uint64_t a1, void *a2, double a3)
{
  id v5 = a2;
  uint64_t v6 = HTCAQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B4C0;
  block[3] = &unk_100014CC8;
  id v9 = v5;
  uint64_t v10 = a1;
  double v11 = a3;
  id v7 = v5;
  dispatch_async(v6, block);
}

id sub_10000B218(uint64_t a1)
{
  v8[0] = kHTCoreAnalyticsDaemonEnabled;
  v7[0] = kHTCoreAnalyticsMode;
  v7[1] = kHTCoreAnalyticsHangType;
  id v2 = getStringForSubtype(*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  v8[1] = v2;
  v8[2] = v3;
  void v7[2] = kHTCoreAnalyticsHangBundleID;
  v7[3] = kHTCoreAnalyticsHangDuration;
  id v4 = +[NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v8[3] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];

  return v5;
}

void sub_10000B32C(uint64_t a1)
{
  if (qword_10001A220)
  {
    long long v12 = *(_OWORD *)off_100014C78;
    long long v13 = *(_OWORD *)off_100014C88;
    int v14 = "saveMicroHang";
    *(_OWORD *)keys = *(_OWORD *)off_100014C58;
    long long v11 = *(_OWORD *)off_100014C68;
    values[0] = xpc_int64_create(*(void *)(a1 + 32));
    values[1] = xpc_string_create(*(const char **)(a1 + 40));
    values[2] = xpc_int64_create(*(void *)(a1 + 48));
    xpc_object_t values[3] = xpc_int64_create(*(void *)(a1 + 56));
    values[4] = xpc_int64_create(*(void *)(a1 + 64));
    values[5] = xpc_BOOL_create(*(unsigned char *)(a1 + 96) != 0);
    values[6] = xpc_int64_create(*(void *)(a1 + 72));
    values[7] = xpc_int64_create(*(int *)(*(void *)(a1 + 80) + 48));
    values[8] = xpc_BOOL_create(*(unsigned char *)(a1 + 97));
    xpc_object_t v2 = xpc_dictionary_create((const char *const *)keys, values, 9uLL);
    CFDataRef v3 = *(const __CFData **)(a1 + 88);
    if (v3)
    {
      BytePtr = CFDataGetBytePtr(v3);
      size_t Length = CFDataGetLength(*(CFDataRef *)(a1 + 88));
      xpc_object_t v6 = xpc_data_create(BytePtr, Length);
      xpc_dictionary_set_value(v2, "userActionData", v6);
    }
    xpc_connection_send_message((xpc_connection_t)qword_10001A220, v2);

    for (uint64_t i = 8; i != -1; --i)
  }
  uint64_t v8 = *(const void **)(a1 + 88);
  if (v8) {
    CFRelease(v8);
  }
}

void sub_10000B4C0(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();
}

id sub_10000B564(uint64_t a1)
{
  xpc_object_t v2 = sub_100009BC8();
  HTTelemetryCheckForUpdates(v2);

  if (qword_10001A258 != -1) {
    dispatch_once(&qword_10001A258, &stru_100014CE8);
  }
  if (!qword_10001A250) {
    goto LABEL_8;
  }
  memset(&v27, 0, 512);
  if (statfs((const char *)[(id)qword_10001A250 fileSystemRepresentation], &v27))
  {
    CFDataRef v3 = shared_ht_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *__error();
      v26[0] = 67109120;
      v26[1] = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unable to get volume space info: %{errno}d", (uint8_t *)v26, 8u);
    }

LABEL_8:
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    goto LABEL_10;
  }
  uint64_t v5 = v27.f_blocks * v27.f_bsize;
  uint64_t v6 = v27.f_bavail * v27.f_bsize;
LABEL_10:
  id v7 = +[HTPrefs sharedPrefs];
  id v8 = [v7 numOSCryptexFileExtents];

  id v9 = +[HTPrefs sharedPrefs];
  id v10 = [v9 haveRootsInstalled];

  long long v11 = +[HTPrefs sharedPrefs];
  id v12 = [v11 haveNonDefaultFeatureFlags];

  long long v13 = +[HTPrefs sharedPrefs];
  id v14 = [v13 haveSerialLoggingEnabled];

  id v15 = objc_alloc_init((Class)NSMutableDictionary);
  [v15 setObject:kHTCoreAnalyticsAlwaysOn forKeyedSubscript:kHTCoreAnalyticsMode];
  int v16 = getStringForSubtype(*(void *)(a1 + 40));
  [v15 setObject:v16 forKeyedSubscript:kHTCoreAnalyticsHangType];

  [v15 setObject:*(void *)(a1 + 32) forKeyedSubscript:kHTCoreAnalyticsHangBundleID];
  long long v17 = +[NSNumber numberWithDouble:*(double *)(a1 + 48)];
  [v15 setObject:v17 forKeyedSubscript:kHTCoreAnalyticsHangDuration];

  if (v5)
  {
    long long v18 = +[NSNumber numberWithDouble:(double)v6 * 100.0 / (double)v5];
    [v15 setObject:v18 forKeyedSubscript:kHTCoreAnalyticsDiskAvailablePercent];

    __int16 v19 = +[NSNumber numberWithUnsignedLongLong:v6];
    [v15 setObject:v19 forKeyedSubscript:kHTCoreAnalyticsDiskAvailableBytes];
  }
  if ((int)v8 >= 1)
  {
    CFStringRef v20 = +[NSNumber numberWithInt:v8];
    [v15 setObject:v20 forKeyedSubscript:kHTCoreAnalyticsNumOSCryptexFileExtents];
  }
  __int16 v21 = +[NSNumber numberWithBool:v12];
  [v15 setObject:v21 forKeyedSubscript:kHTCoreAnalyticsHaveNonDefaultFeatureFlags];

  CFStringRef v22 = +[NSNumber numberWithBool:v14];
  [v15 setObject:v22 forKeyedSubscript:kHTCoreAnalyticsHaveSerialLoggingEnabled];

  CFStringRef v23 = +[NSNumber numberWithBool:v10];
  [v15 setObject:v23 forKeyedSubscript:kHTCoreAnalyticsHaveRootsInstalled];

  BOOL v24 = shared_ht_log_handle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v27.f_bsize = 138412290;
    *(void *)&v27.f_iosize = v15;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Logging always-on telemetry: %@", (uint8_t *)&v27, 0xCu);
  }

  return v15;
}

void sub_10000B9A8(id a1)
{
  uint64_t v1 = HTGetHomeDirectoryURL();
  xpc_object_t v2 = (void *)qword_10001A250;
  qword_10001A250 = v1;

  if (!qword_10001A250)
  {
    CFDataRef v3 = shared_ht_log_handle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unable to get home dir URL", v4, 2u);
    }
  }
}

void sub_10000BA30(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id shared_ht_log_handle()
{
  if (qword_10001A268 != -1) {
    dispatch_once(&qword_10001A268, &stru_100014D08);
  }
  v0 = (void *)qword_10001A260;
  return v0;
}

void sub_10000BAAC(id a1)
{
  qword_10001A260 = (uint64_t)os_log_create("com.apple.hangtracer", "");
  _objc_release_x1();
}

void sub_10000BAF0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Telemetry is current", v1, 2u);
}

void sub_10000BB34(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "HTAssertion: checkOverlap: no assertions have been tracked", v1, 2u);
}

void sub_10000BB78(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "HTAssertion: checkOverlap: hang does not overlap any assertions", v1, 2u);
}

void sub_10000BBBC(uint8_t *a1, unint64_t a2, double *a3, NSObject *a4)
{
  double v7 = MATU_TO_MS(a2);
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "HTAssertion: checkOverlap: ignoring hang during screen off with duration %.0fms", a1, 0xCu);
}

void sub_10000BC28(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "HTPrefs: %@ was not found in the %@ domain, a profile, by EPL, by PowerLog Tasking domain, by HT Self Enablement or by HT Sentry Enablement", (uint8_t *)&v3, 0x16u);
}

void sub_10000BCB0(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138412802;
  *(void *)&v3[4] = @"enablementPrefix";
  *(_WORD *)&void v3[12] = 2112;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  sub_100008B64((void *)&_mh_execute_header, (uint64_t)a2, a3, "HTPrefs: %@: %@ -> %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *a2);
}

void sub_10000BD3C()
{
  sub_100008B84();
  sub_100008B94();
  sub_100008B64((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
}

void sub_10000BDD8()
{
  sub_100008B84();
  sub_100008B94();
  sub_100008B64((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
}

void sub_10000BE74()
{
  sub_100008B84();
  sub_100008B94();
  sub_100008B64((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
}

void sub_10000BF10()
{
  sub_100008B84();
  sub_100008B94();
  sub_100008B64((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
}

void sub_10000BFAC(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Preparing prefInitList", v1, 2u);
}

void sub_10000BFF0()
{
  __assert_rtn("-[HTPrefs setupPrefsWithQueue:]", "HTPrefs.m", 1486, "prefsQueue != NULL");
}

void sub_10000C01C()
{
  sub_10000BA4C();
  sub_10000BA30((void *)&_mh_execute_header, v0, v1, "Fence tracking is disabled, not creating object for HT fence tracking.", v2, v3, v4, v5, v6);
}

void sub_10000C050()
{
  sub_10000BA4C();
  sub_10000BA30((void *)&_mh_execute_header, v0, v1, "HTFenceAssertion init: Daemon Mode HangTracing is disabled, not creating object for HT fence tracking.", v2, v3, v4, v5, v6);
}

void sub_10000C084(os_log_t log, double a2)
{
  int v2 = 134218240;
  double v3 = a2;
  __int16 v4 = 1024;
  int v5 = 250;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Hang detected below aggd threshold: hang duration = %.2fms, aggd treshold = %.2dms", (uint8_t *)&v2, 0x12u);
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
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

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return _NSHomeDirectoryForUser(userName);
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t alm_app_measurement_ongoing()
{
  return _alm_app_measurement_ongoing();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

int getrusage(int a1, rusage *a2)
{
  return _getrusage(a1, a2);
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

uint64_t mach_get_times()
{
  return _mach_get_times();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int sem_close(sem_t *a1)
{
  return _sem_close(a1);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return _sem_open(a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return _xpc_BOOL_create(value);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return _xpc_data_create(bytes, length);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return _xpc_dictionary_create_empty();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return _xpc_int64_create(value);
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return _xpc_uint64_create(value);
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

id objc_msgSend_addSubsystem_category_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubsystem:category:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attachmentWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachmentWithPath:");
}

id objc_msgSend_beginDate(void *a1, const char *a2, ...)
{
  return _[a1 beginDate];
}

id objc_msgSend_beginEvent(void *a1, const char *a2, ...)
{
  return _[a1 beginEvent];
}

id objc_msgSend_beginWallTimeStringWithTimeZoneName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginWallTimeStringWithTimeZoneName:");
}

id objc_msgSend_BOOLProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLProperty:contextPrefixOut:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeInterval_sinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeInterval:sinceDate:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfFile:");
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

id objc_msgSend_durationSeconds(void *a1, const char *a2, ...)
{
  return _[a1 durationSeconds];
}

id objc_msgSend_earlyInitNecessaryPrefs(void *a1, const char *a2, ...)
{
  return _[a1 earlyInitNecessaryPrefs];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return _[a1 endDate];
}

id objc_msgSend_endEvent(void *a1, const char *a2, ...)
{
  return _[a1 endEvent];
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _[a1 environment];
}

id objc_msgSend_fenceTrackingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 fenceTrackingEnabled];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_hangtracerDaemonEnabled(void *a1, const char *a2, ...)
{
  return _[a1 hangtracerDaemonEnabled];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_haveNonDefaultFeatureFlags(void *a1, const char *a2, ...)
{
  return _[a1 haveNonDefaultFeatureFlags];
}

id objc_msgSend_haveRootsInstalled(void *a1, const char *a2, ...)
{
  return _[a1 haveRootsInstalled];
}

id objc_msgSend_haveSerialLoggingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 haveSerialLoggingEnabled];
}

id objc_msgSend_hudEnabled(void *a1, const char *a2, ...)
{
  return _[a1 hudEnabled];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_intProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intProperty:contextPrefixOut:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
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

id objc_msgSend_keysSortedByValueUsingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysSortedByValueUsingSelector:");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedStringFromDate_dateStyle_timeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringFromDate:dateStyle:timeStyle:");
}

id objc_msgSend_numOSCryptexFileExtents(void *a1, const char *a2, ...)
{
  return _[a1 numOSCryptexFileExtents];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectProperty_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectProperty:matchingSelector:contextPrefixOut:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
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

id objc_msgSend_processID(void *a1, const char *a2, ...)
{
  return _[a1 processID];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processLogArchiveWithPath_startDate_endDate_errorOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processLogArchiveWithPath:startDate:endDate:errorOut:");
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _[a1 processName];
}

id objc_msgSend_refreshHTPrefs(void *a1, const char *a2, ...)
{
  return _[a1 refreshHTPrefs];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDeleteOnAttach_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeleteOnAttach:");
}

id objc_msgSend_setIntervalCompletionProcessingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntervalCompletionProcessingBlock:");
}

id objc_msgSend_setMemoryLoggingIntervalSec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMemoryLoggingIntervalSec:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setShouldCompress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldCompress:");
}

id objc_msgSend_setShouldPostHTPrefsChangedNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPostHTPrefsChangedNotification:");
}

id objc_msgSend_setSubsystemCategoryFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubsystemCategoryFilter:");
}

id objc_msgSend_setupPrefsWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPrefsWithQueue:");
}

id objc_msgSend_setupPrefsWithQueue_profilePath_taskingDomainName_hangtracerDomain_setupInternalPrefs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPrefsWithQueue:profilePath:taskingDomainName:hangtracerDomain:setupInternalPrefs:");
}

id objc_msgSend_sharedPrefs(void *a1, const char *a2, ...)
{
  return _[a1 sharedPrefs];
}

id objc_msgSend_shouldPostHTPrefsChangedNotification(void *a1, const char *a2, ...)
{
  return _[a1 shouldPostHTPrefsChangedNotification];
}

id objc_msgSend_sleepForTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sleepForTimeInterval:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringProperty:contextPrefixOut:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
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

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}