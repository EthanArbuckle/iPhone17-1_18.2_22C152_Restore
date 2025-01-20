@interface VCPMADServicePublicClientHandler
+ (id)clientHandlerWithXPCConnection:(id)a3;
- (VCPMADServicePublicClientHandler)init;
- (VCPMADServicePublicClientHandler)initWithXPCConnection:(id)a3;
- (id).cxx_construct;
- (int64_t)consumeSandboxExtension:(id)a3 url:(id)a4;
- (void)cacheHitWithQueryID:(unint64_t)a3 cachedResultQueryID:(unint64_t)a4;
- (void)cacheHitWithQueryID:(unint64_t)a3 cachedResultQueryID:(unint64_t)a4 engagementSuggestionType:(id)a5;
- (void)cancelAllRequests;
- (void)cancelRequest:(int)a3;
- (void)currentOutstandingTasksWithReply:(id)a3;
- (void)endEntryPoint;
- (void)queryUserSafetyEnablement:(id)a3;
- (void)requestImageProcessing:(id)a3 forAssetURL:(id)a4 withSandboxToken:(id)a5 identifier:(id)a6 requestID:(int)a7 andReply:(id)a8;
- (void)requestImageProcessing:(id)a3 forIOSurface:(id)a4 withOrientation:(unsigned int)a5 identifier:(id)a6 requestID:(int)a7 andReply:(id)a8;
- (void)requestMultiModalPrewarming:(id)a3 requestID:(int)a4 reply:(id)a5;
- (void)requestProcessing:(id)a3 multiModalInputs:(id)a4 requestID:(int)a5 reply:(id)a6;
- (void)requestTextPrewarming:(id)a3 requestID:(int)a4 reply:(id)a5;
- (void)requestTextProcessing:(id)a3 textInputs:(id)a4 requestID:(int)a5 reply:(id)a6;
- (void)requestVideoProcessing:(id)a3 assetURL:(id)a4 sandboxToken:(id)a5 identifier:(id)a6 requestID:(int)a7 reply:(id)a8;
- (void)startEntryPointWithQueryID:(unint64_t)a3;
- (void)startEntryPointWithQueryID:(unint64_t)a3 andEvent:(unint64_t)a4;
- (void)submitSpotlightAssetURL:(id)a3 uniqueIdentifier:(id)a4 bundleIdentifier:(id)a5 typeIdentifier:(id)a6 sandboxToken:(id)a7 reply:(id)a8;
@end

@implementation VCPMADServicePublicClientHandler

- (VCPMADServicePublicClientHandler)init
{
  return 0;
}

