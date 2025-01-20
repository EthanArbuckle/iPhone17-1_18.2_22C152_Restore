void sub_100002274(id a1)
{
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;
  uint64_t vars8;

  v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v1 = dispatch_queue_create("com.apple.ReportCrash.GPUEventTailspinQueue", v3);
  v2 = (void *)qword_100042F70;
  qword_100042F70 = (uint64_t)v1;
}

void sub_1000022DC(uint64_t a1)
{
  v3 = (const char *)[*(id *)(*(void *)(a1 + 32) + 56) fileSystemRepresentation];
  if (qword_100042F90 != -1) {
    dispatch_once(&qword_100042F90, &stru_100034E40);
  }
  if (off_100042F80)
  {
    uint64_t v4 = open_dprotected_np(v3, 514, 4, 0, 420);
    BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if ((v4 & 0x80000000) != 0)
    {
      if (v5)
      {
        *(_DWORD *)buf = 136315138;
        v10 = v3;
        v8 = "GPURestartReport: Failed to create tailspin file (%s)";
        goto LABEL_12;
      }
    }
    else
    {
      if (v5)
      {
        *(_DWORD *)buf = 136315138;
        v10 = v3;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "GPURestartReport: Saving tailspin output to %s", buf, 0xCu);
      }
      int v6 = off_100042F80(v4);
      close(v4);
      BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v7)
        {
          *(_DWORD *)buf = 136315138;
          v10 = v3;
          v8 = "GPURestartReport: Succesfully saved tailspin output to %s";
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
        }
      }
      else
      {
        if (v7)
        {
          *(_DWORD *)buf = 136315138;
          v10 = v3;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "GPURestartReport: Failed to save tailspin output to %s", buf, 0xCu);
        }
        unlink(v3);
      }
    }
  }
}

void sub_1000026C8(id a1)
{
  v1 = dlopen("/usr/lib/libtailspin.dylib", 1);
  qword_100042F88 = (uint64_t)v1;
  if (!v1)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    v2 = "GPURestartReport: libtailspin not available";
    v3 = buf;
    goto LABEL_7;
  }
  off_100042F80 = (uint64_t (*)(void))dlsym(v1, "tailspin_dump_output_sync");
  if (!off_100042F80 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v4 = 0;
    v2 = "GPURestartReport: tailspin_dump_output_sync not found";
    v3 = (uint8_t *)&v4;
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v2, v3, 2u);
  }
}

void sub_100003334(uint64_t a1)
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.osanalytics"];
  v3 = [v2 objectForKey:@"SymbolicateCrashes"];
  __int16 v4 = v3;
  if (v3) {
    unsigned int v5 = [v3 intValue];
  }
  else {
    unsigned int v5 = 1;
  }
  dword_100042FC8 = v5;
  int v6 = [v2 objectForKey:@"ExcDiagToolTimeout"];

  int v7 = [v6 intValue];
  if (v7 >= 1) {
    int v8 = v7;
  }
  else {
    int v8 = 20;
  }
  dword_100042FCC = v8;
  v9 = [v2 objectForKey:@"ExcDiagToolExtras"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v25 = v9;
    uint64_t v10 = +[NSArray arrayWithObjects:&v25 count:1];
    uint64_t v11 = *(void *)(a1 + 32);
    v12 = *(void **)(v11 + 16000);
    *(void *)(v11 + 16000) = v10;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 16000), v9);
    }
  }
  v13 = +[OSASystemConfiguration sharedInstance];
  v14 = [v13 getTaskingKey:@"disableDiagInfo"];

  byte_100042FD0 = [v14 BOOLValue];
  if ((byte_100042FD0 & 1) == 0)
  {
    v15 = +[OSASystemConfiguration sharedInstance];
    v16 = [v15 getTaskingKey:@"enableMemoryGraph"];

    byte_100042FD1 = [v16 BOOLValue];
    if (v16) {
      unsigned __int8 v17 = [v16 BOOLValue];
    }
    else {
      unsigned __int8 v17 = 0;
    }
    byte_100042FD2 = v17;
    v18 = +[OSASystemConfiguration sharedInstance];
    v19 = [v18 getTaskingKey:@"enableReportMemoryException"];

    if (v19) {
      unsigned __int8 v20 = [v19 BOOLValue];
    }
    else {
      unsigned __int8 v20 = 1;
    }
    byte_100042FD3 = v20;
  }
  v21 = +[OSASystemConfiguration sharedInstance];
  v22 = [v21 getTaskingKey:@"saveExtHangLogs"];
  byte_100042FD4 = [v22 BOOLValue];

  v23 = +[OSASystemConfiguration sharedInstance];
  v24 = [v23 getTaskingKey:@"disableLogQuery"];
  byte_100042FD5 = [v24 BOOLValue];
}

void sub_1000037E0(uint64_t a1)
{
  id v2 = +[NSString stringWithUTF8String:CSSymbolOwnerGetPath()];
  if (([v2 containsString:*(void *)(a1 + 32)] & 1) != 0
    || [v2 containsString:@"/usr/local/libexec/rosetta/runtime"])
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100005774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

void sub_1000057A0(id a1, NSMutableDictionary *a2)
{
  v3 = a2;
  id v2 = [(NSMutableDictionary *)v3 objectForKeyedSubscript:@"path"];
  if (v2) {
    [(NSMutableDictionary *)v3 setObject:v2 forKeyedSubscript:@"path"];
  }
}

void sub_100005810(id a1)
{
  qword_100042FE0 = (uint64_t)dispatch_queue_create("com.apple.osanalytics.diagnosticInfo", 0);

  _objc_release_x1();
}

void sub_100005850(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  if (v8 && ([*(id *)(a1 + 48) timeIntervalSinceDate:v8], v2 < 3600.0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    v3 = +[OSASystemConfiguration sharedInstance];
    unsigned int v4 = [v3 appleInternal];

    if (v4)
    {
      uint64_t v5 = +[NSMutableDictionary dictionaryWithCapacity:1];
      uint64_t v6 = *(void *)(a1 + 56);
      int v7 = *(void **)(v6 + 15896);
      *(void *)(v6 + 15896) = v5;

      [*(id *)(*(void *)(a1 + 56) + 15896) setObject:@"To mitigate the CPU impact of repeated ExcResource events for this process, vmmap and heap were excluded. Please check an older report within the hour for those diagnostics.", @"Important Note" forKeyedSubscript];
    }
  }
  else
  {
    [*(id *)(a1 + 32) setObject:*(void *)(a1 + 48) forKey:*(void *)(a1 + 40)];
  }
}

uint64_t sub_100005BAC(uint64_t a1)
{
  int v1 = *(_DWORD *)a1;
  if ((*(_DWORD *)a1 & 0xFFFFFFF0) == 0x20) {
    int v1 = 17;
  }
  if (v1 <= 2309)
  {
    if (v1 == 17 || v1 == 19) {
      return *(unsigned int *)(a1 + 4);
    }
LABEL_18:
    unsigned int v4 = *(_DWORD *)(a1 + 4);
    goto LABEL_19;
  }
  if (v1 != 2310)
  {
    if (v1 == 2312)
    {
      unsigned int v4 = *(_DWORD *)(a1 + 4);
      if (v4 == 32)
      {
        if ((*(unsigned char *)(a1 + 8) & 0x8F) == 0) {
          return 24;
        }
        unsigned int v4 = 32;
      }
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  unsigned int v4 = *(_DWORD *)(a1 + 4);
  if (v4 == 112)
  {
    if ((*(unsigned char *)(a1 + 8) & 0x8F) == 0) {
      return 104;
    }
    unsigned int v4 = 112;
  }
LABEL_19:
  BOOL v5 = v4 >= (*(_DWORD *)(a1 + 8) & 0xFu);
  unsigned int v6 = v4 - (*(_DWORD *)(a1 + 8) & 0xF);
  if (v5) {
    return v6;
  }
  else {
    return 0;
  }
}

id sub_1000077DC()
{
  if (qword_1000430A8 != -1) {
    dispatch_once(&qword_1000430A8, &stru_1000352A8);
  }
  v0 = (void *)qword_1000430A0;

  return v0;
}

void sub_1000082D4(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  int v7 = (void *)a1[4];
  id v8 = (void *)a1[5];
  id v9 = a4;
  uint64_t v10 = [v8 composeFrame:a2 info:a3];
  [v7 addObject:v10];

  uint64_t v11 = (void *)a1[5];
  id v12 = [v9 symbolInfo];

  [v11 updateLogWritingSignatureWithSymbol:v12 address:a1[6]];
}

void *sub_100008854(vm_map_read_t a1, vm_address_t a2, vm_size_t a3)
{
  kern_return_t v6;
  kern_return_t v7;
  void *v8;
  void *v9;
  mach_msg_type_number_t dataCnt;
  vm_offset_t data;
  uint8_t buf[4];
  vm_map_read_t v14;
  __int16 v15;
  kern_return_t v16;
  __int16 v17;
  vm_address_t v18;
  __int16 v19;
  vm_size_t v20;

  data = 0;
  dataCnt = 0;
  unsigned int v6 = vm_read(a1, a2, a3, &data, &dataCnt);
  if (v6)
  {
    int v7 = v6;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109888;
      v14 = a1;
      v15 = 1024;
      v16 = v7;
      unsigned __int8 v17 = 2048;
      v18 = a2;
      v19 = 2048;
      unsigned __int8 v20 = a3 + a2;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "vm_read failed for task %u, kr=%d, start_address = %p, end_address = %p", buf, 0x22u);
    }
    return 0;
  }
  else
  {
    id v9 = malloc_type_calloc(dataCnt + 1, 1uLL, 0x9880BE21uLL);
    id v8 = v9;
    if (v9) {
      memcpy(v9, (const void *)data, dataCnt);
    }
    vm_deallocate(mach_task_self_, data, dataCnt);
  }
  return v8;
}

id sub_100008998(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _isMemoryImmutableAtAddress:a2];
}

id sub_1000089A4(uint64_t a1, uint64_t a2)
{
  double v2 = [*(id *)(a1 + 32) _findContainingTextSegmentRegion:*(void *)(a1 + 40) address:a2];
  v3 = [v2 path];

  return v3;
}

id sub_1000089FC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _readStringAtTaskAddress:a2 maxLength:0 immutableCheck:0];
}

void sub_100008F80(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(a1);
    id v12 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v11 description];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Attempting to read data: %@", (uint8_t *)&buf, 0xCu);
    }
    objc_end_catch();
    JUMPOUT(0x100008F24);
  }
  _Unwind_Resume(a1);
}

void sub_1000093C4(id a1)
{
  id v1 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.ReportCrash"];
  qword_100042FE8 = (uint64_t)[v1 integerForKey:@"AppSpecificBufferSize"];
}

void sub_100009424(uint64_t a1)
{
  char v8 = 0;
  Name = (char *)CSRegionGetName();
  if (!strncmp(Name, "__DATA", 6uLL) && strstr(Name, "__crash_info"))
  {
    uint64_t Range = CSRegionGetRange();
    BOOL v5 = [*(id *)(a1 + 32) _readDataAtAddress:Range size:v4];
    unsigned int v6 = v5;
    if (v5)
    {
      id v7 = v5;
      [v7 bytes];
      [v7 length];
      __memcpy_chk();
      CSSymbolOwnerGetName();
    }
  }
}

void sub_10000996C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t CFUUIDBytes = CSSymbolOwnerGetCFUUIDBytes();
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  unsigned __int8 v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_100009BB4;
  unsigned __int8 v20 = &unk_100035000;
  v21 = &v27;
  v22 = &v23;
  CSSymbolOwnerForeachSegment();
  if (v28[3] || v24[3])
  {
    uint64_t Architecture = CSSymbolOwnerGetArchitecture();
    char v8 = macho_arch_name_for_cpu_type(Architecture, SHIDWORD(Architecture));
    id v9 = *(void **)(*(void *)(a1 + 32) + 104);
    uint64_t v10 = v28[3];
    uint64_t v11 = v24[3];
    uint64_t Name = CSSymbolOwnerGetName();
    objc_msgSend(v9, "addImageLegacy:address:size:name:path:arch:", CFUUIDBytes, v10, v11 - v10 + 1, Name, CSSymbolOwnerGetPath(), v8, _NSConcreteStackBlock, 3221225472, sub_100009BB4, &unk_100035000, &v27, &v23);
    uint64_t v13 = *(void *)(a1 + 32);
    unint64_t v14 = *(void *)(v13 + 16152);
    if (v28[3] < v14 || v24[3] >= *(void *)(v13 + 16160) + v14)
    {
      v15 = *(void **)(a1 + 40);
      v16 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
      [v15 addObject:v16];
    }
  }
  if (*(void *)(a1 + 48)) {
    [*(id *)(a1 + 32) _extractCrashReporterAnnotationsFromSymbolOwner:a2 withMemory:a3];
  }
  objc_msgSend(*(id *)(a1 + 32), "_extractInfoPlistFromSymbolOwner:", a2, a3, v17, v18, v19, v20, v21, v22);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
}

void sub_100009B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

unint64_t sub_100009BB4(uint64_t a1)
{
  uint64_t Name = (const char *)CSRegionGetName();
  if (!strncmp(Name, "__TEXT", 6uLL) || (unint64_t result = strcmp(Name, "MACH_HEADER"), !result))
  {
    unint64_t result = CSRegionGetRange();
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(void *)(v5 + 24) - 1 >= result) {
      *(void *)(v5 + 24) = result;
    }
    unint64_t v6 = v4 + result - 1;
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v6 > *(void *)(v7 + 24)) {
      *(void *)(v7 + 24) = v6;
    }
  }
  return result;
}

void sub_10000A2E4(uint64_t a1)
{
  if (dword_100042FC8 == 2 || (CSIsNull() & 1) != 0 || (uint64_t Name = CSSymbolGetName()) == 0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v3 = Name;
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = +[NSString stringWithUTF8String:v3];
    unint64_t v6 = OSASanitizePath();
    [v4 setObject:v6 forKeyedSubscript:@"symbol"];

    uint64_t v7 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40) - CSSymbolGetRange()];
    [v4 setObject:v7 forKeyedSubscript:@"symbolLocation"];

    if ((CSIsNull() & 1) == 0)
    {
      uint64_t Filename = CSSourceInfoGetFilename();
      if (Filename)
      {
        id v9 = +[NSString stringWithUTF8String:Filename];
        [v4 setObject:v9 forKeyedSubscript:@"sourceFile"];
      }
      uint64_t LineNumber = CSSourceInfoGetLineNumber();
      if (LineNumber)
      {
        uint64_t v11 = +[NSNumber numberWithUnsignedInt:LineNumber];
        [v4 setObject:v11 forKeyedSubscript:@"sourceLine"];
      }
    }
  }
  if ([*(id *)(a1 + 32) count])
  {
    if (!v4) {
      uint64_t v4 = objc_opt_new();
    }
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"inline"];
  }
  uint64_t v12 = *(void **)(a1 + 32);
  id v13 = [v4 count];
  uint64_t v14 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  v15 = (void *)v14;
  if (v13)
  {
    uint64_t v20 = v14;
    v21 = v4;
    v16 = &v20;
    uint64_t v17 = 2;
  }
  else
  {
    uint64_t v19 = v14;
    v16 = &v19;
    uint64_t v17 = 1;
  }
  uint64_t v18 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, v17, v19, v20, v21);
  [v12 addObject:v18];
}

void sub_10000AE54(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000AEB8(uint64_t a1)
{
  if (CSIsNull()) {
    uint64_t result = 0;
  }
  else {
    uint64_t result = CSSymbolOwnerGetCFUUIDBytes();
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_10000AF18(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 objectForKeyedSubscript:@"symbol"];
  uint64_t v11 = v10;
  if (v10)
  {
    if (!*(_DWORD *)(a1 + 80) && *(_DWORD *)(*(void *)(a1 + 32) + 15776) == *(_DWORD *)(a1 + 84))
    {
      if ([v10 isEqualToString:@"___NEW_PROCESS_COULD_NOT_BE_EXECD___"])
      {
        [*(id *)(*(void *)(a1 + 32) + OBJC_IVAR___OSAReport__notes) addObject:@"process could not be executed"];
      }
      else if ([v11 isEqualToString:@"objc_msgSend"])
      {
        uint64_t v12 = [*(id *)(a1 + 32) _objcSelectorNameForMessenger:v11];
        if ([v12 length])
        {
          id v13 = *(void **)(a1 + 32);
          uint64_t v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"objc_msgSend() selector name: %@", v12);
          [v13 _addASILine:v14 fromOwner:@"objc" isSafe:1];
        }
      }
    }
    if (*(_DWORD *)(*(void *)(a1 + 32) + 188) == 6
      && (([v11 isEqualToString:@"abort"] & 1) != 0
       || [v11 isEqualToString:@"__abort"]))
    {
      *(_DWORD *)(*(void *)(a1 + 32) + 15776) = *(_DWORD *)(a1 + 84);
      v15 = *(void **)(*(void *)(a1 + 32) + 16272);
      v16 = +[NSString stringWithFormat:@"override via abort 0x%x ID(0x%llX)", *(unsigned int *)(a1 + 88), *(void *)(a1 + 64)];
      [v15 addObject:v16];

      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(_DWORD *)(a1 + 88);
      *(void *)(*(void *)(a1 + 32) + 15768) = *(void *)(a1 + 64);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = *(_DWORD *)(*(void *)(a1 + 32) + 15776);
        *(_DWORD *)buf = 67109120;
        int v30 = v17;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Forcing thread index %d (SIGABRT)", buf, 8u);
      }
    }
  }
  uint64_t v18 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v18 + 15776) == *(_DWORD *)(a1 + 84))
  {
    if (!*(_DWORD *)(a1 + 80))
    {
      if (*(unsigned char *)(v18 + 16208))
      {
        if (v9)
        {
          v22 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          if (v22)
          {
            uint64_t v23 = [v9 symbolInfo];
            v24 = &v23[OBJC_IVAR___OSASymbolInfo__uuid];
            uint64_t v26 = *(void *)v24;
            uint64_t v25 = *((void *)v24 + 1);
            BOOL v28 = *v22 == v26 && v22[1] == v25;
            *(unsigned char *)(*(void *)(a1 + 32) + 16209) = v28;

            uint64_t v18 = *(void *)(a1 + 32);
          }
        }
      }
    }
    uint64_t v19 = [v9 symbolInfo];
    [(id)v18 updateLogWritingSignatureWithSymbol:v19 address:*(void *)(a1 + 72)];

    uint64_t v18 = *(void *)(a1 + 32);
  }
  uint64_t v20 = *(void **)(a1 + 40);
  v21 = [(id)v18 composeFrame:v7 info:v8];
  [v20 addObject:v21];
}

BOOL sub_10000B35C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [a2 range];
  BOOL result = v5 - (uint64_t)v6 < v7;
  *a4 = result;
  return result;
}

BOOL sub_10000B458(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if ((*((unsigned char *)v3 + OBJC_IVAR___VMUVMRegion_is_submap) & 1) != 0
    || ([v3 type],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 isEqualToString:@"__TEXT"],
        v5,
        !v6))
  {
    BOOL v10 = 0;
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [v4 range];
    BOOL v10 = v7 - (uint64_t)v8 < v9;
  }

  return v10;
}

