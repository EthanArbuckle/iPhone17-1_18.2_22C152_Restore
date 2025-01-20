@interface VCPMADBackgroundService
+ (int)runWithArgc:(int)a3 andArgv:(const char *)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (int)run;
@end

@implementation VCPMADBackgroundService

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (NSXPCListener *)a3;
  id v7 = a4;
  v8 = v7;
  if (v7) {
    [v7 auditToken];
  }
  else {
    memset(&token, 0, sizeof(token));
  }
  SecTaskRef v9 = SecTaskCreateWithAuditToken(0, &token);
  SecTaskRef v24 = v9;
  if (v9)
  {
    CFTypeRef v10 = SecTaskCopyValueForEntitlement(v9, @"com.apple.mediaanalysisd.service.client", 0);
    cf1[0] = v10;
    if (v10 && (CFTypeID v11 = CFGetTypeID(v10), v11 == CFBooleanGetTypeID()) && CFEqual(cf1[0], kCFBooleanTrue))
    {
      if (self->_listener == v6)
      {
        v19 = +[VCPMADRemoteActivityClientHandler clientHandlerWithXPCConnection:v8];
        if (v19)
        {
          v20 = +[VCPClientManager sharedManager];
          [v20 addClientHandler:v19];

          [v8 resume];
          BOOL v15 = 1;
          goto LABEL_18;
        }
        if ((int)MediaAnalysisLogLevel() >= 4)
        {
          v12 = VCPLogInstance();
          os_log_type_t v13 = VCPLogToOSLogType[4];
          if (!os_log_type_enabled(v12, v13)) {
            goto LABEL_16;
          }
          *(_WORD *)v21 = 0;
          v14 = "Failed to add client; dropping connection";
          goto LABEL_15;
        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v12 = VCPLogInstance();
        os_log_type_t v13 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v12, v13))
        {
          *(_WORD *)v21 = 0;
          v14 = "Unknown service requested; denying connection";
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v12, v13, v14, v21, 2u);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v12 = VCPLogInstance();
      os_log_type_t v13 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v12, v13))
      {
        *(_WORD *)v21 = 0;
        v14 = "Client not entitled; denying connection";
        goto LABEL_15;
      }
LABEL_16:
    }
    BOOL v15 = 0;
LABEL_18:
    sub_100004484(cf1);
    goto LABEL_24;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v16 = VCPLogInstance();
    os_log_type_t v17 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v16, v17))
    {
      LOWORD(cf1[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Failed to query client entitlements; denying connection",
        (uint8_t *)cf1,
        2u);
    }
  }
  BOOL v15 = 0;
LABEL_24:
  sub_100004484((const void **)&v24);

  return v15;
}

- (int)run
{
  id v3 = objc_alloc((Class)NSXPCListener);
  v4 = +[VCPMADRemoteActivityClientHandler serviceName];
  v5 = (NSXPCListener *)[v3 initWithMachServiceName:v4];
  listener = self->_listener;
  self->_listener = v5;

  [(NSXPCListener *)self->_listener setDelegate:self];
  [(NSXPCListener *)self->_listener resume];
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    id v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v7, v8))
    {
      *(_WORD *)CFTypeRef v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Media Analysis Background Service started", v10, 2u);
    }
  }
  CFRunLoopRun();
  return 0;
}

+ (int)runWithArgc:(int)a3 andArgv:(const char *)a4
{
  if (a3 < 2) {
    goto LABEL_37;
  }
  if (a3 != 2 && (int)MediaAnalysisLogLevel() >= 4)
  {
    v6 = VCPLogInstance();
    os_log_type_t v7 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v6, v7))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Unsupported number of arguments specified (%d); ignoring",
        buf,
        8u);
    }
  }
  if (!strcmp(a4[1], "clamp"))
  {
    *(_OWORD *)buf = (unint64_t)*a4;
    posix_spawnattr_t v25 = 0;
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      CFTypeID v11 = VCPLogInstance();
      os_log_type_t v12 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v11, v12))
      {
        *(_WORD *)SecTaskRef v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Clamping process to utility QoS", v24, 2u);
      }
    }
    if (posix_spawnattr_init(&v25))
    {
      if ((int)MediaAnalysisLogLevel() < 4) {
        goto LABEL_37;
      }
      os_log_type_t v13 = VCPLogInstance();
      os_log_type_t v14 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v13, v14))
      {
        *(_WORD *)SecTaskRef v24 = 0;
        BOOL v15 = "Failed to clamp process to utility QoS (1)";
LABEL_35:
        _os_log_impl((void *)&_mh_execute_header, v13, v14, v15, v24, 2u);
      }
    }
    else if (posix_spawnattr_set_qos_clamp_np())
    {
      if ((int)MediaAnalysisLogLevel() < 4) {
        goto LABEL_37;
      }
      os_log_type_t v13 = VCPLogInstance();
      os_log_type_t v14 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v13, v14))
      {
        *(_WORD *)SecTaskRef v24 = 0;
        BOOL v15 = "Failed to clamp process to utility QoS (2)";
        goto LABEL_35;
      }
    }
    else if (posix_spawnattr_setflags(&v25, 64))
    {
      if ((int)MediaAnalysisLogLevel() < 4) {
        goto LABEL_37;
      }
      os_log_type_t v13 = VCPLogInstance();
      os_log_type_t v14 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v13, v14))
      {
        *(_WORD *)SecTaskRef v24 = 0;
        BOOL v15 = "Failed to clamp process to utility QoS (3)";
        goto LABEL_35;
      }
    }
    else
    {
      BOOL v16 = posix_spawnp(0, *a4, 0, &v25, (char *const *)buf, environ) == 0;
      int v17 = MediaAnalysisLogLevel();
      if (v16)
      {
        if (v17 < 5) {
          goto LABEL_37;
        }
        os_log_type_t v13 = VCPLogInstance();
        os_log_type_t v14 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v13, v14))
        {
          *(_WORD *)SecTaskRef v24 = 0;
          BOOL v15 = "Successfully clamped process to utility QoS";
          goto LABEL_35;
        }
      }
      else
      {
        if (v17 < 4) {
          goto LABEL_37;
        }
        os_log_type_t v13 = VCPLogInstance();
        os_log_type_t v14 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v13, v14))
        {
          *(_WORD *)SecTaskRef v24 = 0;
          BOOL v15 = "Failed to clamp process to utility QoS (4)";
          goto LABEL_35;
        }
      }
    }

    goto LABEL_37;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    os_log_type_t v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v8, v9))
    {
      CFTypeRef v10 = a4[1];
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Unknown argument specified (%s); ignoring", buf, 0xCu);
    }
  }
LABEL_37:
  xpc_transactions_enable();
  signal(15, (void (__cdecl *)(int))1);
  v18 = dispatch_get_global_queue(21, 0);
  v19 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v18);
  dispatch_source_set_event_handler(v19, &stru_10021DCE0);
  dispatch_activate(v19);
  v21 = objc_alloc_init(VCPMADBackgroundService);
  unsigned int v22 = [(VCPMADBackgroundService *)v21 run];

  return v22 != 0;
}

- (void).cxx_destruct
{
}

@end