- (VCPMADServicePublicClientHandler)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v45.receiver = self;
  v45.super_class = (Class)VCPMADServicePublicClientHandler;
  v6 = [(VCPMADServicePublicClientHandler *)&v45 init];
  v7 = v6;
  if (v6)
  {
    p_connection = (id *)&v6->_connection;
    objc_storeStrong((id *)&v6->_connection, a3);
    objc_initWeak(&location, v7);
    [*p_connection setExportedObject:v7];
    id v9 = *p_connection;
    v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___VCPMediaAnalysisClientProtocol];
    [v9 setRemoteObjectInterface:v10];

    v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___VCPMADServicePublicServerProtocol];
    +[MADServicePublic configureServerInterface:v11];
    [*p_connection setExportedInterface:v11];
    id v12 = *p_connection;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1000061BC;
    v42[3] = &unk_1002198D0;
    objc_copyWeak(&v43, &location);
    [v12 setInterruptionHandler:v42];
    id v13 = *p_connection;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100006274;
    v40[3] = &unk_1002198D0;
    objc_copyWeak(&v41, &location);
    [v13 setInvalidationHandler:v40];
    dispatch_queue_t v14 = dispatch_queue_create("VCPMADServicePublicClientHandler", 0);
    managementQueue = v7->_managementQueue;
    v7->_managementQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = [*p_connection remoteObjectProxy];
    clientProxy = v7->_clientProxy;
    v7->_clientProxy = (VCPMediaAnalysisClientProtocol *)v16;

    CFTypeRef v38 = 0;
    CFTypeRef cf = 0;
    if (*p_connection) {
      [*p_connection auditToken];
    }
    else {
      memset(&v37, 0, sizeof(v37));
    }
    *(void *)buf = SecTaskCreateWithAuditToken(0, &v37);
    sub_10000636C((const void **)&v7->_secTask.value_, (const void **)buf);
    sub_100004484((const void **)buf);
    value = v7->_secTask.value_;
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    CFStringRef v19 = SecTaskCopySigningIdentifier(value, (CFErrorRef *)&cf);
    clientBundleID = v7->_clientBundleID;
    v7->_clientBundleID = &v19->isa;

    if (v38)
    {
      CFRelease(v38);
      CFTypeRef v38 = 0;
    }
    uint64_t v21 = SecTaskCopyTeamIdentifier();
    clientTeamID = v7->_clientTeamID;
    v7->_clientTeamID = (NSString *)v21;

    if (cf && (int)MediaAnalysisLogLevel() >= 4)
    {
      id v23 = v5;
      v24 = VCPLogInstance();
      os_log_type_t v25 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v24, v25))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = cf;
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "[MAClientHandler] Failed to query client bundle ID (%@)", buf, 0xCu);
      }

      id v5 = v23;
    }
    if (v38 && (int)MediaAnalysisLogLevel() >= 4)
    {
      id v26 = v5;
      v27 = VCPLogInstance();
      os_log_type_t v28 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v27, v28))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v38;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "[MAClientHandler] Failed to query client team ID (%@)", buf, 0xCu);
      }

      id v5 = v26;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v29 = v5;
      v30 = VCPLogInstance();
      os_log_type_t v31 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v30, v31))
      {
        v32 = v7->_clientBundleID;
        v33 = v7->_clientTeamID;
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v32;
        __int16 v47 = 2112;
        v48 = v33;
        _os_log_impl((void *)&_mh_execute_header, v30, v31, "[MAClientHandler] Client BundleID: %@ TeamID: %@", buf, 0x16u);
      }

      id v5 = v29;
    }
    v7->_userSafetyEntitled = +[MADUserSafetySettings isTaskEntitled:](MADUserSafetySettings, "isTaskEntitled:", v7->_secTask.value_, *(_OWORD *)v37.val, *(_OWORD *)&v37.val[4]);
    v34 = [[MADServiceClientTaskQueuingScheduler alloc] initWithClientBundleID:v7->_clientBundleID];
    queuingTaskScheduler = v7->_queuingTaskScheduler;
    v7->_queuingTaskScheduler = v34;

    sub_100004484(&v38);
    sub_100004484(&cf);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&v43);

    objc_destroyWeak(&location);
  }

  return v7;
}

+ (id)clientHandlerWithXPCConnection:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithXPCConnection:v3];

  return v4;
}

- (int64_t)consumeSandboxExtension:(id)a3 url:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 fileSystemRepresentation];
  connection = self->_connection;
  if (connection) {
    [(NSXPCConnection *)connection auditToken];
  }
  int v10 = sandbox_check_by_audit_token();
  if (v10 == -1)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v11 = VCPLogInstance();
      os_log_type_t v12 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 136315138;
        id v18 = v8;
        id v13 = "[MADServicePublic] Failed to check for client read access to file %s";
        goto LABEL_11;
      }
LABEL_12:
      int64_t v14 = -1;
LABEL_13:

      goto LABEL_19;
    }
LABEL_18:
    int64_t v14 = -1;
    goto LABEL_19;
  }
  if (v10 == 1)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v11 = VCPLogInstance();
      os_log_type_t v12 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 136315138;
        id v18 = v8;
        id v13 = "[MADServicePublic] Client does not have read access to file %s";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v11, v12, v13, buf, 0xCu);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    goto LABEL_18;
  }
  objc_msgSend(v6, "UTF8String", v8);
  int64_t v14 = sandbox_extension_consume();
  if (v14 < 0 && (int)MediaAnalysisLogLevel() >= 3)
  {
    v11 = VCPLogInstance();
    os_log_type_t v15 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v11, v15))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v15, "[MADServicePublic] Failed to consume sandbox extension", buf, 2u);
    }
    goto LABEL_13;
  }