void sub_10000BA0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) composeFrame:a2 info:a3];
  [v3 addObject:v4];
}

void sub_10000C4A8(int a1, void *a2)
{
}

void sub_10000D8FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t sub_10000D93C(uint64_t a1)
{
  if (CSIsNull()) {
    uint64_t result = 0;
  }
  else {
    uint64_t result = CSSymbolOwnerGetBaseAddress();
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_10000E508(id a1)
{
  qword_100042FF8 = (uint64_t)dispatch_semaphore_create(1);

  _objc_release_x1();
}

id sub_10000E540(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001B9B8;
  v11[3] = &unk_1000352D0;
  uint64_t v6 = (1000 * a3);
  uint64_t v14 = a1;
  id v12 = a2;
  id v7 = objc_alloc_init((Class)NSMutableString);
  id v13 = v7;
  uint64_t v15 = a4;
  id v8 = v12;
  if (+[OSAReport executeWithTimeout:v6 Code:v11])
  {
    id v9 = +[NSString stringWithFormat:@"Timeout executing '%s'", a1];
  }
  else
  {

    id v9 = v7;
  }

  return v9;
}

id sub_10000F96C(uint64_t a1)
{
  v8[0] = &off_10003D078;
  v8[1] = &off_10003D060;
  v9[0] = @"KERN_PROTECTION_FAILURE";
  v9[1] = @"KERN_INVALID_ADDRESS";
  v8[2] = &off_10003D138;
  v9[2] = @"KERN_MEMORY_ERROR";
  double v2 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];
  id v3 = +[NSNumber numberWithLongLong:a1];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = +[NSString stringWithFormat:@"UNKNOWN_0x%llX", a1];
  }
  uint64_t v6 = v5;

  return v6;
}

NSDictionary *__cdecl sub_100014320(id a1)
{
  return (NSDictionary *)&off_10003CF08;
}

NSDictionary *__cdecl sub_10001432C(id a1)
{
  return (NSDictionary *)&off_10003CF30;
}

id sub_100014944(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v4[0] = @"namespace";
  v4[1] = @"problem";
  v5[0] = v1;
  v5[1] = @"truncated";
  double v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

void sub_1000162D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000162F4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100016304(uint64_t a1)
{
}

void *sub_10001630C(void *result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return objc_msgSend(*(id *)(*(void *)(result[4] + 8) + 40), "addEntriesFromDictionary:");
  }
  return result;
}

void sub_100016448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100016478(uint64_t a1)
{
  uint64_t result = CSRegionGetName();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = result == 0;
  }
  if (!v3)
  {
    uint64_t result = strncmp((const char *)result, "__OBJC_RO", 9uLL);
    if (!result)
    {
      uint64_t result = CSRegionGetRange();
      uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
      *(void *)(v4 + 32) = result;
      *(void *)(v4 + 40) = v5;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  return result;
}

void sub_100016648(id a1)
{
  BOOL v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.ReportCrash.trialQueue", v3);
  double v2 = (void *)qword_100043010;
  qword_100043010 = (uint64_t)v1;
}

void sub_1000166B0(uint64_t a1)
{
  if (!qword_100043008)
  {
    CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"TrialCache", @"com.apple.ReportCrash");
    BOOL v3 = (void *)qword_100043008;
    qword_100043008 = (uint64_t)v2;

    if (!qword_100043008) {
      goto LABEL_9;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "capture_time");
  double v5 = v4;
  uint64_t v6 = [(id)qword_100043008 objectForKeyedSubscript:@"lastCheckTime"];
  [v6 doubleValue];
  double v8 = v5 - v7;

  if (v8 > 86400.0)
  {
    if (qword_100043008)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "capture_time");
        uint64_t v10 = v9;
        uint64_t v11 = [(id)qword_100043008 objectForKeyedSubscript:@"lastCheckTime"];
        [v11 doubleValue];
        uint64_t v13 = v12;
        objc_msgSend(*(id *)(a1 + 32), "capture_time");
        double v15 = v14;
        v16 = [(id)qword_100043008 objectForKeyedSubscript:@"lastCheckTime"];
        [v16 doubleValue];
        *(_DWORD *)buf = 134218752;
        uint64_t v46 = v10;
        __int16 v47 = 2048;
        uint64_t v48 = v13;
        __int16 v49 = 2048;
        double v50 = v15 - v17;
        __int16 v51 = 2048;
        uint64_t v52 = 0x40F5180000000000;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "trial data cache expired (%.1f - %.1f = %.1f [%.1f])", buf, 0x2Au);
      }
LABEL_11:
      uint64_t v18 = objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "capture_time");
      uint64_t v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v18 setObject:v19 forKeyedSubscript:@"lastCheckTime"];

      if (objc_opt_class())
      {
        uint64_t v20 = objc_opt_new();
        v21 = +[TRIAllocationStatus defaultProvider];
        v22 = objc_opt_new();
        uint64_t v23 = +[OSASystemConfiguration sharedInstance];
        v24 = [v23 crashReporterKey];
        id v44 = 0;
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_100016C30;
        v42[3] = &unk_100035200;
        id v25 = v22;
        id v43 = v25;
        unsigned int v26 = [v21 enumerateSampledActiveExperimentsForEnvironment:0 correlationID:v24 error:&v44 block:v42];
        id v27 = v44;

        if (v26)
        {
          [v18 setObject:v25 forKeyedSubscript:@"experiments"];
        }
        else
        {
          BOOL v28 = [v27 localizedDescription];
          uint64_t v29 = +[NSString stringWithFormat:@"experiments query returned: %@", v28];
          [v20 addObject:v29];
        }
        int v30 = objc_opt_new();
        v31 = +[OSASystemConfiguration sharedInstance];
        v32 = [v31 crashReporterKey];
        id v41 = v27;
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_100016D5C;
        v39[3] = &unk_100035228;
        id v33 = v30;
        id v40 = v33;
        unsigned int v34 = [v21 enumerateSampledActiveRolloutsForCorrelationID:v32 error:&v41 block:v39];
        id v35 = v41;

        if (v34)
        {
          [v18 setObject:v33 forKeyedSubscript:@"rollouts"];
        }
        else
        {
          v36 = [v35 localizedDescription];
          v37 = +[NSString stringWithFormat:@"rollout query returned: %@", v36];
          [v20 addObject:v37];
        }
        if ([v20 count]) {
          [v18 setObject:v20 forKeyedSubscript:@"errors"];
        }
        CFPreferencesSetAppValue(@"TrialCache", v18, @"com.apple.ReportCrash");
        CFPreferencesAppSynchronize(@"com.apple.ReportCrash");
      }
      else
      {
        [v18 setObject:&off_10003D570 forKeyedSubscript:@"errors"];
      }
      v38 = (void *)qword_100043008;
      qword_100043008 = (uint64_t)v18;

      return;
    }
LABEL_9:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "trial data initial fetch", buf, 2u);
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "trial data cache valid", buf, 2u);
  }
}

void sub_100016C30(uint64_t a1, void *a2)
{
  CFPropertyListRef v2 = *(void **)(a1 + 32);
  v9[0] = @"experimentId";
  id v3 = a2;
  double v4 = [v3 experimentId];
  v10[0] = v4;
  v9[1] = @"deploymentId";
  double v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 deploymentId]);
  v10[1] = v5;
  v9[2] = @"treatmentId";
  uint64_t v6 = [v3 treatmentId];

  CFStringRef v7 = @"<unknown>";
  if (v6) {
    CFStringRef v7 = v6;
  }
  v10[2] = v7;
  double v8 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
  [v2 addObject:v8];
}

void sub_100016D5C(uint64_t a1, void *a2)
{
  CFPropertyListRef v2 = *(void **)(a1 + 32);
  v8[0] = @"rolloutId";
  id v3 = a2;
  double v4 = [v3 rolloutId];
  v9[0] = v4;
  v8[1] = @"deploymentId";
  double v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 deploymentId]);
  v9[1] = v5;
  v8[2] = @"factorPackIds";
  uint64_t v6 = [v3 factorPackIds];

  v9[2] = v6;
  CFStringRef v7 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];
  [v2 addObject:v7];
}

void sub_10001A4F0(id a1)
{
  if (sub_10001BC4C() && sub_10001BD90())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "loading MetricKit", (uint8_t *)&v28, 2u);
    }
    uint64_t v33 = 0;
    unsigned int v34 = &v33;
    uint64_t v35 = 0x2050000000;
    dispatch_queue_t v1 = (void *)qword_1000430C0;
    uint64_t v36 = qword_1000430C0;
    if (!qword_1000430C0)
    {
      BOOL v28 = _NSConcreteStackBlock;
      uint64_t v29 = 3221225472;
      int v30 = sub_10001BED4;
      v31 = &unk_100035348;
      v32 = &v33;
      sub_10001BED4((uint64_t)&v28);
      dispatch_queue_t v1 = (void *)v34[3];
    }
    id v2 = v1;
    _Block_object_dispose(&v33, 8);
    qword_100043020 = (uint64_t)v2;
    uint64_t v33 = 0;
    unsigned int v34 = &v33;
    uint64_t v35 = 0x2050000000;
    id v3 = (void *)qword_1000430C8;
    uint64_t v36 = qword_1000430C8;
    if (!qword_1000430C8)
    {
      BOOL v28 = _NSConcreteStackBlock;
      uint64_t v29 = 3221225472;
      int v30 = sub_10001BF7C;
      v31 = &unk_100035348;
      v32 = &v33;
      sub_10001BF7C((uint64_t)&v28);
      id v3 = (void *)v34[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v33, 8);
    qword_100043028 = (uint64_t)v4;
    uint64_t v33 = 0;
    unsigned int v34 = &v33;
    uint64_t v35 = 0x2050000000;
    double v5 = (void *)qword_1000430D0;
    uint64_t v36 = qword_1000430D0;
    if (!qword_1000430D0)
    {
      BOOL v28 = _NSConcreteStackBlock;
      uint64_t v29 = 3221225472;
      int v30 = sub_10001C024;
      v31 = &unk_100035348;
      v32 = &v33;
      sub_10001C024((uint64_t)&v28);
      double v5 = (void *)v34[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v33, 8);
    qword_100043030 = (uint64_t)v6;
    uint64_t v33 = 0;
    unsigned int v34 = &v33;
    uint64_t v35 = 0x2050000000;
    CFStringRef v7 = (void *)qword_1000430D8;
    uint64_t v36 = qword_1000430D8;
    if (!qword_1000430D8)
    {
      BOOL v28 = _NSConcreteStackBlock;
      uint64_t v29 = 3221225472;
      int v30 = sub_10001C07C;
      v31 = &unk_100035348;
      v32 = &v33;
      sub_10001C07C((uint64_t)&v28);
      CFStringRef v7 = (void *)v34[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v33, 8);
    qword_100043038 = (uint64_t)v8;
    uint64_t v33 = 0;
    unsigned int v34 = &v33;
    uint64_t v35 = 0x2050000000;
    uint64_t v9 = (void *)qword_1000430E0;
    uint64_t v36 = qword_1000430E0;
    if (!qword_1000430E0)
    {
      BOOL v28 = _NSConcreteStackBlock;
      uint64_t v29 = 3221225472;
      int v30 = sub_10001C0D4;
      v31 = &unk_100035348;
      v32 = &v33;
      sub_10001C0D4((uint64_t)&v28);
      uint64_t v9 = (void *)v34[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v33, 8);
    qword_100043040 = (uint64_t)v10;
    uint64_t v33 = 0;
    unsigned int v34 = &v33;
    uint64_t v35 = 0x2050000000;
    uint64_t v11 = (void *)qword_1000430E8;
    uint64_t v36 = qword_1000430E8;
    if (!qword_1000430E8)
    {
      BOOL v28 = _NSConcreteStackBlock;
      uint64_t v29 = 3221225472;
      int v30 = sub_10001C12C;
      v31 = &unk_100035348;
      v32 = &v33;
      sub_10001C12C((uint64_t)&v28);
      uint64_t v11 = (void *)v34[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v33, 8);
    qword_100043048 = (uint64_t)v12;
    uint64_t v33 = 0;
    unsigned int v34 = &v33;
    uint64_t v35 = 0x2050000000;
    uint64_t v13 = (void *)qword_1000430F0;
    uint64_t v36 = qword_1000430F0;
    if (!qword_1000430F0)
    {
      BOOL v28 = _NSConcreteStackBlock;
      uint64_t v29 = 3221225472;
      int v30 = sub_10001C184;
      v31 = &unk_100035348;
      v32 = &v33;
      sub_10001C184((uint64_t)&v28);
      uint64_t v13 = (void *)v34[3];
    }
    id v14 = v13;
    _Block_object_dispose(&v33, 8);
    qword_100043050 = (uint64_t)v14;
    uint64_t v33 = 0;
    unsigned int v34 = &v33;
    uint64_t v35 = 0x2050000000;
    double v15 = (void *)qword_1000430F8;
    uint64_t v36 = qword_1000430F8;
    if (!qword_1000430F8)
    {
      BOOL v28 = _NSConcreteStackBlock;
      uint64_t v29 = 3221225472;
      int v30 = sub_10001C1DC;
      v31 = &unk_100035348;
      v32 = &v33;
      sub_10001C1DC((uint64_t)&v28);
      double v15 = (void *)v34[3];
    }
    id v16 = v15;
    _Block_object_dispose(&v33, 8);
    qword_100043058 = (uint64_t)v16;
    uint64_t v33 = 0;
    unsigned int v34 = &v33;
    uint64_t v35 = 0x2050000000;
    double v17 = (void *)qword_100043100;
    uint64_t v36 = qword_100043100;
    if (!qword_100043100)
    {
      BOOL v28 = _NSConcreteStackBlock;
      uint64_t v29 = 3221225472;
      int v30 = sub_10001C234;
      v31 = &unk_100035348;
      v32 = &v33;
      sub_10001C234((uint64_t)&v28);
      double v17 = (void *)v34[3];
    }
    id v18 = v17;
    _Block_object_dispose(&v33, 8);
    qword_100043060 = (uint64_t)v18;
    uint64_t v33 = 0;
    unsigned int v34 = &v33;
    uint64_t v35 = 0x2050000000;
    unsigned int v26 = (void *)qword_100043108;
    uint64_t v36 = qword_100043108;
    if (!qword_100043108)
    {
      uint64_t v29 = 3221225472;
      int v30 = sub_10001C28C;
      v31 = &unk_100035348;
      v32 = &v33;
      sub_10001C28C((uint64_t)&v28, v19, v20, v21, v22, v23, v24, v25, (uint8_t)_NSConcreteStackBlock);
      unsigned int v26 = (void *)v34[3];
    }
    id v27 = v26;
    _Block_object_dispose(&v33, 8);
    qword_100043068 = (uint64_t)v27;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v28) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "MetricKit is not available", (uint8_t *)&v28, 2u);
  }
}

void sub_10001AB88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10001AFDC(uint64_t a1)
{
  id v2 = objc_opt_new();
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v3 + 16388))
  {
    id v4 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
    [v2 setObject:v4 forKeyedSubscript:@"consecutiveCrashCount"];

    uint64_t v3 = *(void *)(a1 + 32);
  }
  if (*(_DWORD *)(v3 + 16392))
  {
    double v5 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
    [v2 setObject:v5 forKeyedSubscript:@"throttleTimeout"];
  }

  return v2;
}

void sub_10001B85C(id a1)
{
  size_t v1 = 4;
  if (sysctlbyname("kern.max_task_pmem", &dword_100043080, &v1, 0, 0)) {
    dword_100043080 = 0;
  }
}

void sub_10001B8AC(id a1)
{
  size_t v1 = dlopen("/usr/lib/libMemoryResourceException.dylib", 5);
  qword_100043088 = (uint64_t)v1;
  if (!v1)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    id v2 = "EXC_RESOURCE: libMemoryResourceException not found";
    uint64_t v3 = buf;
    goto LABEL_7;
  }
  off_100043090 = dlsym(v1, "ReportMemoryExceptionFromTask");
  if (!off_100043090 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v4 = 0;
    id v2 = "EXC_RESOURCE: ReportMemoryExceptionFromTask not found in libMemoryResourceException";
    uint64_t v3 = (uint8_t *)&v4;
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v2, v3, 2u);
  }
}

void sub_10001B974(id a1)
{
  qword_1000430A0 = (uint64_t)os_log_create("com.apple.osanalytics.ReportCrash", "performance");

  _objc_release_x1();
}

void sub_10001B9B8(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    uint64_t v17 = v2;
    __int16 v18 = 2112;
    uint64_t v19 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "invoking %s %@", buf, 0x16u);
  }
  id v4 = +[NSString stringWithFormat:@"%s %@", *(void *)(a1 + 48), *(void *)(a1 + 32)];
  double v5 = popen((const char *)[v4 UTF8String], "r");
  if (!v5)
  {
    id v12 = *(void **)(a1 + 40);
    +[NSString stringWithFormat:@"Unable to open '%s' (errno %d)", *(void *)(a1 + 48), *__error()];
    double v15 = LABEL_17:;
    [v12 setString:v15];

    goto LABEL_18;
  }
  id v6 = v5;
  fflush(__stdoutp);
  size_t v7 = fread(buf, 1uLL, 0x1000uLL, v6);
  if (v7)
  {
    CFStringRef v8 = @"\n===> TRUNCATED due to error converting diag output to NSString";
    while (1)
    {
      buf[v7] = 0;
      uint64_t v9 = +[NSString stringWithUTF8String:buf];
      if (!v9) {
        break;
      }
      uint64_t v10 = *(void *)(a1 + 56);
      uint64_t v11 = (char *)[*(id *)(a1 + 40) length] + v10;
      if ((char *)[v9 length] + (unint64_t)v11 >= (char *)0xE1000)
      {
        CFStringRef v8 = @"\n===> TRUNCATED due to max allowable diagnostic output";
        break;
      }
      [*(id *)(a1 + 40) appendString:v9];

      size_t v7 = fread(buf, 1uLL, 0x1000uLL, v6);
      if (!v7) {
        goto LABEL_13;
      }
    }
    [*(id *)(a1 + 40) appendString:v8];
  }
LABEL_13:
  if (ferror(v6))
  {
    uint64_t v13 = *(void **)(a1 + 40);
    id v14 = +[NSString stringWithFormat:@"\nError reading output from '%s' (errno %d)", *(void *)(a1 + 48), *__error()];
    [v13 setString:v14];
  }
  if (pclose(v6) == -1)
  {
    id v12 = *(void **)(a1 + 40);
    +[NSString stringWithFormat:@"\nError closing pipe of '%s' (errno %d)", *(void *)(a1 + 48), *__error()];
    goto LABEL_17;
  }
LABEL_18:
}

uint64_t sub_10001BC4C()
{
  if (!qword_1000430B0) {
    qword_1000430B0 = _sl_dlopen();
  }
  return qword_1000430B0;
}

uint64_t sub_10001BD1C()
{
  uint64_t result = _sl_dlopen();
  qword_1000430B0 = result;
  return result;
}

