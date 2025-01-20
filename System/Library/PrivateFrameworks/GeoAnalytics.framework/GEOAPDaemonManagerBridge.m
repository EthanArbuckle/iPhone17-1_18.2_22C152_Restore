@interface GEOAPDaemonManagerBridge
- (BOOL)_hasEvalEntitlement;
- (BOOL)_hasTelemetryEntitlement;
- (void)dealloc;
- (void)flushEvalData;
- (void)flushUploadHistoryWithCompletion:(id)a3;
- (void)reportDailySettings:(id)a3 completion:(id)a4;
- (void)reportDailyUsageCountType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6 completion:(id)a7;
- (void)reportLogMsg:(id)a3 uploadBatchId:(unint64_t)a4 completion:(id)a5;
- (void)runAggregationTasks;
- (void)setEvalMode:(BOOL)a3;
- (void)showEvalData;
- (void)showHistoryOfAge:(unsigned int)a3;
- (void)showInflight;
- (void)showUploadCounts:(id)a3;
- (void)streamEvalData;
@end

@implementation GEOAPDaemonManagerBridge

- (void)reportDailyUsageCountType:(int)a3 usageString:(id)a4 usageBool:(id)a5 appId:(id)a6 completion:(id)a7
{
  uint64_t v10 = *(void *)&a3;
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  v15 = sub_100003478();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 136315138;
    v18 = "-[GEOAPDaemonManagerBridge reportDailyUsageCountType:usageString:usageBool:appId:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v17, 0xCu);
  }

  v16 = +[GEOAPServiceManager sharedManager];
  [v16 reportDailyUsageCountType:v10 usageString:v14 usageBool:v13 appId:v12 completion:v11];
}

- (void)reportLogMsg:(id)a3 uploadBatchId:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = sub_100003478();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[GEOAPDaemonManagerBridge reportLogMsg:uploadBatchId:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  if (GEOBatchIDIsTelemetryData()
    && ![(GEOAPDaemonManagerBridge *)self _hasTelemetryEntitlement])
  {
    id v12 = dispatch_get_global_queue(21, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000BD98;
    block[3] = &unk_1000286F0;
    id v14 = v9;
    dispatch_async(v12, block);

    id v11 = v14;
  }
  else
  {
    id v11 = +[GEOAPServiceManager sharedManager];
    [v11 reportLogMsg:v8 uploadBatchId:a4 completion:v9];
  }
}

- (void)dealloc
{
  v3 = sub_100003478();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "goodbye connection %p", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)GEOAPDaemonManagerBridge;
  [(GEOAPDaemonManagerBridge *)&v4 dealloc];
}

- (void)reportDailySettings:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = sub_100003478();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[GEOAPDaemonManagerBridge reportDailySettings:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v9, 0xCu);
  }

  id v8 = +[GEOAPServiceManager sharedManager];
  [v8 reportDailySettings:v6 completion:v5];
}

- (BOOL)_hasTelemetryEntitlement
{
  v2 = [(NSXPCConnection *)self->_conn valueForEntitlement:GEOAPTelemetryEntitlement];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v3 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (BOOL)_hasEvalEntitlement
{
  v2 = [(NSXPCConnection *)self->_conn valueForEntitlement:GEOAPEvalEntitlement];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v3 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (void)runAggregationTasks
{
  unsigned __int8 v3 = sub_100003478();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "-[GEOAPDaemonManagerBridge runAggregationTasks]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v5, 0xCu);
  }

  if ([(GEOAPDaemonManagerBridge *)self _hasEvalEntitlement])
  {
    objc_super v4 = +[GEOAPServiceManager sharedManager];
    [v4 runAggregationTasks];
  }
  else
  {
    objc_super v4 = sub_100003478();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v5) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "eval entitlement is required for this operation", (uint8_t *)&v5, 2u);
    }
  }
}

- (void)setEvalMode:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = sub_100003478();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    id v8 = "-[GEOAPDaemonManagerBridge setEvalMode:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v7, 0xCu);
  }

  if ([(GEOAPDaemonManagerBridge *)self _hasEvalEntitlement])
  {
    id v6 = +[GEOAPServiceManager sharedManager];
    [v6 setEvalMode:v3];
  }
  else
  {
    id v6 = sub_100003478();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "eval entitlement is required for this operation", (uint8_t *)&v7, 2u);
    }
  }
}