LABEL_19:

  return v14;
}

- (void)requestImageProcessing:(id)a3 forIOSurface:(id)a4 withOrientation:(unsigned int)a5 identifier:(id)a6 requestID:(int)a7 andReply:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  surface = (__IOSurface *)a4;
  id v15 = a6;
  uint64_t v16 = (void (**)(id, void, void *))a8;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v17 = VCPLogInstance();
    os_log_type_t v18 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "[MADServicePublic] Received on-demand image processing request (CVPixelBuffer) with MADRequestID %d", buf, 8u);
    }
  }
  v33 = +[NSString stringWithFormat:@"Request: %d Identifier: %@", v9, v15];
  v20 = VCPSignPostLog();
  os_signpost_id_t v21 = os_signpost_id_generate(v20);

  v22 = VCPSignPostLog();
  id v23 = v22;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v33;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "VCPMADServicePublicClientHandler_IOSurface", "%@", buf, 0xCu);
  }

  *(void *)buf = 0;
  CVReturn v24 = CVPixelBufferCreateWithIOSurface(0, surface, 0, (CVPixelBufferRef *)buf);
  if (v24)
  {
    NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
    os_log_type_t v25 = +[NSString stringWithFormat:@"[MADServicePublic] Failed to create CVPixelBuffer from specified IOSurface"];
    v44 = v25;
    id v26 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    v27 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v24 userInfo:v26];
    v16[2](v16, 0, v27);
  }
  else
  {
    os_log_type_t v25 = +[VCPMADServiceImageAsset assetWithPixelBuffer:*(void *)buf orientation:v11 identifier:v15 clientBundleID:self->_clientBundleID clientTeamID:self->_clientTeamID];
    BOOL v28 = self->_userSafetyEntitled
       && +[MADUserSafetySettings isEnabledForTask:self->_secTask.value_];
    [v25 setUserSafetyEligible:v28];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100006BBC;
    v37[3] = &unk_100219918;
    os_signpost_id_t v41 = v21;
    id v29 = v33;
    id v38 = v29;
    uint64_t v42 = 0;
    v30 = v16;
    id v40 = v30;
    id v39 = v14;
    os_log_type_t v31 = +[VCPMADServiceImageProcessingTask taskWithRequests:v39 forAsset:v25 cancelBlock:&stru_1002198F0 andCompletionHandler:v37];
    [v31 setSignpostPayload:v29];
    queuingTaskScheduler = self->_queuingTaskScheduler;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100006D00;
    v35[3] = &unk_100219940;
    v36 = v30;
    [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v31 withRequestID:(int)v9 schedulingErrorHandler:v35];

    id v26 = v38;
  }

  sub_100004484((const void **)buf);
}