uint64_t sub_10001BD90()
{
  if (!qword_1000430B8) {
    qword_1000430B8 = _sl_dlopen();
  }
  return qword_1000430B8;
}

uint64_t sub_10001BE60()
{
  uint64_t result = _sl_dlopen();
  qword_1000430B8 = result;
  return result;
}

void sub_10001BED4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MXSourceUtilities");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000430C0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_100024118();
    sub_10001BF2C();
  }
}

void sub_10001BF2C()
{
  if (!sub_10001BD90())
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void sub_10001BF7C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MXCallStackThread");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000430C8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_100024140();
    sub_10001BFD4();
  }
}

void sub_10001BFD4()
{
  if (!sub_10001BC4C())
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class sub_10001C024(uint64_t a1)
{
  sub_10001BFD4();
  Class result = objc_getClass("MXCallStackFrame");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000430D0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_100024168();
    return (Class)sub_10001C07C(v3);
  }
  return result;
}

Class sub_10001C07C(uint64_t a1)
{
  sub_10001BFD4();
  Class result = objc_getClass("MXMetaData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000430D8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_100024190();
    return (Class)sub_10001C0D4(v3);
  }
  return result;
}

Class sub_10001C0D4(uint64_t a1)
{
  sub_10001BFD4();
  Class result = objc_getClass("MXCallStackTree");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000430E0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_1000241B8();
    return (Class)sub_10001C12C(v3);
  }
  return result;
}

Class sub_10001C12C(uint64_t a1)
{
  sub_10001BFD4();
  Class result = objc_getClass("MXCrashDiagnostic");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000430E8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_1000241E0();
    return (Class)sub_10001C184(v3);
  }
  return result;
}

Class sub_10001C184(uint64_t a1)
{
  sub_10001BF2C();
  Class result = objc_getClass("MXReportCrashData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000430F0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_100024208();
    return (Class)sub_10001C1DC(v3);
  }
  return result;
}

Class sub_10001C1DC(uint64_t a1)
{
  sub_10001BF2C();
  Class result = objc_getClass("MXSourceManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000430F8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_100024230();
    return (Class)sub_10001C234(v3);
  }
  return result;
}

Class sub_10001C234(uint64_t a1)
{
  sub_10001BFD4();
  Class result = objc_getClass("MXSignpostRecord");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100043100 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_100024258();
    return (Class)sub_10001C28C(v3);
  }
  return result;
}

void sub_10001C28C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  sub_10001BFD4();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("MXCrashDiagnosticObjectiveCExceptionReason");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100043108 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v10 = (void *)sub_100024280();
    sub_10001C2E4(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

void sub_10001C2E4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_10001C300(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10001C31C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_10001C628()
{
  mach_msg_return_t v1;
  mach_error_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _opaque_pthread_t *v10;
  _opaque_pthread_t *v11;
  void *v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  char v30;
  void *v31;
  id v32;
  __CFString *v33;
  __CFString *v34;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  CFStringRef v40;
  CFStringRef v41;
  CFStringRef v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  __CFString *v47;
  qos_class_t v48;
  char v49;
  __CFNotificationCenter *DistributedCenter;
  CFDictionaryRef v51;
  __CFNotificationCenter *v52;
  CFDictionaryRef v53;
  void *v54;
  void *v55;
  __CFString *v56;
  __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  id v62;
  id v63;
  id v64;
  __CFString *v65;
  id v66;
  __CFString *v67;
  void *v68;
  unint64_t v69;
  id v70;
  unsigned __int8 v71;
  id v72;
  id v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  __CFString *v83;
  unsigned int v84;
  __CFString *v85;
  id v86;
  id v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  __CFString *v93;
  unsigned int v94;
  void *v95;
  id v96;
  qos_class_t v97[2];
  uint64_t v98;
  id (*v99)(void *);
  void *v100;
  __CFString *v101;
  __CFString *v102;
  unint64_t v103;
  id v104;
  qos_class_t __qos_class[2];
  long long v106;
  void *v107;
  __CFString *v108;
  id v109;
  id v110;
  id v111;
  id v112;
  CFStringRef v113;
  id v114;
  void v115[2];
  void v116[2];
  uint8_t buf[8];
  long long v118;
  void *v119;
  __CFString *v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  __CFString *v126;
  __CFString *v127;
  __CFString *v128;
  id v129;
  id v130;
  void v131[5];
  int __relative_priority[2];
  CFStringRef v133;
  CFStringRef v134;
  CFStringRef v135;
  __CFString *v136;

  size_t v1 = mach_msg_server_once((BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))sub_10001D294, 0x8000u, dword_100043128, 50331648);
  if (v1)
  {
    uint64_t v2 = v1;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v2;
      LOWORD(v118) = 2080;
      *(void *)((char *)&v118 + 2) = mach_error_string(v2);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "mach_msg_server_once() failed with error %d: %s", buf, 0x12u);
    }
    goto LABEL_77;
  }
  uint64_t v3 = +[NSThread currentThread];
  id v4 = [v3 threadDictionary];

  double v5 = [v4 objectForKeyedSubscript:@"OSACrashReport"];
  id v6 = v5;
  if (v5)
  {
    [v5 loadBundleInfo];
    size_t v7 = [v6 getNotificationInfo];
    CFStringRef v8 = v7;
    if (v7)
    {
      if (([v7 urgentSubmission] & 1) != 0
        || (objc_msgSend(v6, "is_simulated") & 1) == 0
        && ([v8 visibleName], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "maintaining thread qos for (possibly) time-sensitive report", buf, 2u);
        }
        goto LABEL_15;
      }
    }
  }
  else
  {
    CFStringRef v8 = 0;
  }
  __qos_class[0] = QOS_CLASS_UNSPECIFIED;
  v97[0] = QOS_CLASS_UNSPECIFIED;
  __relative_priority[0] = 0;
  uint64_t v10 = pthread_self();
  pthread_get_qos_class_np(v10, __qos_class, __relative_priority);
  pthread_set_qos_class_self_np(QOS_CLASS_UTILITY, 0);
  uint64_t v11 = pthread_self();
  pthread_get_qos_class_np(v11, v97, __relative_priority);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(qos_class_t *)&uint8_t buf[4] = __qos_class[0];
    LOWORD(v118) = 1024;
    *(qos_class_t *)((char *)&v118 + 2) = v97[0];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "post-exception thread qos drop %d -> %d", buf, 0xEu);
  }
  if (!v6) {
    goto LABEL_74;
  }
LABEL_15:
  uint64_t v12 = objc_opt_new();
  if (qword_100043118) {
    objc_msgSend(v6, "setApplicationSpecificInformation:", objc_msgSend((id)qword_100043118, "bytes"));
  }
  if (qword_100043110) {
    [v12 setObject:qword_100043110 forKeyedSubscript:kOSALogOptionOverridePath];
  }
  v95 = v8;
  v81 = v4;
  uint64_t v13 = [v6 getObserverInfo];
  if (v13) {
    [v12 setObject:v13 forKeyedSubscript:kOSALogOptionObserverInfo];
  }
  v79 = (void *)v13;
  v80 = v12;
  uint64_t v14 = [v6 saveWithOptions:v12];
  v78 = objc_msgSend(v6, "decode_reason");
  uint64_t v15 = [v78 objectForKeyedSubscript:@"namespace"];
  [v6 donateToBiome];
  v71 = objc_msgSend(v6, "is_simulated");
  v84 = [v6 exceptionType];
  uint64_t v16 = [v6 procName];
  v89 = objc_msgSend(v6, "bundle_id");
  v92 = objc_msgSend(v6, "short_vers");
  v76 = objc_msgSend(v6, "decode_exceptionCodes");
  v75 = [v76 allValues];
  uint64_t v17 = [v75 componentsJoinedByString:&stru_100035B30];
  v77 = (void *)v15;
  if (v15) {
    __int16 v18 = (__CFString *)v15;
  }
  else {
    __int16 v18 = @"<none>";
  }
  uint64_t v19 = [v6 terminationReasonExceptionCode];
  v94 = v14;
  v82 = v0;
  if (v14)
  {
    v91 = [v6 logfile];
  }
  else
  {
    v91 = 0;
  }
  v69 = (unint64_t)[v6 crashingAddress];
  v64 = [v6 sharedCacheAddress];
  uint64_t v20 = [v6 incidentID];
  v74 = [v6 responsibleProc];
  uint64_t v21 = [v6 coalitionName];
  uint64_t v22 = [v6 logWritingSignature];
  if (v94)
  {
    uint64_t v23 = [v6 oldLogFile];
  }
  else
  {
    uint64_t v23 = 0;
  }
  uint64_t v24 = v16;
  v90 = v89;
  v88 = v92;
  v83 = v17;
  v93 = v18;
  uint64_t v25 = v19;
  unsigned int v26 = v91;
  v87 = v20;
  id v27 = v21;
  BOOL v28 = v95;
  uint64_t v29 = v22;
  v86 = v23;
  if (v84 == 11) {
    int v30 = 1;
  }
  else {
    int v30 = v71;
  }
  v96 = v28;
  v68 = v23;
  if ((v30 & 1) == 0)
  {
    v67 = v24;
    if (OSARTCIsProcessOfInterest())
    {
      v131[0] = @"crk";
      uint64_t v36 = +[OSASystemConfiguration sharedInstance];
      v37 = [v36 crashReporterKey];
      v38 = v28;
      v39 = (void *)v37;
      id v40 = @"<unknown>";
      id v41 = v83;
      if (!v83) {
        id v41 = @"<unknown>";
      }
      *(void *)__relative_priority = v37;
      v133 = v41;
      v131[1] = @"exceptionCodes";
      v131[2] = @"process";
      if (v24) {
        v42 = v24;
      }
      else {
        v42 = @"<unknown>";
      }
      if (v25) {
        id v40 = v25;
      }
      v134 = v42;
      v135 = v40;
      v131[3] = @"terminationReasonExceptionCode";
      v131[4] = @"terminationReasonNamespace";
      v136 = v93;
      +[NSDictionary dictionaryWithObjects:__relative_priority forKeys:v131 count:5];
      v44 = id v43 = v26;
      rtcsc_send();

      unsigned int v26 = v43;
      uint64_t v24 = v67;

      BOOL v28 = v38;
    }
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&v118 = 3221225472;
    *((void *)&v118 + 1) = sub_10001E9B0;
    v119 = &unk_100035498;
    v65 = v24;
    v120 = v65;
    v63 = v26;
    v45 = v26;
    v121 = v45;
    v73 = v87;
    v122 = v73;
    v66 = v90;
    v123 = v66;
    v124 = v88;
    uint64_t v46 = v28;
    v125 = v46;
    __int16 v47 = v83;
    v126 = v47;
    v127 = v25;
    v128 = v93;
    v62 = v27;
    v129 = v62;
    v130 = v29;
    AnalyticsSendEventLazyHighPriority();
    if (v84 == 1 && (v69 & 0xFFFFFFFFFFFFFFLL) - 0x180000000 <= (unint64_t)&_mh_execute_header)
    {
      *(void *)v97 = _NSConcreteStackBlock;
      v98 = 3221225472;
      v99 = sub_10001EB3C;
      v100 = &unk_1000354C0;
      v101 = v65;
      v103 = v69;
      v104 = v64;
      v102 = v47;
      AnalyticsSendEventLazy();
    }
    uint64_t v48 = objc_msgSend(v46, "isBeta", v62);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __qos_class[0] = 67240450;
      __qos_class[1] = v48;
      LOWORD(v106) = 2114;
      *(void *)((char *)&v106 + 2) = v45;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "recordCrashEvent; isBeta %{public}d, log: '%{public}@'",
        (uint8_t *)__qos_class,
        0x12u);
    }
    if ([v45 length])
    {
      if ([v46 urgentSubmission])
      {
        __int16 v49 = v48 ^ 1;
        if (!v66) {
          __int16 v49 = 1;
        }
        if ((v49 & 1) == 0)
        {
          DistributedCenter = CFNotificationCenterGetDistributedCenter();
          v115[0] = @"bundleID";
          v115[1] = @"incidentID";
          v116[0] = v66;
          v116[1] = v73;
          __int16 v51 = +[NSDictionary dictionaryWithObjects:v116 forKeys:v115 count:2];
          CFNotificationCenterPostNotification(DistributedCenter, @"com.apple.ReportCrash.beta.bulletin", 0, v51, 1u);
        }
        if (qword_100043148 != -1) {
          dispatch_once(&qword_100043148, &stru_1000354E0);
        }
        dispatch_async((dispatch_queue_t)qword_100043140, &stru_100035500);
      }
      uint64_t v52 = CFNotificationCenterGetDistributedCenter();
      v113 = @"logfiles";
      v114 = v45;
      v53 = +[NSDictionary dictionaryWithObjects:&v114 forKeys:&v113 count:1];
      CFNotificationCenterPostNotification(v52, @"com.apple.ReportCrash.crash", 0, v53, 1u);
    }
    v70 = v29;
    v72 = v27;
    v85 = v25;
    uint64_t v33 = v83;
    unsigned int v34 = v67;
    if (v66)
    {
      if (qword_100043158 != -1) {
        dispatch_once(&qword_100043158, &stru_100035560);
      }
      *(void *)__qos_class = _NSConcreteStackBlock;
      *(void *)&v106 = 3221225472;
      *((void *)&v106 + 1) = sub_10001EE24;
      v107 = &unk_100035588;
      v108 = v65;
      v109 = v66;
      v110 = v86;
      v111 = v45;
      v112 = v46;
      OSAStabilityMonitorEvaluateStabilityForBundleID();
    }
    else
    {
      if (v86) {
        v54 = v86;
      }
      else {
        v54 = v45;
      }
      sub_10001EEC4(v65, v54);
    }

    uint64_t v35 = v96;
    unsigned int v26 = v63;
    goto LABEL_69;
  }
  v31 = [v28 faultingImage];
  v32 = [v31 length];

  uint64_t v33 = v83;
  if (v32)
  {
    v70 = v29;
    v72 = v27;
    v85 = v25;
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&v118 = 3221225472;
    *((void *)&v118 + 1) = sub_10001EF4C;
    v119 = &unk_1000355B0;
    unsigned int v34 = v24;
    v120 = v24;
    uint64_t v35 = v28;
    v121 = v28;
    AnalyticsSendEventLazy();
LABEL_69:

    uint64_t v24 = v34;
    uint64_t v25 = v85;
    uint64_t v29 = v70;
    id v27 = v72;
    BOOL v28 = v35;
  }

  v55 = v87;
  v56 = v33;

  v57 = v24;
  if (v94)
  {

    uint64_t v29 = v27;
    id v27 = (id)v74;
    v58 = v91;
  }
  else
  {
    v58 = v87;
    v55 = (void *)v74;
  }

  [v6 sendToCoreAnalytics];
  CFStringRef v8 = v96;
  id v4 = v81;
  v0 = v82;
LABEL_74:
  v59 = [v4 objectForKeyedSubscript:@"OSAGPUEventReport"];
  v60 = v59;
  if (v59) {
    [v59 saveWithOptions:0];
  }

LABEL_77:
  [(id)qword_100043120 decrement:"complete"];
  return 0;
}

uint64_t sub_10001D294(uint64_t a1, _DWORD *a2)
{
  if (*(_DWORD *)(a1 + 20) == 1091)
  {
    sub_10001D34C();
    uint64_t audit_trailer = os_mach_msg_get_audit_trailer();
    long long v5 = *(_OWORD *)(audit_trailer + 36);
    *(_OWORD *)v7.val = *(_OWORD *)(audit_trailer + 20);
    *(_OWORD *)&v7.val[4] = v5;
    if (audit_token_to_pid(&v7))
    {
      return 0;
    }
    else
    {
      *a2 = 0;
      a2[2] = 0;
      [(id)qword_100043120 increment:"gpu_event"];
      return sub_10001D41C((const char *)(a1 + 24), *(_DWORD *)(a1 + 4) - 24);
    }
  }
  else
  {
    return sub_10001F734((_DWORD *)a1, (uint64_t)a2);
  }
}

BOOL sub_10001D34C()
{
  pthread_t v12 = 0;
  memset(&v13, 0, sizeof(v13));
  int v0 = pthread_attr_init(&v13);
  int v1 = pthread_attr_setdetachstate(&v13, 2) | v0;
  int v2 = v1 | pthread_create(&v12, &v13, (void *(__cdecl *)(void *))sub_10001C628, 0);
  pthread_attr_destroy(&v13);
  if (v2)
  {
    BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v3) {
      sub_1000242A8(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return v2 == 0;
}

uint64_t sub_10001D41C(const char *a1, unsigned int a2)
{
  uint64_t v2 = 0;
  if (a1 && a2 >= 4)
  {
    int v5 = *(_DWORD *)a1;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      LODWORD(v17[0]) = v5;
      WORD2(v17[0]) = 1024;
      *(_DWORD *)((char *)v17 + 6) = a2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Handling GPU event version %u, %d bytes", buf, 0xEu);
    }
    if (v5 == 101)
    {
      if ((int)a2 - 8 >= (unint64_t)*((unsigned int *)a1 + 1))
      {
        CFStringRef errorString = 0;
        uint64_t v10 = (void *)IOCFUnserializeBinary(a1 + 8, *((unsigned int *)a1 + 1), kCFAllocatorDefault, 0, &errorString);
        if (v10)
        {
          uint64_t v11 = [[OSAGPUEventReport alloc] initWithDictionary:v10];
          pthread_t v12 = +[NSThread currentThread];
          pthread_attr_t v13 = [v12 threadDictionary];

          [v13 setObject:v11 forKeyedSubscript:@"OSAGPUEventReport"];
          uint64_t v2 = 1;
        }
        else
        {
          uint64_t v2 = 0;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v17[0] = errorString;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unable to deserialize event: %@", buf, 0xCu);
            uint64_t v2 = 0;
          }
        }
      }
      else
      {
        uint64_t v2 = 0;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v6 = *((_DWORD *)a1 + 1);
          *(_DWORD *)buf = 67109376;
          LODWORD(v17[0]) = v6;
          WORD2(v17[0]) = 1024;
          *(_DWORD *)((char *)v17 + 6) = a2;
          uint64_t v7 = "invalid event length %d vs size %d";
          uint32_t v8 = 14;
LABEL_11:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, buf, v8);
          return 0;
        }
      }
    }
    else
    {
      uint64_t v2 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v17[0]) = v5;
        uint64_t v7 = "unrecognized version %d";
        uint32_t v8 = 8;
        goto LABEL_11;
      }
    }
  }
  return v2;
}

uint64_t sub_10001D6C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218240;
    uint64_t v12 = a2;
    __int16 v13 = 2048;
    uint64_t v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "catch_sync_request(%lld, %lld)", (uint8_t *)&v11, 0x16u);
  }
  if (a2 == 1)
  {
    dword_10004312C = 1;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = [(id)qword_100043120 condition];
      int v11 = 67109120;
      LODWORD(v12) = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "external sync request, waiting for %d active threads", (uint8_t *)&v11, 8u);
    }
    [(id)qword_100043120 waitForAll];
    dword_10004312C = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = objc_msgSend((id)qword_100043120, "total_count");
      int v11 = 67109120;
      LODWORD(v12) = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sync complete after %d total events", (uint8_t *)&v11, 8u);
    }
    uint64_t v9 = (int)objc_msgSend((id)qword_100043120, "total_count");
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unknown request", (uint8_t *)&v11, 2u);
    }
    uint64_t v9 = -1;
  }
  *a4 = v9;
  sub_10001D34C();
  return 0;
}

