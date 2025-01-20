@interface MADComputeServiceClientHandler
+ (id)clientHandlerWithXPCConnection:(id)a3;
- (MADComputeServiceClientHandler)initWithXPCConnection:(id)a3;
- (void)_storeComputeServiceRequests:(id)a3 assetURLs:(id)a4 extensionData:(id)a5 resultDirectoryURL:(id)a6 resultExtensionData:(id)a7 requestID:(id)a8;
- (void)_storeComputeServiceRequests:(id)a3 localIdentifiers:(id)a4 photoLibraryURL:(id)a5 resultDirectoryURL:(id)a6 resultExtensionData:(id)a7 requestID:(id)a8;
- (void)cancelAllRequests;
- (void)cancelWithRequestID:(id)a3;
- (void)removeWithRequestID:(id)a3 reply:(id)a4;
- (void)requestProcessing:(id)a3 assetURLs:(id)a4 extensionData:(id)a5 resultDirectoryURL:(id)a6 resultExtensionData:(id)a7 requestID:(id)a8 reply:(id)a9;
- (void)requestProcessing:(id)a3 localIdentifiers:(id)a4 photoLibraryURL:(id)a5 resultDirectoryURL:(id)a6 resultExtensionData:(id)a7 requestID:(id)a8 reply:(id)a9;
- (void)resumeWithRequestID:(id)a3 reply:(id)a4;
- (void)scheduleProcessing:(id)a3 assetURLs:(id)a4 extensionData:(id)a5 resultDirectoryURL:(id)a6 resultExtensionData:(id)a7 requestID:(id)a8 reply:(id)a9;
- (void)scheduleProcessing:(id)a3 localIdentifiers:(id)a4 photoLibraryURL:(id)a5 resultDirectoryURL:(id)a6 resultExtensionData:(id)a7 requestID:(id)a8 reply:(id)a9;
@end

@implementation MADComputeServiceClientHandler

- (MADComputeServiceClientHandler)initWithXPCConnection:(id)a3
{
  id v36 = a3;
  v48.receiver = self;
  v48.super_class = (Class)MADComputeServiceClientHandler;
  v5 = [(MADComputeServiceClientHandler *)&v48 init];
  v6 = v5;
  if (v5)
  {
    p_connection = (id *)&v5->_connection;
    objc_storeStrong((id *)&v5->_connection, a3);
    [*p_connection setExportedObject:v6];
    v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MADComputeServiceClientProtocol];
    [*p_connection setRemoteObjectInterface:v8];

    v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MADComputeServiceServerProtocol];
    [*p_connection setExportedInterface:v9];

    v10 = [*p_connection remoteObjectInterface];
    +[MADComputeService configureClientInterface:v10];

    v11 = [*p_connection exportedInterface];
    +[MADComputeService configureServerInterface:v11];

    objc_initWeak(&location, v6);
    id v12 = *p_connection;
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10009CCC4;
    v44[3] = &unk_10021C370;
    v13 = v6;
    v45 = v13;
    objc_copyWeak(&v46, &location);
    [v12 setInterruptionHandler:v44];
    id v14 = *p_connection;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10009CD94;
    v41[3] = &unk_10021C370;
    v15 = v13;
    v42 = v15;
    objc_copyWeak(&v43, &location);
    [v14 setInvalidationHandler:v41];
    uint64_t v16 = [*p_connection synchronousRemoteObjectProxyWithErrorHandler:&stru_10021C390];
    clientProxy = v15->_clientProxy;
    v15->_clientProxy = (MADComputeServiceClientProtocol *)v16;

    dispatch_group_t v18 = dispatch_group_create();
    resultsHandlerGroup = v15->_resultsHandlerGroup;
    v15->_resultsHandlerGroup = (OS_dispatch_group *)v18;

    v39 = 0;
    CFTypeRef cf = 0;
    if (*p_connection) {
      [*p_connection auditToken];
    }
    else {
      memset(&token, 0, sizeof(token));
    }
    SecTaskRef v20 = SecTaskCreateWithAuditToken(0, &token);
    SecTaskRef v38 = v20;
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    CFStringRef v21 = SecTaskCopySigningIdentifier(v20, (CFErrorRef *)&cf);
    clientBundleID = v15->_clientBundleID;
    v15->_clientBundleID = &v21->isa;

    if (v39)
    {
      CFRelease(v39);
      v39 = 0;
    }
    uint64_t v23 = SecTaskCopyTeamIdentifier();
    clientTeamID = v15->_clientTeamID;
    v15->_clientTeamID = (NSString *)v23;

    if (cf && (int)MediaAnalysisLogLevel() >= 4)
    {
      v25 = VCPLogInstance();
      os_log_type_t v26 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v25, v26))
      {
        *(_DWORD *)buf = 138412290;
        CFTypeRef v50 = cf;
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "[MADComputeServiceClientHandler] Failed to query client bundle ID (%@)", buf, 0xCu);
      }
    }
    if (v39 && (int)MediaAnalysisLogLevel() >= 4)
    {
      v27 = VCPLogInstance();
      os_log_type_t v28 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v27, v28))
      {
        *(_DWORD *)buf = 138412290;
        CFTypeRef v50 = v39;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "[MADComputeServiceClientHandler] Failed to query client team ID (%@)", buf, 0xCu);
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v29 = VCPLogInstance();
      os_log_type_t v30 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v29, v30))
      {
        v31 = v15->_clientBundleID;
        v32 = v15->_clientTeamID;
        *(_DWORD *)buf = 138412546;
        CFTypeRef v50 = v31;
        __int16 v51 = 2112;
        v52 = v32;
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "[MADComputeServiceClientHandler] Client BundleID: %@ TeamID: %@", buf, 0x16u);
      }
    }
    v33 = [[MADServiceClientTaskQueuingScheduler alloc] initWithClientBundleID:v15->_clientBundleID];
    queuingTaskScheduler = v15->_queuingTaskScheduler;
    v15->_queuingTaskScheduler = v33;

    sub_100004484((const void **)&v38);
    sub_100004484(&v39);
    sub_100004484(&cf);
    objc_destroyWeak(&v43);

    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);
  }

  return v6;
}