- (void)requestImageProcessing:(id)a3 forAssetURL:(id)a4 withSandboxToken:(id)a5 identifier:(id)a6 requestID:(int)a7 andReply:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  id v32 = a3;
  id v36 = a4;
  id v34 = a5;
  id v14 = a6;
  v35 = (void (**)(id, void, void *))a8;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v15 = VCPLogInstance();
    os_log_type_t v16 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v50) = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[MADServicePublic] Received on-demand image processing request (URL) with MADRequestID %d", buf, 8u);
    }
  }
  v33 = +[NSString stringWithFormat:@"Request: %d Identifier: %@", v9, v14];
  os_log_type_t v18 = VCPSignPostLog();
  os_signpost_id_t v19 = os_signpost_id_generate(v18);

  v20 = VCPSignPostLog();
  os_signpost_id_t v21 = v20;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v33;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "VCPMADServicePublicClientHandler_URL", "%@", buf, 0xCu);
  }

  int64_t v22 = [(VCPMADServicePublicClientHandler *)self consumeSandboxExtension:v34 url:v36];
  if (v22 < 0)
  {
    NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
    id v23 = +[NSString stringWithFormat:@"[MADServicePublic] Failed to consume sandbox extension"];
    v48 = v23;
    os_log_type_t v25 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    id v26 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v25];
    v35[2](v35, 0, v26);
  }
  else
  {
    id v23 = +[VCPMADServiceImageAsset assetWithURL:v36 identifier:v14 clientBundleID:self->_clientBundleID clientTeamID:self->_clientTeamID];
    BOOL v24 = self->_userSafetyEntitled
       && +[MADUserSafetySettings isEnabledForTask:self->_secTask.value_];
    [v23 setUserSafetyEligible:v24];
    v27 = v17;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10000727C;
    v40[3] = &unk_100219988;
    os_signpost_id_t v44 = v19;
    id v28 = v33;
    id v41 = v28;
    uint64_t v45 = 0;
    id v29 = v35;
    id v43 = v29;
    id v42 = v32;
    int64_t v46 = v22;
    v30 = +[VCPMADServiceImageProcessingTask taskWithRequests:v42 forAsset:v23 cancelBlock:&stru_100219960 andCompletionHandler:v40];
    [v30 setSignpostPayload:v28];
    queuingTaskScheduler = self->_queuingTaskScheduler;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000073C8;
    v37[3] = &unk_1002199B0;
    id v38 = v29;
    int64_t v39 = v22;
    [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v30 withRequestID:(int)v9 schedulingErrorHandler:v37];

    v17 = v27;
    os_log_type_t v25 = v41;
  }
}

- (void)requestVideoProcessing:(id)a3 assetURL:(id)a4 sandboxToken:(id)a5 identifier:(id)a6 requestID:(int)a7 reply:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  id v31 = a3;
  id v35 = a4;
  id v34 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, void, void *))a8;
  id v32 = v14;
  v33 = +[NSString stringWithFormat:@"Request: %d Identifier: %@", v9, v14];
  os_log_type_t v16 = VCPSignPostLog();
  os_signpost_id_t v17 = os_signpost_id_generate(v16);

  os_log_type_t v18 = VCPSignPostLog();
  os_signpost_id_t v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v33;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "VCPMADServicePublicClientHandler_VideoE2E", "%@", buf, 0xCu);
  }

  int64_t v20 = [(VCPMADServicePublicClientHandler *)self consumeSandboxExtension:v34 url:v35];
  if (v20 < 0)
  {
    NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
    BOOL v24 = +[NSString stringWithFormat:@"[MADServicePublic] Failed to consume sandbox extension"];
    v48 = v24;
    os_log_type_t v25 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    id v26 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v25];
    v15[2](v15, 0, v26);
  }
  else
  {
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100007948;
    v45[3] = &unk_1002199D8;
    v45[4] = self;
    int v46 = v9;
    os_signpost_id_t v21 = objc_retainBlock(v45);
    int64_t v22 = +[MADServiceVideoAsset assetWithURL:v35 identifier:v32 clientBundleID:self->_clientBundleID clientTeamID:self->_clientTeamID];
    BOOL v23 = self->_userSafetyEntitled
       && +[MADUserSafetySettings isEnabledForTask:self->_secTask.value_];
    [v22 setUserSafetyEligible:v23];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10000796C;
    v39[3] = &unk_100219A20;
    os_signpost_id_t v42 = v17;
    id v27 = v33;
    id v40 = v27;
    uint64_t v43 = 0;
    id v28 = v15;
    id v41 = v28;
    int64_t v44 = v20;
    id v29 = +[MADServiceVideoProcessingTask taskWithRequests:v31 forAsset:v22 cancelBlock:&stru_1002199F8 progressHandler:v21 resultHandler:0 andCompletionHandler:v39];
    [v29 setSignpostPayload:v27];
    queuingTaskScheduler = self->_queuingTaskScheduler;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100007AD0;
    v36[3] = &unk_1002199B0;
    audit_token_t v37 = v28;
    int64_t v38 = v20;
    [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v29 withRequestID:(int)v9 schedulingErrorHandler:v36];
  }
}

