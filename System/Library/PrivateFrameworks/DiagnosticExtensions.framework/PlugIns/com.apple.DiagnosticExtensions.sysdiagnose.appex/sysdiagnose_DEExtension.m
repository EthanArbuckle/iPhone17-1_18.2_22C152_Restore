@interface sysdiagnose_DEExtension
- (OS_xpc_object)connection;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3 withProgressHandler:(id)a4;
- (id)getRemoteArchives;
- (id)tryReusingSysdiagnoseForParameters:(id)a3;
- (void)dealloc;
- (void)setConnection:(id)a3;
@end

@implementation sysdiagnose_DEExtension

- (id)getRemoteArchives
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "REQUEST_TYPE", 9uLL);
  v3 = sub_1000011D4(v2);
  v4 = v3;
  if (v3)
  {
    v5 = xpc_dictionary_get_value(v3, "archive_list");
    uint64_t v6 = +[NSMutableArray array];
    v7 = (void *)v6;
    if (v5)
    {
      size_t count = xpc_array_get_count(v5);
      if (count)
      {
        size_t v9 = count;
        for (size_t i = 0; i != v9; ++i)
        {
          string = xpc_array_get_string(v5, i);
          if (string)
          {
            v12 = +[NSString stringWithUTF8String:string];
            [v7 addObject:v12];
          }
        }
      }
    }
    else
    {
      v5 = (void *)v6;
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)attachmentList
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Called attachmentList", buf, 2u);
  }
  char v26 = 0;
  v3 = +[OSASystemConfiguration sharedInstance];
  uint64_t v4 = [v3 pathSubmission];
  v5 = [(id)v4 stringByAppendingPathComponent:@"DiagnosticLogs/sysdiagnose"];
  uint64_t v6 = sub_100001750(v5);

  v7 = +[NSFileManager defaultManager];
  LOBYTE(v4) = [v7 fileExistsAtPath:v6 isDirectory:&v26];

  if (v4)
  {
    if (v26)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose dir exists", buf, 2u);
      }
      v8 = +[NSRegularExpression regularExpressionWithPattern:@"sysdiagnose_.*.tar*" options:1 error:0];
      size_t v9 = +[NSRegularExpression regularExpressionWithPattern:@"IN_PROGRESS_" options:1 error:0];
      v10 = +[NSURL fileURLWithPath:v6 isDirectory:1];
      v11 = [(sysdiagnose_DEExtension *)self filesInDir:v10 matchingPattern:v8 excludingPattern:v9];
    }
    else
    {
      v11 = 0;
    }
    *(void *)buf = 0;
    v21 = buf;
    uint64_t v22 = 0x3032000000;
    v23 = sub_100001924;
    v24 = sub_100001934;
    id v25 = 0;
    if (v11 && [v11 count])
    {
      uint64_t v13 = +[NSMutableArray arrayWithArray:v11];
    }
    else
    {
      uint64_t v13 = +[NSMutableArray array];
    }
    v14 = (void *)*((void *)v21 + 5);
    *((void *)v21 + 5) = v13;

    v15 = [(sysdiagnose_DEExtension *)self getRemoteArchives];
    v16 = v15;
    if ((!v15 || ![v15 count]) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Didn't receive a non-zero list of archives from the watch", v27, 2u);
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000193C;
    v19[3] = &unk_1000042B0;
    v19[4] = buf;
    [v16 enumerateObjectsUsingBlock:v19];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = *((void *)v21 + 5);
      *(_DWORD *)v27 = 138412290;
      uint64_t v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Returning list of paths: %@", v27, 0xCu);
    }
    id v12 = *((id *)v21 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "error: sysdiagnose directory missing.", buf, 2u);
    }
    id v12 = &__NSArray0__struct;
  }

  return v12;
}

- (id)tryReusingSysdiagnoseForParameters:(id)a3
{
  id v3 = a3;
  char v48 = 0;
  unsigned __int8 v47 = 1;
  char v46 = 0;
  sub_1000020A8(@"forceDiagnostic", v3, &v48);
  sub_1000020A8(@"shouldCreateTarBall", v3, &v47);
  sub_1000020A8(@"fbaKeychord", v3, &v46);
  if (v48)
  {
    uint64_t v4 = 0;
    goto LABEL_56;
  }
  BOOL v5 = v47;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v6, "REQUEST_TYPE", 0xBuLL);
  xpc_dictionary_set_BOOL(v6, "compress", v5);
  v7 = sub_1000011D4(v6);
  v8 = v7;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "xpc request to SD server gave nil reply", buf, 2u);
    }
    goto LABEL_8;
  }
  string = xpc_dictionary_get_string(v7, "path");
  if (!string)
  {
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v10 = +[NSString stringWithUTF8String:string];
LABEL_9:

  if (v10) {
    goto LABEL_38;
  }
  id v41 = v3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v58 = v47;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No in progress archive found for compress: %d. Checking for recent archive", buf, 8u);
  }
  int v43 = v47;
  v11 = +[NSFileManager defaultManager];
  id v12 = +[OSASystemConfiguration sharedInstance];
  uint64_t v13 = [v12 pathSubmission];
  v14 = [v13 stringByAppendingPathComponent:@"DiagnosticLogs/sysdiagnose"];
  v15 = +[NSURL fileURLWithPath:v14 isDirectory:1];
  v16 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSURLNameKey, NSURLPathKey, NSURLCreationDateKey, 0);
  v40 = v11;
  uint64_t v17 = [v11 enumeratorAtURL:v15 includingPropertiesForKeys:v16 options:7 errorHandler:&stru_1000043B8];

  uint64_t v18 = +[NSDate distantPast];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v19 = v17;
  id v20 = [v19 countByEnumeratingWithState:&v51 objects:buf count:16];
  if (!v20)
  {
    v45 = 0;
    id v24 = (id)v18;
    goto LABEL_34;
  }
  id v21 = v20;
  v45 = 0;
  uint64_t v22 = *(void *)v52;
  CFStringRef v23 = @"temp";
  id v24 = (id)v18;
  id v42 = v19;
  do
  {
    for (size_t i = 0; i != v21; size_t i = (char *)i + 1)
    {
      if (*(void *)v52 != v22) {
        objc_enumerationMutation(v19);
      }
      char v26 = *(void **)(*((void *)&v51 + 1) + 8 * i);
      id v28 = [v26 lastPathComponent];
      if ([v28 hasPrefix:@"sysdiagnose_"]
        && ([v28 containsString:v23] & 1) == 0)
      {
        CFStringRef v29 = v23;
        unsigned __int8 v30 = [v28 containsString:@"IN_PROGRESS_"];

        if (v30)
        {
          CFStringRef v23 = v29;
          goto LABEL_30;
        }
        id v50 = 0;
        [v26 getResourceValue:&v50 forKey:NSURLCreationDateKey error:0];
        id v28 = v50;
        id v49 = 0;
        [v26 getResourceValue:&v49 forKey:NSURLIsDirectoryKey error:0];
        id v31 = v49;
        if ([v28 compare:v24] == (id)1)
        {
          v44 = v24;
          if ((v43 != 0) == [v31 BOOLValue])
          {
            id v32 = v45;
          }
          else
          {
            id v24 = v28;

            id v32 = v26;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v55 = 138412290;
              id v56 = v32;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "DE found matching file %@", v55, 0xCu);
            }
          }
          id v19 = v42;
        }
        else
        {
          id v32 = v45;
        }

        v45 = v32;
        CFStringRef v23 = v29;
      }