uint64_t sub_10001D8A4()
{
  BOOL v0 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v0) {
    sub_1000242E4(v0, v1, v2, v3, v4, v5, v6, v7);
  }
  return 5;
}

uint64_t sub_10001D8D8()
{
  BOOL v0 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v0) {
    sub_100024320(v0, v1, v2, v3, v4, v5, v6, v7);
  }
  return 5;
}

uint64_t sub_10001D90C(mach_port_t a1, task_id_token_t a2, uint64_t a3, uint64_t a4, mach_port_name_t a5, int a6, uint64_t *a7, unsigned int a8, unsigned int a9, uint64_t a10, int a11, _OWORD *a12)
{
  kern_return_t v38;
  int v39;
  BOOL v40;
  const char *v41;
  mach_error_t v42;
  void *v43;
  OSACrashReport *v44;
  const char *v45;
  unsigned int v46;
  void *v47;
  OSACrashReport *v48;
  OSACrashReport *v49;
  const char *v50;
  unsigned int v51;
  void *v52;
  char *v53;
  uint64_t v54;
  void *v55;
  mach_vm_size_t kcd_size;
  int x[2];
  unsigned int object_addr;
  unsigned int object_type;
  mach_port_t task_port;
  unsigned char atoken[38];

  uint64_t v20 = (uint64_t)[(id)qword_100043120 increment:"event"];
  if (!dword_10004312C) {
    sub_10001D34C();
  }
  long long v21 = a12[1];
  *(_OWORD *)atoken = *a12;
  *(_OWORD *)&atoken[16] = v21;
  task_port = 0;
  if (audit_token_to_pid((audit_token_t *)atoken))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)atoken = 0;
      uint64_t v22 = "Will not report from invalid source";
      uint32_t v23 = 2;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v22, atoken, v23);
      return 5;
    }
    return 5;
  }
  if (a6 != 13)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)atoken = 67240192;
      *(_DWORD *)&atoken[4] = a6;
      uint64_t v22 = "Will not write report for unsupported exception: %{public}i";
      uint32_t v23 = 8;
      goto LABEL_16;
    }
    return 5;
  }
  object_addr = 0;
  object_type = 0;
  if (a2)
  {
    if (a1) {
      sub_1000243F8();
    }
    uint64_t v24 = 5;
    if (!mach_port_kernel_object(mach_task_self_, a2, &object_type, &object_addr) && object_type == 50)
    {
      uint64_t v24 = task_identity_token_get_task_port(a2, 0, &task_port);
      if (v24)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10002435C(v24);
        }
      }
    }
    goto LABEL_36;
  }
  if (!a5)
  {
    if (mach_port_kernel_object(mach_task_self_, a1, &object_type, &object_addr)) {
      BOOL v27 = 0;
    }
    else {
      BOOL v27 = object_type == 2;
    }
    if (v27 && !mach_port_kernel_object(mach_task_self_, a3, &object_type, &object_addr) && object_type == 1)
    {
      task_port = a1;
      uint64_t v24 = 5;
      if (!a1) {
        return v24;
      }
LABEL_37:
      if (v20 < 6)
      {
        int v26 = 0;
        goto LABEL_39;
      }
      x[0] = -1;
      goto LABEL_45;
    }
    uint64_t v24 = 5;
LABEL_36:
    a1 = task_port;
    if (!task_port) {
      return v24;
    }
    goto LABEL_37;
  }
  uint64_t v24 = mach_port_kernel_object(mach_task_self_, a5, &object_type, &object_addr);
  if (v24 || object_type != 52)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = mach_error_string(v24);
      *(_DWORD *)atoken = 67109634;
      *(_DWORD *)&atoken[4] = v24;
      *(_WORD *)&atoken[8] = 2080;
      *(void *)&atoken[10] = v29;
      *(_WORD *)&atoken[18] = 1024;
      *(_DWORD *)&atoken[20] = object_type;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "object check returned 0x%x (%s) type %u (expected IKOT_KCDATA)", atoken, 0x18u);
    }
    goto LABEL_36;
  }
  if (v20 < 6)
  {
    uint64_t v24 = 0;
    int v26 = 1;
LABEL_39:
    int v30 = +[NSThread currentThread];
    v31 = [v30 threadDictionary];

    if (task_port)
    {
      if (a8 < 2)
      {
        uint64_t v33 = a10;
        unsigned int v34 = v55;
        if (a8) {
          uint64_t v32 = *a7;
        }
        else {
          uint64_t v32 = 13;
        }
        uint64_t v35 = v31;
        int v37 = a11;
        uint64_t v36 = a9;
      }
      else
      {
        uint64_t v32 = *a7;
        uint64_t v33 = a10;
        unsigned int v34 = v55;
        uint64_t v35 = v31;
        int v37 = a11;
        uint64_t v36 = a9;
        if (*a7 == 10)
        {
          if (a7[1] == 0x100000007) {
            uint64_t v32 = 11;
          }
          else {
            uint64_t v32 = 10;
          }
        }
      }
      uint64_t v48 = [OSACrashReport alloc];
      LODWORD(v54) = v37;
      __int16 v49 = [(OSACrashReport *)v48 initWithTask:task_port exceptionType:v32 thread:a3 threadId:a4 threadStateFlavor:v36 threadState:v33 threadStateCount:v54];
      [(OSACrashReport *)v49 autopsyCorpse];
      if (v49)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          if ([(OSACrashReport *)v49 is_simulated]) {
            double v50 = "simulated";
          }
          else {
            double v50 = "fatal";
          }
          __int16 v51 = [(OSACrashReport *)v49 proc_id];
          uint64_t v52 = [(OSACrashReport *)v49 procName];
          *(_DWORD *)atoken = 136446978;
          *(void *)&atoken[4] = v50;
          *(_WORD *)&atoken[12] = 2080;
          *(void *)&atoken[14] = "corpse";
          *(_WORD *)&atoken[22] = 1024;
          *(_DWORD *)&atoken[24] = v51;
          *(_WORD *)&atoken[28] = 2114;
          *(void *)&atoken[30] = v52;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Formulating %{public}s 309 report for %s[%d] %{public}@", atoken, 0x26u);
        }
        [v35 setObject:v49 forKeyedSubscript:@"OSACrashReport"];
      }

      uint64_t v24 = 0;
    }
    else if (v26)
    {
      kcd_size = 0;
      *(void *)x = 0;
      v42 = task_map_kcdata_object_64(mach_task_self_, a5, (mach_vm_address_t *)x, &kcd_size);
      uint64_t v35 = v31;
      if (*(void *)x && kcd_size)
      {
        if (qword_100043138 != -1) {
          dispatch_once(&qword_100043138, &stru_100035470);
        }
        unsigned int v34 = v55;
        if (byte_100043130)
        {
          id v43 = +[NSData dataWithBytes:*(void *)x length:kcd_size];
          [v43 writeToFile:@"/tmp/lw_kcdata.bin" atomically:1];

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)atoken = 134218240;
            *(void *)&atoken[4] = *(void *)x;
            *(_WORD *)&atoken[12] = 2048;
            *(void *)&atoken[14] = kcd_size;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "*** saved lightweight corpse at 0X%llX size %llu as /tmp/lw_kcdata.bin", atoken, 0x16u);
          }
        }
        LODWORD(v54) = a11;
        id v44 = [[OSACrashReport alloc] initWithTask:0 exceptionType:13 thread:0 threadId:-1 threadStateFlavor:a9 threadState:a10 threadStateCount:v54];
        [(OSACrashReport *)v44 autopsyLightweightCorpse:*(void *)x size:kcd_size];
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          if ([(OSACrashReport *)v44 is_simulated]) {
            v45 = "simulated";
          }
          else {
            v45 = "fatal";
          }
          uint64_t v46 = [(OSACrashReport *)v44 proc_id];
          __int16 v47 = [(OSACrashReport *)v44 procName];
          *(_DWORD *)atoken = 136446978;
          *(void *)&atoken[4] = v45;
          *(_WORD *)&atoken[12] = 2080;
          *(void *)&atoken[14] = "corpse";
          *(_WORD *)&atoken[22] = 1024;
          *(_DWORD *)&atoken[24] = v46;
          *(_WORD *)&atoken[28] = 2114;
          *(void *)&atoken[30] = v47;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Formulating %{public}s 308 report for %s[%d] %{public}@", atoken, 0x26u);
        }
        [v31 setObject:v44 forKeyedSubscript:@"OSACrashReport"];
        mach_vm_deallocate(mach_task_self_, *(mach_vm_address_t *)x, kcd_size);
      }
      else
      {
        unsigned int v34 = v55;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v53 = mach_error_string(v42);
          *(_DWORD *)atoken = 67109378;
          *(_DWORD *)&atoken[4] = v42;
          *(_WORD *)&atoken[8] = 2080;
          *(void *)&atoken[10] = v53;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unable to map kcdata object 0x%x (%s)", atoken, 0x12u);
        }
      }
    }
    else
    {
      unsigned int v34 = v55;
      uint64_t v35 = v31;
    }

    goto LABEL_82;
  }
  a1 = task_port;
  x[0] = -1;
  if (!task_port)
  {
    uint64_t v24 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)atoken = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Too many events in rapid succession! (pid unavailable for lw-corpse)", atoken, 2u);
      uint64_t v24 = 0;
    }
    goto LABEL_82;
  }
  uint64_t v24 = 0;
LABEL_45:
  v38 = pid_for_task(a1, x);
  v39 = x[0];
  id v40 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v38 || v39 == -1)
  {
    if (v40)
    {
      *(_DWORD *)atoken = 67109120;
      *(_DWORD *)&atoken[4] = v38;
      id v41 = "Too many events in rapid succession! (pid retrieval failed: %d)";
      goto LABEL_51;
    }
  }
  else if (v40)
  {
    *(_DWORD *)atoken = 67109120;
    *(_DWORD *)&atoken[4] = x[0];
    id v41 = "Too many events in rapid succession! pid %d";
LABEL_51:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v41, atoken, 8u);
  }
LABEL_82:
  if (a2 && task_port) {
    mach_port_deallocate(mach_task_self_, task_port);
  }
  return v24;
}

void sub_10001E194(id a1)
{
  id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.osanalytics"];
  uint64_t v1 = +[OSASystemConfiguration sharedInstance];
  unsigned int v2 = [v1 appleInternal];
  if (v2) {
    LOBYTE(v2) = [v3 BOOLForKey:@"PersistLWCorpse"];
  }
  byte_100043130 = v2;
}

uint64_t sub_10001E220(uint64_t a1, uint64_t a2, mach_port_t a3, int a4, uint64_t *a5, unsigned int a6, unsigned int *a7, uint64_t a8, unsigned int a9, uint64_t a10, int *a11, _OWORD *a12)
{
  BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v19) {
    sub_1000244B4(v19, v20, v21, v22, v23, v24, v25, v26);
  }
  unsigned int v27 = *a7;
  long long v28 = a12[1];
  v33[0] = *a12;
  v33[1] = v28;
  uint64_t v29 = sub_10001D90C(a3, 0, a2, -1, 0, a4, a5, a6, v27, a8, a9, v33);
  if (!v29)
  {
    if (*a11 == a9)
    {
      unsigned int v30 = a9;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100024424(a11, a9);
      }
      unsigned int v30 = *a11;
    }
    if (v30 >= a9) {
      unsigned int v30 = a9;
    }
    *a11 = v30;
    if (v30)
    {
      unint64_t v31 = 0;
      do
      {
        *(_DWORD *)(a10 + 4 * v31) = *(_DWORD *)(a8 + 4 * v31);
        ++v31;
      }
      while (v31 < *a11);
    }
    mach_port_deallocate(mach_task_self_, a2);
    mach_port_deallocate(mach_task_self_, a3);
  }
  return v29;
}

uint64_t sub_10001E384(uint64_t a1, uint64_t a2, task_id_token_t a3, int a4, uint64_t *a5, unsigned int a6, _OWORD *a7)
{
  BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v13) {
    sub_1000244F0(v13, v14, v15, v16, v17, v18, v19, v20);
  }
  long long v21 = a7[1];
  v24[0] = *a7;
  v24[1] = v21;
  uint64_t v22 = sub_10001D90C(0, a3, 0, a2, 0, a4, a5, a6, 1u, 0, 0, v24);
  if (!v22) {
    mach_port_deallocate(mach_task_self_, a3);
  }
  return v22;
}

uint64_t sub_10001E450(uint64_t a1, mach_port_name_t a2, int a3, uint64_t *a4, unsigned int a5, _OWORD *a6)
{
  BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v11) {
    sub_10002452C(v11, v12, v13, v14, v15, v16, v17, v18);
  }
  long long v19 = a6[1];
  v22[0] = *a6;
  v22[1] = v19;
  uint64_t v20 = sub_10001D90C(0, 0, 0, -1, a2, a3, a4, a5, 1u, 0, 0, v22);
  if (!v20) {
    mach_port_deallocate(mach_task_self_, a2);
  }
  return v20;
}

BOOL sub_10001E518(const char *a1)
{
  kern_return_t v11;
  kern_return_t v12;

  if (!strcmp(a1, "agent"))
  {
    uint64_t v10 = "com.apple.ReportCrash";
  }
  else
  {
    if (strcmp(a1, "daemon"))
    {
      BOOL result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_100024604(result, v3, v4, v5, v6, v7, v8, v9);
        return 0;
      }
      return result;
    }
    uint64_t v10 = "com.apple.ReportCrash.DirectoryService";
  }
  BOOL v11 = bootstrap_check_in(bootstrap_port, v10, (mach_port_t *)&dword_100043128);
  if (!v11) {
    return 1;
  }
  uint64_t v12 = v11;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100024568(v12);
  }
  BOOL result = 0;
  dword_100043128 = 0;
  return result;
}

void start(int a1, uint64_t a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (a1 == 2) {
      uint64_t v4 = *(const char **)(a2 + 8);
    }
    else {
      uint64_t v4 = "unsupported";
    }
    mach_port_t buf = 136446210;
    uint64_t v35 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ReportCrash (unified) launched in %{public}s mode", (uint8_t *)&buf, 0xCu);
  }
  if (a1 == 2 && sub_10001E518(*(const char **)(a2 + 8)))
  {
    CRCreateDirectoryStructure();
    getpid();
    proc_disable_cpumon();
    uint64_t v6 = +[OSAReport bootArgs];
    if (([v6 containsString:@"-restore"] & 1) != 0
      || [v6 containsString:@"-upgrade"])
    {
      uint64_t v7 = (void *)qword_100043110;
      qword_100043110 = @"/private/var/logs/ramrod";

      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v8 = [&off_10003D678 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (!v8) {
        goto LABEL_25;
      }
      id v9 = v8;
      uint64_t v10 = *(void *)v30;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(&off_10003D678);
          }
          uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v13 = +[NSFileManager defaultManager];
          LODWORD(v12) = [v13 fileExistsAtPath:v12];

          if (v12)
          {
            uint64_t v15 = (void *)qword_100043110;
            qword_100043110 = @"/private/var/logs/restored";

            goto LABEL_25;
          }
        }
        id v9 = [&off_10003D678 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v9);
LABEL_25:
      mach_port_t buf = 0;
      if (!IOMainPort(bootstrap_port, &buf))
      {
        io_registry_entry_t v16 = IORegistryEntryFromPath(buf, "IODeviceTree:/options");
        if (v16)
        {
          io_object_t v17 = v16;
          CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v16, @"ota-uuid", kCFAllocatorDefault, 0);
          if (CFProperty)
          {
            long long v19 = (void *)CFProperty;
            CFTypeID v20 = CFGetTypeID(CFProperty);
            if (v20 == CFDataGetTypeID())
            {
              id v21 = [v19 mutableCopy];
              [v21 appendBytes:&unk_1000293E8 length:1];
              uint64_t v22 = (void *)qword_100043118;
              qword_100043118 = (uint64_t)v21;
            }
            CFRelease(v19);
          }
          IOObjectRelease(v17);
        }
      }
    }

    uint64_t v23 = +[OSASystemConfiguration sharedInstance];
    unsigned __int8 v24 = [v23 appleInternal];
    int BoolValue = 0;
    if (v24) {
      int BoolValue = OSAPreferencesGetBoolValue();
    }
    dword_10004312C = BoolValue;

    if (dword_10004312C && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SingleShot mode, will exit immediately after handling one exception", (uint8_t *)&buf, 2u);
    }
    uint64_t v26 = objc_alloc_init(RCEventTracker);
    unsigned int v27 = (void *)qword_100043120;
    qword_100043120 = (uint64_t)v26;

    if (sub_10001D34C())
    {
      long long v28 = +[NSRunLoop currentRunLoop];
      [v28 run];

      int v14 = 0;
LABEL_21:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ReportCrash is exiting", (uint8_t *)&buf, 2u);
      }
      exit(v14);
    }
  }
  else
  {
  }
  int v14 = 1;
  goto LABEL_21;
}

id sub_10001E9B0(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  [v2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"process"];
  if (*(void *)(a1 + 40)) {
    uint64_t v3 = &off_10003D468;
  }
  else {
    uint64_t v3 = &off_10003D480;
  }
  [v2 setObject:v3 forKeyedSubscript:@"logwritten"];
  [v2 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"incidentID"];
  [v2 setObject:*(void *)(a1 + 56) forKeyedSubscript:@"bundleID"];
  [v2 setObject:*(void *)(a1 + 64) forKeyedSubscript:@"appVersion"];
  uint64_t v4 = [*(id *)(a1 + 72) bundleVersion];
  [v2 setObject:v4 forKeyedSubscript:@"bundleVersion"];

  [v2 setObject:*(void *)(a1 + 80) forKeyedSubscript:@"exceptionCodes"];
  [v2 setObject:*(void *)(a1 + 88) forKeyedSubscript:@"terminationReasonExceptionCode"];
  [v2 setObject:*(void *)(a1 + 96) forKeyedSubscript:@"terminationReasonNamespace"];
  [v2 setObject:*(void *)(a1 + 104) forKeyedSubscript:@"coalitionName"];
  [v2 setObject:*(void *)(a1 + 112) forKeyedSubscript:@"logWritingSignature"];
  uint64_t v5 = +[OSASystemConfiguration sharedInstance];
  LODWORD(v4) = [v5 isComputeController];

  if (v4) {
    [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:@"isComputeController"];
  }

  return v2;
}

id sub_10001EB3C(void *a1)
{
  v8[0] = a1[4];
  v7[0] = @"process";
  v7[1] = @"exceptionAddress";
  id v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%llx", a1[6], @"process", @"exceptionAddress");
  v8[1] = v2;
  v7[2] = @"sharedCache";
  id v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%llx", a1[7]);
  v7[3] = @"exceptionDescription";
  uint64_t v4 = a1[5];
  v8[2] = v3;
  void v8[3] = v4;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];

  return v5;
}