- (void)currentOutstandingTasksWithReply:(id)a3
{
  id v4 = (void (**)(id, unint64_t))a3;
  v4[2](v4, [(MADServiceClientTaskQueuingScheduler *)self->_queuingTaskScheduler currentOutstandingTasks]);
}

- (void)cancelRequest:(int)a3
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v5, v6))
    {
      int v9 = 67109120;
      int v10 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "[MADServicePublic] Service received call to cancel task for MADRequestID %d", (uint8_t *)&v9, 8u);
    }
  }
  [(MADServiceClientTaskQueuingScheduler *)self->_queuingTaskScheduler cancelTaskWithRequestID:a3];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      int v9 = 67109120;
      int v10 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[MADServicePublic] Canceled task for MADRequestID %d ", (uint8_t *)&v9, 8u);
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
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "[MADServicePublic] Service received call to cancel all tasks", (uint8_t *)&v8, 2u);
    }
  }
  unint64_t v5 = [(MADServiceClientTaskQueuingScheduler *)self->_queuingTaskScheduler cancelAllTasks];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v6 = VCPLogInstance();
    os_log_type_t v7 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v6, v7))
    {
      int v8 = 134217984;
      unint64_t v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[MADServicePublic] Service canceled all %lu tasks", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)queryUserSafetyEnablement:(id)a3
{
  os_log_type_t v4 = (void (**)(id, void, void *))a3;
  if (!self->_userSafetyEntitled)
  {
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    unint64_t v5 = +[NSString stringWithFormat:@"Client not entitled to query User Safety enablement"];
    int v10 = v5;
    os_log_type_t v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    os_log_type_t v7 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v6];
    v4[2](v4, 0, v7);
  }
  int v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", +[MADUserSafetySettings policyForTask:self->_secTask.value_]);
  ((void (**)(id, void *, void *))v4)[2](v4, v8, 0);
}

- (void)startEntryPointWithQueryID:(unint64_t)a3
{
}

- (void)startEntryPointWithQueryID:(unint64_t)a3 andEvent:(unint64_t)a4
{
}

- (void)cacheHitWithQueryID:(unint64_t)a3 cachedResultQueryID:(unint64_t)a4
{
}

- (void)cacheHitWithQueryID:(unint64_t)a3 cachedResultQueryID:(unint64_t)a4 engagementSuggestionType:(id)a5
{
  id v8 = a5;
  NSErrorUserInfoKey v9 = +[NSMutableDictionary dictionary];
  int v10 = +[NSNumber numberWithUnsignedLongLong:a3];
  [v9 setObject:v10 forKeyedSubscript:VIACacheHitContextQueryIDKey];

  uint64_t v11 = +[NSNumber numberWithUnsignedLongLong:a4];
  [v9 setObject:v11 forKeyedSubscript:VIACacheHitContextCachedResultQueryID];

  clientBundleID = self->_clientBundleID;
  if (clientBundleID) {
    [v9 setObject:clientBundleID forKeyedSubscript:VIACacheHitContextApplicationIdentifierKey];
  }
  if (v8) {
    [v9 setObject:v8 forKeyedSubscript:VIACacheHitContextEngagementSuggestionTypeKey];
  }
  id v17 = 0;
  id v13 = +[VIACacheHitContext contextWithDictionary:v9 error:&v17];
  id v14 = v17;
  if (v14)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v15 = VCPLogInstance();
      os_log_type_t v16 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v15, v16))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "Failed to create VIACacheHitContext, error: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    VIAnalyticsLogCacheHitWithContext();
  }
}

- (void)endEntryPoint
{
}

