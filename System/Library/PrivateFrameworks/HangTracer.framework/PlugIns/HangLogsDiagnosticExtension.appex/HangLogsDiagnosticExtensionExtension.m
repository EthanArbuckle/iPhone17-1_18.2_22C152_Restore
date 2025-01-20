@interface HangLogsDiagnosticExtensionExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation HangLogsDiagnosticExtensionExtension

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)attachmentsForParameters:(id)a3
{
  unsigned __int8 v58 = 0;
  v3 = +[NSFileManager defaultManager];
  unsigned int v4 = [v3 fileExistsAtPath:@"/tmp/com.apple.HangTracer.HangLogsDiagnosticExtension" isDirectory:&v58];
  int v5 = v58;

  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    v11 = shared_ht_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v61 = COERCE_DOUBLE(@"/tmp/com.apple.HangTracer.HangLogsDiagnosticExtension");
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Location for temp HangLogsDE directory %@ not usable.", buf, 0xCu);
    }
    goto LABEL_12;
  }
  v7 = +[NSFileManager defaultManager];
  unsigned __int8 v8 = [v7 fileExistsAtPath:@"/tmp/com.apple.HangTracer.HangLogsDiagnosticExtension"];

  if ((v8 & 1) == 0)
  {
    v9 = +[NSFileManager defaultManager];
    v10 = +[NSURL fileURLWithPath:@"/tmp/com.apple.HangTracer.HangLogsDiagnosticExtension"];
    id v57 = 0;
    [v9 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:&v57];
    v11 = v57;

    if (v11)
    {
      v12 = shared_ht_log_handle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [@"/tmp/com.apple.HangTracer.HangLogsDiagnosticExtension" UTF8String];
        id v14 = [v11 localizedDescription];
        id v15 = [v14 UTF8String];
        *(_DWORD *)buf = 136315394;
        double v61 = *(double *)&v13;
        __int16 v62 = 2080;
        id v63 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Error creating destination directory %s %s\n", buf, 0x16u);
      }
LABEL_12:
      v16 = &__NSArray0__struct;
      goto LABEL_45;
    }
  }
  v11 = getListOfHangArchiveFiles(@"/tmp/com.apple.HangTracer.HangLogsDiagnosticExtension");
  HTCollectHangLogsBundle(@"/tmp/com.apple.HangTracer.HangLogsDiagnosticExtension", 1);
  float v17 = 0.0;
  do
  {
    v18 = getListOfHangArchiveFiles(@"/tmp/com.apple.HangTracer.HangLogsDiagnosticExtension");
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v19 = v18;
    id v20 = [v19 countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v54;
LABEL_16:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v54 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v53 + 1) + 8 * v23);
        if ([v11 indexOfObject:v24] == (id)0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        if (v21 == (id)++v23)
        {
          id v21 = [v19 countByEnumeratingWithState:&v53 objects:v59 count:16];
          if (v21) {
            goto LABEL_16;
          }
          goto LABEL_22;
        }
      }
      v25 = v24;

      if (!v25) {
        goto LABEL_24;
      }

      v16 = objc_opt_new();
      v26 = +[DEAttachmentItem attachmentWithPath:v25];
      [v26 setDeleteOnAttach:&__kCFBooleanTrue];
      [v26 setShouldCompress:&__kCFBooleanTrue];
      v49 = v26;
      [v16 addObject:v26];
      uint64_t v27 = MGCopyAnswer();
      uint64_t v28 = MGCopyAnswer();
      v29 = objc_opt_new();
      [v29 setDateFormat:@"yyyy-MM-dd-HHmmss"];
      v30 = +[NSDate date];
      v51 = v29;
      v31 = [v29 stringFromDate:v30];
      v48 = (void *)v28;
      uint64_t v47 = v28;
      v32 = (void *)v27;
      uint64_t v33 = +[NSString stringWithFormat:@"%@-%@-%@-%@.%@", @"HangHistory", v27, v47, v31, @"log"];

      v34 = +[NSString stringWithFormat:@"%@/%@", @"/tmp/com.apple.HangTracer.HangLogsDiagnosticExtension", v33];
      v35 = getHangHistoryInfo(0);
      v36 = v35;
      v50 = (void *)v33;
      if (v35 && [v35 length])
      {
        id v52 = 0;
        unsigned __int8 v37 = [v36 writeToFile:v34 atomically:1 encoding:4 error:&v52];
        id v38 = v52;
        if (v37)
        {
          v39 = v32;
          v41 = v48;
          v40 = v49;
LABEL_39:
          id v43 = v34;
          if (chmod((const char *)[v43 UTF8String], 0x1B6u))
          {
            v44 = shared_ht_log_handle();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              double v61 = *(double *)&v43;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Failed to chmod file: %@", buf, 0xCu);
            }
          }
          v45 = +[DEAttachmentItem attachmentWithPath:v43];
          [v45 setDeleteOnAttach:&__kCFBooleanTrue];
          [v16 addObject:v45];

          goto LABEL_44;
        }
        v42 = shared_ht_log_handle();
        v39 = v32;
        v41 = v48;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          double v61 = *(double *)&v34;
          __int16 v62 = 2112;
          id v63 = v38;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Failed to write hang history log into %@ with error: %@", buf, 0x16u);
        }
        v40 = v49;
      }
      else
      {
        v42 = shared_ht_log_handle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Failed to collect hang history info", buf, 2u);
        }
        id v38 = 0;
        v39 = v32;
        v41 = v48;
        v40 = v49;
      }

      goto LABEL_39;
    }
LABEL_22:

LABEL_24:
    +[NSThread sleepForTimeInterval:0.5];
    float v17 = v17 + 0.5;
  }
  while (v17 < 60.0);
  v25 = shared_ht_log_handle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v61 = v17;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Error creating hang logs archive, timed out after %f seconds.", buf, 0xCu);
  }
  v16 = &__NSArray0__struct;
LABEL_44:

LABEL_45:
  return v16;
}

@end