void sub_10001EC58(id a1)
{
  qword_100043140 = (uint64_t)dispatch_queue_create("com.apple.osanalytics.urgentSubmissions", 0);

  _objc_release_x1();
}

void sub_10001EC98(id a1)
{
  uint64_t v1 = +[OSASystemConfiguration sharedInstance];
  id v2 = [v1 internalKey];

  v9[0] = @"mode";
  v9[1] = @"event";
  v10[0] = @"urgent";
  v10[1] = @"urgentCrash";
  v9[2] = @"legacy-homePath";
  id v3 = NSHomeDirectory();
  uint64_t v4 = [v3 stringByStandardizingPath];
  uint64_t v5 = (void *)v4;
  void v9[3] = @"legacy-internalKey";
  CFStringRef v6 = &stru_100035B30;
  if (v2) {
    CFStringRef v6 = v2;
  }
  v10[2] = v4;
  void v10[3] = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  if (objc_opt_class())
  {
    id v8 = objc_alloc_init((Class)OSASubmissionClient);
    [v8 submitWithOptions:v7 resultsCallback:&stru_100035540];
  }
}

void sub_10001EDE4(id a1)
{
  qword_100043150 = (uint64_t)dispatch_queue_create("com.apple.osanalytics.stabilityMonitorReply", 0);

  _objc_release_x1();
}

void sub_10001EE24(void *a1, int a2)
{
  if (a2)
  {
    id v2 = OSAStabilityMonitorLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFStringRef v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Skipping alerting because rollback was recommended.", v6, 2u);
    }
  }
  else
  {
    uint64_t v4 = (void *)a1[4];
    uint64_t v5 = (void *)a1[6];
    if (!v5) {
      uint64_t v5 = (void *)a1[7];
    }
    sub_10001EEC4(v4, v5);
  }
}

void sub_10001EEC4(void *a1, void *a2)
{
  id v5 = a1;
  id v3 = a2;
  if ([v3 length])
  {
    if (+[AppGroup isALE:v5]) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
    +[OSADiagnosticsReporterSupport handleDiagnosticLog:v4 logPath:v3 completion:0];
  }
}

id sub_10001EF4C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  v6[0] = @"process";
  v6[1] = @"image";
  v7[0] = v2;
  id v3 = [v1 faultingImage];
  v7[1] = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

void sub_10001F000(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t sub_10001F01C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 2412) >= 0xFFFFFFF9) {
    return (uint64_t)*(&off_1000355D0 + 5 * (v1 - 2405) + 5);
  }
  else {
    return 0;
  }
}

uint64_t sub_10001F050(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 2) {
    goto LABEL_3;
  }
  uint64_t v4 = *(unsigned int *)(result + 4);
  if (v4 < 0x44 || v4 > 0x54) {
    goto LABEL_3;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112 || *(unsigned __int16 *)(result + 50) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_3;
  }
  unsigned int v5 = *(_DWORD *)(result + 64);
  if (v5 <= 2 && v5 <= (v4 - 68) >> 3 && v4 == 8 * v5 + 68)
  {
    CFStringRef v6 = (_DWORD *)(((v4 + 3) & 0x1FFFFFFFCLL) + result);
    if (!*v6 && v6[1] > 0x1Fu)
    {
      BOOL result = sub_10001D8A4();
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_4;
    }
    int v3 = -309;
  }
  else
  {
LABEL_2:
    int v3 = -304;
  }
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10001F168(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_17;
  }
  uint64_t v3 = result[1];
  BOOL v4 = v3 < 0x30 || v3 > 0x1480;
  if (v4
    || (unsigned int v5 = result[9], v5 > 2)
    || ((unsigned int v6 = 2 * v5, v5 <= (v3 - 48) >> 3) ? (v7 = v3 >= 8 * v5 + 48) : (v7 = 0),
        !v7
     || (id v8 = &result[v6], v9 = v8[11], v9 > 0x510)
     || ((int v10 = v3 - v6 * 4, v9 <= (v10 - 48) >> 2) ? (v11 = v10 == 4 * v9 + 48) : (v11 = 0), !v11)))
  {
LABEL_17:
    int v12 = -304;
LABEL_18:
    *(_DWORD *)(a2 + 32) = v12;
    NDR_record_t v13 = NDR_record;
    goto LABEL_19;
  }
  int v14 = (_DWORD *)((char *)result + ((v3 + 3) & 0x1FFFFFFFCLL));
  if (*v14 || v14[1] <= 0x1Fu)
  {
    int v12 = -309;
    goto LABEL_18;
  }
  *(_DWORD *)(a2 + 40) = 1296;
  uint64_t v15 = v8 + 10;
  BOOL result = (_DWORD *)sub_10001D8D8();
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v13 = NDR_record;
  if (!result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 36) = *v15;
    *(_DWORD *)(a2 + 4) = 4 * *(_DWORD *)(a2 + 40) + 44;
    return result;
  }
LABEL_19:
  *(NDR_record_t *)(a2 + 24) = v13;
  return result;
}

uint64_t sub_10001F2C0(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 2) {
    goto LABEL_3;
  }
  uint64_t v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x4C || v5 > 0x149C) {
    goto LABEL_3;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112 || *(unsigned __int16 *)(result + 50) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_3;
  }
  unsigned int v7 = *(_DWORD *)(result + 64);
  if (v7 > 2) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (v7 > (v5 - 76) >> 3) {
    goto LABEL_3;
  }
  unsigned int v8 = 8 * v7;
  if (v5 < 8 * v7 + 76) {
    goto LABEL_3;
  }
  uint64_t v9 = result + v8;
  unsigned int v10 = *(_DWORD *)(v9 + 72);
  if (v10 > 0x510 || (int v11 = v5 - v8, v10 > (v11 - 76) >> 2) || v11 != 4 * v10 + 76)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
    goto LABEL_4;
  }
  uint64_t v12 = ((v5 + 3) & 0x1FFFFFFFCLL) + result;
  if (*(_DWORD *)v12 || *(_DWORD *)(v12 + 4) <= 0x1Fu)
  {
    int v3 = -309;
    goto LABEL_3;
  }
  uint64_t v13 = v9 - 16;
  *(_DWORD *)(a2 + 40) = 1296;
  uint64_t v14 = *(unsigned int *)(result + 12);
  uint64_t v15 = *(unsigned int *)(result + 28);
  mach_port_t v16 = *(_DWORD *)(result + 40);
  int v17 = *(_DWORD *)(result + 60);
  uint64_t v18 = (_DWORD *)(v13 + 84);
  long long v19 = *(_OWORD *)(v12 + 36);
  v20[0] = *(_OWORD *)(v12 + 20);
  v20[1] = v19;
  BOOL result = sub_10001E220(v14, v15, v16, v17, (uint64_t *)(result + 68), v7, (unsigned int *)(v13 + 84), v13 + 92, v10, a2 + 44, (int *)(a2 + 40), v20);
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 36) = *v18;
    *(_DWORD *)(a2 + 4) = 4 * *(_DWORD *)(a2 + 40) + 44;
    return result;
  }
LABEL_4:
  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

uint64_t sub_10001F46C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v4 = *(unsigned int *)(result + 4);
  if (v4 < 0x40 || v4 > 0x50) {
    goto LABEL_3;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_3;
  }
  unsigned int v5 = *(_DWORD *)(result + 60);
  if (v5 <= 2 && v5 <= (v4 - 64) >> 3 && v4 == 8 * v5 + 64)
  {
    uint64_t v6 = ((v4 + 3) & 0x1FFFFFFFCLL) + result;
    if (!*(_DWORD *)v6 && *(_DWORD *)(v6 + 4) > 0x1Fu)
    {
      uint64_t v7 = *(unsigned int *)(result + 12);
      uint64_t v8 = *(void *)(result + 48);
      task_id_token_t v9 = *(_DWORD *)(result + 28);
      int v10 = *(_DWORD *)(result + 56);
      long long v11 = *(_OWORD *)(v6 + 36);
      v12[0] = *(_OWORD *)(v6 + 20);
      v12[1] = v11;
      BOOL result = sub_10001E384(v7, v8, v9, v10, (uint64_t *)(result + 64), v5, v12);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_4;
    }
    int v3 = -309;
  }
  else
  {
LABEL_2:
    int v3 = -304;
  }
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10001F574(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v4 = *(unsigned int *)(result + 4);
  if (v4 < 0x38 || v4 > 0x48) {
    goto LABEL_3;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v3 = -300;
    goto LABEL_3;
  }
  unsigned int v5 = *(_DWORD *)(result + 52);
  if (v5 <= 2 && v5 <= (v4 - 56) >> 3 && v4 == 8 * v5 + 56)
  {
    uint64_t v6 = ((v4 + 3) & 0x1FFFFFFFCLL) + result;
    if (!*(_DWORD *)v6 && *(_DWORD *)(v6 + 4) > 0x1Fu)
    {
      uint64_t v7 = *(unsigned int *)(result + 12);
      mach_port_name_t v8 = *(_DWORD *)(result + 28);
      int v9 = *(_DWORD *)(result + 48);
      long long v10 = *(_OWORD *)(v6 + 36);
      v11[0] = *(_OWORD *)(v6 + 20);
      v11[1] = v10;
      BOOL result = sub_10001E450(v7, v8, v9, (uint64_t *)(result + 56), v5, v11);
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_4;
    }
    int v3 = -309;
  }
  else
  {
LABEL_2:
    int v3 = -304;
  }
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10001F678(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 48)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 48) || *(_DWORD *)(result + 52) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
    goto LABEL_8;
  }
  BOOL result = sub_10001D6C0(*(unsigned int *)(result + 12), *(void *)(result + 32), *(void *)(result + 40), (uint64_t *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 44;
    return result;
  }
LABEL_8:
  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

uint64_t sub_10001F734(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 2412) >= 0xFFFFFFF9
    && (unsigned int v5 = (void (*)(void))*(&off_1000355D0 + 5 * (v4 - 2405) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

uint64_t sub_10001F7C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    Hasher.init(_seed:)();
    String.hash(into:)();
    Swift::Int v6 = Hasher._finalize()();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      long long v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          mach_port_t v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

id sub_10001F974()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppGroup();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t variable initialization expression of GenerativeModelsState.currentState()
{
  return 0;
}

void *variable initialization expression of GenerativeModelsState.reasons()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t type metadata accessor for AppGroup()
{
  return self;
}

Swift::Int sub_10001F9E4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_10001FC8C(&qword_100042E50);
    uint64_t v3 = static _SetStorage.allocate(capacity:)();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      Swift::Int v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      Swift::Int result = Hasher._finalize()();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        mach_port_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          long long v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      id v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      void *v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

uint64_t sub_10001FB88(uint64_t a1, uint64_t a2)
{
  sub_10001FC8C(&qword_100042E48);
  uint64_t inited = swift_initStackObject();
  *(void *)(inited + 32) = 0x6F42676E69727053;
  *(_OWORD *)(inited + 16) = xmmword_1000293F0;
  *(void *)(inited + 40) = 0xEB00000000647261;
  *(void *)(inited + 48) = 0x72616F626B636162;
  *(void *)(inited + 56) = 0xEA00000000006464;
  *(void *)(inited + 64) = 0x6F69747265737361;
  *(void *)(inited + 72) = 0xEA0000000000646ELL;
  Swift::Int v5 = sub_10001F9E4(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  LOBYTE(a2) = sub_10001F7C0(a1, a2, v5);
  swift_bridgeObjectRelease();
  return a2 & 1;
}

uint64_t sub_10001FC8C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t GenerativeModelsState.currentState.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_currentState);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t GenerativeModelsState.currentState.setter(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = (void *)(v2 + OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_currentState);
  swift_beginAccess();
  *Swift::Int v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*GenerativeModelsState.currentState.modify())()
{
  return j__swift_endAccess;
}

uint64_t GenerativeModelsState.reasons.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GenerativeModelsState.reasons.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_reasons);
  swift_beginAccess();
  void *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*GenerativeModelsState.reasons.modify())()
{
  return j_j__swift_endAccess;
}

id static GenerativeModelsState.sharedInstance.getter()
{
  if (qword_100042E10 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_100042E58;

  return v0;
}

id GenerativeModelsState.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id GenerativeModelsState.init()()
{
  uint64_t v1 = sub_10001FC8C(&qword_100042E70);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = &v0[OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_currentState];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  *(void *)&v0[OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_reasons] = &_swiftEmptyArrayStorage;
  Swift::Int v5 = (objc_class *)type metadata accessor for GenerativeModelsState();
  v11.receiver = v0;
  v11.super_class = v5;
  id v6 = objc_msgSendSuper2(&v11, "init");
  sub_100020108();
  uint64_t v7 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v3, 1, 1, v7);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = 0;
  void v9[3] = 0;
  void v9[4] = v8;
  sub_100020DE0((uint64_t)v3, (uint64_t)&unk_100042E80, (uint64_t)v9);

  swift_release();
  return v6;
}

size_t sub_100020108()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v6 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v53 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  unint64_t v12 = (char *)&v53 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v53 - v13;
  sub_10001FC8C(&qword_100042EF0);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_100029420;
  *(void *)(v15 + 56) = &type metadata for String;
  *(void *)(v15 + 32) = 0x7474616D79657267;
  *(void *)(v15 + 40) = 0xEA00000000007265;
  sub_10002243C();
  mach_port_t v16 = NSSet.init(arrayLiteral:)();
  BOOL v17 = (void *)AnalyticsQueryValuesFor(arguments:)();

  xpc_type_t type = xpc_get_type(v17);
  if (type != (xpc_type_t)XPC_TYPE_DICTIONARY.getter())
  {
    Logger.init()();
    long long v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v20))
    {
      id v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Analytics query xpc_object is not of type dictionary", v21, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
LABEL_11:
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    long long v30 = (char *)&_swiftEmptyArrayStorage;
LABEL_12:
    long long v31 = (uint64_t *)(v1 + OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_currentState);
    swift_beginAccess();
    uint64_t *v31 = v28;
    v31[1] = v29;
    swift_bridgeObjectRelease();
    long long v32 = (char **)(v1 + OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_reasons);
    swift_beginAccess();
    uint64_t *v32 = v30;
    swift_unknownObjectRelease();
    return swift_bridgeObjectRelease();
  }
  xpc_object_t v22 = xpc_dictionary_get_dictionary(v17, "greymatter");
  if (!v22)
  {
LABEL_8:
    Logger.init()();
    uint64_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      unsigned int v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unsigned int v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Failed to query generative models dictionary", v27, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
    goto LABEL_11;
  }
  BOOL v23 = v22;
  xpc_type_t v24 = xpc_get_type(v22);
  if (v24 != (xpc_type_t)XPC_TYPE_DICTIONARY.getter())
  {
    swift_unknownObjectRelease();
    goto LABEL_8;
  }
  string = xpc_dictionary_get_string(v23, "availability");
  v56 = v23;
  uint64_t v54 = v1;
  if (string)
  {
    uint64_t v28 = String.init(cString:)();
    uint64_t v29 = v35;
  }
  else
  {
    Logger.init()();
    uint64_t v36 = Logger.logObject.getter();
    os_log_type_t v37 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "GM availability string not found", v38, 2u);
      BOOL v23 = v56;
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v14, v2);
    uint64_t v28 = 0;
    uint64_t v29 = 0;
  }
  xpc_object_t v39 = xpc_dictionary_get_value(v23, "reasons");
  if (!v39) {
    goto LABEL_21;
  }
  id v40 = v39;
  xpc_type_t v41 = xpc_get_type(v39);
  if (v41 != (xpc_type_t)XPC_TYPE_ARRAY.getter())
  {
    swift_unknownObjectRelease();
LABEL_21:
    Logger.init()();
    v42 = Logger.logObject.getter();
    os_log_type_t v43 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v42, v43))
    {
      id v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v44 = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "Failed to get reasons array", v44, 2u);
      swift_slowDealloc();
    }

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v12, v2);
LABEL_24:
    long long v30 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v1 = v54;
    goto LABEL_12;
  }
  size_t result = xpc_array_get_count(v40);
  if ((result & 0x8000000000000000) == 0)
  {
    size_t v45 = result;
    if (result)
    {
      size_t v46 = 0;
      long long v30 = (char *)&_swiftEmptyArrayStorage;
      v55 = v40;
      do
      {
        if (xpc_array_get_string(v40, v46))
        {
          uint64_t v48 = String.init(cString:)();
          uint64_t v50 = v49;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            long long v30 = sub_1000215E4(0, *((void *)v30 + 2) + 1, 1, v30);
          }
          unint64_t v52 = *((void *)v30 + 2);
          unint64_t v51 = *((void *)v30 + 3);
          if (v52 >= v51 >> 1) {
            long long v30 = sub_1000215E4((char *)(v51 > 1), v52 + 1, 1, v30);
          }
          *((void *)v30 + 2) = v52 + 1;
          __int16 v47 = &v30[16 * v52];
          *((void *)v47 + 4) = v48;
          *((void *)v47 + 5) = v50;
          id v40 = v55;
        }
        ++v46;
      }
      while (v45 != v46);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      uint64_t v1 = v54;
      goto LABEL_12;
    }
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    goto LABEL_24;
  }
  __break(1u);
  return result;
}

uint64_t sub_10002071C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 48) = a4;
  return _swift_task_switch(sub_10002073C, 0, 0);
}