- (void)submitSpotlightAssetURL:(id)a3 uniqueIdentifier:(id)a4 bundleIdentifier:(id)a5 typeIdentifier:(id)a6 sandboxToken:(id)a7 reply:(id)a8
{
  id v46 = a3;
  NSErrorUserInfoKey v47 = (_UNKNOWN **)a4;
  id v13 = a5;
  id v14 = a6;
  id v45 = a7;
  id v15 = (void (**)(id, _UNKNOWN **))a8;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    os_log_type_t v16 = VCPLogInstance();
    os_log_type_t v17 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 138412802;
      v62 = v47;
      __int16 v63 = 2112;
      v64 = v13;
      __int16 v65 = 2112;
      id v66 = v46;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "[MADServicePublic] Scheduling asset (UUID: %@ BundleID: %@ URL: %@)", buf, 0x20u);
    }
  }
  os_log_type_t v18 = +[UTType typeWithIdentifier:v14];
  if (([v18 conformsToType:UTTypeMovie] & 1) != 0
    || ([v18 conformsToType:UTTypeVideo] & 1) != 0)
  {
    int v44 = 0;
    uint64_t v19 = 2;
  }
  else
  {
    if (([v18 conformsToType:UTTypeImage] & 1) == 0)
    {
      NSErrorUserInfoKey v59 = NSLocalizedDescriptionKey;
      id v31 = +[NSString stringWithFormat:@"Type identifier (%@), does not resolve to image/video", v14];
      v60 = v31;
      os_log_type_t v25 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      BOOL v24 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v25];
      v15[2](v15, v24);
      goto LABEL_50;
    }
    int v44 = 1;
    uint64_t v19 = 1;
  }
  int64_t v20 = [v13 lowercaseString];
  unsigned int v21 = [v20 containsString:@"apple"];

  int64_t v22 = [v13 lowercaseString];
  unsigned int v23 = [v22 isEqualToString:@"com.apple.jujubectl"];

  if ((v21 ^ 1 | v23))
  {
    BOOL v24 = &ADClientSetValueForScalarKey_ptr;
    id v52 = 0;
    os_log_type_t v25 = +[MADManagedSpotlightEntry fetchEntryWithUniqueIdentifier:v47 error:&v52];
    id v26 = v52;
    if (v26 && (int)MediaAnalysisLogLevel() >= 4)
    {
      id v27 = VCPLogInstance();
      os_log_type_t v28 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v27, v28))
      {
        *(_DWORD *)buf = 138412546;
        v62 = v47;
        __int16 v63 = 2112;
        v64 = v26;
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "[MADServicePublic] Failed to fetch entry with %@ (%@). New entry will still be created", buf, 0x16u);
      }
    }
    if (v25)
    {
      [v25 setUrl:v46];
      [v25 setSandboxToken:v45];
      id v29 = +[MADSystemDataStore systemDataStore];
      id v51 = v26;
      unsigned int v30 = [v29 commitChangesOrRollback:&v51];
      id v31 = v51;

      if (v30)
      {
        id v26 = v31;
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          id v32 = VCPLogInstance();
          id v26 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v32, (os_log_type_t)VCPLogToOSLogType[6]))
          {
            *(_DWORD *)buf = 138412290;
            v62 = (_UNKNOWN **)v25;
            _os_log_impl((void *)&_mh_execute_header, v32, (os_log_type_t)v26, "[MADServicePublic] Updated asset %@", buf, 0xCu);
          }
        }
        v33 = 0;
      }
      else
      {
        NSErrorUserInfoKey v55 = NSLocalizedDescriptionKey;
        BOOL v24 = +[NSString stringWithFormat:@"Failed to update entry (%@)", v31];
        v56 = v24;
        id v26 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
        v33 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v26];
      }
      v15[2](v15, v33);
      if ((v30 & 1) == 0)
      {

LABEL_49:
        goto LABEL_50;
      }
    }
    else
    {
      id v50 = v26;
      id v34 = +[MADManagedSpotlightEntry entryWithURL:v46 uniqueIdentifier:v47 bundleIdentifier:v13 typeIdentifier:v14 sandboxToken:v45 mediaType:v19 error:&v50];
      id v31 = v50;

      if (v34)
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          id v35 = VCPLogInstance();
          id v26 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v35, (os_log_type_t)VCPLogToOSLogType[6]))
          {
            *(_DWORD *)buf = 138412290;
            v62 = v34;
            _os_log_impl((void *)&_mh_execute_header, v35, (os_log_type_t)v26, "[MADServicePublic] Scheduled asset %@", buf, 0xCu);
          }
        }
        id v36 = 0;
      }
      else
      {
        NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
        BOOL v24 = +[NSString stringWithFormat:@"Failed to store entry %@", v31];
        v54 = v24;
        id v26 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
        id v36 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v26];
      }
      v15[2](v15, v36);
      if (!v34)
      {

        goto LABEL_49;
      }
    }
    audit_token_t v37 = v31;
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      int64_t v38 = VCPLogInstance();
      os_log_type_t v39 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v38, v39))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, v39, "[MADServicePublic] Submit BGST task", buf, 2u);
      }
    }
    if (v44)
    {
      uint64_t v40 = +[MADSpotlightImageBackgroundSystemTask identifier];
      id v41 = +[MADSpotlightImageBackgroundSystemTask sharedTask];
      v49 = v31;
      os_signpost_id_t v42 = (id *)&v49;
      [v41 submitTask:&v49];
    }
    else
    {
      uint64_t v40 = +[MADSpotlightMovieBackgroundSystemTask identifier];
      id v41 = +[MADSpotlightMovieBackgroundSystemTask sharedTask];
      v48 = v31;
      os_signpost_id_t v42 = (id *)&v48;
      [v41 submitTask:&v48];
    }
    BOOL v24 = (_UNKNOWN **)v40;
    id v31 = *v42;

    if (v31 && (int)MediaAnalysisLogLevel() >= 3)
    {
      id v26 = VCPLogInstance();
      os_log_type_t v43 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v26, v43))
      {
        *(_DWORD *)buf = 138412546;
        v62 = v24;
        __int16 v63 = 2112;
        v64 = v31;
        _os_log_impl((void *)&_mh_execute_header, v26, v43, "[MADServicePublic][%@] Failed to submit the BGST task with error: %@", buf, 0x16u);
      }
      goto LABEL_49;
    }
  }
  else
  {
    NSErrorUserInfoKey v57 = NSLocalizedDescriptionKey;
    id v31 = +[NSString stringWithFormat:@"BundleID %@ is not supported", v13];
    v58 = v31;
    os_log_type_t v25 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
    BOOL v24 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v25];
    v15[2](v15, v24);
  }
