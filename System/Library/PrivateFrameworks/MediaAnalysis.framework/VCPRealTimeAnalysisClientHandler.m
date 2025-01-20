@interface VCPRealTimeAnalysisClientHandler
+ (id)clientHandlerWithXPCConnection:(id)a3;
- (VCPRealTimeAnalysisClientHandler)init;
- (VCPRealTimeAnalysisClientHandler)initWithXPCConnection:(id)a3;
- (void)requestAnalysis:(unint64_t)a3 ofIOSurface:(id)a4 withProperties:(id)a5 withReply:(id)a6;
@end

@implementation VCPRealTimeAnalysisClientHandler

- (VCPRealTimeAnalysisClientHandler)init
{
  return 0;
}

- (VCPRealTimeAnalysisClientHandler)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)VCPRealTimeAnalysisClientHandler;
  v6 = [(VCPRealTimeAnalysisClientHandler *)&v25 init];
  if (v6)
  {
    uint64_t v7 = VCPTransactionWithName(@"VCPRealTimeAnalysisClientHandler");
    transaction = v6->_transaction;
    v6->_transaction = (OS_os_transaction *)v7;

    objc_storeStrong((id *)&v6->_connection, a3);
    [(NSXPCConnection *)v6->_connection setExportedObject:v6];
    connection = v6->_connection;
    v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___VCPRealTimeAnalysisServerProtocol];
    [(NSXPCConnection *)connection setExportedInterface:v10];

    v11 = v6->_connection;
    v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___VCPRealTimeAnalysisClientProtocol];
    [(NSXPCConnection *)v11 setRemoteObjectInterface:v12];

    [(NSXPCConnection *)v6->_connection setInterruptionHandler:&stru_10021F248];
    objc_initWeak(&location, v6);
    v13 = v6->_connection;
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_1001753A0;
    v22 = &unk_1002198D0;
    objc_copyWeak(&v23, &location);
    [(NSXPCConnection *)v13 setInvalidationHandler:&v19];
    uint64_t v14 = [(NSXPCConnection *)v6->_connection remoteObjectProxy];
    clientProxy = v6->_clientProxy;
    v6->_clientProxy = (VCPRealTimeAnalysisClientProtocol *)v14;

    v6->_totalFaceDetectedFrames = 0;
    v16 = objc_alloc_init(MADScopedWatchdog);
    scopedWatchdog = v6->_scopedWatchdog;
    v6->_scopedWatchdog = v16;

    objc_destroyWeak(&v23);
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

