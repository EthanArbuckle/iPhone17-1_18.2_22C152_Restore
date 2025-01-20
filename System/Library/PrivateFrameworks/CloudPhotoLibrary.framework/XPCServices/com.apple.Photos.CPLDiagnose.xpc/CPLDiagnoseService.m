@interface CPLDiagnoseService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CPLDiagnoseService)init;
- (id)_hardwareString;
- (id)_stringForSysctlKey:(id)a3;
- (id)applicationIdentifierForConnection:(id)a3;
- (id)diagnosticFilename:(BOOL)a3;
- (unsigned)takeUserIdlePowerAssertionWithInterval:(double)a3;
- (void)checkStateWithReplyHandler:(id)a3;
- (void)didInvalidateClientConnectionWithIdentifier:(id)a3;
- (void)notifyClientsStateChangedOnQueue;
- (void)releasePowerAssertion:(unsigned int)a3;
- (void)runDiagnoseWithLibraryURL:(id)a3 bundleID:(id)a4 outputDirectoryURL:(id)a5 includeDatabases:(BOOL)a6 includeSysdiagnose:(BOOL)a7 excludeSPLAndSyndication:(BOOL)a8 replyHandler:(id)a9;
- (void)runDiagnoseWithOptions:(id)a3 replyHandler:(id)a4;
@end

@implementation CPLDiagnoseService