LABEL_50:
}

- (void)requestTextPrewarming:(id)a3 requestID:(int)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    int v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v10, v11))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[MADServicePublic] Received text pre-warming request", buf, 2u);
    }
  }
  os_log_type_t v12 = +[NSString stringWithFormat:@"Request: %d", v6];
  id v13 = VCPSignPostLog();
  os_signpost_id_t v14 = os_signpost_id_generate(v13);

  id v15 = VCPSignPostLog();
  os_log_type_t v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v12;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "VCPMADServicePublicClientHandler_TextPrewarmingE2E", "%@", buf, 0xCu);
  }

  id v17 = objc_alloc((Class)MADServiceTextPrewarmingTask);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100008F94;
  v26[3] = &unk_100219A68;
  os_signpost_id_t v29 = v14;
  id v18 = v12;
  id v27 = v18;
  uint64_t v30 = 0;
  id v19 = v9;
  id v28 = v19;
  id v20 = [v17 initWithRequests:v8 cancelBlock:&stru_100219A40 completionHandler:v26];
  [v20 setSignpostPayload:v18];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v22 = (int)v6;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000090BC;
  v24[3] = &unk_100219940;
  id v23 = v19;
  id v25 = v23;
  [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v20 withRequestID:v22 schedulingErrorHandler:v24];
}