+ (id)clientHandlerWithXPCConnection:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithXPCConnection:v3];

  return v4;
}

- (void)_storeComputeServiceRequests:(id)a3 assetURLs:(id)a4 extensionData:(id)a5 resultDirectoryURL:(id)a6 resultExtensionData:(id)a7 requestID:(id)a8
{
  id v25 = a3;
  id v14 = a4;
  id v30 = a5;
  id v28 = a6;
  id v29 = a7;
  id v31 = a8;
  unint64_t v26 = 0;
  os_log_type_t type = VCPLogToOSLogType[6];
  while (v26 < (unint64_t)[v25 count])
  {
    v15 = [v25 objectAtIndexedSubscript:v26];
    for (unint64_t i = 0; i < (unint64_t)[v14 count]; ++i)
    {
      dispatch_group_t v18 = [v14 objectAtIndexedSubscript:i];
      v19 = [v30 objectAtIndexedSubscript:i];
      clientBundleID = self->_clientBundleID;
      id v32 = 0;
      CFStringRef v21 = +[MADManagedRequest entryWithRequestID:v31 bundleIdentifier:clientBundleID sourceIdentifier:@"FileSystem" assetIdentifier:0 assetURL:v18 assetURLExtension:v19 resultDirectoryURL:v28 resultDirectoryURLExtension:v29 request:v15 error:&v32];
      id v22 = v32;
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        uint64_t v23 = VCPLogInstance();
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v21;
          _os_log_impl((void *)&_mh_execute_header, v23, type, "[MADComputeServiceClientHandler] Added to schedule with MADRequest %@", buf, 0xCu);
        }
      }
    }

    ++v26;
  }
}

