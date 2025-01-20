@interface CLDiagnosticExtension
- (id)attachmentsForParameters:(id)a3;
@end

@implementation CLDiagnosticExtension

- (id)attachmentsForParameters:(id)a3
{
  id v3 = a3;
  v4 = os_log_create("com.apple.locationd.Utility", "Core");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#diagnosticExtension attachmentsForParameters,called with parameters %@", buf, 0xCu);
  }
  id v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = +[DEAttachmentItem attachmentWithPath:@"/var/mobile/Library/Logs/gpsd"];
  [v5 addObject:v6];

  v7 = +[DEAttachmentItem attachmentWithPath:@"/var/mobile/Library/Logs/raven"];
  [v5 addObject:v7];

  v8 = +[DEAttachmentItem attachmentWithPath:@"/var/mobile/Library/Logs/vision"];
  [v5 addObject:v8];

  v9 = +[DEAttachmentItem attachmentWithPath:@"/var/mobile/Library/Logs/locationd/locctl"];
  [v5 addObject:v9];

  v10 = +[DEAttachmentItem attachmentWithPath:@"/var/mobile/Library/Logs/locationd/MslLogger"];
  [v5 addObject:v10];

  v11 = +[DEAttachmentItem attachmentWithPath:@"/var/mobile/Library/Logs/locationd/routesmoother"];
  [v5 addObject:v11];

  v12 = +[DEAttachmentItem attachmentWithPath:@"/var/mobile/Library/Logs/locationd/trackrun"];
  [v5 addObject:v12];

  v13 = +[DEAttachmentItem attachmentWithPath:@"/var/mobile/Library/Logs/locationd/fence"];
  [v5 addObject:v13];

  v14 = +[DEAttachmentItem attachmentWithPath:@"/var/mobile/Library/Logs/CrashReporter/com.apple.locationd/fence"];
  [v5 addObject:v14];

  v15 = +[DEAttachmentItem attachmentWithPath:@"/var/mobile/Library/Logs/CrashReporter/gpsd"];
  [v5 addObject:v15];

  v16 = +[DEAttachmentItem attachmentWithPath:@"/var/mobile/Library/Logs/CrashReporter/raven"];
  [v5 addObject:v16];

  v17 = +[DEAttachmentItem attachmentWithPath:@"/var/mobile/Library/Logs/CrashReporter/vision"];
  [v5 addObject:v17];

  v18 = +[DEAttachmentItem attachmentWithPath:@"/var/mobile/Library/Logs/CrashReporter/com.apple.locationd/locctl"];
  [v5 addObject:v18];

  v19 = +[DEAttachmentItem attachmentWithPath:@"/var/mobile/Library/Logs/CrashReporter/com.apple.locationd/routesmoother"];
  [v5 addObject:v19];

  v20 = +[DEAttachmentItem attachmentWithPath:@"/var/mobile/Library/Logs/CrashReporter/com.apple.locationd/trackrun"];
  [v5 addObject:v20];

  dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
  v22 = dispatch_get_global_queue(0, 0);
  v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  v31 = sub_100003754;
  v32 = &unk_1000040F8;
  v23 = v4;
  v33 = v23;
  v24 = v21;
  v34 = v24;
  dispatch_async(v22, &v29);

  dispatch_time_t v25 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v24, v25) && os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#diagnosticExtension CLGetPipelinedCache timeout", buf, 2u);
  }
  v26 = +[DEAttachmentItem attachmentWithPath:@"/var/mobile/Library/Logs/pipelined", v29, v30, v31, v32];
  [v5 addObject:v26];

  v27 = +[DEAttachmentItem attachmentWithPath:@"/var/mobile/Library/Logs/CrashReporter/pipelined"];
  [v5 addObject:v27];

  return v5;
}

@end