- (void)showEvalData
{
  if ([(GEOAPDaemonManagerBridge *)self _hasEvalEntitlement])
  {
    BOOL v3 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GEOAPXPCClientExporting];
    [(NSXPCConnection *)self->_conn setRemoteObjectInterface:v3];

    objc_super v4 = [(NSXPCConnection *)self->_conn remoteObjectProxy];
    int v5 = dispatch_get_global_queue(17, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000C18C;
    block[3] = &unk_1000288E8;
    id v8 = v4;
    id v6 = v4;
    dispatch_async(v5, block);
  }
  else
  {
    id v6 = sub_100003478();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "eval entitlement is required for this operation", buf, 2u);
    }
  }
}

- (void)streamEvalData
{
  if ([(GEOAPDaemonManagerBridge *)self _hasEvalEntitlement])
  {
    BOOL v3 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GEOAPXPCClientExporting];
    [(NSXPCConnection *)self->_conn setRemoteObjectInterface:v3];

    objc_super v4 = [(NSXPCConnection *)self->_conn remoteObjectProxy];
    objc_initWeak(location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000C600;
    v11[3] = &unk_100028A68;
    id v5 = v4;
    id v12 = v5;
    objc_copyWeak(&v13, location);
    [(NSXPCConnection *)self->_conn setInterruptionHandler:v11];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000C688;
    v8[3] = &unk_100028A68;
    id v6 = v5;
    int v9 = v6;
    objc_copyWeak(&v10, location);
    [(NSXPCConnection *)self->_conn setInvalidationHandler:v8];
    int v7 = sub_10000397C();
    sub_1000179EC((uint64_t)v7, v6);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v13);

    objc_destroyWeak(location);
  }
  else
  {
    id v6 = sub_100003478();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "eval entitlement is required for this operation", (uint8_t *)location, 2u);
    }
  }
}

- (void)flushEvalData
{
  BOOL v3 = sub_100003478();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "-[GEOAPDaemonManagerBridge flushEvalData]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v5, 0xCu);
  }

  if ([(GEOAPDaemonManagerBridge *)self _hasEvalEntitlement])
  {
    objc_super v4 = +[GEOAPServiceManager sharedManager];
    [v4 flushEvalData];
  }
  else
  {
    objc_super v4 = sub_100003478();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v5) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "eval entitlement is required for this operation", (uint8_t *)&v5, 2u);
    }
  }
}

- (void)showInflight
{
  if ([(GEOAPDaemonManagerBridge *)self _hasEvalEntitlement])
  {
    BOOL v3 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GEOAPXPCMapsDebugPanelExporting];
    [(NSXPCConnection *)self->_conn setRemoteObjectInterface:v3];

    objc_super v4 = [(NSXPCConnection *)self->_conn remoteObjectProxy];
    int v5 = +[GEOAPServiceManager sharedManager];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000C9A0;
    v9[3] = &unk_100028A90;
    id v10 = v4;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000C9E4;
    v7[3] = &unk_1000288E8;
    id v8 = v10;
    id v6 = v10;
    [v5 showInflightUploadsWithVisitorBlock:v9 completion:v7];
  }
  else
  {
    id v6 = sub_100003478();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "eval entitlement is required for this operation", buf, 2u);
    }
  }
}

- (void)showHistoryOfAge:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(GEOAPDaemonManagerBridge *)self _hasEvalEntitlement])
  {
    int v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GEOAPXPCMapsDebugPanelExporting];
    [(NSXPCConnection *)self->_conn setRemoteObjectInterface:v5];

    id v6 = [(NSXPCConnection *)self->_conn remoteObjectProxy];
    int v7 = +[GEOAPServiceManager sharedManager];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000CB84;
    v11[3] = &unk_100028AB8;
    id v12 = v6;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000CBCC;
    v9[3] = &unk_1000288E8;
    id v10 = v12;
    id v8 = v12;
    [v7 showHistoryOfAge:v3 withVisitorBlock:v11 completion:v9];
  }
  else
  {
    id v8 = sub_100003478();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "eval entitlement is required for this operation", buf, 2u);
    }
  }
}

- (void)flushUploadHistoryWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[GEOAPServiceManager sharedManager];
  [v4 flushUploadHistoryWithCompletion:v3];
}

- (void)showUploadCounts:(id)a3
{
  id v3 = a3;
  id v4 = +[GEOAPServiceManager sharedManager];
  [v4 showUploadCounts:v3];
}

- (void).cxx_destruct
{
}

@end