LABEL_30:
    }
    id v21 = [v19 countByEnumeratingWithState:&v51 objects:buf count:16];
  }
  while (v21);
LABEL_34:

  id v33 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceNow:-600.0];
  if ([v24 compare:v33] == (id)1)
  {
    v34 = v45;
    v10 = [v45 path];
  }
  else
  {
    v10 = 0;
    v34 = v45;
  }

  id v3 = v41;
  if (v10)
  {
LABEL_38:
    sub_100001750(v10);
    id v35 = (id)objc_claimAutoreleasedReturnValue();

    if ([v35 hasSuffix:@".tar.gz"]) {
      unsigned int v36 = 1;
    }
    else {
      unsigned int v36 = [v35 hasSuffix:@".tar"];
    }
    if (v47) {
      unsigned int v37 = v36;
    }
    else {
      unsigned int v37 = 0;
    }
    if (v47) {
      int v38 = 1;
    }
    else {
      int v38 = v36;
    }
    if (v46 || !v38 || v37)
    {
      id v35 = v35;
      uint64_t v4 = v35;
      goto LABEL_55;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No recent archive found. Continuing to invoke new sysdiagnose", buf, 2u);
    }
    id v35 = 0;
  }
  uint64_t v4 = 0;
LABEL_55:

LABEL_56:
  return v4;
}

- (id)attachmentsForParameters:(id)a3 withProgressHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "yes";
    id v32 = "-[sysdiagnose_DEExtension attachmentsForParameters:withProgressHandler:]";
    *(_DWORD *)buf = 136315650;
    if (!v7) {
      v8 = "no";
    }
    __int16 v33 = 2080;
    v34 = v8;
    __int16 v35 = 2112;
    id v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Called %s. Progress handler passed: %s, parameters: %@", buf, 0x20u);
  }
  size_t v9 = [(sysdiagnose_DEExtension *)self tryReusingSysdiagnoseForParameters:v6];
  if (v9
    && (+[DEAttachmentItem attachmentWithPath:v9],
        (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v11 = (id)v10;
    uint64_t v30 = v10;
    id v12 = +[NSArray arrayWithObjects:&v30 count:1];
  }
  else
  {
    id v13 = [v6 copy];
    id v28 = 0;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10000250C;
    v26[3] = &unk_1000042D8;
    id v27 = v7;
    v14 = +[Libsysdiagnose sysdiagnoseWithMetadata:v13 withError:&v28 withProgressHandler:v26];
    id v11 = v28;

    BOOL v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v15)
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v14;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Returning %@ as attachment", buf, 0xCu);
      }
      unsigned __int8 v25 = 0;
      v16 = +[NSFileManager defaultManager];
      unsigned int v17 = [v16 fileExistsAtPath:v14 isDirectory:&v25];
      int v18 = v25;

      if (v17 && v18 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = +[NSFileManager defaultManager];
        id v20 = [v19 contentsOfDirectoryAtPath:v14 error:0];
        *(_DWORD *)buf = 138412290;
        id v32 = v20;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Contents of dir %@", buf, 0xCu);
      }
      id v21 = sub_100001750(v14);
      uint64_t v22 = +[DEAttachmentItem attachmentWithPath:v21];

      CFStringRef v29 = v22;
      id v12 = +[NSArray arrayWithObjects:&v29 count:1];
    }
    else
    {
      if (v15)
      {
        CFStringRef v23 = [v11 localizedDescription];
        *(_DWORD *)buf = 138543362;
        id v32 = v23;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Libsysdiagnose returned error %{public}@", buf, 0xCu);
      }
      id v12 = &__NSArray0__struct;
    }
  }
  return v12;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)sysdiagnose_DEExtension;
  [(sysdiagnose_DEExtension *)&v2 dealloc];
}

- (OS_xpc_object)connection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end