- (void)_storeComputeServiceRequests:(id)a3 localIdentifiers:(id)a4 photoLibraryURL:(id)a5 resultDirectoryURL:(id)a6 resultExtensionData:(id)a7 requestID:(id)a8
{
  id v26 = a3;
  id v14 = a4;
  id v30 = a5;
  id v28 = a6;
  id v29 = a7;
  id v31 = a8;
  unint64_t v27 = 0;
  os_log_type_t v15 = VCPLogToOSLogType[6];
  while (v27 < (unint64_t)[v26 count])
  {
    uint64_t v16 = [v26 objectAtIndexedSubscript:v27];
    for (unint64_t i = 0; i < (unint64_t)[v14 count]; ++i)
    {
      v19 = [v14 objectAtIndexedSubscript:i];
      clientBundleID = self->_clientBundleID;
      CFStringRef v21 = [v30 path];
      id v32 = 0;
      id v22 = +[MADManagedRequest entryWithRequestID:v31 bundleIdentifier:clientBundleID sourceIdentifier:v21 assetIdentifier:v19 assetURL:0 assetURLExtension:0 resultDirectoryURL:v28 resultDirectoryURLExtension:v29 request:v16 error:&v32];
      id v23 = v32;

      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v24 = VCPLogInstance();
        if (os_log_type_enabled(v24, v15))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v22;
          _os_log_impl((void *)&_mh_execute_header, v24, v15, "[MADComputeServiceClientHandler] Added to schedule with MADRequest %@", buf, 0xCu);
        }
      }
    }

    ++v27;
  }
}

- (void)requestProcessing:(id)a3 assetURLs:(id)a4 extensionData:(id)a5 resultDirectoryURL:(id)a6 resultExtensionData:(id)a7 requestID:(id)a8 reply:(id)a9
{
  id v45 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v46 = a7;
  id v18 = a8;
  v42 = (void (**)(id, void *))a9;
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_10009DB60;
  v56[3] = &unk_10021C3B8;
  v56[4] = self;
  id v19 = v18;
  id v57 = v19;
  id v43 = objc_retainBlock(v56);
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_10009DB74;
  v54[3] = &unk_10021C408;
  v54[4] = self;
  id v20 = v19;
  id v55 = v20;
  v44 = objc_retainBlock(v54);
  id v21 = [v15 count];
  if (v21 != [v16 count])
  {
    NSErrorUserInfoKey v58 = NSLocalizedDescriptionKey;
    id v22 = +[NSString stringWithFormat:@"Asset URLs and sandbox extension data count mismatches!"];
    v59 = v22;
    id v23 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    v24 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v23];

    v42[2](v42, v24);
  }
  v41 = +[NSDate now];
  [(MADComputeServiceClientHandler *)self _storeComputeServiceRequests:v45 assetURLs:v15 extensionData:v16 resultDirectoryURL:v17 resultExtensionData:v46 requestID:v20];
  for (unint64_t i = 0; i < (unint64_t)[v15 count]; ++i)
  {
    id v26 = [v15 objectAtIndexedSubscript:i];
    unint64_t v27 = [v16 objectAtIndexedSubscript:i];
    _CFURLAttachSecurityScopeToFileURL();
  }
  _CFURLAttachSecurityScopeToFileURL();
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10009E08C;
  v49[3] = &unk_10021C430;
  v49[4] = self;
  id v38 = v41;
  id v50 = v38;
  id v28 = v45;
  id v51 = v28;
  id v29 = v15;
  id v52 = v29;
  id v30 = v42;
  v53 = v30;
  v39 = objc_retainBlock(v49);
  v40 = v17;
  id v31 = v28;
  id v32 = v29;
  v33 = +[MADComputeServiceProcessingTask taskWithRequests:v28 requestID:v20 assetURLs:v29 resultDirectoryURL:v17 cancelBlock:0 progressHandler:v43 resultsHandler:v44 completionHandler:v39];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  v35 = v20;
  id v36 = [v20 hash];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10009E410;
  v47[3] = &unk_100219940;
  v37 = v30;
  objc_super v48 = v37;
  [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v33 withRequestID:v36 schedulingErrorHandler:v47];
}

