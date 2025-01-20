@interface BatteryUsageAnalysisController
- (BOOL)createWorkingDirectories;
- (NSString)archivesDirectory;
- (NSString)workingDirectory;
- (id)archiveLogFile:(id)a3;
- (id)collectLogFile;
- (id)writeCurrentPowerLog;
- (void)enumerateArchivedPowerLogsWithBlock:(id)a3;
- (void)setArchivesDirectory:(id)a3;
- (void)setWorkingDirectory:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)teardown;
@end

@implementation BatteryUsageAnalysisController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  v5 = NSTemporaryDirectory();
  v6 = [v5 stringByAppendingString:@"com.apple.DiagnosticsService.Diagnostic-3743"];
  [(BatteryUsageAnalysisController *)self setWorkingDirectory:v6];

  id v8 = [(BatteryUsageAnalysisController *)self workingDirectory];
  v7 = [v8 stringByAppendingString:@"/archives/"];
  [(BatteryUsageAnalysisController *)self setArchivesDirectory:v7];
}

- (void)start
{
  if (([(BatteryUsageAnalysisController *)self isCancelled] & 1) == 0
    && [(BatteryUsageAnalysisController *)self createWorkingDirectories])
  {
    v3 = [(BatteryUsageAnalysisController *)self collectLogFile];
    if (([(BatteryUsageAnalysisController *)self isCancelled] & 1) == 0 && v3)
    {
      v7 = v3;
      v4 = +[NSArray arrayWithObjects:&v7 count:1];
      v5 = [(BatteryUsageAnalysisController *)self result];
      [v5 setFiles:v4];

      v6 = [(BatteryUsageAnalysisController *)self result];
      [v6 setStatusCode:&off_100004340];
    }
  }
  [(BatteryUsageAnalysisController *)self setFinished:1];
}

- (void)teardown
{
  id v4 = +[NSFileManager defaultManager];
  v3 = [(BatteryUsageAnalysisController *)self workingDirectory];
  [v4 removeItemAtPath:v3 error:0];
}

- (id)collectLogFile
{
  uint64_t v42 = 0;
  v43[0] = &v42;
  v43[1] = 0x3032000000;
  v43[2] = sub_100001F24;
  v43[3] = sub_100001F34;
  id v44 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 1;
  v3 = +[DSMutableArchive archive];
  [v3 setFormat:2];
  id v4 = [(BatteryUsageAnalysisController *)self writeCurrentPowerLog];
  if (v4 && ![(BatteryUsageAnalysisController *)self isCancelled])
  {
    v5 = v39;
    if (*((unsigned char *)v39 + 24))
    {
      v9 = (id *)(v43[0] + 40);
      id v37 = *(id *)(v43[0] + 40);
      unsigned __int8 v10 = [v3 addURL:v4 prefix:@"PLArchive" error:&v37];
      objc_storeStrong(v9, v37);
      v5 = v39;
      if ((v10 & 1) == 0)
      {
        *((unsigned char *)v39 + 24) = 0;
        v11 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_100002C44((uint64_t)v43, v11, v12, v13, v14, v15, v16, v17);
        }

        v18 = +[DASharedTestStatusHelper statusCodeForArchiveError:*(void *)(v43[0] + 40)];
        v19 = [(BatteryUsageAnalysisController *)self result];
        [v19 setStatusCode:v18];

        v5 = v39;
      }
    }
  }
  else
  {
    v5 = v39;
    *((unsigned char *)v39 + 24) = 0;
  }
  if (*((unsigned char *)v5 + 24)
    && ([(BatteryUsageAnalysisController *)self isCancelled] & 1) == 0)
  {
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100001F3C;
    v33[3] = &unk_100004188;
    v33[4] = self;
    id v34 = v3;
    v35 = &v42;
    v36 = &v38;
    [(BatteryUsageAnalysisController *)self enumerateArchivedPowerLogsWithBlock:v33];
  }
  if (!*((unsigned char *)v39 + 24)
    || ([(BatteryUsageAnalysisController *)self isCancelled] & 1) != 0)
  {
LABEL_20:
    id v8 = 0;
    if (!v4) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  v6 = DKTemporaryDirectoryURL();
  v7 = (id *)(v43[0] + 40);
  id obj = *(id *)(v43[0] + 40);
  id v8 = [v3 archiveAsTempFileWithTemplate:@"com.apple.behaviorscan.XXXXXXXX" directory:v6 suffix:0 error:&obj];
  objc_storeStrong(v7, obj);

  if (!v8)
  {
    *((unsigned char *)v39 + 24) = 0;
    v20 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100002BD0((uint64_t)v43, v20, v21, v22, v23, v24, v25, v26);
    }

    v27 = +[DASharedTestStatusHelper statusCodeForArchiveError:*(void *)(v43[0] + 40)];
    v28 = [(BatteryUsageAnalysisController *)self result];
    [v28 setStatusCode:v27];

    goto LABEL_20;
  }
  if (v4)
  {
LABEL_21:
    v29 = +[NSFileManager defaultManager];
    v30 = [v4 path];
    [v29 removeItemAtPath:v30 error:0];
  }
