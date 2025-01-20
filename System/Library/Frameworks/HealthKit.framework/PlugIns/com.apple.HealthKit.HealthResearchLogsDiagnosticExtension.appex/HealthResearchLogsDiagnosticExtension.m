@interface HealthResearchLogsDiagnosticExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3 withProgressHandler:(id)a4;
- (id)createErrorFile:(id)a3;
@end

@implementation HealthResearchLogsDiagnosticExtension

- (id)attachmentList
{
  v3 = sub_10000364C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "attachmentList called: calling attachmentsForParameters with empty dictionary", v6, 2u);
  }

  v4 = [(HealthResearchLogsDiagnosticExtension *)self attachmentsForParameters:&__NSDictionary0__struct];

  return v4;
}

- (id)attachmentsForParameters:(id)a3 withProgressHandler:(id)a4
{
  id v6 = a3;
  id v56 = a4;
  v7 = sub_10000364C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v66 = (uint64_t)v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "attachments for parameters: %{public}@", buf, 0xCu);
  }
  id v55 = v6;

  v8 = +[NSDate now];
  v9 = [v8 dateByAddingTimeInterval:-86400.0];

  v10 = objc_opt_new();
  v11 = [v10 UUIDString];
  v12 = +[NSString stringWithFormat:@"%@-research", v11];

  v13 = NSTemporaryDirectory();
  v14 = [v13 stringByAppendingPathComponent:v12];
  v15 = +[NSURL fileURLWithPath:v14];
  v16 = [v15 URLByAppendingPathExtension:@"logs"];

  v17 = NSTemporaryDirectory();
  v18 = [v17 stringByAppendingPathComponent:v12];
  v19 = +[NSURL fileURLWithPath:v18];
  v20 = [v19 URLByAppendingPathExtension:@"logarchive"];

  v21 = sub_10000364C();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v66 = 0x40BC200000000000;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "logWindowSize (chunk): %.2f", buf, 0xCu);
  }

  v22 = sub_10000364C();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v66 = 0x40F5180000000000;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "logArchiveIntervalSize (window): %.2f", buf, 0xCu);
  }

  v23 = sub_10000364C();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = [v16 path];
    *(_DWORD *)buf = 138412290;
    uint64_t v66 = (uint64_t)v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "researchLogsURL: %@", buf, 0xCu);
  }
  v25 = sub_10000364C();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = [v20 path];
    *(_DWORD *)buf = 138412290;
    uint64_t v66 = (uint64_t)v26;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "logArchiveURL: %@", buf, 0xCu);
  }
  id v27 = [v20 path];
  [v27 UTF8String];
  [v9 timeIntervalSince1970];
  uint64_t Archive = OSLogCreateArchive();

  v29 = sub_10000364C();
  v30 = v29;
  v54 = v9;
  if (Archive)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_100009684(Archive, v30);
    }

    id v31 = +[NSString stringWithFormat:@"Error: Couldn't create OSLogArchive with status: %d", Archive];
    id v32 = [v31 dataUsingEncoding:4];
    [v32 writeToURL:v16 atomically:1];
    v33 = +[DEAttachmentItem attachmentWithPathURL:v16];
    v64 = v33;
    v34 = +[NSArray arrayWithObjects:&v64 count:1];
  }
  else
  {
    v35 = self;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Successfully triggered logArchive", buf, 2u);
    }

    id v32 = [&off_10000CBE8 mutableCopy];
    v36 = +[UIDevice currentDevice];
    v33 = [v36 name];

    [v32 addObjectsFromArray:&off_10000CC00];
    id v60 = 0;
    v37 = [[HRLDLogArchiveProcessor alloc] initWithArchiveStartDate:v9 deviceName:v33 logArchiveURL:v20 outputFileURL:v16 redactedToken:@"<REDACTED>" windowSize:&v60 error:7200.0];
    id v38 = v60;
    v53 = v37;
    if (v38)
    {
      id v31 = v38;
      v39 = sub_10000364C();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_1000095FC(v31);
      }

      v40 = [v31 localizedDescription];
      v41 = +[NSString stringWithFormat:@"Encountered error creating Log Processor: %@", v40, v53, v54];
      v42 = [(HealthResearchLogsDiagnosticExtension *)v35 createErrorFile:v41];

      v43 = +[DEAttachmentItem attachmentWithPathURL:v42];
      v63[0] = v43;
      v44 = +[DEAttachmentItem attachmentWithPathURL:v16];
      v63[1] = v44;
      v34 = +[NSArray arrayWithObjects:v63 count:2];

      id v6 = v55;
    }
    else
    {
      id v59 = 0;
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_100003F10;
      v57[3] = &unk_10000C708;
      id v58 = v56;
      [(HRLDLogArchiveProcessor *)v37 writeLogsToDiskFrom:v32 error:&v59 progressHandler:v57];
      id v31 = v59;
      v45 = sub_10000364C();
      v46 = v45;
      if (v31)
      {
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          sub_100009574(v31);
        }

        v47 = [v31 localizedDescription];
        v48 = +[NSString stringWithFormat:@"Encountered error writing logs to disk: %@", v47, v53, v54];
        v49 = [(HealthResearchLogsDiagnosticExtension *)v35 createErrorFile:v48];

        v50 = +[DEAttachmentItem attachmentWithPathURL:v49];
        v62[0] = v50;
        v51 = +[DEAttachmentItem attachmentWithPathURL:v16];
        v62[1] = v51;
        v34 = +[NSArray arrayWithObjects:v62 count:2];
      }
      else
      {
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Successfully finished Research Logging Session.", buf, 2u);
        }

        v49 = +[DEAttachmentItem attachmentWithPathURL:v16];
        v61 = v49;
        v34 = +[NSArray arrayWithObjects:&v61 count:1];
      }
      id v6 = v55;

      v42 = v58;
    }
  }

  return v34;
}

- (id)createErrorFile:(id)a3
{
  id v3 = a3;
  v4 = NSTemporaryDirectory();
  v5 = [v4 stringByAppendingPathComponent:@"session-error"];
  id v6 = +[NSURL fileURLWithPath:v5];

  v7 = [v3 dataUsingEncoding:4];

  [v7 writeToURL:v6 atomically:1];

  return v6;
}

@end