- (void)requestProcessing:(id)a3 localIdentifiers:(id)a4 photoLibraryURL:(id)a5 resultDirectoryURL:(id)a6 resultExtensionData:(id)a7 requestID:(id)a8 reply:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v37 = a9;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_10009E830;
  v49[3] = &unk_10021C3B8;
  v49[4] = self;
  id v21 = v20;
  id v50 = v21;
  v39 = objc_retainBlock(v49);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10009E844;
  v47[3] = &unk_10021C458;
  void v47[4] = self;
  id v22 = v21;
  id v48 = v22;
  id v38 = objc_retainBlock(v47);
  v35 = v18;
  id v36 = v17;
  v34 = v19;
  v33 = +[NSDate now];
  [(MADComputeServiceClientHandler *)self _storeComputeServiceRequests:v15 localIdentifiers:v16 photoLibraryURL:v17 resultDirectoryURL:v18 resultExtensionData:v19 requestID:v22];
  _CFURLAttachSecurityScopeToFileURL();
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10009ED5C;
  v42[3] = &unk_10021C430;
  v42[4] = self;
  id v23 = v33;
  id v43 = v23;
  id v24 = v15;
  id v44 = v24;
  id v25 = v16;
  id v45 = v25;
  id v26 = v18;
  id v27 = v37;
  id v46 = v27;
  id v28 = objc_retainBlock(v42);
  id v29 = +[MADComputeServiceProcessingTask taskWithRequests:v24 requestID:v22 localIdentifiers:v25 photoLibraryURL:v17 resultDirectoryURL:v26 cancelBlock:0 progressHandler:v39 resultsHandler:v38 completionHandler:v28];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  id v31 = [v22 hash];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10009F0E0;
  v40[3] = &unk_100219940;
  id v32 = v27;
  id v41 = v32;
  [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v29 withRequestID:v31 schedulingErrorHandler:v40];
}

- (void)scheduleProcessing:(id)a3 assetURLs:(id)a4 extensionData:(id)a5 resultDirectoryURL:(id)a6 resultExtensionData:(id)a7 requestID:(id)a8 reply:(id)a9
{
  id v30 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = (void (**)(id, void, void *))a9;
  id v21 = [v15 count];
  if (v21 != [v16 count])
  {
    NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
    id v22 = +[NSString stringWithFormat:@"Asset URLs and sandbox extension data count mismatches!"];
    id v38 = v22;
    id v23 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    id v24 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v23];

    v20[2](v20, 0, v24);
  }
  -[MADComputeServiceClientHandler _storeComputeServiceRequests:assetURLs:extensionData:resultDirectoryURL:resultExtensionData:requestID:](self, "_storeComputeServiceRequests:assetURLs:extensionData:resultDirectoryURL:resultExtensionData:requestID:", v30, v15, v16, v17, v18, v19, v30);
  id v25 = +[MADComputeServiceBackgroundSystemTask sharedTask];
  id v32 = 0;
  [v25 submitTask:&v32];
  id v26 = v32;

  if (v26 && (int)MediaAnalysisLogLevel() >= 3)
  {
    id v27 = VCPLogInstance();
    os_log_type_t v28 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v27, v28))
    {
      id v29 = +[MADComputeServiceBackgroundSystemTask identifier];
      *(_DWORD *)buf = 138412546;
      v34 = v29;
      __int16 v35 = 2112;
      id v36 = v26;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "[MADComputeServiceClientHandler][%@] Failed to submit the BGST task with error: %@", buf, 0x16u);
    }
  }
  v20[2](v20, 1, 0);
}

- (void)scheduleProcessing:(id)a3 localIdentifiers:(id)a4 photoLibraryURL:(id)a5 resultDirectoryURL:(id)a6 resultExtensionData:(id)a7 requestID:(id)a8 reply:(id)a9
{
  id v16 = (void (**)(id, uint64_t, void))a9;
  [(MADComputeServiceClientHandler *)self _storeComputeServiceRequests:a3 localIdentifiers:a4 photoLibraryURL:a5 resultDirectoryURL:a6 resultExtensionData:a7 requestID:a8];
  id v17 = +[MADComputeServiceBackgroundSystemTask sharedTask];
  id v22 = 0;
  [v17 submitTask:&v22];
  id v18 = v22;

  if (v18 && (int)MediaAnalysisLogLevel() >= 3)
  {
    id v19 = VCPLogInstance();
    os_log_type_t v20 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v19, v20))
    {
      id v21 = +[MADComputeServiceBackgroundSystemTask identifier];
      *(_DWORD *)buf = 138412546;
      id v24 = v21;
      __int16 v25 = 2112;
      id v26 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "[MADComputeServiceClientHandler][%@] Failed to submit the BGST task with error: %@", buf, 0x16u);
    }
  }
  v16[2](v16, 1, 0);
}