uint64_t sub_10002073C()
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  v0[7] = Strong;
  if (Strong)
  {
    if (&type metadata accessor for GenerativeModelsAvailability) {
      BOOL v2 = &type metadata for GenerativeModelsAvailability == 0;
    }
    else {
      BOOL v2 = 1;
    }
    if (!v2 && &nominal type descriptor for GenerativeModelsAvailability != 0)
    {
      uint64_t v4 = type metadata accessor for GenerativeModelsAvailability.ChangeSequence.Iterator();
      v0[8] = v4;
      v0[9] = *(void *)(v4 - 8);
      v0[10] = swift_task_alloc();
      uint64_t v5 = type metadata accessor for GenerativeModelsAvailability();
      uint64_t v6 = *(void *)(v5 - 8);
      uint64_t v7 = swift_task_alloc();
      uint64_t v8 = type metadata accessor for GenerativeModelsAvailability.Parameters();
      uint64_t v9 = *(void *)(v8 - 8);
      uint64_t v10 = swift_task_alloc();
      GenerativeModelsAvailability.Parameters.init(useCaseIdentifiers:)();
      static GenerativeModelsAvailability.current(parameters:)();
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v8);
      swift_task_dealloc();
      uint64_t v11 = type metadata accessor for GenerativeModelsAvailability.ChangeSequence();
      uint64_t v12 = *(void *)(v11 - 8);
      uint64_t v13 = swift_task_alloc();
      GenerativeModelsAvailability.changes.getter();
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v5);
      GenerativeModelsAvailability.ChangeSequence.makeAsyncIterator()();
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v11);
      swift_task_dealloc();
      swift_task_dealloc();
      sub_10001FC8C(&qword_100042ED8);
      v0[11] = swift_task_alloc();
      unint64_t v14 = sub_100022394();
      uint64_t v15 = (void *)swift_task_alloc();
      v0[12] = v15;
      void *v15 = v0;
      v15[1] = sub_100020AD4;
      uint64_t v16 = v0[11];
      uint64_t v17 = v0[8];
      return dispatch thunk of AsyncIteratorProtocol.next()(v16, v17, v14);
    }
  }
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_100020AD4()
{
  *(void *)(*(void *)v1 + 104) = v0;
  swift_task_dealloc();
  if (v0) {
    BOOL v2 = sub_100020D5C;
  }
  else {
    BOOL v2 = sub_100020BE8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100020BE8()
{
  uint64_t v1 = v0[11];
  uint64_t v2 = type metadata accessor for GenerativeModelsAvailability.Availability();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2) == 1)
  {
    uint64_t v3 = (void *)v0[7];
    (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v0[1];
    return v4();
  }
  else
  {
    sub_100020108();
    sub_1000223E0(v1, &qword_100042ED8);
    unint64_t v6 = sub_100022394();
    uint64_t v7 = (void *)swift_task_alloc();
    v0[12] = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_100020AD4;
    uint64_t v8 = v0[11];
    uint64_t v9 = v0[8];
    return dispatch thunk of AsyncIteratorProtocol.next()(v8, v9, v6);
  }
}

uint64_t sub_100020D5C()
{
  *(void *)(v0 + 40) = *(void *)(v0 + 104);
  sub_10001FC8C(&qword_100042EE8);
  uint64_t v1 = swift_dynamicCast();
  return _swift_willThrowTypedImpl(v1, &type metadata for Never, &protocol witness table for Never);
}

uint64_t sub_100020DE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1000223E0(a1, &qword_100042E70);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

unint64_t sub_100020F90(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10001FC8C(&qword_100042EB8);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10002223C(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1000216F4(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100022180(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id GenerativeModelsState.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GenerativeModelsState();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_1000211A4()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for GenerativeModelsState()) init];
  qword_100042E58 = (uint64_t)result;
  return result;
}

uint64_t type metadata accessor for GenerativeModelsState()
{
  return self;
}

uint64_t sub_1000211F8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100021230()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100021270()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_10002131C;
  v3[6] = v2;
  return _swift_task_switch(sub_10002073C, 0, 0);
}

uint64_t sub_10002131C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100021410(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000214EC;
  return v6(a1);
}

uint64_t sub_1000214EC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

char *sub_1000215E4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_10001FC8C(&qword_100042E48);
      char v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      BOOL v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      char v10 = (char *)&_swiftEmptyArrayStorage;
      BOOL v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100021EF8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_1000216F4(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100021C2C(a1, a2, v4);
}

uint64_t sub_10002176C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10001FC8C(&qword_100042EB8);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    unsigned int v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unsigned int v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      id v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      xpc_type_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_100022180(v24, v35);
      }
      else
      {
        sub_1000221E0((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      void *v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_100022180(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

_OWORD *sub_100021A6C(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_1000216F4(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_100021D10();
      goto LABEL_7;
    }
    sub_10002176C(v15, a4 & 1);
    unint64_t v21 = sub_1000216F4(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      int64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    unint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    sub_100022190((uint64_t)v19);
    return sub_100022180(a1, v19);
  }
LABEL_13:
  sub_100021BC0(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_100021BC0(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_100022180(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

unint64_t sub_100021C2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

void *sub_100021D10()
{
  uint64_t v1 = v0;
  sub_10001FC8C(&qword_100042EB8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_1000221E0(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = v19;
    v21[1] = v18;
    sub_100022180(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100021EF8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t _s11ReportCrash21GenerativeModelsStateC17getGMAvailabilitySDySSypGyFZ_0()
{
  unint64_t v0 = sub_100020F90((uint64_t)&_swiftEmptyArrayStorage);
  if (qword_100042E10 != -1) {
    swift_once();
  }
  uint64_t v1 = (uint64_t *)(qword_100042E58 + OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_currentState);
  swift_beginAccess();
  uint64_t v2 = v1[1];
  if (v2)
  {
    uint64_t v3 = *v1;
    uint64_t v11 = &type metadata for String;
    *(void *)&long long v10 = v3;
    *((void *)&v10 + 1) = v2;
    sub_100022180(&v10, v9);
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v12 = v0;
    sub_100021A6C(v9, 0x6574617473, 0xE500000000000000, isUniquelyReferenced_nonNull_native);
    unint64_t v0 = v12;
    swift_bridgeObjectRelease();
  }
  unint64_t v5 = (uint64_t *)(qword_100042E58 + OBJC_IVAR____TtC11ReportCrash21GenerativeModelsState_reasons);
  swift_beginAccess();
  uint64_t v6 = *v5;
  if (*(void *)(v6 + 16))
  {
    uint64_t v11 = (void *)sub_10001FC8C(&qword_100042EB0);
    *(void *)&long long v10 = v6;
    sub_100022180(&v10, v9);
    swift_bridgeObjectRetain();
    char v7 = swift_isUniquelyReferenced_nonNull_native();
    sub_100021A6C(v9, 0x736E6F73616572, 0xE700000000000000, v7);
    swift_bridgeObjectRelease();
  }
  return v0;
}

_OWORD *sub_100022180(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100022190(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000221E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10002223C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001FC8C(&qword_100042EC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000222A4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000222DC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_10002131C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100042EC8 + dword_100042EC8);
  return v6(a1, v4);
}

unint64_t sub_100022394()
{
  unint64_t result = qword_100042EE0;
  if (!qword_100042EE0)
  {
    type metadata accessor for GenerativeModelsAvailability.ChangeSequence.Iterator();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100042EE0);
  }
  return result;
}

uint64_t sub_1000223E0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10001FC8C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_10002243C()
{
  unint64_t result = qword_100042EF8;
  if (!qword_100042EF8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100042EF8);
  }
  return result;
}

uint64_t sub_100022484()
{
  sub_100023570();
  uint64_t v0 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v0 - 8);
  static DispatchQoS.unspecified.getter();
  uint64_t v1 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v1);
  v6[1] = &_swiftEmptyArrayStorage;
  sub_1000235B0();
  sub_10001FC8C(&qword_100042F20);
  sub_1000235FC();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  uint64_t v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  __chkstk_darwin(v2);
  (*(void (**)(char *, void))(v4 + 104))((char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:));
  uint64_t result = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  qword_100042F00 = result;
  return result;
}

uint64_t sub_100022670()
{
  id v1 = [v0 problemType];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;

  if (v5)
  {
    if (v3 == 3747891 && v5 == 0xE300000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      uint64_t v5 = 0;
      if ((v7 & 1) == 0) {
        return v5;
      }
    }
    if (([self isInLDM] & 1) == 0)
    {
      id v8 = [v0 procName];
      if (!v8) {
        goto LABEL_25;
      }
      int64_t v9 = v8;
      uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v12 = v11;

      if (v10 == 0xD000000000000018 && v12 == 0x800000010002E030)
      {
        swift_bridgeObjectRelease();
        return 1;
      }
      char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v13 & 1) == 0)
      {
LABEL_25:
        if ([v0 throttleTimeout] < 0xB
          || [v0 throttleTimeout] > 0x4AF
          || (NSString v14 = String._bridgeToObjectiveC()(), v15 = OSARandomSelection(), v14, (v15 & 1) == 0))
        {
          NSString v16 = String._bridgeToObjectiveC()();
          uint64_t v5 = OSARandomSelection();

          return v5;
        }
      }
    }
    return 1;
  }
  return v5;
}

uint64_t sub_10002287C()
{
  unsigned __int8 v12 = 0;
  if ((sub_100022670() & 1) == 0)
  {
    uint64_t v2 = 0;
    uint64_t v3 = 0;
LABEL_10:
    sub_100022DD8((uint64_t)v3);
    return v2;
  }
  if ([self isInLDM]) {
    unint64_t v1 = sub_1000234E4(0x15FuLL) + 75;
  }
  else {
    unint64_t v1 = 10;
  }
  if (qword_100042E18 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_100042F00;
  uint64_t v5 = (void *)swift_allocObject();
  void v5[2] = v1;
  v5[3] = &v12;
  v5[4] = v0;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_100022E20;
  *(void *)(v6 + 24) = v5;
  aBlock[4] = sub_100022E3C;
  aBlock[5] = v6;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100022D7C;
  aBlock[3] = &unk_100035868;
  char v7 = _Block_copy(aBlock);
  id v8 = v0;
  swift_retain();
  swift_release();
  dispatch_sync(v4, v7);
  _Block_release(v7);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    uint64_t v3 = sub_100022E20;
    uint64_t v2 = v12;
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

void sub_100022A6C(unint64_t a1, unsigned char *a2, void *a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = objc_allocWithZone((Class)OSADateCounter);
  NSString v11 = String._bridgeToObjectiveC()();
  id v25 = [v10 initWithIdentifier:v11];

  if ((unint64_t)[v25 count] >= a1)
  {
    id v21 = v25;
  }
  else
  {
    *a2 = 1;
    [v25 increment];
    Logger.init()();
    id v12 = a3;
    char v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v24 = v7;
      char v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      uint64_t v27 = v23;
      *(_DWORD *)char v15 = 136446210;
      id v16 = [v12 procName];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v20 = v19;

        uint64_t v26 = sub_100022E8C(v18, v20, &v27);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "Triggering urgent submission for process %{public}s", v15, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v24 + 8))(v9, v6);
      }
      else
      {

        __break(1u);
      }
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
  }
}

uint64_t sub_100022D7C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_100022DD8(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100022DE8()
{
  return _swift_deallocObject(v0, 40, 7);
}

void sub_100022E20()
{
  sub_100022A6C(*(void *)(v0 + 16), *(unsigned char **)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_100022E2C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100022E3C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100022E64(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100022E74()
{
  return swift_release();
}

uint64_t sub_100022E7C(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  unsigned char *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100022E8C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100022F60(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000221E0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1000221E0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100022190((uint64_t)v12);
  return v7;
}

uint64_t sub_100022F60(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10002311C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_10002311C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000231B4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100023394(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100023394(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000231B4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_10002332C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10002332C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_10001FC8C(&qword_100042F08);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  void v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100023394(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_10001FC8C(&qword_100042F08);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  char v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t sub_1000234E4(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    swift_stdlib_random();
    uint64_t result = (0 * (unsigned __int128)v1) >> 64;
    if (-(uint64_t)v1 % v1)
    {
      while (1)
        swift_stdlib_random();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_100023570()
{
  unint64_t result = qword_100042F10;
  if (!qword_100042F10)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100042F10);
  }
  return result;
}

unint64_t sub_1000235B0()
{
  unint64_t result = qword_100042F18;
  if (!qword_100042F18)
  {
    type metadata accessor for OS_dispatch_queue.Attributes();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100042F18);
  }
  return result;
}

unint64_t sub_1000235FC()
{
  unint64_t result = qword_100042F28;
  if (!qword_100042F28)
  {
    sub_100023658(&qword_100042F20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100042F28);
  }
  return result;
}

uint64_t sub_100023658(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_1000236A0(void *a1, unint64_t a2)
{
  unint64_t v3 = v2;
  if (a1)
  {
    if (a2 < (unint64_t)[a1 start])
    {
      __break(1u);
      goto LABEL_11;
    }
    id v5 = objc_msgSend(a1, "get_uuid");
    if (v5)
    {
      unint64_t v6 = v5;
      uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      int64_t v9 = v8;

      goto LABEL_8;
    }
    uint64_t v7 = 4144959;
  }
  else
  {
    uint64_t v7 = 4144959;
  }
  int64_t v9 = (void *)0xE300000000000000;
LABEL_8:
  v10._countAndFlagsBits = v7;
  v10._object = v9;
  String.append(_:)(v10);
  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 43;
  v11._object = (void *)0xE100000000000000;
  String.append(_:)(v11);
  v12._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  id v13 = [v3 logWritingSignatureFrames];
  if (v13)
  {
    os_log_type_t v14 = v13;
    NSString v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v14 appendString:v15];

    return;
  }
LABEL_11:
  __break(1u);
}

void sub_100023884()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "GPURestartReport: tailspin log disabled by default", v0, 2u);
}

void sub_1000238CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100023948(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100023984(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100023A08()
{
  sub_10001C338();
  sub_10001C2E4((void *)&_mh_execute_header, &_os_log_default, v0, "Error %d checking VM region after crashing pc 0x%llx", v1, v2, v3, v4, v5);
}

void sub_100023A78()
{
  sub_10001C338();
  sub_10001C2E4((void *)&_mh_execute_header, &_os_log_default, v0, "Error %d checking VM region before crashing pc 0x%llx", v1, v2, v3, v4, v5);
}

void sub_100023AE8()
{
  sub_10001C350();
  sub_10001C2E4((void *)&_mh_execute_header, &_os_log_default, v0, "Error checking VM region for crashing pc 0x%llx: %d", v1, v2, v3, v4, v5);
}

void sub_100023B64()
{
  sub_10001C350();
  sub_10001C31C((void *)&_mh_execute_header, &_os_log_default, v0, "crash signature assembly: %@", v1, v2, v3, v4, v5);
}

void sub_100023BD4(uint8_t *a1, void *a2, void *a3)
{
  id v5 = [a2 unsignedLongLongValue];
  *(_DWORD *)a1 = 134217984;
  *a3 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Thread %llu has only exclave frames", a1, 0xCu);
}

void sub_100023C38(int *a1, uint64_t a2, uint64_t a3)
{
  int v3 = *a1;
  v4[0] = 67109632;
  if ((v3 & 0xFFFFFFF0) == 0x20) {
    int v3 = 17;
  }
  v4[1] = v3;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  __int16 v7 = 2048;
  uint64_t v8 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unexpected kcdata item size for type 0x%x: %lu < %lu ", (uint8_t *)v4, 0x1Cu);
}

void sub_100023CE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100023D1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100023D58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100023D94()
{
  sub_10001C350();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error creating info plist from binary: %{private}@", v0, 0xCu);
}

void sub_100023E10()
{
  int v0 = 138412290;
  CFStringRef v1 = @"Unknown error";
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error fetching original path from app extension: %@", (uint8_t *)&v0, 0xCu);
}

void sub_100023E98()
{
  *(_WORD *)int v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "no build version for bundle", v0, 2u);
}

void sub_100023EE0(void *a1)
{
  v1[0] = 67109120;
  v1[1] = [a1 count];
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "found %d buildInfo items", (uint8_t *)v1, 8u);
}

void sub_100023F64()
{
  sub_10001C350();
  sub_10001C31C((void *)&_mh_execute_header, &_os_log_default, v0, "loadBuildInfo %@", v1, v2, v3, v4, v5);
}

void sub_100023FD4()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "loadBundleInfo no path", v0, 2u);
}

void sub_10002401C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024094(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_100024118()
{
  uint64_t v0 = abort_report_np();
  return sub_100024140(v0);
}

uint64_t sub_100024140()
{
  uint64_t v0 = abort_report_np();
  return sub_100024168(v0);
}

uint64_t sub_100024168()
{
  uint64_t v0 = abort_report_np();
  return sub_100024190(v0);
}

uint64_t sub_100024190()
{
  uint64_t v0 = abort_report_np();
  return sub_1000241B8(v0);
}

uint64_t sub_1000241B8()
{
  uint64_t v0 = abort_report_np();
  return sub_1000241E0(v0);
}

uint64_t sub_1000241E0()
{
  uint64_t v0 = abort_report_np();
  return sub_100024208(v0);
}

uint64_t sub_100024208()
{
  uint64_t v0 = abort_report_np();
  return sub_100024230(v0);
}

uint64_t sub_100024230()
{
  uint64_t v0 = abort_report_np();
  return sub_100024258(v0);
}

uint64_t sub_100024258()
{
  uint64_t v0 = abort_report_np();
  return sub_100024280(v0);
}

uint64_t sub_100024280()
{
  uint64_t v0 = abort_report_np();
  return sub_1000242A8(v0);
}

void sub_1000242A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000242E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024320(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002435C(mach_error_t a1)
{
  v1[0] = 67109378;
  v1[1] = a1;
  __int16 v2 = 2080;
  uint64_t v3 = mach_error_string(a1);
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "task_identity_token_get_task_port failed with error %d %s", (uint8_t *)v1, 0x12u);
}

void sub_1000243F8()
{
  __assert_rtn("process_exception_identity", "ReportCrash.m", 615, "task == MACH_PORT_NULL");
}

void sub_100024424(int *a1, int a2)
{
  int v2 = *a1;
  v3[0] = 67109376;
  v3[1] = v2;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Mismatch between new state count %u and old state count %u", (uint8_t *)v3, 0xEu);
}

void sub_1000244B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000244F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002452C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024568(kern_return_t a1)
{
  v1[0] = 67109378;
  v1[1] = a1;
  __int16 v2 = 2082;
  uint64_t v3 = bootstrap_strerror(a1);
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "bootstrap_check_in() failed with status %d: %{public}s", (uint8_t *)v1, 0x12u);
}

void sub_100024604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t AnalyticsQueryValuesFor(arguments:)()
{
  return AnalyticsQueryValuesFor(arguments:)();
}

uint64_t type metadata accessor for GenerativeModelsAvailability.Availability()
{
  return type metadata accessor for GenerativeModelsAvailability.Availability();
}

uint64_t GenerativeModelsAvailability.Parameters.init(useCaseIdentifiers:)()
{
  return GenerativeModelsAvailability.Parameters.init(useCaseIdentifiers:)();
}

uint64_t type metadata accessor for GenerativeModelsAvailability.Parameters()
{
  return type metadata accessor for GenerativeModelsAvailability.Parameters();
}

uint64_t GenerativeModelsAvailability.ChangeSequence.makeAsyncIterator()()
{
  return GenerativeModelsAvailability.ChangeSequence.makeAsyncIterator()();
}

uint64_t type metadata accessor for GenerativeModelsAvailability.ChangeSequence.Iterator()
{
  return type metadata accessor for GenerativeModelsAvailability.ChangeSequence.Iterator();
}

uint64_t type metadata accessor for GenerativeModelsAvailability.ChangeSequence()
{
  return type metadata accessor for GenerativeModelsAvailability.ChangeSequence();
}

uint64_t GenerativeModelsAvailability.changes.getter()
{
  return GenerativeModelsAvailability.changes.getter();
}

uint64_t static GenerativeModelsAvailability.current(parameters:)()
{
  return static GenerativeModelsAvailability.current(parameters:)();
}

uint64_t type metadata accessor for GenerativeModelsAvailability()
{
  return type metadata accessor for GenerativeModelsAvailability();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init()()
{
  return Logger.init()();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t XPC_TYPE_ARRAY.getter()
{
  return XPC_TYPE_ARRAY.getter();
}

uint64_t XPC_TYPE_DICTIONARY.getter()
{
  return XPC_TYPE_DICTIONARY.getter();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t NSSet.init(arrayLiteral:)()
{
  return NSSet.init(arrayLiteral:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t AnalyticsSendEventLazyHighPriority()
{
  return _AnalyticsSendEventLazyHighPriority();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA1(data, len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return _CFNotificationCenterGetDistributedCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CRCreateDirectoryStructure()
{
  return _CRCreateDirectoryStructure();
}

uint64_t CSIsNull()
{
  return _CSIsNull();
}

uint64_t CSRegionGetName()
{
  return _CSRegionGetName();
}

uint64_t CSRegionGetRange()
{
  return _CSRegionGetRange();
}

uint64_t CSRelease()
{
  return _CSRelease();
}

uint64_t CSSourceInfoGetFilename()
{
  return _CSSourceInfoGetFilename();
}

uint64_t CSSourceInfoGetLineNumber()
{
  return _CSSourceInfoGetLineNumber();
}

uint64_t CSSymbolGetName()
{
  return _CSSymbolGetName();
}

uint64_t CSSymbolGetRange()
{
  return _CSSymbolGetRange();
}

uint64_t CSSymbolOwnerForEachStackFrameAtAddress()
{
  return _CSSymbolOwnerForEachStackFrameAtAddress();
}

uint64_t CSSymbolOwnerForeachSection()
{
  return _CSSymbolOwnerForeachSection();
}

uint64_t CSSymbolOwnerForeachSegment()
{
  return _CSSymbolOwnerForeachSegment();
}

uint64_t CSSymbolOwnerGetArchitecture()
{
  return _CSSymbolOwnerGetArchitecture();
}

uint64_t CSSymbolOwnerGetBaseAddress()
{
  return _CSSymbolOwnerGetBaseAddress();
}

uint64_t CSSymbolOwnerGetCFUUIDBytes()
{
  return _CSSymbolOwnerGetCFUUIDBytes();
}

uint64_t CSSymbolOwnerGetName()
{
  return _CSSymbolOwnerGetName();
}

uint64_t CSSymbolOwnerGetPath()
{
  return _CSSymbolOwnerGetPath();
}

uint64_t CSSymbolOwnerGetSectionWithName()
{
  return _CSSymbolOwnerGetSectionWithName();
}

uint64_t CSSymbolOwnerGetSymbolWithName()
{
  return _CSSymbolOwnerGetSymbolWithName();
}

uint64_t CSSymbolicatorCreateWithTaskFlagsAndNotification()
{
  return _CSSymbolicatorCreateWithTaskFlagsAndNotification();
}

uint64_t CSSymbolicatorForeachSymbolOwnerAtTime()
{
  return _CSSymbolicatorForeachSymbolOwnerAtTime();
}

uint64_t CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData()
{
  return _CSSymbolicatorGetFlagsForNoSymbolOrSourceInfoData();
}

uint64_t CSSymbolicatorGetSharedCacheBaseAddress()
{
  return _CSSymbolicatorGetSharedCacheBaseAddress();
}

uint64_t CSSymbolicatorGetSymbolOwnerWithAddressAtTime()
{
  return _CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
}

uint64_t CSSymbolicatorGetSymbolOwnerWithNameAtTime()
{
  return _CSSymbolicatorGetSymbolOwnerWithNameAtTime();
}

uint64_t CSSymbolicatorGetSymbolWithNameAtTime()
{
  return _CSSymbolicatorGetSymbolWithNameAtTime();
}

uint64_t CSSymbolicatorGetSymbolWithNameFromSymbolOwnerWithNameAtTime()
{
  return _CSSymbolicatorGetSymbolWithNameFromSymbolOwnerWithNameAtTime();
}

uint64_t CSSymbolicatorSetForceGlobalSafeMachVMReads()
{
  return _CSSymbolicatorSetForceGlobalSafeMachVMReads();
}

uint64_t CSTaskIsDriverKit()
{
  return _CSTaskIsDriverKit();
}

CFTypeRef IOCFUnserializeBinary(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return _IOCFUnserializeBinary(buffer, bufferSize, allocator, options, errorString);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMainPort(bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

uint64_t OSADateFormat()
{
  return _OSADateFormat();
}

uint64_t OSAPreferencesGetBoolValue()
{
  return _OSAPreferencesGetBoolValue();
}

uint64_t OSARTCIsProcessOfInterest()
{
  return _OSARTCIsProcessOfInterest();
}

uint64_t OSARandomSelection()
{
  return _OSARandomSelection();
}

uint64_t OSASanitizePath()
{
  return _OSASanitizePath();
}

uint64_t OSAStabilityMonitorEvaluateStabilityForBundleID()
{
  return _OSAStabilityMonitorEvaluateStabilityForBundleID();
}

uint64_t OSAStabilityMonitorLogDomain()
{
  return _OSAStabilityMonitorLogDomain();
}

uint64_t PASReportCrashExtractResults()
{
  return _PASReportCrashExtractResults();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
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

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

uint64_t _dyld_process_info_create()
{
  return __dyld_process_info_create();
}

uint64_t _dyld_process_info_get_platform()
{
  return __dyld_process_info_get_platform();
}

uint64_t _dyld_process_info_release()
{
  return __dyld_process_info_release();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return _audit_token_to_pid(atoken);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_check_in(bp, service_name, sp);
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return _bootstrap_strerror(r);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

uint64_t create_mapped_memory_cache_for_task()
{
  return _create_mapped_memory_cache_for_task();
}

uint64_t destroy_mapped_memory_cache()
{
  return _destroy_mapped_memory_cache();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

uint64_t dyld_process_create_for_task()
{
  return _dyld_process_create_for_task();
}

uint64_t dyld_process_dispose()
{
  return _dyld_process_dispose();
}

uint64_t dyld_process_snapshot_create_for_process()
{
  return _dyld_process_snapshot_create_for_process();
}

uint64_t dyld_process_snapshot_dispose()
{
  return _dyld_process_snapshot_dispose();
}

uint64_t dyld_process_snapshot_get_shared_cache()
{
  return _dyld_process_snapshot_get_shared_cache();
}

uint64_t dyld_shared_cache_copy_uuid()
{
  return _dyld_shared_cache_copy_uuid();
}

uint64_t dyld_shared_cache_get_base_address()
{
  return _dyld_shared_cache_get_base_address();
}

uint64_t dyld_shared_cache_get_mapped_size()
{
  return _dyld_shared_cache_get_mapped_size();
}

void exit(int a1)
{
}

int ferror(FILE *a1)
{
  return _ferror(a1);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fread(__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

mach_msg_return_t mach_msg_server_once(BOOLean_t (__cdecl *a1)(mach_msg_header_t *, mach_msg_header_t *), mach_msg_size_t a2, mach_port_t a3, mach_msg_options_t a4)
{
  return _mach_msg_server_once(a1, a2, a3, a4);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_kernel_object(ipc_space_read_t task, mach_port_name_t name, unsigned int *object_type, unsigned int *object_addr)
{
  return _mach_port_kernel_object(task, name, object_type, object_addr);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return _mach_port_mod_refs(task, name, right, delta);
}

kern_return_t mach_ports_lookup(task_t target_task, mach_port_array_t *init_port_set, mach_msg_type_number_t *init_port_setCnt)
{
  return _mach_ports_lookup(target_task, init_port_set, init_port_setCnt);
}

kern_return_t mach_ports_register(task_t target_task, mach_port_array_t init_port_set, mach_msg_type_number_t init_port_setCnt)
{
  return _mach_ports_register(target_task, init_port_set, init_port_setCnt);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return _mach_vm_deallocate(target, address, size);
}

kern_return_t mach_vm_read(vm_map_read_t target_task, mach_vm_address_t address, mach_vm_size_t size, vm_offset_t *data, mach_msg_type_number_t *dataCnt)
{
  return _mach_vm_read(target_task, address, size, data, dataCnt);
}

kern_return_t mach_vm_region_recurse(vm_map_read_t target_task, mach_vm_address_t *address, mach_vm_size_t *size, natural_t *nesting_depth, vm_region_recurse_info_t info, mach_msg_type_number_t *infoCnt)
{
  return _mach_vm_region_recurse(target_task, address, size, nesting_depth, info, infoCnt);
}

const char *__cdecl macho_arch_name_for_cpu_type(cpu_type_t type, cpu_subtype_t subtype)
{
  return _macho_arch_name_for_cpu_type(type, subtype);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

uint64_t mapped_memory_read_pointer()
{
  return _mapped_memory_read_pointer();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
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

id objc_retainAutoreleasedReturnValue(id a1)
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

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_mach_msg_get_audit_trailer()
{
  return _os_mach_msg_get_audit_trailer();
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int pclose(FILE *a1)
{
  return _pclose(a1);
}

uint64_t pgm_extract_report_from_corpse()
{
  return _pgm_extract_report_from_corpse();
}

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return _pid_for_task(t, x);
}

FILE *__cdecl popen(const char *a1, const char *a2)
{
  return _popen(a1, a2);
}

uint64_t proc_disable_cpumon()
{
  return _proc_disable_cpumon();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_name(pid, buffer, buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return _pthread_attr_destroy(a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return _pthread_attr_init(a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return _pthread_attr_setdetachstate(a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_get_qos_class_np(pthread_t __pthread, qos_class_t *__qos_class, int *__relative_priority)
{
  return _pthread_get_qos_class_np(__pthread, __qos_class, __relative_priority);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  return _pthread_set_qos_class_self_np(__qos_class, __relative_priority);
}

uint64_t rosetta_create_exit_payload_string()
{
  return _rosetta_create_exit_payload_string();
}

uint64_t rosetta_get_rflags()
{
  return _rosetta_get_rflags();
}

uint64_t rosetta_get_runtime_location()
{
  return _rosetta_get_runtime_location();
}

uint64_t rtcsc_send()
{
  return _rtcsc_send();
}

uint64_t sandbox_container_path_for_pid()
{
  return _sandbox_container_path_for_pid();
}

uint64_t sanitizer_diagnose_fault_from_crash_reporter()
{
  return _sanitizer_diagnose_fault_from_crash_reporter();
}

uint64_t sanitizers_diagnose_memory_error()
{
  return _sanitizers_diagnose_memory_error();
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

int strnvisx(char *a1, size_t a2, const char *a3, size_t a4, int a5)
{
  return _strnvisx(a1, a2, a3, a4, a5);
}

char *__cdecl strsignal(int __sig)
{
  return _strsignal(__sig);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

kern_return_t task_identity_token_get_task_port(task_id_token_t token, task_flavor_t flavor, mach_port_t *task_port)
{
  return _task_identity_token_get_task_port(token, flavor, task_port);
}

kern_return_t task_map_corpse_info_64(task_t task, task_read_t corspe_task, mach_vm_address_t *kcd_addr_begin, mach_vm_size_t *kcd_size)
{
  return _task_map_corpse_info_64(task, corspe_task, kcd_addr_begin, kcd_size);
}

kern_return_t task_map_kcdata_object_64(task_t task, kcdata_object_t kcdata_object, mach_vm_address_t *kcd_addr_begin, mach_vm_size_t *kcd_size)
{
  return _task_map_kcdata_object_64(task, kcdata_object, kcd_addr_begin, kcd_size);
}

kern_return_t task_policy_get(task_policy_get_t task, task_policy_flavor_t flavor, task_policy_t policy_info, mach_msg_type_number_t *policy_infoCnt, BOOLean_t *get_default)
{
  return _task_policy_get(task, flavor, policy_info, policy_infoCnt, get_default);
}

kern_return_t thread_get_state(thread_read_t target_act, thread_state_flavor_t flavor, thread_state_t old_state, mach_msg_type_number_t *old_stateCnt)
{
  return _thread_get_state(target_act, flavor, old_state, old_stateCnt);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return _thread_info(target_act, flavor, thread_info_out, thread_info_outCnt);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

void uuid_clear(uuid_t uu)
{
}

int uuid_is_null(const uuid_t uu)
{
  return _uuid_is_null(uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

void uuid_unparse_lower(const uuid_t uu, uuid_string_t out)
{
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

kern_return_t vm_read(vm_map_read_t target_task, vm_address_t address, vm_size_t size, vm_offset_t *data, mach_msg_type_number_t *dataCnt)
{
  return _vm_read(target_task, address, size, data, dataCnt);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_string(xarray, index);
}

uint64_t xpc_coalition_copy_info()
{
  return _xpc_coalition_copy_info();
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_dictionary(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

uint64_t xpc_exit_reason_get_label()
{
  return _xpc_exit_reason_get_label();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

id objc_msgSend_Crash(void *a1, const char *a2, ...)
{
  return _[a1 Crash];
}

id objc_msgSend_OSAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 OSAnalytics];
}

id objc_msgSend_Stability(void *a1, const char *a2, ...)
{
  return _[a1 Stability];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__addASILine_fromOwner_isSafe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addASILine:fromOwner:isSafe:");
}

id objc_msgSend__copyStringFromTask_atAddress_maxLength_immutableCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_copyStringFromTask:atAddress:maxLength:immutableCheck:");
}

id objc_msgSend__extractBacktraceInfoUsingSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractBacktraceInfoUsingSymbolicator:usingCatalog:");
}

id objc_msgSend__extractBinaryImageInfoUsingSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractBinaryImageInfoUsingSymbolicator:usingCatalog:");
}

id objc_msgSend__extractCrashReporterAnnotationsFromSymbolOwner_withMemory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractCrashReporterAnnotationsFromSymbolOwner:withMemory:");
}

id objc_msgSend__extractExceptionReasonUsingSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractExceptionReasonUsingSymbolicator:usingCatalog:");
}

id objc_msgSend__extractInfoPlistFromSymbolOwner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractInfoPlistFromSymbolOwner:");
}

id objc_msgSend__extractLastExceptionBacktraceUsingSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractLastExceptionBacktraceUsingSymbolicator:usingCatalog:");
}

id objc_msgSend__extractMallocTraceInfo_withSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractMallocTraceInfo:withSymbolicator:usingCatalog:");
}

id objc_msgSend__extractMemoryErrorReportUsingSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractMemoryErrorReportUsingSymbolicator:usingCatalog:");
}

id objc_msgSend__extractPGMLibpasReportUsingSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractPGMLibpasReportUsingSymbolicator:usingCatalog:");
}

id objc_msgSend__extractPGMReportUsingSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractPGMReportUsingSymbolicator:usingCatalog:");
}

id objc_msgSend__extractRosettaRuntimeInfo_withBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractRosettaRuntimeInfo:withBlock:");
}

id objc_msgSend__extractSanitizerReportUsingSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractSanitizerReportUsingSymbolicator:usingCatalog:");
}

id objc_msgSend__extractVMMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractVMMap:");
}

id objc_msgSend__extractWorkQueueLimitsFromData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_extractWorkQueueLimitsFromData:");
}

id objc_msgSend__findContainingRegion_address_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findContainingRegion:address:");
}

id objc_msgSend__findContainingTextSegmentRegion_address_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findContainingTextSegmentRegion:address:");
}

id objc_msgSend__findMallocZone_usingSymbolicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findMallocZone:usingSymbolicator:");
}

id objc_msgSend__getObjCReadOnlyRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getObjCReadOnlyRange:");
}

id objc_msgSend__getSymbolicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getSymbolicator:");
}

id objc_msgSend__isMTECrash(void *a1, const char *a2, ...)
{
  return _[a1 _isMTECrash];
}

id objc_msgSend__isPGMCrashType(void *a1, const char *a2, ...)
{
  return _[a1 _isPGMCrashType];
}

id objc_msgSend__objcSelectorAddressForMessenger_memory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_objcSelectorAddressForMessenger:memory:");
}

id objc_msgSend__objcSelectorNameForMessenger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_objcSelectorNameForMessenger:");
}

id objc_msgSend__readAddressFromMemory_atAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readAddressFromMemory:atAddress:");
}

id objc_msgSend__readAddressFromMemory_atSymbol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readAddressFromMemory:atSymbol:");
}

id objc_msgSend__readDataAtAddress_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readDataAtAddress:size:");
}

id objc_msgSend__readIndirectImmutableStringFromSymbol_symbolOwner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readIndirectImmutableStringFromSymbol:symbolOwner:");
}

id objc_msgSend__readMallocZoneArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readMallocZoneArray:");
}

id objc_msgSend__readMallocZoneArrayFromMemory_usingSymbolicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readMallocZoneArrayFromMemory:usingSymbolicator:");
}

id objc_msgSend__readStringAtTaskAddress_maxLength_immutableCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readStringAtTaskAddress:maxLength:immutableCheck:");
}

id objc_msgSend__regionAtAddress_immutableCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_regionAtAddress:immutableCheck:");
}

id objc_msgSend__regionInfoAtAddress_regionInfo_regionAddress_regionSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_regionInfoAtAddress:regionInfo:regionAddress:regionSize:");
}

id objc_msgSend__symbolicateRegister_inRange_withSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_symbolicateRegister:inRange:withSymbolicator:usingCatalog:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addImage_address_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addImage:address:size:");
}

id objc_msgSend_addImageLegacy_address_size_name_path_arch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addImageLegacy:address:size:name:path:arch:");
}

id objc_msgSend_addLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLines:");
}

id objc_msgSend_addLines_fromOwner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLines:fromOwner:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendNotesTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendNotesTo:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_appleInternal(void *a1, const char *a2, ...)
{
  return _[a1 appleInternal];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_automatedDeviceGroup(void *a1, const char *a2, ...)
{
  return _[a1 automatedDeviceGroup];
}

id objc_msgSend_autopsyCorpse(void *a1, const char *a2, ...)
{
  return _[a1 autopsyCorpse];
}

id objc_msgSend_autopsyLightweightCorpse_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "autopsyLightweightCorpse:size:");
}

id objc_msgSend_backtrace(void *a1, const char *a2, ...)
{
  return _[a1 backtrace];
}

id objc_msgSend_backtraceLength(void *a1, const char *a2, ...)
{
  return _[a1 backtraceLength];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_betaVersionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 betaVersionIdentifier];
}

id objc_msgSend_bls_aggregatePayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bls_aggregatePayload:");
}

id objc_msgSend_bls_backlightChangeEventPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bls_backlightChangeEventPayload:");
}

id objc_msgSend_bls_backlightChangeRequestPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bls_backlightChangeRequestPayload:");
}