- (void)requestAnalysis:(unint64_t)a3 ofIOSurface:(id)a4 withProperties:(id)a5 withReply:(id)a6
{
  v10 = (__IOSurface *)a4;
  id v11 = a5;
  v12 = (void (**)(id, void, void *))a6;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Received frame analysis request (%x)", buf, 8u);
    }
  }
  *(void *)buf = 0;
  v15 = +[NSMutableDictionary dictionary];
  if (!a3) {
    goto LABEL_21;
  }
  CVReturn v16 = CVPixelBufferCreateWithIOSurface(kCFAllocatorDefault, v10, 0, (CVPixelBufferRef *)buf);
  if (!v16)
  {
    if (a3)
    {
      contentAnalysis = self->_contentAnalysis;
      if (!contentAnalysis)
      {
        uint64_t v20 = +[VCPContentAnalysis contentAnalysis];
        v21 = self->_contentAnalysis;
        self->_contentAnalysis = v20;

        contentAnalysis = self->_contentAnalysis;
        if (!contentAnalysis)
        {
          if ((int)MediaAnalysisLogLevel() >= 3)
          {
            v31 = VCPLogInstance();
            os_log_type_t v32 = VCPLogToOSLogType[3];
            if (os_log_type_enabled(v31, v32))
            {
              *(_WORD *)v35 = 0;
              _os_log_impl((void *)&_mh_execute_header, v31, v32, "Failed to create content analysis", v35, 2u);
            }
            goto LABEL_44;
          }
LABEL_45:
          CVReturn v16 = -18;
          goto LABEL_22;
        }
      }
      *(void *)v35 = 0;
      CVReturn v16 = [(VCPContentAnalysis *)contentAnalysis detectPixelBuffer:*(void *)buf contentType:v35];
      if (v16)
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_22;
        }
        v22 = VCPLogInstance();
        os_log_type_t v23 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v22, v23))
        {
          *(_WORD *)v34 = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, v23, "Content analysis failed", v34, 2u);
        }
        goto LABEL_18;
      }
      v24 = +[NSNumber numberWithUnsignedInteger:*(void *)v35];
      [v15 setObject:v24 forKeyedSubscript:VCPContentTypeKey];
    }
    if ((a3 & 4) == 0)
    {
LABEL_21:
      CVReturn v16 = 0;
      goto LABEL_22;
    }
    if (self->_priorityAnalysis
      || (+[VCPPriorityAnalysis priorityAnalysis],
          v26 = (VCPPriorityAnalysis *)objc_claimAutoreleasedReturnValue(),
          priorityAnalysis = self->_priorityAnalysis,
          self->_priorityAnalysis = v26,
          priorityAnalysis,
          self->_priorityAnalysis))
    {
      *(_DWORD *)v35 = 0;
      if (v11)
      {
        int totalFaceDetectedFrames = self->_totalFaceDetectedFrames;
        self->_int totalFaceDetectedFrames = totalFaceDetectedFrames + 1;
        double v29 = 0.0;
        if (totalFaceDetectedFrames >= 5)
        {
          CVReturn v16 = -[VCPPriorityAnalysis calculatePriorityScore:ofPixelBuffer:withMetadata:](self->_priorityAnalysis, "calculatePriorityScore:ofPixelBuffer:withMetadata:", v35, *(void *)buf, v11, 0.0);
          if (v16)
          {
            if ((int)MediaAnalysisLogLevel() < 3) {
              goto LABEL_22;
            }
            v22 = VCPLogInstance();
            os_log_type_t v30 = VCPLogToOSLogType[3];
            if (os_log_type_enabled(v22, v30))
            {
              *(_WORD *)v34 = 0;
              _os_log_impl((void *)&_mh_execute_header, v22, v30, "Priority score calculation failed", v34, 2u);
            }
LABEL_18:

            goto LABEL_22;
          }
          LODWORD(v29) = *(_DWORD *)v35;
        }
      }
      else
      {
        self->_int totalFaceDetectedFrames = 0;
        double v29 = 0.0;
      }
      v22 = +[NSNumber numberWithFloat:v29];
      [v15 setObject:v22 forKeyedSubscript:VCPPriorityScoreKey];
      CVReturn v16 = 0;
      goto LABEL_18;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v31 = VCPLogInstance();
      os_log_type_t v33 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v31, v33))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, v33, "Failed to create VCPPriorityAnalysis instance", v35, 2u);
      }
LABEL_44:

      goto LABEL_45;
    }
    goto LABEL_45;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v17 = VCPLogInstance();
    os_log_type_t v18 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v17, v18))
    {
      *(_WORD *)v35 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Failed to obtain CVPixelBufferRef from IOSurface", v35, 2u);
    }
  }
LABEL_22:
  if (*(void *)buf) {
    CFRelease(*(CFTypeRef *)buf);
  }
  if (v16)
  {
    objc_super v25 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v16 userInfo:0];
    v12[2](v12, 0, v25);
  }
  else
  {
    ((void (**)(id, void *, void *))v12)[2](v12, v15, 0);
  }
  [(MADScopedWatchdog *)self->_scopedWatchdog pet];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_priorityAnalysis, 0);
  objc_storeStrong((id *)&self->_contentAnalysis, 0);
  objc_storeStrong((id *)&self->_scopedWatchdog, 0);
  objc_storeStrong((id *)&self->_managementQueue, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end