LABEL_22:

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  return v8;
}

- (id)writeCurrentPowerLog
{
  v3 = +[NSUUID UUID];
  id v4 = [v3 UUIDString];
  v5 = +[NSString stringWithFormat:@"ID_%@.PLSQL", v4];

  v6 = [(BatteryUsageAnalysisController *)self workingDirectory];
  v7 = [v6 stringByAppendingPathComponent:v5];

  CFStringRef v29 = @"path";
  v30 = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  v9 = PLQueryRegistered();
  unsigned __int8 v10 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    CFStringRef v24 = @"SafeLogFile";
    __int16 v25 = 2112;
    uint64_t v26 = v8;
    __int16 v27 = 2112;
    v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Powerlog] PLQueryRegistered[%@], input = %@, output = %@", buf, 0x20u);
  }

  v11 = [v9 objectForKeyedSubscript:@"path"];
  if (v11)
  {
    uint64_t v12 = [(BatteryUsageAnalysisController *)self archiveLogFile:v11];
    uint64_t v13 = +[NSFileManager defaultManager];
    [v13 removeItemAtPath:v11 error:0];
  }
  else
  {
    uint64_t v14 = [(BatteryUsageAnalysisController *)self result];
    [v14 setStatusCode:&off_100004358];

    uint64_t v13 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100002D30(v13, v15, v16, v17, v18, v19, v20, v21);
    }
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)createWorkingDirectories
{
  v3 = +[NSFileManager defaultManager];
  id v4 = [(BatteryUsageAnalysisController *)self workingDirectory];
  [v3 removeItemAtPath:v4 error:0];

  v5 = +[NSFileManager defaultManager];
  v6 = [(BatteryUsageAnalysisController *)self archivesDirectory];
  unsigned __int8 v7 = [v5 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0];

  if ((v7 & 1) == 0)
  {
    id v8 = [(BatteryUsageAnalysisController *)self result];
    [v8 setStatusCode:&off_100004370];

    v9 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100002D68(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  return v7;
}

- (void)enumerateArchivedPowerLogsWithBlock:(id)a3
{
  v32 = (void (**)(id, void *))a3;
  CFStringRef v39 = @"folder";
  id v4 = [(BatteryUsageAnalysisController *)self archivesDirectory];
  uint64_t v40 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];

  v6 = PLQueryRegistered();
  unsigned __int8 v7 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    CFStringRef v34 = @"Archives";
    __int16 v35 = 2112;
    v36 = v5;
    __int16 v37 = 2112;
    uint64_t v38 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[Powerlog] PLQueryRegistered[%@], input = %@, output = %@", buf, 0x20u);
  }

  id v8 = [(BatteryUsageAnalysisController *)self archivesDirectory];
  v9 = [v6 objectForKeyedSubscript:@"folder"];
  unsigned __int8 v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    v31 = v6;
    uint64_t v11 = +[NSFileManager defaultManager];
    uint64_t v12 = [(BatteryUsageAnalysisController *)self archivesDirectory];
    uint64_t v13 = [v11 enumeratorAtPath:v12];

    uint64_t v14 = [v13 nextObject];
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      do
      {
        uint64_t v16 = [(BatteryUsageAnalysisController *)self archivesDirectory];
        uint64_t v17 = +[NSString stringWithFormat:@"%@/%@", v16, v15];

        buf[0] = 0;
        uint64_t v18 = +[NSFileManager defaultManager];
        unsigned int v19 = [v18 fileExistsAtPath:v17 isDirectory:buf];

        if (v19) {
          BOOL v20 = buf[0] == 0;
        }
        else {
          BOOL v20 = 0;
        }
        if (v20 && [v15 hasSuffix:@".PLSQL.gz"])
        {
          uint64_t v21 = +[NSURL fileURLWithPath:v17];
          v32[2](v32, v21);
        }
        uint64_t v22 = [v13 nextObject];

        uint64_t v15 = (void *)v22;
      }
      while (v22);
    }
    uint64_t v23 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[Powerlog] Gathering archived powerlogs completed successfully", buf, 2u);
    }

    v6 = v31;
  }
  else
  {
    uint64_t v13 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100002DA0(v13, v24, v25, v26, v27, v28, v29, v30);
    }
  }
}

