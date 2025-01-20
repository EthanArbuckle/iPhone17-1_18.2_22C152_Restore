void sub_10000308C()
{
  byte_100008050 = 0;
}

BOOL sub_100003098()
{
  mach_port_t sp = 0;
  mach_error_t v0 = bootstrap_check_in(bootstrap_port, "com.apple.ABDatabaseDoctor", &sp);
  mach_error_t v1 = v0;
  if (v0)
  {
    v2 = mach_error_string(v0);
    syslog(3, "Couldn't register with bootstrap server %s (0x%x); failing...", v2, v1);
  }
  else
  {
    v3 = CFMachPortCreateWithPort(kCFAllocatorDefault, sp, (CFMachPortCallBack)sub_10000308C, 0, 0);
    RunLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, v3, 0);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0, 1u);
    CFRelease(RunLoopSource);
    CFRelease(v3);
  }
  return v1 == 0;
}

uint64_t start()
{
  if (sub_100003098() && (ABDeviceIsBeforeFirstUnlockWithDataProtected() & 1) == 0)
  {
    mach_error_t v1 = +[NSMutableArray array];
    v2 = (void *)ABCAddressBookCopyDBDirectory();
    if (v2)
    {
      [v1 addObject:v2];
      v3 = (void *)ABCAddressBookCopyDelegateDBDirectories();
      if (v3) {
        [v1 addObjectsFromArray:v3];
      }
    }
    [v1 enumerateObjectsUsingBlock:&stru_1000041E8];
  }
  return 0;
}

void sub_100003240(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  CFStringRef v5 = kCFRunLoopDefaultMode;
  v6 = &ABAddressBookCheckDefaultSourceIntegrityAndUpdateIfNeeded_ptr;
  v7 = &ABAddressBookCheckDefaultSourceIntegrityAndUpdateIfNeeded_ptr;
  v8 = &ABAddressBookCheckDefaultSourceIntegrityAndUpdateIfNeeded_ptr;
  id v34 = v4;
  do
  {
    byte_100008050 = 1;
    getpid();
    proc_disable_cpumon();
    v9 = (const void *)ABAddressBookCreateWithDatabaseDirectoryAndForceInProcessLinking();
    ABDatabaseIntegrityCheckWithAddressBook();
    buf[0] = 1;
    if ((ABCIsSortDataValid() & 1) == 0 && buf[0])
    {
      ABCRebuildSearchIndex();
      ABCResetSortData();
    }
    ABAddressBookCheckDefaultSourceIntegrityAndUpdateIfNeeded();
    if ([v6[50] isLinkDataValidForAddressBook:v9])
    {
      v10 = os_log_create("com.apple.contacts.database-doctor", "autolinking");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "BEGIN autolinking", buf, 2u);
      }
      ABDiagnosticsEnabled();
      _ABLog2();
      id v11 = [objc_alloc((Class)v6[50]) initWithAddressBook:v9];
      int v12 = sub_100003740(@"ABAutolinkLimit", 200, @"limit");
      CFIndex v13 = sub_100003740(@"ABAutolinkSleepSeconds", 1, @"sleep time");
      os_signpost_id_t v14 = os_signpost_id_generate(v10);
      v15 = v10;
      v16 = v15;
      unint64_t v36 = v14 - 1;
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "Autolinking", (const char *)&unk_100003E5E, buf, 2u);
      }
      os_signpost_id_t spid = v14;
      uint64_t v17 = v12;

      while (1)
      {
        os_signpost_id_t v18 = os_signpost_id_generate(v16);
        v19 = v16;
        v20 = v19;
        if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "Autolinking (batch)", (const char *)&unk_100003E5E, buf, 2u);
        }

        unsigned int v21 = [v11 linkRecentlyAddedPeopleWithLimit:v17];
        v22 = v20;
        v23 = v22;
        if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, v18, "Autolinking (batch)", (const char *)&unk_100003E5E, buf, 2u);
        }

        if (!v21) {
          break;
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          int v38 = v13;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Sleeping for %i seconds", buf, 8u);
        }
        ABDiagnosticsEnabled();
        CFIndex v33 = v13;
        _ABLog2();
        sleep(v13);
      }
      v24 = v23;
      v25 = v24;
      if (v36 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_END, spid, "Autolinking", (const char *)&unk_100003E5E, buf, 2u);
      }

      v6 = &ABAddressBookCheckDefaultSourceIntegrityAndUpdateIfNeeded_ptr;
      v7 = &ABAddressBookCheckDefaultSourceIntegrityAndUpdateIfNeeded_ptr;
      v8 = &ABAddressBookCheckDefaultSourceIntegrityAndUpdateIfNeeded_ptr;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "END autolinking", buf, 2u);
      }
      ABDiagnosticsEnabled();
      _ABLog2();

      CFStringRef v5 = kCFRunLoopDefaultMode;
      id v4 = v34;
    }
    id v26 = [objc_alloc((Class)v7[49]) initWithAddressBook:v9];
    [v26 performPendingMergeOrDeleteAction];

    CFRelease(v9);
    getpid();
    proc_set_cpumon_defaults();
    v27 = [v8[51] date];
    if (byte_100008050 == 1)
    {
      do
      {
        v28 = objc_msgSend(v8[51], "date", v33);
        [v28 timeIntervalSinceDate:v27];
        double v30 = v29;

        if (v30 >= 10.0) {
          break;
        }
        unsigned __int32 v31 = CFRunLoopRunInMode(v5, 10.0 - v30, 1u) - 3;
      }
      while (byte_100008050 == 1 && v31 < 0xFFFFFFFE);
    }
  }
  while (byte_100008050 != 1);
}

