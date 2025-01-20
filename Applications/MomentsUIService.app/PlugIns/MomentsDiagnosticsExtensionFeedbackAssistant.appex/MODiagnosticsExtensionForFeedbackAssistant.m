@interface MODiagnosticsExtensionForFeedbackAssistant
- (id)attachmentsForParameters:(id)a3;
@end

@implementation MODiagnosticsExtensionForFeedbackAssistant

- (id)attachmentsForParameters:(id)a3
{
  id v3 = a3;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  if (attachmentsForParameters__onceToken != -1) {
    dispatch_once(&attachmentsForParameters__onceToken, &__block_literal_global);
  }
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v5 = (void *)attachmentsForParameters__client;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __71__MODiagnosticsExtensionForFeedbackAssistant_attachmentsForParameters___block_invoke_2;
  v25[3] = &unk_1000041C8;
  v27 = &v28;
  v6 = v4;
  v26 = v6;
  [v5 getSnapshotDictionaryForAnalyticsWithHandler:v25];
  dispatch_time_t v7 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    v8 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MODiagnosticsExtensionForFeedbackAssistant attachmentsForParameters:](v8);
    }
  }
  v9 = objc_opt_new();
  uint64_t v10 = v29[5];
  if (v10)
  {
    id v24 = 0;
    v11 = +[NSJSONSerialization dataWithJSONObject:v10 options:1 error:&v24];
    id v12 = v24;
    v13 = v12;
    if (v11)
    {
      v14 = +[NSUUID UUID];
      v15 = [v14 UUIDString];
      v16 = +[NSString stringWithFormat:@"config-%@.json", v15];
      v17 = [@"/var/mobile/Library/com.apple.MomentsDiagnosticExtension/Temp/JournalingSuggestionConfiguration" stringByAppendingPathComponent:v16];
      v18 = +[NSURL fileURLWithPath:v17 isDirectory:0];

      v19 = +[NSFileManager defaultManager];
      id v23 = v13;
      [v19 createDirectoryAtPath:@"/var/mobile/Library/com.apple.MomentsDiagnosticExtension/Temp/JournalingSuggestionConfiguration" withIntermediateDirectories:1 attributes:0 error:&v23];
      id v20 = v23;

      if (v20)
      {
        NSLog(@"Got an error: %@", v20);
      }
      else
      {
        [v11 writeToURL:v18 atomically:1];
        v21 = +[DEAttachmentItem attachmentWithPathURL:v18];
        [v21 setDeleteOnAttach:&__kCFBooleanTrue];
        [v9 addObject:v21];
      }
      v13 = v20;
    }
    else
    {
      NSLog(@"Got an error: %@", v12);
    }
  }
  _Block_object_dispose(&v28, 8);

  return v9;
}

void __71__MODiagnosticsExtensionForFeedbackAssistant_attachmentsForParameters___block_invoke(id a1)
{
  attachmentsForParameters__client = (uint64_t)objc_alloc_init((Class)MOPromptManager);

  _objc_release_x1();
}

void __71__MODiagnosticsExtensionForFeedbackAssistant_attachmentsForParameters___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (!a3) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)attachmentsForParameters:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Timed out when calling getSnapshotDictionaryForAnalyticsWithHandler", v1, 2u);
}

@end