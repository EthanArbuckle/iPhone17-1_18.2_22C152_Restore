@interface com_apple_AVConference_DiagnosticExtension
+ (id)defaultAVConferenceCachePath;
+ (id)defaultCrashReportPath;
+ (id)defaultRTCReportingPath;
+ (id)defaultSpindumpPath;
- (BOOL)copyFile:(id)a3 withPredicate:(id)a4 toSaveDirectory:(id)a5;
- (id)attachmentList;
- (int)copyDirectory:(id)a3 withPredicate:(id)a4 toSubDirectory:(id)a5;
- (int)copyDumps;
- (int)copyRTCReporting;
- (int)copySpindumps;
- (int)copyStackshotsAndCrashes;
@end

@implementation com_apple_AVConference_DiagnosticExtension

+ (id)defaultCrashReportPath
{
  return @"/private/var/mobile/Library/Logs/CrashReporter/";
}

+ (id)defaultSpindumpPath
{
  return @"/var/mobile/Library/Logs/CrashReporter/";
}

+ (id)defaultAVConferenceCachePath
{
  return @"/var/mobile/Library/Caches/com.apple.VideoConference/logs";
}

+ (id)defaultRTCReportingPath
{
  return @"/var/mobile/Library/Logs/RTCReporting/";
}

- (int)copyDirectory:(id)a3 withPredicate:(id)a4 toSubDirectory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[NSFileManager defaultManager];
  v12 = [(NSString *)self->_temporaryDirectoryURL stringByAppendingString:v10];
  if ([v11 fileExistsAtPath:v12]) {
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v38 = [v12 cStringUsingEncoding:4];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[AVCDiagnosticExtension] creating new save directory %s", buf, 0xCu);
  }
  id v30 = 0;
  [v11 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:&v30];
  id v13 = v30;
  if (!v13)
  {
LABEL_8:
    id v28 = v10;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      id v18 = [v8 cStringUsingEncoding:4];
      *(_DWORD *)buf = 136315138;
      id v38 = v18;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[AVCDiagnosticExtension] copying files from %s", buf, 0xCu);
    }
    id v19 = v8;
    v20 = +[NSURL URLWithString:](NSURL, "URLWithString:", v8, v28);
    v36[0] = NSURLNameKey;
    v36[1] = NSURLIsDirectoryKey;
    v21 = +[NSArray arrayWithObjects:v36 count:2];
    v22 = [v11 enumeratorAtURL:v20 includingPropertiesForKeys:v21 options:4 errorHandler:&__block_literal_global];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v14 = v22;
    id v23 = [v14 countByEnumeratingWithState:&v32 objects:v31 count:16];
    if (v23)
    {
      id v24 = v23;
      int v17 = 0;
      uint64_t v25 = *(void *)v33;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v33 != v25) {
            objc_enumerationMutation(v14);
          }
          v17 += [(com_apple_AVConference_DiagnosticExtension *)self copyFile:*(void *)(*((void *)&v32 + 1) + 8 * i) withPredicate:v9 toSaveDirectory:v12];
        }
        id v24 = [v14 countByEnumeratingWithState:&v32 objects:v31 count:16];
      }
      while (v24);
    }
    else
    {
      int v17 = 0;
    }

    id v8 = v19;
    id v10 = v29;
  }
  else
  {
    id v14 = v13;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      id v15 = [v14 localizedDescription];
      id v16 = [v15 cStringUsingEncoding:4];
      *(_DWORD *)buf = 136315138;
      id v38 = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[AVCDiagnosticExtension] error creating save directory: %s", buf, 0xCu);
    }
    int v17 = 0;
  }

  return v17;
}

- (BOOL)copyFile:(id)a3 withPredicate:(id)a4 toSaveDirectory:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v28 = 0;
  [v7 getResourceValue:&v28 forKey:NSURLIsDirectoryKey error:0];
  id v10 = v28;
  if (([v10 BOOLValue] & 1) == 0)
  {
    v12 = +[NSDate dateWithTimeIntervalSinceNow:-604800.0];
    id v27 = 0;
    [v7 getResourceValue:&v27 forKey:NSURLContentModificationDateKey error:0];
    id v13 = v27;
    id v14 = [v7 absoluteString];
    unsigned int v15 = [v8 evaluateWithObject:v14];

    id v16 = [v12 earlierDate:v13];

    if (v15 && v16 == v12)
    {
      int v17 = [v7 lastPathComponent];
      id v18 = [v9 stringByAppendingFormat:@"/%@", v17];
      id v19 = +[NSURL fileURLWithPath:v18];

      v20 = +[NSFileManager defaultManager];
      id v26 = 0;
      unsigned int v21 = [v20 copyItemAtURL:v7 toURL:v19 error:&v26];
      id v22 = v26;

      if (!v21)
      {

        BOOL v11 = 1;
        goto LABEL_14;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[com_apple_AVConference_DiagnosticExtension copyFile:withPredicate:toSaveDirectory:](v22);
      }
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
LABEL_12:
        BOOL v11 = 0;
LABEL_14:

        goto LABEL_15;
      }
      BOOL v23 = v16 == v12;
      id v22 = [v7 absoluteString];
      id v24 = [v22 cStringUsingEncoding:4];
      *(_DWORD *)buf = 67109634;
      unsigned int v30 = v15;
      __int16 v31 = 1024;
      BOOL v32 = v23;
      __int16 v33 = 2080;
      id v34 = v24;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[AVCDiagnosticExtension] skipping file copy (predicateMatch=%d, isNotTooOld=%d) for path=%s", buf, 0x18u);
    }

    goto LABEL_12;
  }
  BOOL v11 = 0;