- (id)archiveLogFile:(id)a3
{
  id v4 = a3;
  id v43 = [v4 stringByAppendingString:@".gz"];
  uint64_t v5 = 6;
  v6 = "[Archive] Attempting to open file for reading.";
  unsigned __int8 v7 = "[ERROR] Cannot open read file [%@] for reading: (%d) %s";
  while (1)
  {
    id v8 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    }

    id v9 = v4;
    unsigned __int8 v10 = fopen((const char *)[v9 UTF8String], "r");
    +[NSThread sleepForTimeInterval:5.0];
    if (v10) {
      break;
    }
    uint64_t v11 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = v6;
      uint64_t v13 = self;
      uint64_t v14 = v7;
      int v15 = *__error();
      uint64_t v16 = __error();
      uint64_t v17 = strerror(*v16);
      *(_DWORD *)buf = 138412802;
      id v45 = v4;
      __int16 v46 = 1024;
      int v47 = v15;
      unsigned __int8 v7 = v14;
      self = v13;
      v6 = v12;
      __int16 v48 = 2080;
      v49 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v7, buf, 0x1Cu);
    }

    if ((unint64_t)--v5 <= 1)
    {
      v31 = [(BatteryUsageAnalysisController *)self result];
      [v31 setStatusCode:&off_1000043B8];

      v32 = 0;
      v33 = v43;
      goto LABEL_21;
    }
  }
  v33 = v43;
  id v18 = v43;
  unsigned int v19 = fopen((const char *)[v18 UTF8String], "w");
  if (!v19)
  {
    CFStringRef v34 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_100002DD8((uint64_t)v4, v34, v35, v36, v37, v38, v39, v40);
    }

    char v41 = [(BatteryUsageAnalysisController *)self result];
    [v41 setStatusCode:&off_1000043A0];

    goto LABEL_17;
  }
  BOOL v20 = v19;
  int v21 = CPFileCompressionZDeflate();
  uint64_t v22 = DiagnosticLogHandleForCategory();
  uint64_t v23 = v22;
  if (v21)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100002E44((uint64_t)v4, v23, v24, v25, v26, v27, v28, v29);
    }

    uint64_t v30 = [(BatteryUsageAnalysisController *)self result];
    [v30 setStatusCode:&off_100004388];

    fclose(v20);
LABEL_17:
    fclose(v10);
    v32 = 0;
    goto LABEL_21;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v45 = v4;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[Archive] Archive created successfully for file: %@", buf, 0xCu);
  }

  fclose(v20);
  fclose(v10);
  v32 = +[NSURL fileURLWithPath:v18];
LABEL_21:

  return v32;
}

- (NSString)workingDirectory
{
  return self->_workingDirectory;
}

- (void)setWorkingDirectory:(id)a3
{
}

- (NSString)archivesDirectory
{
  return self->_archivesDirectory;
}

- (void)setArchivesDirectory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivesDirectory, 0);

  objc_storeStrong((id *)&self->_workingDirectory, 0);
}

@end