id objc_msgSend_bls_environmentStateMachinePayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bls_environmentStateMachinePayload:");
}

id objc_msgSend_bls_presentationPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bls_presentationPayload:");
}

id objc_msgSend_bls_transitionPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bls_transitionPayload:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bootArgs(void *a1, const char *a2, ...)
{
  return _[a1 bootArgs];
}

id objc_msgSend_bootSessionUUID(void *a1, const char *a2, ...)
{
  return _[a1 bootSessionUUID];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return _[a1 buildVersion];
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return _[a1 bundleVersion];
}

id objc_msgSend_bundle_id(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundle_id");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_callStackReturnAddresses(void *a1, const char *a2, ...)
{
  return _[a1 callStackReturnAddresses];
}

id objc_msgSend_captureDiagInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "captureDiagInfo:");
}

id objc_msgSend_captureLSInfo(void *a1, const char *a2, ...)
{
  return _[a1 captureLSInfo];
}

id objc_msgSend_capture_time(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "capture_time");
}

id objc_msgSend_characterSetWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithRange:");
}

id objc_msgSend_checkIfNeedsUrgentSubmission(void *a1, const char *a2, ...)
{
  return _[a1 checkIfNeedsUrgentSubmission];
}

id objc_msgSend_coalitionName(void *a1, const char *a2, ...)
{
  return _[a1 coalitionName];
}

id objc_msgSend_codeSigningMonitor(void *a1, const char *a2, ...)
{
  return _[a1 codeSigningMonitor];
}