LABEL_15:

  return v11;
}

- (int)copyStackshotsAndCrashes
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[AVCDiagnosticExtension] Beginning stackshot and crash file copy process", buf, 2u);
  }
  v3 = +[com_apple_AVConference_DiagnosticExtension defaultCrashReportPath];
  v4 = +[NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", @".*(audiomxd|captured|mediaserver|avconference|stacks-).*"];
  unsigned int v5 = [(com_apple_AVConference_DiagnosticExtension *)self copyDirectory:v3 withPredicate:v4 toSubDirectory:@"/CrashesAndSpins"];

  v6 = +[com_apple_AVConference_DiagnosticExtension defaultCrashReportPath];
  id v7 = [v6 stringByAppendingString:@"Retired/"];
  id v8 = +[NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", @".*(audiomxd|captured|mediaserver|avconference|stacks-).*"];
  unsigned int v9 = [(com_apple_AVConference_DiagnosticExtension *)self copyDirectory:v7 withPredicate:v8 toSubDirectory:@"/CrashesAndSpins/Retired"];

  return v9 + v5;
}

- (int)copySpindumps
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[AVCDiagnosticExtension] Beginning Spindump and Tailspin file copy process", buf, 2u);
  }
  v3 = +[com_apple_AVConference_DiagnosticExtension defaultSpindumpPath];
  v4 = +[NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", @".*(audiomxd|captured|mediaserver|avconference).*"];
  int v5 = [(com_apple_AVConference_DiagnosticExtension *)self copyDirectory:v3 withPredicate:v4 toSubDirectory:@"/CrashesAndSpins"];

  return v5;
}

- (int)copyDumps
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[AVCDiagnosticExtension] Beginning dump file copy process", buf, 2u);
  }
  v3 = +[com_apple_AVConference_DiagnosticExtension defaultAVConferenceCachePath];
  v4 = +[NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", @"dump"];
  int v5 = [(com_apple_AVConference_DiagnosticExtension *)self copyDirectory:v3 withPredicate:v4 toSubDirectory:@"/Dumps"];

  return v5;
}

- (int)copyRTCReporting
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[AVCDiagnosticExtension] Beginning RTCReporting file copy process", buf, 2u);
  }
  v3 = +[com_apple_AVConference_DiagnosticExtension defaultRTCReportingPath];
  v4 = +[NSPredicate predicateWithFormat:@"SELF LIKE %@", @"*"];
  int v5 = [(com_apple_AVConference_DiagnosticExtension *)self copyDirectory:v3 withPredicate:v4 toSubDirectory:@"/RTCReporting"];

  return v5;
}

- (id)attachmentList
{
  v3 = objc_opt_new();
  v4 = [v3 UUIDString];
  int v5 = +[NSString stringWithFormat:@"/private/var/tmp/avconference/%@/AVCDiagnosticExtensionLogs", v4];
  temporaryDirectoryURL = self->_temporaryDirectoryURL;
  self->_temporaryDirectoryURL = v5;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    id v7 = [(NSString *)self->_temporaryDirectoryURL cStringUsingEncoding:4];
    *(_DWORD *)buf = 136315138;
    unsigned int v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[AVCDiagnosticExtension] beginning to copy AVConference DiagnosticExtension files to %s", buf, 0xCu);
  }
  id v8 = [objc_alloc((Class)NSMutableString) initWithString:@"file copy results - "];
  objc_msgSend(v8, "appendFormat:", @"stackshots/crashes=%d ", -[com_apple_AVConference_DiagnosticExtension copyStackshotsAndCrashes](self, "copyStackshotsAndCrashes"));
  objc_msgSend(v8, "appendFormat:", @"dumps=%d ", -[com_apple_AVConference_DiagnosticExtension copyDumps](self, "copyDumps"));
  objc_msgSend(v8, "appendFormat:", @"rtcReports=%d ", -[com_apple_AVConference_DiagnosticExtension copyRTCReporting](self, "copyRTCReporting"));
  objc_msgSend(v8, "appendFormat:", @"spins=%d ", -[com_apple_AVConference_DiagnosticExtension copySpindumps](self, "copySpindumps"));
  unsigned int v9 = +[DEAttachmentItem attachmentWithPath:self->_temporaryDirectoryURL];
  [v9 setDisplayName:@"AVCDiagnosticExtensionLogs"];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    id v10 = (const char *)[v8 cStringUsingEncoding:4];
    *(_DWORD *)buf = 136315138;
    unsigned int v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "[AVCDiagnosticExtension] finishing AVConference DiagnosticExtension file copy process -> %s", buf, 0xCu);
  }
  id v13 = v9;
  BOOL v11 = +[NSArray arrayWithObjects:&v13 count:1];

  return v11;
}

- (void).cxx_destruct
{
}

- (void)copyFile:(void *)a1 withPredicate:toSaveDirectory:.cold.1(void *a1)
{
  id v1 = [a1 localizedDescription];
  int v2 = 136315138;
  id v3 = [v1 cStringUsingEncoding:4];
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[AVCDiagnosticExtension] error copying file! %s", (uint8_t *)&v2, 0xCu);
}

@end