- (CPLDiagnoseService)init
{
  v9.receiver = self;
  v9.super_class = (Class)CPLDiagnoseService;
  v2 = [(CPLDiagnoseService *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    dispatch_queue_t v4 = dispatch_queue_create("CPLDiagnose.queue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    clientsByIdentifier = v3->_clientsByIdentifier;
    v3->_clientsByIdentifier = v6;
  }
  return v3;
}

- (id)_stringForSysctlKey:(id)a3
{
  size_t v5 = 256;
  if (sysctlbyname((const char *)[a3 UTF8String], v6, &v5, 0, 0))
  {
    v3 = @"UNKNOWN";
  }
  else
  {
    v6[v5 - 1] = 0;
    v3 = +[NSString stringWithUTF8String:v6];
  }
  return v3;
}

- (id)_hardwareString
{
  if (qword_100041410 != -1) {
    dispatch_once(&qword_100041410, &stru_100035508);
  }
  v2 = (void *)qword_100041408;
  return v2;
}

- (id)diagnosticFilename:(BOOL)a3
{
  v12.tv_sec = 0;
  *(void *)&v12.tv_usec = 0;
  memset(&v11, 0, sizeof(v11));
  gettimeofday(&v12, 0);
  size_t v5 = localtime_r(&v12.tv_sec, &v11);
  strftime_l(v13, 0x28uLL, "%Y%m%d-%H%M%S", v5, 0);
  if (a3) {
    v6 = &stru_1000359E8;
  }
  else {
    v6 = (__CFString *)CPLDiagnosticsNoDatabases;
  }
  v7 = [(CPLDiagnoseService *)self _hardwareString];
  if ([v7 length])
  {
    uint64_t v8 = [v7 stringByReplacingOccurrencesOfString:@"," withString:@"-"];

    objc_super v9 = +[NSString stringWithFormat:@"%@-%@-T%s%@.tgz", CPLDiagnosticsName, v8, v13, v6, *(void *)&v11.tm_sec, *(void *)&v11.tm_hour, *(void *)&v11.tm_mon, *(void *)&v11.tm_wday, *(void *)&v11.tm_isdst, v11.tm_gmtoff, v11.tm_zone];
    v7 = (void *)v8;
  }
  else
  {
    objc_super v9 = +[NSString stringWithFormat:@"%@-T%s%@.tgz", CPLDiagnosticsName, v13, v6];
  }

  return v9;
}

- (void)runDiagnoseWithOptions:(id)a3 replyHandler:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  v7 = [v16 objectForKeyedSubscript:@"LibraryURL"];
  uint64_t v8 = [v16 objectForKeyedSubscript:@"DiagnosticBundleID"];
  objc_super v9 = [v16 objectForKeyedSubscript:@"IncludeDatabases"];
  v10 = v9;
  if (v9) {
    uint64_t v11 = (uint64_t)[v9 BOOLValue];
  }
  else {
    uint64_t v11 = 1;
  }
  timeval v12 = [v16 objectForKeyedSubscript:@"IncludeSysdiagnose"];
  id v13 = [v12 BOOLValue];

  v14 = [v16 objectForKeyedSubscript:@"ExcludeSPLAndSyndication"];
  id v15 = [v14 BOOLValue];

  [(CPLDiagnoseService *)self runDiagnoseWithLibraryURL:v7 bundleID:v8 outputDirectoryURL:0 includeDatabases:v11 includeSysdiagnose:v13 excludeSPLAndSyndication:v15 replyHandler:v6];
}

- (void)runDiagnoseWithLibraryURL:(id)a3 bundleID:(id)a4 outputDirectoryURL:(id)a5 includeDatabases:(BOOL)a6 includeSysdiagnose:(BOOL)a7 excludeSPLAndSyndication:(BOOL)a8 replyHandler:(id)a9
{
  BOOL v9 = a8;
  BOOL v11 = a6;
  id v40 = a3;
  id v15 = a4;
  id v41 = a5;
  id v16 = a9;
  unsetenv("TMPDIR");
  v17 = [(CPLDiagnoseService *)self diagnosticFilename:v11];
  id v18 = objc_alloc((Class)NSURL);
  id v19 = [v18 initFileURLWithPath:CPLDiagnosticsLogsPath isDirectory:1];
  v20 = [v19 URLByAppendingPathComponent:v17];
  objc_storeStrong((id *)&self->_diagnosticFileURL, v20);
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F1C8;
  block[3] = &unk_100035530;
  block[4] = self;
  v49 = &v50;
  id v22 = v16;
  id v48 = v22;
  dispatch_sync((dispatch_queue_t)queue, block);
  if (*((unsigned char *)v51 + 24))
  {
    [(CPLDiagnoseService *)self releasePowerAssertion:0];
    v62[0] = NSLocalizedDescriptionKey;
    v62[1] = NSLocalizedFailureReasonErrorKey;
    v63[0] = @"Diagnostic request failed";
    v63[1] = @"Diagnose already in progress";
    v23 = +[NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:2];
    v24 = +[NSError errorWithDomain:CPLDiagnosticsService code:101 userInfo:v23];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100020A10();
    }
    (*((void (**)(id, void, void, void *))v22 + 2))(v22, 0, 0, v24);

    goto LABEL_26;
  }
  uint64_t v61 = 0;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v39 = CPLDiagnosticsService;
  v56[0] = [CPLDiagnosticsService UTF8String];
  v56[1] = "-S";
  v56[2] = "-o";
  id v25 = [v20 path];
  v56[3] = [v25 fileSystemRepresentation];

  if (v11)
  {
    uint64_t v26 = 4;
    if (a7) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  *(void *)&long long v57 = "-D";
  uint64_t v26 = 5;
  if (!a7)
  {
LABEL_9:
    v56[v26] = "-s";
    uint64_t v26 = (v26 + 1);
  }
LABEL_10:
  if (v15)
  {
    v56[v26] = "-b";
    id v27 = [v15 UTF8String];
    int v28 = v26 + 1;
    uint64_t v26 = (v26 + 2);
    v56[v28] = v27;
  }
  if (v9)
  {
    v56[v26] = "-n";
    uint64_t v26 = (v26 + 1);
  }
  v29 = objc_alloc_init(CPLDiagnoseCommand);
  v30 = objc_alloc_init(CPLOutput);
  [(CPLCTLCommand *)v29 beginOutputTo:v30];

  [(CPLDiagnoseCommand *)v29 parseCommandOptionsWithArgc:v26 argv:v56];
  v31 = self->_queue;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10001F210;
  v46[3] = &unk_100034BA0;
  v46[4] = self;
  dispatch_barrier_sync((dispatch_queue_t)v31, v46);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "starting cpldiagnose", buf, 2u);
  }
  uint64_t v32 = [(CPLDiagnoseService *)self takeUserIdlePowerAssertionWithInterval:1800.0];
  v33 = (void *)os_transaction_create();
  if ([(CPLDiagnoseCommand *)v29 execute])
  {
    [(CPLDiagnoseService *)self releasePowerAssertion:v32];
    v54[0] = NSLocalizedDescriptionKey;
    v54[1] = NSLocalizedFailureReasonErrorKey;
    v55[0] = @"Diagnostic request failed";
    v55[1] = @"Error running Photos Diagnostic.";
    v34 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];
    v35 = +[NSError errorWithDomain:v39 code:105 userInfo:v34];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100020A10();
    }
    v36 = self->_queue;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10001F218;
    v43[3] = &unk_100035558;
    v43[4] = self;
    id v44 = v35;
    id v37 = v35;
    dispatch_barrier_sync((dispatch_queue_t)v36, v43);
  }
  else
  {
    if (v33) {

    }
    [(CPLDiagnoseService *)self releasePowerAssertion:v32];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "finished cpldiagnose", buf, 2u);
    }
    v38 = self->_queue;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10001F264;
    v42[3] = &unk_100034BA0;
    v42[4] = self;
    dispatch_barrier_sync((dispatch_queue_t)v38, v42);
  }

