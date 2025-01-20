@interface DiagnosticExtension
- (DiagnosticExtension)init;
- (ZipManager)zipManager;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (id)createAttachments;
- (void)setZipManager:(id)a3;
@end

@implementation DiagnosticExtension

- (DiagnosticExtension)init
{
  v5.receiver = self;
  v5.super_class = (Class)DiagnosticExtension;
  v2 = [(DiagnosticExtension *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(ZipManager);
    [(DiagnosticExtension *)v2 setZipManager:v3];
  }
  return v2;
}

- (id)attachmentList
{
  if (qword_10000C6C0 != -1) {
    dispatch_once(&qword_10000C6C0, &stru_1000081F0);
  }
  v3 = *(id *)qword_10000C6C8;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    v7 = "DiagnosticExtension.mm";
    __int16 v8 = 1024;
    int v9 = 54;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d attachmentList called.", (uint8_t *)&v6, 0x12u);
  }
  v4 = [(DiagnosticExtension *)self createAttachments];
  return v4;
}

- (id)attachmentsForParameters:(id)a3
{
  id v4 = a3;
  if (qword_10000C6C0 != -1) {
    dispatch_once(&qword_10000C6C0, &stru_1000081F0);
  }
  objc_super v5 = *(id *)qword_10000C6C8;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315394;
    int v9 = "DiagnosticExtension.mm";
    __int16 v10 = 1024;
    int v11 = 60;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d attachmentsForParameters called.", (uint8_t *)&v8, 0x12u);
  }
  int v6 = [(DiagnosticExtension *)self createAttachments];

  return v6;
}

- (id)createAttachments
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v34 = v3;
  id v4 = [(DiagnosticExtension *)self zipManager];
  uint64_t v5 = [v4 createZipFor:@"/private/var/mobile/tmp/com.apple.audiomxd/AudioCapture" at:@"/private/var/mobile/Library/Logs/CrashReporter/AudioDiagnosticExtension" withStaleFileThreshold:3];

  uint64_t v30 = v5;
  if (v5) {
    objc_msgSend(v3, "addObject:", v5, v5);
  }
  int v6 = [(DiagnosticExtension *)self zipManager];
  uint64_t v7 = [v6 createZipFor:@"/var/mobile/Library/Logs/CrashReporter/Assistant/AVVCCapture" at:@"/private/var/mobile/Library/Logs/CrashReporter/AudioDiagnosticExtension" withStaleFileThreshold:3];

  v32 = (void *)v7;
  if (v7) {
    [v3 addObject:v7];
  }
  int v8 = [(DiagnosticExtension *)self zipManager];
  uint64_t v9 = [v8 createZipFor:@"/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Audio/Tailspin" at:@"/private/var/mobile/Library/Logs/CrashReporter/AudioDiagnosticExtension" withStaleFileThreshold:3];

  v33 = (void *)v9;
  if (v9) {
    [v3 addObject:v9];
  }
  id v10 = objc_alloc_init((Class)NSMutableArray);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v34;
  id v11 = [obj countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v37;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = +[DEAttachmentItem attachmentWithPath:*(void *)(*((void *)&v36 + 1) + 8 * (void)v13)];
        [v14 setDeleteOnAttach:&__kCFBooleanTrue];
        [v10 addObject:v14];
        if (qword_10000C6C0 != -1) {
          dispatch_once(&qword_10000C6C0, &stru_1000081F0);
        }
        v15 = *(id *)qword_10000C6C8;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = [v14 displayName];
          v17 = [v14 filesize];
          [v17 floatValue];
          *(_DWORD *)buf = 136315906;
          v41 = "DiagnosticExtension.mm";
          __int16 v42 = 1024;
          int v43 = 93;
          __int16 v44 = 2114;
          id v45 = v16;
          __int16 v46 = 2048;
          double v47 = v18;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created attachment. { name=%{public}@, size=%f }", buf, 0x26u);
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [obj countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v11);
  }

  if (![v10 count])
  {
    v19 = NSTemporaryDirectory();
    v20 = [v19 stringByAppendingString:@"DiagnosticExtensions.audio.empty.txt"];

    v21 = +[NSFileManager defaultManager];
    unsigned __int8 v22 = [v21 fileExistsAtPath:v20];

    if ((v22 & 1) == 0)
    {
      v23 = [@"No audio capture files found." dataUsingEncoding:4];
      v24 = +[NSFileManager defaultManager];
      [v24 createFileAtPath:v20 contents:v23 attributes:0];

      if (qword_10000C6C0 != -1) {
        dispatch_once(&qword_10000C6C0, &stru_1000081F0);
      }
      v25 = *(id *)qword_10000C6C8;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v41 = "DiagnosticExtension.mm";
        __int16 v42 = 1024;
        int v43 = 103;
        __int16 v44 = 2114;
        id v45 = v20;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%25s:%-5d No attachment found. Creating placeholder. { path=%{public}@ }", buf, 0x1Cu);
      }
    }
    v26 = +[DEAttachmentItem attachmentWithPath:v20];
    [v10 addObject:v26];
  }
  if (qword_10000C6C0 != -1) {
    dispatch_once(&qword_10000C6C0, &stru_1000081F0);
  }
  v27 = *(id *)qword_10000C6C8;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = [v10 count];
    *(_DWORD *)buf = 136315650;
    v41 = "DiagnosticExtension.mm";
    __int16 v42 = 1024;
    int v43 = 109;
    __int16 v44 = 2048;
    id v45 = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Returning attachments. { count=%lu }", buf, 0x1Cu);
  }

  return v10;
}

- (ZipManager)zipManager
{
  return self->_zipManager;
}

- (void)setZipManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end