CFIndex sub_100003740(const __CFString *a1, CFIndex a2, void *a3)
{
  Boolean keyExistsAndHasValidFormat = 0;
  id v5 = a3;
  CFStringRef v6 = (const __CFString *)ABPeoplePickerPrefs();
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(a1, v6, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    CFIndex v8 = AppIntegerValue;
    ABDiagnosticsEnabled();
    _ABLog2();
    a2 = v8;
  }
  else
  {
    ABDiagnosticsEnabled();
    _ABLog2();
  }

  return a2;
}

uint64_t ABAddressBookCheckDefaultSourceIntegrityAndUpdateIfNeeded()
{
  return _ABAddressBookCheckDefaultSourceIntegrityAndUpdateIfNeeded();
}

uint64_t ABAddressBookCreateWithDatabaseDirectoryAndForceInProcessLinking()
{
  return _ABAddressBookCreateWithDatabaseDirectoryAndForceInProcessLinking();
}

uint64_t ABCAddressBookCopyDBDirectory()
{
  return _ABCAddressBookCopyDBDirectory();
}

uint64_t ABCAddressBookCopyDelegateDBDirectories()
{
  return _ABCAddressBookCopyDelegateDBDirectories();
}

uint64_t ABCIsSortDataValid()
{
  return _ABCIsSortDataValid();
}

uint64_t ABCRebuildSearchIndex()
{
  return _ABCRebuildSearchIndex();
}

uint64_t ABCResetSortData()
{
  return _ABCResetSortData();
}

uint64_t ABDatabaseIntegrityCheckWithAddressBook()
{
  return _ABDatabaseIntegrityCheckWithAddressBook();
}

uint64_t ABDeviceIsBeforeFirstUnlockWithDataProtected()
{
  return _ABDeviceIsBeforeFirstUnlockWithDataProtected();
}

uint64_t ABDiagnosticsEnabled()
{
  return _ABDiagnosticsEnabled();
}

uint64_t ABPeoplePickerPrefs()
{
  return _ABPeoplePickerPrefs();
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return _CFMachPortCreateRunLoopSource(allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return _CFMachPortCreateWithPort(allocator, portNum, callout, context, shouldFreeInfo);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

uint64_t _ABLog2()
{
  return __ABLog2();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_check_in(bp, service_name, sp);
}

pid_t getpid(void)
{
  return _getpid();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

uint64_t proc_disable_cpumon()
{
  return _proc_disable_cpumon();
}

uint64_t proc_set_cpumon_defaults()
{
  return _proc_set_cpumon_defaults();
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

void syslog(int a1, const char *a2, ...)
{
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_performPendingMergeOrDeleteAction(void *a1, const char *a2, ...)
{
  return [a1 performPendingMergeOrDeleteAction];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}