LABEL_26:
  _Block_object_dispose(&v50, 8);
}

- (void)checkStateWithReplyHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001F30C;
  v7[3] = &unk_100034FF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (void)notifyClientsStateChangedOnQueue
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  clientsByIdentifier = self->_clientsByIdentifier;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001F3A8;
  v4[3] = &unk_100035580;
  v4[4] = self;
  [(NSMutableDictionary *)clientsByIdentifier enumerateKeysAndObjectsUsingBlock:v4];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 valueForEntitlement:@"com.apple.private.Photos.CPLDiagnose"];
  unsigned int v9 = [v8 BOOLValue];

  if (v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "validated connection", (uint8_t *)buf, 2u);
    }
    v10 = +[NSUUID UUID];
    BOOL v11 = [v10 UUIDString];

    timeval v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CPLDiagnoseServiceProtocol];
    [v7 setExportedInterface:v12];

    id v13 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CPLDiagnoseServiceClientProtocol];
    [v7 setRemoteObjectInterface:v13];

    [v7 setExportedObject:self];
    CFStringRef v33 = @"connectionIdentifier";
    v34 = v11;
    v14 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    [v7 setUserInfo:v14];

    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001F748;
    block[3] = &unk_1000350C8;
    block[4] = self;
    id v16 = v7;
    id v31 = v16;
    id v17 = v11;
    id v32 = v17;
    dispatch_barrier_sync((dispatch_queue_t)queue, block);
    objc_initWeak(buf, self);
    v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    id v25 = sub_10001F780;
    uint64_t v26 = &unk_1000355A8;
    objc_copyWeak(&v28, buf);
    id v18 = (__CFString *)v17;
    id v27 = v18;
    [v16 setInvalidationHandler:&v23];
    objc_msgSend(v16, "resume", v23, v24, v25, v26);

    objc_destroyWeak(&v28);
    objc_destroyWeak(buf);
  }
  else
  {
    uint64_t v19 = [(CPLDiagnoseService *)self applicationIdentifierForConnection:v7];
    v20 = (void *)v19;
    v21 = @"anonymous";
    if (v19) {
      v21 = (__CFString *)v19;
    }
    id v18 = v21;

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100020A80();
    }
  }

  return v9;
}

- (void)didInvalidateClientConnectionWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001F86C;
  v7[3] = &unk_100035558;
  id v8 = v4;
  unsigned int v9 = self;
  id v6 = v4;
  dispatch_barrier_async((dispatch_queue_t)queue, v7);
}

- (id)applicationIdentifierForConnection:(id)a3
{
  id v3 = a3;
  if (qword_100041420 != -1) {
    dispatch_once(&qword_100041420, &stru_1000355C8);
  }
  id v4 = [v3 valueForEntitlement:@"application-identifier"];
  size_t v5 = v4;
  if (!v4 || [v4 hasPrefix:@"com.apple."])
  {
    id v6 = v5;
    goto LABEL_14;
  }
  id v7 = objc_msgSend((id)qword_100041418, "matchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  if ([v7 count] != (id)1) {
    goto LABEL_10;
  }
  id v8 = [v7 objectAtIndex:0];
  if ([v8 numberOfRanges] != (id)2)
  {

LABEL_10:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100020AF0();
    }
    id v6 = 0;
    goto LABEL_13;
  }
  id v9 = [v8 rangeAtIndex:1];
  objc_msgSend(v5, "substringWithRange:", v9, v10);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
LABEL_14:

  return v6;
}

- (unsigned)takeUserIdlePowerAssertionWithInterval:(double)a3
{
  IOPMAssertionID AssertionID = 0;
  IOReturn v4 = IOPMAssertionCreateWithDescription(@"PreventUserIdleSystemSleep", CPLDiagnosticsService, @"PhotosDiagnostics gathering diagnostics", 0, 0, a3, @"TimeoutActionTurnOff", &AssertionID);
  unsigned int result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (result)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v8) = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "failed to take power assertion: %d", buf, 8u);
      return 0;
    }
  }
  else
  {
    if (result)
    {
      *(_DWORD *)buf = 134217984;
      double v8 = a3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "taking power assertion for %.0fsec", buf, 0xCu);
    }
    return AssertionID;
  }
  return result;
}

- (void)releasePowerAssertion:(unsigned int)a3
{
  if (a3)
  {
    IOPMAssertionRelease(a3);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "release power assertion", v3, 2u);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientsByIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_diagnosticFileURL, 0);
}

@end