- (void)requestTextProcessing:(id)a3 textInputs:(id)a4 requestID:(int)a5 reply:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v27 = a3;
  id v10 = a4;
  id v11 = a6;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v12 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v12, v13))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[MADServicePublic] Received text processing request", buf, 2u);
    }
  }
  os_signpost_id_t v14 = +[NSString stringWithFormat:@"Request: %d", v7];
  id v15 = VCPSignPostLog();
  os_signpost_id_t v16 = os_signpost_id_generate(v15);

  id v17 = VCPSignPostLog();
  id v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v14;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "VCPMADServicePublicClientHandler_TextProcessingE2E", "%@", buf, 0xCu);
  }

  id v19 = +[MADServiceTextAsset assetWithTextInputs:v10 clientBundleID:self->_clientBundleID clientTeamID:self->_clientTeamID];
  id v20 = objc_alloc((Class)MADServiceTextProcessingTask);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100009478;
  v30[3] = &unk_100219AB0;
  os_signpost_id_t v33 = v16;
  id v21 = v14;
  id v31 = v21;
  uint64_t v34 = 0;
  id v22 = v11;
  id v32 = v22;
  id v23 = [v20 initWithRequests:v27 asset:v19 cancelBlock:&stru_100219A88 completionHandler:v30];
  [v23 setSignpostPayload:v21];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v25 = (int)v7;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000095C0;
  v28[3] = &unk_100219940;
  id v26 = v22;
  id v29 = v26;
  [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v23 withRequestID:v25 schedulingErrorHandler:v28];
}

- (void)requestMultiModalPrewarming:(id)a3 requestID:(int)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v10, v11))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[MADServicePublic] Received multi-modal pre-warming request", buf, 2u);
    }
  }
  os_log_type_t v12 = +[NSString stringWithFormat:@"Request: %d", v6];
  os_log_type_t v13 = VCPSignPostLog();
  os_signpost_id_t v14 = os_signpost_id_generate(v13);

  id v15 = VCPSignPostLog();
  os_signpost_id_t v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v12;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "VCPMADServicePublicClientHandler_MultiModalPrewarmingE2E", "%@", buf, 0xCu);
  }

  id v17 = objc_alloc((Class)MADMultiModalPrewarmingTask);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100009918;
  v26[3] = &unk_100219A68;
  os_signpost_id_t v29 = v14;
  id v18 = v12;
  id v27 = v18;
  uint64_t v30 = 0;
  id v19 = v9;
  id v28 = v19;
  id v20 = [v17 initWithRequests:v8 cancelBlock:&stru_100219AD0 completionHandler:v26];
  [v20 setSignpostPayload:v18];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v22 = (int)v6;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100009A40;
  v24[3] = &unk_100219940;
  id v23 = v19;
  id v25 = v23;
  [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v20 withRequestID:v22 schedulingErrorHandler:v24];
}

- (void)requestProcessing:(id)a3 multiModalInputs:(id)a4 requestID:(int)a5 reply:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    os_log_type_t v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v13, v14))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[MADServicePublic] Received multi-modal processing request", buf, 2u);
    }
  }
  id v15 = +[NSString stringWithFormat:@"Request: %d", v7];
  os_signpost_id_t v16 = VCPSignPostLog();
  os_signpost_id_t v17 = os_signpost_id_generate(v16);

  id v18 = VCPSignPostLog();
  id v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v15;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "VCPMADServicePublicClientHandler_MultiModalProcessingE2E", "%@", buf, 0xCu);
  }

  id v20 = objc_alloc((Class)MADMultiModalProcessingTask);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100009DA8;
  v29[3] = &unk_100219AB0;
  os_signpost_id_t v32 = v17;
  id v21 = v15;
  id v30 = v21;
  uint64_t v33 = 0;
  id v22 = v12;
  id v31 = v22;
  id v23 = [v20 initWithRequests:v10 inputs:v11 cancelBlock:&stru_100219AF0 completionHandler:v29];
  [v23 setSignpostPayload:v21];
  queuingTaskScheduler = self->_queuingTaskScheduler;
  uint64_t v25 = (int)v7;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100009EF0;
  v27[3] = &unk_100219940;
  id v26 = v22;
  id v28 = v26;
  [(MADServiceClientTaskQueuingScheduler *)queuingTaskScheduler submitClientTask:v23 withRequestID:v25 schedulingErrorHandler:v27];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuingTaskScheduler, 0);
  objc_storeStrong((id *)&self->_clientTeamID, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  sub_100004484((const void **)&self->_secTask.value_);
  objc_storeStrong((id *)&self->_managementQueue, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  return self;
}

@end