id objc_msgSend_codeZeroForGuardException(void *a1, const char *a2, ...)
{
  return _[a1 codeZeroForGuardException];
}

id objc_msgSend_commonFieldsForBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commonFieldsForBody:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_compose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compose:");
}

id objc_msgSend_composeFrame_info_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "composeFrame:info:");
}

id objc_msgSend_condition(void *a1, const char *a2, ...)
{
  return _[a1 condition];
}

id objc_msgSend_containingBundleRecord(void *a1, const char *a2, ...)
{
  return _[a1 containingBundleRecord];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
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

id objc_msgSend_cpuArch(void *a1, const char *a2, ...)
{
  return _[a1 cpuArch];
}

id objc_msgSend_crashReporterKey(void *a1, const char *a2, ...)
{
  return _[a1 crashReporterKey];
}

id objc_msgSend_crashingAddress(void *a1, const char *a2, ...)
{
  return _[a1 crashingAddress];
}

id objc_msgSend_create_os_fault_section(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "create_os_fault_section");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return _[a1 currentThread];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithCapacity:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_decode_cpuType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_cpuType");
}

id objc_msgSend_decode_crashingThreadStateWithSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_crashingThreadStateWithSymbolicator:usingCatalog:");
}

id objc_msgSend_decode_esr_exceptionStateCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_esr:exceptionStateCount:");
}

id objc_msgSend_decode_exceptionCodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_exceptionCodes");
}

id objc_msgSend_decode_exceptionType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_exceptionType");
}

id objc_msgSend_decode_os_log_fault_payload(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_os_log_fault_payload");
}

id objc_msgSend_decode_reason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reason");
}

id objc_msgSend_decode_reasonBTC(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonBTC");
}

id objc_msgSend_decode_reasonBacklightServices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonBacklightServices");
}

id objc_msgSend_decode_reasonCarousel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonCarousel");
}

id objc_msgSend_decode_reasonCodeSigning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonCodeSigning");
}

id objc_msgSend_decode_reasonCoreAnimation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonCoreAnimation");
}

id objc_msgSend_decode_reasonDyldWithInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonDyldWithInfo:");
}

id objc_msgSend_decode_reasonExec(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonExec");
}

id objc_msgSend_decode_reasonLibSystem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonLibSystem");
}

id objc_msgSend_decode_reasonLibxpc(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonLibxpc");
}

id objc_msgSend_decode_reasonMetal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonMetal");
}

id objc_msgSend_decode_reasonNamespace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonNamespace");
}

id objc_msgSend_decode_reasonPortSpace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonPortSpace");
}

id objc_msgSend_decode_reasonRosetta(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonRosetta");
}

id objc_msgSend_decode_reasonSandbox(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonSandbox");
}

id objc_msgSend_decode_reasonTcc(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonTcc");
}

id objc_msgSend_decode_reasonWatchKit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonWatchKit");
}

id objc_msgSend_decode_reasonWatchdog(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_reasonWatchdog");
}

id objc_msgSend_decode_signal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_signal");
}

id objc_msgSend_decode_threadState_threadStateCount_threadStateFlavor_threadPort_exceptionState_exceptionStateCount_withSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_threadState:threadStateCount:threadStateFlavor:threadPort:exceptionState:exceptionStateCount:withSymbolicator:usingCatalog:");
}

id objc_msgSend_decode_threadState_withSymbolicator_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_threadState:withSymbolicator:usingCatalog:");
}

id objc_msgSend_decode_ubsanCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_ubsanCode:");
}

id objc_msgSend_decode_versionCodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decode_versionCodes:");
}

id objc_msgSend_decrement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decrement:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultProvider(void *a1, const char *a2, ...)
{
  return _[a1 defaultProvider];
}

id objc_msgSend_deploymentId(void *a1, const char *a2, ...)
{
  return _[a1 deploymentId];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_descriptionForRegionTotalsWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionForRegionTotalsWithOptions:");
}

id objc_msgSend_descriptionOfRegionsAroundAddress_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionOfRegionsAroundAddress:options:");
}

id objc_msgSend_developerType(void *a1, const char *a2, ...)
{
  return _[a1 developerType];
}

id objc_msgSend_deviceIdentifierForVendor(void *a1, const char *a2, ...)
{
  return _[a1 deviceIdentifierForVendor];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithValuesForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithValuesForKeys:");
}

id objc_msgSend_dispatchQueueNameForSerialNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dispatchQueueNameForSerialNumber:");
}

id objc_msgSend_dispatchQueueSerialNumber(void *a1, const char *a2, ...)
{
  return _[a1 dispatchQueueSerialNumber];
}

id objc_msgSend_distributorID(void *a1, const char *a2, ...)
{
  return _[a1 distributorID];
}

id objc_msgSend_distributorInfo(void *a1, const char *a2, ...)
{
  return _[a1 distributorInfo];
}

id objc_msgSend_donateToBiome(void *a1, const char *a2, ...)
{
  return _[a1 donateToBiome];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_dumpProgramCounterBytes(void *a1, const char *a2, ...)
{
  return _[a1 dumpProgramCounterBytes];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return _[a1 enabled];
}

id objc_msgSend_enumerateSampledActiveExperimentsForEnvironment_correlationID_error_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSampledActiveExperimentsForEnvironment:correlationID:error:block:");
}

id objc_msgSend_enumerateSampledActiveRolloutsForCorrelationID_error_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSampledActiveRolloutsForCorrelationID:error:block:");
}

id objc_msgSend_etlKey(void *a1, const char *a2, ...)
{
  return _[a1 etlKey];
}

id objc_msgSend_exceptionType(void *a1, const char *a2, ...)
{
  return _[a1 exceptionType];
}

id objc_msgSend_executeWithTimeout_Code_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeWithTimeout:Code:");
}

id objc_msgSend_experimentId(void *a1, const char *a2, ...)
{
  return _[a1 experimentId];
}

id objc_msgSend_extractArguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractArguments:");
}

id objc_msgSend_extractThreadStateInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractThreadStateInfo:");
}

id objc_msgSend_factorPackIds(void *a1, const char *a2, ...)
{
  return _[a1 factorPackIds];
}

id objc_msgSend_faultingImage(void *a1, const char *a2, ...)
{
  return _[a1 faultingImage];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_filterOutSensitiveStrings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterOutSensitiveStrings:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_findBundleAtPath_withKeys_bundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findBundleAtPath:withKeys:bundleURL:");
}

id objc_msgSend_finishExtractionUsingCorpse(void *a1, const char *a2, ...)
{
  return _[a1 finishExtractionUsingCorpse];
}

id objc_msgSend_formatString(void *a1, const char *a2, ...)
{
  return _[a1 formatString];
}

id objc_msgSend_formatStringOriginatingModulePath(void *a1, const char *a2, ...)
{
  return _[a1 formatStringOriginatingModulePath];
}

id objc_msgSend_getFramesForThread_usingCatalog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFramesForThread:usingCatalog:");
}

id objc_msgSend_getGMAvailability(void *a1, const char *a2, ...)
{
  return _[a1 getGMAvailability];
}

id objc_msgSend_getNotificationInfo(void *a1, const char *a2, ...)
{
  return _[a1 getNotificationInfo];
}

id objc_msgSend_getObserverInfo(void *a1, const char *a2, ...)
{
  return _[a1 getObserverInfo];
}

id objc_msgSend_getSignpostDataforPid_forClient_andEventTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSignpostDataforPid:forClient:andEventTimestamp:");
}

id objc_msgSend_getSyslogForPids_andOptionalSenders_additionalPredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSyslogForPids:andOptionalSenders:additionalPredicates:");
}

id objc_msgSend_getTaskingKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTaskingKey:");
}

id objc_msgSend_getTrialCache(void *a1, const char *a2, ...)
{
  return _[a1 getTrialCache];
}

id objc_msgSend_handleDiagnosticLog_logPath_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDiagnosticLog:logPath:completion:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_iTunesMetadata(void *a1, const char *a2, ...)
{
  return _[a1 iTunesMetadata];
}

id objc_msgSend_incidentID(void *a1, const char *a2, ...)
{
  return _[a1 incidentID];
}

id objc_msgSend_increment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "increment:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_initPayloadDataWithDiagnostics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initPayloadDataWithDiagnostics:");
}

id objc_msgSend_initWithBinaryName_binaryUUID_address_binaryOffset_sampleCount_withDepth_subFrameArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBinaryName:binaryUUID:address:binaryOffset:sampleCount:withDepth:subFrameArray:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCode_namespaceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCode:namespaceName:");
}

id objc_msgSend_initWithCodes_type_signal_subtype_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCodes:type:signal:subtype:");
}

id objc_msgSend_initWithComposedMessage_formatString_arguments_type_className_exceptionName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithComposedMessage:formatString:arguments:type:className:exceptionName:");
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithIncidentID_processName_bundleID_appVersion_bundleVersion_exception_terminationReason_responsibleApp_coalitionName_isFirstParty_isBeta_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIncidentID:processName:bundleID:appVersion:bundleVersion:exception:terminationReason:responsibleApp:coalitionName:isFirstParty:isBeta:");
}

id objc_msgSend_initWithMetaData_applicationVersion_signpostData_pid_terminationReason_applicationSpecificInfo_virtualMemoryRegionInfo_exceptionType_exceptionCode_exceptionReason_signal_stackTrace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMetaData:applicationVersion:signpostData:pid:terminationReason:applicationSpecificInfo:virtualMemoryRegionInfo:exceptionType:exceptionCode:exceptionReason:signal:stackTrace:");
}

id objc_msgSend_initWithPID_task_processName_is64Bit_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPID:task:processName:is64Bit:options:");
}

id objc_msgSend_initWithPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPid:");
}

id objc_msgSend_initWithRegionFormat_osVersion_deviceType_appBuildVersion_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRegionFormat:osVersion:deviceType:appBuildVersion:bundleID:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithTask_exceptionType_thread_threadId_threadStateFlavor_threadState_threadStateCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTask:exceptionType:thread:threadId:threadStateFlavor:threadState:threadStateCount:");
}

id objc_msgSend_initWithTask_pid_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTask:pid:options:");
}

id objc_msgSend_initWithThreadArray_aggregatedByProcess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithThreadArray:aggregatedByProcess:");
}

id objc_msgSend_initWithTopCallStackFrames_isAttributedThread_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTopCallStackFrames:isAttributedThread:");
}

id objc_msgSend_initWithURL_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:allowPlaceholder:error:");
}

id objc_msgSend_initWithURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:error:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_internalKey(void *a1, const char *a2, ...)
{
  return _[a1 internalKey];
}

id objc_msgSend_isALE_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isALE:");
}

id objc_msgSend_isBeta(void *a1, const char *a2, ...)
{
  return _[a1 isBeta];
}

id objc_msgSend_isComputeController(void *a1, const char *a2, ...)
{
  return _[a1 isComputeController];
}

id objc_msgSend_isComputeNode(void *a1, const char *a2, ...)
{
  return _[a1 isComputeNode];
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExceptionNonFatal(void *a1, const char *a2, ...)
{
  return _[a1 isExceptionNonFatal];
}

id objc_msgSend_isInLDM(void *a1, const char *a2, ...)
{
  return _[a1 isInLDM];
}

id objc_msgSend_isLowPowerModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isLowPowerModeEnabled];
}

id objc_msgSend_isMetricKitClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMetricKitClient:");
}

id objc_msgSend_is_simulated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "is_simulated");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_loadBuildInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadBuildInfo:");
}

id objc_msgSend_loadBundleInfo(void *a1, const char *a2, ...)
{
  return _[a1 loadBundleInfo];
}

id objc_msgSend_loadStoreInfo_atURL_forPlatform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadStoreInfo:atURL:forPlatform:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_lockWhenCondition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockWhenCondition:");
}

id objc_msgSend_logWritingSignature(void *a1, const char *a2, ...)
{
  return _[a1 logWritingSignature];
}

id objc_msgSend_logWritingSignatureFrames(void *a1, const char *a2, ...)
{
  return _[a1 logWritingSignatureFrames];
}

id objc_msgSend_logfile(void *a1, const char *a2, ...)
{
  return _[a1 logfile];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_modelCode(void *a1, const char *a2, ...)
{
  return _[a1 modelCode];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nameFromPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nameFromPid:");
}

id objc_msgSend_needsUrgentSubmission(void *a1, const char *a2, ...)
{
  return _[a1 needsUrgentSubmission];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_oldLogFile(void *a1, const char *a2, ...)
{
  return _[a1 oldLogFile];
}

id objc_msgSend_optIn3rdParty(void *a1, const char *a2, ...)
{
  return _[a1 optIn3rdParty];
}

id objc_msgSend_osTrain(void *a1, const char *a2, ...)
{
  return _[a1 osTrain];
}

id objc_msgSend_parentBundleURLForAppExtensionBundleURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parentBundleURLForAppExtensionBundleURL:error:");
}

id objc_msgSend_parse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parse:");
}

id objc_msgSend_parseCorpse_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseCorpse:size:");
}

id objc_msgSend_parseKCdata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseKCdata:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_problemType(void *a1, const char *a2, ...)
{
  return _[a1 problemType];
}

id objc_msgSend_procName(void *a1, const char *a2, ...)
{
  return _[a1 procName];
}

id objc_msgSend_proc_id(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proc_id");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_productNameVersionBuildString(void *a1, const char *a2, ...)
{
  return _[a1 productNameVersionBuildString];
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return _[a1 range];
}

id objc_msgSend_rangeOfCharacterFromSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfCharacterFromSet:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_reduceToTwoSigFigures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reduceToTwoSigFigures:");
}

id objc_msgSend_regions(void *a1, const char *a2, ...)
{
  return _[a1 regions];
}

id objc_msgSend_releaseType(void *a1, const char *a2, ...)
{
  return _[a1 releaseType];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_reportNamePrefix(void *a1, const char *a2, ...)
{
  return _[a1 reportNamePrefix];
}

id objc_msgSend_reportUsedImagesFullInfoUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportUsedImagesFullInfoUsingBlock:");
}

id objc_msgSend_responsibleProc(void *a1, const char *a2, ...)
{
  return _[a1 responsibleProc];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_rolloutId(void *a1, const char *a2, ...)
{
  return _[a1 rolloutId];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_sRouteID(void *a1, const char *a2, ...)
{
  return _[a1 sRouteID];
}

id objc_msgSend_safe_encoder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safe_encoder:");
}

id objc_msgSend_sampleAllThreadsOnce(void *a1, const char *a2, ...)
{
  return _[a1 sampleAllThreadsOnce];
}

id objc_msgSend_saveWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveWithOptions:");
}

id objc_msgSend_searchFrame_in_regions_result_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchFrame:in:regions:result:");
}

id objc_msgSend_searchFrame_in_result_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchFrame:in:result:");
}

id objc_msgSend_sendDiagnostic_forDate_andSourceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDiagnostic:forDate:andSourceID:");
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:");
}

id objc_msgSend_sendToCoreAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 sendToCoreAnalytics];
}

id objc_msgSend_sendToMetricKit(void *a1, const char *a2, ...)
{
  return _[a1 sendToMetricKit];
}

id objc_msgSend_setApplicationSpecificInformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApplicationSpecificInformation:");
}

id objc_msgSend_setBundleVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleVersion:");
}

id objc_msgSend_setFaultingImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFaultingImage:");
}

id objc_msgSend_setIsBeta_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsBeta:");
}

id objc_msgSend_setLogWritingSignatureFrames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLogWritingSignatureFrames:");
}

id objc_msgSend_setModulePathForImmutableMemoryPointer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModulePathForImmutableMemoryPointer:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPointerPointsToImmutableMemory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPointerPointsToImmutableMemory:");
}

id objc_msgSend_setReadCStringFromTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReadCStringFromTarget:");
}

id objc_msgSend_setString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setString:");
}

id objc_msgSend_setThreadId_withScId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThreadId:withScId:");
}

id objc_msgSend_setUrgentSubmission_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUrgentSubmission:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedCacheAddress(void *a1, const char *a2, ...)
{
  return _[a1 sharedCacheAddress];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_short_vers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "short_vers");
}

id objc_msgSend_shouldEnableUrgentSubmission(void *a1, const char *a2, ...)
{
  return _[a1 shouldEnableUrgentSubmission];
}

id objc_msgSend_slice_uuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "slice_uuid");
}

id objc_msgSend_sortByAddressAndSetInferredSizes(void *a1, const char *a2, ...)
{
  return _[a1 sortByAddressAndSetInferredSizes];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _[a1 source];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_stashStatus_note_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stashStatus:note:");
}

id objc_msgSend_storeCohortWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeCohortWithError:");
}

id objc_msgSend_storeItemIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 storeItemIdentifier];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return _[a1 stringByStandardizingPath];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_submitWithOptions_resultsCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitWithOptions:resultsCallback:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_symbolInfo(void *a1, const char *a2, ...)
{
  return _[a1 symbolInfo];
}

id objc_msgSend_symbolicateFrame_adjusted_withSymbolicator_usingCatalog_andBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "symbolicateFrame:adjusted:withSymbolicator:usingCatalog:andBlock:");
}

id objc_msgSend_systemId(void *a1, const char *a2, ...)
{
  return _[a1 systemId];
}

id objc_msgSend_targetSharedCache_withSlide_atBaseAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetSharedCache:withSlide:atBaseAddress:");
}

id objc_msgSend_terminationReasonExceptionCode(void *a1, const char *a2, ...)
{
  return _[a1 terminationReasonExceptionCode];
}

id objc_msgSend_thread(void *a1, const char *a2, ...)
{
  return _[a1 thread];
}

id objc_msgSend_threadDictionary(void *a1, const char *a2, ...)
{
  return _[a1 threadDictionary];
}

id objc_msgSend_threadIdToScId(void *a1, const char *a2, ...)
{
  return _[a1 threadIdToScId];
}

id objc_msgSend_threadNameForThread_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "threadNameForThread:");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_total_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "total_count");
}

id objc_msgSend_treatmentId(void *a1, const char *a2, ...)
{
  return _[a1 treatmentId];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unlockWithCondition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unlockWithCondition:");
}

id objc_msgSend_unpackExceptionCodes(void *a1, const char *a2, ...)
{
  return _[a1 unpackExceptionCodes];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongValue];
}

id objc_msgSend_updateLogWritingSignatureWithSymbol_address_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLogWritingSignatureWithSymbol:address:");
}

id objc_msgSend_urgentSubmission(void *a1, const char *a2, ...)
{
  return _[a1 urgentSubmission];
}

id objc_msgSend_validKcdataItem_min_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validKcdataItem:min_size:");
}

id objc_msgSend_validateProcName(void *a1, const char *a2, ...)
{
  return _[a1 validateProcName];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_variantID(void *a1, const char *a2, ...)
{
  return _[a1 variantID];
}

id objc_msgSend_versionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 versionIdentifier];
}

id objc_msgSend_visibleName(void *a1, const char *a2, ...)
{
  return _[a1 visibleName];
}

id objc_msgSend_waitForAll(void *a1, const char *a2, ...)
{
  return _[a1 waitForAll];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:");
}