- (void)resumeWithRequestID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v22 = a4;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[MADComputeServiceClientHandler] Resuming %@", buf, 0xCu);
    }
  }
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10009F9F8;
  v30[3] = &unk_10021C3B8;
  v30[4] = self;
  id v9 = v6;
  id v31 = v9;
  v10 = objc_retainBlock(v30);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10009FA0C;
  v28[3] = &unk_10021C480;
  v28[4] = self;
  id v11 = v9;
  id v29 = v11;
  id v12 = objc_retainBlock(v28);
  +[NSDate now];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10009FF24;
  v25[3] = &unk_10021C2A8;
  v25[4] = self;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v26 = v13;
  id v14 = v22;
  id v27 = v14;
  id v15 = objc_retainBlock(v25);
  id v16 = +[MADComputeServiceProcessingTask taskWithRequestID:v11 cancelBlock:0 progressHandler:v10 resultsHandler:v12 completionHandler:v15];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  id v18 = [v11 hash];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000A0218;
  v23[3] = &unk_100219940;
  id v19 = v14;
  id v24 = v19;
  [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v16 withRequestID:v18 schedulingErrorHandler:v23];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v20 = VCPLogInstance();
    os_log_type_t v21 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v20, v21))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v11;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "[MADComputeServiceClientHandler] Resumed %@", buf, 0xCu);
    }
  }
}

- (void)cancelAllRequests
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v3, v4))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[MADComputeServiceClientHandler] Call to cancel all requests", (uint8_t *)&v8, 2u);
    }
  }
  unint64_t v5 = [(MADServiceClientTaskQueuingScheduler *)self->_queuingTaskScheduler cancelAllTasks];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v6 = VCPLogInstance();
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v7))
    {
      int v8 = 134217984;
      unint64_t v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[MADComputeServiceClientHandler] Canceled %lu tasks", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)cancelWithRequestID:(id)a3
{
  id v4 = a3;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    unint64_t v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v5, v6))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "[MADComputeServiceClientHandler] Canceling %@", (uint8_t *)&v9, 0xCu);
    }
  }
  -[MADServiceClientTaskQueuingScheduler cancelTaskWithRequestID:](self->_queuingTaskScheduler, "cancelTaskWithRequestID:", [v4 hash]);
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[MADComputeServiceClientHandler] Canceled %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)removeWithRequestID:(id)a3 reply:(id)a4
{
  id v5 = a3;
  os_log_type_t v6 = (void (**)(id, uint64_t, void))a4;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[MADComputeServiceClientHandler] Removing %@", buf, 0xCu);
    }
  }
  id v15 = 0;
  uint64_t v9 = (uint64_t)+[MADManagedRequest removeRequest:v5 error:&v15];
  id v10 = v15;
  if (v9)
  {
    if ((int)MediaAnalysisLogLevel() < 6)
    {
      id v13 = 0;
      uint64_t v9 = 1;
      goto LABEL_17;
    }
    id v11 = VCPLogInstance();
    os_log_type_t v12 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v11, v12))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[MADComputeServiceClientHandler] Removed %@", buf, 0xCu);
    }
    id v13 = 0;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() < 3)
    {
      uint64_t v9 = 0;
      id v13 = v10;
      goto LABEL_17;
    }
    id v11 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v11, v14))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, v14, "[MADComputeServiceClientHandler] Failed to remove %@ - %@", buf, 0x16u);
    }
    id v13 = v10;
  }

LABEL_17:
  ((void (**)(id, uint64_t, id))v6)[2](v6, v9, v13);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsHandlerGroup, 0);
  objc_storeStrong((id *)&self->_queuingTaskScheduler, 0);
  objc_storeStrong((id *)&self->_clientTeamID, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end